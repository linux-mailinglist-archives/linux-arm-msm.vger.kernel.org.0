Return-Path: <linux-arm-msm+bounces-23815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47756913EFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 00:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9FAD281D2A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D0A156678;
	Sun, 23 Jun 2024 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H28ULjXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51B65C;
	Sun, 23 Jun 2024 22:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719181567; cv=none; b=P1ftcM7fSsoUvfN4t8ShaWWa0vuo6iVTRpCnk4pYQJefkZymhv3SFiV9YB9ZavTA8BwTMmAm8Yd9V34sbeM4EweQ018z9gVgvJOj5Y+iHbApBhYsYA/8sH7eRgYO5sU7m11wuwSdd1N+WTAmU/4hxvyK3noiIHm5m5HuLny87zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719181567; c=relaxed/simple;
	bh=oxTQy4TFEJ8h879vlyRixiuEuYtLGpIFDUeycmM8EQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E9RFDjTuzZLfyhuuc5wmFar7JiAjBhfzz4vtW+dl6oQRWjYyxJMZ3khNi46iy6aEzDNuvn6XzN0bzpv6sHYOE73Q964Ayv/FXRcRgpwHrSneACwOMvWKU52ce/+kBPqqXGqeNFs5Ju091Ya9DhXEeoQuSEoNZuZJloN7wnJvF/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H28ULjXL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4218008c613so30959285e9.2;
        Sun, 23 Jun 2024 15:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719181564; x=1719786364; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gQk/oUu6SEUrWcMlUI7v/b2a8RoP0ZC8zDXKyAf8bM=;
        b=H28ULjXLh9i2T6VLxa9dGP8Sm/vPj1MbLxQU4pjWwSJQS4stmKEajwLM1+wSvlGuze
         9Jv+xHUt0GbXmO/CpbHB4rsWRNpmHknboG7b/m+6huLTCFusYlMHFDb+cnosz7zocFpU
         rtOMSYCPCsroYkYyhOQ9VzfFDblMCYMYZhZ5as1X6Z42t+mB4mzY3fwRHx8jmVSYF6ho
         s3ln4zd+S+XX4MJbao88gVlSKnqWeSnL/lO/y/EhKZM4s1wE8lJq7sGoeFQTIVhBfj29
         vtr+nETuj7Pg2QUUpUDK0E8AbFDwbf+0XdYFGA1djOBnkb25Bz7vTBJ0xNUKm4f8UaLn
         VvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719181564; x=1719786364;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gQk/oUu6SEUrWcMlUI7v/b2a8RoP0ZC8zDXKyAf8bM=;
        b=BWIg/pwgerVT3I/DRsXrBxJR+qouQAuTI6lKZsuBIDs28+fyLoq6jSy4lj26nQMclG
         n9MAmKfdYgoxUytKcfsidkslfSS9/qmDERJjdvq4iet49blv0M5EBIqnPo+34kkJ8WoS
         eiFyF0doWhUYuAethHnzjTQKG3TfOWpSre6YtLihAJWEgDjD/sDHgjRmHexuMNVIKcSF
         ATpjH3xeRHX5xYjxeBldPQbXURD6oTk0EUw3IDHWD+n8uSrs7TeEr191bN2NG8+4Mu2e
         TzukKuTcXYwzp2D5hsHhmXob+RfbqJsmfx9NPzGwyIAhnpbzCqIYqeVKkhFGD3+53QKs
         L+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCW3KQ4XvwICTWUjWzWAJe84Oi4DzuauR306XI8RmDozhrkmjd9l/242pnFiXi8BRhESFP7FQl4qTdAoKEC08aM5d1zljfZeYkQ6KnZ9oTW0HlPUU3W5dtzuP7nVfpDH67tRR4FZ8/HBAGRXq6wn4Girro+aK+pXrhs/hxkniat+HlHI8mttLAHS
X-Gm-Message-State: AOJu0YxJ2zsk8TPbeZhN+apscb4Arlww/upgUaKk24QdGmFPtLYEFNOq
	+NJe5SVq14juH/L/mWGPdHbINW9PKTqglA/zA4aHhFc3TmpqKw9n
X-Google-Smtp-Source: AGHT+IFuLGS5VXiY8gWVaO57f37QjPUM9TkmU9oDjUF5Scuicyy01NZzE1pEN95APiSxY+wXB8af3w==
X-Received: by 2002:a05:600c:5690:b0:424:7992:c21f with SMTP id 5b1f17b1804b1-4248cc18c65mr20456165e9.3.1719181563531;
        Sun, 23 Jun 2024 15:26:03 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d982sm117663975e9.1.2024.06.23.15.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 15:26:03 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Mon, 24 Jun 2024 00:26:01 +0200
Subject: [PATCH] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPigeGYC/x2MQQqAIBAAvxJ7bkHNQvtKdIhcaw+aKEQg/T3pO
 AMzFQplpgJzVyHTzYWv2ED2HeznFg9Cdo1BCaXFpDSGEowdBwwuoecHzeY17XK0wihoVcrU9H9
 c1vf9ACnzRGlhAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sireesh Kodali <sireeshkodali1@gmail.com>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.14.0

Remove MDP_CAP_SRC_SPLIT from msm8x53_config because
it is not referenced in downstream.

Fixes: fb25d4474fa0 ("drm/msm/mdp5: Add configuration for MDP v1.16")
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index c5179e4c393c..92d06b7faa0a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -837,8 +837,7 @@ static const struct mdp5_cfg_hw msm8x53_config = {
 	.name = "msm8x53",
 	.mdp = {
 		.count = 1,
-		.caps = MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT,
+		.caps = MDP_CAP_CDM,
 	},
 	.ctl = {
 		.count = 3,

---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240624-msm8953-mdp-fix-8af4ec159082

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


