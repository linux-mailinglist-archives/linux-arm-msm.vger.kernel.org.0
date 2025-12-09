Return-Path: <linux-arm-msm+bounces-84761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F2ECAF557
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 09:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CD64307314D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 08:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417E62D6E62;
	Tue,  9 Dec 2025 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4U6+RJv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apfznkSo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906732D662D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 08:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765270186; cv=none; b=l+S5jCkKOxmPXMoxkw28/YtXI46cZ+H/NvPviBVgopmAGz0hdsTiqU+Vh2+5RUizGyOjVr1fwmf5R4ZtdgCNJkNspfO+sHbdoClEi0AuNzq8vw64HT05OdxD0qpR8SYGDly1x8ZqXkVwrKpvSyFZvexA1bXvUhzg8r3EYd69vvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765270186; c=relaxed/simple;
	bh=HR4b4rIF3FyG+NLClwvLNIhChdMynISDL6zjWhfKY60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UblNyVU+YEeAPZRPXpvsco6R8gJnDuP2T/SPmlhSpx04AiSWchHRBUCJhivqRNGFol8K6LYnDI3QSeRCRcbPFta/xU+eWtd2cNR2wZH9/2ryMNEMbpQBXHKXQ6yVZ5ZeKTDnTJ3tN0kqMCRtWf16EO70j5Ad1mQ/N+nEV84VHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4U6+RJv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apfznkSo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B98jfNi3173858
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 08:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhdtTKL0BWYtyovixQfDifJqtc/3x7MwIiaUc5EJ1nc=; b=Z4U6+RJv4/5pUPoS
	P7h2gruGmUclhTu6ibQRESI0/RZ6uIwd8RmAVDMa+55IZAP+tC1q5O7guiToPedy
	OPKcbKpJgydf/udi3syDTVXRZtUAgwCyqLIcl31Rxdg293leQh0MvrVUkPtsbcir
	CXZvpfWwyu1HpAoyb6tzw7g4i/Q/yry8Cwgot5zzYWEOPWQw+G7h/tvue68KPxpD
	NJ5DqHfEf1zFWjwurJrQ8MdiSTKgJg2pmSrrL+H9cG5GI2sCy6b5aFD0l6K9wPHU
	A4TEZAOlIPGB5lP4emvDV4zLAY8FHI7OtvhIAVYOR/RJ4prJVfipBzh4fVtDgNJY
	aSG40w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax30ca99v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 08:49:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295592eb5dbso99223415ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 00:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765270183; x=1765874983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhdtTKL0BWYtyovixQfDifJqtc/3x7MwIiaUc5EJ1nc=;
        b=apfznkSoYbZ4dxkQ+Fj5HJsACLsZ9t6T70dqvK0dwQpoMI5uDtOCPgqC6Zbh5Q/GAL
         sfS1W/gfhyENhX8eQRN9kBi1tqk5mc7c7YgXOw2kWDCKU0rwssbbf1oLnEyuK+Vc2XbA
         0Zz2jl+bcQrXaKcXC7KV3+/N39fGDFYGUr8Ud3RQwX8n/sy0ALK0wYce+ifGZYSZKiGg
         +akhQZdr1uhOnfaQSHs25dTN0Q5XKHnQpUt8S9x03dT81wMwIz8/v7sf6fC75wpb5Ews
         xHc+mOwXZuiuhb3WjNHBVigS++LjXhcjltR3Q1bxsUujuhGnVQtu3ZUuXRQ8Qa07vsYh
         oT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765270183; x=1765874983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhdtTKL0BWYtyovixQfDifJqtc/3x7MwIiaUc5EJ1nc=;
        b=whg++806oV3c6Wbfye8Gg41Bzc/9oIFx6NhVh4ND26hyuBpzrLRF6bJL6AcJKY64s4
         dVF8fcRBDBSFNB5h0+UfvCVWtwqJnn4epfbeXTYOTe73vaBt31ZaOOtDWV6scSZVSOLS
         V5XPVecdXyAhiQfHbhZas1VwwJ6whuf8SE5dUDGtY2+ExdoJBwAO2JXkGD3AEzYr5WGV
         jnMnOM0ZgpSvhr13hnu+fBtFdm2smeeMD5UNiPsnUeZ6ySEKFEtVtSmI463V0elTn6mx
         VuPBXJNEDRa1fZVarUjIkOCIley6ZTmpDfiZ1Bp/HTxuq/NhmMVQVp+UjiIRz2W8+d03
         JvPg==
X-Forwarded-Encrypted: i=1; AJvYcCWJSWODw68B/4AIhF/jF5E3OfbhPaM/ZWgCPlfpKfW2uMAC/5ysVkb3dysLFBVIJg2G8nPPrDjzKDrt1Tbm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzod4lu2TnPlJ03dMJgIFFuk6e+axnepSvEHbJIkGqfAZoWe0S7
	2P3wLAkurRIbsc3qMPXfmI1SP3ZMejR3aJa2lw+YES8u/4OVdCqDkaz+3cG1L33eRairUjQnO0E
	7C2A8UM1SB23O32Jnyo1C5SNGgW3SUH+a0q3u7+ZVhvZrhwgxT3nU/5zBI7FgAWhXkrCv
X-Gm-Gg: AY/fxX48h/DqPNRCDG3ZZBmcXiAtSAVCDV65JM0NxpaOHz3iBu2HnZ6dmdKEZHYPnCR
	RoQ3rJMHKNLgfZmA61Jt8Fbwu05JR8XzUlN8J4y/pCo5dEGaXFysOzi3WXGmF0hEf829YB4Jx8B
	fSP0XyWtuG2whatFDve9QVPrmaamQ2gZMK4VbsxCfRcRKqA1cZDqOj37l0cV6aHb7aqJgMgKZZu
	CJq42VTXxWYotwUuIZxzbkmci3c95Gh596+FQMP/BZue+8TuGRjs9WcnQJ+WabuhNfAdzzrcXdz
	5br1UjTYppT99C/2B8VUSp5P0Zr3qUY2CyZAviuWIVz2YGFaqHMkx+a1B0y4irB36teZG11MYZZ
	pOZroHP6TK1lCHDfWNOEedKld8Pkf9c+mVg==
X-Received: by 2002:a17:903:3d05:b0:295:4936:d1e9 with SMTP id d9443c01a7336-29df5dc1388mr100266875ad.36.1765270183284;
        Tue, 09 Dec 2025 00:49:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGF5+QGgj2C4yj+45PdNrCw2Wjv/U3yL37r775Ww50UHGB9eQ8Ue1zwphqfBX0f7kNlqylbbw==
X-Received: by 2002:a17:903:3d05:b0:295:4936:d1e9 with SMTP id d9443c01a7336-29df5dc1388mr100266695ad.36.1765270182849;
        Tue, 09 Dec 2025 00:49:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f1cfsm148615065ad.55.2025.12.09.00.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:49:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 14:19:25 +0530
Subject: [PATCH v5 2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-gcc_kaanapali-v3-v5-2-3af118262289@oss.qualcomm.com>
References: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
In-Reply-To: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 4XQbjmlwWMXLNca0ohW_fDYQBuy1uA9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2MSBTYWx0ZWRfX4hV6TpzXgInQ
 ZLCBv2VMuTyj4CWgFVoQotRZA50LXHtNtSTHBDVTGlBmkXua1nPLaJ4NpGvPQI13rKDtJcYgCSQ
 EV6XJ48xwX4JcI5IXAg04U2LpBbxgOzf0houJZz2pRV7e+vqX86gsMInp9LHTXdOOneQFYQ1Dh+
 V0DFFFIh0UjBemjgL50THf4pCir6I/KKkTdr9q+b/FOaja0QO8Loe92xoovBk6JfTDeVMmMf8cC
 dB3g/CaIde9O84r7ei88C41nEV5oM/U9sBU/R7YMWv1GzYys+8cldaq+KzsWOhOdED6LLk39DE2
 ItUvjtKRSb7e3sjw3VmYli3qe0tg+tC0ARA7keP+3dsnljHJX1eFkJ49+7VLi/Q6iLxHliRZTmv
 vKZXK9qCrsEoDPfONVE8En9OmGBB5A==
X-Authority-Analysis: v=2.4 cv=F99at6hN c=1 sm=1 tr=0 ts=6937e2a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gxflGWy-rYv13cvyobsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 4XQbjmlwWMXLNca0ohW_fDYQBuy1uA9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090061

Add the RPMH clocks present in Kaanapali SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a2185a6f321fb60ddc9272582ed67fa9ada6535e..10e84ada48eed0a0ed6d93d9c2232ac67f6784ca 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -390,11 +390,22 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
+DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
+DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+
+DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -901,6 +912,34 @@ static const struct clk_rpmh_desc clk_rpmh_glymur = {
 	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
 };
 
+static struct clk_hw *kaanapali_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
+	.clks = kaanapali_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -991,6 +1030,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},

-- 
2.34.1


