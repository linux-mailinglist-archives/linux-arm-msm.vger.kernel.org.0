Return-Path: <linux-arm-msm+bounces-71635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7CDB40627
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76F631BA0465
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F9430C35A;
	Tue,  2 Sep 2025 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFDzbKot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510652DFF28
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821676; cv=none; b=knpVXLMlqmVLosYx9Gr9yzMYBCtwy76y+NuPUNJEyscRayZfNNCHu64uvBwzdqel8lQ3kzQK6NavlZaG+7qd4vl/Nv65qyWwv3JCmMiTKGCx45mByiSGmaXh8o7VLFUBbgqoOUbpA3s9QQEawBZng/ygYeOTpNt0Ml2/L/5om9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821676; c=relaxed/simple;
	bh=wc/7JbfhxWZb0IvcqrXcslNekS6+I2olIuv0yDvhRhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NG+Zsg+lLlswXT+76Adgm/cmJqh0vunX+ztdZQyhRKke49oafEa+dYMZqhmDj/k9VSWcsZ7AT19WJrXtzm1BTy8SLaIi67tnk+3YSTxGN1g6zG0ZZztJVd9wSFtfMEdiHUFchxNaCCvOODofmGW4rGZnbuA8MvfxImhx1DpYXVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFDzbKot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BZLRx016374
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 14:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ofBMOU8ZIZT
	vpxtjJjzxzmb9uOD74fydkc+Mw7BveZ4=; b=jFDzbKotkqypIshh5GCVuxtWybR
	GSkI3mvgBp18pQfU04reVVaQGEoK2AqUDG2uQwH+qAlL3+XErhVrluCEZfqpNu+h
	1AeBixrSKHKV5ZXwT8l5GzhXQ5IRmg9kWjgKSNQHC+JmHh42cOlYczm4fzTXJCuj
	ZnV/uLf1XKLoOhIbRaVeptLTmqE53YIfMZ0ly3rzAEah2JFUEMIQN0YbD74p5htn
	vYhtt06I0lSvMjuDFarm+OZqGdhsUqwIqmgg8SAdj8/UoXgIJwJiMcR2edyEIHTE
	vOdK1n0oDk+xFWhuI0lwh5zjgXlnWjItd2hsZe3YYF+D9RM1tf1BvrnhoGw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8yukx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:01:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-89606a4fad2so228182241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821672; x=1757426472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofBMOU8ZIZTvpxtjJjzxzmb9uOD74fydkc+Mw7BveZ4=;
        b=fVT3VW7+ATOk0ZYvnV5RY/xnZ37nGc7KEkGPZ99ydK4uZulNfzFWVIqrCOVlnOID1w
         GYM4Jd8TZ//X7lH6647RdaQd7PdeNzsGsAO3lY4O44HDB5ZHOGd6+TO0lPsLKou5bGuF
         zg6aaCg/FAN78fzMArscf4OVRzsH7FVLmMICGXKYLeZwbSQJtEmEQxW3sfeBqXiEnN9h
         XT7uZ8HLKoiHHdWPOaF7h/oA+oMMcGjPvIAsBPyDOOz7Gn26lIyHL0z6bGVVbJnqJ4AY
         2CUogPHXvDBcdc2873fJJvTK9OO1WbUBUODcjdOSNItjGl0QgaMe/3J0F2UFp/7eErh7
         mYXw==
X-Forwarded-Encrypted: i=1; AJvYcCU3FnHk6iPd5yDTSKPhDYycmGsq7i09zQKAErsyb0vnRkzoU2IdmAxeZslaLP9BhAbuqHNfHVw+nmdaZ/C0@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwxo1ukMQzF2slf3XT2yC/DtwHsYIrWJ3qRPyj4BghuvuMiWR
	fgCoXlWqF4pBZru2qgLeaGuYx9ve+aMY45PaojQiEpjrnr55tkkF5P5UUNbr0tEkbEBy2Jq82Ys
	tiBYW413k0IWr/dDyvms+My3cpt8D4ACGUVT7DZG2tcSw8ZpbAK6FiqFAGsHd5JcR9jOl
X-Gm-Gg: ASbGncvUFlsddUl1X54Or1+2RdO2Al3gHDfkxHzyV67Ue5UTJzqqDLsmfhvU9KoAHU8
	X0ZyJYXDIfXMzMTIvn2XF7D3zB3TU9ocORmsg38r/tjQitenJ9Jw+h+t0WFEMSGGNcGJm82RDan
	fVAN3vNSE8TfmWrf6zmsxeuPOxlUIOpAdNJ6Xy6aI7bsIhtbD4DvQ1PaoaPed1uVfOlIoltAoFd
	wiWgYxnxzSOhuIB+Ps7bMxm8KabdZ2XkK5NIdQQTeD8QVo8hzyWXUDvD8fRBukp6Gx05KkKN/iC
	XuHv7gDmLZWCUAqValiyOVqx4TUgVsLCrNroDiPL9xYzRh9ZUV9K8A==
X-Received: by 2002:a05:6102:54a4:b0:525:42d2:790d with SMTP id ada2fe7eead31-52b1b902c6fmr3471056137.25.1756821671612;
        Tue, 02 Sep 2025 07:01:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE257wS09hktiVeXoKS7mdBQNq0fy2/WSA+DkddsrfqENMevrNa5o8DRsYPDgcJnlFqhk99Sw==
X-Received: by 2002:a05:6102:54a4:b0:525:42d2:790d with SMTP id ada2fe7eead31-52b1b902c6fmr3470791137.25.1756821670137;
        Tue, 02 Sep 2025 07:01:10 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:01:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/6] ASoC: codecs: lpass-wsa-macro: add Codev version 2.9
Date: Tue,  2 Sep 2025 15:00:44 +0100
Message-ID: <20250902140044.54508-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PbFEGUi70pdRGaVf3li2OrdjgPPPM6rF
X-Proofpoint-ORIG-GUID: PbFEGUi70pdRGaVf3li2OrdjgPPPM6rF
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b6f8aa cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=aFUyGFNo807uSY4iGNgA:9
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX4yPoD7PRXth8
 JxR7HWEEMKrCnmzLOAn4NWSiBIRPIcKvH6SYmnxppLx08gx3+yAY/c8Zj9E7dG/pTOCD8wsUSPF
 27ZElsspfgkdsrtNBOmJ1cw2Jc/92xQpWQBWYxMlsg+L96rip+hejPm4UkPm0ciu8P4UeR0VFLz
 1CTyzGzAYP6+7+IQfVN6CO3okHwp7eums7SvuZnQG41FugQlTbBCLM0KSdfTIWxpFZ3NDGkE64V
 RcxLntqEWY7Q/eg32WP8LXgWc/ywtU8tTT/i2S7qrLSxZtLdgYU1qG7xVEigHVPlzg1rBa1cl8o
 nL0HuIia+V5cXFv0XZhfekZ4kuD0xqpqMI9I85uUQ+kH3Omqq55W1g/6hviTij3EwimKEaJbWA7
 8onX5Bh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

Add support for lpass wsa codec macro version 2.9, which is available in
Qualcomm Glymur SoCs.

Its compatible with 2.8 w.r.t register layouts

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index da6adb3de21d..187805b39264 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2690,6 +2690,7 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		widgets = wsa_macro_dapm_widgets_v2_5;
 		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_5);
 		break;
@@ -2838,6 +2839,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		wsa->reg_layout = &wsa_codec_v2_5;
 		def_count = ARRAY_SIZE(wsa_defaults) + ARRAY_SIZE(wsa_defaults_v2_5);
 		reg_defaults = kmalloc_array(def_count, sizeof(*reg_defaults),
-- 
2.50.0


