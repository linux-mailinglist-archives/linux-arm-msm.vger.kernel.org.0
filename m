Return-Path: <linux-arm-msm+bounces-112583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f8hfN+9CKmpzlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7C66E655
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MemERzn+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XsX7eaJ0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112583-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112583-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4333431F6149
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969BB35E952;
	Thu, 11 Jun 2026 04:59:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B477D369219
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153972; cv=none; b=OYpUg8jc3Hui2BhqAcfduSjv/H5cqQp+tQtG+jNVS0mbdnkS7T2CeuE6H3Kzmyfi8ykJvIlOXKwWGDoxKKX2+WCMPeLI7c6umnlnKwc006zl+M1N8CZUif3WzXiIdINKK0n4jyTM1Abk91Bai3GkzCDNz4Mj0ZJgYWYKxfc4HJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153972; c=relaxed/simple;
	bh=39Sa4FRbA1XPh56vrPZ233l8fBb+GbeXoYXxNG9G+R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lf29CHe+zpkIlp8HEl+vADaCKvNUihg4pMgZQXPVzXGrDw+C7yAuKU47piRpcnXZ8Tox4r9Kyx0hIRHfTRFzFM0y+RRNLv59jDReC4F8lN8XNi2NOTneCDAP8jnbRdYa9zLDIdMVdusBbLfAiL+9bSIIn5NTSJjSA4iG6+Riqns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MemERzn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsX7eaJ0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nm4w3092284
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=; b=MemERzn+e2m90AOV
	f5zUGS7br+qt54lMkIyeA2Yc+IiFS1Ygf2GPV88lunZKN+LgXIiiycB7kNl5SdVq
	3Fj4MtQpuAzWxkh0PwNG29QlsnNORDeiCvjL/Uiv6YVMS+NP6oqLRTHxSZCN/khP
	OQjjC95yn2H+Fdawh4mstM3xcEXSJRzosYbb40wa1/FTYG+3Q91a7tGDOoGKxx30
	fALCXUrH7aAOvj7YWnhN0+6sxqocRgSAz/99ofCsSxFkXgxHmkVhDM5jpJVd7a5L
	qxftL2ntycdFMD+Hx3EN6T7PsWjnJjKcYgm3CdrvI+/10nMo2WOkrMx3cjRmXZ2X
	ZhGi8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9mgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso12270585ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153958; x=1781758758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=;
        b=XsX7eaJ0Zq9C+iOVZcjq/wt4QcAq16hs4CqKi5IGFlO9nPSmfIifHb3cN9GEYSpWVo
         PtVUzRz8A8nBVsg/NPor3jtdSLWEMREgYmaKekOytVMZ06r2Hpb7jahW8mfhPE5tA28w
         UL63nsTQWiDaGxMelJekq3VmYj+D36MtRDmxQBzFUwJTuvkdJFoH0ls4cXnuGo1NensA
         6KYhamrjy37bCC8JRgT1jsYZFRtsOJIH5ZQI7sKDpdy67Dz48aAfJaj+/XP9BkiQd2ly
         vS/R5ZYtXYpcfGqks/ko8Alf64NxoAZSuRIvTdC3ESZYvCoDANrcLCQNknwQwcGwEkEW
         OXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153958; x=1781758758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uKxCvumCkaRFL/8oxTufBn5fDWZVIi+dKwaTyeQSE8A=;
        b=pXpAcoVdhXh9onvJGs+fbN9TxuMjfwicNm1ocqqH/tEvabXrpffugv8N16WKxTz8JV
         4OGqFawxqmqvM49FeacX4VsI25QeZDnsqjQsygBxm+7W6xx6k/parjLYqB2vDiDu/4f9
         7SfUNSasi0HmLxqhJW2JCUTVZtvdIYgz95EA2grkkqmG6888VA99NGDMNUp3bv9Q+8Vd
         aR8ZbbQwlkQG6YvjA3PPnVU977EYtRDhR7Xnod+BWPIIUiVOL0R49e8Lpoq6iEr7cxgk
         7LwheE9I0UPKZQHPIvPS52a5l7WlMw9NmblV/5j+WLLDXeWbI0i4fvOvqUUL9Iqgalsp
         CXfA==
X-Gm-Message-State: AOJu0YxZJrpgjV217u0P4g9dSNqBNyD0c+qoUn0SqwihwdgPhj+kwV4n
	ccRcSLyuKpeMXJRXGthHiQglNntkGmCv9S5y84kTmZG/+bta0SJt805/YUyJoZRYU7VTOBX6VQ3
	MaQkqD5m2jhgPZemYeWXwyjYkkHwRJXIaxJibTPnVtMKWse1baQ7z3ZSJ5VKjsYPUNPoDVL+lpO
	9X
X-Gm-Gg: Acq92OGwfwVSixrfQHathGWSqyyTYaXGSm+M+RBat7Ou9cJhCTcEWeeIprdY5ZgrQI0
	6r4Ay/tcRr8iyn6OutA7avRMuUEeEdiuYD9i2/BqquoUDLPeRts1SCtWRyvlZrSriJvRh0Tpnsg
	8/bWbdnxggM0Hh09O9/X1BmmfJN274UmxzqyHP0KbXnSNfCCKYz3oMFIb5du/oTaCJqNl8+PRdJ
	SYNSNzmTip5GMshg3I4ORuSgavO34duM+1DElTSVKARDUfH9fDZ8pHijHI3M29i3vQqEwNQCPex
	MziiWcvdviXIdc8bucZyvnUItSMpQNlJKiX3LF6hXH6nBoTMGqxg9i+GvrWvWdIZtVNiUZ6YpXw
	GKgdLjcIYvmJv2h/oDbem9b6aJc8hQQTLbYuhbk4PE1/kyNYeRaAchrxgrrPU39tNY58=
X-Received: by 2002:a17:903:fa5:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2c2f092b23emr14796315ad.15.1781153958085;
        Wed, 10 Jun 2026 21:59:18 -0700 (PDT)
X-Received: by 2002:a17:903:fa5:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2c2f092b23emr14795995ad.15.1781153957620;
        Wed, 10 Jun 2026 21:59:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:42 +0530
Subject: [PATCH v2 06/37] arm64: dts: qcom: sm8250: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-6-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=39Sa4FRbA1XPh56vrPZ233l8fBb+GbeXoYXxNG9G+R8=;
 b=e+zRagMHI9wszHWPoXxyobcYzXlwlDlO0On7j7D/mXpqKgMn8pOJMfRfLWB4nmV9tzL6e8MqO
 vPvUo/aIOHwDfHERjVTYodv4kyc4dgGbD/UUvCZP62oGtohViGECPAd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: d-eIvgbHkSunCrcuyckvTO7wrMDIMR7Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxSwXdJGdiAIX
 2ksRWpD1cQM1Q5HS1K+Mb4gff5p+rqsFuKt2B29SMU9cA6KOjeCKktxp8cP1yieNTLBHp2iDo9s
 yt4f/FfJQAE/T+wyIjcEA+MWqMs0/Mw=
X-Proofpoint-GUID: d-eIvgbHkSunCrcuyckvTO7wrMDIMR7Q
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a40a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9XoFR5yCadtz
 jPPiu5ftimGzG6ypf4DHOLdtcEv8Wrwhim66RTc+QABPxaeASLbD8cOy0R7e9QLqNkd7OzhHR+N
 FHGOCBb1zhIu8kTpqCuwXE2Jren0nOVUigNAZBORmZ5EX6ZJhuOWdLv6oEqDsWp46f47K+OJdV5
 P8x/Q68O8MDP7SG53Hwf43Ec0hblsJScTaVWdUjK8VZKEVBlQL1UP+Rr5r1JGdFBxVlx7RBR28h
 ovSobnRnpAD1tPD9Rb3maT1u0MvrYiyOzEuaPzEyfS/4KkmXMzlRv/zBR4ffiLopIxNetFLOa1+
 G4nNJ82QzEuIERnA3ThMUYLpfHg8BMO7x0uRi1+j9We45O9dE07/EEGaY1sD8fJ543w3ywxGuVZ
 4K0ebewPzL+ogi2jiF1q+K2b+rN8nQUDLZDcrzFjRziNwalFWEbp0yt6n41yCZFgIXhSm3FvZfV
 /Rcm1QbXMRwKIQewcHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112583-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48C7C66E655

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..eca66d1c1c5b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2202,7 +2202,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2329,7 +2329,7 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
@@ -2456,7 +2456,7 @@ pcie2: pcie@1c10000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;

-- 
2.34.1


