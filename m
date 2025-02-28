Return-Path: <linux-arm-msm+bounces-49780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CEAA48ECB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 03:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF0E616A13D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 02:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B8D156228;
	Fri, 28 Feb 2025 02:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ky1v8DAY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDE813DDB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740710449; cv=none; b=PNmqfTRqZVduf37SVOs/P46xVyzL1nWhgEamprAxG+By1Pyg+9YRGHXdgnxZuUPSgctr0B3q68OHMN8Wd1RI2MRCplEoP181wgYVccoq9DTEU3kDYMjAEewF7FXuJP2Nc2MCc1PVBdKO1v/6UgKD3omaPhnthYGNp7ajHFJJRNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740710449; c=relaxed/simple;
	bh=7BzZsMBnZu1h07UISleUgszbH3T6+OpRP/jWCT7kc0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APZ5Ftlby70pkA2Fk4pdDUqbrgfd466q8H0bLuOeXJmwrLhL/NlznVa3s3LKU4U4AwnotfpnkDTOW6fPInITzU03Z0STnKJ5P9KfCt9D2W6q1Y77N8qoJd2PIX3NZNt/du6N7nHIX74p8KCIkssRgVQhTwpRiPJ3MkBevXWirSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ky1v8DAY; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30a303a656aso17361001fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 18:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740710445; x=1741315245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21TVA0G0gojITtd03fcIP3wwFgnkOgv1z7AmIqkOOEg=;
        b=Ky1v8DAYh/0ExZga0A9yqHc8DKIbSgZpuudnnNuJIDzDJ4d1NkP51g0UBoPaeaAojX
         JLdibqAIUg99akohjEU/FnADJnP3icywxfjRshVMpju1y1TCLEPlzB/C070fqvkVGcpg
         v4ZDVG0Kv9PX4EM9sKcyu3c2PjPjXG2sG7gjiyJvP196Rbh2QGke0uk5z0nIWdJSkEXH
         rExSjPn5zkeXYFOqhqSmCoLTf92oIL/21yKV4m3ay+6o437R3J7tyhNXXXggaUnxYy1u
         wqqqdBCfoAqCIDYNu42mWlLvQl4lGuQQFXIE4bwl1lMpu2Tsozr+BdYMk/YQCQriowog
         8mbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740710445; x=1741315245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21TVA0G0gojITtd03fcIP3wwFgnkOgv1z7AmIqkOOEg=;
        b=VYBhB+8/KpuN8YcS9nnXbtouUmtOoiV++yCOSxXW1pOQuvd1QAf2SihHgBwI10imRc
         er7BBDdlamRlF+4UI5khnE56560PnnpEj67haGuVGMOYd3I33wwrgu0B39pfnpkrz3nO
         by0L5RkaRNJTnOMA75IPJevvBwqqASjxclFhLjd45SLMj1AWDAPVsAG2yyOjuaqC+VGk
         CZCHZpX4sLPnLl9OfxqGyFLge5KNstls7vRkRA+7AYNrP9Tczv9GoKUjS0NMqvPs1eyI
         Z9rrsMWLhiFKNJo51ouN7E6MJcs6eBrCM/DoYNnmpBTA++dNrVZEOVKUqClkyDLDMNgY
         sEmA==
X-Gm-Message-State: AOJu0YyTVN7S5txdn/ycEXqTen9xPDja7LtXDzpFhSfu26XrNLoWA9ne
	bY2P7Mls4z/bAcHMSg1low8VwcPMOdW7e+c7+tbfEQf1JtX2MZ+Z2y5dAeeeZRg=
X-Gm-Gg: ASbGncvG+bDmBprNsNapX6AHyMC1mw4BSzb/M7gacQpUhi0US79TsX8GQG9gLQYSzvV
	UiOV6n+fig7K0l8BbM8U83KS03xGCUcPBgHsOb72nlmyyonAQu2OFZnn1+h9qQHIG8JG39p+sWw
	O2KOfSIHuD/nyUBcgYAXU4EVjhSZwfs2Kf89qxue/YA19S+o1oxlTGJOxr2pQ37MAkVtZUDffuL
	qDPNXQjOaQLLpSCrB5uA7076DORocmDLdysA0Nvwkfxr/amxzIvON5NXjXAyxWVIlh+tuNWnE9I
	WI6GA50rOsWZmIN+JobkiGJqyb9aECfy5w==
X-Google-Smtp-Source: AGHT+IE7Mky/M2fDSKSULiY34EQmUiMxEjS62GBJfX2zcyCayPQhXRzgX2IA/oB8JS7VImdstOeq7Q==
X-Received: by 2002:a2e:be9e:0:b0:2ff:d3c6:9cf4 with SMTP id 38308e7fff4ca-30b93200529mr4213001fa.1.1740710445348;
        Thu, 27 Feb 2025 18:40:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867a7403sm3493881fa.17.2025.02.27.18.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:40:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 04:40:38 +0200
Subject: [PATCH 1/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-fix-catalog-v1-1-b05d22fbc2b4@linaro.org>
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
In-Reply-To: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7BzZsMBnZu1h07UISleUgszbH3T6+OpRP/jWCT7kc0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwSIouiJGhGOZyYTg9iPINN+LzRYzfnPSJR5m8
 KuNAd1pze+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8EiKAAKCRCLPIo+Aiko
 1cATB/9IAWUW3l3iAA5pqb5DkZfeWKaw/TMntlcwc4Bb6aqNPNgO66bOsVK00C5ogk6vFwOFct4
 PnmRtKjTfFCYwEzwXiNDfOq+Ua7F1PmHEuAlCwH5nZGx0H7/N9tuCYrPSA9hmqEbEroie1zHG0s
 kTnOeXsw9p9puyTdXaGzHOrU/nizHJsXuCuBX3aSAGQmXCeAYXPy7k7HCb3aRqQrSeAsSfg6rYy
 Td0GRICCFRhTJJ6mQWHO+0IXlXfE5B3fu141VPJ5vs5doAJMkBIq67op4EGTsg7ehQCQB4iTZ9i
 MIiT1DyLeWTiMoh8f27DcnrTEMaQpbsqCxCxiiVZcih9G4fa
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8937 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index ab3dfb0b374ead36c7f07b0a77c703fb2c09ff8a..a848f825c5948c5819758e131af60b83b543b15a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),

-- 
2.39.5


