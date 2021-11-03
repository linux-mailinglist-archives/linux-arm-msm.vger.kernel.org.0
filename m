Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028CD44465F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 17:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbhKCRAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 13:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbhKCRAL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 13:00:11 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB39C061208
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 09:57:34 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id gt5so1699877pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 09:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IBSuB2sX7yC2N+skcd1kW4OtMhtED2f+hVFLuKO9FNc=;
        b=wTNdA3Oz63ouFKMX/zm8/Y+znNyrUzRhG2N2tsdnBznIJC7x5jkh5uMDkh4O3Hx8R+
         xkPc16Fw0goWAMKBCB4oDaRs+g0w2P+XUtYxRc/62cFMhInyDMUInR/8Qe+kp2VcTqrt
         J4pd/n5UKfiPNzZ0M0ZGQgirk/w56WXw3BQsOTt8buZp8UBAeP5zoKOeXahykr5KZdxP
         VBJ3q+FCrhu3i56doXt3CgNFCH2jEbeZB4MUe36rUeXsK1tMD5bsOVnRbV3LhEeG8nT8
         pGZK91HbDI1J/NyHRq+bHmKS5nQo5nytN5BQaHsKTkSuPUn9hbNuF54JevIVPuxX8CYu
         okcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IBSuB2sX7yC2N+skcd1kW4OtMhtED2f+hVFLuKO9FNc=;
        b=H4prbgtduMOysBTGJtUvhrzZ4mEsXV/I7xJWyQ0xhFXpYTTug60UNe/hYdCoDFsBtQ
         pq3bejafz5v/IaxdtKT2unhcuo/ggHSbDdfPCX54U6qiIRFFIXakwcdjn0WaF1kS8cZh
         KIBLqqMFCknJ95MhftNDvdg0fLmnHI5KeNg2HiADhDcoe4I7cqUse/W+7JCesBOpNEps
         A3DfTxvEB+iHc8ow6K0QnZ2WGX86WVCoqdB0Abm6Mde1t1QzIw+nk3IVP0gld1QOcy4/
         zLTG4ZEILoRJvpcZSoQuw5zlVZPua6ldQj/9oSLx/sRIVqeBmkSaRhPIv7CWRTLr0x+y
         nA+A==
X-Gm-Message-State: AOAM53324x1IdyNQJ4V8rVMPZt4WTsHF+SnUG+jQntq9205H+ESYuU31
        Wtpq3kTX/kZGZtxMxP01DO69H1OTED0ESJSQCnBeCg==
X-Google-Smtp-Source: ABdhPJzUnQk5Cmt2i6mzswb2rLjgrcIQaBoi2fOvdvX9lCslbk7TLUjrnsn0nSemd+HWgru1iz0235PqX2K8UC/UTbI=
X-Received: by 2002:a17:90a:1190:: with SMTP id e16mr15889288pja.209.1635958653600;
 Wed, 03 Nov 2021 09:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211103155543.1037604-1-benl@squareup.com> <20211103155543.1037604-3-benl@squareup.com>
In-Reply-To: <20211103155543.1037604-3-benl@squareup.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 3 Nov 2021 18:08:15 +0100
Message-ID: <CAMZdPi8c1aJCCL8b6iYSz1Ev46jK15Fpa9pG-2FGhrT3FR2RMA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] wcn36xx: fix RX BD rate mapping for 5GHz legacy rates
To:     Benjamin Li <benl@squareup.com>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ben,

On Wed, 3 Nov 2021 at 16:56, Benjamin Li <benl@squareup.com> wrote:
>
> The linear mapping between the BD rate field and the driver's 5GHz
> legacy rates table (wcn_5ghz_rates) does not only apply for the latter
> four rates -- it applies to all eight rates.
>
> Fixes: 6ea131acea98 ("wcn36xx: Fix warning due to bad rate_idx")
> Signed-off-by: Benjamin Li <benl@squareup.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/txrx.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/txrx.c b/drivers/net/wireless/ath/wcn36xx/txrx.c
> index f0a9f069a92a9..fce3a6a98f596 100644
> --- a/drivers/net/wireless/ath/wcn36xx/txrx.c
> +++ b/drivers/net/wireless/ath/wcn36xx/txrx.c
> @@ -272,7 +272,6 @@ int wcn36xx_rx_skb(struct wcn36xx *wcn, struct sk_buff *skb)
>         const struct wcn36xx_rate *rate;
>         struct ieee80211_hdr *hdr;
>         struct wcn36xx_rx_bd *bd;
> -       struct ieee80211_supported_band *sband;
>         u16 fc, sn;
>
>         /*
> @@ -350,12 +349,10 @@ int wcn36xx_rx_skb(struct wcn36xx *wcn, struct sk_buff *skb)
>                 status.enc_flags = rate->encoding_flags;
>                 status.bw = rate->bw;
>                 status.rate_idx = rate->mcs_or_legacy_index;
> -               sband = wcn->hw->wiphy->bands[status.band];
>                 status.nss = 1;
>
>                 if (status.band == NL80211_BAND_5GHZ &&
> -                   status.encoding == RX_ENC_LEGACY &&
> -                   status.rate_idx >= sband->n_bitrates) {


It looks fine, but can you replace it with a 'status.rate_idx  >= 4'.
I get sporadic 5Ghz frames reported with rate_idx=0 (firmware miss?),
leading to warnings because status.rate_idx is -4(unsigned) in that
case. So better to report a wrong rate than a corrupted one.

>
> +                   status.encoding == RX_ENC_LEGACY) {
>                         /* no dsss rates in 5Ghz rates table */
>                         status.rate_idx -= 4;
>                 }
> --


Regards,
Loic
