Return-Path: <linux-arm-msm+bounces-18444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C48B0B1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 15:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 604F9B2902E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 13:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC50715EFC6;
	Wed, 24 Apr 2024 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uiohh11P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F115EFC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713965616; cv=none; b=Go9SVa/WK1pnf6IKchyR2ae5FZkevwKY2/D5rnoONx5wX670J4Lgzgd/OxTjEyZpNS5h1bP3CW8YCG4dHCLjLWpUQmd3el4rK41Dbaz8HbmjpGBZoG2NNlp1N5qeX8XwYLy5DMihgOJm/iCL2M35q1rFN3l3uBKYVoKFjvZlyhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713965616; c=relaxed/simple;
	bh=yfKnRicF1t1beWdKe0Cxnk3zC7C8moxZz/Dj5koDfdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccgtN8MXTR5pE+gxhRgc6d2Ibcp3ZH/8AQDhk+3fY/8QQVj4CiXXsRf7ZqMm+0XAeSvjDW095RH40RNr3Iw+3UDFEVroI6i6xKYBcLrD1zWUaOMSt9SDCf20Rd8BqX3L4Ujj4yURIc8V+9SaU1pCPp5hYITYrjskUaIlyWvpavE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uiohh11P; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-de54b28c3b7so2322342276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713965614; x=1714570414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jc7SzQ2rFd1yOXtRir0afWZyCYP8A5E33YvodhVoINM=;
        b=Uiohh11PM9gX02tczklc5JcyjX9IQ5U/MipEUt2pMQyyAAEEVh92u4WTNBDrnQ+uuC
         34nwHcaZ0ZCA1PWciJIk5GaSdcU9X/BvOvR3vp9Yzp9Wz3yFF1TjCGduyZTdI/KRfHnq
         aDENIInlZ3rF++5Qe7gZAVlZcTZ/H8MF1UBRTnuQVLKWu3KYqOzFxywSIhIcsG+5sM9G
         R+l8H5G6ytPtzfYREJN48DZzWF3+LgX4WWukjE18zkfcT6XpoUXq8WXskIPp7vFCmi3X
         qzsil6VSc7C5y+HrhBRha/USjUGayPzkaj8T0gPQnZNDaOUpmSHsid140hklp7prkM9V
         bsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713965614; x=1714570414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jc7SzQ2rFd1yOXtRir0afWZyCYP8A5E33YvodhVoINM=;
        b=cQlHjyKd0qbi3mljt+S/jZElJ9ZdyCBicdiACFZaaoYn0Wl9TL2pzlaOsT8FfzA+4a
         Pr0JeN9sgxa6Iorxx+fn60f7WThhYUAueQ6DTLW3gUJqU8iUCI5CFCzP6+B+8NeACFFi
         6H+9seK5yIqS7VpvNJH+rpe4ruxY4V6UWr8mse9wNqXQdYV/XUXge3LzF17rdlbwA9ae
         LXUtrj54xEJNoY/q2V8z7rlmN8QSrW560lLUUZejQx6Jz1sVQCdRFkIsBDoH/ta+hlS9
         mJaU4OTXtmpR1wzxV9yMtuIEVp5gqJEsKCxS63/gSW4QWAE7r3Pew2aitXcT08vJmfPn
         u0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWxp2630E/Fog3Hb0psRKHN33b1Tnzh6M6I68lkofelQcA0Nzpw9ICUzI4ADt5vGBvTXZX6v01ZIcNfvCTWYIa332Xv82A2svgOarz/Ng==
X-Gm-Message-State: AOJu0Yw5owlxOQonpEdS04of2XEnXGMh17vDO75Jw5yBvF3EkFqXtRdb
	OAP6FOuk54qI/R4lsQAqViA/aBH+mcN7MoJ5RyA6N0QASPKCBs6U0JyKa/5Rns/1tvhTYznv5jf
	jSZvyahomfU+jQm0wQMbo091HOfPQBsKPHPuD2g==
X-Google-Smtp-Source: AGHT+IE8QrCc26Q5VHRiKgg2cj7tbF2iPJOAPFAsbXJakKBSPK+XP9cjRfoklyulE62TV9SW0c2EGNVo4hQ8l8eP4sM=
X-Received: by 2002:a05:6902:110e:b0:dca:c369:fac2 with SMTP id
 o14-20020a056902110e00b00dcac369fac2mr3013394ybu.3.1713965614110; Wed, 24 Apr
 2024 06:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
 <CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com> <875xww3tv8.fsf@kernel.org>
In-Reply-To: <875xww3tv8.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 16:33:22 +0300
Message-ID: <CAA8EJpp32a9G19TnaO_-JtO3TAwi6VkwPq0mJkfxj2Gmw=xsYg@mail.gmail.com>
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990 devices
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Yongqin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 14:57, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Tue, 30 Jan 2024 at 08:47, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >
> >>
> >> The ath10k driver fails to properly handle fallback from board-2.bin to
> >> board.bin for WCN3990 cards. This happens because the
> >> ath10k_hw_params_list doesn't include .fw.board* parameters for the
> >> WCN3990 platform.
> >>
> >> Add board data configuration for WCN3990. While we are at it, merge
> >> common pieces of BDF support: drop .board and .eboard names from struct
> >> ath10k_hw_params_fw and use the common name instead.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >> Dmitry Baryshkov (3):
> >>       wifi: ath10k: populate board data for WCN3990
> >>       wifi: ath10k: drop chip-specific board data file name
> >>       wifi: ath10k: drop fw.eboard file name
> >>
> >>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
> >>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
> >>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
> >>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
> >>  4 files changed, 14 insertions(+), 45 deletions(-)
> >> ---
> >> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> >> change-id: 20240129-wcn3990-board-fw-a2d97507a712
> >
> > Kalle, Jeff, is there anything pending on me on this series?
>
> This is in my queue (Deferred state):
>
> https://patchwork.kernel.org/project/linux-wireless/list/?series=821157&state=*&order=date
>
> Unfortunately there is not really much time for ath10k nowadays so there
> will be delays.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Please excuse me, can we get at least patch 1? It fixes an actual
issue with WCN3990 which prevents us from testing board data files (or
adding new boards) without fixing board-2.bin first. The driver
ignores board.bin even if it is present on rootfs.

-- 
With best wishes
Dmitry

