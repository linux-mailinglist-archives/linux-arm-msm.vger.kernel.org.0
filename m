Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F734B5FDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 02:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbiBOBMS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 20:12:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbiBOBMS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 20:12:18 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55644DEC7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 17:12:09 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id u47-20020a4a9732000000b00316d0257de0so21426743ooi.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 17:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2z0HLBtdwl7RuykFNoLcrOpeQoN2RrPQlxsn50U+srI=;
        b=Q85Iy1x0nXlLnvvWd0qW9X3s9tgMAJ7AnlBSq3D89DE5VcsaJ25zy163dK52rAgG+C
         G1Rp6kBsRRKD5HB17M3DH8DPVV2g7hkKKTDgG9GLsFrH4GEKh57ytrF0L8TgjrWgWNpx
         beKuRv5pUE2ndVw+oZhC8NrzutWuu1E2niMDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2z0HLBtdwl7RuykFNoLcrOpeQoN2RrPQlxsn50U+srI=;
        b=jxysgRfJD0JEsumCPEV81HRsA7Ss9ALcx16lG2mA/p8GYhnEk/AEfc1IsEqiuP2X/3
         +HOm+vXjHbefKoz7jf+zuwBN1M0k9l9v+seNUgLaX1j60DlDYeYa0m1CsnRyp2y2foNE
         IYijog8Q1DXG4509JbwaJlIsvJR5I0hWqWnxrzAXakkOMO/2ghsRB6dudQIMnbMDXHoN
         sxXVqy/RnPtbuOgdQOlCmZuMsIA44yAJYgOuftwKcHaeQpqLMnXpDU3rMH5cLyLP2AU1
         T4sfQb83w09D5XsdiMx28cANS0vftkkLJC2tUU+aiuGjY+ajlCR2skT/4LjnQZUsxBSu
         1wxw==
X-Gm-Message-State: AOAM532ci8gf8t/RkaXXIlP6OO/F3RDIU0/NGWeivKKTn9ZjfmyQ/pfl
        1CCm5ZGIDYa20JEqKW0VKcC/TvM7dSrpA6sjArzPog==
X-Google-Smtp-Source: ABdhPJzqr0qj+6PGWqY06otbFxJxLPzm/naHHRbTzZGQw8jz3YGa4aV1SMC/JucpyLkPPx1hqwG9ibRXSdkd51IAglA=
X-Received: by 2002:a05:6870:d413:: with SMTP id i19mr598159oag.54.1644887528729;
 Mon, 14 Feb 2022 17:12:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Feb 2022 17:12:08 -0800
MIME-Version: 1.0
In-Reply-To: <1644850708-11099-6-git-send-email-quic_srivasam@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com> <1644850708-11099-6-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 14 Feb 2022 17:12:08 -0800
Message-ID: <CAE-0n53iKwT8u=d2KG5KX8fJgFs1JhTnaGCfG=OLarhvLdmf3Q@mail.gmail.com>
Subject: Re: [RESEND v13 05/10] ASoC: qcom: Add register definition for codec
 rddma and wrdma
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:23)
> This patch adds register definitions for codec read dma and write dma

 git grep "This patch" -- Documentation/process/

> lpass interface.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 7cc3763..e059c4a 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -39,6 +39,29 @@
>                         return -EINVAL;         \
>         } while (0)
>
> +static inline bool is_cdc_dma_port(int dai_id)
> +{
> +       switch (dai_id) {
> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +               return true;
> +       default:

Drop case

> +               return false;
> +       }

return false;

would be shorter.

> +}
> +
> +static inline bool is_rxtx_cdc_dma_port(int dai_id)
> +{
> +       switch (dai_id) {
> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +               return true;
> +       default:
> +               return false;
> +       }

Same.

> +}
> +
>  struct lpaif_i2sctl {
>         struct regmap_field *loopback;
>         struct regmap_field *spken;
