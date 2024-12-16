Return-Path: <linux-arm-msm+bounces-42374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4469F3900
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35095188F405
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 18:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4D21CB31D;
	Mon, 16 Dec 2024 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FOimZLih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADB43AA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734373823; cv=none; b=ubE/Wj2T+KMHdbV2Uk0UzfQC8PbqLjtVnu/PMZcWP5O8Z+9WQYwL0HqGFA+2aAcnXVVOEk7hIP/PCkFRGzNh/6OnusxBti1Jxw+gAgIoGTvxVbOaaL4tdTz6cqd26P3O8g+rt2zwj1sOgkRzjxqLtR1FyLiPtc9CBOPi9WaJld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734373823; c=relaxed/simple;
	bh=jnwuGVyAOEKZ320Va8tOKK5N6yh3orOqh3vNUx1y0RM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYCWQXZ3iut+M9aWp4RcCbKbbZ3GnYaRx+gy7b4q7FTsgBcBh6rdcPS9n11QL2mMcSj+udZjbgOBEGzu5+33pX7GPHJR2YdDSLno+o7fhXcfiV5U/VLac8XrwdLzDaxSIYFXZTeMoS+EkgXr7yovPxZQj9zIY81HCdNFW/EOyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FOimZLih; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f29aa612fbso12789437b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 10:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734373821; x=1734978621; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnwuGVyAOEKZ320Va8tOKK5N6yh3orOqh3vNUx1y0RM=;
        b=FOimZLihMFU0RA3VpJizyaVIYF1wr5euRkKrCErAI8kUAusYTLOyZj2FpMUoij9uJy
         gaGFpV46+so935UaQLQm3OcuLSUIWqR3rbjlTsNlIXME/I/ipvpITgn9JwXJ8LZcjssE
         UITwvkYVQ6bYbC1jPjuvKjhyyyp0PysYCv5Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734373821; x=1734978621;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnwuGVyAOEKZ320Va8tOKK5N6yh3orOqh3vNUx1y0RM=;
        b=gkc6Dzftywr0nUkOGebaX5goEVvwXzhFraFyiU/fBrMo65F+FkCoCpeHzcHEwik2wg
         A4ZGbNreNcOoSqdJ4Q3eOOMydAvAqyVnAwAS3Dl0okGSAgspKmUJJoDgmknr44eAQVPq
         rMU/exglYfKB+QJdq8J1eUTJu+oRq5D846T7wB0Nx8gygeh7Iccdv3NBTInjuvG/QoeU
         3ivpmp4wp3qKMX1KxZFDPYW95beHpW+c3+emikwiTkVU2/RqZr/cyNK8GUJh2xX/IhjT
         etRrqSaoGHIKB+NS653DzJCMVTqV0RtBQ2dLNRuOBWYmzAzvxAefeh9LtVz6rfT4y1vz
         Sg/g==
X-Forwarded-Encrypted: i=1; AJvYcCWVL8MMsyOhHxA8EpxXiKUdj+1MslhaPMF9xGEn2Bjk6QM4U8TX/wWCbhrARpmaFXMOHKZcBGlZuNvLwV6m@vger.kernel.org
X-Gm-Message-State: AOJu0YwoTX1xswcpOfTxjUPaYShmGl2z0+m2vkQeyLa5a2I8VeRNsCmk
	64ZERyg/bjsCT7V394oDb4J17XUqItOZgpgFGdFQk0MA5cQVEg5BKn4k+mkdPqpt3a0dMqWcqRU
	Wm9z8JWNKOZsaCE9zrBcVKETbCQcqxlsNG+HB
X-Gm-Gg: ASbGnctFdEfq1DzVi9HVDg1td4Mw7sEbDuygZt/2/oDQFTALYmQmqPkmRYkSxilUNqC
	Q4HUcEIzNZJGtd9/PQ+xcOXTWY+RKxN8GgYmihyjQlwW1nrTbCBX8YQJeLmEQ+Xulwg==
X-Google-Smtp-Source: AGHT+IGAZ9GP/e8joq93AJgn9vGXh5Tq52Geg2Bjs8/hq7LhWnPC5AAAAbSev0Vk3ryNjuoLA19eOKXVMbQsxPH64mI=
X-Received: by 2002:a05:690c:d95:b0:6ef:58f9:4c0d with SMTP id
 00721157ae682-6f279b9e06amr99061537b3.39.1734373820988; Mon, 16 Dec 2024
 10:30:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 12:30:20 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-16-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org> <20241216-fd-dp-audio-fixup-v4-16-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 12:30:20 -0600
Message-ID: <CAE-0n50i1nLrBAgOdcc4aW40O1Bxd_N7fgrK2jCZqOFbMosAug@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] drm/msm/dp: drop the msm_dp_catalog module
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-15 14:44:21)
> Now as the msm_dp_catalog module became nearly empty, drop it, accessing
> registers directly from the corresponding submodules.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor

