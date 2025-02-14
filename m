Return-Path: <linux-arm-msm+bounces-48028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD03A35EC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 14:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C80093ABE70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 13:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61571264A9F;
	Fri, 14 Feb 2025 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SvaYpStP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D10264A62
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539082; cv=none; b=oxq49dlRVE+bwiPT/mksdr5E7Df5o/FT5MIdYRdJeVEBW5LQwJzVeawkuO2AMAW6IH15ECSBWdoiSE8r8wM4rDDZqLf8oxXxfmZmougH+fhvanpco7PmMBSeFLa5X3nLZZSf3NW1nX6PzY25Lz9iPsgnlQXdIwxRoGt2FlcOtOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539082; c=relaxed/simple;
	bh=LPkeNjhgTgrfE3w0Cx2k5M/6N8eDWwbeGgVJuvK3gw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAjZ1/ekm5v3vMtyLxpguSJhvSpMHX/46vXoPPS9EauMm0NqFPYkxLbEM2gfRVvZ1ZVAzEihFjPWduMQQ9KrMX/+alD71xrtj07GFlMkvrX79R4Rk+pHlucpofrXGcLnY8IOz10/pWpiu0NT9Hw9wxvg3Ka55WTmyPPWwUWGKAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SvaYpStP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38da6a1a20bso257185f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 05:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739539079; x=1740143879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NB0wCCnlmpUQ9jhsUGDr5ffuVFC1GqkwU8kAxjRGDY=;
        b=SvaYpStPxRXekunD4mItPW64NeP6lFBRd/qluFZnCWaqTGkOCPOA2gFPYlvR6r3cwX
         dMTSeA9bpAtyXrTtFT4P25QSnbfJRCV06luT0ewJzsTIff3cpi+LVUhygw51eGCskCu0
         jMfoqdmS81cieSBqB8Vnwu75fnBc2SuMbAelngh1/Vl7eaqu1YqztcPbrZN5U/6hQzR+
         C/u1zJp9aB+ipd9fsi2mHPd3IbJJGYv/wcYPpy069mA2hmxiHkj23TMbQO9aJaeuTc1U
         +uAbFUO5CvPLF5yGhTDmoeICrYq93l8RP0uYN4hVxZAD8elKxwj7rl/voPgZubikvSRT
         5ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739539079; x=1740143879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NB0wCCnlmpUQ9jhsUGDr5ffuVFC1GqkwU8kAxjRGDY=;
        b=H4rhpiM2WfrPfKj9Z80T4sIeN0K8xcj5Qzpe4ajcyYDtrefr7An0d77stI46gtqSVd
         MCVOQR4n9Z5Y3kln8VXbsKry9xPPeh8hqcUfnwds+5DyRf783wBnxY1eAuNudDvj8wVt
         GMASOjVNnKuAov6iWRSRFR0YFG079Wkt7YBGV2yg/ReJzQbIDVYZ4gaTGAFwsuI1vOn5
         CgT35mL6v3A42NxNLFjUa0az2QFk87wCISMmxXxhfLlnTAIFfr0pCNjbqhIyWGCf8HE4
         SqdJdpd2DiwHwno/8hkf+0q58Y8jPI9qnTdViafuHv3X+OGYNPzGRa3FpurLNYTDTj0U
         0l+w==
X-Gm-Message-State: AOJu0YyyxT1YBaaM/SZEjMNz1H8a/oxCuDPmld0/Ii71JahNFqqFMhzP
	ofpgg6yvtd27zOJiNYbXZLhW10kANRsys5R0DEXZWzyALzXF+olnOoMxxSt6s/Y=
X-Gm-Gg: ASbGncuGjDbI6vfpdndd9f6RvSP4aWqaYQnqAViRrILo0AgP4JDAWOSgFCrF8sxrLx3
	uc7b1UotvBvp649+efi0ZahI/JaypMxZkm5gEEvf+ihYBrty/HPeuzcIoeLy+TJsHJ2TY8vc2C6
	KXfw9ifsQgMYIDkNtcjyscFC5P2tdcyUID5as6TpOAxoVJuL4gvB/5ckv3E9JGz8PYzOEaEfM2m
	GQG4n+kQCjIAR/Mf7vzo6lZ/82qIl3+TgVfPaSl5BDCcmdDbALoPT5Ly0Zww7XYF0GqUlifdlP/
	Wk9iZmTB7D38gWOZebFc2tiUdhO2HjQ=
X-Google-Smtp-Source: AGHT+IF8ZnKnRDAen3JkbML52TX6uJAA3HnEdc/rv0itSdm1wPO0z++HDOBIO7lmH5u+PdSl8U/PYg==
X-Received: by 2002:a05:6000:1a8f:b0:38f:23d0:fdaa with SMTP id ffacd0b85a97d-38f2c7e8b5emr1623911f8f.8.1739539078710;
        Fri, 14 Feb 2025 05:17:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 05:17:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 14:17:44 +0100
Subject: [PATCH v2 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks
 on error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
In-Reply-To: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LPkeNjhgTgrfE3w0Cx2k5M/6N8eDWwbeGgVJuvK3gw4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0J/cUZuSVvSZtf6PljGtni1J0rGlt4NnGK0S
 5mv+KmYp1WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CfwAKCRDBN2bmhouD
 1629EACTRdHHc8EpKem2FnQ3ucYUjrK23Tt6Su45uxptKsF51W9HnDFOcGqHdmlU65lg7ByccqA
 G1XMyAMBZlLqgg7oM33y/k6NR6zUo/1Wnf6cY1/zQwhs4CZ/VaLIZw4DVkdjXzxulLGGOLpyx5O
 14mI6fLNfZNptj44gXDGOIjB060LxrhOVyfnhT6YW0ldvlo0ZZvSVGvLDbI+P1fHxur0ZXJTksG
 ERtk9CtWdgbZA2fbxXQUDbAZpuI934VpxiecQdiofbHrhoEAkO8XWh7uQUDkWrwKb4IBChIZAfa
 DGn7WLXADtFjENmQ3DtxfXUBQ+V2tY6rZSRH24+tq512zMU7O8lxB2eJFNpCirG7n9KVY8cbhu3
 nHewXucKN4QzNLUgoRd4T3Ofa7j9bPtZoi7NKtZ4cdbZOPbmCSqVG+j49bmMM53b+R2/zuwuYOY
 sXul99MxJiG6cRoII0P1saODFouJRTb8UgdNDCqH9PQtpOdRg90BMxIVr2B2M4NsDl40PwmxMvX
 BlWbZQQreXuDNh5GVqV5T+JlpPfI05yPcfWDf2jYF/SEUOjUPHhSpmavvzPLcimMrOnMnzOJHT+
 Zxe7zCghfP7/nAcHUM0x+Bc6TAzTcNOsfw7uTluJF2mWhiLrG9PLYniOH/M8If+eIVI8G3DHYUF
 po+1EidI/IGDpgA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

dsi_clk_init(), which gets the clocks, is called only through platform
driver probe and its failure is a failure of the probe.  Therefore
NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
value stored there won't be used/dereferenced afterwards.  What's more,
variant-specific clock init calls like dsi_clk_init_6g_v2() are not
doing this cleanup.  Dropping redundant code allows later to make this a
bit simpler.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 007311c21fdaa0462b05d53cd8a2aad0269b1727..397c9f1f588558b2081d6400d2cbae746c900697 100644
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


