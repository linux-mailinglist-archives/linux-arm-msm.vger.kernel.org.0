Return-Path: <linux-arm-msm+bounces-54372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F212A89A0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64AD53B202D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69699291162;
	Tue, 15 Apr 2025 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5VKr/pE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A4529117A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712814; cv=none; b=eVdT7e6ypKOKGz/H2cguNdWiXLrm4wqI8kn8IeZNTFMYb82n8yxtUZSLjkjBJrdGuQb0N7kkNKzVQ5MyCBYAetPSq2i/ZDVZp4dr8IUbptfXMGSHlhCh8w3P6mCvH9Je+lr05/VVVGxgGgzaBbjG3GBVGyVekjkJcqTgWSeH96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712814; c=relaxed/simple;
	bh=m5iCFVyVqfnwHdtvSJfoafx6xtG1zH7P84KluaY3Cpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tcc8OJOhCXN23b7KeRZBSh+78L535o3ZMytM58m5i/IJy0tiuSmoiFl9o6kee3UaU5ZS0sGlUnezSMeXZRaBbHzjYB1YLU3aCcnKU0WZBMSNnukeJML8eFi3i74hjD5wWdLVGqLcLFdAmsjx2R4Pb2MX5GriSGZZnUNrniIlwkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5VKr/pE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHXE013134
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCvhu/9W0Gi6UnFFngAKGj3mECQvGYTjgnbXd9mZ39o=; b=j5VKr/pEi2+Rx26u
	bFeGMYMUR6OSAZV+gVNWFrb9VHQxTEheR6d1XADmVxgFUHDnse1SUtS9ppt8ljT4
	2018XKpkx7EMZmy7uBbhjVI7TGdNh3mgEHNyrelp/wKDQ5Cw8wbfp67rVGzSywCK
	4yNSPC9KnHbQ/fllqdR9tVuWF5EvJJqyJJF/b9F1Ob24T/jjoMJ8DpKJyKHpBCc3
	Qe1VV98/WQL5PPKvQ1Dcwv/feD5cF7BogeHl+7NN3exeA8IHXjoQ8igSZhj/x5FW
	zjp92U7RwsqrzWeWWjsDSSf4X2nKmdvicqUpeWz7ewQ2IDW33GNZn92bmEQN/9eb
	dvEIbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fngy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c572339444so720111385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712810; x=1745317610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCvhu/9W0Gi6UnFFngAKGj3mECQvGYTjgnbXd9mZ39o=;
        b=wRZpqzFaQQRig7LZb2kEwvERtRmExs8A0ZzRpiHYHqmuEgaD/CUSuCI5saDGWPlvL8
         CVKXftYTXfb5/lDiGRtw2B8hqjSdqF4QBmzNRZjqUwEqXBOABK9idPBy4TY6ujsXEgaE
         HG7d2Vh7obzlKRLykLCS2oz5/CqfKyPbO6JgEEc8HvsZpd7hIOkFJ+kcp3rqguXeYFAs
         UZR8x/Un1L1X6hrGoB7LCbQakPXpL6KTnRESqy8I27vQKRzQKxf1YiQlVzCIu/LlxecE
         cIDKAQIYbX5otMylaADsJMGYEVi7xCMdkMHK05n2+A05WU/UFOYSJ+F4/cKLoCrXhgew
         H+mg==
X-Gm-Message-State: AOJu0YwLybIGfjUYyLVbHlZ3Xs3t0/QOeJiTmgvYUT5AjNF8JMSkvl9V
	d0zQjU0pDV2cZd6B9wyfh3zFAY4WlYXUVzQXMaDLimqD4K7mTR1rYpVRcY5BH0+pKN/TVJQlTY1
	ugyLpbLpPLTE4RjZQoRtZ5AfSU2J07PKkjK92iAplS7T3zK4CubQq6OQfdYMp6TGzpUEHOYfzfY
	Y3bg==
X-Gm-Gg: ASbGncsk3t1++xRjNfUPp7IJWkgO7/XwxoV3hvz4ksloS40kLWSc4Wel2wpnxhPEtmk
	DiaySpX+Fwpqq908fqkEEEgQxAvFRNHvH6lyhevK9UzeciDyvg7rMr6o69iXDd9fo839l0vDGfy
	zBG+S3YWDx3K6Jn9bMlgEL76b1UVbGaudMwVXqq9ljZuRSJ9mZy7Fyne7QccxFNcRUBsTHQP4BS
	axS21wrXaVUMK7M3ps2NDJi5Geoj9EtQLUn5qpspWUTA6DQNZUD6a5WndHmgeEyk1ccE5JTZqwO
	y5WCBrEDQOTio8R0+peJS1775ji9QjLBhyUOi3392af3v40Nc9cNh7TaiNFrOt0YWkhTUCoJJ+/
	YrxDW33Np62Xb/hExaXfau6IH
X-Received: by 2002:a05:620a:3944:b0:7c7:a4b8:5753 with SMTP id af79cd13be357-7c7af0e0f9dmr2546569385a.30.1744712810470;
        Tue, 15 Apr 2025 03:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+lScsqhqNcM5wMaa6Nng1ZFIiyrvNhp2kn2vLSMOYK7W3q5wesY2Xv4GMV7/4RXSn9h6AFQ==
X-Received: by 2002:a05:620a:3944:b0:7c7:a4b8:5753 with SMTP id af79cd13be357-7c7af0e0f9dmr2546566485a.30.1744712810094;
        Tue, 15 Apr 2025 03:26:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:04 +0300
Subject: [PATCH 06/20] arm64: dts: qcom: sc7180: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-6-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m5iCFVyVqfnwHdtvSJfoafx6xtG1zH7P84KluaY3Cpg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRb7mHC0zMnNPPzjGqiVl3oxAGYFScf1bxn2
 ato23Ov9LWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40WwAKCRCLPIo+Aiko
 1bcPCAClGWCTHco2b9swj2qx6PfYtiJpI6lxng9qrRDeFeLMmh29od55mP1dNdeGjJ4ypSBU+Yr
 udDeEv8+P3WgWWPk5/YrFab/1al2NBU3bHd5fOJa1Bq7LSNGYaY3xpjr7kcbAFGjEHsoplkPEis
 U04mfi9XoP//WhtY0bAXywttqyKakVD0TKVDuKyYNRcxBuDi0447fkrj40G24K08qRkI/dAO61p
 9uNRIP7YbraXyjo+r5Uc+e4dBuxBKswLSW0NfnSlkWLyLxBw/G+jbfXcpy06mVpGeBaWrve+Y6M
 1MkH+uz6M4NSjeXy9CJTDoaj1NJl7UlsJtny4QH6mbhPmfjP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: xmNNsznH4wT1XropBvBNaCvykmznE1G1
X-Proofpoint-GUID: xmNNsznH4wT1XropBvBNaCvykmznE1G1
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe346b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=e59Rtz-e4fPQ83KgERQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=804 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d157863dbc4a18b6861060579a148632f8ae9e3a..bb1880a9458b8c570e3fda35d3c289a9a4ce29e3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3196,7 +3196,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdp: display-controller@ae01000 {
 				compatible = "qcom,sc7180-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,

-- 
2.39.5


