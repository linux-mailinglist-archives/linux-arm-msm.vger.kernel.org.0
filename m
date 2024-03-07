Return-Path: <linux-arm-msm+bounces-13651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8F0875B4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 00:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51B8C1F22A0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 23:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD2F3D971;
	Thu,  7 Mar 2024 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCzZ/7tP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A12945031
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 23:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709855831; cv=none; b=Inrv2Bn40ogd7gQq7vBNgM2j10v4wbAVSyJ0WD/Uzu/AKwhmAh1GIdxvGtYdB4GejWnNJOjCWkkjZrzxQ9zJ75sS4Tj30Wk7JUNPoHdgI9IS69ddqS/IaIICCGz7oY7L+k99HAVlrNSihoSDn2z+YqxM+WWAOongrZcnWelQfqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709855831; c=relaxed/simple;
	bh=+x1kUIee7AVt4kqlCisaJEmSVhGtSnW63wlN0WYeMiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=toL7axcMlOoW5fweR6iA2ACN946z/8BqTft7hvq48avpXfqJc1qm7fvaTN5ZCAroNsHJdlkFl4VBamOC1/h+59xvR7KbzOcrSvsCaVb5WCjm//Ix0i5M3XIrv3uezShZm3jk4ZCAdibVILzJq+RTGVXrLhZgAa9WiyoL+QlR6/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCzZ/7tP; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d220e39907so21159941fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 15:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709855827; x=1710460627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4g0A2mJqMdnp6Ni8UfsRj9520wAhqMQ6QMy2JhUnOU=;
        b=yCzZ/7tP1qGApnH7Bzdg5L1x4EIoYvlltxPJDBbfAbre4DdJwX9TpqkgkrKWEYDvIH
         WQbqu09QpxuYMwSMbULX4fcx5UXjFJ9mU6XDCVX3eWfnQ/PQBz9jV8CF8ChEOvEoeprl
         /lf/rcP7gn8jjqiSWJr8JBsZsDgcmSN7zivKEaBZg5BwNQSYDrKpguoEQX6wgzD9HYsX
         NJTJBWLBfjCM4rH/FyX4UmEbonFCnfXSpwiY/1So+byMemRNSynU/kl8J7c3z4hUIEMo
         WIHPBJ25rScaOrl4WGGa7MdvedOO+AWQcGV2ugyrqJujzeA9rYSwjpJVZPJocAY7ibdi
         R0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709855827; x=1710460627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4g0A2mJqMdnp6Ni8UfsRj9520wAhqMQ6QMy2JhUnOU=;
        b=ArhbLKKrLMAVFeqXc4F2rFZiSVjO0mMG7pI6A8V0T89XkEiQHhKKrWjAHGNuDn2+ox
         dw09YAbXOv+ZEnne2GjsHFeOnYj+ClnOXEX0dzascluVK+kC6hyG75EJqx2d1aBkhuRr
         ltWH2FNc/WiW0K9muV1TrNeIQY9z9yOgFhaxpxwj6bzfoGLepSV2nR+pI/3RzvwJM5AS
         pn0XMtMDdyDvU6/2B/onHrKS7qOIgO4yq8ET8m7vSr42BeDZksTSPZwgjkftoDJ1KEl6
         uVk++mk+dCLTNG6XN8UNPKew+SWMfCovfxnexd8kc5b5jRC4D4KkeoL0yUouKg8FPljC
         jATA==
X-Forwarded-Encrypted: i=1; AJvYcCWGcvMyAb1nbH2CG8i0DEfcD8i2xRKNn4yosawRPEAHLab/MHHA/K/DFfYZ7873nMRkZpUfmJTQtTHaY9lxKmwU9D96iyjbjrn/ttseUw==
X-Gm-Message-State: AOJu0YyYEvzZ3SijAHBEXQyVBiNQsYncpVRbKF6gsDANZh9BG4R1sBuK
	6DjJua3t3JmaDl/27ev5EKV06mD9frWL+r5siEMzasBo2GjfDlrJy6kZJrUQLas=
X-Google-Smtp-Source: AGHT+IHnzbTF0XaaPfXPOV+dLSi0h6C3uhHFgoDuYO0jtbmQe2VfAWhicaYbI6f6ZjHFWwvICqMuWw==
X-Received: by 2002:ac2:46ec:0:b0:513:6bbc:e6fc with SMTP id q12-20020ac246ec000000b005136bbce6fcmr2641998lfo.8.1709855827608;
        Thu, 07 Mar 2024 15:57:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:57:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:03 +0200
Subject: [PATCH RFC 4/6] drm/connector: hdmi: add opaque data type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-4-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+x1kUIee7AVt4kqlCisaJEmSVhGtSnW63wlN0WYeMiA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lRO/psOtZsryGYjtaY69ZDmy/fmZxGSuALo0
 MH0TenaSr2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1bWyB/96ELkZShJQsyKTOUoy9ypVBKSLltVC9CyfncZFcfJC5shSifparvQ4Le8sgjJoD/2QMc8
 fJpSUEKjwVONTpTnUczcZCGSb+AD8Ananr14DMJk1qLgqdgEhQld80cwc4Nx4Ymh/2sfKh08eB6
 7Zo9MNIsAMrsQHpC8/fnISo1aw9DbUNEQe/dAnV0FKrGaiGef+PHa9+9PR9fDisGNy/NiZXr5ol
 9RbTzIFxaH/I6bE7NEYh/phl13xjQQY/cz+tdarJWMzvngg8zdEbe9T97fixyJEwK0hdRL3AbIb
 YHRRNAze8OMlT1H0Jrg6D3cFUfw0hp3CdmavESs3McL2O0qE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

HDMI bridge drivers need to store private data pointer to be used from
drm_connector_hdmi_funcs::write_infoframes() and clear_infoframes()
callbacks. Add it to the drm_connector.hdmi structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_connector.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 37d54d5ff0d6..d5c240ad7c5f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2088,6 +2088,11 @@ struct drm_connector {
 		 */
 		const struct drm_connector_hdmi_funcs *funcs;
 
+		/**
+		 * @data: Internal data pointer used by the HDMI connector funcs.
+		 */
+		void *data;
+
 		/**
 		 * @infoframes: Current Infoframes output by the connector
 		 */

-- 
2.39.2


