Return-Path: <linux-arm-msm+bounces-66849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC1B13B36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F2333BE1AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 13:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D9513957E;
	Mon, 28 Jul 2025 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vf0PzZTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AEC7261C
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753708506; cv=none; b=iz/pLNrHHlwQ8aLbf46UDcu4a32VpS0ZSYIco6VGpgsdGAtYBnsnmfKM49F0ZXfq+ZegUiJxTHdlALJgCKd5yu/5BPLPLvUi8RhqLF7Jqhbv0JcQwZKlr3KdGZUlrGVSEBuYup/4zfO3rrmURVZoZXcifoamoMXn2SEd/Dmyb9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753708506; c=relaxed/simple;
	bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bj3yazdWudppBJgJlBHscYfedWrtTApvA0SsyAGDTvpFSrG/tT7t9Aq4WyuyBIZ+v5JbStruKu87T33ibRHWtFLvf+fu5iehqU4YxJ4rquT+p7WknHfrTctXOUDyPSY8MTgYfIjyyYqx77KowKTI23MxOkAADU1zat+sb/NuhCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vf0PzZTY; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so3917053a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753708503; x=1754313303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=Vf0PzZTYTsOz3DpA6H5cYLiAUXmyTP8CRm4pQ2R0x1pwnVAjE5eXtnD4Sjc/iwsMsk
         qUlAN44kSj1A3nXZx9U8Bfe+edo+FpzKdfBgLfGOQd64EqtoUl8Y0gAHwaoirz34t3lv
         Zk654PPwEYrbXDKpkoXMOQbyN4hExUQUGJqh6GxI3F9yEcItqs2qsQ0snKkSri2iB0Lx
         FdL40RCwJ8Zhea7ImrLuA4JuRmVJmlDYwm56xah5xs9fY0tolTIY/6SQyGGkxpT5gNJ6
         8hCADk7URVyAZO8xdxTukLTCH+Aq43GJbbAd+d5ouOCNOcVcyRG+QXjrbxCEJleQ7Ixp
         F80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753708503; x=1754313303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=YUYA8hYJSIsmq86Ib96W9kBwe8uoVo6ZC8H5/tbhWulAi8jFl0hoOPpds8+goRprQh
         v1Uv68NsiMCm8lImkW6bZyakdcYNS9VDnReEXUDgd3GIdlR51wFcHFOhZwR6Bg6ZJFxk
         x59hIQ4nxiviLtiycZJqZKP2DinzwaGnkpgkuP0vskHNUxhCVNavuES8Sj3OVKPao3tN
         ONiK6autl49ZuNmixHK6b5Y+OK5mBRet/+e40WXvDA0NG2cteju4k9fsEo85T6CG+uhM
         kqSJL557copnSRDeFQe5Lzx/ZlgWD2HLLaw3fqiu7H/z9XKvd8+2mOeQr38Nsy8QJjvI
         hklA==
X-Gm-Message-State: AOJu0YxW0yhMaEXcTubrV+ycIL1B7xBQiHwMJm/VNIrJiK3MgljgAAN+
	FUVP8TVco2D6gHSXZG4zjfc4F8WHbV8s63uxjW24p5uxd3UvuoOeeXtvcfIML39W4LM=
X-Gm-Gg: ASbGncvQxrFaomo31n0z+VAKRb3uc0iLSOFIKwBqUNhcIxUOlr2raH5AO4jI5OTln9B
	EPeUEMkRBDzl+UuHNIdOR0M3jn2W0ZsQKMV3mD/73TsRl7l9lgsK1vmdNNJlOufU3DwnvIU8cFf
	bRukQh7bHQ40jetENQUyWt2Na0va9ImT/E1JwkPEmSYYBWWfOpLGs+Vhf1tYntIi5GLhBKJP1/2
	oBg3kT8sPoxHIPjNhlLhYzno0S8zm0T92Zc0gTcH3kI/DUrFqLDb9ahusrtDVnshhj3J5BJS4Eu
	3Zs4O//MivQ4A8d331wJMuqTkQyf3bDmt8rm6uuOVlahsrqFQyJVPed8F5FwS9Uy+HF5dUoPzPW
	k4qfFjADZ9VcXUbYJ/A==
X-Google-Smtp-Source: AGHT+IFj2E3U/6YpkOvYCA8ArMdplIVsCoa2oY8AWe4ZUCEotDWUm+laRMwrkmmmmbNPtBLZanSIFQ==
X-Received: by 2002:a05:6a20:a121:b0:23d:54cb:2df6 with SMTP id adf61e73a8af0-23d70052901mr16496549637.3.1753708503406;
        Mon, 28 Jul 2025 06:15:03 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 06:15:03 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:27 +0800
Subject: [PATCH v13 03/12] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-3-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=1mgRp4HOTSbHr7EQxPhuUonHpasr6Cq6GSUykYOQvvzIjqlRzPVAefXzpymPuLtdRZmR0RIlb
 ZTopy74UAxhBMLncqhnjq7wEJ9ZjeYT4uM658ifKa6cUe5E0h6w6SJ6
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


