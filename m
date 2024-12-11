Return-Path: <linux-arm-msm+bounces-41589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 917CE9EDA76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB8A81686A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBAC1DD885;
	Wed, 11 Dec 2024 22:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JAQqtacC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D541F2399
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733957688; cv=none; b=WHdaKq5ch0mMgQuTwIgmV47IRHIiQXsuL6vApvMKoY4jfPGEm3wzQrXNqR8kQNQ28w9Yuy7PfzirYQkIfKPYYrS4fhPURSYlRGDPknnWHsR0SyRSeK0nPrlrpLFUPkf/7Ky8OMjv4gUUeRfNxJF4GI8lZpQMPaWTwkscidSWXbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733957688; c=relaxed/simple;
	bh=RHwlBu6Z4VBS0gNpoSsmbFxwAtZwdYd+jvGCWb3rbeU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wit5XvvDhu2VIIhRFdzfspmFwkIbnu69W4KqvD/Ou3Y5VIax8b4MC7k9y8BuCOGxSWpo45S+IKYErpoWzFJ2vIULu6zaefHNsbYpvkIISglOLDixniNjMxUJRyGno7KUggBmTQCvPwNOHLa2Juso16/b0X5fQrA1caI2CeHzr8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JAQqtacC; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d8918ec243so73224426d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733957686; x=1734562486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHwlBu6Z4VBS0gNpoSsmbFxwAtZwdYd+jvGCWb3rbeU=;
        b=JAQqtacCfPzXSST/08Ym4H1CBwnqvBkRARCcHKF8HaZvMyl08jSyeTPU19LRez91Tc
         J2dhxWTrjHYA5g1qPrfklh0mUSuPdy1DFhgUcj1NZQ0N/1uua/gvlJ8+sQd/WFe6Net+
         xmZgGG/PTqwSfDWWQgmwHDYTbhWKxHOjOsn74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733957686; x=1734562486;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHwlBu6Z4VBS0gNpoSsmbFxwAtZwdYd+jvGCWb3rbeU=;
        b=PZlTB5P/bZIcI9sx/mNPSBWW7Cu46WnF8MJ3H0qroyPLO79wchR9ChIu9zHckYMcO8
         Kalf4l4WIO9XccXJ7NxrLRtch2MyiGP5WHdCIKklrTXC1sjHHM+uGwGKEbpl+EghY93D
         pQi4T8wrx6Fu2ku7OCh3KiB8UO8ZhXnQ9oqLBvSixnnDD7dMtN70m1SFqzZZeZDjAHX5
         ynn5JQU/QkQpYiOgBeVu2f84sDhjjWKO1NLwmFg6BUSEV/PQeiQO+PBZLIBs33Oy6q5a
         Ir/m/byCmsuz7+ApJ1XczG/6+UPqPEnS83bsedwmOmMVd8yzP1W6ZTu3zWLjUYOE62jd
         I0HA==
X-Forwarded-Encrypted: i=1; AJvYcCWRTYT8knmfBPMNC87duSPF49Y3b8fT/tKoMTa+pIiEWjK18sxih+5pikDi4EnMx55yIUhIACzET29/I5yh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8DleccI7SOsNmTzg4SXADNrma+oWwj0Hymz6Dv4hF9OCFHaa
	5sdPQp0dDvG03X6lZHio+hfrNDiYykZycrLiOR7srwINuE8OX1ZqjyEK8xW3Ad26p9GOBVFHsXW
	Ya9q69SZTWC88Nklj7AmsGy5akyivoZuqJany
X-Gm-Gg: ASbGncuNTP6IPKjDk96zqKvlia0ImpUf1LPiQhnRf9/2WEE3dkYgIJ4pb6Z6smN4VD5
	u/QyWtS2WbqiLskd3cJeVCWk5phC7EllB4o77Q2pBrOl9DXK1vD4sUz8BWIZXM1c=
X-Google-Smtp-Source: AGHT+IEGC9lOWNlVRcNf6fxO1C9k5anq2FzZawxvc9QRt3uAELPSdgB+RMMmxVMt78OAlW3P2cd1g7RFAijwaS3fIQA=
X-Received: by 2002:a05:6214:27c2:b0:6d8:850a:4d6a with SMTP id
 6a1803df08f44-6dae38e5086mr22115606d6.1.1733957685843; Wed, 11 Dec 2024
 14:54:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:54:45 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-12-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-12-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:54:45 -0800
Message-ID: <CAE-0n509sQEBscLmRCBMBzgYpWX4=62+hKtHcdE-W83LjdcqPA@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] drm/msm/dp: move more AUX functions to dp_aux.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:42)
> Move several misnamed functions accessing AUX bus to dp_aux.c, further
> cleaning up dp_catalog submodule.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

