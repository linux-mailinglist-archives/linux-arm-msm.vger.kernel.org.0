Return-Path: <linux-arm-msm+bounces-41576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A8D9ED977
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 522C61883F1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBCD1DE8B7;
	Wed, 11 Dec 2024 22:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MOdJO1/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2F71C5CDB
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733955504; cv=none; b=FEHLqpbbKMmfs/n7i5WSSqAySHnIwbzxODpiS1wJMpHAbXAo9jRmOhAVHWwjgmjq24ROh8ykRnlY99cO4lTSq9h4fqm5a9galOaVzTs9VfOfqO4rkkXRGEAvcsqnYXfAzrMITY70LddevnTmXdGu27iROAn8v/pi7brqDM5tZ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733955504; c=relaxed/simple;
	bh=0rt+LftUaiIAtV8Lnqx/UsM/DKwcWcCSJ7gULGGysG8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVLVIGKMJzlXW0z7B2y82nvyEkjuph8E5hiXgkTOHPthLyg95XjMntJpSbvCVKk6O7+EsqhIPKZWqVeKFPad1uYduC4WBX4goDvtgq58QI/CCqo9GJ7AzPvCodQ+CK8qApoA0VvTg4yjWTMv08ap+LzBH7X0mI/3tMNwwQ7u7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MOdJO1/2; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d933736380so18475356d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733955500; x=1734560300; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rt+LftUaiIAtV8Lnqx/UsM/DKwcWcCSJ7gULGGysG8=;
        b=MOdJO1/2u1msu9ZAIleGiLmpT4S4X9UBG8BCKWZeWSQCzjp7kRHRNtB6yeVSIvKhEB
         LQvtb+qRfDcBBqLpP1ThZcWGNpXGHfSJ260ig4ouZCUwBX4zSrtGnShkCT9+gSPRLmIv
         E9R6Kz6Eisa8xIWrGxlhPfpwsuvEcux+8pd2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733955500; x=1734560300;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rt+LftUaiIAtV8Lnqx/UsM/DKwcWcCSJ7gULGGysG8=;
        b=BujvkflWUvyD9viqIK3tS3PlE2IdQL2rAEInV6KFTOLwVDsZdws7pKqygMipl3FbLo
         GEiPLB+/wnuHGZUB6CkfUfkluzi96xUPmKzzkrMYy6xfBvy9T0cE+OOeYxZuPhLCJm83
         xzU1L2Yv3napKsywmqiF4pGfOb+Enes9RkKwq3s/mu4UECPEunzm6h3Tn7/gP9JccDiZ
         83aGtZj2fBKz5xknrnlVE2qlL8Nv61Bj7uT0Gu9nn1KMWEHO+XJxxwSzaXZ7zsSNG+ZY
         LvF5m0WuCWW1fLkuoXM2EUh00WkOvdz+pnO/3g4s/s4qoaozHncjWnSKrWhQUw1Fvjea
         ACCA==
X-Forwarded-Encrypted: i=1; AJvYcCV0nQn6QcsypR5xHRgHNKtWTHpbqoaJa2RIIf54VcRoFgD8dpoNu6xF+q6i5RYjL8LcOkM14lQ2148kPJkJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zthnsOjGeqztr4r+qXS0UH5MQuPvpqzkyZLxSio8vZe1Ep8r
	gms7ZUmJVPm4YjrgHYxIqPotXCLFKwG1o6GvBTQK4/3mcl0w0iiaeIAXs8iNVjEVdUKstHNLPYo
	IZveeYntb7kEpPsM6RbZtfe3NJ4ir6bv32Bif
X-Gm-Gg: ASbGnctkdWg+fX2RnZbv889qlIACCiPE6CPEhrCZCBB1nwbwNEU+Dny+iwo9G0IgfBr
	t6MGv8XvOyQGbMDhK8puUHybRLRESMpgE7+SL4Ovy2p2fVxxkpuV+wbheckgVguc=
X-Google-Smtp-Source: AGHT+IEh22eo0rd7CRUaBnizbOTPapamAsVOnD5oqCjCeDY0vRSnRalP/VlK+LQ2LP76cy7+yeYmUI+Cf2UJpD/kvGU=
X-Received: by 2002:a05:6214:d68:b0:6d8:8e0f:8c03 with SMTP id
 6a1803df08f44-6dae38f5720mr18047506d6.18.1733955500628; Wed, 11 Dec 2024
 14:18:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:18:20 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-4-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-4-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:18:20 -0800
Message-ID: <CAE-0n53V9xmrktUBpfNd9Me7pig=c3sP1AcCPdKnpDd-RSuakw@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:34)
> Having I/O regions inside a msm_dp_catalog_private() results in extra
> layers of one-line wrappers for accessing the data. Move I/O region base
> and size to the globally visible struct msm_dp_catalog.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

