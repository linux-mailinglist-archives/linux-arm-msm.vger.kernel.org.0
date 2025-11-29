Return-Path: <linux-arm-msm+bounces-83864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF41C93EF3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 948793A764A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8C330FC37;
	Sat, 29 Nov 2025 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhmr9Ocq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3wEdRzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793E930FC17
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424971; cv=none; b=diLmYlOyZ4HzrZKHqH1ZMkSbPU9k7bCs2BMFYD2yq6gxhUeoxbcYscJbx3Bwa/COAirWg+J/Ml8fd98GXl29Rd4mvhrOpX5KMcbCpmc02aeUkVJIS5XZjWPKctOnYLm19nC0gcF00FNeXzMOGBIVAe1+NKNijdbiVks+X5s0gSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424971; c=relaxed/simple;
	bh=+iLHjHQTVG2OHhst/G5TPG9xLkVHknKVmtTUh2+jk7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koYhreh9rveEg4zZzdd9PV5Ew1CLx1EuQBRcuomrAjeNomisFUj+Yi6238yZO+R44f+YvTuo/4qkQNv52dNm516Q+WxO0lgCaDT1H5Sxy9J13pEoPiFsPTlXKma/vwzUZV0zrsq4LXvxDz7sHAtZlyd+M5I0Qe4SPz2QobDJsvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhmr9Ocq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3wEdRzT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT6w6A32694689
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9TUauSfE+BDA3yQ1ZnIIquvI0/o5pt0Z5i1/L96zdw=; b=mhmr9OcqPkWlUmWQ
	I9aW+YiHT5LfLJoW2NouwE9djWjZa3Rm3HPulJWISLYxS2FnZ16+4HftgFkDWmHR
	tCsSzhDX5Jy1xFQnRbN8QK3OU2f4QlybB0YnRyIvqqmr4NAB5GrL4Or6uHYa1bFn
	1qxMUpOW6wA9bPe7G0nd2wMEyuw2QTnEQvXfYfGgwHA85n4f2cgu5DEUPRSU5RdK
	KmKpVg6bKbz95zPVkoXQRTBtxeLkrUmkVknzF9S/NBTt22kTxGc8n+Ww1HTTW+QF
	8YInvXxOUCxWbbpJdz45PDxqYVtSl066n8as/83Iu1e8J0yx9jpAe+qMkdOsObX+
	gP4dWQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqrdygt82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:48 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55b29194c04so1618823e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424967; x=1765029767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9TUauSfE+BDA3yQ1ZnIIquvI0/o5pt0Z5i1/L96zdw=;
        b=i3wEdRzTQc2RAlM+3gBw01VoCxnU9eg4RYU6ztZB3cbaHJ15J1Kv53uuCcT/6VmQbv
         nFZkjzN1DSZI3OR3E/wJd7PUdWCr92cl8AR0Z/QSqLMLHwW9HvYsbvXwtWfs7iaDooLB
         BUIHzhFwvLAlc+AL597YRW75KM2u6aI+vle0YnCZfxQTbheQF4wyK9wViwu1h/PNtYBD
         IXdlEUpUyF0p7ugy2YnKgdORtbGIpwMuQRn/w0b1PGeESLRQ3zk9G4A7MT64BbLC9Dsx
         0gMfs8mCnlFS1h90yjVu+k+hfBIW56qK9rlB2TGHG/HWdor1bh2FYUylzNKVGrVcBeQW
         5Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424967; x=1765029767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d9TUauSfE+BDA3yQ1ZnIIquvI0/o5pt0Z5i1/L96zdw=;
        b=KHbagw2tIt8gLuBbTOH4wFuKGbGLgPKdj0Eiv/hqr0qx12s9z8DYB37y/MWPxfMsnT
         OgiAuvZ9PV6hxZ3GwntttUAqYJrp/wGGvRPpJg4qJKSvXMLyOc4b+eO+aVQmrXEyKFD3
         YoW2/aQX6htk8273pykEnbXv7KTle0PcmPVUDwxUsAJskjfL2hwAxpw93DVG7ssznlP7
         yPBw1qyqCGd8/MtrlIl3NcjVz9ApJbtmG6jEfJGqO5YBdauCGsM2fAOV3P0PllezmJIt
         LiOBQU1xHSVfHk2GNp13nKFF/WyZghtxWX9V7MVZemwl+PODdZjuqbaAxsIXpOaFGcU5
         HiMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8JUf3YeoWz3XuBMEsj7JsTTaYp3L+LduZBy+Mxz8bF3gip73GFZL78uaF0QSo/kAbTd79gSU9loHi7Z36@vger.kernel.org
X-Gm-Message-State: AOJu0YyYiNMAwIGXvp7Cb3h3uSqT+5oq/l6ODRZrRQDIu0INHXoQuWGB
	gI4PC+0AgBBUaTUJdmRFy+y3qoaS4V5+OlaD8XnFrOOEof89pdKf56sOXJ0iFgdRPOzjdqbTmyy
	PkTUU3Ltz/Ze6CjAGfu+kAt6o1qFXE9/ZftilEkc7Exi5PMvmbtYIuk0MbM0FUtucRns+egZCHT
	i3
X-Gm-Gg: ASbGncswFYTl1gCyVBFPXIQYvD5DOf8WM0iz+TLcGJIzT5meh2sTsEfjEhcnjmq6p+a
	w7xgP4OL9r5onaa6VbmGYmlFCxLuqTPutqXr/6yNBsMqB4oPLJdWkKkH7b7aelQjO11/dOQC9q3
	W/1FXJsGYlb3HJ61YdNEEYJOThtOOs/KGBtXrhQYGcHISL7/jcfK7EXCwFM5QPiPL0e9btMNiY3
	kEB/YmQmFjifzcwnwdc9nXGayKt5DCx1R/JM1Nb21FWM2RcPY23Oz9ki8RXFBfPJLY5xqVhKoqU
	O3TPmhSexmmx/YNAKIB1pHxb47o8tsSbpMvtx7D9QX2BQZuggcukuFCcUmKIeM991MSCfGokd8r
	smduq0330ULyzCPDy909I9c+Bmfq+8RRYig==
X-Received: by 2002:a05:6122:660a:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-55b8efff034mr11931512e0c.16.1764424967257;
        Sat, 29 Nov 2025 06:02:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh/+rd8LU3yrULl6C1sddPFZUT/Z4RMrXEJpzXlKo+59MeEJ9akiHD8aNXFDZ8rNQnGnnPTg==
X-Received: by 2002:a05:6122:660a:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-55b8efff034mr11931406e0c.16.1764424966661;
        Sat, 29 Nov 2025 06:02:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 15:02:34 +0100
Subject: [PATCH 4/6] ASoC: qcom: topology: Constify pointed DAPM widget
 structs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-4-67a3d3320371@oss.qualcomm.com>
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3456;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+iLHjHQTVG2OHhst/G5TPG9xLkVHknKVmtTUh2+jk7w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz8G6l6zvGWOyuBEr91udwVM26vpsSxAWySv
 T+R7RdaBuaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8/AAKCRDBN2bmhouD
 19tJD/4g9FSnPGuog3x6JWd08Ifl5r6zvP9C18FRQz/hoxNttZBoDbITbubDp+zJdgRsqEzr5eM
 TNouP1TPoueluOTr0KCe2s3qFkBZquNq4UvSVKCxeEeyj+6mfKvXBVmpYsiq92RBBVcorcdZaGL
 R1fTnAMx1OpZms9bf1dr41Of94HYxZjOQ7aFWqlMv9Ri5Sbu17iNbCqO3iiJ6uuT/d/zv7iar71
 0gvvyk0awfGUS4i4C57THucmzcXEwGzpsaD6X3LgB6/uTDEehtr6rkaMQlmx+obRHCi4jfxW4zD
 v8JOZqmcFzBPemiuX5dGkHkwfuzUgdRCbbUTh8ogL/Of9CYogbKvOHJ5bmt5kdI8bDlKr4POyZq
 yTGyRHpvGt1RsJaRd1YSc1OyRnCYN/hGb5PINqvvlbTTfdN+Pt5Rbih7HWlJAQoqQWKedbefMBX
 jNbGVN+f/+ECi5ylyDgV8uurhXSfL5znGhwVFAcKla5HCU9yAy+4hbMT/5TWRt83rAZFK3sbpPE
 yseitaZWASc7iHpTQObHRpklGPvF2gZMNgxkF05qXA6s5VuNpqQs0Jp25lht3pS89TIViZJVWsc
 WEkIJTnyCazlL6fIismdep8NXjBq6Eu9E3Z0F4XWwjuMaeJwZsAqL93DRDzVMd3DrZ7b2SZRaiL
 xTa7L8I8lt+ePqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Qua_nblhv_itm4hG0uMa8ym3WG11lQ1_
X-Proofpoint-ORIG-GUID: Qua_nblhv_itm4hG0uMa8ym3WG11lQ1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfX0Amtv2N+0Z0M
 L+thchYEyFzpe5zZlYZRS6pvFmlcYCK19qYURBrmfk1O9yWfP0Aja7qVkKDTHQgRAirOqYe+zAa
 tSOSVHgfdyOdedCzOx+hEXzoi1joeyVVEnIeMaM5aoz8IHU3vDeXI9Lupulf305rlw5a0Z1sti3
 zwPduLBeH+cCQb+I/2xvcsDrQOkx5yLI0jqBcVA3RredQHoxGvladnzuHa1wU4CEb4B1gxDOGSD
 0/Ygn5N2Op9xxq1EX6nskZTPS1MM4epZ0vKAHcRzgiM8oxFvgpaKs2g58mkgY4Us1IyCnS7oxbT
 CzlnxeJQnhpP4P0eUd35jJ6dAfOZdURH/SM7nYg8sqPxbiauLl4VQFrLzmdrMigCO9kyCl/H5Ne
 fFoM+xaeVXC4JR2MuUBj/yqgCjpw3g==
X-Authority-Analysis: v=2.4 cv=ed0wvrEH c=1 sm=1 tr=0 ts=692afd08 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=p4u2xNunYncVunGlIlIA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290113

Few functions do not modify the pointed 'struct struct
snd_soc_dapm_widget', so the pointers can be made as pointers to const
for self-explanatory code (pointed memory is not modified by the
function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 67d3147caf62..fdf144461cfb 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -947,7 +947,7 @@ static int audioreach_widget_ready(struct snd_soc_component *component,
 static int audioreach_widget_unload(struct snd_soc_component *scomp,
 				    struct snd_soc_dobj *dobj)
 {
-	struct snd_soc_dapm_widget *w = container_of(dobj, struct snd_soc_dapm_widget, dobj);
+	const struct snd_soc_dapm_widget *w = container_of(dobj, struct snd_soc_dapm_widget, dobj);
 	struct q6apm *apm = dev_get_drvdata(scomp->dev);
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
@@ -1144,10 +1144,10 @@ static int audioreach_get_audio_mixer(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
-	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
+	const struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
-	struct snd_ar_control *dapm_scontrol = dw->dobj.private;
-	struct snd_ar_control *scontrol = mc->dobj.private;
+	const struct snd_ar_control *dapm_scontrol = dw->dobj.private;
+	const struct snd_ar_control *scontrol = mc->dobj.private;
 	struct q6apm *data = dev_get_drvdata(c->dev);
 	bool connected;
 
@@ -1167,8 +1167,8 @@ static int audioreach_put_audio_mixer(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
-	struct snd_ar_control *dapm_scontrol = dw->dobj.private;
-	struct snd_ar_control *scontrol = mc->dobj.private;
+	const struct snd_ar_control *dapm_scontrol = dw->dobj.private;
+	const struct snd_ar_control *scontrol = mc->dobj.private;
 	struct q6apm *data = dev_get_drvdata(c->dev);
 
 	if (ucontrol->value.integer.value[0]) {
@@ -1204,14 +1204,14 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 }
 
 static int audioreach_control_load_mix(struct snd_ar_control *scontrol,
-				       struct snd_soc_tplg_ctl_hdr *hdr)
+				       const struct snd_soc_tplg_ctl_hdr *hdr)
 {
-	struct snd_soc_tplg_vendor_value_elem *c_elem;
-	struct snd_soc_tplg_vendor_array *c_array;
-	struct snd_soc_tplg_mixer_control *mc;
+	const struct snd_soc_tplg_vendor_value_elem *c_elem;
+	const struct snd_soc_tplg_vendor_array *c_array;
+	const struct snd_soc_tplg_mixer_control *mc;
 	int tkn_count = 0;
 
-	mc = container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
+	mc = container_of_const(hdr, struct snd_soc_tplg_mixer_control, hdr);
 	c_array = (struct snd_soc_tplg_vendor_array *)mc->priv.data;
 
 	c_elem = c_array->value;

-- 
2.48.1


