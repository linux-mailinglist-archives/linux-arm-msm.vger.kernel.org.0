Return-Path: <linux-arm-msm+bounces-3074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B419E80200F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E55711C20837
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FE6395;
	Sun,  3 Dec 2023 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUpF7+vV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D50F114
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:32:06 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bf2dfda6fso89124e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563525; x=1702168325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H1sh+e6WV9mxF+sYcaPaBBaaZreS9crd7exAJRUxSZY=;
        b=qUpF7+vVMfU3FgOTIhPjGWNy5G+2p1/kyY+nl8/6yDE6Vv8DiDd7vhfHMv0qRGtWuW
         9t5wpjSm4ognY1gp36jBRsjepKEKR/bjcG1Pa/k/1FslN0tTZdRe/FLUH8iRTPOQafXo
         jnuPwoEWjzojHJ/lVufJOWT8AZD6Oflv9z6nTZDPLz4cKS+cDzirU2ZSV/Mvy4x4955v
         Y7uyTgu44AxusyYbySZDQVelDf/sJeUWSfXovUA4yvm9rTDdp5VsYhnDTk1ixi/zzJBj
         /G01GkZOvyrshfrLzWl8ZxIEMtYkrfD6t18Ru9itGH24+x2mQa+6BK/LMOiGZak+bYs/
         Gv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563525; x=1702168325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1sh+e6WV9mxF+sYcaPaBBaaZreS9crd7exAJRUxSZY=;
        b=b4b34ZDsk0ZSlxQqXXszf3bu1omfVpcrDWkjoPl0BQ6pkPf9G0zw1V4yUUE+WYJ7nO
         +LzU08Hx9o2kE8/xmniljOP/xQmVD01p0Qeorh6nagyXG+/XTWeqkh5UQBhalMtNNcu7
         uzMAaTSFkvvGQSJtSQiUyq1Tm200+U+agdFhKTJ7o9qgsYoAYbkoeIT3C9JpgsYdPL9J
         M9TeBiaZeZLIlmakbVMGipN+wXs2IjII4+AVrhEgm9SoO4jWLlF5Jkj+aUT650Yf3XDw
         DrzZ4CyGLipXkJkJmvvkDfVBWBLqnZi46r7lTtBEQxhphlGDpdpmLYfDR4JYdCOrB8cs
         9wsg==
X-Gm-Message-State: AOJu0Yy8ZVLOUXA2DDGBUOuid9nohE6UDkF+1TzulJkkXHx0P6j0KQCz
	JMbqJJ43MTr8Rk61ZBMGXw7cpg==
X-Google-Smtp-Source: AGHT+IExV7d8TC5LUgJOCMr0Y0PtwxL8cWlbUdf980HQHway8QjDisIeQIpeJucyZJBGGAgpBBjIGQ==
X-Received: by 2002:a05:6512:3e09:b0:50b:d764:64d1 with SMTP id i9-20020a0565123e0900b0050bd76464d1mr2401906lfv.134.1701563524761;
        Sat, 02 Dec 2023 16:32:04 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:32:04 -0800 (PST)
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
Subject: [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the other platforms
Date: Sun,  3 Dec 2023 03:31:59 +0300
Message-Id: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I was not able to test it on my own, this is a call for testing for the
owners of these platforms. The git version of modetest now fully
supports writeback.

Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
connector, cat /sys/kernel/debug/dri/0/state to determine
spare CRTC and plane, then run something like:

modetest -M msm -a -s 36@85:1024x768 -o test.d -P 79@85:1024x768

where 36 is the Writeback connector id, 85 is CRTC and 79 is the plane.

Then press Enter and check the test.d file for the raw image dump.

Changes since v1:
- Fixed the DPU_CLK_CTRL_WB2 definition

Dmitry Baryshkov (4):
  drm/msm/dpu: enable writeback on SM8150
  drm/msm/dpu: enable writeback on SC8108X
  drm/msm/dpu: enable writeback on SM6125
  drm/msm/dpu: enable writeback on SM6350

 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 4 files changed, 72 insertions(+)

-- 
2.39.2


