Return-Path: <linux-arm-msm+bounces-83866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCEAC93EFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 30F804E240A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164B13101D8;
	Sat, 29 Nov 2025 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYDsKK1I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsqwdtTy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5B830FF2B
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424974; cv=none; b=crtX50byREasFXHRKPJcFHgqfS4IBtCjsZG3uu8yK2takrZWT9Hkk1JEficlvT/SNrnvT/rMTpEBwPLK3u4bMfuR3wgDNgE2tzkB1eC2SAErMOfOX+K3C6evdF+S9prKucowhSxDHGNyp0oeXDrg8gmaZ5h4w1HVfyqrokgzRMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424974; c=relaxed/simple;
	bh=04Cuzfw2VebojgKd6eyQKbYS1AlTlbnBKerDpdGfCVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mq1TNkK7+vZJIBwJOd5/vkRJg0KaJOhYtxAvaKDHGDFPK0YoWoAP5M9zlKIU02eOkGSUrrWOJ3R86ViiGJ7KLMaE5n12CwChYm/lQ3EsL8z9pa09HwAjygTXYLSw1htUyA1r4HX/4w5xURJoIwkOg+QmVi9Sd3xNQkxsd3mNkAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYDsKK1I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsqwdtTy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT1nN8F1927457
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chsUriZQjNSkeOnAsLUFF4NtiQ/KxNIXFA294gdeF3w=; b=VYDsKK1I6B7wKo9c
	azMvTz5PCT837lyUrip1d++VSN4Bw7eG/zvKlx163ukhOIBAaBpgSakgW61CmGJB
	thYbluHRMqXj4TvG8NOVFWIykO4HMW+0gZRJ0BSHFlLnv6yLFoqMU3KwY3u+2yvO
	77CwtRexY706jeb/O3HjpI3VN4myD9MUegvhnzDJPwbUBbLOqdh7qPxB0NX91Omk
	fpD+IYKKEPu9vBdpcp95Ihk4Rvst3EQG53647b5nUSplLPKE4vAzl8mMM8YvvmML
	bKOUEktAD7euGz+bYQyGujW3z05FK1dedlDslLQJvfEm9ps3fH5Pa4pnhhQfw2gJ
	H1qyWg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqp6ph06j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93516c335c0so1004523241.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424970; x=1765029770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chsUriZQjNSkeOnAsLUFF4NtiQ/KxNIXFA294gdeF3w=;
        b=QsqwdtTyQyHe9XDYv2p1gb39xx7ba93ANg/ob9iQzrEQytwopSTQUSMvoIaq1Z8Rab
         /9+XqSR4Lb/3OVfoVHDqJKEV9rTj2FgVUlmSLnHCb250xheGbgLYcoP5bd+YIKlRQha/
         htiTKbYqT+z5vp+KOSciUEsiMdbsywxyWzeT2uanpVskSdtwH4dxqMRW4VUuCJCsgM42
         2Zk3GGMoY8A4+VvBX7gZSaSxMs87SCiXRVhp0WyU0nFY+41UWBtSzwz6owVLfcwSd6U3
         eC2cNN6ifdg2LF69LuHAJdanezkFHgQiQR0w8KgSAuW+1kMvJeexLA7brzqyFmGDuYu/
         Iq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424970; x=1765029770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=chsUriZQjNSkeOnAsLUFF4NtiQ/KxNIXFA294gdeF3w=;
        b=gF4jldaY3GfaJw6/4VYAuQVpffKLaqdwbPfgZ+m/GRtczVUXa9cSNfgj9nUPyTyfyr
         iLzln/19GFl+oiWNIOV2u/AU1lZrjCWS0cXIjFIadA5fy/sIF1cm2F6pcEuxsijBhj99
         p7Lae2w98Baplk3MvaGRzZu39eRZpAJxGDmvF2isSnjB9/9opyb+DEjNy+X0xaBN5X4G
         AbWxEFG9vGplOI+tTVZKMrQMRIYKR5OL3f0bDzApbR1GEvoah6n4SLxUG6vCdO8sV/PR
         M+BTV0HZWrNx0upwsiopsPCGgDn9KY8fHWE6YXURrjJfa7fTAaIu1ZmmSYR7F/UYVnip
         Yt6g==
X-Forwarded-Encrypted: i=1; AJvYcCXlNd0FIzh9Q6eSBG6ESFATcXnFQbPC5rFiqet94JYjWLTSsepzVu1iTHwGOnJLPGR1XzaTbAaRxk89c85q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8vYKcGqTiv/wXsIpVgP+APpNEnM1bQXzFEotLcb3hiF6KpeZg
	J1WGeTdK2iOLVVOY5FrGVGjZpKPOkbRH4+hU0xQJDawDnUeOxypvFheI38z6Ib0hYf8iM+wpAIe
	SAk33a14nzRhyfKJXRx7Ovd32K1DnNYA3uw75A1hYnQaTdkjXbGUcFftu3IAuDbAniRIu193RHp
	1Z
X-Gm-Gg: ASbGnctCaTABzqbU0X5oixnYg6DjttA8bPcdhuFHr0st19LVjrT/VFqb0HsdNgCUliu
	1TSafEUiV+kVqGWlYka1dfvbTRjokq6AjHapSATPnBnhO8kFzl2qkOQ6JnD5DSo33fQegmBv1Cu
	wU3NKwF235caJ0rgM7X6BoznomOKeQwm/6LTPXjTLbuK81xUdyoSJSffyHLTQkhJjF2mc4B5Lu4
	bUkGB+F5uGhGuDXmt63IoN1KPSS68Qb05SiW49vYBS+fIh9+KJb9AbTuWQ8Wz6203r1oUCV5VUj
	eSqwQwm0qPyeRjvZCoMivJe+06XeIQoyD31b0lPXI9sSNuXEfRWkzHP+HNEfVD+fkFOprGZojgc
	IFNMm7t1EFBceo6p/c+MplkDvuthZMzAPtA==
X-Received: by 2002:a67:e70b:0:b0:5db:debf:6587 with SMTP id ada2fe7eead31-5e1de3a362emr11515982137.32.1764424969979;
        Sat, 29 Nov 2025 06:02:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUR9LqBywY4z/kAMEy2Z6mMHSf5z1syGuTBAXiFS+dSVmgg2z7MV138CJRLhEyg4ZlRAEhNQ==
X-Received: by 2002:a67:e70b:0:b0:5db:debf:6587 with SMTP id ada2fe7eead31-5e1de3a362emr11515922137.32.1764424969552;
        Sat, 29 Nov 2025 06:02:49 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 15:02:36 +0100
Subject: [PATCH 6/6] ASoC: qcom: audioreach: Constify function arguments
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-6-67a3d3320371@oss.qualcomm.com>
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13351;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=04Cuzfw2VebojgKd6eyQKbYS1AlTlbnBKerDpdGfCVc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz+6iyJw/q6kb9l4FtHtjc60xyvrLffvqFv8
 AhTZaZcvLqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8/gAKCRDBN2bmhouD
 12HED/0aWK70Zd5tNq6my6TZR4QWKrGaMRbQsS1eZtgSWeDC65vzNUV/yDja8ULgCds+yWGm5Km
 R4Tb+dLtRoGJWA+FIz1J/RktnErrmnL8GSedCZECq/XmmPlsLznpdRycOrmf/qlnxPtuJvl+0GU
 19Im6Xf8qmH6MM8GL/VKKWCIepSUkUmcLtZY/oLX9h3KCPkA/r3CVl5Tsi9HhAyNbpfG9ksypbp
 7EpWgWp6UA9+Cs1ybkqi0D6Nvku0Py+3GzaaP1y4sPB/4+AM/SADyMgP1zIa5t+R0dHVhDFtiRP
 jWLHq2YOsh6+RX6q8vJcjJV2LB/9doZduQbZi1OTh/FCubm/zEvAR53wg5lAp7DXQyCJRgkjEh/
 hZ7V35j+7Ux8GKD36iakK8Hm3uBUDCN+7XMZz9i7a9AAkv6Y5xKnG55QG6xo3mW0s/K9tD68ct0
 W1H5i7oaMfojKcHDRZkYJjO1F7rxlVUHPz5obWrTA+4MhWa/Enm+fqCD/w2ge/x8tFEBBffwy4J
 mgjPvXF7Ddp4XwUrqnUYXkQYK+ScHeE2Qi205sf0hSL+pGQDGELoImJMztfgZllsUQ8yd/ovDn/
 e8Z9wb7XxiBddaGZ87yTQU1kXlg6/9z2FMf/itDw5sFKbzw13jQp4RbHUdJw2y5E1lEyce1+bBZ
 HUcDWzyMF6MUNPA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: vOXhIRmLW35I7qApe57L3moa5M36M2z8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfX89lOVZL0Zbja
 XIbIJ0wLfRIUzqsAYgucPYR3ZcuPyla65TBDaTH09HfbB/umTknHSs1M6LcrCEBBEipe6nac5sM
 rJmxlAjWFY7U1R4JDT2yWPCy4gzh5QHeZVUqvXeUYLW3N6/8O/kDbPqZ/uYWtLz52R6oBvPem0u
 PZmdVNa0PkLsiF9NpUT8/qx+dUaAvz/tF4Dqwb7YybEU9OeoKOvlxydg3rrnlmEDQtj6whgRUdo
 7BQ+F5G6qbYRfAnxUkAqCszQdOdnta5MOaGUzC6QqaKvJ8EyDHncFHtB1TtAj4j8veXphT/zhx8
 yoWA6Kw6eOn+PlZVNLFu8wsv64xVLWOB/NWi6CKpGHwuEGnRPHzNecRDj/Z7k8SkFl0zh60ddGV
 2+BIj7/v4RprDxNY0TYl+Rupx5AiIg==
X-Proofpoint-GUID: vOXhIRmLW35I7qApe57L3moa5M36M2z8
X-Authority-Analysis: v=2.4 cv=KIpXzVFo c=1 sm=1 tr=0 ts=692afd0a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VJuunSxf47HV0C6rKqEA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290113

Several functions receive pointers to parsed Audioreach topology (e.g.
'struct audioreach_container', 'struct audioreach_module') and they do
not modify their contents, but copy their data to send to the ADSP.
Constify the pointers for self-explanatory code (pointed memory is not
modified by the function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 81 ++++++++++++++++++++++-----------------
 sound/soc/qcom/qdsp6/audioreach.h | 16 ++++----
 2 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f3fa0a5b4095..3bb073de03be 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -284,7 +284,7 @@ void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
 
 static void apm_populate_container_config(struct apm_container_obj *cfg,
-					  struct audioreach_container *cont)
+					  const struct audioreach_container *cont)
 {
 
 	/* Container Config */
@@ -314,7 +314,7 @@ static void apm_populate_container_config(struct apm_container_obj *cfg,
 }
 
 static void apm_populate_sub_graph_config(struct apm_sub_graph_data *cfg,
-					  struct audioreach_sub_graph *sg)
+					  const struct audioreach_sub_graph *sg)
 {
 	cfg->sub_graph_cfg.sub_graph_id = sg->sub_graph_id;
 	cfg->sub_graph_cfg.num_sub_graph_prop = APM_SUB_GRAPH_CFG_NPROP;
@@ -336,7 +336,7 @@ static void apm_populate_sub_graph_config(struct apm_sub_graph_data *cfg,
 }
 
 static void apm_populate_module_prop_obj(struct apm_mod_prop_obj *obj,
-					 struct audioreach_module *module)
+					 const struct audioreach_module *module)
 {
 
 	obj->instance_id = module->instance_id;
@@ -348,7 +348,7 @@ static void apm_populate_module_prop_obj(struct apm_mod_prop_obj *obj,
 }
 
 static void apm_populate_module_list_obj(struct apm_mod_list_obj *obj,
-					 struct audioreach_container *container,
+					 const struct audioreach_container *container,
 					 int sub_graph_id)
 {
 	struct audioreach_module *module;
@@ -365,9 +365,10 @@ static void apm_populate_module_list_obj(struct apm_mod_list_obj *obj,
 	}
 }
 
-static void audioreach_populate_graph(struct q6apm *apm, struct audioreach_graph_info *info,
+static void audioreach_populate_graph(struct q6apm *apm,
+				      const struct audioreach_graph_info *info,
 				      struct apm_graph_open_params *open,
-				      struct list_head *sg_list,
+				      const struct list_head *sg_list,
 				      int num_sub_graphs)
 {
 	struct apm_mod_conn_list_params *mc_data = open->mod_conn_list_data;
@@ -439,7 +440,8 @@ static void audioreach_populate_graph(struct q6apm *apm, struct audioreach_graph
 	}
 }
 
-void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info *info)
+void *audioreach_alloc_graph_pkt(struct q6apm *apm,
+				 const struct audioreach_graph_info *info)
 {
 	int payload_size, sg_sz, cont_sz, ml_sz, mp_sz, mc_sz;
 	struct apm_module_param_data  *param_data;
@@ -452,7 +454,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 	struct audioreach_module *module;
 	struct audioreach_sub_graph *sgs;
 	struct apm_mod_list_obj *mlobj;
-	struct list_head *sg_list;
+	const struct list_head *sg_list;
 	int num_connections = 0;
 	int num_containers = 0;
 	int num_sub_graphs = 0;
@@ -605,8 +607,8 @@ int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pk
 EXPORT_SYMBOL_GPL(audioreach_graph_send_cmd_sync);
 
 static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
-						    struct audioreach_module *module,
-						    struct audioreach_module_config *cfg)
+						    const struct audioreach_module *module,
+						    const struct audioreach_module_config *cfg)
 {
 	struct apm_display_port_module_intf_cfg *intf_cfg;
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
@@ -662,8 +664,8 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 
 /* LPASS Codec DMA port Module Media Format Setup */
 static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
-						 struct audioreach_module *module,
-						 struct audioreach_module_config *cfg)
+						 const struct audioreach_module *module,
+						 const struct audioreach_module_config *cfg)
 {
 	struct apm_codec_dma_module_intf_cfg *intf_cfg;
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
@@ -728,7 +730,8 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
-int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_module *module,
+int audioreach_send_u32_param(struct q6apm_graph *graph,
+			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val)
 {
 	struct apm_module_param_data *param_data;
@@ -757,36 +760,37 @@ int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_modul
 EXPORT_SYMBOL_GPL(audioreach_send_u32_param);
 
 static int audioreach_sal_limiter_enable(struct q6apm_graph *graph,
-					 struct audioreach_module *module, bool enable)
+					 const struct audioreach_module *module,
+					 bool enable)
 {
 	return audioreach_send_u32_param(graph, module, PARAM_ID_SAL_LIMITER_ENABLE, enable);
 }
 
 static int audioreach_sal_set_media_format(struct q6apm_graph *graph,
-					   struct audioreach_module *module,
-					   struct audioreach_module_config *cfg)
+					   const struct audioreach_module *module,
+					   const struct audioreach_module_config *cfg)
 {
 	return audioreach_send_u32_param(graph, module, PARAM_ID_SAL_OUTPUT_CFG,  cfg->bit_width);
 }
 
 static int audioreach_module_enable(struct q6apm_graph *graph,
-				    struct audioreach_module *module,
+				    const struct audioreach_module *module,
 				    bool enable)
 {
 	return audioreach_send_u32_param(graph, module, PARAM_ID_MODULE_ENABLE, enable);
 }
 
 static int audioreach_gapless_set_media_format(struct q6apm_graph *graph,
-					       struct audioreach_module *module,
-					       struct audioreach_module_config *cfg)
+					       const struct audioreach_module *module,
+					       const struct audioreach_module_config *cfg)
 {
 	return audioreach_send_u32_param(graph, module, PARAM_ID_EARLY_EOS_DELAY,
 					 EARLY_EOS_DELAY_MS);
 }
 
 static int audioreach_set_module_config(struct q6apm_graph *graph,
-					struct audioreach_module *module,
-					struct audioreach_module_config *cfg)
+					const struct audioreach_module *module,
+					const struct audioreach_module_config *cfg)
 {
 	int size = le32_to_cpu(module->data->size);
 	void *p;
@@ -803,8 +807,8 @@ static int audioreach_set_module_config(struct q6apm_graph *graph,
 }
 
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
-					   struct audioreach_module *module,
-					   struct audioreach_module_config *cfg)
+					   const struct audioreach_module *module,
+					   const struct audioreach_module_config *cfg)
 {
 	struct apm_module_param_data *param_data;
 	struct param_id_mfc_media_format *media_format;
@@ -838,7 +842,8 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 }
 
 static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
-					     void *p, struct audioreach_module_config *mcfg)
+					     void *p,
+					     const struct audioreach_module_config *mcfg)
 {
 	struct payload_media_fmt_aac_t *aac_cfg;
 	struct payload_media_fmt_pcm *mp3_cfg;
@@ -919,7 +924,8 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 	return 0;
 }
 
-int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg)
+int audioreach_compr_set_param(struct q6apm_graph *graph,
+			       const struct audioreach_module_config *mcfg)
 {
 	struct media_format *header;
 	int rc;
@@ -944,8 +950,8 @@ int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_modu
 EXPORT_SYMBOL_GPL(audioreach_compr_set_param);
 
 static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
-					   struct audioreach_module *module,
-					   struct audioreach_module_config *cfg)
+					   const struct audioreach_module *module,
+					   const struct audioreach_module_config *cfg)
 {
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
 	struct apm_module_param_data *param_data;
@@ -1012,7 +1018,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 }
 
 static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
-					       struct audioreach_module *module)
+					       const struct audioreach_module *module)
 {
 	struct apm_module_param_data *param_data;
 	struct data_logging_config *cfg;
@@ -1041,8 +1047,8 @@ static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
 }
 
 static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
-					   struct audioreach_module *module,
-					   struct audioreach_module_config *mcfg)
+					   const struct audioreach_module *module,
+					   const struct audioreach_module_config *mcfg)
 {
 	struct payload_pcm_output_format_cfg *media_cfg;
 	uint32_t num_channels = mcfg->num_channels;
@@ -1088,8 +1094,8 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 }
 
 static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
-					     struct audioreach_module *module,
-					     struct audioreach_module_config *mcfg)
+					     const struct audioreach_module *module,
+					     const struct audioreach_module_config *mcfg)
 {
 	uint32_t num_channels = mcfg->num_channels;
 	struct apm_module_param_data *param_data;
@@ -1145,7 +1151,8 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	return audioreach_graph_send_cmd_sync(graph, pkt, 0);
 }
 
-int audioreach_gain_set_vol_ctrl(struct q6apm *apm, struct audioreach_module *module, int vol)
+int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
+				 const struct audioreach_module *module, int vol)
 {
 	struct param_id_vol_ctrl_master_gain *cfg;
 	struct apm_module_param_data *param_data;
@@ -1170,7 +1177,8 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm, struct audioreach_module *mo
 }
 EXPORT_SYMBOL_GPL(audioreach_gain_set_vol_ctrl);
 
-static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_module *module)
+static int audioreach_gain_set(struct q6apm_graph *graph,
+			       const struct audioreach_module *module)
 {
 	struct apm_module_param_data *param_data;
 	struct apm_gain_module_cfg *cfg;
@@ -1192,8 +1200,9 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
-int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
-				struct audioreach_module_config *cfg)
+int audioreach_set_media_format(struct q6apm_graph *graph,
+				const struct audioreach_module *module,
+				const struct audioreach_module_config *cfg)
 {
 	int rc;
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index d1b60b36468a..3b7d9bca4820 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -792,8 +792,8 @@ void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token,
 void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
 			   uint32_t token, uint32_t src_port,
 			   uint32_t dest_port);
-void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
-				 *info);
+void *audioreach_alloc_graph_pkt(struct q6apm *apm,
+				 const struct audioreach_graph_info *info);
 /* Topology specific */
 int audioreach_tplg_init(struct snd_soc_component *component);
 
@@ -809,13 +809,15 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_
 int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
-				struct audioreach_module *module,
-				struct audioreach_module_config *cfg);
+				const struct audioreach_module *module,
+				const struct audioreach_module_config *cfg);
 int audioreach_shared_memory_send_eos(struct q6apm_graph *graph);
 int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
-				 struct audioreach_module *module, int vol);
-int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_module *module,
+				 const struct audioreach_module *module, int vol);
+int audioreach_send_u32_param(struct q6apm_graph *graph,
+			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val);
-int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg);
+int audioreach_compr_set_param(struct q6apm_graph *graph,
+			       const struct audioreach_module_config *mcfg);
 
 #endif /* __AUDIOREACH_H__ */

-- 
2.48.1


