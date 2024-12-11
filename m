Return-Path: <linux-arm-msm+bounces-41569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA2A9ED875
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ACC6165C28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D17D1EC4D6;
	Wed, 11 Dec 2024 21:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RrcNaFzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4BE1EC4EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 21:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733952071; cv=none; b=Sd+rnsi+Up9EvXKdrkC0q8WL5C49UlKI5AzvnSg+UurXbiplyGU6KwmPGEiblGWO3INiAyx91wWZHGwkXqaMAVlW1U8v2V0oYbZL16BlpCEWquwlmMDGVTblKi/xEy9mE9ivgaTJYzinAKnHqmyVsbRWP+iXLHvCO9IjJnl+gpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733952071; c=relaxed/simple;
	bh=brnEi/aJpSTL43ttJW7MhyFkF6Ud+FSLpSFKqAmDpCw=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7bEvL2PRBU6vqSb176g6blem3Aeene0sTBO8P9f+RCJnnF019JTqJPKIDjptNiWdZb2vX3SO/fJaEky566asrHURTgnDcYD4g+EITkWv81NQ/OlFqOzP22v+iTEdGChRQ+09pP3QYiQbvjgri8GgEqLfFy9I+b2XFhKqZKmDBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RrcNaFzV; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f00da6232bso37765057b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733952067; x=1734556867; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brnEi/aJpSTL43ttJW7MhyFkF6Ud+FSLpSFKqAmDpCw=;
        b=RrcNaFzVB8WO8I9y48CPyz6bmoTFgkPGNqwavvcc2rYzZG/5e3y7Z8WTJaGvbUE7zn
         RwIHxkayROQ1FWFQF8S89RC7YFI5tqAD+4De1g8a/oz950a7xMpqaPeg3yUDTuHy4cva
         ZOVN7w0jrXMQhlyIlSQy/KMjGq9/LJMX48jxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733952067; x=1734556867;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brnEi/aJpSTL43ttJW7MhyFkF6Ud+FSLpSFKqAmDpCw=;
        b=WC06EuBhI5PtZ6ZL4M5WGwutL9HCaxpt7qL7FEJjoO/ZRI1hIDfWhif9G0z7vqJI5b
         G8YJyhXmg/itNSmFQTA+Mue7hYivUDNvgYwAnbAL+FU/RUJNwSZ35MDzRRUh+35F2zBF
         3W+1EHPdAax6XGAoQQDmUvtvXhZHJi9V5HPaQaix7w6AmuTMK9qMwU+XptE2wruft8OE
         PVjffOCp0FA6csJo+sWYNI5L5bZ9qQ4Vyvip0n4foBFJIQEDONaTUI+akVJluwy7Fah7
         z/BmdmsUevn6CtbEFqx/ZPVidg8iWpl86Qy9tfwfswsZADop+CBGAdhxmJLrfDUJh4Hz
         rRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX79obEnt+wmPaBi+Ymv/UMxExzYCbCC9km1QblBE0gVa4BX7mHkNhONPnIzzeFAHE9T+4HME66n68C/sNr@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwi078shYWLbwmhKgzbVpd7y0Xek+XaTJipwQSp+BdEqxdsz2
	Ctclhr6xdmISYF+3KvEbpFb2zRsMD595iBEoNnxLn5s+7M4lG2nuIO4L40xL2WQ3+Y9LEjiGF0r
	PuelJi3OVIDuQypuxYhhG+8qmSGkCN6A3H3Ri
X-Gm-Gg: ASbGncu7alerqNX+f0r1QqoEH6NrFipy1uvMrISnz2+AhQomsLj0DKFkK3BQR20s8aA
	xr+5UV+xjxUEnblYXaJZDH12UD+uZYPCdv/hH+f3fFRrobg2N9VRpnqurxnd3Kv8=
X-Google-Smtp-Source: AGHT+IEq7Zw2BDt+iOPDyUWk0YHRW/a0ILaMn5oRc2ufsHMgU7TT14V8Ms7zyoIfRG/qrZpS8pIGFl7jVktKfKw+4P4=
X-Received: by 2002:a05:690c:4c13:b0:6ee:4ce9:b33e with SMTP id
 00721157ae682-6f19e4f0f18mr13027267b3.12.1733952067697; Wed, 11 Dec 2024
 13:21:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:21:07 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-3-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-3-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:21:07 -0800
Message-ID: <CAE-0n50U56XYpayM64BBOPE5U8xQaYg9TOWWmCvtyzB4kChgYg@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:33)
> The msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs() are not
> called anywhere. If there is a necessity to dump registers, the
> snapshotting should be used instead. Drop these two functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

