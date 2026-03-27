Return-Path: <linux-arm-msm+bounces-100206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKLOIDxBxmlRIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:35:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C463341145
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 668FE308F5E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1154C3890F2;
	Fri, 27 Mar 2026 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9jnQ5WC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HoPcxhyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC023D0924
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600282; cv=none; b=ojzp0rQntg7uDRgG9tIz3dIZe2VM+Jo2ZG5MGisnpqgxzcS/24y+S7K4thGr2liA+z4Yh3bQq3aAisznPayq1gjAJUl9JgMPcuWZ3ugwlXypi3aM/6N0XZOoddr/BswpTpt00QqrpqkxVbPr7aq8sjSZzIvM1jFDdiilThDU2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600282; c=relaxed/simple;
	bh=D+Jzq6Hk3anOBrzgNu5fk936OVVasAzMl4XnCq4SiEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k0Ms/7he1/mOimhqQ/j+DNbZP6VsHGKeGA/OdtMxBBEqSHhRXhuXTknYA1Md5/pdJYq46SDPyEzHZSqykUuZ9aaI5N8tr0Jl0KDqZYrpNxQO5Wc+GIPk8QVgU1bCmdA5stQMbznpURNGhBdx2NbVTjC7rS3JRzSTUeZw6Ur1qps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9jnQ5WC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HoPcxhyo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6ve0Y2378942
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rYEIaaerAbK
	eFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=; b=J9jnQ5WCEl9mTRNEOxADy/uwTqj
	66wP5jD/yh2LA97ybP6qP3BIaUOd/CFwE26zJnWXa70U0x3knrqPbDNuqQWR57+f
	thx9jAtDTQGlVlb988DW6JraYN5oFNtrh7CHs2Q4FuBO//RCMLNGUYalPAH58Sez
	iPr2AE5ZgiUfDfnz1UNk/s8wWdndG7ig7p4q0GFxyyyH7tpYo+U6YQTkBlu/Ze5r
	qmNHNPFI6+07CC7g7kC2qDrcGEGrgyVR+Mr8ZTs373sdK3rIErNII7Ra7FPib61g
	Awr3hGkMMAXnGHbTJW3cLKaG/7UksS5lko8bg8VByZYHZ5JnqaKp3jHL/pQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx10a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:31:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so7072352a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774600278; x=1775205078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYEIaaerAbKeFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=;
        b=HoPcxhyovL3H+1y0ejvj3secqSLsdBKx3uYwuJpLWAHZKMMewVB6L7hA91nyvU4ktl
         oPuv2MPjec1azY4WVOdCGG+EeGJuwYO4r1kY75VJYUJq9m7CMEd6gL+ZLLYG7FdbkzEC
         16xuRleoPYv+R4MINqBWhX7e9ff/ZDo8wu6BW/TlJCWd4tk0z0jt5ct0gtYW06QXVWTM
         8LSylJAhwhoIY7N+rbHvvUq40UDmONKouEnYpqW38CFtDxn5bl4onTa/z0VNh9YKt/C7
         O3EAQioy+WvqN6dqZIILiNHOO+eTRLvX4MeFEbqTo8LprHle5bxfxzCBgNQT6c9Ir1iW
         19uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600278; x=1775205078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rYEIaaerAbKeFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=;
        b=A+oGw6p0QR383cJR06bdc9H06dxV74FDt5KYo1PQSfRULMg18tak+vQ3JIgm9gHYNY
         qPFI0vq9UANMPyW+IOLRrTB3/xgKyjbqBuO/wUJ4+xgoh1FWUiGrK9HEJPQt7Nm2FJt+
         OF8t08plM0xYxTCPeONKo832lIUZbONyFkA3eSXF6SkZfV99GYMwuHX7yGkDwrSXNCZ5
         mFtWVm5DRFkL1KUUJeYstXr2lUCYd/vdX6zpHnlvwvbYI05rAVR61zWvOc6kJ0u5/NOz
         zsnGi/DG9AOS4qbISI5StF6EzgoA6t+bUhxNxIJ2OrrDxw7cHCDJTfvYF6LNSfBt96cN
         HwYg==
X-Forwarded-Encrypted: i=1; AJvYcCWi7FhW6Ex1R/5xtxr2eUaFHg20Pw30YDdpLVL2gbzzcXnx80v4GX0teNUd6wgtax3hskVWKBQ3MHIzhjFZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ByrOE4KBW2kps2oG+peA1/rqUIfzX3/2MXr+5VKYzld74G5+
	dgmBIQDgr/Qy2LTc+r6WE5Gh6I29btGikDtd5Wr5zjjZxKLq5ui1xrBZpRqRpWPkrxOLWkhKEqa
	POhw1UFl5d8Eo0YSLUTXWYeExCvv1O4ttYZB3ciCoWpQi+d56gXoXf1GwjYVlTyC+t0Xo
X-Gm-Gg: ATEYQzzJY/f4P9GePUf3nteys49VSb+z+1XbdmwTmx+LBsYSRg2HiivwaVXP01szRuZ
	vUe2NI/prGQmAzeqsXnClND8ajS3WPQuZcvAUEfw+PKAHkUU5vmRHhp8jv2uxz2v27H8Jnk613y
	MfNY1/ndf7Eyr5DAar4V6P1QTnsmYNNgxLlH+d9Odz6uFKAHRmRJlqmVyO7s8l0upgFDQEdiPuT
	0Mazy7lwcKUp5Su9tWlXJtPWn6p00NVE4Unjxjf8AVQkr+O8okB/Lsir0DEycpmbz01+A5vRffr
	ktwak5yaWet1H405LangHQOiqcPep0BuS3F+rovkoW4w13zKjQjAzhJdOFD7p72bSZfFQGG6A0V
	GssMArcIgfRxvYFtGMxNPZ2RvUPc0zdckHeOmb5pK7Zq5GUFd0ATM/4jKy0Q=
X-Received: by 2002:a17:90b:3c09:b0:35b:ea35:c3ce with SMTP id 98e67ed59e1d1-35c300fae56mr1675034a91.27.1774600277809;
        Fri, 27 Mar 2026 01:31:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3c09:b0:35b:ea35:c3ce with SMTP id 98e67ed59e1d1-35c300fae56mr1675006a91.27.1774600277311;
        Fri, 27 Mar 2026 01:31:17 -0700 (PDT)
Received: from robotics-lnxbld008.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm56234905ad.0.2026.03.27.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:17 -0700 (PDT)
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board
Date: Fri, 27 Mar 2026 16:31:01 +0800
Message-Id: <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c64056 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6NDkWPVDNjMa_x_Yup0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: QsZV7B6dkhj6-PJw_PJv9LEJdb7Rswyq
X-Proofpoint-ORIG-GUID: QsZV7B6dkhj6-PJw_PJv9LEJdb7Rswyq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfXx4U91pKwINMD
 A18Ft8D7sMynOeCRxRwhnKwHrPR+Z63nV/35GkaXR8Eur/uhBDkhdzehAT/gmOp2PHeEoicRPYk
 4ZgvZMBDSVvkcwtmKd1sqhlnOD5DdodTROga+LlE8mQIbOJsJ4qIiX+hGwJRpIsvCZpjLBhqBPo
 IVSGKxq2pWUt4epNKfx6eZmi69+TSM7rUxKpV6yy0gDb6f3lq0Igqwz/LQvi8Ws0kl6mM982qFe
 EiNp94ab1rLcEW09zkNgvMYMxTVd0B2d17DrsQhiluUfXDF787sa/5MMsWHtTRhyGRnpTaVSeAE
 UWUKW2ddzk4eB+Iq0tyq/P1h/0SHvWMGiOkwZ9YCQ6ZVR4blzVLC/c6znV5lOpSFftp37EQqn8U
 zmUnYZKYyXQjd13H3hGo0wWOcCuruKSY9kMHaH3195hOTuMKWN5/I5Pl/yOipgtprATTkyAGnS1
 UEK5SqoiK3HvISewGZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270062
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100206-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[canfeng.zhuang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C463341145
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The monaco-evk mezzanine connector supports a robot expansion board that
requires UART6, which is currently disabled. This prevents the expansion
board from exchanging data and control commands.

Enable UART6 and assign the serial2 alias to provide stable device
enumeration for the expansion board.

Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 565418b86b2a..0b26861eac02 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial2 = &uart6;
 	};
 
 	chosen {
@@ -572,6 +573,10 @@ qup_i2c15_default: qup-i2c15-state {
 	};
 };
 
+&uart6 {
+	status = "okay";
+};
+
 &uart7 {
 	status = "okay";
 };
-- 
2.34.1


