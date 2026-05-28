Return-Path: <linux-arm-msm+bounces-110056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL/KLVrpF2osVQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:06:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F2E5ED7C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCC263038284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 07:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A436E238150;
	Thu, 28 May 2026 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bgPYNmfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhsT5a43"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5532B27EC7C
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951959; cv=none; b=H74+vTU25d8FhPP2FOEVwGRCt5iIWN/ES4fE4B5B+g33xZHN+wT4FDMfciRew6hKStwWAyYQLi0HcvdUDy4e4mclA5ycKKo2OmSQ4zHXIldx8r7mdoV68O8mXf8KYerRPhPXWlj+BBvzduUq7jpfJeGiVWtOjjKCqtCTl7ViVsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951959; c=relaxed/simple;
	bh=6l8wxJF78Sm1qsTECaxMR9Jxhn223y61PPSh2SXZlS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YyFKJNa/CxClI4YKFzIy3gzs9gEmU+cSdkahYwinImc2HLjVPUl/mEZnCMwkB5wikTBW+8Kqev5Stgu9iinPxO67IQq4vToQzvQ/cAuZLwORgzXiUR6HBHrkJ5+/3RXSyf4VlPoqKOIk+X9R4mw/emGXyHNDpvnJentBohLB3pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bgPYNmfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhsT5a43; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S6gmWB1638433
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 07:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zn6MXtkf9VBJ8MXm0zIEgP
	KH57WoIwNAFOEHdnwNHIc=; b=bgPYNmfQMbjVL09cnXhdpMohLOhH+CCcQ0k/ap
	+1M1nLQVRAxexVFW2mfewS+0zEpvMH8aChUnN1/DmfUhWttXNnnxDvQrrz/Q44gh
	T9hbhMTiEcQJSXIq/5OEnTl4TWrc0Dno3lJI0l1VDndJhN9LrsPXjkWEuyrb+9xP
	e5jqn4jiV3UcZSgRRhnR3hqE/AaWc3VgWO6jbsjxc8BRKx+XxbEl4ah9RC07A+qj
	YuJIzrYrvQkEEAzggRQugkYQ5CUOS+LG+1NFn7KQp0O+8d+sDO06tXcWMcaBtG2w
	Yc/Oh+UOLRpl/s50ToAFo3LmQFfMTvfnONENljb07Ap2P1uQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynhqar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 07:05:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-835423c69ffso6634511b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779951957; x=1780556757; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn6MXtkf9VBJ8MXm0zIEgPKH57WoIwNAFOEHdnwNHIc=;
        b=BhsT5a43gUVLEYbnN1XcHr1BP3HdyAQU59u/yF0GosDvh8U7uMTRj+HtO0vOk7f7Iw
         VWb8ZViuQ2bf1hr2FIq68mnvyBV5JTGj3YOsKLxGtC+sRuBANzoMpV9wI9xr9M7lJyLA
         9Ua/oABJVBFaR1w8jqGXVMOxHjOA9NW/O6AGoZXzP7aLFbH6ql2fX6lDXEW1Vkxnc7WR
         VrxiiyfeVC3Nv/lApBDYQZ/bVKrbUgSDxKgkebq6j/l1xw1Eg7C+uQjX8YZNLomyhEqw
         MkCy1acT4d8NPCGEjQj0aUuN+YFneV769nufYWEu5S4sH3Qj6eoK2p6Nvdae+NcXaNix
         tXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951957; x=1780556757;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zn6MXtkf9VBJ8MXm0zIEgPKH57WoIwNAFOEHdnwNHIc=;
        b=jvIRqXQguUfRhX85FXOmzLTb9MmyaEoEvTTyLrl535fAMu6h7QkHKJhOzcbV0N8oHO
         nlpeXSCoz+9uMLYcTF0qHJVfdS1M6kmsSQhByi56jJ7gYMti+HxkPa4KENC/NxiIHAkR
         S17X0IcJNkW/LNAmFKXO8WFCvcJZc0/RVha5X2JfEw4Ed2EplAxUVzPqJ5WkiSWrXJZH
         ULENhfe+g4L82niNS5uAAFgdx2xDY1H95j3a+VIs5vh96znIiW3Wfh17VHCPZ16SkJi4
         ATwnIM7cbGYUJbX8kR/RJzmkRDVKskRC5z3r4HljR2rlOijkv/Duk7gbqg+fQMKFMjaX
         094w==
X-Gm-Message-State: AOJu0Yyl+m8Vwh4oowG9zU4JG3fCSSAIRcLsJG4rH/N1FhcnXpNu0kG5
	5byMPnCtnBbH2lDKRX/+wYyf8WTAazE9unoDLD4lUT+jC9LIR8tRP2BLSUY+7mrR5nM+zBs9rGJ
	FkszDe2DdH3oXdlR+Zo6FZNDs0TEFYsV7bw5QR/ow9HdoD6bNTWl3gC6sU1yfinhnLoul
X-Gm-Gg: Acq92OFj2ZvVzg/BqMuP0MW003ysK669ysZIc/pgucvbf5Mnq9Bsg4eGGkpZqD/MmlK
	i+iL+OiSjkJlAmj/1VHOYBNqCIMEXoyfBnQdottcx4aXZQ0uXV2TvCnirZ54Z2MQ9JuGNORTVHd
	tjdvE9BgCHmLsnJm/oY7qqCuqQvvLZjBc9rkRa72k+8YlmQf23KdZDOvranWDHOePJb00UolY33
	r6drY/Y2YARrTuIFHNR2ybfnJhQpbzLDJPGhWmNczchSBlbLUZadp+hYJwtjrQuM6wMtmGBpr+q
	Wbh0Cb5rqLxnuULhSR9gS7PVY3zSKR0SPHhw1sfqMlLoSnZBRzrJuqAF+n4YN0ddC3u2aIZMGHs
	ic3kTEn8WOBNzsdgNgqMFUPWBVmdHGYODuCDV6Q0rGB0l8sx4nDtBLDMe8u1iNVHpV/NN
X-Received: by 2002:a05:6a00:14c8:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-8415f32d5ffmr23009166b3a.15.1779951956713;
        Thu, 28 May 2026 00:05:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c8:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-8415f32d5ffmr23009126b3a.15.1779951956049;
        Thu, 28 May 2026 00:05:56 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6ed19c2sm3992512b3a.25.2026.05.28.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:05:55 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:35:43 +0530
Subject: [PATCH v1] serial: qcom_geni: Fix RX DMA stall when
 SE_DMA_RX_LEN_IN is zero
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-serial-rx-0-byte-fix-v1-1-dc4e876c7368@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEbpF2oC/yWMQQqDMBREryKz7ocYqKa9SulC46i/FFsSFYt4d
 2NdvsfMWxEZlBH3bEXgrFE/Q4L8ksH31dBRtEkMa2xhrtbJsa/eEhYxUv9GSquL0N8a43zL0hH
 p+g1M+p99YM7xPF2c6hf9ePSwbTuPFbeTfAAAAA==
X-Change-ID: 20260528-serial-rx-0-byte-fix-ec9d08cfe78e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779951953; l=1800;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=6l8wxJF78Sm1qsTECaxMR9Jxhn223y61PPSh2SXZlS0=;
 b=+CUlkAPdkKpET1LGpF5QcG9RbMucMjNy+72nXZrNy/joe/1WCcEiyd+WIKFK/dhG8m1LZO3gg
 DHChh8zKlLeBWOrV6AqXRlusZMnA5WxJtbt3mC0ryM/paua7rVKMIip
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA2OCBTYWx0ZWRfX1zbkZTdxhNpY
 V/Phunylo+j1RvV/jpbamijlteU8rnbl8JwSe8u6FIKiVa3NrtdINDqZj43cAzinzM0+bmy+yuL
 iM5piF36DjBYw59wHLt++kldFqpxwfwEjDzlgSbIk8RSjz+1Rkq0FIz8422ZKNEEgJdNRXOaXfU
 Ba67HHgZ3ata1GvYBcMd2dqzV/cXGxYRkgG2MYRQ4gKdeCaov82PCCgB+iHziA/PHTARzXFn++6
 QvMS5sgqyiiKHP9X8fTmPcB0NWbfJ81T7JA0zCQ93CNkSDmkU7TUzS2XAH1gi3AU9SkX4Sn15lc
 8av15cijssAAnn6Ddhpy/bhsA2QlemXva0GLzn1+Q0qWMqIPJ00VljAV2kxq3SUVdnaf52auPxl
 /luIqvw091PebGr92RbJqHs1WRyEYPeci39pw8Vjv4tOnf/6wfl2aSz5zKEwNwHhgKLjQImphqK
 +sbq3cPzmxZLnWLAIPg==
X-Proofpoint-ORIG-GUID: S9KwvjYRYnZ-nyhV8CJ3ybLUEmeztWlG
X-Proofpoint-GUID: S9KwvjYRYnZ-nyhV8CJ3ybLUEmeztWlG
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a17e955 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=e3_-XpViw8z6FsUMn4gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110056-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11F2E5ED7C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In qcom_geni_serial_handle_rx_dma(), geni_se_rx_dma_unprep() clears
port->rx_dma_addr before SE_DMA_RX_LEN_IN is read. If the register is zero,
for example when the RX stale counter fires on an idle line, the handler
returns without calling geni_se_rx_dma_prep().

The next RX DMA interrupt then hits the !port->rx_dma_addr guard and
returns immediately, so the RX DMA buffer is never rearmed and later input
is lost.

Keep the handler on the rearm path when rx_in is zero. Warn about the
unexpected zero-length DMA completion, skip received-data handling, and
always call geni_se_rx_dma_prep().

Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for serial engine DMA")
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index d81b539cff7f..7ead87b4eb65 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -905,12 +905,9 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 	port->rx_dma_addr = 0;
 
 	rx_in = readl(uport->membase + SE_DMA_RX_LEN_IN);
-	if (!rx_in) {
-		dev_warn(uport->dev, "serial engine reports 0 RX bytes in!\n");
-		return;
-	}
-
-	if (!drop)
+	if (!rx_in)
+		dev_warn_ratelimited(uport->dev, "serial engine reports 0 RX bytes in!\n");
+	else if (!drop)
 		handle_rx_uart(uport, rx_in);
 
 	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-serial-rx-0-byte-fix-ec9d08cfe78e

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


