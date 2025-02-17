Return-Path: <linux-arm-msm+bounces-48243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8BAA38941
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C97D13AB077
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90455225783;
	Mon, 17 Feb 2025 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmprIQuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA03A225769
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810022; cv=none; b=mEsdG2W8pUhAd2E01+Yi25DMAgHjugqpeJKKVInvoQ4Ama8t0HEkxxmANaR75OTyd7en3xSiDzal3TSAbdc82V5RUGkMYAO7xIGiFt3rpLr5l1qU4TUFb2UBAsARdk78G+ebKVSG6xOtCaZ/bFhKK6FPr6qK3yiqwlb2NNf4HAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810022; c=relaxed/simple;
	bh=MOFMpyIIla6kcWU4sBn71wT1zgg+fBI5dj5FKc/I1/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dG9b5/W4l38NsZ4FuY/TEbUjMF1JxHuNirG3xatZd6KqLCN3poGIqDymbGKU5opOMwwOqFsDrCvleaAfJ+lOw2h2PD0G4zrlA97IzPACsdHY12775KdYUO6aDU9zcZPEL6yFGUTahO14d6nRtwUabqXzta8SwTxZWl8zO6VhU34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmprIQuS; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3091fecb637so28681551fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810019; x=1740414819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEQXbQX6osNEgwYD9EicH6/Mssg7LMg+ZTYyPxgpyYU=;
        b=YmprIQuSfmYQvy62uhUyzBjhwq/x+JeHk4QaB5Mn100FO4uerHBxPfeAWI2ARKJBsC
         strufSV1K+79je/5y3rqrtVaWZKnfrEKKEr4rOMT5H2gFTgpt0vOui+YL71MR5AxZqB+
         hsb30ckb9Kz16rteSm1/go3VXviahRX0SPZov+BVKK9TWfAMXQflVK77wdWchV0/Ud33
         FjSJ4ejl1pcTflH+inoTRq16H0dki+ChOs+nrZIWfYUQOi/a9Lwu4NjBLsXJzZhcLl/5
         55eUepaF9wRhSSJGE3iGIkUehli1vx17caK9UdUVFRSyNRe49gDCbmWmGbPqpuTp+t8s
         9Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810019; x=1740414819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEQXbQX6osNEgwYD9EicH6/Mssg7LMg+ZTYyPxgpyYU=;
        b=et6XpPQqMNfbBSlTUhZPzfDTw+DdpfDxNC8Z5SukZu6FgEBQQ4AGtFCRA8wU9qX6E/
         2/gazW5WXbPE/KSOn2Zfm3Jt0qc1i2RyAMQcMxm64wlY5BYgYDV45p+Mc1k9eQM74PdL
         FkIukB1aF7ffp0tPTzyKwlBMhjRJGnUkTukMTYaipF813PH56/xO7iTu/eb54e7kce3Y
         MXQkKbEeQ9otmJ0JpPZaTCZrmzi26pMuw7BCDAHDoNDbHefESANIv6NQcq1XPVbESXRf
         T8k2RFD2yHtGBkGL56Clz65d+yv9Vh1/faI58RWMbxMT/u/uY8vxb70sY2QcXNAFlpuy
         bADA==
X-Forwarded-Encrypted: i=1; AJvYcCVXMdMvCSpabAQK0japOwvgazIA0I7Dpnc0xaPRsGDsq6wSxB/z4x4bJJs049LCAzgAccGp8SbyOOX7QNPW@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJe0PBqjzRzs+2cU3h955E++xq+KOKMvLwmPlF+lN7LibT3OT
	BmYYS6St1knaAohCaeCDkIQmWGUgmtxGRaoGXikGMw5VXZKqsAIP5Wz0/EUZn6I=
X-Gm-Gg: ASbGncuMvlMCO9cm2327D3qdXZ5F8rLJqY2fZ6NyQcviVeLw4uGhh8oyKUlaBrUYZt8
	TKOuBFYQgVoVSkiluWcdW/CY0KYycJmM3h34uEOCksVqIIrDn6LSqQzjGB+wGsH/gpDASjUDcMv
	AzWyEkX2720ap+rpqCikgETSp91fgtl5kEoHVCuupwY5wWTkyZdhZhh7/1xfoyxkkHjL8+7DWNI
	EYfOQMGEGTVsRrUHrclEk2cuCX/P0YegPYSAfl+2KBu7xWKTFB+WFaaMtpaolsMFaR0os2Ahet2
	7Lk3lYyo6ViiQ2wUdX9+1wWb4qZ8xjuY3vXCQ2+Oz0ZUrAN8MTtrH9GcJVA=
X-Google-Smtp-Source: AGHT+IHjQA/NzRILMMzlk+y3sSbn+JaPpaVa4aNPG3LAUfe/Dz90G0frgA8Ua4KuSchQq/KSOSbRlg==
X-Received: by 2002:a2e:b608:0:b0:309:1ec5:fcbe with SMTP id 38308e7fff4ca-30927a704b4mr30801911fa.22.1739810012362;
        Mon, 17 Feb 2025 08:33:32 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2cef18d1sm5695991fa.76.2025.02.17.08.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:33:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 17 Feb 2025 18:33:21 +0200
Subject: [PATCH v5 4/5] nvmem: core: update raw_len if the bit reading is
 required
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sar2130p-nvmem-v5-4-2f01049d1eea@linaro.org>
References: <20250217-sar2130p-nvmem-v5-0-2f01049d1eea@linaro.org>
In-Reply-To: <20250217-sar2130p-nvmem-v5-0-2f01049d1eea@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MOFMpyIIla6kcWU4sBn71wT1zgg+fBI5dj5FKc/I1/4=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBns2TRvppiN62qcS+vSPo2KVQ6Rpm0nglgR9wyS
 +QRblUbotyJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7Nk0QAKCRAU23LtvoBl
 uAA0EAC8YtN615UyWbdr/bLDmW6iTKU2h7QvjDshKnKd7+6bK7RBt6hLoYMVq6n7dda1CVYZhCN
 0sBuNEMcyecjNQEttanIqLWTNU/TVMf7v961zhayTEckt7ZirFdewsDXsUIrepug/P3QkFdfI/U
 0yavyX4HsW+yazaPWIhwRZvisdGGEGFS0oINdfvT9WjJoqqGFcYhIQKFey+fmbi0z5Q/nSwz0UD
 It52TwaLDKlAnXykCuBodD2X46rrNuks53dpe7K24znmH5L3B8FuUbVCBkDVijXJPyLqPuT6M1u
 mOeslyGCV7UG+/uSyyXJRJ962trYh+7DIy+QSi5cMV0gu6i1lx6b2kZadrpE5z6/mPlfMJksUkV
 1F33D3UlKMkqmqrHskzqPPmHoae/6BSZT8bdQiJZy5DtGpEJne5jeapaALuldIYisD78otwVgac
 qUAHMGoWKBaj8daJ+w/iVRBGUjVQ6/PWiKP8OZeJ4MMKnRV7xglbUWkj4sym+ZJeOV6EG3UvNa4
 77ECpERsXrB7sIQrIXPjrGOXR4I98PRzG9KVpuXB77204/8d9GPB/Ue2obHCBUThEcdb4pTLcj1
 0CvoDrCzVpSrZFBEVBj+zT3yoMWkqMrCC61zF7d3zR0BC98HK/HbF+LlnhHJNbqNIcQJUGU9ytP
 r+e40/zkWLURg4A==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If NVMEM cell uses bit offset or specifies bit truncation, update
raw_len manually (following the cell->bytes update), ensuring that the
NVMEM access is still word-aligned.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/nvmem/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index ad9b716e8123537fb5fcef724a684e6db3c1de8e..b6f8544fd9662cff0a04e292bb536418564f0368 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -594,9 +594,11 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 	cell->nbits = info->nbits;
 	cell->np = info->np;
 
-	if (cell->nbits)
+	if (cell->nbits) {
 		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
 					   BITS_PER_BYTE);
+		cell->raw_len = ALIGN(cell->bytes, nvmem->word_size);
+	}
 
 	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
 		dev_err(&nvmem->dev,

-- 
2.39.5


