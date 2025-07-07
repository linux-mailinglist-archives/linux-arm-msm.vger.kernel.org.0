Return-Path: <linux-arm-msm+bounces-63881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C24B4AFABAA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19B313B3E6D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 06:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CDA13A3F7;
	Mon,  7 Jul 2025 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ux+i3rMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBD127A12F
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869109; cv=none; b=Id8LDK7W5kI3T9HQ6UPn8NkXUwhR/d/T1UBzJMEVpL2a0/Pa5mkxPQ9eQL+hxP+245jE6mXUjbqWBnk/0OAtCLeZ6yxG19ACO0qZEdDr3LDz6Mbwwad+e8zK0xB9j/TWnBTg2Dt2h/2m/lY+LlBiWBpbStBp6LUF17txITmvyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869109; c=relaxed/simple;
	bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/rI72UbAb19GiCFf1i0jAa9yrzN0/VBo7lllGO3aLn+hCy5aogrVmCSnOJ8bbXkz7EB7voUdjbyTRZsCPJTi2R0cro87jcYor/QmD2FZS8vC0n+/ltw+Ut6EVZesC95OvHE5eoj5Yro+9iFSjTauC3HDiZiR4xWOjjUQ9brt9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ux+i3rMh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3409382b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869106; x=1752473906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=Ux+i3rMhjthLuR9oC86YzGcBsOtyV/uIoMhQLW6A0Yg8Vsa+6R8HN54kTeqiOerjEp
         v2UIw4JwSseStOY/l3cyf16IRszKM7v4hNi8u7A92keHNoraBWvyJckrBPeDuf7AO75L
         bnA+OgNfq4ZojhKASgh5qJaZNEUqfbc0w78p8cDqPyAeo6arAPSDEkuGovB0GF+X1Bfo
         3vCGgZENVtTMxnaMYHE7Av+XB91LzLRZd3QCyB9/pUWgQl05iC7gJh7L5eZL9nnB5vSH
         rO3zKrR4RLOUADq80/HzUMm3rj6eElmUvuCvxTt1h9uqTB1HS+lS/QSbl4Al4NvWiNMG
         K/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869106; x=1752473906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=J3WqJ/puS80A6JDHZWt/z8Vhbn2ieSLqeVgP/i/x+2Wst4WXQLvnf4sk41zd2WI7qj
         cAs3pYnJ5Yp0lQvsyl0tolvikkik5Y9YZXdNBWlc9fqW2z0Sm0Ev3RnAydzUHYp1RcV3
         kKFK0KDM/ceDz6nAwXrBZuEUb/RJPMn+cGdBhJgD4H4ivpNooemB2d4olYlLuU7WEh6N
         848k3hhcZnoIjhyHa0ElAUOqKlO5BTwElB7ZgXU9yMHdFgCpa+g98pDkaBg3g8ODR2RT
         gY/8DgoUJ3yPzsIm04Y6/wKPlOH5hauHodVfz2y3k8hLygSDTav16PpXKLQnD2PEx2QH
         5kWA==
X-Gm-Message-State: AOJu0YyTIhAtf0ZTfgI5/eCQ28UfBoetbMwK8RWNLWdtZRkO8KNfHbQB
	TzdEhge9Mq1NtnhLpwLAAILu0F0kXzKTPsAPdaaanhjpVkXYyjWnbZo8XCSw+xwzK1A=
X-Gm-Gg: ASbGncsx6YnqMBFDi4Dm2zwBpTrhjJRqoZ80c6JB11Oyo9J+lN0VnZg7Mp7iaj7xMws
	xBlTkuuRP6Cwtx8WTfQrZoRbFUYqqf6AnmNTXNiT1PWXCykSpoge0lE0R6otnRduL8Zkyvrok5Z
	IM3eccjFM21s8hM8aBbD6uA0EOCd8v2A3/7dv6atP7AJBOeGg82tvlL2f40dIqYe2KaZV6iK7QF
	+1NKnMduGjjCApnfUidCIfzESXuUTwjPdbC1v18Nde/11XuVz6YTe2y3n+bJkfqJSzDJKlhWgdc
	LEa9oSzaW9BbBnsXXhw1YPVWG/ilMJLJdNbFy8xZurVmBCc7W743y3XG/S4=
X-Google-Smtp-Source: AGHT+IEmnc9Nl7lcGHKBCmQmCi/m7XOmXpKt5Cnl8qyjZqXrrplvrrS72dHqfjoA89VugwwUs5rqDw==
X-Received: by 2002:a05:6a20:3ca6:b0:225:c286:5907 with SMTP id adf61e73a8af0-2260a0a362bmr17640836637.3.1751869106645;
        Sun, 06 Jul 2025 23:18:26 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:58 +0800
Subject: [PATCH v12 03/12] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-3-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=HIyipBAXPGv4iNFX/AHEf7r3WMbFa9ZI0N5soHzc2+H6HD25aR3ZFY5RtKQV9yhsI3bp4xQZp
 NKWA9XKuuigCEPtJpJX+IkEjE/6yf+9/eIdQRwzGkisQtZC9ZCsrtJ7
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


