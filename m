Return-Path: <linux-arm-msm+bounces-35056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 169819A493B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 23:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464151C218F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6D3191F7B;
	Fri, 18 Oct 2024 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+bM2FKL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B81917DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729288170; cv=none; b=jYfTCeaTg5ixbZD+1ZmJR4Uhdda2cJrrhsG4C6Is0EP0z2EwTu4IkT+RlSSv34k9wIQyu16KQzOS7kjI2VoZa+KwndO7qhddZJbUM2QVW36+pohDEfg017YHtrLwALyn2WsSCwlPEr1OOO9SVzrj8IFUUz5rVX1KufOhsmpe16I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729288170; c=relaxed/simple;
	bh=djZfmDBuxlU0JNDnxFnHNPof6nNMCNv2DHOE5qEfzzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScA0oMEswhmWkoEIr2qQgr7czy4nth8PqjwIdnCXFKfoeSf5vfoUpiz6kL43L9zGIXgJlcuaodNo0s60aCgODWf+VM8r2ksFOJzIzzwnsuMd+SJkHPtWOwIRlJkxrhVDSkXXUimU9ZSdjz0xhQW83FFt93An61jKvT7YlPVDFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L+bM2FKL; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso38139931fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 14:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729288166; x=1729892966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++kNX7bNku5QwEW8QyrZ4sh/fBENm2B/D5wgk1dPOsE=;
        b=L+bM2FKLoXe7BLUC0YnAsbvP1wRwSZQuIBUy3spNSgk0MzV/o0yZip2175Mff3FlVf
         XC+GCXqC/E2rafQ5CxkvBjT5Q+Jx/8RGsDQbLzQn9qCSxakxMKfAXFY17LGxV0TMs5jq
         7HXGAx0JcYksXOd2jFBNaKCe4TD8C++fdR4W8ehWHWGEauGHtyJJT6hVLTv3YU0x6E/n
         IrReOkCA9OFc+KsDJTZbV5eQ3FAQkkUom67V+MHqOWu+ELg9VuslZNuGxnSKcTuT1U/N
         vHkvhmllazWOFS3OJXfm2N+fcfmkb3eT9sJs0hJL0HaYPDqo29lH/MiaKHdNN7MN6zCd
         +oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729288166; x=1729892966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++kNX7bNku5QwEW8QyrZ4sh/fBENm2B/D5wgk1dPOsE=;
        b=vJ+q+PbzmhSrKijOdwMyiTTE+bIgw5wxomBsB+8KvTN3fm8z0dKuOggv06NHn1LJz2
         ih/pXIty9CqBcUDFgQugzaIu4hbZ5MRsmbSbBnT6hQkBJxK5aXfLDn6k44hKjmaHeQLJ
         iMLvRzDdmAL/LwD7J2hKPmYaGPWeuSyyFzxszRbkVLifTnCAdLnAJUhasdoyURKRbL1r
         vBEeMEa+XAa2H8SmEvaFkm0BvA6sn/4PwH+qALNjveLL9hB3OEBWsEmjvkbMntUTUOw1
         kUdvlHANGmJUepgX3OH3tVSLDi8ZQSQiySziseSrdZvRS2nTGB0m0O55gXZKImR4f5mE
         z0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHGYYBskQyLitvUlI3d6+zd8WE0pxXF5uoBgmb+MQWDf4vtv0DglYUSJrVHqwijXyODxjvVkiOHWptoFHp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3179Mrbl1lF/roNDIia3edQsSK6kMwCX5DSeDSoHJu4rfo7c/
	SLqjOI/ZW9MhrxfdPgPLhXpFdTkr6hXq9R3CJCJbBZuDcFp0gVGXEu9v2swLBIE=
X-Google-Smtp-Source: AGHT+IEzY/SRAJiRek65ftXwRIaSZWszQ1TrTKHKVue2XD7qrdxALnnHFoS9HheGc0hNt3zatPurVA==
X-Received: by 2002:a05:6512:281e:b0:533:4505:5b2a with SMTP id 2adb3069b0e04-53a15469bc3mr3671477e87.28.1729288166200;
        Fri, 18 Oct 2024 14:49:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 14:49:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:15 +0300
Subject: [PATCH 4/6] drm/bridge: aux: allow interlaced and YCbCr 420 output
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-4-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=djZfmDBuxlU0JNDnxFnHNPof6nNMCNv2DHOE5qEfzzs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEtfdxGkLweJv+OM6qHmNV/IfPe4ih05zIyoU7
 kJT9651h3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLX3QAKCRCLPIo+Aiko
 1Z66B/wOA1Y63ge3/9+ec5RRkm09oVvTET8CgLutvJicgnnXJpoD1xFAD9yeSZUxMm1JvpeCwUJ
 7/e85Jbgvnv0rT3m0G3RRigczR8IgIBM6sbVOwA3aGTAKEQdERPTHo7uO3ViUrNHtHpLEVA/GhK
 1H5b2Qp5xZP+xyI8bQD+sEWK49cJB6eEWw13zLPFj4VhFUtvpnG7Hmo+HbNLaShgegiXRUPxIth
 thR+rqDuF0nu2rbP+c3NaSwfcICzvALu405PAWooBekJ1qdYR/QzGQrHTvg8QBFwToKKLRi2sC7
 5J73pzZSvULsbl0/BUhl5RdsXjYT2zNV6UEcFPLPEOR0pnPV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As both aux bridges are merely passthrough bridges, mark them as
supporting interlaced and YCbCr 420 data. Other bridges in the chain
still might limit interlaced and YCbCr 420 data support on the
corresponding connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/aux-bridge.c     | 4 ++++
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index b29980f95379..e3e95ccec1ae 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -120,6 +120,10 @@ static int drm_aux_bridge_probe(struct auxiliary_device *auxdev,
 	data->bridge.funcs = &drm_aux_bridge_funcs;
 	data->bridge.of_node = data->dev->of_node;
 
+	/* passthrough data, allow everything */
+	data->bridge.interlace_allowed = true;
+	data->bridge.ycbcr_420_allowed = true;
+
 	return devm_drm_bridge_add(data->dev, &data->bridge);
 }
 
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 6886db2d9e00..48f297c78ee6 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -180,6 +180,10 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
 	data->bridge.ops = DRM_BRIDGE_OP_HPD;
 	data->bridge.type = id->driver_data;
 
+	/* passthrough data, allow everything */
+	data->bridge.interlace_allowed = true;
+	data->bridge.ycbcr_420_allowed = true;
+
 	auxiliary_set_drvdata(auxdev, data);
 
 	return devm_drm_bridge_add(data->dev, &data->bridge);

-- 
2.39.5


