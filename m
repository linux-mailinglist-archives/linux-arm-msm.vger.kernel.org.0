Return-Path: <linux-arm-msm+bounces-36569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BB9B7E03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 16:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BEC51F2201B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 15:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BDD1A7066;
	Thu, 31 Oct 2024 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqmJW1tI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283371A4F1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387604; cv=none; b=r0iiNEYgl9407tXJ11zMfHbicxayd7zb4K75weya5g4KzmzQSy62YmRrTHtjYwEDQs/ImXjD6veedvxom51pEfMOP20gTgUzJDToknr66Ywsti8fb/PvRoM3jseAv52/xXjJZDTKVJYvbZJvN1eUtuulTmg6O5dfhG2jvBDLPj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387604; c=relaxed/simple;
	bh=nh9PC5QaQozOlc1QcF5kI+I/IQ0W8ZETY6IyLhkA/Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t4JnqXdySzwxxv6FyPl9yKux/yZHr3sRTxbkUODRRQMRCy1cN5YiOoCVZ0EwgdStZTN/jOEmWGvKuDDC68eeC5PDQYjhrmCqrbztZoh4IToHOuk9nlBA7Pq4OCCZkUHx3jIELAWUNBwGiv96lJLezSjM/xo/EXpTvB3banUnxoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nqmJW1tI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d518f9abcso726558f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387600; x=1730992400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koellc828gBIGkngPTaX5UMcJE/cQUYf93Uf4lE+n04=;
        b=nqmJW1tIocwBOru3Z9u/KcuGfdhyCjgr9YBnNrwvozXoTI7pf/V9YEXRyzGL608fhE
         n6e3Bb6gL0Ig8u7xPYGe/2DCJT3/a5ipP3nZ5zO0NgcyPPcTZcgQYfUvY4vkCwpRbSEj
         +L16U6HrJfIjsGGpafXqjUQj753aFEnBTkhiKhNdlWgHc38nF2Tjm0woHa16Ad00ahiV
         Ew9EFhRAWjGe6FvV/26Ir6KVtzVPLhl7Si6PfqRjix91c1yJJaPpHjng3tv5ypn4dLDB
         pdhCTeYk2iDPz8Idx+f2HMvW8rJ2zE1Vhca9TWvcWFTDOQvn/ecHR1+dKrmh3X4WUYFC
         vI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387600; x=1730992400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koellc828gBIGkngPTaX5UMcJE/cQUYf93Uf4lE+n04=;
        b=GgF/X6H6sRiYdDGpuGtPNOqAfQkHrEalmsm5i+bD1qtPS44HSiKeZeC0LpqOeBpCrX
         RyrtFkvEIHjIKl3YdEYFnhhwahWVhhg5nXgDWlSY3Jk1EHVQ11sFkDbAly0JWMEIxIGe
         jhjl49hZVv4IXFcMCMlWbxh5HnoxCNSns2CCmLxeDV1Q0AP5IPdv8XiC713tz9ewZzA9
         iCv3obdNHLwzaAOOs3o7K/Ry0qv9rHl5eRlHKQFkDdgwe0BbdJ4ZqwQ8/hF/8Sr7x41P
         giPvzqHq5s3BVF5jdvF5CPSHko+rEZqS60vh/h+nhGv6EHjmWp/uoF/3DTgiBAcCGDUG
         26Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVm3f0REqdP//CJ3+15XDdC9qAMwH/wll6uimF6nsLtZqMvJUiu9cOU00XOtBEMw+BV9oxvSBsREccL8tgg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0M5TVXTSV6DeSI/qtXSrqpETQAaJeK7BpCxnq+octUM+YCrT
	NeKG5hyUUJRraxIPkwsVRIBf7ig5mR4KKStrQdWZp+jHDAIL0w5JEPe3bUe0aZA=
X-Google-Smtp-Source: AGHT+IGg80b65tTspWaDYwVaXtnM4k1pLyuTpaYB5uPEwlaaoxA0RYPUUFwU2dGIC6Dxl6JHvTcCDA==
X-Received: by 2002:a5d:51c1:0:b0:37d:4ab2:9cdc with SMTP id ffacd0b85a97d-38061127ff2mr13390244f8f.13.1730387600567;
        Thu, 31 Oct 2024 08:13:20 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e734csm2418920f8f.60.2024.10.31.08.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:13:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 31 Oct 2024 17:12:47 +0200
Subject: [PATCH RFC 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-3-cafbb9855f40@linaro.org>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=nh9PC5QaQozOlc1QcF5kI+I/IQ0W8ZETY6IyLhkA/Zw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnI558XyqiP6V/FkHya9Y9TdfEkxts8vArJrAJQ
 olNG9XMOn6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyOefAAKCRAbX0TJAJUV
 VrYcD/4n7+eHqHDr6FgdMxeGHoPyPVwNbkIs2K2ddrqng4/N4VhsaQHT/7lbB1H7RzMWXcUwHR/
 Ql4Ig/5/1Hb8MFtBdVd6Pp/nyCM/Nz8OX8koCaHU8K/juQZ5tR/zgTMWHChUp4CJV2JIdG/oye2
 +jZF0TT0trdsHKzOfjlrUiBE7DzucNxg33rrgUFxgUpaiq3cBHb5NIS2fhWcdnjz2Qd7v/tCC9X
 6UmaLppzb10WQeZfy8xggJapGNWuIEx/meUlBjw6VpirOkZNf9CpW1NzAzahTrT3cuFOJ0Gx8yg
 khVX5hoMsMEBT4ggAbZoFmomXLzlC7MxaHzWJYl62PcumFzalz+pyxnHhTtcOmNqNsqJ3+6UQ4L
 r5q93pGGsgK2djH5QBNaQ+ONUj9XLhKfRBJ696w7Df4lydWZJK/WjXcDzlVjG2lYGHZZzprDcF8
 gu0fTRfxKmH/UyBpxBjUzY8nYiRwh39ho9BrrQBRl0OKxBU8QEuURK4VkUGA1B2TAKLuCIyE2Bb
 lKpWjwKPV00WLJlpMoNV8euD/EMoF0gpkuBbEv/5XcofZvInvVBbwlcdoL/LEvaU+3Pk6sDMhay
 nSxWoIAZQvJCwF3KPQUlKc6DhsBZmRZfwLLZlhdNuNSDI0sptzXmBjTqn7o9jzMfehej3wW1823
 He52S/uO/tXh5qQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them.
So use the drm generic helper instead as it makes the code a bit cleaner.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 397cc4ebae526a416fcda9c74f57a8f9f803ce3b..0038608d29219ff1423a649089a38980e95b87e4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -118,7 +118,7 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
 	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
 			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
+	if (drm_dp_lttpr_set_transparent_mode(&intel_dp->aux, enable) != 1)
 		return false;
 
 	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -

-- 
2.34.1


