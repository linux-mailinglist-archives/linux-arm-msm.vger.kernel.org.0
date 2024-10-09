Return-Path: <linux-arm-msm+bounces-33641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9B9963EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9261F21335
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C90E18A6D0;
	Wed,  9 Oct 2024 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUcVFI8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2D18E36F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463841; cv=none; b=lOok6GVOAIDH7aHyeg9fWolxGi7IJgzY2p+go2nw4HL5TP33enaWWAZHUGcVGtrluRHBoNQjQOfxFMhIQQLA1FgZCrr5D/R24ptRy4DhrQ7SGqB53kLwkWY9UxpSANcLk+LB38Gr90dK+nJCUPwLpTNbJkJy3brOSPv6OD4HdeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463841; c=relaxed/simple;
	bh=WThdm3+r0o6lcg95hlJxNuerWQ1yzvjO0VMSK/DVslE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvLsoFBoYUyjNnAPqbZ4B9LbfHW3w01wSmAg83PbbFUHnlOk+ricTy33/tDxOVtIEMi9LMHCsZCzJBCLn1+sLrJibzJaFqMA4PZ9w9LyPnGi4nHwc5hwzTdOFmvPoMy8V5jTTr3zNeRpAf5l5bmS1XKsBMLlj2e70yleWDzgzBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUcVFI8R; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e09f67bc39so5465355a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728463839; x=1729068639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/voAymQ+FLo0K2rDmsz5j/XLkoeZJYYbnZfE87o5mA=;
        b=SUcVFI8RWgoKWqNI2Jz1eWMyUiaUg3SMN0/WD4l+ptSl1PCRjZUZU1TVCBAY7qVUSy
         SFMluSCR/PIlhn/it2AJmvFYKKGo1iijipmaVHg46Grx1KMH2liFY6Fw/dtTCGWujNOr
         k2+UG1WGJzwGg9fddhnT1KScN69OLCqOqWgHaOi1GtUg5OFykbUTMXdXAZz1ZC6YRZkb
         oOhK0ITnXifUwOnFXHiPKanqFes0kw4uH3ZBYbouw9uziTLv8ggTqiRHbAZE+b9kFCWN
         rGqNHG5kg2sC+NQFvUIrVuCPT0fSmB5oR/45K+Aeguv7WwpfnYg6eZqnSMbmlQNv8/hK
         9zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463839; x=1729068639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/voAymQ+FLo0K2rDmsz5j/XLkoeZJYYbnZfE87o5mA=;
        b=i0+ron/YOxXjDcpblF30nR7HKwr7A5o2u+2EjYYhM9t41/syJW0GzFUPQJ4Xpfa2Rt
         X7MIXIY9ZbOf5PuKqhyYnsA+//ezhNNg7SQLIwS/hEgthBlNe0AfEwJjwICNNt5DRMtj
         6Qqg4IE6s5WV2N7PPVnzZde0/81H11au++vfllQmrvEk1Z7K+M1u14dPrf9lKkBLrHsp
         9GHwd1l1A9kEzkCPLIzjaIlukYcBp56kf8QxVug/H+0RiCrKEA/B2MHtHzF2PuGvPriF
         a79wO5V6/UQmNplG46o8H3CRny+2eb+iojGASAgAk9gM1AwFPz2wSlnXvfPHDRNL4kVH
         YQEw==
X-Gm-Message-State: AOJu0Yw+C+j3IzGO2phUUoEr7HA0Di5h6WGYJV2s+Zyp+8Hw5plApryO
	RrxNl8tNpjZ55NetmdQP+J7QL1pFFSBRDiGJM/N67hKhCbZwRk8+xafyqT+r/mE=
X-Google-Smtp-Source: AGHT+IGLdVPxQWHieF+9EHa8/WCKnJVudcn9L6wpuGsElJdCrsUD5SxSB2GtYHpHGZh8Ho+Hcyh1Xw==
X-Received: by 2002:a17:90a:3489:b0:2e2:9a2a:d218 with SMTP id 98e67ed59e1d1-2e2a21ef24bmr2165076a91.2.1728463839143;
        Wed, 09 Oct 2024 01:50:39 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:50:38 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:16 +0800
Subject: [PATCH v2 03/14] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-3-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1237;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=WThdm3+r0o6lcg95hlJxNuerWQ1yzvjO0VMSK/DVslE=;
 b=XyWO3HZGDntoWFWpltwc8jk91TUGcI9j/DmmGgwXf1vPYLP+Lq3fLNGmynRO2WPSmNAdXF8VD
 e+84dPuuD53B+CK0+Zi+DNVJEJHL2kkrA5b3HQ84N4bqC1gD7g3BBDq
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add the case to reserve multiple pairs mixers for high resolution.
Current code only supports one pair of mixer usage case. To support
quad-pipe usage case, two pairs of mixers are needed.

Current code resets number of mixer on failure of pair's peer test and
retry on another pair. If two pairs are needed, the failure on the test
of 2nd pair results clearing to the 1st pair. This patch only clear the
bit for the 2nd pair allocation before retry on another pair.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2b03ab907c2bc..5c9bb64df7930 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -306,7 +306,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Clear the last bit to drop the previous primary mixer if
+		 * fail to find its peer.
+		 */
+		lm_count &= 0xfe;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1


