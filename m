Return-Path: <linux-arm-msm+bounces-3070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A57802001
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C9D1F20F61
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC981375;
	Sun,  3 Dec 2023 00:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSRFUDAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B109E103
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:27:46 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50be58a751cso1036874e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563265; x=1702168065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+F9KtnHAuBlxFpyMIAKCtS5pRfWJWCefg52u/IwI3Q=;
        b=xSRFUDAZNNYQ859wCTF8ljnr1Y/U3rl7z8uCPTbG5C82zpC7812D3uCtl+ZxDG3qTj
         wpnT90hl6h2y/sLr0keiKkfeZ6V0bxrZsLAaIo3RrruDOCJZjTW2O726YlK2Wc+H8ozx
         2rppyc/C1F4FQTWUppAbZ0TrwkTLCIJgbFnK49BthCtjrb5Yinn8jvnUjjkB+C/RuFYx
         SGi1ZMzOI6xjk6+BEsabJgy9lA+3IJ5X17HFRCeo+SFDQbQvz68j3zhNe2c9bPKdA7JS
         pcxT0WX/avzy0uMXQWGZLNBIKN9Ln90SjCs43CAVaGLUQhRC3STE0aANJa3kOAXc1io9
         n/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563265; x=1702168065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+F9KtnHAuBlxFpyMIAKCtS5pRfWJWCefg52u/IwI3Q=;
        b=wPuPLHFJmbWXmydPXo64NAFjNasV6SVa0t+c3MZxigarvt3+b5/clyWup6BRiggbSS
         sjAUQ5KH7Rvw9sEmh+4gQk8OtRjySdnkqP8WvdKIIGRsY1aVGnaCBFQdn9exvnqzq35N
         aWgwc6pB+7i505ax0lnaTdtPsZ67UuvGrkeww57WrT1nB/C7a0qP41zkxquDjpv+mXAf
         wPQb0qX2xwRz9+SECLvzqoYnlCLTIoBERSvWCPXZKIeNaChbDACEMdu+gjylQ4mRsF+C
         TB/zPYVtd5wBMt3O7rf2kg6zVjUGZHaW7jSnJJrNYr5HH+OrTXWzkKKGaoZAr0cExCv7
         AE8Q==
X-Gm-Message-State: AOJu0YygHk7mQUFnWrwQ9DTtb4OO/GYFc7hALJ21vJbU8l1mm+f5c+E8
	c28wgwxbuFQ9eiMEG0sG9811bA==
X-Google-Smtp-Source: AGHT+IHHUNC4uz0HPKwvp/xqcySBZvS+jzdLyICyBJtqV7EARMTu6wxJEg42v6egaFhvdHxCg5LZSw==
X-Received: by 2002:a05:6512:401e:b0:50b:d763:fe40 with SMTP id br30-20020a056512401e00b0050bd763fe40mr2278754lfb.91.1701563264970;
        Sat, 02 Dec 2023 16:27:44 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v13-20020a056512348d00b0050bca79a59bsm317231lfr.196.2023.12.02.16.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:27:44 -0800 (PST)
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
Subject: [PATCH v2 0/3] drm/msm/dpu: enable writeback on several platforms
Date: Sun,  3 Dec 2023 03:27:40 +0300
Message-Id: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This enables writeback on several platforms where I could actually test
it.

Changes since v1:
- Fixed the CLK_CTRL for SDM845 platform.

Dmitry Baryshkov (3):
  drm/msm/dpu: enable writeback on SDM845
  drm/msm/dpu: enable writeback on SM8350
  drm/msm/dpu: enable writeback on SM8450

 .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 ++++--
 4 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.39.2


