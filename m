Return-Path: <linux-arm-msm+bounces-107440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AmcBMjKBGp2OwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:02:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7A45397D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFB673047952
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833063AC0F0;
	Wed, 13 May 2026 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDt9Gewu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2OW+mMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2D23AE6FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698378; cv=none; b=saLKyc6MRrpnCfGOY5WvDpNNDso+1BA3EGQS/jgjRMv9wXc3PelT4mNYFrzM2ArytYY96ZDrz+woFpWJVdyZz0PflCNPML3dWUqDISZCrcqYVkaJOfw4BiC9jjxiE67hxLNsbMSlcC3QqDOjLIDF6gMNhXiYpCNZP+RYBnFoec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698378; c=relaxed/simple;
	bh=LTHMLdWF8HFpPeJgdf3vWYwEXH7E4tFvMQpFvdkayZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwsMu473Kb4IM4awgvxtELMP5cAxNU68Zer+D6HNMpqoG2AybObCgchx9zspGKN9ut96V+4WzR8Vu+eEM/gQQK//lJxMeIgg7jTXCYx9Rh8q9Xi5lswkkcTvttYMwyAcjQ+r2jPIOs7bfrCixKhz7au2nrn1BY87s2JMsblQoMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDt9Gewu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2OW+mMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuPOw3995764
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=; b=gDt9GewuvcQXRWE0
	7RmGFVGkES74hmnZENQ0eB8DiDdsIiTlPFEH49fV3hF8vB1lT3OGNldHSbIz3aUa
	qem5IOwY3QshRbiAXLoqWJGlsViq8d56GMZcZyyTlWBulVzE83F2zOXMWlmA4m/j
	N3+tE+WXYlhiwZ/aRymbcHcfW3NlAZl863mHcUDhUNk7KWfoMRIM8Xvu6BHbKh1c
	HjmwupE7VUwUrCINPxG9JyPhSWp9SOHwoGZVvhyUDvxiJvP/QBdPt4G4KK2B7oI3
	aB8N57/nlk4hR1KzgoH7VgJkiFRQuJjreSA+LidP9sD9A8s+/JDH6bgXgBzySMNM
	tl1Nuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urgjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:52:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so6760345a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698375; x=1779303175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=;
        b=e2OW+mMduS2c9XYAdRcTWc5N1ufu2Y3y1GV6WF9YS6WtBKvgENcpMIK8sTlM0zbvJp
         MJhviUZb4Jvdl8jVZopAgJTOhyWzXrazY7+wwubxQLvWQTmkLgcoLXavvxeIRUcPV7np
         Ea7ZKWU5BO0hgmPr8TIuBJBNqTI5qnEcFS6AGfTZx3VgR3BNiHZGjO4aoXi5WMj1DMUh
         UED5GrhHNLnmeeccyW12ZcmBqEoFNp72wMm2DLDLaCQh0jcdt6CVUvwKEHq3UOfoVl5B
         nCLuSBxJm+n7WTVt0gdKKe/KLOAkbJTz7FRXx83BvZoDZTbQ/92zKGXuAeWuumKGYsVn
         Rlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698375; x=1779303175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G8j67tz9WUMhPlFuCoWNwxqGklud16mbggJpzoK33PU=;
        b=UZ8Q9nOWR30UWLN35AJkAPqAfIYydKw0NERTff6ya13J5xb+DAC43TyuxRpFEela+F
         ytGfu4JUtcBB6kOkl6/iUo4BixqL2auJAjyEoUrVmllRXdC8SKJIeq1tbh/DT9zp4uGE
         qKbNCl7xPw6KEaiaLJwmt3bZL8g2R5j0EVA6nBgPh7+cTj/QwMC7Q60JrxzZmd13Ipvk
         NKQPMnlzMY3C6yMAxQcIogTup7xNvVqKvEYGpkDLMy3Cp/wx53EmylE4LfVX7enlPxjT
         0IASG3wHui2x+i5yRWO1pY7BsdQJ1AOaDL3QUz23T5DEr4s4aNbxAjL4PInWQVBeMNHP
         438w==
X-Forwarded-Encrypted: i=1; AFNElJ/bRjJJIGFVNbwGdQPgjZjMWqEqQpf7Z4XzIjqjSA20ehyOesemUwwV8N261znsQTvraZiX45aq8HXKdlP0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy92e3c1YKnC9Ks1RTqh6692ksSa7nMmlHpnWrpCSAQCQT/hbHN
	SAtXe315KZkwz3lPDnjEdlTBXYi2u3Ljmwp9lpVzrJpHiVOQHujkq5JnqAw6zabU4Gl8gaG/cRy
	x1DOVDzyqd7jFvxeV0vWsOOCYkPQTyYLgmQ4OGriHl3KwXu2scD7oHGRebSlWniKpng4H
X-Gm-Gg: Acq92OF+w5OUprptpWF8Vk2om9NgHxh8tGRwJxMTQxzGredaDRIqNsNI+FqN9Q3Kg8H
	GtOgt7JNkb/5fiOvIo2qrIkbnn3EkiYaZ7YWdB2n5r4Ffu4s9kUdtpSgQbcrNiIGeCa6XEUS3wF
	TcXlUbUiCviyPWOVYgy+q68iRAUgVnSzGfnf1M+Vf/1j1unyioAceeVauuFbAV6kG7/OgTzWfe1
	cA9o9IdL15MzV2r4hvnnTJmvqcnDE+ohtTRVBU6EKjjWUJPbZnwpdUEg/LqghTu29tjVT+Kxg/f
	CKlgwZ0vlyPC/taSYqQrwhig8IyXk7N+klOXUAmHi+Qm2u0jJygdVByHHc4jxwRU4j7ZoxFL4Ju
	faLoFsw744B7VvyawOZk6ZzdwRMm+2vSXnHsvORPicxOkJqVCtyuD5f4=
X-Received: by 2002:a17:90b:380a:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-368f3e5ae6fmr5091625a91.22.1778698374972;
        Wed, 13 May 2026 11:52:54 -0700 (PDT)
X-Received: by 2002:a17:90b:380a:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-368f3e5ae6fmr5091595a91.22.1778698374380;
        Wed, 13 May 2026 11:52:54 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee626a04sm3660219a91.14.2026.05.13.11.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:52:53 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:22:22 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Add qcrypto node
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-knp_qce-v2-3-890e3372eef8@oss.qualcomm.com>
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04c887 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lX4hch5PzS7iFd4KNucA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: WBinExLT7Ifo1oFYq_JGF1unLQTQ5oYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfXyIQrOi/jHPYX
 rX1PiC1modIRyuOROufwaobZRbKTINUK63bMmyIh3cTYTCtNcvpIT3eACzkp0r3UXz1y8mkZHHp
 ddO4loiLaaxSRoF+3IF9pdwY/I9GwIN6fygtzep6DWBCSqSnCyKkribStDC730QyymzkSI0VKwx
 hXHcwSw3/IKztGsMK9TOozp9kDFdxoewbXk+0jakg98emWR2fGvJFAYtJ3ANY7PS3vuCgKKIY/x
 0jpTthvunTQbqxQbxJpUuEczgOKGKCl0wOt6sp6p+KhzSYSzSlua4o0WTW2xSPqeIkv7T+1PNlH
 fTuy/ZoSnP/tHJlkSSnYXxnV3Q130a9lH660YsCQccHHf7IcMxYQcnZyR53Tje7iefglL0iCpbK
 QxDShiln/zVNXr0OuiGRCOzNHza5wfWNHTPPcUhOh159KY6Ky6y91L5j3JlKTHN70qzliExYznR
 6ByQtByb1dyZHEGoHHQ==
X-Proofpoint-ORIG-GUID: WBinExLT7Ifo1oFYq_JGF1unLQTQ5oYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186
X-Rspamd-Queue-Id: EE7A45397D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107440-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,1dfa000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1d88000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1dc4000:email,1f40000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add qcrypto and cryptobam support for kaanapali target.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..941c9b131a4e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2541,6 +2541,31 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v2.0.0";
+			reg = <0x0 0x01dc4000 0x0 0x22000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <20>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,kaanapali-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0xc0 0x0>,
+				 <&apps_smmu 0xc1 0x0>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1


