Return-Path: <linux-arm-msm+bounces-42330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9FE9F2F11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 12:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F204E7A1666
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 11:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81062040BA;
	Mon, 16 Dec 2024 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrK+pQAe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC59820409A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734348276; cv=none; b=N6n1pO4gQ2zcwXU3pPVtpImcL0RXy7GS2mp+TwBCcH/Jxqz2KxqhWFkSJJm+92mwaM9U9kGrmso7chhzBvucXTGNKHJY8ltfMFf6rgpG/VXvP0FBMOGyf4WhCqqzZelsUWOxN55Xt4m2KWT4MBH7h44fDI4R1JuarN3yVUwZiJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734348276; c=relaxed/simple;
	bh=jq98laTSDdK6EMsgM/2lFfGtgYg99v5inkJlY/nCBlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MF/yKQXgvTX2DnC73d5Ep7fnMtSMoniGAZjOjSV7LGVgQ0BvBbHbq1puuTYVOEo0S+brsIaCB2/aKydyCA/Sux7byJS0ETfLDYuonT2f7gjuht4P1rZozHklSXj009UI4LbF5JSqp0PU+OOpThYC0DMn4klezGB3D6JO+fDBKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrK+pQAe; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401e6efffcso4669131e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734348273; x=1734953073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gty21mjzYgvbYsbhfcrs7XMj7b14Ja6LtCdRiQMw9IQ=;
        b=qrK+pQAe+c9kkL/vzhkIxhIDevT08waFBhNaaRGLHHsIvL7XqZ/A6Fh+LR/xnlPZBU
         wF7vjOYg5m3pfspDIyfIa9KxTLs4/NBK+utvxAsyTr9pkMqbJSQlpAstnkesIIYiBQbt
         lewRwjDJyG8pdBCFX+YqFd9fKvlPCeCUlPKG+bFLP5l79yQ7jaowwgWQ+ENe+9LGJWSL
         PnfbrPep7+m5c4Wiit+eTcit75X4O6hWi4cVmsYTdaZPJrih1rSyYixANlEoPEuCVRtz
         i2ZRGy0xsd3SCo4+6eU/tDARDWp7dDAwYFc6pEUC6Pykh7mMJ6ibBKkUHI27US2SvURN
         CzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348273; x=1734953073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gty21mjzYgvbYsbhfcrs7XMj7b14Ja6LtCdRiQMw9IQ=;
        b=V/8dK5gwlnbPPSlcmpp00lFOcmhcpsCMP4evvdixhTPP7GOZXbOhZcTe5+WTf+lOfi
         5DPARMHqBvtTIvF1mIQJtWeCzDFypTe2AMreWwZVVM6EeWcfaffksaeH1MzaK1O6i4tj
         kccwnh6M5CxJcUgOaB63Hd0jPxVjh8bx6ZZqId8YTaxmmcq5spny6bs+IG5aJcfB84uh
         nLW/DQz0+mhAOUGiYkUriK7pMjjjjAnIbh32FWUdEHXwKEw38EhIKKJypvK9p0LrVHvj
         E+jDD3fEDfOPTO5NPnDxUUipuknX02UKrbP5TO6YxDw/4N/plDY//grayYbaS1w5H5mq
         Fv4w==
X-Forwarded-Encrypted: i=1; AJvYcCXTG3besT2ENndIzBamo2mdU01L7iN9qcGoJykzfKgB/+LKrZpxjephkIZ6Z8UXZQg7k81er/wSXchNMVFI@vger.kernel.org
X-Gm-Message-State: AOJu0YygLy2acbBCwIdmiLVsmNDy47ycN1eeFQ1rqK1rfgj7GZcjTuF2
	OoDaw2n9rNYouhlCCo2WkOeQNnPWlG21daQFinIVc81qqRXqbhBTSZf5VVCIKJE=
X-Gm-Gg: ASbGnctGR3za8xgrXU5ZFhF9jAv2KvO7akUGflF0CFcsRuIPtjF1k+L8ZrBRnIrVaUj
	QOuLdXo6OWrV9Z0dSe5qpJ5MasPtDciFy1Ajus7n8iZVEvCi80ib1APScE0lqi+e7F7zpJ8gXrm
	24RGVATrXOaFX5YcU0zW30OrdLPj39cywoK1z2SSKnKDmuy22S+YZV/3CzAujp5J9sRnwCte9Jm
	BmPXxT63FdQ1sY8Azyzl21POST8PWdAAku1YDPGDy6WwGfgdS9NHiP98JsDWSbf5ape+Acy4k2f
	4K4j3ljQcqMBdEYgrUOF6RFF2NyGwtX6C1Yx
X-Google-Smtp-Source: AGHT+IHzioRjGIPfaVwEFSX3By+G0bPm5p1y4IolLwPf7YBpM4LUQ/QUZx/r1EiqpYtLRC9+8oUd8Q==
X-Received: by 2002:a05:6512:2212:b0:540:1a3f:e848 with SMTP id 2adb3069b0e04-5409054bce1mr3948864e87.15.1734348273018;
        Mon, 16 Dec 2024 03:24:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c1612asm817266e87.222.2024.12.16.03.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:24:31 -0800 (PST)
Date: Mon, 16 Dec 2024 13:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <xchjpeykkqwlpniaspbzitaozuoltoq7aturtu7jq6z4lcxh77@y7t5ge2sa4er>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>

On Fri, Dec 06, 2024 at 11:43:03AM +0200, Dmitry Baryshkov wrote:
> The connector->eld is accessed by the .get_eld() callback. This access
> can collide with the drm_edid_to_eld() updating the data at the same
> time. Add drm_connector.eld_mutex to protect the data from concurrenct
> access.
> 
> The individual drivers were just compile tested. I propose to merge the
> drm_connector and bridge drivers through drm-misc, allowing other
> maintainers either to ack merging through drm-misc or merging the
> drm-misc into their tree and then picking up correcponding patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Also take the mutex in clear_eld() (Jani)
> - Rebased on top of linux-next + drm-misc-next to solve build error
> - Link to v1: https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org
> 
> ---
> Dmitry Baryshkov (10):
>       drm/connector: add mutex to protect ELD from concurrent access
>       drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
>       drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
>       drm/amd/display: use eld_mutex to protect access to connector->eld
>       drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
>       drm/i915/audio: use eld_mutex to protect access to connector->eld
>       drm/msm/dp: use eld_mutex to protect access to connector->eld
>       drm/radeon: use eld_mutex to protect access to connector->eld
>       drm/sti: hdmi: use eld_mutex to protect access to connector->eld
>       drm/vc4: hdmi: use eld_mutex to protect access to connector->eld

Granted the lack of reviews from AMD maintainers and granted that the
rest of the series was reviewed and acked, is it suitable to leave those
two patches out and merge the rest through drm-misc-next?

-- 
With best wishes
Dmitry

