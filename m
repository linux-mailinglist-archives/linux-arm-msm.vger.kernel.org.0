Return-Path: <linux-arm-msm+bounces-63730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74114AF9857
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6466C1C2800D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45C030AADF;
	Fri,  4 Jul 2025 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPh/6TZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F438309DC5
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646726; cv=none; b=Hfz8DMLejdYa2muOUCf0s5YV1AQBGPCUPa5OA2luRXe6oW1733JOcA1bQwcuOunFiupfZTdS3AVwm3Chchj+WMEZxWgElj0Gukugb5cTRO5ZnP+On95DImuhRwKJ9SFL9dGBBY8N8v0sbBo6psmyiy+nDKNndeHGPq59Mup/Y+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646726; c=relaxed/simple;
	bh=bAtnGsyPKQGjRv4wCht+S1dUXqoLPaKb8f4OFVueSmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUjM4FRoFCeC+kpHME7Fr6apB6trCV0HjFNZhoSsoyziPp+QeVDz1fs8P4gfECzjJRv+9GI8gcMiGTv9yVnABkiakbTcrKz2/zeC3S4AcYh+orbGXg0PFKhTh2CvpMlJd1oX+sMHnMGBKHa9XIrvmRniTflIyb/ndVa89+mM82s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPh/6TZM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564BIviB007093
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCy3Mp26PN6RlYzqrLIVdWeBnpFYaVfs3jyvVwWycsk=; b=IPh/6TZM16S2tTdI
	hKVUt/DOxChP6B14zsxSMVAh+AMKmHC5Pfkq6nakLVpDdywDvWDJRVCrSJ2zsXFc
	gWjhvfRaGhs24QQx2Ay60I/2/pavVTerIVMbZPoEjq4bh0EPlhXduPsOyczGKqBX
	MU3zKZGN25OVffTKxZZZaH8+5goPbS06anXVBF7rt9+HaX8iOI5yDp8xj+2x+uwS
	7NPAhav4yAakW7+TkmaHAVCdT41n/AxHHLJVeDwqegn/lXA7EQO0/wU3r4gV/fQZ
	M4yt+MMfS8ZV3b+WUX2Af2hAWlA8ovuhfmuwbQ4MphpLz8byEFi79gTA/72D18WO
	F/GBaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5js19g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:32:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so182862185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646723; x=1752251523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCy3Mp26PN6RlYzqrLIVdWeBnpFYaVfs3jyvVwWycsk=;
        b=kon+NwhUTvMTHTWleG4EUYWl41TL62qCtIgF461Cr6fTF4qn34NrZRBGxrXHPa4B4r
         +YoPnhXCQo+13mcsEG7RVhctQ40KKS6lo4Mykj/vedzEo5FnY3uXEw08NNenuiqmpcek
         bncCijtO83THsYvICRrUzp7eZkgL5/03eOkwmjffhgPtUpqjOiy1VDxQofokKCoo+xYI
         9AwjkECpOJnaPHpqRp/fIVf7PEKyZ8vcujYPlwTFQlQo3GMcROpBWiKyBvl67LvjajSc
         t+EMaKVAAAAMbOMNhsR9vZ+l6RmB0O6fgVmao8UCzuEIn4vbrGDJW3xB4IadmmeFUR09
         xgwQ==
X-Gm-Message-State: AOJu0YyvIRox1Ud+Yl54DmGXWoMopRiL7g+HSQvda59vR6hRhyJi5J09
	zDDqCmc5dBsah6vAi2pqKuXa7MeWM9n4GxbppInhVsgfO4wQsQb1R2xHCuawkZITxVT5UYtL5aV
	nEbt/Nr56HsiEPaNIo5G7Q5/5Xp6WcYV/xUyY4YsZyYrK6pN40knBxi0ROE6Me8LgVosN
X-Gm-Gg: ASbGncsHYaYJBtgionm3jCK/PWizJ9Tn/nAqCniBFtEeCA4wGs+Zv1zlPTzXAnoQd3U
	j8oaxJMhPLTXFF8/hGFNewFyQFnnu5EyqtqIXu/9xAukvzY6aNV2bWOwv12dPCAli0nyPHGo4go
	LQqEDWvz1t9qcTF4P5b4fmoxcyTrIitfXo0BaSfrS6epL/6lLE23wFPtG38P1Hm7vbQpgRLu3H/
	O1+IT1OZI2n55Rr34vVIOn/d/+lWu7AZPoZ5sRMrrPDLTfQN0OY6yS/35epivjoDFIL9pFKt3LY
	bY98LP8ghazRC7adpCFlGi/PzPB8YnebmAvuihBWtUWHzlzmvlNceQCH6O3Ez09NyzdHYHmqasM
	aoo4b93qADzT5g8qG/cmSS71RvW0sUTQzqFQ=
X-Received: by 2002:a05:620a:1724:b0:7d4:3cf6:15f3 with SMTP id af79cd13be357-7d5dc6e3826mr542682685a.25.1751646722727;
        Fri, 04 Jul 2025 09:32:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFjNhcyPXleZqxKkeBOedoEcBl5IqQ/zhQ/LmNX+iWVLvPoc6U8bH4uDJapqPQZMpf7V7c1A==
X-Received: by 2002:a05:620a:1724:b0:7d4:3cf6:15f3 with SMTP id af79cd13be357-7d5dc6e3826mr542676885a.25.1751646722210;
        Fri, 04 Jul 2025 09:32:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:32:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:56 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: sc8180x: modernize MDSS device
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bAtnGsyPKQGjRv4wCht+S1dUXqoLPaKb8f4OFVueSmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaAH7eTzqlMVB/DjRgzBiEBYxLi08uNbOA1F97
 Vd0EtyyMZSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgB+wAKCRCLPIo+Aiko
 1VkeCACEjcvsCOWvGzeerp5hPYD0fEONkveo55tJrQSZd19YanefgWVCovErRNlJ8+mMbndcfTi
 Gx9CSFn9ge59UYKObBArjFltpzQWnYQ+pJCm722MMoiEBssFUk6XozGFU233IQRNBN4SwnN1B7R
 gZgDvNjD3FMNb9mbXEmYJGe8qyPujcYlzyMT6p79fD4vs1d4vLln1hrDilvDr4HLjJ2Ilugb/wS
 9jg7eBzC3wyaQIwRnQHQSuOVh+YR68OVTRZbWse1SQz+VmDkj+rAXtrqgaRezVSiAqDvFrEjgGm
 ps2vw8RJsWNTJTVQG46WluyhtvQegOpPR2Y2x7u2Ylsaki21
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68680204 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=WUOsL33OVTVxArewYC0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Mj8CvakpjOYe8zJMydsvvJkdPvlP7BG_
X-Proofpoint-GUID: Mj8CvakpjOYe8zJMydsvvJkdPvlP7BG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX/1w/MMeWSzAk
 inCw8si2IGfgx/l0HhV1nrcGqq+FPSNFvcbyGJxBN9CL5VzoAvTt/YGy/abIY5sVeaxGAPy2dlM
 fcoiILMz51/BPp1dwHysuwykwlRv2yrZ2IY868Ky+AGMgXbJowxnJrOaZLPD7CJVMK6r36S7l8H
 bIhO7/KmOqPftfkM5xj2T9DxcC4ARxcawA/pQNHuhgbJOzkfHdokZZyp5QvJtgdVzL/rNgQWdUc
 qGW2WnoqxVBmn96mu33faTtqh5oZ7GusAWXcKJPA2aSW8NlM/KhBhvqXi8Uuiv/NqBXnf1w1TiN
 rf6e1IO8Ctt4naFtWDlPSdil8BPxDxe9uOp7y4ruNLj0mvuk0pPuJ7cg+uklwmit9oj4eXM30Cl
 uJpH8Qantajm7RpCW2JdUWYOd07Hn353Ve1jz3j7IPudd5fyE1cIPC67UegNyavB0wrfnZ9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=932 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040125

Follow the lead of other platforms and update DT description of the MDSS
device:

- Use generic node names (dislpay-subsystem, display-controller, phy)
  instead of the platform-specific ones (mdss, mdp, dsi-phy)
- Add platform-specific compatible string to DSI controllers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index b74ce3175d209b569e634073662307964158b340..14775b8dc682221ada3d30773be66edb46138662 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2956,7 +2956,7 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
-		mdss: mdss@ae00000 {
+		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sc8180x-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
@@ -2996,7 +2996,7 @@ &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sc8180x-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x3000>;
@@ -3090,7 +3090,8 @@ opp-460000000 {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc8180x-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3156,7 +3157,7 @@ opp-358000000 {
 				};
 			};
 
-			mdss_dsi0_phy: dsi-phy@ae94400 {
+			mdss_dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
@@ -3176,7 +3177,8 @@ mdss_dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc8180x-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3223,7 +3225,7 @@ mdss_dsi1_out: endpoint {
 				};
 			};
 
-			mdss_dsi1_phy: dsi-phy@ae96400 {
+			mdss_dsi1_phy: phy@ae96400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,

-- 
2.39.5


