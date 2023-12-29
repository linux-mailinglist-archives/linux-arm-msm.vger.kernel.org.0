Return-Path: <linux-arm-msm+bounces-6096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A993A82025F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBA761C21707
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE70B14F82;
	Fri, 29 Dec 2023 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="upV8I/Dc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED09E14AB6
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e18689828so7772332e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890613; x=1704495413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65Hje5YXaORQSyEWFWupE4ife9x+kLl2sZ7qIz73e34=;
        b=upV8I/Dcb2iPHfaKbs69QTOTrFbNRQrfUkYyuLMLjozuyUo0RhnkMzSXVOF7XcPJl1
         PvZ2Uox5G9ixZrZGmkKzb1MxpE60DRUR5RkiCAjPkvLk0Z37EIvUcDrh5viRycOzlPhe
         CYLjDmPuVq/z6Uk4GYEVgUpl8KgZaIz0RPq7xWFO6efznFisBpEMZIbWpoYIwS8rOnRH
         e8Jsxv0IU1/d+RYhN0QIxlgWvqz1XyO0dY+Br6dm70+eu9ByQNiBntkb7Hi7N9BH1Vmt
         /ud/Ks0JOho/j/HyHskxDuk3xJ4ZtQCFln1RKmi9qBLUIPz6bxLmrK0MhpzJ6xLU82bD
         XFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890613; x=1704495413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65Hje5YXaORQSyEWFWupE4ife9x+kLl2sZ7qIz73e34=;
        b=K2cc502xE5zfyK0/ujYaQVf8TYnuoOnTt2Z5YjYtQLTfA5Hr+i08N+854XjCfZMSvq
         PqO+J+0ny0zH3civuIokz4k/dsjATD0/6PfNwrljUowSAUxCgCpycdO+sq/uUlbPjTx1
         1BFTd4G6Jm4gStcPahcA/sIJAZsxJvECC3YbkNbW00OTGp7Y2zTpQegs/+KBZP/XH5+P
         XVwNoVgnDCrHfiXmIaR4frPfRKquqwvUcDE3otbSocTK1wrH7FCLNQqKRVu2oOrw0Hi1
         ZnY/byu2zj+Qsl2zW8NAFbssODBqMjz6hqUApldwS5l1Omx2lcT6NBe5GYa/kEEbiRmv
         xsZw==
X-Gm-Message-State: AOJu0YwxTV0jbB+c+K7mn40jhCThNhARHv0fqx1n2Vfh/1JH+wbRP1yl
	7fU63Z3ScgTzPUmDT8wtXgDWHGlY/uN91A==
X-Google-Smtp-Source: AGHT+IGVq+diA0pkorRsAbsI4Anh7OfFf9HYssPj86p2ooUO7ezBaTmvKfh/JqVgeB8/bDpP0XljlA==
X-Received: by 2002:a05:6512:3b07:b0:50e:7ef1:df8a with SMTP id f7-20020a0565123b0700b0050e7ef1df8amr3140027lfv.58.1703890613116;
        Fri, 29 Dec 2023 14:56:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 14:56:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 02/14] drm/msm/dp: drop unused fields from dp_power_private
Date: Sat, 30 Dec 2023 00:56:38 +0200
Message-Id: <20231229225650.912751-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unused and obsolete fields from struct dp_power_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index c4843dd69f47..b095a5b47c8b 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -16,9 +16,6 @@ struct dp_power_private {
 	struct dp_parser *parser;
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct clk *link_clk_src;
-	struct clk *pixel_provider;
-	struct clk *link_provider;
 
 	struct dp_power dp_power;
 };
-- 
2.39.2


