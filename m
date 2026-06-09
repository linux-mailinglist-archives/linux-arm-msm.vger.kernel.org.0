Return-Path: <linux-arm-msm+bounces-112238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hmzTKns+KGqcAwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:25:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054C662557
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:25:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="B/x2hZOe";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RPXNtWDe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112238-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112238-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD14B3098B64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA95E3B19B7;
	Tue,  9 Jun 2026 16:16:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70153B7B64
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:16:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021788; cv=none; b=S8uFSyKlICpDRy6muWIC3MFN6RpWgGdNB50N8SP+ZYUUBCVdufoivu+MrcjvmFyyPhpq5/d/bOvmphVXe1ChEUI+01v597O6tLeJLxZC6V5v0EIzsT7oQsKtb/EYVt8Dn8GKdm2y9CCwSQFjyj2l0ft71wwen0mWKVDz3+ZLz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021788; c=relaxed/simple;
	bh=Dms3oFfkwwCUvW1pgTeaIKyaFSWkvKBzlYP5ROf3NgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgC3F1Dc1/suS8/3kxcc7TfL/Uof7gnJ64qNj6qHeVb5kxsFu8eRfUHjIaB3UB16Wji850/is9YsyoskmloikWuradGXoOY+ULMDbBb/MB1BUnCjV9r5RdQ20/AZ630BXGvqJj1TmS45r+zamiFxlTmVrxCpIoS9lNGj4pHn7X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/x2hZOe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPXNtWDe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClcrE2183230
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 16:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fc6uSulZBZLFTHpWc7r5w0kM2tZX1sxWvLR6X7gpz3w=; b=B/x2hZOefKXFv1rc
	/LUIjrlqdi9dzjvrTKi/wcsYRq7uskuyeR/MbrAoD6HKq+y12J4WZDl2QRp8NXHa
	LuI7rXIAFj1CE/uN3fGPLxYw6J+0MLy1mGf8Uh27Um6olSiIODIM2qSFZmPd/DM7
	OdVSpsxtysHL+EqVwjKCNm+4BxV/MzKQBLJv78oPy3wUtIRS1z2oXTo3y3yx0WPy
	2beqc0GKgHK409NeqayH71bNs7Vf3KtFWePoEn3KSiisEI2LCm1V3oCyh9l6S7kt
	RsoxgPydYGwIEZh0seFzIEqBrVUIVhSkYRx/VlhRkNXY7cYxkRzXc9N+M8tY64Eo
	XAPacw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenraem1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 16:16:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so4363092a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781021786; x=1781626586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fc6uSulZBZLFTHpWc7r5w0kM2tZX1sxWvLR6X7gpz3w=;
        b=RPXNtWDe/bokL6XiDSRLpTbUGqwNFiBKcSHqKDpvykCFwy2mLrPZUoh5qWA9pB6u+F
         onKMdn40hIJQ1gjK9cC+Dj9vzSWQBSsWeq9lTfr1+i8ccMbtleLJKUfXurHlF99/ZJNp
         H6SpBrFT7n8MxNRs3aamBKzEHR/QLrnFSOX9KEA9RQbCau45lo5kqLQTLxy74nBmpSD1
         m4RdaRrvdeon3tDo5fhFClHvqqX2juNb61pfLXOWWiNDYWTOvYKDrNuu8sSmfIK5k/vO
         MXTmy/xs3BeTXneQfu4J4sf4qsHqmiyZG2E1lqzArRft3e0nU6wyOOT/weKPj1DuupCK
         US3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021786; x=1781626586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fc6uSulZBZLFTHpWc7r5w0kM2tZX1sxWvLR6X7gpz3w=;
        b=FPvO6kyHKWKNLjs8V5GVFn4a1ZPmrGFHV9dX/KqohLm0iZv7kRJJSsb8xoq0OoXwUV
         4mSy1N89oiVj8v5E+mDspvljeb4aiiNVgSn+CyrhPlf/lrZ2Q9rszPPWQMjLTC2Xg+Hd
         NmnZAX+XH7xh7NworioDamInsEqCQx2qUB5hNdqE2aFzI5dEH91Mz1tCYZ6rMaGwlU8L
         nI2uQB1n+z5b1rdzrLfhYNSgR/rzdiIVHVnoAKK+qD+utHtlQq6mhbqh505saE3OwKnB
         hQkBOR1tKSYkpWRJuOpIq8zlDMFl50qvnEvnWBmyFnGUV+4+keetmfSGQqt0xnbVfugD
         sfYA==
X-Gm-Message-State: AOJu0YwrS247nI7T3yof04g+WJcD55FX8N+doae33cu15sRSCXB1n8di
	W7aa4QmUL1n1SQ0xVzDPpFLhBp1Eml+2Ac/T+ZOtGIUd8VkX9756bBKpcdcobricQ1IGvno+Liy
	uGK0HkibcwIhDOMGxMkdmSFp1XZ+FhboMac0AI9iHXuUTrpJs+yK5dufAOeBf7kI6KK98
X-Gm-Gg: Acq92OHPJ2C0+3WwaG008tHq3Qsn7QrcI3+1YZW2BEUE/i4LQ/WQYFLG4lsl4F9LlLT
	sASMlBEUKlBvogdsj6yi/vrV3ajI1yU+GfE+SnMrkODluJPccbL/Lw5RJmStRQ8IGiohFV94EIf
	Xunbh6b36y7oQHZ55+XfvlRwj87rdRtHwAk3yiL8NfvaMvRDuxRnjbkvLQJbfslpo7QRwdnux8c
	uedlhf41+ntQkuZAlfSmAiAoJth3bwHH/i5T29/vkeDyMPvmyZJt8MA0VGy/6eoSTBUZv1Pica/
	3pX/u0AinWw0dGq0R/xakN0iiqIPfXb4tl0BrQWAFKz49QhrtEm5HP/lxOjnOBJ8cu7Jo1ldmHd
	EG2Jd1Rv0/Orm7LAxzdr2cPRoNa4Cauy0MQpWRu15RCUGq27abxrEW5BwzKrhDXeqvIs=
X-Received: by 2002:a17:90b:53cf:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-370ee82fa47mr22345746a91.5.1781021786467;
        Tue, 09 Jun 2026 09:16:26 -0700 (PDT)
X-Received: by 2002:a17:90b:53cf:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-370ee82fa47mr22345719a91.5.1781021786053;
        Tue, 09 Jun 2026 09:16:26 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e52b0sm20391897a91.15.2026.06.09.09.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:16:25 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 21:45:42 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-shikra_vpu-v1-3-3a32bb38b080@oss.qualcomm.com>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
In-Reply-To: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781021767; l=773;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Dms3oFfkwwCUvW1pgTeaIKyaFSWkvKBzlYP5ROf3NgI=;
 b=oEY5P7A39zA/a0rBeDSeYyFMhObLJdY2k9i/micQXT8JTfXSmGpcLaANAbwXQudiIf+lkLpJy
 3CZqTlYjxhhBppVzSHpQVHwFGPRxtocRBMLTBkIuYd00cHRlLYuqMEf
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: jaFb8x01UsL5JeEcA8QsBNJV-ebfNOPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NCBTYWx0ZWRfX4c5E7eCbm8iQ
 cbPrmuRLf79ixGUdWL7sQC8FtSR9SeuqaU8Tr6+wjCoi7SU1G1ZYIqV6KibM/N9ZzjlHwM7E7RQ
 IYZDIIerMK6svJVH+UByUrcO4hsGaaKJGvr5K9UY+MgoEB2XnR/MA2YMY73Ef2DEqIHzvS3QmzS
 u0OLtE/V+zXYSA17kKj+O16op+Gw9JM4g4FEFKIUFB3EpFHqKojpNVB49sJkJfugzsC0rY160DT
 rrhihWX46vsbK38l2gMM9b8nRhfuhlKEA2Vlr6LCPtwzCJpbecLdFfU7fF5q1cn+kdl3vv6KZkc
 dq4OXVYFD2CEyukiTaWNrh0+sW/GpNTvZmCjDX+3bKkEiB6LvjLG0Iaachry1BNI4vl1cXf7VQg
 JyZhIKdzgnXPfiKpV1Q8BG4S9q3pdh4IwLm79hoRI8br1xynjSIYoTWSsH1/EIdsYwU10DVqlFq
 0GXGaRCmmEHgz7sm5CQ==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a283c5b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NuweNcoEZB2a6lpzYx0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: jaFb8x01UsL5JeEcA8QsBNJV-ebfNOPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112238-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5054C662557

Enable video en/decoder on the Shikra EVK board.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index d0c48bad704c61d17309753ba2a97e89bbfe083f..e2a3131594f0410931122657b12c8a6e70b435f0 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+&iris {
+	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.34.1


