Return-Path: <linux-arm-msm+bounces-98697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGFhOGLGu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:48:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CF62C8FEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 034E43025F78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0FC375F69;
	Thu, 19 Mar 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fI0V+Dy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gW6Ho4qc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB13750AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913695; cv=none; b=PtwnmYBCdfV9p/FuD2amWmnpOefk5n3eqsiBsVxPg5ZUY0htwrFsyRPFb9MZx2ZWil0eqk1ll6/OGQn91pgc6wmxZQ6uVr8cZUFFWzvnjGLZPt0F5o0vYp0AQFUKIuO6fHgnhOaeK8LDl6Cu2xdaYfsPpHOoxQzthtQyTGdjV/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913695; c=relaxed/simple;
	bh=kS4fJc5ORDfQmCS1Co6/IOO3+J4q9DKDhUB6N1RE7BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LGkP+vQ6lTL2Q1LQxH5OAQIjYtopUVbbaDqvRM2yJfcKfz4scfCE4l7Pna+iz53tvnC8SPlUEe5pm//X52aCgJDEyiwboM0HSEaXovyopXgPBX7OtDxdb+0QFMQfzCGEA8ClzkhKOfZBO64fwCks6C5tMIOmi5wTCXoDRSIB584=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fI0V+Dy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gW6Ho4qc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74HFC3369997
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dqRkQOnkfyUBmHM5Gj1Wk7
	vql3Ejroq46FdDVPB6DJU=; b=fI0V+Dy3iUVCAn17sIkW75XjrkyZtp/67nheXm
	AZQyVsFO3ofHLqJYoU7Hq0rv0pgj/4+hf8hFidefchb4LZ/icJQS7jJTxXpz1F74
	Gf0Rrma9YyjOoFXYPa2zxw6vUNKqaQRCnj8HewMSLuvKXYrN1zv8gI8VsS/rW9Iy
	XuLtD+gvFHurG/yCyJrmUA8pe/whs6v03ohdf86XX1aJ5xnXRUex3LeoXo/wmjgO
	NAEdIXGKGZrBHpzAab+evu5o7sFtdFroFjBQOARqgTusnNEICrVs9/w3WL44F1Jq
	IbMOj9Bef6TKeexnwCpospEx5/1xDpGQUeYgbHa2FRw1cvJA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9jp09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:48:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso12273785ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773913692; x=1774518492; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqRkQOnkfyUBmHM5Gj1Wk7vql3Ejroq46FdDVPB6DJU=;
        b=gW6Ho4qcl2nG5QVTNqsFQtQsRqZw3vh08W/8fzEW+z7/D6b8mtkhJCWCWwZqJiWSEu
         L/HDZS8IWyAHVmYjdhZR38mhZCBzlR+sNQG8Kc0r1Xf9bdcm7vzhUWpTq4FutRbijw98
         Mi4FUes9QyprYy0bMDAFe2bBO2xHxc7M49YqhVBgoxbTg27E4ZbE7TVMMah5l2uLgU8y
         4/TJ15wC/eUH6i9E0IZit0HsJmAklcjdBYHFBkCq+pP5a+2sRsyKVjtFpaLhcI8RelkD
         z7raD1lZ0+w2INAyHUMllUiLEKvH/qqlaOG4+x+nrKpcU5b7jjHfJIQSf41n8yRocvuy
         jBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773913692; x=1774518492;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqRkQOnkfyUBmHM5Gj1Wk7vql3Ejroq46FdDVPB6DJU=;
        b=stpANtZd9fo2ng1w2E2kWDz/BGoZ/6LG3Y9uje0oI98NEDhqxtcJ+BmuD/F3+RON72
         45gTLYUNxFTtNp0Pgz5Do99xTp7CkzXwjWVcOybezPkaF5DSTPl9aCsMk3rjP6WMwJR7
         cGnAnzgZeVISC+vkipaOgwhfNQ116NmwITW6RbpQQVKa/D+8TW7UYGnvhaQNrh5vBvMv
         rLqNuY/oVuif0tkZSKCmZxehmMYdlhyoabvmRWEM5voo2XO91B/yy7XN6v0pIXRDaNlS
         sVtO47aTQ6kgS8EvX22gLmiUATon4IfCjzIwc4EaQgX+FJbnjkoWRfjzSy8XFeuaHutw
         Ho1w==
X-Gm-Message-State: AOJu0YyQSwuSYfbrtCFDE0bskx1JCtFTQLqNdw3JLayd0YywppcSUY/6
	LE7Jx2QjqBq0Ccvrw8zSsreR9Spe82UUiViWn8BtU4MoBDk8IlO3WEKjvs+TKlF9OzaMGGRUi0T
	7vg2xTQVFH+mRHCorZhgXkdoxONsFNIFlf1dLR40k3PDiYYBP1xcM4l1fLUAX6NtW+d7z
X-Gm-Gg: ATEYQzxenbmn8phaN/aeRp0huAE+WRvUHS1MVBMfS/T9vLGID8wODI1a++uo/P1uTDM
	3fMrwLGJ7EMZHRPfKxLYB40Zi6P0ESSAbimlSm2tYyIOOvHB0RMaeTrUoTK6FA6aVMUVYyZSMjq
	l/SqqTsU57nlbeqMIEZ8f2JqogNduHoLPG2YtHeel133jcFLZhq5DQsrX2fDTg+wC/dp0Qe2s7/
	yUNXUVvO9RdB0RRb2+oKLeEs1NarmkJY2mhqxGPluv1AEfEKe6DxnBaTv+b8i0SgbBLlCb3Od+C
	k4pkih6Z0QU0h4eUgp3E8O99ndgRU0SpPVZEV1gf0nXRvngorjJey+ivnxsOPrhO3DLZMXcxo1K
	kTY0QtrlPEGCaNLqW81cgtlG4FciqGoiugKnMkrB42Gr2/ICV8tsiJRkeIqbS/Rnxv0+Uv3Dvp7
	XKUoUK3oLGs7h+/Qp6J7DpIo6Vwx0Bp2Ni/8qiUxHSW7nGkav423m1Aygv
X-Received: by 2002:a17:903:8d0:b0:2b0:5738:9817 with SMTP id d9443c01a7336-2b06e3d2f5amr75086085ad.31.1773913692473;
        Thu, 19 Mar 2026 02:48:12 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2b0:5738:9817 with SMTP id d9443c01a7336-2b06e3d2f5amr75085825ad.31.1773913692001;
        Thu, 19 Mar 2026 02:48:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e63a971sm90445655ad.83.2026.03.19.02.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:48:11 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 15:18:08 +0530
Subject: [PATCH] serial: qcom-geni: drop stray newline format specifier
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-drop_stray_n-v1-1-37fb619538bb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFfGu2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0NL3ZSi/IL44pKixMr4PN3UpBTzxBQjc/M0yxQloJaCotS0zAqwcdG
 xtbUAK0k9gl4AAAA=
X-Change-ID: 20260319-drop_stray_n-ebd7ad277f9d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773913689; l=1197;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=kS4fJc5ORDfQmCS1Co6/IOO3+J4q9DKDhUB6N1RE7BQ=;
 b=cwD/CR2i/S8KWoHRl+j+Sa+TaFj8AYpvO5+5lEjayX4JqhuJ1atDRcSDmECO0lXtbPfqGc2eU
 JPpgdnoG3XwBPl+59dxoA3VcfVlJlsWl5nJTZAjLaz+pYBjoKlDvj3P
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NyBTYWx0ZWRfX0yfCL5Kf85Mg
 xnlFAHoOjTsdP4tO+d7pjc52Gq6jqxyAjJty24iMo1wZb/0OWMTRrE1UE2kpeZ9h/uYDDKyIiQa
 i/ZTUfCuNGMQrnnJLo7AZKgosQmzqxNpaOM+N9WQdF3Ylb2lvgrzn14TbK/F4DNQLoONODg9JWL
 rYtuZEFoT0wTq+02SIVz90WlhNVRDUz9k8SOnIzTkoFYh1y473sBhrF32FHf2UJEieVwoj2peLG
 Duf1vKA9/MZs2Q0gWM9zH71vOQvx34B8J0qblBTkp+CYgNPdG9kxa0S70B7XNgesJnI3y4aDviG
 N0leut7OH5RjTFHrQFPlgUnTeCPvOEBc0xP20tnqaciEqLm9RDAlv9sLu9eOyHBVHNP024TpeEM
 g56oHRWdStpblqMkXbLus2VcVe9LoZZIazCDvtP+EuWIwtWhCWyy/RegGGIjF5JCwk07jfUrhO6
 LJH6+hPvJysmgXNiJvQ==
X-Proofpoint-GUID: -jeNIE92tqjvrzXue6PKOAsBSafxCAuz
X-Proofpoint-ORIG-GUID: -jeNIE92tqjvrzXue6PKOAsBSafxCAuz
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bbc65d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=D4N4v3-LJzNxafR2K_MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-98697-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88CF62C8FEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drop the newline character from the middle of the printk message.
This avoids breaking the message into two lines unnecessarily.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 9854bb2406e3fc830323ebbfdef1e471f00fa416..b365dd5da3cb799c4ec241724310c23d6bf7e16a 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1282,7 +1282,7 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 		return -EINVAL;
 	}
 
-	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n, clk_idx = %u\n",
+	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u, clk_idx = %u\n",
 		baud * sampling_rate, clk_rate, clk_div, clk_idx);
 
 	uport->uartclk = clk_rate;

---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260319-drop_stray_n-ebd7ad277f9d

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


