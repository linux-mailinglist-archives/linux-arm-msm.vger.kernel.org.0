Return-Path: <linux-arm-msm+bounces-45422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B0A15397
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D203A9120
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352DA19E82A;
	Fri, 17 Jan 2025 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbMa+uP/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC27E19DFA2
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129705; cv=none; b=TxqHIydPLkgSpHR+gxPhusXRNePu5r322pgK80EU25Am3RnNwf7hdYFsp00qac1QDpPc9fb8ldT2z+3q1el6WekQFaLh8GDMJoYU8YtpdEvHj56zDHEYXsK8iwQML6wkxEG2kCoNH2aE6zJ3iMreDWP/V0nEZiec0jyjPomJ9nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129705; c=relaxed/simple;
	bh=PxddNtBEA4VAAhtLK+nYutVGLEKgnoRp41bcJi/iMzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULWUAHHZQHHJlUtgmTZJq17Ogvn6KlcpseuBLOMmipCDkRzqqCPcj3X3A7Ot8wvEwqMgdY0QlKmkd6t/NsMclEstnJH80x/Qi16tebqiETu7lsiQWsmbZNsxdz0v4sfpncy9cENofRRxjlh4AJdbSnmhg7J1u1e6X4zKpo18RJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbMa+uP/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-215770613dbso32310815ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129703; x=1737734503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEf37YiQnbvCQ7bZ2njtxuZKF/UJvCXNFAR5fUzDSTs=;
        b=PbMa+uP/OFC7cViPh8AKhjATMqYbioy3DiOpySZ1bX+VVmrysM8vSyHcexpC+iaSsD
         9/U/RFmRX4OMOlPbHnL5o6Zfk69tf/yD9KKqTVcNymcbKDZv3zkYMU9u5wS5qGj4WB3U
         VYU6Fdss6aKTXNst4mE7M6kmeTmFi4191ZsrvzJWZfdruOZTgUP2zYr5uHq5d2et4SKO
         jDU9CVtFdYsVHFwPAhjwctt5X4U5RpjU7crHebPplWQR52JR+wdF1rg3LB68ZJD9BT7B
         0vDD6QO6zFyVEYsjR1U5rWlNZT91n2iTk5vlKVpvukbwqr+CRPsKDNWNj8wSoPfjyUaM
         35mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129703; x=1737734503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEf37YiQnbvCQ7bZ2njtxuZKF/UJvCXNFAR5fUzDSTs=;
        b=oG8YfCaKVgg65520DY1NwCumeeix20ciLfDbuJt+XyU+uCwvi09Yof8x7z0Y/2dT+7
         Q5OxLRDQqq8IIa5jEkzhzYf44CXRMDQJYyCebBgulzX5NWkvW/c46k4UGBn8nzf475mC
         uL7gzXBTejW7Ph84F403CYc/qoFh4GBmx2NksQiANojDeTZH6WVJ7eOZYisy1qHiYrg8
         RfxKkWGdNLB6Z75/quTaOn7gHcs0/WaQ2tL41N9/vzU4y9GXW9+GFIx/Rrra/xYeLib5
         rYQ2jMIizoe5NQTPI7imz+kyy78i8rE3E5CLB5fnc9+eCge9mSPuCoM2j1YIEWhhTT23
         cN3w==
X-Gm-Message-State: AOJu0YwuWZDph0cAJ/HP+Ccdr5m5EA0nwewZsll7YySmEX+VJsohD/23
	1uED+QnyUGAkfi5sO/wYXrkxaYOXMySYfzUsaRHucI9/0JYC+YbawmTGSCXMdGI=
X-Gm-Gg: ASbGncsih8CpVAsSkvyQYvYyNJX23o1HnEckRUPBH19Dg9BjQG53kUhgOAEIO6NCfTf
	wQfKK8vmtzcieD9etflEhtyTmrE6OYgBWzFj9JGtktWs+mpo45vdqWSK5TNRMFe6/oLGYhQG/Tb
	NX8x2ikex4+v19UPdSjaNgdY9osv1lDHzF/Xfbpc/5vG624l0iYjrAlS7mSKeeF40R52JHZxotl
	MK24TZajzhM2WGO1V/vJym+7P42RN83VrtrDg5Rgcj5tzpBH/IZUw==
X-Google-Smtp-Source: AGHT+IEJZ2kI5uBRDML1k/NgyZDQ0oAP/B2bCqDRMPIUXnBmIZcuvSdH13kMnK8Z68XMSLJ3NNyC4Q==
X-Received: by 2002:a17:902:ea02:b0:215:19ae:77bf with SMTP id d9443c01a7336-21c355028e9mr53606705ad.19.1737129702982;
        Fri, 17 Jan 2025 08:01:42 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:42 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:49 +0800
Subject: [PATCH v5 06/15] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-6-9701a16340da@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1195;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=PxddNtBEA4VAAhtLK+nYutVGLEKgnoRp41bcJi/iMzA=;
 b=p8ecOW+PR5hW+4VzbQheLYOLcsmGULaSOX4TeuTvLGFdCcOz3AFZ86zrqMqAnGU6Jcfj8eEgt
 yEGFx2lO2SlB8pL6GZ0RPhJhob8OZHkj8jiovg3LIPolEOT9T684vwY
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 24e085437039e..3b3660d0b166d 100644
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


