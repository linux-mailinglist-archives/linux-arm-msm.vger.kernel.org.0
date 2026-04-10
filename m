Return-Path: <linux-arm-msm+bounces-102728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAaoDwRF2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:44:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A68823DB8C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7438F304625D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAA33E559B;
	Fri, 10 Apr 2026 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwm/+Nhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MilxVCa4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6997C3E5EC0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846582; cv=none; b=HMlJsTly8L+kQAANEVdP1FMEzcirKpz4tWfhMa0iPoU2d2+KnFZfPGywcZzV8xrfTWDLRdLqM3wVjvhiHYDrnlhVIQxWy9e6x4r82/jHl2wOnwL+vPn2F0FS8kasWKESsim27vIm3mm1bDZAj6JuuqzFzlGvZU28d/VOf09vmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846582; c=relaxed/simple;
	bh=Cw78Fvu1F5ws7aOB3MvbyYaRExmSgGoqoG6EoMaJ9kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHXlb3lBHAAcW5ZXERzYiQd0hb/J1NaxNwq5rdEhglaENaePkSbnmMGRsfIdlKGzDgxRtADC8YDi++2O/ewA0WwnQTcsV4vgvQpADtACOQz0SsYxLp8FcHuxPaAwrUGTuIaHF+GS7mWTANXBtZCkQkrdSLXr0aSNM/JLfC8Rpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwm/+Nhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MilxVCa4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AI4G172698273
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=issG4w+R9Zk
	qMbv1viAn5kb1NSiShYqlNDRgye4/Oxw=; b=hwm/+Nhh/fkxlKH7p2DlR7qFY5q
	ifMKvSuuUn3vZa1eBoeGhQDN7KLFBW3rkJUUYhbLjCUFcUnlMKP02jwLmJSX+QjO
	rDExbfSOZVpMfwYpkSGpWfqzUDVUpoqx048QolMRY8296qQs0RytNPPX9Qm4AxhH
	h7+J1iSztnHUj2JkngizqqDmkMXdVn0vijvdj7jIG3zbLh0wjyD+FC7+CnMbCIh6
	flk3RYe6ORa31ssPkSQxc8bEKkqwPyI50xWNMhWTTH9lXjOWVqAhYjw9F5nbetA9
	mtoGBQfwtOlznqTs/ugQPCkdJxPjpVaJvLqWoKVTfGi/UjLczGB1z3+/XeA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9v9ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so1357684a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846579; x=1776451379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=issG4w+R9ZkqMbv1viAn5kb1NSiShYqlNDRgye4/Oxw=;
        b=MilxVCa4Yr//IBcKPk3NgZ3hwPxNU+Dot8mErfrGY8n5oXWykSCwQsm8ohUgNdgdi/
         PurX2C63k2Xrvh4x32905+1fonrLF4XDwaOYzMZHnxmkgAO1wqHiKLgSTIlv7dfZv6Te
         epKManILeX2ot4RJPk8JUo5jya9ZJcb09uFysgpIM86dGMDNdq1RGKXjGD9Bmnb3P4hz
         fCgVMmf9XUNU8uc0e2yWb7pjoQ7Po98sIyfV6MbZatqKNwz9U6LBG3+cJhHpkibtvj0C
         4wnCIHWwe5Z9IBP8Dv6KfDHUNnXQej5PZw5mASGlkLawCUBjro7iLInp+jwyVNvYFqGN
         PAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846579; x=1776451379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=issG4w+R9ZkqMbv1viAn5kb1NSiShYqlNDRgye4/Oxw=;
        b=bmKBHt6nrkr1jdF3+U4QCgmBQVDlWz1v7kgpdTvWuo/3q1SaN/xa/dScG93dw7hRZ9
         9U0w/49UaLiLKgNcDcMNh+zXd2q49lKdGwsE8S1jubNuAKwaXhwQ9APHjC2XPBpObjqT
         NXqxIjm6aKDT0+XOYTKcJc1Bk2SpxWObdbwBU0RW2MLS0MKEbsKmuzyzVQgdLsIoB7RW
         g3BJqxBydfAERGK9lfXrmssK3BoGANTev5eHfipR2o5bwaYjwymBDwjsw6oCgCJ3oXiz
         bE24Rwgy75UoJ+4cj+rYQHdRJm6+DCwZ1AEoj+PLKwQCfheWIshDWN4mnZ4LwnQfp7t+
         K4mA==
X-Forwarded-Encrypted: i=1; AJvYcCX052W2AxPpRR+2+RWudROPqjD6NrBfyX3E3bSFiu0rWc3Qe7HomebhQvFkkSd1zcBF2JGQ/xe/CpUbcmud@vger.kernel.org
X-Gm-Message-State: AOJu0YynmWOtpi5fyN66Ccfs0Q8auQk/x8JW1WxqiwVooPa77T/ahCrr
	XQi8M6+ouTRl82kfEQ2XGKs3Mfh+acypk8K4EPbZ/8zPYT0OozI5nX9ttjh3o++F/RF0H3JlOTv
	8PyB59yMhxykmVbIIoZkYw8EV6fGTBPEOMTxQgeQgGDVYw2euTTbZ7xfxJl7Ix+9pCYxT
X-Gm-Gg: AeBDiev2aaR32mPlcbiM0GWueiul1DQW7N8xfklkbaSfkVsRA2TYpUQNwjzCnREbho+
	fss1A2W0Zxy0CMUgYX3OErYM0GNlKN6cP/L89jKDxOoLj4PIU0dW0a2pNs5M1tHRmVaOtf0wOlE
	bRUHxDMKz5CngW6AIyhdK+11Upx3DKDy/gFjvEfa6dfdFuhU7BI0+u/KFltQkhxgCIBEr4LvGCU
	pm+3TNAJBujDHgW5GkW6qa799s3rc8VBywiIkRpmyU8P3C/ks26F6mLeIe+i6OoFFbPOBXhcvfX
	oe82nS1ystIwSjj/kJG5TS1lkcIexrbc9u+WZa/L9oX8QVfb8X/WtP+5Nrnk8j0skfS/AOucCTM
	XU2tJeMe0Edv/2Dm/8pUJuD/owte/je52FIR9M8Mm4GPRI2Rj
X-Received: by 2002:a05:6a00:4c0b:b0:82f:f4b:637 with SMTP id d2e1a72fcca58-82f0f4b0b7cmr3403794b3a.18.1775846579100;
        Fri, 10 Apr 2026 11:42:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0b:b0:82f:f4b:637 with SMTP id d2e1a72fcca58-82f0f4b0b7cmr3403767b3a.18.1775846578396;
        Fri, 10 Apr 2026 11:42:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 14/35] arm64: dts: qcom: sm8250: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:51 +0530
Message-ID: <20260410184124.1068210-15-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX0E0VZTgkUxrq
 rItUbA5J2svOmtB/dmlxZgp5kRcnEFNLk0T4Wf3kQ+Vuw+TMGKIRdQeYQxnJN2mnwlkiUx435kR
 S/NLjmyluzx4o8i0Us+8Je5DRDhUbqGex155HIf2r26vJq0JRASUbmCmChO1fy/2IVFdTfjW7vX
 Jeni8+P6GzBsv/f/c15RhcbiF2h604z+LS5UB0p1bRWSoxypdO9hOxBRUAo6hmatTs9kXn/UFfz
 93roq64m47mPhOX+DCYwd0RWtn8u74PzYRC5mCtTfTwNedN9/11l84KrzdLZ0jX3CtTz2IUNOh8
 PiBLl2K14GxMvGCmQzSPR/Lph3dsW9k7LVd5H4e5rVmu0V/3EBEEPDg39a++pdmX34oPPc/toDg
 wucxWG+UTbDQ5/lRlWBKnxJbVebnp5oASDZyIBuhEhfGQ4hP2PTwWzIbbjDQZwZWtkrh6obAvR4
 WrNnwBwJlNAG5oHkBQA==
X-Proofpoint-ORIG-GUID: le32UjBpSAKI81rr6eBxSwzWGp2coRkp
X-Proofpoint-GUID: le32UjBpSAKI81rr6eBxSwzWGp2coRkp
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d944b4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=CNeQ3Hq6_2vApw1mA3IA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102728-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A68823DB8C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c7dffa440074..e6dfaf47fa41 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5048,7 +5048,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8250-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 716 12>;
 			#interrupt-cells = <2>;
-- 
2.53.0


