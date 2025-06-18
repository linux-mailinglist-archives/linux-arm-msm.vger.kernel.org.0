Return-Path: <linux-arm-msm+bounces-61756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F21ADF509
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 19:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DACB188D6FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 17:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B0D2FBFF3;
	Wed, 18 Jun 2025 17:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enFxBmNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079EF2F9493
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269000; cv=none; b=bV3aR/44LJIzeRLmS/IFeeidIuKJopP9gGQjzCLWvlEzygAVCsgSd/dTUM/Pch6LZblUeQZu8XTcw9HLszdSPIE9hhckKG0JYLTT/ybAGSvu9Kh6lg8neRe+UUYRnl2b4zVViTGJShNfU7XzT6HnWMLaQ+6lT8Ri7VhWG+4/ABs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269000; c=relaxed/simple;
	bh=ryRpSA92USUhOzaygJj4k7Hg/jHuIKu6qNW8qSohB3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMdZZBxrmnJml0CXbWUbKDop1KKpK0sIJWobV/y/fXpUFB8pQKXJY8Hjye7abOVYrNeekq+wqvEC8vEoEHhry9qnRA6WbWcyBWFtQgHW8qWiGANT8BWxfq588/Zs+s/6zhFo7sTFd7fh3kKbL6XGJU8dv/qRg/9IYfGN09tuqfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enFxBmNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IB1uXr028698
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGCJlUVvVVMxsfvZ8Q/CT6/JNdsXaa6RZ2Rxs7o1igo=; b=enFxBmNTr43d1cnF
	FxPa7APILelFuA5SvL7V/bM+QpvPmbZBKcMsE5EcXjo+VKW2gQMz76dhFVUqK76W
	lYsjR+aTig5ke8XxqS7zlG7Dfxi5wnNwFXRg55PVoDQyQyV7XqCZvRgrheJvLDeC
	cIeW7O7LEy6P+7WdhV/GeC450Z59KvTaC9HpHXPH5Ig1xQsjOmSrmzkj4wgZGydE
	xTOcR2y58EUoKv4+Kmq4N06yIQ/Z5QakW3V3KB/kun+Bxr5hRyYFkAA2qxRQpgPG
	zdZBqDljft6qxC2yFmC1IMCzLtaTbMGLDcXymLLxlMIe1SEpoX3FA0vkaG7VWXhD
	MNQEnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mn2tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:49:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c791987cf6so232645185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 10:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268996; x=1750873796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGCJlUVvVVMxsfvZ8Q/CT6/JNdsXaa6RZ2Rxs7o1igo=;
        b=dk6tZezOJ5z63akv4ZPx72ddCFq+q4z5yhO+e/273o9nJmRWOTfTDqQRNWTv9U5puC
         jCFf4Woe46+qUeTB3ny///VbAohw7ACY0YiUNBniD03+WBuRH4Wx5tg+jmkiW7PIV4RQ
         d5CJjHtY6lOU1fWkm/t5CrlHAyTO+dFHKb8ogeuaM2OSuW1RZORtupZtn7FVeQfz8R28
         MRyTKVWDiQpcNIcnAmVNyoWVUZnIvT9iKCM+jWEdrseFeVU9wMHLYWhmeMeVr2kkcCYP
         jVaynkRF6cTV9AS4/jnr6ancv6Mdc7peaV+iP8A2aSLAT/A1z+E5Vq9FvexIB+2MfFf0
         DRwA==
X-Gm-Message-State: AOJu0YwY72h4jaq1yWCI21dKCF96Wm7Zo750KG2Q00fyx6lInUF7TV2m
	eHqn0CDwbT8/sL7AdVqKnmAhx98e/bBDjd7fkuV8aLeDgpkAsp48i0KvlC8crnJBoTIsuG7H4NL
	vX+ZyeGVPxz8IQO4VOtflzMwEpgNuuSbCsYoI0CS2gMHMWEqW+wuvYyu9Q4V1mV1j/ydE
X-Gm-Gg: ASbGncuGQkBi9UtwcG8/N4OMchMYxL1yvg7ngygjwXReEWSEOxM81GvEMrwy1eWgkSw
	JbYseL2W+3btXNWKnv2fIFvFvS3ylVlv7DWRI8vKJFFS13D5Vklp9Y5rtfHJtAthRNWS+WaSpfz
	LxQC2erEEs+QA0EMLy34A0HHKqW/ADn2ptWzt/cyESezpcyFvJpFxZIfZ8O7WxL/B470Kn9BWZV
	cVBqkgcPCrfmDwMXbY1KQrn2Y+ps2KHNtCi9TMmwoVD4MKae/RDPMhLPVmsRWCORBbfZ38GgI8l
	MLWeezWcJdfMyltME4x57QI0mwHAztlba331uErsGxO6Go67mldP76lUClLSimBDCdw5U93qYmM
	jId+767XMYKGBtV24sTh+f43u87r0tXy/Kfg=
X-Received: by 2002:a05:620a:394c:b0:7d3:914b:abe9 with SMTP id af79cd13be357-7d3c6d022femr2615354585a.57.1750268995871;
        Wed, 18 Jun 2025 10:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGFORVK+zXZHWoBcwr7k2oSohqPg71ajlVS1t+7KvhjskeUc6dKYqyciXnJqATBf07B6dV4A==
X-Received: by 2002:a05:620a:394c:b0:7d3:914b:abe9 with SMTP id af79cd13be357-7d3c6d022femr2615351285a.57.1750268995475;
        Wed, 18 Jun 2025 10:49:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b7b43a98esm2911131fa.65.2025.06.18.10.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:49:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 20:49:51 +0300
Subject: [PATCH 1/3] arm64: dts: qcom: sar2130p: use TAG_ALWAYS for MDSS's
 mdp0-mem path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-sar2130p-fix-mdss-v1-1-78c2fb9e9fba@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ryRpSA92USUhOzaygJj4k7Hg/jHuIKu6qNW8qSohB3k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoUvxAFlmBsoLtgXsB+qdtY2U3llCg/vGa2HQQs
 Vnnt7uOWcuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFL8QAAKCRCLPIo+Aiko
 1RP9B/0dtaYwm02JahyLCXxGRZ13eTgwLoot8FI55q+mlgXYNTDlh1bidMMgJ4UVF7Abu4uApVq
 1y2NNeZUIn1lYZmCoCD6BzL3A8bCpqiqoUY0C5D8ZEedTUeqwV9BNjGkKz3g6EgJwyw4M2Dqf/U
 kL1//qTj8hN7TxpVvo3w0HIXp/evI7yfdSoQytwKwUHq6Cod7qtHGEMfZHGMPmjiRS7htvPCQvS
 FRYeuYm6LEoM6vQGAF5f8Z/48tgeZt9jmSSjlWSpnMruoeXcj27ob/lDc/Y5L7CrYQYsipu4B0h
 6KUbM6guN9EnvXGUKfoOCzJ/9MSJ+0L+nk1CemFjOp3hIO8g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1MSBTYWx0ZWRfX3OG0Nhnkcpok
 1up0+Ut/7BL/p6cOPxKvs7ShHr8m3+Da3GOx1cR7zaOPue6Exy+ZwirhS2pWLdSqngz3QLdn87D
 8psQtNq30GC/2763lHD4erUYnjqBoBck9443izno8ewhij4imO7SIkhZbXgVqUTPu79cToTvi8e
 WN7EGACsYrICUlP/+R9KhfIqh6OJ6CHGUWPq876A8XzgpZsc0Nzih5rGGtUUNQ6kOeL/yG5hgF9
 iBU9v+pld4sr2rOHsLufsoPXol1xqMjxFW+1xoWF8vn/hhnA+nBL+Q9l0jTuSpDhSrWNYkj9GlM
 lpVkzIrliPt7iioYg0fTRhBcp/k8dLW9jZGnSvkYFtStwPtKzMDq1pyZmd3yzu/qpvk7fz4bw7a
 rwPTacgHpUOROwSlh2Oc+aIHEMu9Ca5Fzl0n/avaGqY6N+aKURMkTMOuotUNmKUrgT6q+tW6
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6852fc45 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=tt7aItV1iZXsY7X5gRYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: MrOZt51t4di4ZauKUzyDRTccg8U_AMcZ
X-Proofpoint-ORIG-GUID: MrOZt51t4di4ZauKUzyDRTccg8U_AMcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180151

Switch the main memory interconnect of the MDSS device to use
QCOM_ICC_TAG_ALWAYS instead of _ACTIVE_ONLY.

Fixes: 541d0b2f4dcd ("arm64: dts: qcom: sar2130p: add display nodes")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index e400ea4cdee8c9f512a8bee4444506fd23d0f0b3..6d7d4f05d502049dd6dc404317412c438b11d081 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2036,8 +2036,8 @@ mdss: display-subsystem@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "mdp0-mem", "cpu-cfg";

-- 
2.39.5


