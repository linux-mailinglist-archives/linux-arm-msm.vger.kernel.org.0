Return-Path: <linux-arm-msm+bounces-85866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD18CCFE7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD72C30F2BEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FB333556D;
	Fri, 19 Dec 2025 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdfaNgmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5P0sMfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95068335065
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144766; cv=none; b=kttX+oAFF/WmP2x5s1fHuWE6wPj3FQ/U50uncGOc/CSMOniBRVx4huNdWCUsmqD/iMOL/i9alfyA2DEG6Ac5+XdcG6oQU6+CQW0YhsokxLBHhF9wVeNLO1fe1NRMjkptTqqNzeBeUJqsIwx+9ZNS3JzFSRMPP0lFjcsqGpRwmks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144766; c=relaxed/simple;
	bh=51m58wrUvNztZ8MT0/cSt6uzg7b+F+0zxCibYMTfOi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCyHg7VRfaoBZRzsnZ2/ysA2Gp+dbkxqjK65KQa1UsgZvtA+dK+8xwB+2wID1petwYNucXmQ8qjFiXotC9WS0fq8MVtf31ZwX2/in9GQ0Cn/4dy3oXcIHw8E+VK5dh3+cX4qLpf1BfJjzjdPmFCi4176QNqfAjSPfv3F1vjjcPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdfaNgmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5P0sMfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBb5T34101075
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	giYCXInr3PCxoTXokn2gBk5kNRjDWGpv297jdyI161g=; b=EdfaNgmm84N69zv0
	5qkhCNsOWZYB6JEb0uSlzqzcOqkQ7rDijP74I3M9PzImGM95ZM3izUWy9HSpLSgP
	UfkkGkHC9UEt+S94SJrrWSX8GL4L7eKacyptBn8lhC1ixf155y6I8C/z2A6n4XdZ
	OdT6PGLfQMDIdxSdbj58h4zk3u/T7ZGw+rq0CIyaGHeSEyz3DrBMRHV3v7YIZf2/
	Y3gWKdD5wR7bFCaeeKIZ1Bc7mYV/0R+tPSkUeqcJxjc107JZokj+4uK1ncthpKQd
	0uAxCtm5jWFqqGgWB0Xyon5L2t1bKM2ugWMkyHYrq1zZy0oKyP5ROXpCwhwr231l
	cVV8mQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2gxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:46:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so37787951cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144763; x=1766749563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giYCXInr3PCxoTXokn2gBk5kNRjDWGpv297jdyI161g=;
        b=M5P0sMfsnT72I3kSOmwwSG4q2k+210puqH7vDn9rGlWLaP+APKplZPPieZIsnSlQA+
         a9idyPndlue60mIbq6ta6i5KnQQ+LiAqPxtWMl6HJOrJh84ws6Q/fHkMHlwz8RnpX5rQ
         sia3Jt2z40k37uIdQ85uBha0cSK3vdO94uYBCMZB6gb3DMrn6q8WRDTfFL07Z5XUFUBN
         m3j3oXpbEUqWuGvT2s4mUY1iQSFaz2w9/1oxGJCd0gbmm5GRIQ8a/aJ7fVRSt+7qlolb
         h9eCORQhjAxoQGMpavqDUEmRQadiYgkGiv2uAR5xRc2D3VWXw73xyOorjhg+GiW4inTu
         xTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144763; x=1766749563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=giYCXInr3PCxoTXokn2gBk5kNRjDWGpv297jdyI161g=;
        b=NFNq8t7XjEH9XTs1Sj5amHmAQeBPcfftqsl8F/hxDGFdVgmCOhBoFJP7nJmAyvUIZV
         XC10TvXKIv7VEILtbGXSHs6ECOQGNh1lOxQ+8YqmrsQ969clEF8/KUZ/hkyroXe5wv5Q
         74pOwSPhhH10lmxglxrqw77q+NcPhCN+GBOOL9clxXSBg/fFdx2YXO4M+wg+N/ecI5iT
         wsYshZxSeXmuyQ7UYmyZXJLHxrkvUBYO+m22v+zRwmCBw+pS9oIbQVagUHM0iAM9w/4R
         mhvAPWa3cA8fAHmMTCs8P5tJvcDWa25MmWeN6wV/0qe6P1k9sBqB5UYYbx11sSKCwEDx
         tn8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZcj+Uo//mm1fPky75HUJI2/3ctSqiiXSYjB8v77djaLQRnypP8Y3uxYa87kVko+r0Q6cqd/BjMU9C0Tdq@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbvkWGTYKpWNSsdIwCIw0jMx0hecx2xGs03uWfoavbURC7ybM
	MMd3B4jZptIsm26bXx3iAaFr+jM1on+zlblDDpnMDeAdr39a939AdmUW5xU5Ft1NMX2/hzQas3j
	LwKFV6Hoob6vhVNnAXbjqeG8Da2qA4un3iWuc8Ms245fwzwNX9eN7LPiQL/JpSsdMxvuP
X-Gm-Gg: AY/fxX5WO1oFxIMajlj0qwBRtMCSSStviBULpDKPdZHB2KlM9uuzyTjJDSLQV5C2OXY
	2FTgyoSwsfY3+yjBU8S4hkpHNVCH18BvSV7QDW4R+8WI5ZzUbPPRrfni6gl2zKJ+JYguk9cgG5l
	bMwd+WmYGM37Pbm+o98LDIh9aReKHyvQ+C1nB3QOMpgjNCnQ2jEdYWERkZi9p6/EWdSSbQz2m8j
	AfI4/8Xlfdf1qiLxMeiWBCXQc5o7tEmBumgXEV6JljBtfKkbHs3pUnBJXNESMmnBH6vMc3QyXmU
	EkPHmXlbA5//96NdFjGzdcuz25mEuVC0UVAVgbm0Xu0e0sQRHNLJdfLHM+aaY84Yq4QfiKi7XIq
	4kLAbLIVB7IT7xqrW64ZBZpYWV6nCbt2QZV6xuNhPt/YX3Bk51acjxwLRJth53K2NZ6eL
X-Received: by 2002:a05:622a:5e11:b0:4ee:4a3a:bd00 with SMTP id d75a77b69052e-4f4abdc3b6cmr32569381cf.71.1766144762563;
        Fri, 19 Dec 2025 03:46:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbh2GZ/6GRk+auDD2Q/R/Vd9bYqskXY/6+cE24kTZoZrCZOpa/TZKsOpMSMs/b+/9zZN0wNw==
X-Received: by 2002:a05:622a:5e11:b0:4ee:4a3a:bd00 with SMTP id d75a77b69052e-4f4abdc3b6cmr32569081cf.71.1766144762100;
        Fri, 19 Dec 2025 03:46:02 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm1974465a12.25.2025.12.19.03.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:46:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:45:48 +0100
Subject: [PATCH v2 5/5] ASoC: qcom: audioreach: Constify function arguments
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-b4-container-of-const-asoc-qcom-v2-5-05fd2ecc06fe@oss.qualcomm.com>
References: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
In-Reply-To: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=14150;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=51m58wrUvNztZ8MT0/cSt6uzg7b+F+0zxCibYMTfOi0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRTruMTzgiyGeDPofJoqPBy18Sf/2CwpjKnwYg
 mJyUpTYEdaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUU67gAKCRDBN2bmhouD
 13XzD/0T7v+Inrhk5oIiXcafOI4AptIrxeR8gdl7VcbXFTAY5WiML6UOGwfJ7j2JaI8r4ru7liI
 RQQXWKqTQVRQaNvnKlxfBqAr6rVZRbEB4Fu//WTarGiF9fvWbswuYbYzNyiULxgtRO/JLEzWVGM
 P398ErOgn4+rIowEfzkfztMdLmq+FOZsyLPLoTfS2iDIYm+pUsh6khteitZ4H3gKHNnYiHfCyRD
 8XnLfAVk4KiZeo08uNS+vsb0HBgXNXAkIB3wSckSUZvBRgRsJcWlkgJv2d6xdR6WbPHYnQSZwts
 6XsS/u5+ORFfpwd14Q00JfiDAN0cCghDt4LGq8xqOtDvqLZn2mb02/IVzUue3kn7iyk+iCFHRa1
 jLqQNPTJqFGavF5/0sWDRTiDSaT1wvl9dPbM+yjXkMMBtof+D999xiM+9OxsE/ydpJKvuOXYZP4
 Wk6t4+d/Ek7CbksgF1BDT1rKB0tWnc476f4Ga5mUP/So+EvfdGuhUW/D3WO7Zo9wWQdnHmKXkrN
 zYQTJFJgKvHppAVqc7UCZCb6LG10kkFso6A4AqqTjVTFniCxrOpb3QJWBJrfqnIGm+8bP1ZpPuI
 73873XtdruGulNMSzH2eXfUMFIvYCwIaLyVtW7BQXWjOvXwx7UCP4IsS3u+BoyjxEAwaBXumFRJ
 OA2mAw8Wl3l+ByA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NyBTYWx0ZWRfX8Xp8ZP7FAigb
 xfJbQOiE2zwO1VGVV8yHqLixR5PkixfaCZwhs5fGVXiE+mvAFAl+4sskZTsGNX/FJTCHccBcyMU
 pCDAouOb90xwFu7byeG78w+AXK184cFEE4hNX4nEdkC1aIigvfuuEvPMTG3gOmFuO9Lsx7N0VHW
 /ynOr0wwh3OPmO4Xqtmz69bSO+JTKgF8fX27HAKe4E3sudMkf2Yt9xHDTZXOaktexHtt0XoENw1
 EH9BNJwwcyK+DjiG5LEWb6T5ZwJ5q4UFcokrIefTbJD0DBnHEwDMFx08n4jmXTD82PRM6jD/lI3
 nVsqERI+uKQFjsyJlffFp8ZidHwAJ+I2kpa2gGMNFFZcnFNP9AI85+Yb+mpwUOY1TXQg1LFZtKC
 nXrs8OGGVUub6PW1VS/vhPr9ALR8jU59x6eyx7k1RDPhUpjerodMe8qz/pAnpZC2louLuIIdkW2
 0i8UT7ObPm72DXnJPKA==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69453afb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VJuunSxf47HV0C6rKqEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yryvD76KXo-BoUeaWsBJQMoVKnXQIZgY
X-Proofpoint-GUID: yryvD76KXo-BoUeaWsBJQMoVKnXQIZgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190097

Several functions receive pointers to parsed Audioreach topology (e.g.
'struct audioreach_container', 'struct audioreach_module') and they do
not modify their contents, but copy their data to send to the ADSP.
Constify the pointers for self-explanatory code (pointed memory is not
modified by the function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 87 +++++++++++++++++++++------------------
 sound/soc/qcom/qdsp6/audioreach.h | 16 +++----
 2 files changed, 57 insertions(+), 46 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index b28451558974..241c3b4479c6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -309,7 +309,7 @@ void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
 
 static void apm_populate_container_config(struct apm_container_obj *cfg,
-					  struct audioreach_container *cont)
+					  const struct audioreach_container *cont)
 {
 
 	/* Container Config */
@@ -339,7 +339,7 @@ static void apm_populate_container_config(struct apm_container_obj *cfg,
 }
 
 static void apm_populate_sub_graph_config(struct apm_sub_graph_data *cfg,
-					  struct audioreach_sub_graph *sg)
+					  const struct audioreach_sub_graph *sg)
 {
 	cfg->sub_graph_cfg.sub_graph_id = sg->sub_graph_id;
 	cfg->sub_graph_cfg.num_sub_graph_prop = APM_SUB_GRAPH_CFG_NPROP;
@@ -361,7 +361,7 @@ static void apm_populate_sub_graph_config(struct apm_sub_graph_data *cfg,
 }
 
 static void apm_populate_module_prop_obj(struct apm_mod_prop_obj *obj,
-					 struct audioreach_module *module)
+					 const struct audioreach_module *module)
 {
 
 	obj->instance_id = module->instance_id;
@@ -373,7 +373,7 @@ static void apm_populate_module_prop_obj(struct apm_mod_prop_obj *obj,
 }
 
 static void apm_populate_module_list_obj(struct apm_mod_list_obj *obj,
-					 struct audioreach_container *container,
+					 const struct audioreach_container *container,
 					 int sub_graph_id)
 {
 	struct audioreach_module *module;
@@ -390,9 +390,10 @@ static void apm_populate_module_list_obj(struct apm_mod_list_obj *obj,
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
@@ -464,7 +465,8 @@ static void audioreach_populate_graph(struct q6apm *apm, struct audioreach_graph
 	}
 }
 
-void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info *info)
+void *audioreach_alloc_graph_pkt(struct q6apm *apm,
+				 const struct audioreach_graph_info *info)
 {
 	int payload_size, sg_sz, cont_sz, ml_sz, mp_sz, mc_sz;
 	struct apm_module_param_data  *param_data;
@@ -477,7 +479,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 	struct audioreach_module *module;
 	struct audioreach_sub_graph *sgs;
 	struct apm_mod_list_obj *mlobj;
-	struct list_head *sg_list;
+	const struct list_head *sg_list;
 	int num_connections = 0;
 	int num_containers = 0;
 	int num_sub_graphs = 0;
@@ -630,8 +632,8 @@ int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pk
 EXPORT_SYMBOL_GPL(audioreach_graph_send_cmd_sync);
 
 static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
-						    struct audioreach_module *module,
-						    struct audioreach_module_config *cfg)
+						    const struct audioreach_module *module,
+						    const struct audioreach_module_config *cfg)
 {
 	struct apm_display_port_module_intf_cfg *intf_cfg;
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
@@ -687,8 +689,8 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 
 /* LPASS Codec DMA port Module Media Format Setup */
 static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
-						 struct audioreach_module *module,
-						 struct audioreach_module_config *cfg)
+						 const struct audioreach_module *module,
+						 const struct audioreach_module_config *cfg)
 {
 	struct apm_codec_dma_module_intf_cfg *intf_cfg;
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
@@ -753,7 +755,8 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
-int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_module *module,
+int audioreach_send_u32_param(struct q6apm_graph *graph,
+			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val)
 {
 	struct apm_module_param_data *param_data;
@@ -782,36 +785,37 @@ int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_modul
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
@@ -828,8 +832,8 @@ static int audioreach_set_module_config(struct q6apm_graph *graph,
 }
 
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
-					   struct audioreach_module *module,
-					   struct audioreach_module_config *cfg)
+					   const struct audioreach_module *module,
+					   const struct audioreach_module_config *cfg)
 {
 	struct apm_module_param_data *param_data;
 	struct param_id_mfc_media_format *media_format;
@@ -863,7 +867,8 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 }
 
 static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
-					     void *p, struct audioreach_module_config *mcfg)
+					     void *p,
+					     const struct audioreach_module_config *mcfg)
 {
 	struct payload_media_fmt_aac_t *aac_cfg;
 	struct payload_media_fmt_pcm *mp3_cfg;
@@ -944,7 +949,8 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 	return 0;
 }
 
-int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg)
+int audioreach_compr_set_param(struct q6apm_graph *graph,
+			       const struct audioreach_module_config *mcfg)
 {
 	struct media_format *header;
 	int rc;
@@ -969,8 +975,8 @@ int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_modu
 EXPORT_SYMBOL_GPL(audioreach_compr_set_param);
 
 static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
-					   struct audioreach_module *module,
-					   struct audioreach_module_config *cfg)
+					   const struct audioreach_module *module,
+					   const struct audioreach_module_config *cfg)
 {
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
 	struct apm_module_param_data *param_data;
@@ -1037,7 +1043,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 }
 
 static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
-					       struct audioreach_module *module)
+					       const struct audioreach_module *module)
 {
 	struct apm_module_param_data *param_data;
 	struct data_logging_config *cfg;
@@ -1066,8 +1072,8 @@ static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
 }
 
 static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
-					   struct audioreach_module *module,
-					   struct audioreach_module_config *mcfg)
+					   const struct audioreach_module *module,
+					   const struct audioreach_module_config *mcfg)
 {
 	struct payload_pcm_output_format_cfg *media_cfg;
 	uint32_t num_channels = mcfg->num_channels;
@@ -1113,8 +1119,8 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 }
 
 static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
-					     struct audioreach_module *module,
-					     struct audioreach_module_config *mcfg)
+					     const struct audioreach_module *module,
+					     const struct audioreach_module_config *mcfg)
 {
 	uint32_t num_channels = mcfg->num_channels;
 	struct apm_module_param_data *param_data;
@@ -1170,7 +1176,8 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	return audioreach_graph_send_cmd_sync(graph, pkt, 0);
 }
 
-int audioreach_gain_set_vol_ctrl(struct q6apm *apm, struct audioreach_module *module, int vol)
+int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
+				 const struct audioreach_module *module, int vol)
 {
 	struct param_id_vol_ctrl_master_gain *cfg;
 	struct apm_module_param_data *param_data;
@@ -1195,7 +1202,8 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm, struct audioreach_module *mo
 }
 EXPORT_SYMBOL_GPL(audioreach_gain_set_vol_ctrl);
 
-static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_module *module)
+static int audioreach_gain_set(struct q6apm_graph *graph,
+			       const struct audioreach_module *module)
 {
 	struct apm_module_param_data *param_data;
 	struct apm_gain_module_cfg *cfg;
@@ -1218,7 +1226,7 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
 }
 
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
-					 struct audioreach_module *module,
+					 const struct audioreach_module *module,
 					 uint32_t operation_mode)
 {
 	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
@@ -1226,8 +1234,8 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
 }
 
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
-					    struct audioreach_module *module,
-					    struct audioreach_module_config *mcfg)
+					    const struct audioreach_module *module,
+					    const struct audioreach_module_config *mcfg)
 {
 	u32 num_channels = mcfg->num_channels;
 	struct apm_module_sp_vi_op_mode_cfg *op_cfg;
@@ -1304,8 +1312,9 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	return rc;
 }
 
-int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
-				struct audioreach_module_config *cfg)
+int audioreach_set_media_format(struct q6apm_graph *graph,
+				const struct audioreach_module *module,
+				const struct audioreach_module_config *cfg)
 {
 	int rc;
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 03cfd32f1d0c..89f172aab8c0 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -831,8 +831,8 @@ void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token,
 void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
 			   uint32_t token, uint32_t src_port,
 			   uint32_t dest_port);
-void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
-				 *info);
+void *audioreach_alloc_graph_pkt(struct q6apm *apm,
+				 const struct audioreach_graph_info *info);
 /* Topology specific */
 int audioreach_tplg_init(struct snd_soc_component *component);
 
@@ -848,13 +848,15 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_
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
2.51.0


