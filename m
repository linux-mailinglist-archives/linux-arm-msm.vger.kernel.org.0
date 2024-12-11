Return-Path: <linux-arm-msm+bounces-41579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4BD9ED9AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CA2A16782C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C59A1DCB09;
	Wed, 11 Dec 2024 22:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MqB3bYgt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AA91A841F
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733955985; cv=none; b=H6fygffybPJ//IB7x7IQMo+j3JenqaeK8BeTHvX1ZlTLSrU/ylWLq67atpPARBS0Gce+oWN/Bm7bspa+ahtRmLMfasqm9l+7bk5aoHG9GS8wamUjQLwQKlmdraYySWQoNiMj6bmShHD2DaKmex7dvmAuo/k1env1I+fglpiQ2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733955985; c=relaxed/simple;
	bh=/M/xqt3HYEq8xu0qvRyIhfyiL/m77tfLGjHEA9e2rtQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEe2swAIt3YCMD/E54F8EcPqaL8rMD3UzKQqbtrGWu68dtku4Jg/Idq6yZkDnohBnThgzRMj/v2f4pyqj7BNxKi2FSXKw64KsBUuoSTpOkAwkL0IGHtV2gllU8L3QLxe0kHbWqbDM80hvM1i4wKkEbKElqkxj9uLLqMiaESmH68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MqB3bYgt; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8fd060e27so41137656d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733955982; x=1734560782; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/M/xqt3HYEq8xu0qvRyIhfyiL/m77tfLGjHEA9e2rtQ=;
        b=MqB3bYgtCeWvqip56L7u8KuiibN3OPY4EGCCgyNS4StbE3e9qPfL6H1bqUSI6hgwaW
         Qv4w3f25j27I6/rLPT18k1AfWxRHcTHbjz0QDZgAJzlSP4A7eHdt6ztNnbnzsbZ1jfOO
         YLwDhRToaUcW9BJKKqKT8rzHsPcY0/q0plt7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733955982; x=1734560782;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M/xqt3HYEq8xu0qvRyIhfyiL/m77tfLGjHEA9e2rtQ=;
        b=aiSQNTDf5LnTGK9kYk4m9GUeo+gA9CX7VISZmUEVpHOhg0yy0ZdgVSs14cIM3STDc2
         pGNUqogbJd6xhWtJ3s8mDQIJYzgpusDR8APb517oIP+Q4vleUTEjN/shWPTjfsX4kglG
         7vxcY9UIQ9MkfF5u4PjLDiZnZHcUtP1dCiXbuUdL3ou6l345g349O2YS4ULWKzlL8CJE
         xI/nsmxUfBSRuxg0GaBl6gt7igtgn2ndzciBBkhkcmTJ4hE+xyBuCi1CbqeeiWgWzugY
         X9A5KiwpOxLnK12vqZl4o/v4jb9yaxxp3E6XWbPhjCoBD+PidZCIJaQGkFM0x7DOsxNJ
         GBAg==
X-Forwarded-Encrypted: i=1; AJvYcCUsHM4qiCMLlnVR2VO0G6jpPwN0H9yFb1iA3UXx+bPYZS1mJJu74aM/NqYE+5KsmQrMw+EzqHrIWuj5yo4K@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ZufhChK2xH5Cgu22Ayv1/y0NhKWwcLQNvuuNUsswJ0leQqmr
	4JeeF1C9cwEpnrXOBMRMT1mMcTUlb/+7M6k4Y6LTMAfwpHP2dFLxP/ndo1afoTNng/xYFt7UeZe
	9KkqD77q9YIqLjAJa7T+G2XUpKWDmvCcSaOlI
X-Gm-Gg: ASbGncsYyFx2ukFzSYc0ebampC6NzBgi0TvJJi4jiVKNFxk6xew1EUgilqzz5K5pNYZ
	t3xMJ1/w0tecgN/hMjKZQpDlXVpUI6xX3w6SNKI1mpqAkoN0V6Ff+kZ3ej1jD44E=
X-Google-Smtp-Source: AGHT+IG1XnoTiDslXI0cLjNa0JxPS1XzZXpqmwomEHJN72jbeseiTASByoXZoRuL5Gwb8j0Gd5R1nHZIPbm0MA4yihY=
X-Received: by 2002:ad4:5caa:0:b0:6d8:883b:142a with SMTP id
 6a1803df08f44-6dae38de1f2mr20414676d6.2.1733955982669; Wed, 11 Dec 2024
 14:26:22 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:26:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-8-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-8-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:26:22 -0800
Message-ID: <CAE-0n524xYp30nsCh4+-N=dy8g3EuKTkwA5yXbOOXzMeHJztFw@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] drm/msm/dp: move/inline panel related functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:38)
> Move panel-related functions to dp_panel.c, following up the cleanup
> done by the rest of the submodules.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

