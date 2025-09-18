Return-Path: <linux-arm-msm+bounces-74079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA606B84D18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 714061B28410
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 13:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BED30C0E6;
	Thu, 18 Sep 2025 13:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8Zig5d1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E725730BF5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202161; cv=none; b=ForMQmPuY3/Uu5pdLOa2BZRaqlgU/NpyHCW+8xsxdHfcp0oW0k1gZ2fKyxAURKz8G6YS5h3gRVIl8vte3CEGLZ0aiceLltEyyodiIMp8m07DlObemI3R0bIrXtCeKCG/tUPjCCBUQCzXlL/5UcrHjiHYdg5zgh0oE24rmvveGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202161; c=relaxed/simple;
	bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UV514PY3xCDu5wlBiDFUssiQJU4MbeFm0vZ8rPO7zaXW7pqmP2o0LHhUmRgRQoGVXX+SjMyzAbU7VRbSxhb10qlIJT0B/e3vdq8+VSXHiLqExD20+9MblgrU+/R7OgSuRyUPA84ifh06xQQNTBG+BOTKvV0Y+e5IQnH4koiX+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8Zig5d1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32ec291a325so729688a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758202159; x=1758806959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=w8Zig5d1WAMXKOfr3J62G+T4sJ5Li7MsSv9HHEJdtUlx/hor5aMGCOq4Gkb/bybhah
         gsgdQQfiXaUeDlU7M2r5dGbt7/IhWsnq2srPSnCY3jhU/hx2g6MAPXYSgHAKGu0+aL+c
         9GNervOjb0NnAdHt6dFph/LSSZzClXu8z1oXxMG+AGqvxZVpYJXf2C0vx0TLhJX6Vw6E
         8vtFRJpnPTOmQI+RPyZ67r5950hoWlmkrY05qWZfe8AvzDOHwzMNFOIp2UPlfFC/Jk1c
         ZcwH82Mkih9hKvSdVynjvhkVEqPd+l9kWqN0APNfxyD8tv6J58bC7fgx/TmHzlbZ1+Km
         P/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758202159; x=1758806959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=iCZ5A9akZ+JgNbWs1olAO284vLCfH8kpxsO3eZoJCuktifJhtE5ByDcnNGIElYzJJs
         nW2pwSVWfvNYj48FXTy2XJ/nHD4/z+R7ZZEPEnV/96+HLQjstbSQiG5SnwyIBoNpoq7i
         Bh9C/nSSWeM3zL2QIYHyv6ME7y6/Jt/8/5wQjRYoBwMa+o6q+T8jWZsWHWyD4TWWKMxm
         osTGthb4NJGsxGvsbphElXfnLidW+mep3Xd0uOgTt98P+R5z79c22bXT0iUkHO3Kuywn
         ARLCuqvI9viRhW9TrzOJkjFXPrzvlM0z4GfkyBL5a7OaBfAc7svi3gHcz0PwLgRkNk0V
         greg==
X-Gm-Message-State: AOJu0YxYSQ93mzy1gP/OOKZdqXqYxdqkHg/uQWcZ6PcApTCkANdbJDTG
	BKAwD6ar+gXkTZzGnBnM27f5lJUXLi/fJMN2Y4ivxe9F4pQW64xXats6/KYErYIxeY0=
X-Gm-Gg: ASbGncvF+JB/a2HLr5F9u+UeJ4IQyms3RsXO1CGOh/U5Qsg5/LWFeDuX3akdHf/1gRV
	5bwgteOXx1pvkMVxg3IVPvDMZWURSVA6puKlTu47EhiK5XiM7RfcPsI5GXYme9ZcQpGSInTikS9
	df5uip9KfjZRC0Bu91tBnrWaOCd8+1Nwz6ts11Cd5MIRIVKF/DiSGm4AafNBnvU7a2gc+7nYf5y
	X9YJ0IthifpcbjMkZ/2WAfEeBljq3pUGIQRlysZOGILJIkAmhat5Dws/iOuMa2bj+8AAHNucNJU
	cgjbSQHvnVxL3PBeYqKQYg/ljJd1ymBKNrv032M5FzEqJ503osff3cVHhxUM/iq9oNTeHhkToLT
	9p9EUB/Ko7F5FCpPCh5fzVR9yQscmBP72Jf3Bn1zuTBL3Cw==
X-Google-Smtp-Source: AGHT+IHpvGiImQFwMteDMnsQ9boqP2YBE1lyMVqRTtWnZvCXRZeXk5yWOTPnDuzCAJ9Cj66gJ+B0Qw==
X-Received: by 2002:a17:90b:1dc8:b0:32e:7270:94aa with SMTP id 98e67ed59e1d1-32ee3f757dbmr8938250a91.19.1758202159252;
        Thu, 18 Sep 2025 06:29:19 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:29:18 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:53 +0800
Subject: [PATCH v16 01/10] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-1-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=El5ho2A1Ag5BjirXgdffSiX1h8pTj0dCcNchyg38ZuJA1UFEylEq7nQEPDG8YtcX2VYdfhjGg
 cg/nvcBSPMKCNxgMJeVm2co5QzxxSEYGb1vhmg2WPVvoJRnC7LsP9PQ
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
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..3f344322b7f214d0050986e675b32522f8eb0ba7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -374,7 +374,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
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


