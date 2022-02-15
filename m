Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD184B5FC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 02:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbiBOBFu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 20:05:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiBOBFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 20:05:49 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CCDB82DA
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 17:05:41 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id v6-20020a05683024a600b005ac1754342fso9111318ots.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 17:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=RgimEFXarng+CHJGO74owebgIrlsqSjainYTmRZCU0k=;
        b=S/NpqL9/qAIdkV/WGVMxj+X9fr42dFGU/nVFDcntxJriCJu2R236PSnfzJLMvfHkJQ
         GHesSnaYC1+XSqwVlvff8Xz1DyEr6bh2eNgKCL3hSPPuKOArzF4kLlt+gO8CtqrtGfAc
         3gMh4sbT3GZIwl/oth65y3m2W+4cnY0z7jiOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=RgimEFXarng+CHJGO74owebgIrlsqSjainYTmRZCU0k=;
        b=6H7ctDbTYjxxCHkO2zxZ1vh5C8tGHiQX0I8Wx4xKt2fqutKQR5MHuzsBCuZUjCDBLv
         sH/9+TOxidXNZHHlj4HCF+QnE3et2ku7af76Xz2kLW0jt/7yHdKt1TAG/zkNlr9gy0ef
         vmNtpgKEEYGhFDzLiYgh3go+CeZ2lBTHWxmMlpX3SqOfajTYsFTJe8b4zZyX66fvwVDh
         r3pOEp7/HTjCeHHxjG2vQLpL1fDibOhyyapdrGHD7+iVK5tu4OQST3KUnIcQLO4U9biE
         yRT9vCqijxkkFbTYcV+kUXn+gf//JI8LKb0Iapv5kwqWfp4ZOxUESAyZ4dRzn7C4UB1X
         FcSA==
X-Gm-Message-State: AOAM530Hq7vs+QSLEOKqqqT+PXBqpwshey1agOT5fs07lbsEvGN3dQj9
        Z91nKq+kxh762zTKcTYyhYDCGpA+MOkfOFe9OEI59A==
X-Google-Smtp-Source: ABdhPJxWDJ5gPlokWpJThKiJIS8Wv5ZL9BFOQR+6R8559UBoAOYOBJZXG6u3ikHTU/ctiT8pWDQh6Rj/RgnLjyYnxGk=
X-Received: by 2002:a05:6830:1d8f:: with SMTP id y15mr585565oti.77.1644887140462;
 Mon, 14 Feb 2022 17:05:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Feb 2022 17:05:40 -0800
MIME-Version: 1.0
In-Reply-To: <1644850708-11099-4-git-send-email-quic_srivasam@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com> <1644850708-11099-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 14 Feb 2022 17:05:39 -0800
Message-ID: <CAE-0n53dXfwsJ=mh7cNH6Lq0Um+h+oTJDvqsXALh8L=wfONLjw@mail.gmail.com>
Subject: Re: [RESEND v13 03/10] ASoC: qcom: lpass: Add dma fields for codec
 dma lpass interface
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:21)
> Add lpass interface memebers to support audio path over codec dma.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/lpass.h | 116 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index f0d21cd..7cc3763 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -234,12 +294,66 @@ struct lpass_variant {
>         struct reg_field wrdma_enable;
>         struct reg_field wrdma_dyncclk;
>
> +       /*CDC RXTX RD_DMA */

Please add space after /*

> +       struct reg_field rxtx_rdma_intf;
> +       struct reg_field rxtx_rdma_bursten;
> +       struct reg_field rxtx_rdma_wpscnt;
> +       struct reg_field rxtx_rdma_fifowm;
> +       struct reg_field rxtx_rdma_enable;
> +       struct reg_field rxtx_rdma_dyncclk;
> +       struct reg_field rxtx_rdma_burst8;
> +       struct reg_field rxtx_rdma_burst16;
> +       struct reg_field rxtx_rdma_dynburst;
> +       struct reg_field rxtx_rdma_codec_enable;
> +       struct reg_field rxtx_rdma_codec_pack;
> +       struct reg_field rxtx_rdma_codec_intf;
> +       struct reg_field rxtx_rdma_codec_fs_sel;
> +       struct reg_field rxtx_rdma_codec_ch;
> +       struct reg_field rxtx_rdma_codec_fs_delay;
> +
> +       /*CDC RXTX WR_DMA */

Same

> +       struct reg_field rxtx_wrdma_intf;
> +       struct reg_field rxtx_wrdma_bursten;
> +       struct reg_field rxtx_wrdma_wpscnt;
> +       struct reg_field rxtx_wrdma_fifowm;
> +       struct reg_field rxtx_wrdma_enable;
> +       struct reg_field rxtx_wrdma_dyncclk;
> +       struct reg_field rxtx_wrdma_burst8;
> +       struct reg_field rxtx_wrdma_burst16;
> +       struct reg_field rxtx_wrdma_dynburst;
> +       struct reg_field rxtx_wrdma_codec_enable;
> +       struct reg_field rxtx_wrdma_codec_pack;
> +       struct reg_field rxtx_wrdma_codec_intf;
> +       struct reg_field rxtx_wrdma_codec_fs_sel;
> +       struct reg_field rxtx_wrdma_codec_ch;
> +       struct reg_field rxtx_wrdma_codec_fs_delay;
> +
> +       /*CDC VA WR_DMA */
> +       struct reg_field va_wrdma_intf;
> +       struct reg_field va_wrdma_bursten;
> +       struct reg_field va_wrdma_wpscnt;
> +       struct reg_field va_wrdma_fifowm;
> +       struct reg_field va_wrdma_enable;
> +       struct reg_field va_wrdma_dyncclk;
> +       struct reg_field va_wrdma_burst8;
> +       struct reg_field va_wrdma_burst16;
> +       struct reg_field va_wrdma_dynburst;
> +       struct reg_field va_wrdma_codec_enable;
> +       struct reg_field va_wrdma_codec_pack;
> +       struct reg_field va_wrdma_codec_intf;
> +       struct reg_field va_wrdma_codec_fs_sel;
> +       struct reg_field va_wrdma_codec_ch;
> +       struct reg_field va_wrdma_codec_fs_delay;
> +
>         /**

This shouldn't have two stars as it isn't kerneldoc

>          * on SOCs like APQ8016 the channel control bits start
>          * at different offset to ipq806x
>          **/
>         u32     dmactl_audif_start;
>         u32     wrdma_channel_start;
> +       u32     rxtx_wrdma_channel_start;
> +       u32     va_wrdma_channel_start;
> +
>         /* SOC specific initialization like clocks */
>         int (*init)(struct platform_device *pdev);
>         int (*exit)(struct platform_device *pdev);
> @@ -251,10 +365,12 @@ struct lpass_variant {
>         int num_dai;
>         const char * const *dai_osr_clk_names;
>         const char * const *dai_bit_clk_names;
> +       const char * const *cdc_dma_clk_names;
>
>         /* SOC specific clocks configuration */
>         const char **clk_name;
>         int num_clks;
> +       int cdc_dma_num_clks;

Why not size_t? Negative numbers are useful here?
