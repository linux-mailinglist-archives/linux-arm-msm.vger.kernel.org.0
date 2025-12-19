Return-Path: <linux-arm-msm+bounces-85863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD8CD007E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D64793037E13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C42333426;
	Fri, 19 Dec 2025 11:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+7ljc7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4F1Hue/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB2A332EAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144760; cv=none; b=fGuG2p3UPKDBXnw5uSY0VTTm6rRwfGy6y4OOsmUC7Y/C36t9SMPeWddI7uZ8PirD9Z480DRJGweuYn+gyB52LegEHzvRq+OpoYHJfn8wa9BIfcZVkb3D5XnuBnfjTfRJNoIrzURUap68rUb6pJHD4X0Xlt3LRkYH3KIkGNwOakc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144760; c=relaxed/simple;
	bh=NyyDLjSfGMUENLbw8bS7UpVbLpd19bM1d/LGXzlZ0a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6oXK3j07kIDFsNXmxQcmi68GuhNgn1ANRVEm2B75ku8j8pxxvNAIxgRwxWsXcyOmIXkcS3rTOLbeNW4KWMzSCRs0PMvY0TO7oI+TEJ9R8bzcSLn+C/amNMvGtBYG9CCSf7I7y6HtZ+5C3yio1Fa/8fS0bhtUIpvPTXuDqOXHzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+7ljc7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4F1Hue/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBdD293700752
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/n9QKasXofpMA+jcZikeqyca2hnXEd/6lPYRNYCXv4=; b=M+7ljc7YHQLl4sx5
	QW5HY0wQgpSxQik2HytzmnUFjbfktyUZz0guvUU/wPM44L7VPwQ+OhXT1GTPiJCq
	kFVYJkuX6Gd0il6/RKK6/yUuZZmHJx20hfCwd8ovGm3xWDk+3K9gzwMxtVhOg75t
	hbSHy3TmAMdWrLDOElpapJqaJBU3Zjpf8jYFi+/p+Z7m9eEFj0YAcT9qcD0byQOR
	KM5LEMZOmaKyFaP2mm5rndWptzw3iqwOOFTS0nWgotWKLKz6HIh1aGC3NxQOLpNq
	swDJp8yRVjnlzz/g1mPjLXOzD3pYqwDQbnQjWC/FVy3X2HqB8z55lnTNtZOrOFdP
	Eg1Znw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ejf1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:45:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0488e746so32598901cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144757; x=1766749557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/n9QKasXofpMA+jcZikeqyca2hnXEd/6lPYRNYCXv4=;
        b=g4F1Hue/KmdYwERFOBlu6Apn2Br3zFIAIvXiK5aCkFRvLd5N0wG5bdfQly+nH6vulz
         u5S8Eo+UhQjgMZ9kMlPHF6fVQBuu95mSJMeYTDEuqRbPK//EeMugY2iOM4OIjsqpPJZA
         vWerHs/9w0lz42BvVQPISX4oRnMu7rr62xRk7hT1GxZnwZLmuH7F1s8wUqtsXYCyFGOb
         JHy1hltGPSyShTeqJQYJavmqJkhA9OoMQxgcsQmQFbRR8NC1tQtsdl9ghLsCUhv4z9YF
         Inj2Gt06eFmjnH1ynIfBaIQVINSj9VvceeYzgEUih225NaFUqDl/W8WiLsH8f8Dg6UNB
         cXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144757; x=1766749557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/n9QKasXofpMA+jcZikeqyca2hnXEd/6lPYRNYCXv4=;
        b=uS+5UkXh+58W5gNT8Xw++zfohbLIeKlLo+O9l7YV97npNLcgH3Yr4vZFKpobQkv4G3
         XeMkWr5KvkHvHG8N5laDax5UiEUCXeTiTfqb5nsHkWdaRNpuUpFvhoGs6vs17fPZ0704
         1WKk/qr3k8HaO2+fXdOGx077NmRnDPM7fLdJpxgBqG8Nhm5p1mL95Y5i7A+k4c6XwE3G
         7m/j3Mk/IbQ/9JK+o49KkVodF5kAzvf6nQrZeCUyHoMrBssgIZQfsluVVeaAum3Bavzz
         c4HzrBapc/IK+Gi3LH8+Sypt1+DEzhPHEIOxQMaoPCNZe3aMjX+jmvCvycgb22Zd3gGK
         1JMw==
X-Forwarded-Encrypted: i=1; AJvYcCVcy1nbdcIPDffQqF570u2moRyiJd5WEfpSg7UgA5VzB0Tm48uZMon1FXZpkOoYFkdb8aQlTLm9raF8CJ7l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5X/4QbHXiJ01J41RKsrQLR6fJWtO2m30IDZcVES9HLJ3/n3qJ
	ibOz1La6GZQcSSM4MYhUtxGJPiWLLeiAs9XdZnlgARuR7pJCaHedeSN4MBjuA5pM1pyQwZMbKZA
	HGocIjSCedldOKJiGJa3+7j3JQL39ZcroYkbDQNx6ZD/HmXOzccAaUzSAA9gk2DY0LvlL
X-Gm-Gg: AY/fxX6EKUc/3Yf2ikEwIcI67v+uQwButRkJqHEDt851vEvRZb2rzCgQ1hL9QxbU0c0
	jut8aV67+GDuy8w5yHQ5fbTL0tXtMqXpUmEBYkDc1UdoAi9g2b1JX7TAvYT+W6fCeVc06eZGYAP
	iBLqDLiGoxbawxqIIGbaNlIgdaN3228f3qhqlSm+7DEke0JI62lC+Vz+a+dnTKAxCiXHEvssIQ5
	vhd7XP5YbLsgJosNNT4QsvpnXKyrylfh0DhlJTnVe4aPn3HPushXYgNBczN4Vnyx4QZkT8L+Ych
	LjI2KBH7i0TZEpdJSae8a07PgfE3xBPhA0Sh+mMVBEZNe07tuPi6QTKhD0qF7xfgh9v4LDTVaxV
	5YEeDso+CCapK9l1ehYI+AYoBsuxMYqG9DE6/pEdLdu/agVcqr+J6346NXUSdD1whGtfA
X-Received: by 2002:ac8:5a4b:0:b0:4ed:3d24:9570 with SMTP id d75a77b69052e-4f35f481077mr75172221cf.37.1766144756956;
        Fri, 19 Dec 2025 03:45:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2Qay+Fkz9w9/V4HcbS2VG8J/zzMCfFSu9UJ5VwWSLt8yl+iqgcay0FYPHFUsBhR9D3NQNsA==
X-Received: by 2002:ac8:5a4b:0:b0:4ed:3d24:9570 with SMTP id d75a77b69052e-4f35f481077mr75171971cf.37.1766144756561;
        Fri, 19 Dec 2025 03:45:56 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm1974465a12.25.2025.12.19.03.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:45:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:45:45 +0100
Subject: [PATCH v2 2/5] ASoC: qcom: topology: Constify pointed ar control
 structs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-b4-container-of-const-asoc-qcom-v2-2-05fd2ecc06fe@oss.qualcomm.com>
References: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
In-Reply-To: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NyyDLjSfGMUENLbw8bS7UpVbLpd19bM1d/LGXzlZ0a8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRTrsbgK2eb02MTt4oP6IN39AJpG1243+XIBph
 JpU0VwlHoSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUU67AAKCRDBN2bmhouD
 1+mID/wJmJk1sH48y7AgVzKwt/lWXdPgYsFRrvkHQzSfFJ9uJqWBUjTPUxlnOMVTAf+mwA2X+Gd
 APW9G25ZmIM5E1LEcXumLzyRg2c1AAa2Cv2iNZqnjn4eBfAms6dXwoHY24golyxz5SWDZZcWtOr
 2VyRjLLrtGdLHdfmWWdigvPYhcqK1jcTlwZH79NncBhaV6ft1v5hD7mDMy9135ko3aJhazoVdWL
 WDX6tSDJ05WZpvGs3h06hHVlzJ4HD5pp7Bde/ErIctLGlZXR33xqyO0FTIfWUhoJAn+CXAH8jHa
 psx8MJbLfl5eFf6WvVLk8ApBevHwpTvkhy22cvQg18//HAWhiHL5WnP6MXJNTa+mG1c2Ffow1Nd
 LQeAFq+gdtwjdsTZq9USmrYrDGq71iruNo8WFXqcW5YqIMxm3VbVteCJ/M0r7H3UDtD50ly2Eqt
 r72Oe1ZfTZRXFwUViUGNQiL0a+tEo+AAxjK/qP1iMTdcVJqUInYjPMG2wPitVcvzncuXzuDe22j
 d5RfaexkdtKuM3AoZ/6WQBp2zI7i+FGnLYWPtlC/YD+sK71e5U02UsjFRqOPwf6uzfiv+wN7qj1
 S7defSqaHsQKipBfgdd9kLPx1PU1O5ncag/a7CbEHxT49OVPbxG02GyrTze/FKoFtBhB1TDhJNs
 CE7AA7z5ZoogBsQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ZRBR41-ns-FFnbGnuJwCbH4wH1BXrDjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NyBTYWx0ZWRfXzxeGf1o2b42/
 WV5o3ABCxXOC9gDn6eSiYw5a++vuOzkn4j3zyD7FtLJb3i52PV2cyjigD702PiXYaX9+iI/kX7D
 755m22vrVGcI0g8R3V8a5SXd2SdNuzFKUZovuaJKfBMtPHlEkc/SRr8ufJb8SQ5X3gnvXS2bpi5
 pKEYfdRSfs0r3QE8pRqD48RAd2aqlz6bEMt2v1fTcck61l4W0foVyAvwVbTc7j/mZ40R8fbE8Os
 yzFwuSY3w/9fdgQJRGYovkjMyNJJ0m5gYfAqng/yepYfrIHw67BmhCgMeSqhGhxkwirxEQF7xxZ
 JzGhb5JPOMlbhVN2DGqFTNezhX9BRTrm0WJ6O8VN75iyl3c8ZBS4qI3OmV58jzHAVE1DhfE4rz4
 JlKphuFQ3q5gfYbgu+ToXEyehvNODh1vYOxdVXqEnZZboFjmiJmZkzAYSAWjlqf1mKzG5BYsfRo
 FRCqLiZ2WRzgaQOgjyw==
X-Proofpoint-ORIG-GUID: ZRBR41-ns-FFnbGnuJwCbH4wH1BXrDjV
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69453af5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Eep4eOvNbGvhNPJmoRUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190097

audioreach_route_load() does not modify the pointed 'struct
audioreach_module' and functions for connecting subgraphs do not change
pointed 'struct snd_ar_control'.  Constify the pointers for
self-explanatory code (pointed memory is not modified by the function)
and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 062eb01fc7a7..9bde799146fa 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1032,7 +1032,7 @@ static struct audioreach_module *audioreach_find_module(struct snd_soc_component
 static int audioreach_route_load(struct snd_soc_component *scomp, int index,
 				 struct snd_soc_dapm_route *route)
 {
-	struct audioreach_module *src_module, *sink_module;
+	const struct audioreach_module *src_module, *sink_module;
 	struct snd_ar_control *control;
 	struct snd_soc_dapm_widget *w;
 	int i;
@@ -1098,8 +1098,8 @@ static int audioreach_link_load(struct snd_soc_component *component, int index,
 }
 
 static void audioreach_connect_sub_graphs(struct q6apm *apm,
-					  struct snd_ar_control *m1,
-					  struct snd_ar_control *m2,
+					  const struct snd_ar_control *m1,
+					  const struct snd_ar_control *m2,
 					  bool connect)
 {
 	struct audioreach_graph_info *info;
@@ -1123,10 +1123,10 @@ static void audioreach_connect_sub_graphs(struct q6apm *apm,
 }
 
 static bool audioreach_is_vmixer_connected(struct q6apm *apm,
-					   struct snd_ar_control *m1,
-					   struct snd_ar_control *m2)
+					   const struct snd_ar_control *m1,
+					   const struct snd_ar_control *m2)
 {
-	struct audioreach_graph_info *info;
+	const struct audioreach_graph_info *info;
 
 	mutex_lock(&apm->lock);
 	info = idr_find(&apm->graph_info_idr, m2->graph_id);

-- 
2.51.0


