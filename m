Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEC8508799
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 14:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378326AbiDTMDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 08:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343673AbiDTMDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 08:03:45 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B90234664
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 05:01:00 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id b7so1586547plh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4x/nniN9E8m90PRyLnC3qrpb7kQ+WEP5ChtBH2U8kMo=;
        b=NYeiRC2npjsNr6wW0oCHDEAk57Gr1EgLIjXIF7B2/IkPWxBQCCldrcvfye9l1Rs/QB
         xTzq4yDECNZR6F31YdPLiuauGJCPxcV8CXCODyn23WYkX4gNGOlV1sbQKVLcfTulCYrg
         GxsQiBryjYXK2Pk2zRdm5xy5hkvaDf4/hnFURCz0rGvVgqPXFrUcVQMG2hpHQII675dZ
         O4XbNdcoXtESEToGDpl2VizCqQ+olRZ15UZeTA5IXeKJQbbWyfdP+JIeluO3JRTVXu8F
         RVax/i8LmZ77GeUsaioHhzU/EvGyb40vbsFei3dzhllKAihllcump0Em2aFb5KWwih7x
         8nMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4x/nniN9E8m90PRyLnC3qrpb7kQ+WEP5ChtBH2U8kMo=;
        b=o6p7OfHs0bbdkNo7h+MsBF8K3YRm7A4px1qN/BAP8wNkfIGqTnoioPDuCw8rLu579m
         XEhNSdNINTdNuMSLgl84Tvwtpg66RwIRgXcMCG7oOqFbrbgat3NHn/4rNOfB+xQal7vD
         aiSC7UC5CeVvIjr7YjpL3Su9W3cBb/sYaDxZmBE2vlsqXDmRpkLlpwDz08fstJ7zQePa
         fXx3dIz0YWedFBQ2fImEdxhz6rUIae63S3DELTG8HYkesZoox1va+ZGymzRkIUswPMrG
         1yPUEkMwOv4pp/T6mBuvQZ3md0Q9orxozOeI4XNliK6d6l+acuMVcPxxATW1y8eyYLPG
         pdzA==
X-Gm-Message-State: AOAM5333v99GE06xc8c9brQTgGcsnYxm9RSYaJnJAcZKT0JikdIir50n
        GyaR6klXpNzg6BWyRHRVD2dlUbu51UyQjPdME9BzXw==
X-Google-Smtp-Source: ABdhPJzDAk+ptW68T/TwHLLdT+qVLohzJyd35bV7s8fKq9voji+ToXFJ/JYFGS5BENSO/fLBfptF2O+Ll8ewYtScQFM=
X-Received: by 2002:a17:90a:e7c7:b0:1d2:6ee8:63ed with SMTP id
 kb7-20020a17090ae7c700b001d26ee863edmr3969267pjb.209.1650456059505; Wed, 20
 Apr 2022 05:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220420102811.3157-1-slark_xiao@163.com>
In-Reply-To: <20220420102811.3157-1-slark_xiao@163.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 20 Apr 2022 14:00:23 +0200
Message-ID: <CAMZdPi9WJsz5nyzQB39q=Jhy8_q2=N8VAucYMUYKUf_faL5csQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: Add support for Cinterion MV32-WA/MV32-WB
To:     Slark Xiao <slark_xiao@163.com>
Cc:     mani@kernel.org, quic_hemantk@quicinc.com,
        gregkh@linuxfoundation.org, bbhatt@codeaurora.org,
        christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Slark,

On Wed, 20 Apr 2022 at 12:28, Slark Xiao <slark_xiao@163.com> wrote:
>
> MV32-WA is designed based on Qualcomm SDX62, and
> MV32-WB is designed based on QUalcomm SDX65. Both
> products' enumeration would align with previous
> product MV31-W.
> Add some new items for mv32 to separate it from
> mv31-w, in case we need to do any changes in
> future.

On the contrary, do not overly clone the structures, and re-use the
mv31 ones if they apply. You can rename them to mv3x if you really
want to.

Regards,
Loic



>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 41 ++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 541ced27d941..a2da40340df7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -406,6 +406,41 @@ static const struct mhi_pci_dev_info mhi_mv31_info = {
>         .mru_default = 32768,
>  };
>
> +static const struct mhi_channel_config mhi_mv32_channels[] = {
> +       MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
> +       MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> +       /* MBIM Control Channel */
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 64, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 64, 0),
> +       /* MBIM Data Channel */
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 512, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
> +};
> +
> +static struct mhi_event_config mhi_mv32_events[] = {
> +       MHI_EVENT_CONFIG_CTRL(0, 256),
> +       MHI_EVENT_CONFIG_DATA(1, 256),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101),
> +};
> +
> +static const struct mhi_controller_config modem_mv32_config = {
> +       .max_channels = 128,
> +       .timeout_ms = 20000,
> +       .num_channels = ARRAY_SIZE(mhi_mv32_channels),
> +       .ch_cfg = mhi_mv32_channels,
> +       .num_events = ARRAY_SIZE(mhi_mv32_events),
> +       .event_cfg = mhi_mv32_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_mv32_info = {
> +       .name = "cinterion-mv32",
> +       .config = &modem_mv32_config,
> +       .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width = 32,
> +       .mru_default = 32768,
> +};
> +
>  static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
>         MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
>         MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 256, 0),
> @@ -475,6 +510,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>         /* MV31-W (Cinterion) */
>         { PCI_DEVICE(0x1269, 0x00b3),
>                 .driver_data = (kernel_ulong_t) &mhi_mv31_info },
> +       /* MV32-WA (Cinterion) */
> +       { PCI_DEVICE(0x1269, 0x00ba),
> +               .driver_data = (kernel_ulong_t) &mhi_mv32_info },
> +       /* MV32-WB (Cinterion) */
> +       { PCI_DEVICE(0x1269, 0x00bb),
> +               .driver_data = (kernel_ulong_t) &mhi_mv32_info },
>         {  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> --
> 2.25.1
>
