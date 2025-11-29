Return-Path: <linux-arm-msm+bounces-83862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 038EFC93EED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BE434347310
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2339D30FC0E;
	Sat, 29 Nov 2025 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F52Ff/N4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILYei5rJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B92D30F94B
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424969; cv=none; b=YOJ3aEgal3kxswI+mPZV5NIQfBrYPNjyato89tXK/8UZKoXdobyn0ZA7HJwOZoacRsPLgeoYiD2yRWwiDn4nhoUH/PFQcu8i4zo8CoegmDONgjWRy2PClcMYYviS+ZJGWJbwrIE2M/KJFBt9LzpcFrhaOBJsOOmh61ejPpugvgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424969; c=relaxed/simple;
	bh=N/HQL7erCU+STrcUhFaPKJKK7hWDaNvOxsp1ovibvlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBqXmMxkO9MtvO4bz0t0ZtaZ590MAM7F67PN6WubOKy7uvXhRbbry1aZMEudmVhXiZU1DKCnNv+EIdYfoaKSFeGBICjmVNlNlzBM2sSyPnq6V2s19qesxSm9R0g+Y5m6M53C6W1KEzD1tVnvnihv6+QKQxpuDgUuCeII/zwVfmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F52Ff/N4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILYei5rJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATDEAYX3440783
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2TkHjwGEo5nzUU9jYmO2kyN43bdvOx0J8dd/CT1jmlA=; b=F52Ff/N43ydmhe3J
	yrocVdRZhv480DerUkJ1KFhKYJTJ0RUx+unORgjRzKePQmNhBSSH3SfkRyaQQ8r6
	nQbPf0938yp0Tr8CX2QiRl7+a6IWEvgZg4elW94k//3zmhbT1JIpGXM7W0wxv9AA
	7nl/dSaavNuev1KidZvpE7e3+PINNs1vVb28FxQW2mCAtQNEjERe0Q9padM6NVOo
	kDF949TykG1m60E9ZwuuaHNTuT6JvpR2A/2/lcmNABQGNe++ffafCeoDOHRuoSGW
	XlSbVMcjjSeUN1pdHMrZkaOjXQ8NjDYnYTbRKcuwlCuzHcm5SKONzDRlLtDsWcP9
	rbFq8Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqrdygt7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-935205bd329so2758660241.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424964; x=1765029764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TkHjwGEo5nzUU9jYmO2kyN43bdvOx0J8dd/CT1jmlA=;
        b=ILYei5rJSeVSZoy7uKIXW4/puY6SXvvK5xrsM7YchGrYnQMuZFdx8YVVE7zC2p1UdD
         EE7AT0bnKhOXt9mQn43dWzAzybJ/m6rvv1uVyHt+E17yIc0Lds1co14MALCB/Oz92Qay
         PtVLy4aXBbcBQCYZMOcIZ6CKi0do0ibhFTg+8BpKmMfMuWl7NLP4VIyYpnEGXuIZ6gBd
         bmONE3RocyocXUwPZos4oDGjRfCyPyMUgtRN1kiYjHbZRayY26PnxO2pi5pd/Qh8p5Ff
         SAzEQFzyKcmBERqCcsnsyuAOJXS+8xlrs/vZD2tHIyOoz+FDAnfgpu5dWEwJ6Viw3MzX
         X2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424964; x=1765029764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2TkHjwGEo5nzUU9jYmO2kyN43bdvOx0J8dd/CT1jmlA=;
        b=rSdRophPBq1n/41QS8OfturgXko1/moNXfx+FW3DmgjqdJiyxPWuSEXns7VPTftd4F
         bJfW4IQMoHRfztqKLGHG2HROwt21YU8RmvxuVBZlc81fRwIYUwZDxBjPkx3vhsJq4qpM
         +mUhLBJRBe2eCwNtWDbnXiSCoaVxstK6zMVVFh1wUbNFvWW6IyooIA+H9vgOztYvC+Sf
         6qKLafYMkVEzRdgCmSqFkOu1vttQwjbjqioaaoxzczybh8eIHuPYX57bXQqmybgPnOZd
         HYrglA7WEk42oX+5m0IuQp1hMR8Ocku3RfvMmTkAf38Z01rUNys5cN3MiuOJYVpCDtCz
         bQQg==
X-Forwarded-Encrypted: i=1; AJvYcCUpdgIiMZkbvC+pzEkFR/oAvz47PRYWo/jCQVjCvzTslfdywEFJGyRp452WQT3y9fG7fATOnMdZ1DZsuUK0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4cy1TfQMIZradyYMZgVmjzHtEyWeJBzHmlp8BkQL4v2xIrnU
	cWZeHpCQb/g9JZxDsKN0/26jRJWPJJnUO1H9Dfnl6XoMiMc5E6MvzJfMV8J1KQ/AzltxBGYeoSG
	CqS5bouPb8kxrnS1vHwi9Ti4NgfFtVMfdPatU+eamkY76RnemLPXKU0gb2UEpBn0UZQI/JRe3Im
	Qd
X-Gm-Gg: ASbGnctfKs0OfvaXfplP2x3ku+g/ONPOzY9MmdTz33byo0sMurXZdMXr/CHlvJL2+wZ
	Ml4TQYPRp8Mzq5Le+xCvz76ngmeG8DXU06oZd5evsyhU0x9WWxhypRNYVjztJs+pYquHVCv6MvP
	fo8l3Qu5oEmuYZzBE6r6L3F8SN0sxgjxrW1wRnxaJqTnTh9y95D4wlkryXoIWbO0Z/z2dHJAgap
	hkCP89hXeqVWta/g+DH/m3GFWp6osEV8WZ6CK+mCn99jDjglZb1u8qptc2Dn7qu6oTjQN3kFWNB
	4vqEoKKSPlyPYGtUbuR+U6xhFxoUX74t5Y4UVsWfOr6dyqd/lTr1YE4ltzK1PMw9jsf2UBF62G2
	vtTrBbp4gcth2j/nhf3OVNnBmz2jqME/Wiw==
X-Received: by 2002:a05:6102:6a96:b0:5db:e2f8:cf35 with SMTP id ada2fe7eead31-5e1c3bb9727mr16266998137.3.1764424964048;
        Sat, 29 Nov 2025 06:02:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaenNqKs0AgQd6VGtusPG16W9RFwiyp5XVeAY59KRCkdh2WLQDGiHto9YHN099nFOtyLejIQ==
X-Received: by 2002:a05:6102:6a96:b0:5db:e2f8:cf35 with SMTP id ada2fe7eead31-5e1c3bb9727mr16266915137.3.1764424963607;
        Sat, 29 Nov 2025 06:02:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 15:02:32 +0100
Subject: [PATCH 2/6] ASoC: qcom: topology: Constify pointed topology and
 vendor structs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-2-67a3d3320371@oss.qualcomm.com>
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8790;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N/HQL7erCU+STrcUhFaPKJKK7hWDaNvOxsp1ovibvlQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz6udfjVOl8zXKdQQSpXXFgnVJY+wM/LZRyq
 Oh9fTXj+ZyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8+gAKCRDBN2bmhouD
 13AlD/98p+mKdmBUv1NGG35DII18TBdnI2IOmMy8iNfDM/M7AplLDlBg3+xsFJfzNKY0Qx9KuiU
 hLm9aAnskfCL/mNdN3IvQY+ZQA4XcBZdhVaP7x2/crQwCP1L6nFTvtxPTBmq5u2Og29Fw2GDHJQ
 fmx8CbAcyg8eowNMcV8ALS9zxsjzm2raDIYsS9do5zdMgiMmUy5YAIemG/wc6G5rQefy6L+gkDp
 7IQW/IcdEWYn956CCpUS020LD/kujLAI0PQ5pKYAqiMqHGzhBNN2PDyEytpQJRhjGpsuxyHPtOs
 NynPbbgrqw9M4xNoJUvUtKRDxEYFQXH0/MqIrDm2zX9vSNQloqEPtXO3s9rFDFrQMb4M+ddY4Zf
 7W0sa+Rr9+Q9BZJhVM7KCODXPe/yJoD05QtY1rOnx7Qhhg6VFMmMmY4jPKEc/DSria1q6bOFNjY
 hmpg+B0MTp2IFoMpfZcXLr38zXwAIIzB0UJ+TiT5Bza4K/Xa+mbhqN+VHIkBUIAgeEYYT1NNoh+
 DPlOKcdNBxr4xGGD6r0WbmQJfLHxQJfaDsfrhWw/o4OpwUm7Lvk3Wlfj69X9p4SKnhOTfmgdOD6
 QNCYYuOkmx664UMKJlR/zK5oKcQeZ81Geh0rqCIpRLY/4zq9BuH/ZTcn3oy2tQbUBOjwF7ow0a6
 q67KSvCv8SBEU4g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 0mtuGRJt8KmwvroW7Dz7pJnImCKMM8ZJ
X-Proofpoint-ORIG-GUID: 0mtuGRJt8KmwvroW7Dz7pJnImCKMM8ZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfX5P6LJMA8dczg
 wlpqQoJ8sGRUKbc4HblYMTbSXb7eArvW2hm9Tntvl+A5Gadl0cXMn7Ony9O+bLxnTp0YbRbw6ly
 NnMEhjjnq7ln1U4f7Un519/LR9aRXy7wZxFLWeT8RHrjkPIYJj4VHmTQxj4reqJ4elOTnwOiWbY
 +jEauo5tlsYcww1tpV1KC+k4+CQ0cH0KdZPvlUpAXZJkm02t+tKrtBYEfohKA+Qbpdf0nfEMhvn
 rShKnGGqC9KO6EeixmhkfZ/neHHnscvIrCF7UfrDpi/R0rbf9ziHbf5QUk3y0eaVcNGHEPUaveA
 AxY4Kj+2I0P0Pb0hwORfSZeJCrAAvqn75AzGTAUlTJ47JFR3CZlHSU7f5NFfzTB1M/VnzdjeviG
 3B2eYevLOTLA1NcpwkBIzm81/NpibA==
X-Authority-Analysis: v=2.4 cv=ed0wvrEH c=1 sm=1 tr=0 ts=692afd05 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Q5gdzY3N6a2DZr8aCz0A:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290113

Several functions in topology.c receive pointers to 'struct
snd_soc_tplg_vendor_array' and 'struct snd_soc_tplg_private', and do not
modify their contents.  Constify the pointers for self-explanatory code
(pointed memory is not modified by the function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 70 ++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5d138a956ca8..748a3b7fa78d 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -206,15 +206,15 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 	return mod;
 }
 
-static struct snd_soc_tplg_vendor_array *audioreach_get_sg_array(
-							struct snd_soc_tplg_private *private)
+static const struct snd_soc_tplg_vendor_array *
+audioreach_get_sg_array(const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_array *sg_array = NULL;
+	const struct snd_soc_tplg_vendor_array *sg_array = NULL;
 	bool found = false;
 	int sz;
 
 	for (sz = 0; !found && (sz < le32_to_cpu(private->size)); ) {
-		struct snd_soc_tplg_vendor_value_elem *sg_elem;
+		const struct snd_soc_tplg_vendor_value_elem *sg_elem;
 		int tkn_count = 0;
 
 		sg_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
@@ -239,15 +239,15 @@ static struct snd_soc_tplg_vendor_array *audioreach_get_sg_array(
 	return NULL;
 }
 
-static struct snd_soc_tplg_vendor_array *audioreach_get_cont_array(
-							struct snd_soc_tplg_private *private)
+static const struct snd_soc_tplg_vendor_array *
+audioreach_get_cont_array(const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_array *cont_array = NULL;
+	const struct snd_soc_tplg_vendor_array *cont_array = NULL;
 	bool found = false;
 	int sz;
 
 	for (sz = 0; !found && (sz < le32_to_cpu(private->size)); ) {
-		struct snd_soc_tplg_vendor_value_elem *cont_elem;
+		const struct snd_soc_tplg_vendor_value_elem *cont_elem;
 		int tkn_count = 0;
 
 		cont_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
@@ -272,15 +272,15 @@ static struct snd_soc_tplg_vendor_array *audioreach_get_cont_array(
 	return NULL;
 }
 
-static struct snd_soc_tplg_vendor_array *audioreach_get_module_array(
-							     struct snd_soc_tplg_private *private)
+static const struct snd_soc_tplg_vendor_array *
+audioreach_get_module_array(const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_array *mod_array = NULL;
+	const struct snd_soc_tplg_vendor_array *mod_array = NULL;
 	bool found = false;
 	int sz = 0;
 
 	for (sz = 0; !found && (sz < le32_to_cpu(private->size)); ) {
-		struct snd_soc_tplg_vendor_value_elem *mod_elem;
+		const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 		int tkn_count = 0;
 
 		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
@@ -305,13 +305,13 @@ static struct snd_soc_tplg_vendor_array *audioreach_get_module_array(
 	return NULL;
 }
 
-static struct audioreach_module_priv_data *audioreach_get_module_priv_data(
-		struct snd_soc_tplg_private *private)
+static struct audioreach_module_priv_data *
+audioreach_get_module_priv_data(const struct snd_soc_tplg_private *private)
 {
 	int sz;
 
 	for (sz = 0; sz < le32_to_cpu(private->size); ) {
-		struct snd_soc_tplg_vendor_array *mod_array;
+		const struct snd_soc_tplg_vendor_array *mod_array;
 
 		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
 		if (le32_to_cpu(mod_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
@@ -334,10 +334,10 @@ static struct audioreach_module_priv_data *audioreach_get_module_priv_data(
 }
 
 static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
-						       struct snd_soc_tplg_private *private)
+							       const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_value_elem *sg_elem;
-	struct snd_soc_tplg_vendor_array *sg_array;
+	const struct snd_soc_tplg_vendor_value_elem *sg_elem;
+	const struct snd_soc_tplg_vendor_array *sg_array;
 	struct audioreach_graph_info *info = NULL;
 	int graph_id, sub_graph_id, tkn_count = 0;
 	struct audioreach_sub_graph *sg;
@@ -392,10 +392,10 @@ static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm
 
 static struct audioreach_container *audioreach_parse_cont_tokens(struct q6apm *apm,
 							 struct audioreach_sub_graph *sg,
-							 struct snd_soc_tplg_private *private)
+							 const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_value_elem *cont_elem;
-	struct snd_soc_tplg_vendor_array *cont_array;
+	const struct snd_soc_tplg_vendor_value_elem *cont_elem;
+	const struct snd_soc_tplg_vendor_array *cont_array;
 	struct audioreach_container *cont;
 	int container_id, tkn_count = 0;
 	bool found = false;
@@ -437,7 +437,7 @@ static struct audioreach_container *audioreach_parse_cont_tokens(struct q6apm *a
 
 static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *apm,
 							struct audioreach_container *cont,
-							struct snd_soc_tplg_private *private,
+							const struct snd_soc_tplg_private *private,
 							struct snd_soc_dapm_widget *w)
 {
 	uint32_t max_ip_port = 0, max_op_port = 0;
@@ -447,8 +447,8 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 	uint32_t src_mod_inst_id = 0;
 
 	int module_id = 0, instance_id = 0, tkn_count = 0;
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
-	struct snd_soc_tplg_vendor_array *mod_array;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod = NULL;
 	uint32_t token;
 	bool found;
@@ -622,8 +622,8 @@ static int audioreach_widget_load_enc_dec_cnv(struct snd_soc_component *componen
 					      int index, struct snd_soc_dapm_widget *w,
 					      struct snd_soc_tplg_dapm_widget *tplg_w)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
-	struct snd_soc_tplg_vendor_array *mod_array;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod;
 	struct snd_soc_dobj *dobj;
 	int tkn_count = 0;
@@ -660,9 +660,9 @@ static int audioreach_widget_load_enc_dec_cnv(struct snd_soc_component *componen
 }
 
 static int audioreach_widget_log_module_load(struct audioreach_module *mod,
-					     struct snd_soc_tplg_vendor_array *mod_array)
+					     const struct snd_soc_tplg_vendor_array *mod_array)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	int tkn_count = 0;
 
 	mod_elem = mod_array->value;
@@ -690,9 +690,9 @@ static int audioreach_widget_log_module_load(struct audioreach_module *mod,
 }
 
 static int audioreach_widget_dma_module_load(struct audioreach_module *mod,
-					     struct snd_soc_tplg_vendor_array *mod_array)
+					     const struct snd_soc_tplg_vendor_array *mod_array)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	int tkn_count = 0;
 
 	mod_elem = mod_array->value;
@@ -719,9 +719,9 @@ static int audioreach_widget_dma_module_load(struct audioreach_module *mod,
 }
 
 static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
-					     struct snd_soc_tplg_vendor_array *mod_array)
+					     const struct snd_soc_tplg_vendor_array *mod_array)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	int tkn_count = 0;
 
 	mod_elem = mod_array->value;
@@ -754,9 +754,9 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
 }
 
 static int audioreach_widget_dp_module_load(struct audioreach_module *mod,
-					struct snd_soc_tplg_vendor_array *mod_array)
+					    const struct snd_soc_tplg_vendor_array *mod_array)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	int tkn_count = 0;
 
 	mod_elem = mod_array->value;
@@ -780,7 +780,7 @@ static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 					 int index, struct snd_soc_dapm_widget *w,
 					 struct snd_soc_tplg_dapm_widget *tplg_w)
 {
-	struct snd_soc_tplg_vendor_array *mod_array;
+	const struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod;
 	struct snd_soc_dobj *dobj;
 	int ret;

-- 
2.48.1


