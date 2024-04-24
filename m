Return-Path: <linux-arm-msm+bounces-18393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FDF8B02CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 09:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2E4D1C2283D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 07:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB57157A68;
	Wed, 24 Apr 2024 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJeVRr2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FBE156C4E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 06:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713941998; cv=none; b=iS6WYp11nKP1T1G1kjmM4P0YAv2O3RdZX2PUPCmf+lrgW20HCDply6CKonQUs7l2GjGVXLFlNu7XIR0w29uwBGCkEPOz7873xz2v5wUVjUK54iKYIDSK2xGL0HDpfdoeWb70AVEA0zK6iBBKY2mc5UQGGXQDRztBqACbaFRcENo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713941998; c=relaxed/simple;
	bh=7M8GmZoXwP/T+DvSkvs0wys61vOp8/0pqWDF7G7mlKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jM4kutQXyYZ8r51HSuoz4qBcOCZc5aOzF2S76WCkPlJA+sk9c9NvaKS3TFdz90r8D4o1Mg6whuxUnRXfBLLBv6tBXweLxLd8boqj69wOT2a1QvH5OG9zMKJet3DL5U+puB/GhotEW/W4fBrN/Hh6c59lh8BUw9z4C5FBLxzIuxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJeVRr2Q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-418e4cd2196so49537925e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 23:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713941995; x=1714546795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wq9o1Ti0M31cAYT/F0nnazs5C7j1Gk+kwmsgTDjsURM=;
        b=AJeVRr2QExIVKLFxEmTgMne4+6EOMGJeL+TdTvsx+OF9uSuVZSn17yGzrAAkuH4xPb
         IoCCiWfRTEWLL5ehjQAQ9vKJ+i4yXGDjuFedjRVAng6z8Xu9VFfw9XsEWTHD+VamhazA
         UPAUeXOwJ15/b/NzkFcWrWNIkSdfrz/68iV/VOeLhoGkIbSOBkbNsNulWXacyCoEm/vi
         fdlTFSm1+f2fhE7xArpPvXACtcVP/LMku0c89vf9KXBQedqZgMQb5WTGbXsNWQ1oaW+a
         mJySjben2ONBh18Qk6miBPMIBzhawHtWWdDBCqbQFUmO39vZe2UqEqOhM+nlD+EEfBLX
         de1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713941995; x=1714546795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wq9o1Ti0M31cAYT/F0nnazs5C7j1Gk+kwmsgTDjsURM=;
        b=Zjj0Dj6inWMOJPXZFq+yOukee1iHFIE85VVGGQs2F6rsh4C1a2BD8LSfFbj4bSoLbS
         XZXWUr89LwoKTO1bfnn1WHASl9J3+tzimzDMLy2Frj5jkDbdonZVC0L2DCM0dtG12EFT
         EWZ6cI43m670MOhky1yN9LThYyiE7MmQzHXVHUlqyrnuCMqkQVRBJv+UtI3/I/CsqfzC
         xJwuIS6JBW9Uvj42DGl86GVkpn8vHbNJkllvJyzPMeiWbsnjy5KjYPU08UZCY9Ktg4ed
         CjcrcJLnCAy2QOUXVeged9S7smPqpp9Y6xnbe/puO/JTq4eFnmDn2ktgDH1xxwGhxAug
         LjKw==
X-Forwarded-Encrypted: i=1; AJvYcCXC3FUAe45Jpz/iKNa0asalBAESqK+usuT3M/qJhjkindM3IiXXWwfImbBtl1XUTwSPPANHRcTDCCBWl+ZOLfSuOld/OFinqNuI3aSDCw==
X-Gm-Message-State: AOJu0Ywev/Y2o+vKLUkdsvjetOYLpMUYT8OmHSiORjXXZWSps0ocDVVg
	GKsUCjVmilb40qvSRxVkp4QgSwM74I0GDIS6nSckrOiR1NTj1Bjm4h0yftN+8c4=
X-Google-Smtp-Source: AGHT+IGCSTAUr1SuqlB5mnIWg/kCv5rAtu3zc5crQbZIa+vaZ/AfNy2G9N3lAZDizs74NJyugDcOyw==
X-Received: by 2002:a05:600c:190b:b0:41a:a5ff:ea3a with SMTP id j11-20020a05600c190b00b0041aa5ffea3amr1121547wmq.19.1713941994817;
        Tue, 23 Apr 2024 23:59:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id iv19-20020a05600c549300b004186c58a9b5sm22465392wmb.44.2024.04.23.23.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 23:59:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240331-adv7511-next-bridge-v2-1-7356d61dc7b2@linaro.org>
References: <20240331-adv7511-next-bridge-v2-1-7356d61dc7b2@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: adv7511: make it honour next bridge in
 DT
Message-Id: <171394199404.1308236.9174409183083522865.b4-ty@linaro.org>
Date: Wed, 24 Apr 2024 08:59:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Hi,

On Sun, 31 Mar 2024 23:45:48 +0300, Dmitry Baryshkov wrote:
> DT bindings for adv7511 and adv7533 bridges specify HDMI output to be
> present at the port@1. This allows board DT to add e.g. HDMI connector
> nodes or any other next chained bridge. Make adv7511 driver discover
> that bridge and attach it to the chain.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: adv7511: make it honour next bridge in DT
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/14b3cdbd0e5b73824b7b2c7a4b1fbfd743044a5e

-- 
Neil


