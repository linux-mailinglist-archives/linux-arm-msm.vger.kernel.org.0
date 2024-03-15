Return-Path: <linux-arm-msm+bounces-14203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0287C716
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 02:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C0061C21EB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 01:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6606FD9;
	Fri, 15 Mar 2024 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6jsK13Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D826FB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 01:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710465763; cv=none; b=dj34bNLWTW6U/hHWI+TvHvaXJI/QkPSdxEQ33POpSILwlU9oO6IjFqiNEU814VED5sVLZjGGe+pVyZhVGirtxP7fUM+oMiVtd9f6c0RmxxzuR9K2ULMqJVXXMm+g346+V8NEMpmGK0OAWyqRRrIfNoxcNHtok7ntj3+qwBl7hu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710465763; c=relaxed/simple;
	bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QUL24ZhQ3nBlxgnpbikl1+heIRz3LLDdC3quyMWjUOSt3+5FePGqxV5g4l8E8De4kLjqiwAZ/GGvdrg3jC/KDp3q3jPOa4sqjUryoi8altvxkYyZVwrBi8Yv0h3+41HWvuuGnyAkWWYuAKD+CQUudC0Bd5bhSCgnsHBio46WxrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6jsK13Q; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513d3e57518so1287381e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 18:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710465760; x=1711070560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=B6jsK13QBWQjRZbGokfhOhLtGFsTy1Gg7hQp51waqM5ev62JC2L1gcBpwLQGMnBQS/
         8VED3Z1A+fccd/0w1H4/6qelTWS5GoH82fpQtVQeZm28rhxMkNV4I5jt2BxN7dCC2+GS
         0GTpBlYOSMQT9xZ8WucBmjB9rWNXGZJEI32qb2dytij+DACoEMyr1O2scNEqhR1XFpG3
         ry36YUotLCmk92+oc4gcpRxSNJNKjXdpYw9B4bzz/OdaRkq0B9yNAN54aHlfUCtMj2dl
         f5lUZrEirFgkzKdEA6Ybot5M7HLomjxv1lRbamkIBbEonEs6Szz5CkW4qspTsVdZjSfl
         baOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710465760; x=1711070560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=LsyHQCXO88WW4hBI251OJeEw3i6FSD5Z/bHpt5CwbRXx126vwdps1wrBS9CVa+Z0pG
         AGvvi+ohv+HYd7JnVZ1W5xb/az7hX60hSpeuJBy/cZqtjQ0f1Yl3lyfdpRix4KOV1viT
         6mUw/wObvD1L3e3AHGTzHSnlSu5jJ36P6Wh/Z0YRlvp6ZJo2deP3cD1Yci6yCTJlNsL6
         ju6tXUqYUW8MHnsYVMlOrux0f5bV+C/INaCAy9wDYenZDld2LQEUdC6WnRk/d13zpSHg
         ZpfM0L6QRFmrcTsEIhHXxWABN7yNNqI67eEct5hK+Io1wQh2L5bf2ALOlcZnZh/muIud
         MhRw==
X-Forwarded-Encrypted: i=1; AJvYcCX0p2bkFjs2bIUHYE1vhzEX/MVBXk+wc4A9rMCjbRbe3y50e8l8F4d8pyrkBjVDthUO5Mx4EDZs6JRYQ6VvLHuby6ZwDsvNRQmST2EJAw==
X-Gm-Message-State: AOJu0YwBYXWEW9gg50XNLA6M1cePLEluhllkJeRLCY2kPBLfrNDbneYw
	dAyeZGJiecepQVwLWoN+GwK6zsL/rKrBsgdHacTGRpgitCsCAZ5G1TsJg6QSS1Y=
X-Google-Smtp-Source: AGHT+IFtneaGTAZC9+bjGCN7jkSWwII9+oxv6WIqAz4eTX6blLRQmZnKzzdrOySHPQhNFCrcWlptAw==
X-Received: by 2002:a19:6406:0:b0:513:d8e3:fe3d with SMTP id y6-20020a196406000000b00513d8e3fe3dmr348905lfb.26.1710465760216;
        Thu, 14 Mar 2024 18:22:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m11-20020a19434b000000b00513d6089dc7sm190559lfj.131.2024.03.14.18.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 18:22:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 03:22:34 +0200
Subject: [PATCH RFC v2 1/7] drm/msm/mdp5: add writeback block bases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v2-1-7cd68ecc4320@linaro.org>
References: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl86Lbu1WTtWJjAFtiellueU8vs3B6gc89KBYKd
 LaVA8f413WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfOi2wAKCRCLPIo+Aiko
 1aQACACn5dtZSR/KdnryXxUSdBpOMw2qv1GtZtUr0sg5jAlDajqmZmzdzktPQ/MFBFJQLIkmD1q
 alPUSIj3GdZj+r453uYlh6P8Ll5SwIrzWgliE/IavUVtp5qvycdt9fYuAV9IaRrxOPTX+0+DCAV
 Q1nF5gXuVOYgo+Z+axf9MN8p8gCCWt94JfDpDY/PiBSYqejz5eufQYXyYEdRwYXf64IBoZK19z4
 b20L6okrQda2g273iDU00maq3RB37QDPkGClKNTYJRteyFH3qskcCOFfA0tm822FQV/AXVn1GDG
 zM/rJ8CGhK6l3KTbpOTK1EPB/SslyvZ9Qe5vwvPUgBdP7ED/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2


