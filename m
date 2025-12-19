Return-Path: <linux-arm-msm+bounces-85865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679ACCFDD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 349E93009252
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF9A334C2A;
	Fri, 19 Dec 2025 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMTNR4AI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fckq6jvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50433468F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144764; cv=none; b=BmootSt/9jFU6By6ZV7eAH4lK4UyfoPZKQtgedvnzGhE+RtNwxiRCLEP8TNxsindF1JMqIYUg+VSkkRL3Fo0UObKwxj12jGNh3/A6uXJjyQUnBwa5U+4OXnwiDDn7sjw0U5VgwrHjTjwpcxjVL0/Uq/IFccowUPXDBwAgKuXQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144764; c=relaxed/simple;
	bh=1Bo4QM879pRwFDgFh7lx/5RlQhryehFM2iwSnps404Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQuUtuuykZPhb0kP8XJhpLT5scRPRvYPhQmY9qQqQvzgyBOzya7OL1/rohXj4+tZ4tRMaISngn3GV51hXwQ2DfjPmTKNx1JXXXGqLnf/7+54f8A9H5K9R9os8/ASvEsAnKfhnYw/GgMCue4IN2ahNAz3GMncKh2xoGWLAFmLqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMTNR4AI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fckq6jvd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cMTW091962
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1K7dFyjBDDvXEEj7LPdYw1TMzOZ0GDFEUk6AY1+lfKE=; b=KMTNR4AI/HmsWvw4
	rRV0Lep32V7gEsl+1wdmGEKHVrT6/drfjO04JBf7p54uyjD55iNzA3PtnHkqmBmx
	Eu2W+VBKFCzdXRq+DUp7SMQaXyhajcN6vbV8DW9vFGNgeIzvDYgI4k36kw7J0aEI
	ZfiteX2/Z4FhmzgZw0ZObJNv+G+1UwDlbXvIglwOW61voxp6aLsAv//LQakhw1ad
	zHcVHFTQ63zlMP9Bf5cV4QzVovvuO8BoHmQkoRqVzabhq6J28Mb/B1rbS40JvzdP
	/xWRKA/3HlqS5AyV/fsfXjphHc8wHNSdTcgexHIPgh86h9A4V2Zz6FnPo3D3NzqE
	OgFkvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eague-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:46:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88883a2cabbso52657186d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144761; x=1766749561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1K7dFyjBDDvXEEj7LPdYw1TMzOZ0GDFEUk6AY1+lfKE=;
        b=Fckq6jvdsVOZrOaySPWymhpGkWu/bARXvhgIZrCXEMZPgPgnsHfPTfg75HTLjviH4X
         md2i673hxW9clDQgwksAEFMbkv3+BOuAUc2r1ILmvk+afhFsIYFzRiZ2n0+4VBqMEbPx
         WULTXuFRx7l106Fu3Cr5m00OheQ4K6bL6LpTuFjFO8z+DRzY1kz0hfV1wC3Npo85trJE
         dPjrc1QlWSGtNdnM/eXEyRoZrMmLkil0kF/0RQd0Gd4CJ5wbvL4j9yPDM/3WEptYzH9y
         qvM+ElbuUlK2iWtqkCxYtrRjDaL+xiAN4YLdVRVwiRPMt0yJvpOfz7PRnwgqrqzfvlhM
         0BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144761; x=1766749561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1K7dFyjBDDvXEEj7LPdYw1TMzOZ0GDFEUk6AY1+lfKE=;
        b=i8dJJi3MOY/UMhgqZQbfdce6kvf9oONIlET8iek2qplIO+wVNvcrIZPW9lyIID/lWx
         Y74VekKJsiL/82jk5gCYq4Y0cc9Z8OqSCMqndQ7SHEpXSJ2VTPS5TkSmsX4XQVlbIGp+
         hqnFdj6dImJRAoTFHDuADBu2ai0mp6xTxaoPaQvVLuysvnWA/kx+n3jozSOuaapTTdon
         oyos2UDaSh5wbqC5XMcapRRP48k82pBsdd1gPLNJEzcvkZd8YuPNEOpLtPpeRHZcFIyI
         CGyFUPP4SAf2JF7ZnuGxFL9jvodhhcBfmTsZkcMV+W97ANrBQFmL3hINc0axQs3ltM6W
         61hA==
X-Forwarded-Encrypted: i=1; AJvYcCUV51p7ll+w9n2FAkDFCZ6fasRVvgd35DlMwwu1gvDUwEcj5pB5tRBSTupOd7VGKS82TUghM6apwtqa74UL@vger.kernel.org
X-Gm-Message-State: AOJu0YzBnmguTtRoF+hadH/xP337NdGPSdZmSbt6HBs8cvhTGAqp+yRk
	qcIK5GXN/At4pckqulTOLr61v9CFFt8k6ANVR0vcgFSYdd5ZI3zBJb6pYQ+WORzqhUuriG6jf+h
	n54UncLxx95qkkMDZG0YY2JrwxePYy+yJu4UqvuK9EchGxEJihssyieFapGpajm7fCo+l
X-Gm-Gg: AY/fxX6WbPkp8+hQLLzMhScSWuzbJ0Iw1Dsh1STIYspCEWIr30npehs5MMeKhnx6cRB
	/HD1+bThCPh69jfob/nDl/85VhjtCSiqPvF4UrFyvVoNE9qPRnHe7HzLa/8a5jKSA3iftTPlkEJ
	Ei2YIM8ruY3EHVRhy+EksJJJEI9d8uCipBfwnHGc3CP0om8nWM3iuStMZZ8I1AUU0shzDXIhgp1
	xHVtEdzgTuLlvsNzmebmDqqSleupwvYWeVTXqbJyH1suFTZfxJy1wNPB/ffOZ6jh2xw+UYg3q6x
	55x6iPOrbRDrz/rzhu5sIU+lCE9Jij46HLBOiPIak8md/EnsoWCjTkj/92hRWNymcMEgwfMB2xR
	BxXmDj9zP97JwnP7E3MDuYZu4Lta7A6tyJqMFutvcWOtoTa7BtK61k4/hwf5rjqC+8cli
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr32695761cf.19.1766144760980;
        Fri, 19 Dec 2025 03:46:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq4LdHooVKYVzQ6LVSsPFMLwmvR9seuLMTX398oj3vjYDv9c5OmKhrHRlmoobw5zM3SDyg7Q==
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr32695491cf.19.1766144760507;
        Fri, 19 Dec 2025 03:46:00 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm1974465a12.25.2025.12.19.03.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:45:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:45:47 +0100
Subject: [PATCH v2 4/5] ASoC: qcom: topology: Constify pointed
 snd_soc_tplg_dapm_widget
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-b4-container-of-const-asoc-qcom-v2-4-05fd2ecc06fe@oss.qualcomm.com>
References: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
In-Reply-To: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3065;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1Bo4QM879pRwFDgFh7lx/5RlQhryehFM2iwSnps404Q=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlFOu6i7h0rXF1H25iffhJtU3DDNkvMHoWc+BEx5Bpo/70Aa
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpRTruAAoJEME3ZuaGi4PXYMoP/iz/
 Js9GahNdaQBoHQ0hm2mdoUkQWp+npjkTHJeIrF+trXHEBpHB5j2AJoPISdU4r4UU3oveXRyUbWH
 ks1pL1nn/Lw89/r94VY6oWurapkUs+Qc2NhH87FS4ovQ7MBpNxVePkPMDszMd68qIhOr6Qyopom
 yC0xVZhBx2Ey4qVMxrCrdo43k0jTPAZkzRxRheGzrHbxZyNznbErM/uu2LwMVy/ax+bqD2o4oOP
 gTZrIWMU7U+tzoe71dUWNI5LqK9Sq6Y9FnzfUchCjj4F5dFexklWpEuL+I3e7ywapEPHx9GJoea
 Lj5V3MJI7o9deOZj3xRovyNea472Wc6U2cfqve3I5qmEUbAUAx5iutor4EFa3JUFgKId6wbxeZa
 3e04KnujDlNctOrLInq+cqw64iC2rvcjjf9swJH8VOM2q7XdXosZlxAzp2/OeZ6out8XNll+Sv+
 nonOT/49TRY6hT7hHJxEzMX2jnjfLKZ4iA0a2z4ZqYI5FiXgzUsHH0ocJP/ry10mhjnsxCVG6IG
 /DqrBLiGpSsSKZqh4mKvDeker0SHEMR/2YL1v2bPHmo6qkbOglpGMOm4G8W7CDtg63Y7vlOZOK3
 2SlPxsuTtYphjZQnmjws0pp5eL8kp8It99ZkYDe/HyDmVHs+9MY8DvzVJnvJWMwaeCmBynM2I8n
 sqJgJ
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NyBTYWx0ZWRfXzhmvhonys3v1
 kWvQBPe/dQahq2jMYKnO8b7fRosi0NcZtOi1VxYL+2oB/p92O0FNC2wY2TB1zOl57Mfng6jyX+X
 Gu9shhVtflkHhp0QzKy54J/ij5T3bEQGJbizY2RPGShHJg/opgfZE7fQzLXNqecmAYWKx058Lho
 44jnx/Uuh6k71X7GGPRjrnXaW5Fn6J4dmlFAGGRZGMDWLtHF4BkNwDMiXhWYoLymkY8SPt5c2WN
 w2VP5TRYgDt1gnxWRqj33MkUlP3LCZLysVp/UQClAXedACSreEbwSGcQu68lo6EnXqEkHFP6baU
 XfcTORxAYCQ+Odkp7yNeCdIIZ1f61GJH+TE4AmofLS1JIgwM0o/GCVYtnLjVHRUAeqvyeSwefsd
 aYbte9D5ujnWbtvZ45pS/BFm8g3z+6ESgBIgHyd7JwXZDYAdMo2AnfV6hWsaiTqR1a6GwU2iXU7
 sHrUCySsi3GORWQlZZQ==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69453af9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LmhyXBtnI0SQ4MprW8YA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: xhdmenQYsumK_AxJfaJLgSWmLOcOuPbR
X-Proofpoint-GUID: xhdmenQYsumK_AxJfaJLgSWmLOcOuPbR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190097

Several functions in topology.c receive pointers to 'struct
snd_soc_tplg_dapm_widget' and do not modify their contents.  Constify
the pointers for self-explanatory code (pointed memory is not modified
by the function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index fbba543bd976..2e71eaa90441 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -590,7 +590,7 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 
 static int audioreach_widget_load_module_common(struct snd_soc_component *component,
 						int index, struct snd_soc_dapm_widget *w,
-						struct snd_soc_tplg_dapm_widget *tplg_w)
+						const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	struct q6apm *apm = dev_get_drvdata(component->dev);
 	struct audioreach_container *cont;
@@ -620,7 +620,7 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 
 static int audioreach_widget_load_enc_dec_cnv(struct snd_soc_component *component,
 					      int index, struct snd_soc_dapm_widget *w,
-					      struct snd_soc_tplg_dapm_widget *tplg_w)
+					      const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	const struct snd_soc_tplg_vendor_array *mod_array;
@@ -778,7 +778,7 @@ static int audioreach_widget_dp_module_load(struct audioreach_module *mod,
 
 static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 					 int index, struct snd_soc_dapm_widget *w,
-					 struct snd_soc_tplg_dapm_widget *tplg_w)
+					 const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	const struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod;
@@ -818,10 +818,10 @@ static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 
 static int audioreach_widget_load_mixer(struct snd_soc_component *component,
 					int index, struct snd_soc_dapm_widget *w,
-					struct snd_soc_tplg_dapm_widget *tplg_w)
+					const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
-	struct snd_soc_tplg_vendor_value_elem *w_elem;
-	struct snd_soc_tplg_vendor_array *w_array;
+	const struct snd_soc_tplg_vendor_value_elem *w_elem;
+	const struct snd_soc_tplg_vendor_array *w_array;
 	struct snd_ar_control *scontrol;
 	struct q6apm *data = dev_get_drvdata(component->dev);
 	struct snd_soc_dobj *dobj;
@@ -886,7 +886,7 @@ static const struct snd_soc_tplg_widget_events audioreach_widget_ops[] = {
 
 static int audioreach_widget_load_pga(struct snd_soc_component *component,
 				      int index, struct snd_soc_dapm_widget *w,
-				      struct snd_soc_tplg_dapm_widget *tplg_w)
+				      const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	struct audioreach_module *mod;
 	struct snd_soc_dobj *dobj;

-- 
2.51.0


