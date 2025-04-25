Return-Path: <linux-arm-msm+bounces-55599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0CDA9C465
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 156C21BC1376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0922405F8;
	Fri, 25 Apr 2025 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+7V3tXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD442405F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574735; cv=none; b=R4nhSCuSJF2x0uSBncre7gn9uIV5D/DjRJ8cIh+7tefZLcFsy2cvuju0W9FtgWK36OlWuPkvukGNqY8hVDxsN1RMPQ2gZ7u0CqPEr+DOcAOcLj0pzKfNOsLbvIio5UCeXe0XyAKmD/bPJZZVu6KbH+1y/dGHXGSJVNhOeBMn66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574735; c=relaxed/simple;
	bh=w/z1T9uSzmC+bw/KQ75FUbGQYWjQVDzJ2e6/MqXTTIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7IB3pzJhyX3Vcxlw1yRgDELNXmW7T9KwSieNTLmuzbmXG6Ct6tbw+oilIt25mIFyrAM4FIP/cFq4zn/xN6V3roWZ+6TftiOpr+N95jGuFfK5K4mNJ9+SUGLiQdWRIr0nkUV+UArdHukZsQ0vFCoIB5CWzLJqyn1rHnIbAanGTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+7V3tXs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6VT015997
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPo6Q64R8Ie+grYGknWiayM+abt8O8HAhJ3oPPs/n34=; b=G+7V3tXs6P9jPY9Y
	Ss134wveIjwo+kW2gY/B+9zv69ehzifyGoON/whd07TrJe2SwXP0fwybchl0u+vF
	qiSs4PSHFGx+pqHVDJatoTX7wfO0VmxlWSfsxsbwwOCSlI2pg+MymoUnhgSK/XQh
	MJQuxd3oYUIAWjJwr8EIAkNiyJr9OZuKyDa5t+CZ/5PE882kgalhe82ZzPOc+hmD
	TDHgulhv221Yjkc/6i/lKemMNyreU6pEA+ymvpz8ip+FsKZzYaLwpsCdLuSEwKv9
	84AULNPK4qPfWX+Piip9ZbdBoxUezuuMXZQO92m18knQ7Oj5sD6E7LaXjKVP5Tmo
	aV+QtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08jke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e28d0cc0so350518585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574732; x=1746179532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPo6Q64R8Ie+grYGknWiayM+abt8O8HAhJ3oPPs/n34=;
        b=rMGIzgt6SzYwns20fjdYTVHv6GYWKdRR6bBBalj4r1hMAMHDRAso2Nofw8lMw5615t
         QvoBO2mFGK2o8mMFr8OaXDgIxbpC7fHE6jpQq94SINdk/4UPU/juvamSb2SJKX2Awitl
         EL6TSOIdlo8wkMh4mb77FuN+fYsvmwvjSm9fwVaxctwpO8VucCTxrp5gFTg8p/4Jz9wg
         mner3SP6X003zvAjtHfJhVDiSWJeHg1/rXgAWpb8sGCRQnSmpGlPDTWXhvNmPxGvIUBb
         ix6c4Tvjdn+Jy166oBTQjhBoKb8pWn0ltfWPD+IP1kQnfIOdE3WFcIYM4MUUaOAwwQXF
         ZubQ==
X-Gm-Message-State: AOJu0YyLkb0DbKyHYkfZ7RyF5DXDJDW+ibqg45JWAGkvCiQr4vCo132p
	s4WCo2Rn6HVE28ZqdCUb6csQEWjo9UHlQz9xftV4nAabYdQNIxnKb0eaEDPJIjJYEMnyo+2MJ64
	61Is+ZTOo3U+5ZYJWTyWRHDLzD2XOdu9bKrKHM3uSq1vozCAE0xXnyc+V3f7IYB9v
X-Gm-Gg: ASbGnctyhjPIXKgt6hnUQhaRNqFMhhVs4W3B3GtHJc2I0bQGOJ3xrhPdpcQq7L0ik0w
	JOwAGmqePxRF9wB0UrKGZpGtUh/F6oxfAKUcpM2u5AKYjgOug3zqu9RE6Ll2hbFt+lF02KC1Y6p
	A0hsRXakmCv7Hye1xrK0dk5bxzP8RKKzs4qif0D/ZQOYo+o7YKw7m/vH6XmXtjTYsMrAaQMQ+OT
	GaZqHoglKn+iSqEEcUYjYJXltHgkFSZSPTNh3C/PZjzSMQ9XEfKkTclclPttXLGcsvlCSRl26uv
	ksMbhUX0pTXGFqCb4fYrf8m5TiLR3+H9i08FjK3OKQ9Lvtl43YLYbjpGgIpa9fb44vSWLdlA7XG
	xf6IO41CYikhBHnBX3IgIClvb
X-Received: by 2002:a05:620a:43a2:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7c9619a84c3mr221795885a.30.1745574732236;
        Fri, 25 Apr 2025 02:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxNIuYNNjaQb8PK7de3lCR9P9YcVtolbk+mly+U7z7/oU1wPkDB+IRFiFcg0g6m6VaQc/Dgg==
X-Received: by 2002:a05:620a:43a2:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7c9619a84c3mr221791385a.30.1745574731855;
        Fri, 25 Apr 2025 02:52:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:52:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:57 +0300
Subject: [PATCH v4 7/7] arm: dts: qcom: apq8064: link LVDS clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-7-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gTQKG0fLWpD8Mjgk4DoVlbsZZVw4cfaJYQqKJoHiGbg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s6eKqblmHbFW4oNBrTuCB4SRcfiIHrdxIln
 Z11Q7ZLLwyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOgAKCRCLPIo+Aiko
 1TWQB/9/M8KQR/dnVmy9NtEwx7xnrdi4/+6hjugHCYXxnOB/WAIT1s5H1KOWGVTHXCaw07Gdxl6
 v0jvX1yDPdUVVX9GYmZ60MW3p1eooDEw1NUbqvBbbQdPhQIw68HrZKdPpeoOBEFsbf6OW24FXX7
 PusgB4xwCfBNzefYVzBZrVX6gybe6g3rvNERHa2tROfi/4h+r1NdQZBdZfUNCGDU2hZu3tv65Qo
 OtW2TZGeffWeRa7Nr+5p4N5KRxATqLwMYZuVfq1fskGvmBQHWmG9jnOWGQgVmQKcfRmFaHMmnT4
 yDTiRIhPUbCzo+GRNTROdUaFD/fmODG5bTtU+8DxtypOzLyK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX3Qhh3A7Q3vO0 Dq5RRgM+chAGSw5FQNM9vQtkgxYaCEaZfvhDb3RXs8eyjuvPCYCu2mxIDH+biM32TVjpdH6sTo8 e4V02+r6rYAUVX3a02QN3tdJFnEEm9niXSWIen1xGPIQwYUTKIeYDww5O9Qsnt3QDZwh+mQdfu7
 /g0KxwaPmeRh15gwMm5eoMAL0Pg8it6e8mj7PG+eMUeM1MIYs9DwBcajx3ptAiYmQtDsrcA6ybQ cBoSIS7QYuhKX5P2IMwJFYkxtGKIiWPnB7FDt1DzAHz4ncLr7dik4WHdeJongvVDlGMP5kB7cSb QDt1le6SG7gB71vpOyAdUjDhtaztkliNjWPqOgJFaEykALAon/G1MVSNOYd/ZnDbD121ufBPgLa
 kWROhnpi6XgP2Tg/Cc3Ll2ahGP3dQyDi8LB7kcrLmuUeaA6vg4PQFHBguW+QGFZp9Azagb6w
X-Proofpoint-GUID: RVlZdKyLjmMa_Ie-ADfDVzsBmdJfWccq
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b5b4c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qzM9u8Bgc55Ixitz76cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RVlZdKyLjmMa_Ie-ADfDVzsBmdJfWccq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=704 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Link LVDS clocks to the from MDP4 to the MMCC and back from the MMCC
to the MDP4 display controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..b884900716464b6291869ff50825762a55099982 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -737,7 +737,8 @@ mmcc: clock-controller@4000000 {
 				 <&dsi0_phy 0>,
 				 <&dsi1_phy 1>,
 				 <&dsi1_phy 0>,
-				 <&hdmi_phy>;
+				 <&hdmi_phy>,
+				 <&mdp>;
 			clock-names = "pxo",
 				      "pll3",
 				      "pll8_vote",
@@ -745,7 +746,8 @@ mmcc: clock-controller@4000000 {
 				      "dsi1pllbyte",
 				      "dsi2pll",
 				      "dsi2pllbyte",
-				      "hdmipll";
+				      "hdmipll",
+				      "lvdspll";
 		};
 
 		l2cc: clock-controller@2011000 {
@@ -1404,13 +1406,19 @@ mdp: display-controller@5100000 {
 				 <&mmcc MDP_AXI_CLK>,
 				 <&mmcc MDP_LUT_CLK>,
 				 <&mmcc HDMI_TV_CLK>,
-				 <&mmcc MDP_TV_CLK>;
+				 <&mmcc MDP_TV_CLK>,
+				 <&mmcc LVDS_CLK>,
+				 <&rpmcc RPM_PXO_CLK>;
 			clock-names = "core_clk",
 				      "iface_clk",
 				      "bus_clk",
 				      "lut_clk",
 				      "hdmi_clk",
-				      "tv_clk";
+				      "tv_clk",
+				      "lcdc_clk",
+				      "pxo";
+
+			#clock-cells = <0>;
 
 			iommus = <&mdp_port0 0
 				  &mdp_port0 2

-- 
2.39.5


