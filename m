Return-Path: <linux-arm-msm+bounces-67225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A69EB16D63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE48F1AA19F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 08:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7942BD012;
	Thu, 31 Jul 2025 08:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfH1fz6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F621B18B;
	Thu, 31 Jul 2025 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753949979; cv=none; b=BZ5plbPQrFvuXoweRJy29sibLjeoJIesA7Wl7aFi6veZHGr9wAHcxU1eSxpwgjxGSBdISjNB+6ghmgW43qKzWGoZrI340Rq5qbMsl1U/prtc8ziolzIpLURUYo9s/C5W8eEaylhD4aJm+OW/O5xYcHNkUX+k3iGe1zaSpzse0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753949979; c=relaxed/simple;
	bh=/D82C5VUyCg6tc95xG3P27C0bxu2+XduLgcjnO07IjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EqtzAlzlcWm6XPF/AmbkAU/s+Q6oa0YEUSmos9Hsy2yV7MdSihv22xiR6gOBDilJv90YyuRitjixKTT8/YQEFsGF9yIgupf5Y1cOEER93K4KnH+jCXj41aqEnee/gwxqB2coU/ASyFLZBKqXtJvp7ZaZ6m6X/TN/ByO+qFEfSgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfH1fz6Q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so1072285e9.0;
        Thu, 31 Jul 2025 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753949976; x=1754554776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5BJ99XtInyXvA2uGwOyO0qKj3XQHqCW6pENyhyNWAo=;
        b=GfH1fz6QV9DS0G3roci61vO9S/JdkK1auctrWZ1uPBdEbaFTSTzteOfo/sEje6DuZm
         UPXhuLp1nElljvoPVG+WA+zaNXjpxU4NYBJgi1fILzE4mWNXt0LR6BN3+6L+EG4HA83z
         iFtZSWxG6rZoNKEITKU7qqE5BaW7KDk/hgCqn31zB1rqLS4QSzgqUCY7wvVYyvloUHE9
         fgsGyoooS66mcp/xtp6ltsk1UQ9buGcio9ljuoladsNtVdo4f4n52hpZa958hkhZA7n/
         HMOckXsCq+pVtsjHml5KBmmyNUjXaft5oktyPzzNRphGwayw2wIybgZhrZErtGAktnHF
         RUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949976; x=1754554776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5BJ99XtInyXvA2uGwOyO0qKj3XQHqCW6pENyhyNWAo=;
        b=tRnBVmNWhSJ6YwXt1Sy/CCvIA9tvr1FopHrUv0g66BsVus0hTXEqBn3RFfHv3z3Egy
         yOZtrC/VnGMC/JA/Nap9iijQAM5ZtkVQ0upKYgcGFAklCI8H0aaQmFoffZ5CoaGYMacm
         0DE/qPrAG1HyVvF5LvtFAxu5c8ak/9jtXIb0nKJqIqgcTB1dcw6FHMw4jq1Xxvzii5mY
         1MsuBv7uJAkW5Ft4+eYEVN6qNxuIIA16Ta2YhB/EvJxRRh2rajoRdAphmXcZUY9q3+pe
         /SJt0gZlM3dR0tvRvArk4GMCJLbEXUJRev6KppS5fU6S3TPa1NBhp9r/r1z6G5zLrd9B
         Et1w==
X-Forwarded-Encrypted: i=1; AJvYcCVfjGKoYArkNI6eTSt9wvH4IJimsvC3+7TU+3/1hsSk4/+tK/wq5LoDj3+L9ENpfi+3aLbO1kLIhOUWr+8X@vger.kernel.org, AJvYcCXKW+ZhFOAe4co2KiFSl50EJXab5AJjwhUMSVQyEtxMWo8Hh/x9ioQujyPseL13v3+YgP6tFzUjCqwZFOT6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/C8yHKHLtqGyoEu9oFHnuP3GoB6p8QpbTTB1VAjbhCL3BGo0
	ZWNLIbIHSQmvXT+AkQGWyb2aL2qJoqn26mizDproIPEnLsN2cnjdyL34
X-Gm-Gg: ASbGncsyDwVJzkx6Iv7ZO+OOVNrHT4V2Z4nLk+Djqb0aE4RufeD+x22Y85CxICHBDEO
	yDciD3d9IBqlXO2sp7YWeGGTKqDS4e5LsEyd7Z2poDykhA15/3wvU9EynZBcaPH4IIzggLBO99n
	xfEpmtH/Qqh3wyDwz0h/RUPqj0Vv19M01hFkLVhIENr4uqw02gX595RRbOjKgcfD09OmRB8tGqu
	TcEZRjH4BJfrnaqTRExm/osfTNGqyZZEv8rmIu3ood6oaxSOaJYoGMVC7AmWnGkKGooYKt5Cd0/
	I8JPvdngnleQz7MEl0HB5K5R96ac2zyxnLX72d0LgA0oQWD7QEqK6GwbQYVZqWMLRhJNg6Djcdd
	L22/PDZkUvcASy/+vybA3
X-Google-Smtp-Source: AGHT+IFbDfRA6dDUCEXiNfEp5FpmNjxnhIKo5DM7lrIVBOPA+AS808AJxq+ydd9KurP8GljLbDj9xg==
X-Received: by 2002:a05:600c:3e0b:b0:456:1e5a:8879 with SMTP id 5b1f17b1804b1-45892b9c21fmr66788295e9.9.1753949970938;
        Thu, 31 Jul 2025 01:19:30 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589edf54bdsm18154945e9.6.2025.07.31.01.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 01:19:30 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2][next][V2] Fix dereference of pointer minor before null check
Date: Thu, 31 Jul 2025 09:18:53 +0100
Message-ID: <20250731081854.2120404-2-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250731081854.2120404-1-colin.i.king@gmail.com>
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently the pointer minor is being dereferenced before it is null
checked, leading to a potential null pointer dereference issue. Fix this
by dereferencing the pointer only after it has been null checked.

Fixes: 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is not a GPU device")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index bbda865addae..da618720cf8a 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -325,13 +325,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_device *dev;
+	struct msm_drm_private *priv;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	dev = minor->dev;
+	priv = dev->dev_private;
+
 	if (!priv->gpu_pdev)
 		return 0;
 
-- 

V2: remove changes of minor->dev->dev to dev->dev, put them in 2nd patch

--
2.50.0


