Return-Path: <linux-arm-msm+bounces-33181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83A991777
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 385F91F220C4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 14:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29774155C82;
	Sat,  5 Oct 2024 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="PaGawNaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6197781ACA
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Oct 2024 14:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728139388; cv=none; b=ZKxBoCkq9Grr3iMtD1MZSJNQOHtAKCzz6qNehrhI26v4eCGUS6rzNN0rySyKiDUR7ZHmNTFXnOZdBiaNjt2nslgn1PbSWLtfVqsFwNpV0NOGaEkNKLbrc0dbplArL58w+LqjFlHDsOpOcy84E8cWiq7+6AFAeyXMOySJfIlnbnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728139388; c=relaxed/simple;
	bh=sqD51ry2sQLZOSTSVDbHZfvTXJdQWOJgZ/cgYAlamH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOr1QNWhRBQM3j8nbxaPr4L748pdYPRW8+JVUUhqF37GZ8KKld25OoUs/z2UjmrtPQGTl1QhoHoZ9kDoXiUKtikN4XmwJWkNm4TqF2w7jFvitQ8IEGrWRAz2pAhL5V+W/n11VFwG5QzdDqwVwzJtvx1FHiT8CyfkmvgWZ0QaETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=PaGawNaP; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7a99e8ad977so223626985a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2024 07:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728139385; x=1728744185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jvG7B8d1XuNSMX2AC6pIuFzaK4tQX72GKOrHfdpQSI=;
        b=PaGawNaPoae3zcytpISWjK2/LHjSVG7xIHIt4kcY5GjBfJ9wBNUFRHJ9HDa43xV81F
         jqShMcTdWLeXxLOo84+qInFnCWr3xnDZtZMVWdPTZCAoeAZoDjeZGCA3COzs9UbMwD9f
         cg2Jcajj3UocRBtEsYjqL+rLu9Ejpe+aX5lr7YuJhnkFdif86Xx+PJXAgqsrAVyoaL/w
         Uc+Fg1WYytAs1y23nz2WRh/66W0HVR2AZAaDYuUtZyjuMhEkkxzMfoHkDn/Y+KJ58ZlB
         0lyuU597Gv87lzwyQW7wh/7n34ZC5SZRjG27ngt4tw9blrVcpp5D7BNLRkB0HYOaQl/U
         yNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728139385; x=1728744185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jvG7B8d1XuNSMX2AC6pIuFzaK4tQX72GKOrHfdpQSI=;
        b=hLJxkH0odcvSSySpLdmlpYinMq33IwcH3UvXBZ4HgeAAgOZi+UPIrkSXNKJ64wgquT
         ThlP22utWLBDvEwQ6UO9hOPl487k8NdeMGxCPvZ7FTvE6AKuFTYz/tsG99EiJKlrTI09
         gYZMasEwikjUj0BvNhfrXD8f2LLO5yECBA2mebnbfMT30s6aghInzOOzfls7nAMIBxqL
         I/9neVh2Euh8r6eku0OPp+p06FOst75p5bKJjnDKcYPCpVyr6NEud7+IWbzgulo13q8s
         jD/pSife1JRI8H5O97G3OP8u0tcB9z34HsWZlaY80RXIdh5IdmpZbkzJ6ciwOangKTZc
         aNWw==
X-Forwarded-Encrypted: i=1; AJvYcCUDNDT/u/p6IrSuxeVgi1U6fY23tmd0iNHDBa1Wg1QfZwo11l71hYYhne4MOQM0yFEx8QCbGCNdbFXMdfX9@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5RJ66cN9l9GL8b7tR0slDCL0ToaNS2bcVVjGZk6fvc17V22E
	lthJHzyWbgYbQOHhM6wsHsMQEdcmwsm0rtbXiOYX+9XTIG3PZgZfU9vbRa/39Gk=
X-Google-Smtp-Source: AGHT+IG4yLQuqZlhB/sDECpjfl6wbKTckYqFqL/GvxMFZI5CjeRNaknjtbVKfLUd5sUZjtNEqkV/ag==
X-Received: by 2002:a05:620a:4441:b0:7a2:c13:458d with SMTP id af79cd13be357-7ae6f48868bmr934680785a.42.1728139385226;
        Sat, 05 Oct 2024 07:43:05 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da74e9fdasm9072351cf.31.2024.10.05.07.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 07:43:04 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display hardware),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
Date: Sat,  5 Oct 2024 10:38:09 -0400
Message-ID: <20241005143818.2036-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_mode_vrefresh() can introduce a large rounding error, avoid it.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 185d7de0bf376..1205aa398e445 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
 
 	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
 
-	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
+	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
 }
 
 static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
-- 
2.45.1


