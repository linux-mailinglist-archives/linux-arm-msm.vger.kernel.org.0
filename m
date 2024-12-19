Return-Path: <linux-arm-msm+bounces-42750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD89F7634
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F574188FF0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376EC217672;
	Thu, 19 Dec 2024 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wOG8vsgc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65DE217710
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594607; cv=none; b=Xgdmj6kgcjJwDpppBFHI4p8LplPBksgU1m/9c6A2rZemi2eO2RRFAXrouWcodhHmfuIXKUdlJl5nxYrUvb3WuCpS9Imw6imP54WZo4GZglP0QqcbvXnAr+n3Q4jgugMuo8A1y51dUIxN0I75Oxbem0izInGsMBrAqA7zbIcYH2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594607; c=relaxed/simple;
	bh=sXtw14ojL1neJpubSJ95lKQnBR+uGpxyPZIo6yVfEbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJpdjMT5Wx2vJo/TM5s0h6z9nOBhbWA9BjBPnK3x8E5vAdMvK/JMqqHZxZzctucraLgH//e1+nmB3x+3c1vLsdXN+eVQgmXvTEd/iEjNoi3BgNdVIfdLZOa4PQHnYQml/ZuRfOW/xr3gE7I6nJ4H8ktneR5nTS8X/Ei6imh/ZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wOG8vsgc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166651f752so5191085ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594605; x=1735199405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLZanIqkjuT24X5eyWurXtsoG0wesos+nlrjmuUr9cs=;
        b=wOG8vsgcfxcBDXsdFTB1Y8XM8d5wdy7mxcIHXrEYdmuMUQPkdpMvSd3FCKGCsk0tbJ
         GktQ4vjpJ7XbU26yhu9KKoEVBUEn0npfzhYHo+d6QHeO0IELfzGLG6G+F5Jd5hJx3bIo
         Iq1pM/q5Aa+Wd3E1joUzKY2tLsS1ZtyTfoZHL1PMW1xfCA7dEd3+XZnfdPwY2tcvausM
         ptBQBzZtI87TGod4n7w/kd3FgJbgy9W/zKRgjiByyHK/C7vrv2fk4zKnGUGUhTnNDERk
         lonsUji3dXJc29myNFbD4Qti3m9YrCj1abd9lZgFwt7WCimo4pSaL9OM8Tdx88IUcdyi
         iPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594605; x=1735199405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLZanIqkjuT24X5eyWurXtsoG0wesos+nlrjmuUr9cs=;
        b=uM1O/yLcQqT5q9SYNLfd+Bvfk1MafbK2s8U6/DTlCyt0cTDTd4TGbe37xtWApSlDQm
         ocQUODH+CwWhvbopT6AHwFE3PsQoUQ92XVy790eMa4x1az1TUn+wE6xPZd5XWcxWRRsl
         ifJynUsR9pqwW97rZANcFfoclhzwJR1zQl4ooKF++N93TsAvRo8i7ILccAQl1UHywjO5
         tV22PQQNkCaLTCQvshc+DfMZwu0nzxmVX+7CPiqYv/DFea89FxamJVKuuH5wWRKcghOC
         5U4TRdOjWkSdAekgcs3L9kB2VhA2Un6tdyIf09ycxN8yIxBreqSJMeKcykR4Gp1fz5kX
         FUkw==
X-Gm-Message-State: AOJu0Yyx/t/VKuxNt9HH2jho/l72lnFojBqbul6KikVHcfPpR0+i8UHm
	t88/z+ARTCqn6GOj4/BBMxgIim05EUJZFO7JIW3KsYHtD5Mn5lIOda/RSsOVK59JILf4orBYGWA
	Y9uCe6A==
X-Gm-Gg: ASbGncubg1lB/9l78T/qHTILcBdrrX2wBOahgP4NXcxst+u+H8lr6yets2zs+GVBZEO
	z8Y7diZWyCls7H67KyhmLlqjmduMBawvctvC5NDaoLEGov5npmNGSbalzJTe0Cj8XVFRQLD3j/U
	fvhbc/8cjxpzOSVo1r2XRBV662cPLQ0Wi8kBz8Z4KChK8UDI9VuzkBYfI1C8ay8sL6LEhwBQ1Uf
	2nOOEM5k2fFcCQOKhaDoaWvchz1b/zRzsdREO4bgAr0zyVpzRYrDg==
X-Google-Smtp-Source: AGHT+IFXiY8We5Q0+brfxd3GD7LjUDQdDdIurNlP5jabQPEF90oqCKt+ZSHV3YR8ACFOHfVNF5ZgXw==
X-Received: by 2002:a17:903:24e:b0:216:49b1:fadc with SMTP id d9443c01a7336-218d72529e5mr89035695ad.42.1734594604804;
        Wed, 18 Dec 2024 23:50:04 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:50:04 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:23 +0800
Subject: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=1237;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=sXtw14ojL1neJpubSJ95lKQnBR+uGpxyPZIo6yVfEbw=;
 b=uhe3cG7vSVDd8zvBrsHOn6GmlwDxsTZ7AbcwvCWm81qkXmw0KR5vmjtRn9kraYnZCrlQphv3n
 ChKiSca7AswCjd1Ey96jMu8FwF/yTtLPcD9AvGOGL+kQiFHvYF5kx9a
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
index cde3c5616f9bc..a8b01b78c02c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
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


