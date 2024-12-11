Return-Path: <linux-arm-msm+bounces-41583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9197C9EDA39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 298CD166974
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1951F4E24;
	Wed, 11 Dec 2024 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fGw0QeOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080931F237C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733956496; cv=none; b=liqjA2D8A+OanOzCgTZiVc7oR/VXpBP/3rxsQzXyFcJ9Krp5LPlWaj7bk6yqywj72+Dvb13BH24eIdizqy0AR4yoAJ95mEC2CYee2kPpEwasVW2arzjWXpp3GHRWRiAmaAU/zv9QfXjmXdUK/A1ZltPTMaqSGAeeVvibsx4Ipnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733956496; c=relaxed/simple;
	bh=tDf4ejwfEGIsqo0gECgqbJNHrXI26Cw2gJA0n3bcwhE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHOo7JU1twftYiJ/8hvzgHXUd9dKbTt40GzNAxFUhab3vMf3Ajb+KYafHogo0vK5URj582wP1PkBv5Kh1vd/lFkByichTPEp6ip3W15CrijdOnsF8/9ekPtcsxlOfMYMfiFNGb4FRaGXvTJa1ZJqfQHf1dk2GlF7oEAZTtUJVlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fGw0QeOQ; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d900c27af7so47904376d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733956493; x=1734561293; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk9mjVxKh0Cpv8VTlttHozyBPYsnqFLG9k7nQi8tKJA=;
        b=fGw0QeOQVU7VJTzKmZvZqdm9GA2U9ba5DisWL0rmigRG6FhOOpPEO9mDaGDEPmsct0
         Hdn83XICMJmzHpfS8ezDyM7w3Jz1TxwoIwu9soDlfMRZhVKDw5NDWR7IPkhwswF8ckLg
         szBiJH3g7MChELUg9TDg1XIKTYZy8OOP0TWVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733956493; x=1734561293;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk9mjVxKh0Cpv8VTlttHozyBPYsnqFLG9k7nQi8tKJA=;
        b=kAaCG2TDqT8nEpAH9tlkU2+xs8jOQtZCJcqAS8Aq/k/3g6Ds6vYPYvVSvRd958FQg8
         IMQezzYFymSTUddk02/b6FPbdyPSpnuSd42sZwwwQ/Uvb43bgEI+flHrqHn1hBvWqA9Q
         h129L9bVnbqf0Z2vEnfdl+d+4SavbgaOVpTq/aHpKbUYamu71cli5feT4653iPCEBDKk
         8PPBRIm46HoSCMDP7S6IT/OqqpKZhlOkLpjilxo2vipm11t39tDhl6ztLjF+2TzwTeOA
         Wxl79fvRyK1mfNtg7NEVw+oBGD9TcshlDlA8R5BUxQEgItNV5utNBSZ7Fv8zXkldDDNW
         0NRw==
X-Forwarded-Encrypted: i=1; AJvYcCV+e3obhaADZxARfBgw182/d1yNjph9jwYOggwyo//klclqWWlBLf4mrJN4EBfJluqgchgTG9ifnVnQOLCW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnh5W23G5wNeskJwWv+0n2YCNkAQplIaDziktV9vg/CifeQOkX
	pDwXWc6901RhHNkqqSA1NlfDL8nE0KtjZGvaHkkG7KVYWdiTqk2KELENKvNgY2J8BdTYGrJI5pa
	0F9Ugi/m08Xsk5kt+sMO17qtmX6KwSM0//o/M
X-Gm-Gg: ASbGnctwhNLiU8mxBRF4EJ+qMQCzPgqw71O5XLHJ2ns3M++e52EOpVMe7vTGI2KCxKq
	Lf9YOJeS7xRP7yAKTkKwmvfFvKwPtnvJ8d9vAd72Oh483PxMnQqqOan+J0gUKQ4M=
X-Google-Smtp-Source: AGHT+IEmNl1A02u+Et+QaYelQl7de4pzHAlegixn/lag8TVHIDn3QbqOGZ1uvtk5TAuOj8J/cuxjMvpZP+M69zQwnG4=
X-Received: by 2002:a05:6214:d83:b0:6d8:9c50:52be with SMTP id
 6a1803df08f44-6dae39a1d71mr15934046d6.44.1733956493056; Wed, 11 Dec 2024
 14:34:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:34:52 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-9-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-9-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:34:52 -0800
Message-ID: <CAE-0n50Ei+DodV6VRmm_aSEZ_DdeMZ_vMnK7Mq0=X441B+YreQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:39)
> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> to program audio packet data. Use 0 as Packet ID, as it was not
> programmed earlier.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 5cbb11986460d1e4ed1890bdf66d0913e013083c..1aa52d5cc08684a49102e45ed6e40ac2b13497c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
[...]
> +               .HB0 = 0x00,
> +               .HB1 = 0x06,
> +               .HB2 = 0x0f,
> +               .HB3 = 0x00,
> +       };
> +       u32 header[2];
> +       u32 reg;
> +
> +       /* XXX: is it necessary to preserve this field? */

Maybe qcom can comment.

> +       reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
> +       sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
> +
> +       msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> +

