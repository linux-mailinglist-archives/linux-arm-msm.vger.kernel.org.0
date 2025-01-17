Return-Path: <linux-arm-msm+bounces-45418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28754A15373
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45690188BD79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE5F13CA81;
	Fri, 17 Jan 2025 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fqx8ITmL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0AA19B5B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129682; cv=none; b=tCVYeBfJrWHJ/iDBQaun4e56zJb7QMvnx5QCBKCwB0Ir+KJrUOFL4PEb7Xb4zwuFhZJu17Y6M0bwZqtZSPzLo4YTanLlrfFTBfCehjPAMCcWHmhqYnKlQ65SSSg+IeqMgh7I9jD4V0XkWYr3aSRbek5BB0m2yCUiCoQMWqAxX9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129682; c=relaxed/simple;
	bh=nXrugQ4ghuOyVc/9OeEaC3SJds/XYiqCarbg5CsF7CI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qydlt+265bDgE6RCe0mtqdmN9/w/YAuYjO5Lmo218BmjLNjfoq9ruwedCUdDfgzqGR/mBIH7RxfNmqdSuF8ux1pNMGD81H9up0M5lj3COcFPm2u200XD1m0h5yHqqXiD8diacPHbDKPTIFXyClPgeT0Sh8LZu82o+LB19qYwl+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fqx8ITmL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2163dc5155fso44546155ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129680; x=1737734480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4/m7UKLS8mvjwXaHQw1bbd5jh22z0pui9nmetA6kaQ=;
        b=Fqx8ITmLg0ZuwNCBZlkWEen9FX6E8XUZzLk2klm/jQEFnLUtAuClmYlrpQV8+Fen0z
         g/08wVv2ccfqJmweELoBay0f2hEuaKQGxCeLioCIh7gOh4LyHBLB9qA+V7V+aXieuMEs
         jqKS0PMVU2AOotGKT8jYo4MNrBtOYh4yy+SUCZgaAzJahD8ggNy+uBXCeB0rTmoOqoGZ
         FWBvXkltsYb0qPeEiCkWnBKnUJd1K9jDkatsK8Eo3zmTX3mOkU7aU3Wshi0FDoIXskFM
         uFqZevlu5Pqpgtd3EhOV9Yin0qhXGrDTZ+F8SzAX22yqKCW5L4zehJCu05NGHFgDTV4R
         9e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129680; x=1737734480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4/m7UKLS8mvjwXaHQw1bbd5jh22z0pui9nmetA6kaQ=;
        b=hG2MHmcanZiiKo3byFtPEzPN/yflSrpgM/NW/J4EOKGHlR7Gpctunc/Hy9xESy/0Ix
         vVJuqAbRI3bkjW8q9bvNTQI3eZuORYnWmdLYIzR4RJxxPk35inGJcu9cMoBd1FImP9au
         eg1eIbWQqGGCl0c1QvPxKo6fkiTRVvWxktOURMJJKcigCYlGixKWX4lf04BpdwvwNzWR
         HJMSVRJG4LO8rH8q6MH9H/3VUUODvjHyRLRbm5VzGeyx1itT1M9SqTDwiAWTxJGX23bi
         vor8+kN2GkDEWCinOUjlGTYdYiH7Gt3WhAKmdFu9GWg38Pbz3fcAmRpaoH/f1ivy4Ktk
         O9Xw==
X-Gm-Message-State: AOJu0YwfdhwSqinGPPxdVYg7H3PHL5/XxRSE7v2HL0QJaggRJCQoRtuH
	XOKIsDBJ7DOoInCe6IGYNKP7/SSGTxiiYhwPCEjz+wnut5aI6duF/oXPA9O0D1Q=
X-Gm-Gg: ASbGnct86v02rRbs5gk00z6VRjOzE7fxBx7Qo/2OGUVTz6FIFWK7atPpOh/I7nMPMfo
	AGN+zhR/Cv7y5dJxWuPR2u1RhBaFVaM17I5q6TXXA7md9Uap+85yCXldWnebTb9OnuxC/R6hWxi
	zZdmEKebJ/l/TV9c2cHSPKNRPXohdPQlQ2uswJQLOfjM9+b/rt4j8PCCDlvtwLPb5I5QY+N+iob
	6PACRdGDVrwjJnJkVLNDOTBgb4tDki3OABSKh/Z6io124Ie96fiww==
X-Google-Smtp-Source: AGHT+IGQjujBJyRaB7I4nbdyg2wIuIFYhY+GNdgeAguj6DANGBgOYmrB/OJPa+SijOqWlOcJhfch4w==
X-Received: by 2002:a17:903:32c3:b0:21c:1462:17ae with SMTP id d9443c01a7336-21c3550e861mr47528435ad.19.1737129679553;
        Fri, 17 Jan 2025 08:01:19 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:19 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:45 +0800
Subject: [PATCH v5 02/15] drm/msm/dpu: Do not fix number of DSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-2-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1875;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=nXrugQ4ghuOyVc/9OeEaC3SJds/XYiqCarbg5CsF7CI=;
 b=CiFOXG7f9vj+cpMXdebx56haYC9huEIIxCvLKQac8eJkUdfWaMde67e/R9tnNNrAChrCLeApV
 JaDXnB4fWB2B/aTLWJxUAMrm4i/MIzK8lZvNuGWFJoT2LMm/M3F2PQf
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, if DSC is enabled, only 2 DSC engines are supported so far.
More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
get the real number of DSCs to decide whether DSC merging is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eaac172141ede..c734d2c5790d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @num_dscs:			Number of DSCs in use
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -204,6 +205,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 num_dscs;
 
 	bool wide_bus_en;
 
@@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_enc->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
+	dpu_enc->num_dscs = num_dsc;
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||

-- 
2.34.1


