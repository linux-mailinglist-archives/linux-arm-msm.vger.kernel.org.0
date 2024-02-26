Return-Path: <linux-arm-msm+bounces-12614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3F8683CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 23:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C891DB213DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 22:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4B8134CC1;
	Mon, 26 Feb 2024 22:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtQ5Hgcs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554B1DDD7
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708986890; cv=none; b=IJbL8N66JlSrPUEqKPH1Ywtk3gtCOJJbH2nph+JxBVOFDkHgnCURpRMU7384WU/+hRxOYAHkajc10hBmmm0iZaFN/MdIiBBY0+rtC0LESUZhMbs+FnQ3HH8GqHHl5bWFm1i+7PmrLWZzms+ahp1kp6DViTRVEN8Hy/wzT9DNpfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708986890; c=relaxed/simple;
	bh=0aZo1ixet5xYmj9ui3JuB10OP5hxhgN4OLExTnhskmo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E4N7YFk5jCONiNftqbf3Dl+shY+agHvFN+5vcAcqu0wT/8iR9OUga8SqccEDGBr35mmdRwLZbrUkM7PSnlE+twRm08wiBS2a9VNIbtsZrbq+phKCBto5Sumlucj1Mjhy57i7EnH0qaAL9rAkXDmMMjMfEjnDOGXlMrrbz74kwB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtQ5Hgcs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512bde3d197so3290579e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 14:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708986887; x=1709591687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQyChIs7HE6okKAmXRC92ti30ggyCCOzkDVev1q6Lp8=;
        b=xtQ5Hgcs/XMYvuTR3lpInXGowluU+VhKuNaqvBSjzb4IU9wcd+/AqhFafvnDHP3ffA
         hT3cVmkGs2Tad64wbM/avkuVYKmPmQo3tIxcGBXiISn1tEq5B5c5eDrjhCf5JzF5qvpy
         tYEk+27+/IKXB6zN5cY9qobL8EITmzAve0460yu70wBXtPUXr/g/+ba6sOv9qQVfxWY4
         tMBAyT2boe3iSKJjxyWAQ/CM2NgqT6sVYdE+tD6/RBs6LH/2qKL7FWiKBtntXNF8MhWL
         PohcziTQp1J3PaWbhDLFEuS0UUPwF7VpWoM1Q5KG2wAQ5T6YWCgm6TQ6qODcjvljVVUZ
         zssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708986887; x=1709591687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQyChIs7HE6okKAmXRC92ti30ggyCCOzkDVev1q6Lp8=;
        b=b/WFMgrOW8Wi1B4v6xPRhEGrUjHNSwjKg0RBn3Dt3DgefI3n769tx3V9Y8/ipUxKNo
         WHi7ira1u4wJQwTsWodLj7Ix0HeMxyzL+MuvgoOvgsp4Hs2o5QqInvnibRZRxmlAlRqo
         W07/QXmZlyho7Idr8SG9IdcqqovNhfZG0SFJDa0Q3ga45ZTHOyYjMxtRZY3vCQP690Hb
         xephtKVznuF3+Oh2rA/3aI5z43HFDnXQ+jzjirnm/8JQg/NRGpHw0KxmJr5NjUoFcT0L
         5I8sI/vNq5EUITWEeUb/IQT0bwPUiM3pEshwqCu6NpHF2aHmuexnaPRzId/+IGkM5B/O
         4Suw==
X-Forwarded-Encrypted: i=1; AJvYcCV0BjZXNO93Idfu73+qE9FBrg12qE5lL0WFmifwYEUYcwzWw4D8JmTw2L8iZYBze+51Z/JKrJqgeaSdkPFUbhFvek6FviAgbgmGe1RipQ==
X-Gm-Message-State: AOJu0Yx8KnborgFWCMjFLCpgCvxxW0mjUF/Sw/dncCBYC8Vwaf6dvp4J
	uzHONMaXuBt57jdnRHC0Fly497mhBjfdZ9jo0l2F5Rdw8uXEqcttnLfCbqk6axQ=
X-Google-Smtp-Source: AGHT+IGrx//bIIH2O6Sn2/9dUKpFd5KxgKX8eYYdMPd0RYKbN6C+owSEI3tjysUFeXhVqZTQY+HU/w==
X-Received: by 2002:a05:6512:a8f:b0:512:f66f:eb64 with SMTP id m15-20020a0565120a8f00b00512f66feb64mr3821894lfu.68.1708986887114;
        Mon, 26 Feb 2024 14:34:47 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id w19-20020a19c513000000b00512ed78a845sm968783lfe.129.2024.02.26.14.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 14:34:46 -0800 (PST)
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
Subject: [PATCH] drm/msm/dp: fix runtime_pm handling in dp_wait_hpd_asserted
Date: Tue, 27 Feb 2024 00:34:45 +0200
Message-Id: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function dp_wait_hpd_asserted() uses pm_runtime_get_sync() and
doesn't care about the return value. Potentially this can lead to
unclocked access if for some reason resuming of the DP controller fails.

Change the function to use pm_runtime_resume_and_get() and return an
error if resume fails.

Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 03f4951c49f4..1a264e7deb90 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -509,7 +509,10 @@ static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	pm_runtime_get_sync(aux->dev);
+	ret = pm_runtime_resume_and_get(aux->dev);
+	if (ret)
+		return ret;
+
 	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
 	pm_runtime_put_sync(aux->dev);
 
-- 
2.39.2


