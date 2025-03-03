Return-Path: <linux-arm-msm+bounces-50019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97405A4C4AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 16:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34A7C1735D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 15:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675211EE7AD;
	Mon,  3 Mar 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFM4aIYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F97214A95
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014932; cv=none; b=g2Wv+g8vl6Ehs9o8PMjDJuIOBvqUWKXuEGeiTuhOrpZ4zfqGXI1p1G7PbKus0H/vZuM6N3zDP7fR395YpbpLqQI2bspIpLR7iRBwQyhYIVSu2anMb4IQ3+NLevlalYfmepEhHNZyTpcnTAG4m4ANNYm5lDQy0PIbs4EMOLlivI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014932; c=relaxed/simple;
	bh=6KiLXjEpLod6o/Ty8ouIA+JWP5hGEqwM+aKGxHjhLOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lftzI36qQIACbaSPAceAusLrJQL5EPChagOBZsEXog+66x3rpdgL3POd7qQnox+7KaDAoGw3M1NhZtIOiISqUdnP8k6Hj2MSoRfm4rsthDa1IBDoxjuAXSjMDboGhd8iB4RU7g2SwwjmvOKwxE5LhueL7me1UUSEfxw9Si1g848=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFM4aIYM; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2feae794508so6292656a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 07:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741014930; x=1741619730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEgnok+ywGlBannr6oE9rIQ6mvdj6w1AkrRgjoSATVE=;
        b=IFM4aIYMmNKquzh3u7i0OSX/rB0bh0Dj2zS/sCgQD4iHGAUt+GuUyt0m2X3GsYk6uH
         QGEQIrjhhNB77OlZe2IHH+ZIW1QNNfHEhncpJrQtSL+8s11qqZLd2BnNmnyY2ID+ztES
         qHl/GbqTzDc6Fh0cYCP5qZC/yJTLYk0cL6OM0f7N1GEHOVSXdqE9bs1j51Cuk2aYpQzs
         4mS4s7x3JrnLgSJaCRb/6qV1W10RGbljfHoWKnCGj6QqilmACfom9PSgFF0Lex94F4o0
         m7PnwGi9lh5euflVLXABTZ8FTW+UZ9GxwwckDtriXXg4euXavBNIGEE1SIFNz2lSoG4f
         pJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014930; x=1741619730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEgnok+ywGlBannr6oE9rIQ6mvdj6w1AkrRgjoSATVE=;
        b=c85g+jBPo27mZbKWvEi0dcXQzfKcB0kbQffuGf7sA4G9GlG2e88KDSM0AeSn77TqmU
         r1lmdbqmq4Ol8sn0g1OTJOTgGW2s9MdP7/+cytGhJa2k/pvfWD/Hw73/iwerjipRhlLa
         5bhtDO2v/temHb3oPdG/x/6ukU6ZiMFV2zgDPKy2/IAZimyKDgQU5QWSCH2Yr/yI8fuj
         UWyN0DwgEJJAcW3htsFQkJXB2s+OWe2vLYSl+3ptQ+4bPgQ3VW6UrC/SkTv38ZCbaCfU
         /dJMdBsAjdBxxcC9DPrV8jCVjrYBVyUrGBoE5bm0/9XYyb2RqL/enJNEIl8PpT5z9mfp
         K8rQ==
X-Gm-Message-State: AOJu0YxOUiGv5xS0YgNwYkpJaEiS92Fp98PlfiO+Y1+87h52PiSodRih
	hL/wXLHAlkwXKqToqfUevbNUGhzYIcmsmOKMnqNPbCpoeo5e44gzx1EQ5y78r7I=
X-Gm-Gg: ASbGncs4+3s1dtmZR12+LY+RNg19PchWq4uzKtYSVBTFIBWFXoJTrk1XePHAY2lKc6o
	tiCUvFG4xfCxVP/bAuRXclNC+Vne8ZKuEUYNVxz7ShC/Y3dPRMo0VUMtsYszqRjt+a/YblcTA8E
	wR79F7L4UisoKEPe1s6afpWQUTVzlboRO1NFRYF4XYyTHiDvU4/xd77VvjGUzojVVipRMNk5RZd
	SB3sxThjDWoYcdFY8jiaYVEtZ3bmtvideJuF+C19pJnBw8UdZsQ5xTWfQiah9Y56VSKYtZPo2Xs
	r+9rfzjzd0Naw31c2iW37fBkdLEiubcRvzE78PXM+Q==
X-Google-Smtp-Source: AGHT+IHgPd7hB7yPXWWisVd5/ez/yv8IIykroy6iDLwr4GSkdS1zMX0dZhCdL6RsY2usvlf3TSat5w==
X-Received: by 2002:a05:6a00:17a8:b0:736:3bd3:1a64 with SMTP id d2e1a72fcca58-7363bd31b45mr12732813b3a.24.1741014930031;
        Mon, 03 Mar 2025 07:15:30 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:15:29 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:35 +0800
Subject: [PATCH v8 06/15] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-6-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=6KiLXjEpLod6o/Ty8ouIA+JWP5hGEqwM+aKGxHjhLOQ=;
 b=zm/Dw2llcmLMxDOCKUf+KzaXpfdqsyYFQikzN+y7EhKHagSgLgkAFyLnGbdWcff/N4pYIIHb8
 lplymHQX0B5DPwFJBQPw95+6cR9b/sdHAxGHSuLrnNR1aCJruHUViE+
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 24e085437039e677e0fb4bbd755a8cb3852300a4..3b3660d0b166d9b0e947b2c918e37adaae8b76d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1


