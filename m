Return-Path: <linux-arm-msm+bounces-49338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792EA446F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D4891895EEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B216017A597;
	Tue, 25 Feb 2025 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8KRm3E8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F218EFDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740502181; cv=none; b=uHohsl8whY+9UABp96y2x5D8CYiOb0nuncGbOAyI1SKXNJ+wMYCcnL0doXwauf0IaPL1WM9hT5z87Vy4zH8JRoBObVRolhk5aNOm+LzwUkDUC7fyF4kF8OBZ836P1YB4mAafFGASzg95c024YaAoGoFa9gbuwszlsUzobqUgE38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740502181; c=relaxed/simple;
	bh=cSZ9ztT4mLDjdEXFNeLmYtzxxkPEck5tI6MIaJ3bziU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t7JKf1rQbPJOtrGRDzNU/on+n4V3caCLPp2ZiGpxgecS94uThSQ2/4AcU1dg2LfuuFmwqcRtMYCyBUFTDR1OMzo0CBvZPvI5qSnJn8xFfBt3PLSmNIXajCyFAxuO84X/WFWzmQfSLF7zB7a7Ngw3NfP6jjwoU1wdIXXq1Onbap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R8KRm3E8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-548878c6a5aso787135e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740502178; x=1741106978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mgWZibQMuHj44S/S8PoDTRgBr00ghmQvGRAk6+vKs4=;
        b=R8KRm3E8/OF+6VPT+4EdtupMDi/G+HBtGPP5JXaRFd5AQCzNdzTG0L6GV75HAl3PLQ
         b0SXmqtZNaNSFA+mfeuaAzFNK9qy8fpM0SSphKz9DyseCXpR96eGp63mG1qHMN64Am2b
         L+ih8xwibZoxRYkwqx2UOHKez/BNFhmhoK3o3B+T9M3RkBfzQ4hRznTqNtOJ+lV7ECcZ
         IX9SuB77oCqrP4B0t/8Ux4PBayUDOf5N8e5CPi68+vmrkGC/qg/7l7KFLmT6GfD1G9g/
         nYpUeC5FvYN5MbhzNilw+524h6Ek/R9PdXOy4JiDumXAn6bSdgKUXODvVmq2nIhiaZwg
         mQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740502178; x=1741106978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mgWZibQMuHj44S/S8PoDTRgBr00ghmQvGRAk6+vKs4=;
        b=VGpdTduenV5TkI/TTp4P0ZtEanSoj+wa9UBc8nd/YbwgiTmK3spPoSsz7lBziVVB1+
         fIpZUaWfnhsN9yX9l4+uV/OCpkxAG0Q9Q9bxZ+rArObj3jGC+YF+2tWQWpTgrgusHn0N
         FRZUA04iN4/0oZ/BGtj26K43RSfcuXtIm9TlrFqapKv6F/PUjala1oCTaliWDsgs2ftw
         3/FqdUj91g1u3Tji6hmdYcogAsRW4FwPc4Rxliw0H+ZS2zAl4/GwYB72pt8uFbEZk025
         kJLJDApviXQwkuwTZ6kD5+vWKPNkC2lJJtj82byYjQBqh3O+j68dr9I7MhpmWwgzF8v1
         3THg==
X-Forwarded-Encrypted: i=1; AJvYcCXNAS3KJD6RwqSJf3LcBw8nNQKld0jn0YIllET5EPjxgJJZU8m5qWS0ALR6BuWEviDlPAZ5+NqiBA/yJW8o@vger.kernel.org
X-Gm-Message-State: AOJu0YwL2K0rmQwy/Rc3p8chYT6Pj6umtZd3agr+PKU1veLp5VbPgKMi
	3BV/P1Vg6Xn8zWOS11ykx2PGMZJio6E29AcoKac2VFPCl8Vc/eYl3KZg34aZuSA=
X-Gm-Gg: ASbGncvGkhdUDy+mFShLVJ7LzbKXmLf61DsBOJcGkZINJqGlsRge6TstVuns314QXLX
	fHtOK8ZgkW8qrGP2/7pn0m/W2uDUpoIjIqlnAVOyaGtMhvIb8reyUfcxw3pc8Sjpa+h5D7zYjYZ
	bxvIf3You5SGvZLgMowJRZUTPOlBNcLIH9Xqx4alBn/7g+STIU26Eo0FfK5YbaF0kborzO5WYNy
	1MyujhCj/FyoQfnMnlUZ83Trc9H1hjoO6FcZO8k687pP/0WJO4PTv3gVNsNCbZAgFGkE5UnC/bU
	y6KLM0ULJedy3mVPaJtxzn/r1GdHp5vSoJu9ga1aDPA7QV0wSvPv7rV9oKQFRTcQnbHSkQ==
X-Google-Smtp-Source: AGHT+IFORbfzYSemq6WfOCUglMYdhzTg71XD6K2L6XeaH8kQIvUGNHFObPzSD2MUJfic2yxCajAruA==
X-Received: by 2002:a05:6512:b0a:b0:545:1d96:d701 with SMTP id 2adb3069b0e04-548392598eamr7478215e87.36.1740502177754;
        Tue, 25 Feb 2025 08:49:37 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b25e6sm220407e87.7.2025.02.25.08.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:49:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v5 0/4] drm/dp: Rework LTTPR transparent mode handling and add support to msm driver
Date: Tue, 25 Feb 2025 18:49:35 +0200
Message-ID: <174050217098.2377948.2211237197268827323.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 03 Feb 2025 12:57:55 +0200, Abel Vesa wrote:
> Looking at both i915 and nouveau DP drivers, both are setting the first
> LTTPR (if found) in transparent mode first and then in non-transparent
> mode, just like the DP v2.0 specification mentions in section 3.6.6.1.
> 
> Being part of the standard, setting the LTTPR in a specific operation mode
> can be easily moved in the generic framework. So do that by adding a new
> helper.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] drm/dp: Add helper to set LTTPRs in transparent mode
      commit: 5e7715478c273e5b17b08942182bc0350b7ef3a6
[2/4] drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
      commit: 226a0baf9098841ceb92ab7804a07426540663c7
[3/4] drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      commit: 6dcc3c5121b72c3633592db761e76083cf7623a3
[4/4] drm/msm/dp: Add support for LTTPR handling
      commit: 72d0af4accd965dc32f504440d74d0a4d18bf781

Best regards,
-- 
With best wishes
Dmitry


