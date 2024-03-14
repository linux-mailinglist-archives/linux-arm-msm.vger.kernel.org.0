Return-Path: <linux-arm-msm+bounces-14051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0CF87B589
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E265B22D80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636DD8F58;
	Thu, 14 Mar 2024 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ku+ZbwC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8990F5256
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374543; cv=none; b=usDs6pMK9qJrN0ogqZiGPtKtxIkM/MRGFnd1HT+IbzmrxU3InAetQTlkyw8Pure5QxcZdZOHjSkz8DEMmzACGgS4/iRPtmdmwJgJITc4/Rb2710bhWwnUFavq8Sl3igHkrEi3ke39ZxxXiPQeFPhp5qPwxTC3IV07uFqThUBO+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374543; c=relaxed/simple;
	bh=XCBs9m2CvzQ6fJy7OLc41Y94osXveFW+L7i+WiusLso=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ACNINNdmimBW52OivzaH7KaXLoW9l8M1BtbO6tl1EapMZbeHQ0Y47BWxlMMi5M01grrOx0rSbuu5ZbG2ZUPGe7ReSuTJiLPQQLd7cyUBwBuO2nl7ldwHukO+bo4IyUVflGFnUtVIVz6PTVTS/4UhlM2lecVlheZhOjaXlKAhovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ku+ZbwC6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513a6416058so692550e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374539; x=1710979339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRoAz+CmhNjrfdAdzTuoudY5YtPxIo6KTnpc/4/7Msk=;
        b=Ku+ZbwC6hPk2sCtvNjTLEUIGMadsh8H1KRW1mMoq3mRES5I+uI+w4MsmOaEemZeOy4
         OjTF6oisA4/fc8w23P16Gu/CfkrYlkHaPEqjUUq5QyJL4ukUiB0xXJbwsxFeaz+jNUVv
         /O2r+zw2z9fg1Nk9MDq1XE9C2GQlXSE2mWPhywJD24woECZwXXJQf+8BwhzBDZ7QsYLn
         2UDDcPykP3DCrDPQuJfPmTrk4GW4i1hYpFlltl95S1xqwnjerij6zSfhgKWJWsWRofD4
         /ee29aAsEaOZZkzKigL1lFwspKJciFffKsB4AW6AhvoFigYb4+v2Je8SjhCPvQQ2SYbc
         MK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374539; x=1710979339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRoAz+CmhNjrfdAdzTuoudY5YtPxIo6KTnpc/4/7Msk=;
        b=Dlr+cRmve96bwHo5IJ7PbUMldLZHI14KTB9qjv5R4JTnKmoXrr58WWuc/zId+2PVdu
         NSvBEFF73wHVSiNv2TODUQgbgKRmya4JDQEBZer+TU6POcnfVO22rSoCv4bsaRsOhdV9
         QwapMo1dPDLsUcqJ2b3OaTPu18nfchnt6Bjqw5VK3ZYNZuPIpCTPsFnblcZ20LGRbF4n
         cOxESaoY31sPyBIhf07sZZi0SmSfY0HUVmIwsfGa0SPGXbbCgTHtgoEHqYGC6S+5ui/I
         vq7iehS0nkqQM8AC7E1nKLPGhpqJwvLfuSedVSrTdBcumZmEEKN4VNgvgkZfZCv0Jcjp
         +BdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv7Hz6zCMKmmPSjdH2inLR0lHMplGurhcfuqN+fZWR7FNjN9y5pZpo0KVYZ+Gi0n++vi2pZAMHHGBAXrHpkb2rSM0OPYwyUXIf2JhAjg==
X-Gm-Message-State: AOJu0YwHxYjjbpSFtvgNowhufOLUvFRM/K12UB80KkVQSOWZBgq+6kLH
	uf31CbxIlYSxTzn3nOPdaLDFZsxDiy1iEczFXKJ+XdhG0rLEXlNdfcI+mfuC5lI=
X-Google-Smtp-Source: AGHT+IFof1jodr968Rtad36DFoDLNMwGgycfHRg3fwZPFnqXAtPT2DoN1hDgJKoSQ6oe2hRjTrQBmw==
X-Received: by 2002:a05:6512:54e:b0:513:c17b:1426 with SMTP id h14-20020a056512054e00b00513c17b1426mr51650lfl.11.1710374539755;
        Wed, 13 Mar 2024 17:02:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 02/13] drm/msm/dpu: use drm_rect_fp_to_int()
Date: Thu, 14 Mar 2024 02:02:05 +0200
Message-Id: <20240314000216.392549-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the drm_rect_fp_to_int() helper instead of using the hand-written
code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 44f35ae09ba6..9c52fe3c0261 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -837,13 +837,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
 	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
 
 	pipe_cfg->dst_rect = new_plane_state->dst;
 
-- 
2.39.2


