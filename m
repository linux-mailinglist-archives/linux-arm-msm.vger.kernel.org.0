Return-Path: <linux-arm-msm+bounces-16232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8EF896A2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 11:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E09341C26387
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 09:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2985E71B51;
	Wed,  3 Apr 2024 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqEBqIGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C66FE1D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135505; cv=none; b=HyE3gA0fwgzxApJotm2AiB7dz4jcWCkpdxDalvzmnbgYkjjY4v9FIF11OclH1Ehf8q93ssUOiK2BjJKuP56/LdsD/rFqkXk50LfgDuuufJFCBg4yfLgWq/MoJoxjqjXNNXEZ5gIheFN741ZJ7gapd8Uod5przZPxEk8vcBGOj6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135505; c=relaxed/simple;
	bh=MU4Swq5XDKyEWa3JYSzWqbeemF0ZbJTcthPE2KJsZos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUwl+bXmjJm3bEpdTuqc6xZXPruVymRPlQWswQb9AFYN3jtl7AbtkH1EnkHYTH2iyRLxalHeAe2+tFiClTOT7NlavpmuxZ7QEFhfR1bFzDSED4CEXOIMrpzxCWh5WjDWOn+WWauSuplOIJmpBkUq5J7JIsuf5IpviXlhvRwjhtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqEBqIGJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e27e174ccbso9393065ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712135503; x=1712740303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOuu3sNA+84lczt5jxnbeGrnj9MwNeOoooH77NlU9Y0=;
        b=oqEBqIGJOQDtJMGZiW52ZTLuPgwStnwwL4QEXGO7fXl4BxgmSZCSyfecREMUAoAi0I
         VoDvBER8PNZQ4DxejSsgK9wRMh5UTUGAxaRpqnSmnPSNya8yKu8wuus//T99ptEorrlh
         uqcyX5WwkAkq9V5IRbUU7a3b4XHOYGX0xyZUBeaO98S6yIH4RVovoMX9RSf2ZWvmvHhu
         78rk6HhuKJsnPFzmXRcvvOAYt1gm7tk53SSXk24fnC2kYlP9q1mWpNpm7AOhyDNqbpZw
         rj/S0CD87zQHyYG6lnN9tU6tddhmm690z9Q2YA/nQto5cE24Cw4ui1Vyl0xO9FU8BoXy
         QHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135503; x=1712740303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOuu3sNA+84lczt5jxnbeGrnj9MwNeOoooH77NlU9Y0=;
        b=eRRzq8gBXdsWPGfBcBOu4edqqI+r3WmAdzqOxJLdFNIkPPrdihBjdlspgJl1kGotuQ
         nN83GQa+kdLAPRpUXpWEnlDkf78mreEI9IAJX/1eQXMEvibSRT937anBfhp5m6PhC8Wg
         9a4G/eALDk5U/Kyb8BKGgp46hX5ccMH+f3Ir7pFbJsRip+DEdkwPGtDF8nNQp/KAy/P2
         BAzOftFIppjBXsEjsMaw29LN+ByAi+kaU4ir3r3Bzz7u0cXviNwZTLx3YEKyW5HHkcNb
         uTFxBUhv6swSUl6FOho0qJJ2TdrLk+j7uZao3e5CUY9hmcMjlH45MOCdxu2i7VTxd/26
         1xYA==
X-Gm-Message-State: AOJu0YzflOPeTukn3y0Jyx3mQVXMvjoenJL7l6xld7oFk9t5jlC0li2+
	U0qvpJFUiFw7DOh77zS77dp+YuLZiobIHFCywIldOAga2p5nJnKHR1t3t4w22kc=
X-Google-Smtp-Source: AGHT+IGE6QcA79jB0k2Li5lWPr2yvCO9+FLkeHddHmJdCmFiKZKqU+kbSjtNfgztpVuY/0gLGWy1dw==
X-Received: by 2002:a17:902:c94f:b0:1e0:a784:f965 with SMTP id i15-20020a170902c94f00b001e0a784f965mr18198301pla.65.1712135502878;
        Wed, 03 Apr 2024 02:11:42 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66])
        by smtp.gmail.com with ESMTPSA id lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 02:11:42 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:11:01 +0800
Subject: [PATCH v3 5/6] drm/display: Add slice_per_pkt for dsc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=867;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=MU4Swq5XDKyEWa3JYSzWqbeemF0ZbJTcthPE2KJsZos=;
 b=hpx8rqn0NW6jrZNlHbx/VHfFHcMfnFnfZNwaA4Q9oljlHNkFfqChP0YhKK5MS9joROjHj9ZCY
 Ys/IqPqN+8uDp67ZK5JQqci2IhuEveJuFZTRbjjhY/AmRAejQSlMBMT
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add variable for slice number of a DSC compression bit stream packet.
Its value shall be specified in panel driver, or default value can be set
in display controller driver if panel driver does not set it.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 include/drm/display/drm_dsc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
index bc90273d06a6..4fac0a2746ae 100644
--- a/include/drm/display/drm_dsc.h
+++ b/include/drm/display/drm_dsc.h
@@ -82,6 +82,10 @@ struct drm_dsc_config {
 	 * @bits_per_component: Bits per component to code (8/10/12)
 	 */
 	u8 bits_per_component;
+	/**
+	 * @slice_per_pkt: slice number per DSC bit stream packet
+	 */
+	u8 slice_per_pkt;
 	/**
 	 * @convert_rgb:
 	 * Flag to indicate if RGB - YCoCg conversion is needed

-- 
2.34.1


