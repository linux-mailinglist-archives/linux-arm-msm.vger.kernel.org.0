Return-Path: <linux-arm-msm+bounces-82567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ABAC7045F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 17:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 90B583A5CA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA512FE574;
	Wed, 19 Nov 2025 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQ9we3+K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E37B2FD1B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570954; cv=none; b=HvGtu4BTbzxkcysnnEn3Kds64wtUCBnnEYPYs3tdgvZnMpoiQOGX8ZXyk7VfEQGUkUbYqJE9k344EGsWij/YSs5Tysuju8p7/GhrCkXOvYXFyS6X6MfLb2U96nIIrRSm1uSHbySFJeDF+SO7/7l6ZVSi59fvu1w/SH2XrZlGSR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570954; c=relaxed/simple;
	bh=leYy/21UTD6pIL/9i4ukZ60KL/cbDqbrZ8frEBNBMrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gNhe6QoMe8X6AfITJ+XGJeiYMhDLJAyGS66iA7Qro4ZyxtpgZXy//ezJ+WBKF750UwveCrBx7Mi9cJ1HO3a4XoUm2D1N+Su8XRwJbq8IkYU0dbb/ZbBn8llBR9J2yxy92uAr2Un7XulEFAjJ3G5kP4YgueaheXvUo8ZI7Y2cmkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQ9we3+K; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b379cd896so4031784f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763570950; x=1764175750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GL7qlh37zkRZTRlu95aZolyP82BIEUWrPCKsF6oXxAU=;
        b=AQ9we3+KpTwgKIDxJ2iGz6vqdrRnBsE9TN/8+k4vo/O4kZoiuhRczSgS6rhnaYF29K
         9YN1MBtCQHXPJwoEvtbj38xWip5/C+kGVanAfZaq1eiWvAEawvRHoukGXAN7fh5l/54S
         bp3E/EV7nLucVe5Zye6sy6HNgYGcqUcsHWfgCEAk/3GgDwEpTjX3ILYoIvUIxIRk8v0/
         F4yugJQlhBbMrqRQP359MwUS2Ns1U6sYz/KM2NxlHdxJ6wIM/5C+e40CcjaLhqxjcUUk
         ykeCPtr6qcDlvHNfl7FtHaw+YAua4N9CvpTVDQ0ZEOAIyasbki8ODw8lH7AxwpKD0shr
         AGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570950; x=1764175750;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GL7qlh37zkRZTRlu95aZolyP82BIEUWrPCKsF6oXxAU=;
        b=C8REmXw2euP2KCU1r+E5xOcD4cNpQZtH4neAnzsycQbBb7l/qJSWfIGm0hWWZZwgQp
         cyudtOjhEZxJT6v/AryHWKvnj5+ISq+gZU+393MiXL3dCr7sWnMLAYoLZGVQuAHROeOk
         onHKR37YYevqWvX9r4ahi0PG+kb+/lcemmLohtEB67HavAimlT40r0lB9nTMUcwb/osm
         /1r1Hij09BwkgLhde+i+QjijusMqYnuronxFUWqPexT7zuI7xedcGGBWjXscml7nHRAq
         K7rGdRrdMl1Lw1wHkoNif+YUdKvXORORQeVmeWJtyIUA/vA0AMEtz+zZu+FyiSoGG93w
         60ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUnha9ys+eZRvnVRANHbamw6dn8uks43qrUijMlQcd6g56ARu0iYA4IOyYVvrdXVqsuWB+DZ7j7pqepkOE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu497/7qBOxBid2BlFj7e6sp0YpMOx7eWT6Fh+m3oAhQNdtzB8
	ssOl0gK4irb9uZOmVtB8OQCSKfi5eHV1DUv4F25zRtyrrMUof6TPDzb7ZYOKPWCKyfU=
X-Gm-Gg: ASbGnct1qfy/YLdxLrTe+FGN2ZzNf8v1LqIoCOG0ExMq2KeyLd2Cg5ARyNfanr9xKCZ
	El301eOwIYeBI08Wz2Va7vl4L1VBU3lWcqMfd7462lc1I2GxZT+j0ZMQoM4iI4BFidiPBRbnGE3
	67lk6jHhh272+QdjwmG1S0CHdM2qmem1lMhM34viM/4cDGEtpRdULya+jQ+Yme7B/RXq/MPZZeH
	VcJpBpffTLTMo7q557XihaB1rENr9ZjHf78ju66UFRC6nzfea/PfZG6oZfO6WtS9nxCzzdXYgGb
	47bAJOMJ2LaM2GKEBj70XtsencvpUc0QD4VWD3l8bpLjCvPv52Od5rZnZsV7KbYJogyxXPPtgAx
	DY39pssfje0jbPrhUIPbt/+9p2bFf1tIv1nxId2GZ1ScwByz0c+oHom0aJQVg+0lnVOqzDsH0f3
	Fgzfhs8WYScliQO8IXW7o42dFgps0kdGmSac8L1aJiIA==
X-Google-Smtp-Source: AGHT+IEOxKlCU0fVyUxW6LWeLn7CtAluz8WjPTxaroJlgm9DOICHacN8yAahbHX8pTucfhXi884sbA==
X-Received: by 2002:a05:6000:64a:b0:42b:4267:83d5 with SMTP id ffacd0b85a97d-42b5935dde3mr18285757f8f.8.1763570950069;
        Wed, 19 Nov 2025 08:49:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:49:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
Subject: Re: (subset) [PATCH v3 00/12] Make Samsung SOFEF00 DDIC and panel
 work
Message-Id: <176357094919.280640.16902732888424119445.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Wed, 19 Nov 2025 15:21:25 +0100, David Heidelberg wrote:
> This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
> (SDC variant). With proper support, all downstream patches in
> sdm845-mainline and sdm670-mainline can be dropped.
> 
> The mainline driver was broken so far, and with my recent introduction
> of S6E3FC2X01 driver, I had to "break it even more" due to OnePlus 6
> common device-tree changes which defined all the regulators and
> corrected properties.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[01/12] dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1388c08c84a2b1f37abae656c1f88d18ecb1364e
[03/12] drm/panel: sofef00: Clean up panel description after s6e3fc2x01 removal
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/05aeb5bb4b699b51f88d9f5585005b6eb66a496b
[04/12] drm/panel: sofef00: Handle all regulators
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dfc7e0859e05991b0920bd249434e44866a11bd1
[05/12] drm/panel: sofef00: Split sending commands to the enable/disable functions
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/18642542ac4916807fc0925cdcb9356f5802e2ae
[06/12] drm/panel: sofef00: Introduce page macro
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9f1ba273f55f93759cfd1098e0682b03eb115bb4
[07/12] drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1e534a56578bbea59165c3507d2b967f29771792
[08/12] drm/panel: sofef00: Initialise at 50% brightness
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e2e94464cf44f91c92eb631d609f812c7aef8840
[09/12] drm/panel: sofef00: Introduce compatible which includes the panel name
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6a353661e7058795a800de3535e4e1448d125676
[10/12] drm/panel: sofef00: Simplify get_modes
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/940c451981ebd0901f39675c9ff3b3e1c9760571
[11/12] drm/panel: sofef00: Mark the LPM mode always-on
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/73540e5e7c52264633c66aad681e53f7e2f54c57
[12/12] drm/panel: sofef00: Non-continuous mode and video burst are supported
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8bff3a2bf7c50bf45766edcd5440329d6b5cdf96

-- 
Neil


