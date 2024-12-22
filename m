Return-Path: <linux-arm-msm+bounces-43056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F49FA3EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E664D166C3F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A42113C918;
	Sun, 22 Dec 2024 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdxV+KUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B3487BF
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 05:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843652; cv=none; b=oYS2yD1/8eAbKPaJdhcQcBuraRjoFb1b7w5sa07XCckSWgZMOmmgN4j/7SZjoBcAjWOoAEznJ4SPBwdKHAQakfRhAxj36oVz56LDThYPDcM0HO6Zki9YhU4wSB2cpOjU1kSEBtBz7dhpilF/z9Qx83+fHFEP25leuQvT6Yl6fZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843652; c=relaxed/simple;
	bh=lEzV2DFxHSmrj9mC/gnIKltRLYW/iHK8CYgZvjQpABw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lL3TiMn0AG79dr/TtjR+ePqKPQz/ukhNWSZX6wgr5n3YN5nQIL/5RUg3gM+40VlPClRjdq7uvQcC2G68aHc5fqnCEO6QePZuPlfFqPWBhtko0JklXrYtBQ7gd1MTvddnzkCizWrvZH3Jz4rkgGfpnYERrnWFYSOorCDI48l+8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdxV+KUa; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54024ecc33dso3873217e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 21:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734843649; x=1735448449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUHXS68dzii47sCyHoBGO1JrTDTtIN7oWeXHXt5K2JQ=;
        b=DdxV+KUad3CUYhwfgEjbNe9hmQxJU+olBcwMSESaCkzYC0FFAEp7cZo9kzXkWnAteO
         StKlYreroI5/nieUMa1ZWVjHT0SCfXawl4ik/WnHAXAYLunfuIKJpVlgFx2Ri23mbV2z
         HUIEh7i6gQxG9CGxiPBQmKmiV6CwZFC4ZRPSDBz4vQGCx8GkE8uwH9GdhzYXB7QFb67V
         2IjQdg95ECd4MlSczLzfguHLSkj9ERlzL8OzT5MXWgAlTdDQKFDHmCS0HD0sQAeI9Nrs
         xWoz122742JzlNVDBcM2Vj9jFdsqnau207RiVa3xvUUNW/ONQbg60AzGSYvOEfT8pKfu
         rgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734843649; x=1735448449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUHXS68dzii47sCyHoBGO1JrTDTtIN7oWeXHXt5K2JQ=;
        b=cd8eGk8YgcAQtw/b+fttT+glMhjIu2I+bobLhs2dhLF/TTw3QIHyl4GnbSqvHgTfTJ
         qbo4lJ/qHzWo4fDIXPL13stPyH7nX3KZT08Ej+fkeydL0ZrLwUcuS+0KLyAvtnQrMgjJ
         4G45wjWD++qXrsGHMEoI5gc4SJJXH0zN8wMFvkkfJen3O6JWdblm3V9OgVSbymBo5Maa
         g3F+gYUURCpShmB4OiJvCSPKdKhXWodH9UaFXCl0l7GjYtFG7Y5LjhoJa8d9qqfVwxs3
         o4HfUg7xY2C7ryZl/A3qNcNtZPYVcGjwhijxzal+C1nZZdW049D+oTOpwMg8nb2q1AFZ
         C8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWv906d5wGlCVccQlMLO7OQkvKd61PS+Ep1yZpkywwXk+EfpGLi8EROAkLcDFvsWvVC2mcJ0SdnPFL7Y6iH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1tEaahLvogVOdBeWA54ZGNYCobaAYO3CRDtKwi8m7sEIzgB4
	s9j6bX8UL80s7LH3cCMZdHyk/fwrBIaz9vLwUJsHlYPoKvTmMuPvECDwvlyuEpg=
X-Gm-Gg: ASbGnctH2QPFCKOvYL2Wm2juJFo2g+/MbX4efR6g1olTOsfP3iJkBvxy0n5Mmpw4JAQ
	aaAYosEXqS+F1p4gSUMSqGJTDuEaiPVnIzO/A8tSv9E/15FOcE6sxUXyZFORrdv83LCRi0c5qfw
	JQxv4WBSR9OZmrn2DEtozcwh6gCE/NwoRlW3sY8LELAo6zk+XAbQHfEixhZamsWzPBlRsvZ9sUD
	63VPZwTg779/cVKL5vZFxfa1pjbYJ73iVqWZW6ZnA0SSKYMlTh7AHMGP1ybhYL4
X-Google-Smtp-Source: AGHT+IF+Pt1nCCP5OVvGkhTdNXEz4B1kunIC5TH+Ahw6Mi+g/aUmHdjgPeeYunkjxCOH1d29CuDaLQ==
X-Received: by 2002:a05:6512:31d1:b0:540:1dac:c038 with SMTP id 2adb3069b0e04-54229524fc7mr2631228e87.1.1734843649198;
        Sat, 21 Dec 2024 21:00:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:00:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:41 +0200
Subject: [PATCH 1/6] drm/atomic-helper: document drm_atomic_helper_check()
 restrictions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lEzV2DFxHSmrj9mC/gnIKltRLYW/iHK8CYgZvjQpABw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z7nPIekJhdnUK5YoeVX9bvlTyiNvqjiLjxF
 HpRt+nQbpqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1Wr9B/40R/wzCdA6LcKR5piuLK5GBYyyXYi+7z6d1Ml4lcBIde24q+/8h69RHvVODCvzFYcRG43
 RU+/30LCutV5t2i0fS2sc/ZDYUFxAsLkUADrXK9YswlbqT1K3Jscky9S2+TWLxEskNFPwP5GSUI
 IumfzysS9OagOKAtHinV+1OOi4rARn7NsWyHUOlqiIedR1j+STxpB7D3J/dwHa0EVHjQrl2YTVS
 MQ+WKXsWgN4uLX0K1jQXgpBSXgVYUyNjvqBEVOqT9GjEGdhPP03CHccy0hZgR93nPCV93pTP4Fg
 Ao9XIaGu26sfYfQPSBiLeKSV6rEifwYMjU6y0AT9T6Jq2tOk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The drm_atomic_helper_check() calls drm_atomic_helper_check_modeset()
insternally. Document that corresponding restrictions also apply to the
drivers that call the former function (as it's easy to miss the
documentation for the latter function).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a503701e228e382cc45180b0c578d0c..f26887c3fe8b194137200f9f2426653274c50fda 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1059,6 +1059,15 @@ EXPORT_SYMBOL(drm_atomic_helper_check_planes);
  * For example enable/disable of a cursor plane which have fixed zpos value
  * would trigger all other enabled planes to be forced to the state change.
  *
+ * IMPORTANT:
+ *
+ * As this function calls drm_atomic_helper_check_modeset() internally, its
+ * restrictions also apply:
+ * Drivers which set &drm_crtc_state.mode_changed (e.g. in their
+ * &drm_plane_helper_funcs.atomic_check hooks if a plane update can't be done
+ * without a full modeset) _must_ call drm_atomic_helper_check_modeset()
+ * function again after that change.
+ *
  * RETURNS:
  * Zero for success or -errno
  */

-- 
2.39.5


