Return-Path: <linux-arm-msm+bounces-43974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3853A02113
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3204163881
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 08:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6431D8DE1;
	Mon,  6 Jan 2025 08:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASw/Zrf8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A696C8BE7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153359; cv=none; b=jNwjUkpKMrC8eNHVB9LLGo8m8rHrkZnbeT0woDrXWbiAzNIKYImX2v1GkpCzkX8L85mdXoJg8ZxBNxOOJvCPs8t8WuONp0TrsCnxptVli2Nv4T4VXcPaOMk43zHBHeSXmzHNWbcRQuA2VdQ5ATw4VTh9tNNUnr1tclNpJXcAgkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153359; c=relaxed/simple;
	bh=PhVBTMK/6+dy3CEy0PY9YFYK561quc3srNdqv8QLMdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMEJw96lav1+7/7lMJ9fhhLFE6hkbqLhFWwsAho11sIEWuGr7ZhnVUgXKp5XMmZeBlsG9JZycaDBTAiVySMJU6NjcDbeDyITd9fhKFT7IydQApQVf6IQDFowt8/LV32OFTSrdOBlO6Ki3bX3o1BZVMnlRdTHkgYzFiYiYQcd1I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASw/Zrf8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa67bc91f88so147484566b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 00:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736153355; x=1736758155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywLej3GM0KyKJnGRMRgcFZSn6sceBNpXrAUD1YJ/g44=;
        b=ASw/Zrf8AnAgoPr8ZynMSe3cSY7zVq2TvrTLOCmUh/twDHQPadOj/3BbUmegfgQB1Q
         6srIqU3sqrC2GO53YHkXuSbF76cvSrIIUsg+EpmPZWWWVujuA2rMYGy5d7Sms3b5dqBq
         rPwR4YrsGedKA0gpc4AA5Z6lNvlQSlpEz1gUjGSupjFvQeqiIv+yJ8UdfEGhJsjY6Z4C
         eoroVDINBtXp69T+iSZdq2ZKiQDpDEuOcO+1NGxWmQOHcl8QKxulFEp7HdItDGg67Hid
         sJlG9iZ0mYq0UWgAtiOFXWZRUPZmxxUNdiqJ/xrN6okopAhlOcwQy773mjkiWdWCEKzb
         loug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736153355; x=1736758155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywLej3GM0KyKJnGRMRgcFZSn6sceBNpXrAUD1YJ/g44=;
        b=KCqGSWnotE6teqLYmzO+S50q/48Du/GBqkNg7EbvrdOKR7SQo+ob0PIvq1vEcDSzvq
         ar6pUu/MUgJUXj5iX+ZdNfJMciOHmDgqKtfYT8vzEQ2XMvjsLR5k7ipkCjZtYrKe3mHA
         7JkN5lnJOT55c3EZKAdAsipX89L+QFilja7sxrDVJkXYcrJqtIoPIKKMY3XJg56hWBJ/
         AANK3Mf7IPyow/MvHmrjdIDZ1CAG8F4GWiOXX9w0+PSMZPQJwspsTww+6HLZa5fQ0/cZ
         qqxd9dTbH4RM8cQouLFgrcVmOkbdbIDI5go7cJgWsnDKNehit1TXSOmzCSiAvCGx26C7
         Ad1Q==
X-Gm-Message-State: AOJu0YzbVJkBlamzagCrPj5Rz2Zcd6ixOwJr0tbFxpK3UMLW1ZZtTuN5
	LWK+koW6RmZ0uUuH0fG4iWlXPsmoP9J4FS0oPJzifglpO+BlLmAaR8LfGww1wFM=
X-Gm-Gg: ASbGncuPnsLVNlzbz9d0S+a1mg8PJ5orWlmP8PCLZdCc9VQfHfZiLM6eb+MBvNLUapW
	WuIakFDIFgNNmu7dfcO7T+4khpqwXct3FvUW9ifrl/4XQPxPx6xypyEHsQMMIAG7xCOYE3Eom7d
	/U6/iD9eVRzIR7AeXWta9ZIjeXz7x7ea+1ZcB3z1nd5BYRDQ6w7RRG8LkYgVezS+nKrat1kjYDn
	ypoZrWuEse4q68F0j0Kn8Sh0MOXMwSpWV52eiPa9rAjaC89TEyxhJlsQpqzzVr8yQUPYPKE
X-Google-Smtp-Source: AGHT+IHKHcWYf/OgOrf9O3FcoAGEsMn4vt0y96TrbQy13IkeRq/FUB+urbvhws6fwBpAAavMVngICA==
X-Received: by 2002:a17:907:7e92:b0:aa6:9631:9222 with SMTP id a640c23a62f3a-aac2874a950mr1828712466b.2.1736153354990;
        Mon, 06 Jan 2025 00:49:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 00:49:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:04 +0100
Subject: [PATCH 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks on
 error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-1-271ff1c00795@linaro.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PhVBTMK/6+dy3CEy0PY9YFYK561quc3srNdqv8QLMdg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kEv7KHY56NiTm9j77NT3LYMCJ8uIFoRUbF3
 5W2BFiJFq+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBAAKCRDBN2bmhouD
 170CD/4vWTXyM+nvORyBOO1HAK3W0ud+c+2A8tl59Lb1I4sWHkW4LsivhtrE1Rwl5GdaJ4TjOE/
 H1S9aW6Knaj85ZbFgSn8yKFtH4gPfhlh25E+ruqAzVgR8WS+kcEjJDm6stWoH2vver59o4/PHB2
 ZyZ46MvdktfvPOVelOt11uQbshRiXDbsAFNoYKa6vIfoN5u7JYQP4yeq47XH8SpZ2Y+QtrC+Ah+
 6plefQsrq4PUjEd70qUdUNs/5dDRNj+WEAsYwa7XwfizNY9BgmzaqA0nPRJJu291mMn0q+w2cCV
 3njkqnQnLoZEyRvH2qndWKqv0Lk8Oa2aWrrZjhpP2nXUIaSfWaoYtnRvQLXBqoMmCrdClhVYm42
 OfxsGBUUZCHIJbudkTKO6McO69ugiHBMC7ELfNmZs1as1cyAAoM1yemtUhTdwumN3OXyL12so6a
 5FqymO8OhgJ5EJP+/BCcHMwMh8XFggQeYVAnf0xv0JqLB6KPIxwHTxJ5PAWImeZrcWH7svCjMwB
 8EXxbxK7fA95BKBNWO2vbgBwTdsFSobfFhDPyaX3AvfcGRNgeJnjEexIqNgyHdQWTZAOdPdq9LU
 FY/x0NonnDbO7lPSw39p/C4Kl93CNn+QGF2Vjy7GyshrYPZtwshEd9IWB69OIUDZwvmS4VWk939
 JMpdFnWtunCaGSA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

dsi_clk_init(), which gets the clocks, is called only through platform
driver probe and its failure is a failure of the probe.  Therefore
NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
value stored there won't be used/dereferenced afterwards.  What's more,
variant-specific clock init calls like dsi_clk_init_6g_v2() are not
doing this cleanup.  Dropping redundant code allows later to make this a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a98d24b7cb00b41d3bb371a965a80ceaa93775a6..86ac145076416fa7651d18820266a00d28e44b6f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -292,7 +292,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->byte_clk);
 		pr_err("%s: can't find dsi_byte clock. ret=%d\n",
 			__func__, ret);
-		msm_host->byte_clk = NULL;
 		goto exit;
 	}
 
@@ -301,7 +300,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->pixel_clk);
 		pr_err("%s: can't find dsi_pixel clock. ret=%d\n",
 			__func__, ret);
-		msm_host->pixel_clk = NULL;
 		goto exit;
 	}
 
@@ -310,7 +308,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->esc_clk);
 		pr_err("%s: can't find dsi_esc clock. ret=%d\n",
 			__func__, ret);
-		msm_host->esc_clk = NULL;
 		goto exit;
 	}
 

-- 
2.43.0


