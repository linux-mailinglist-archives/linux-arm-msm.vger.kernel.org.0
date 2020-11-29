Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC6B2C782C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Nov 2020 07:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgK2GGz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Nov 2020 01:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgK2GGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Nov 2020 01:06:55 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E1DC0613D1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:06:15 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id jx16so13740908ejb.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QH5AaLENJtnaVb0zakGwFRAJxR6ENRJ5wor2gNEi1WA=;
        b=XKnws3F/UYEV/6oLcu06/qaNXPqpi3KxhfKrP2qHWK8lJM35tOc6PztIQER6fPbes9
         RZVP4fmqf325TW4rO56DMa0tT8YOxmoCzwJlZ4BhlmXc4Le4raCWWXCMw/FuvhSrS+Wi
         /DaH8iD9CDFhWi+dIEljgHBpJK9EWtAmy6Ark=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QH5AaLENJtnaVb0zakGwFRAJxR6ENRJ5wor2gNEi1WA=;
        b=rkTDWVBUtnx/mBdaV2lsME+QUb4+3ugZoy537EHW6m5O72Gpq07QchYMXwlsF8NJSf
         iKBPkywNg7aPu6/ZjjqjDwKAiAz82kLNanPN60k4JMJmZR6xnnxINv73EBTh/7pqV803
         Y+2YzK63CEZhPcSLHXK3+uiTXXonYkQ4MAC2PxRZQDJS3hfzsSsnv+HzEAEDRiJY2u3t
         jllEWawrCUhhjcuVq9gY7ZRODbwbfEFG05oRADceKMY0QPuZt1C267LSs2N/vzTaMk73
         OS+bMqSCPYbrTl6MB4U70Bepitr429gFt/uMB15PERYIOicoiJpF/bF9koMpjq6p0oti
         Gf1Q==
X-Gm-Message-State: AOAM532u6JsTrK4/xPSY5aqQegXbKHFdf0cOOnq23e/jg5QCebpokxhw
        8Cl2QcnDE0rpVYUhJAFHdMr5N4u2Q1Ox0A==
X-Google-Smtp-Source: ABdhPJxH8i8WVljDAnSqqV6uHB9L1UF1z+IlHLGf2SKC4607mfSIkwioju54a4iw9JDlCUtcZC1g8Q==
X-Received: by 2002:a17:906:c006:: with SMTP id e6mr15269096ejz.374.1606629973615;
        Sat, 28 Nov 2020 22:06:13 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id k2sm6872165ejp.6.2020.11.28.22.06.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 22:06:12 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id s8so10592450wrw.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 22:06:12 -0800 (PST)
X-Received: by 2002:a5d:4388:: with SMTP id i8mr21310112wrq.262.1606629972421;
 Sat, 28 Nov 2020 22:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org> <20201111143755.24541-4-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-4-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sat, 28 Nov 2020 22:05:59 -0800
X-Gmail-Original-Message-ID: <CAMfZQbxwcnk7Nx8MfDfCThDzpWX2zoXOCdLk_mNcht7T4ZVROw@mail.gmail.com>
Message-ID: <CAMfZQbxwcnk7Nx8MfDfCThDzpWX2zoXOCdLk_mNcht7T4ZVROw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] venus: hfi_cmds: Allow null buffer address on
 encoder input
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Allow null buffer address for encoder input buffers. This will
> be used to send null input buffers to signal end-of-stream.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 4f7565834469..2affaa2ed70f 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -278,7 +278,7 @@ int pkt_session_etb_encoder(
>                 struct hfi_session_empty_buffer_uncompressed_plane0_pkt *pkt,
>                 void *cookie, struct hfi_frame_data *in_frame)
>  {
> -       if (!cookie || !in_frame->device_addr)
> +       if (!cookie)
>                 return -EINVAL;
>
>         pkt->shdr.hdr.size = sizeof(*pkt);
> --
> 2.17.1
>
Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
