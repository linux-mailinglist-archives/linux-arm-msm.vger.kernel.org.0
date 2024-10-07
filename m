Return-Path: <linux-arm-msm+bounces-33309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C59923CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 07:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B13661F2293C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 05:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E70413BAE2;
	Mon,  7 Oct 2024 05:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="ZeY5+Ac8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED31139CFA
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 05:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728277567; cv=none; b=slKS0uPPoOnEIMlH/td1AUaBoaQqsCQivcIj6OblgtwO29RFudEeXkb7QqxH6Pu2XaS8Jo4dusb4RMuSMaRk7LG2zrk37At2I3lLbLymlcJ//8J2VhPKVGuwZj8RJTmdsJzkYhUf4oQ+JvgnlDulFtrClrAFycAP5oN31XlmPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728277567; c=relaxed/simple;
	bh=ujofgh8m5JTONe/z8Xr8Vbo4E2Up1qzrwf2x/zVO514=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWPfBO8XXvyJoicxA5zHcLXheREWgjxe9YKgD0u8B5uIxyiBYsQRyljhW9Bva7IvnWETvFPKK5zuzoehcoVncAF8Rm94AhYrOYllZ6ZhaqsYrb5Nk52HWO6gHtpdjM/xjVVcOoz/y8nzeWT+WhmJ1vToLNDQoUUpA8WjHHDBOow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=ZeY5+Ac8; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cb54eef205so38274716d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 22:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728277564; x=1728882364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c05QmqKO8Yo45LGADbAWzf+kRfAr29i9++XErp7UJmk=;
        b=ZeY5+Ac84cmlNYagV0vHpvxbTL1A80LOTyPqX8wF8Wt66mzPMIu2WE0Kh3o5T2Ap0V
         fzF77YnypYKclslFpg8zQiTgZaCsQz+UGq5krKwTQPGysbCztNZQqfInoeqUL3+7YJ6Z
         Gjc1+/eB3fSwu2dvvdBCIdTqnf0COTFH/cKA0XfikiNXKMkyEISczFzuU1d1zOtHXVkw
         quN392X4w8XEQ1wcab7wDmg/UqeacUUzEK3zk8L3rwSNCN/j1kbtiOwWftQ6Di28e5H7
         jLxcmouMg72fmKJGT9zy6rMMWcY4pDCGeTi/8sO5kzlnHgeamkYLYQmUe1BX+J0SuGO3
         mhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728277564; x=1728882364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c05QmqKO8Yo45LGADbAWzf+kRfAr29i9++XErp7UJmk=;
        b=R1uOrSJoWEkzioYBNG1G5yEqTmtMQFm6D6P8kHltJQvwCSQVDH1VZY7bqtiCl79vrg
         F2pdpml4pmeqBPBWpw9siSkAOb+CdxvhkcTgxSICz8C2VJ4ABeOTLRludu1MQq2JI91k
         ZdqfKFN3p2n7BQgNRX6bOqDgWQXISdgNmZI2cPGc9VpTtuDSkAcqsnJdKxgA1TXP2+vQ
         1oa2k0XkokNNfZwtMd1/rJ1VV6fNOuw++jj9KNEy/wg4NlbG65aAfcq7MHqa7d986RDn
         VVNOHU/oH8UNdxDZeP+ED6KmbNpzD1v9wc7Ch+lIj+yKyZL3qhJeTX5NK525USmVe3RP
         UUow==
X-Forwarded-Encrypted: i=1; AJvYcCWIx0ylYUvWRn57JKTVmem5CGhxs6XxnP8gwWvmixb8ODzcfagNYatrkT1U7TEYdf+VcKk5GDITT65JYMg6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Bfkjp+n+p0DIsLVMOilojTotUZcCd+71t5FWf+FglnsbpyKQ
	cUXb0xDJLQkvO3xDz0zeyepIBoNKj6wgI8kMN7PPDCC4wfueYuAzHkhkmWJzM2c=
X-Google-Smtp-Source: AGHT+IEWxrxm89ar9oCXwy8ju2UWdzVDET69V1sE10TCiENXP3CF9q530YGphHlLEbICHowgYDYfMA==
X-Received: by 2002:a05:6214:3bca:b0:6cb:2242:df32 with SMTP id 6a1803df08f44-6cb9a2ff311mr159433696d6.20.1728277564552;
        Sun, 06 Oct 2024 22:06:04 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba476152asm22452216d6.126.2024.10.06.22.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 22:06:04 -0700 (PDT)
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
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display hardware),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/msm/dsi: fix 32-bit signed integer extension in pclk_rate calculation
Date: Mon,  7 Oct 2024 01:01:49 -0400
Message-ID: <20241007050157.26855-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241007050157.26855-1-jonathan@marek.ca>
References: <20241007050157.26855-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When (mode->clock * 1000) is larger than (1<<31), int to unsigned long
conversion will sign extend the int to 64 bits and the pclk_rate value
will be incorrect.

Fix this by making the result of the multiplication unsigned.

Note that above (1<<32) would still be broken and require more changes, but
its unlikely anyone will need that anytime soon.

Fixes: c4d8cfe516dc ("drm/msm/dsi: add implementation for helper functions")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1205aa398e445..a98d24b7cb00b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -550,7 +550,7 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
 {
 	unsigned long pclk_rate;
 
-	pclk_rate = mode->clock * 1000;
+	pclk_rate = mode->clock * 1000u;
 
 	if (dsc)
 		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc);
-- 
2.45.1


