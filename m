Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E28D25891D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 09:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgIAHcN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 03:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgIAHcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 03:32:12 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9E1C061246
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 00:32:12 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mw10so194785pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7c8FWHabhNiA3wbCJBExE1cm7AjheLEh6XznHaWmc4E=;
        b=R/N6oSU+eal314kD3fWO6djHTfaPEATfyxlCCCU4c7McGN2WDgMEPHnURJDKXCNs7O
         +jn9s1fzze39k6OboAs9nfqpGB+YzHzHutVWc6iKIBbwuF0nM1T+KkqZKQRJrhUe4+4b
         TiE/7mGv5J6hIuc/YmXgrqHWfDElxuztPilVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7c8FWHabhNiA3wbCJBExE1cm7AjheLEh6XznHaWmc4E=;
        b=Gkzgb8vO2hwjk+LrdvT/mt545puzuFNGsLW5hvy9bR4rh0WwOrx2JyRX7aH7Sa612w
         78vGvuH+PAFnujVYocVpBhQIQHBpj2OVnhHKcT3NIC5lR8LuZ1Vj/xc/t5YUMtx0nES5
         8caO8+e5+bNdZs0m9yrmKwCSLLM+SFfkxrgBQarxTIViZX4Qvuh6UbpYj23SaLIP/h/1
         vDXQi6TP4H3k0VQVpJaF4/Wbc4G1JAjLYOX2dmbZx/2X1Nl9gR8lfXqaTMsnyu8UazUj
         oWLeF915LyamBns8WeoUWLOhZJ/AzM0izorkXTZZ0jx7E3ydtHtdt/f9qB67wt7pWl1c
         9hVw==
X-Gm-Message-State: AOAM532lGHtQaDchQ20HYRBUwPAXO1sQYdGZQIpewZKYRnuBFW4I3zjU
        OFuHiApu+1AU6zROjV1FimEhJg==
X-Google-Smtp-Source: ABdhPJxRSerQ9wQoir2LSEhPgWfjzSr+4YbUaBQJByGGsoMetPbz0tzh/DADiqm589TbU5OdIhh8TA==
X-Received: by 2002:a17:90a:e609:: with SMTP id j9mr313486pjy.129.1598945531556;
        Tue, 01 Sep 2020 00:32:11 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id i7sm910801pgh.58.2020.09.01.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 00:32:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1598855964-1042-5-git-send-email-srivasam@codeaurora.org>
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org> <1598855964-1042-5-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 4/5] ASoC: qcom: Add support for audio over DP
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Date:   Tue, 01 Sep 2020 00:32:09 -0700
Message-ID: <159894552988.334488.8290895362888910651@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2020-08-30 23:39:23)
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 167bf2c..cea7ae7 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -190,15 +232,92 @@ static struct lpass_variant sc7180_data =3D {
>                                    "mi2s-bit-clk0",
>                                    "mi2s-bit-clk1",
>                                 },
> +       .id                             =3D I2S_INTERFACE,
>         .init                   =3D sc7180_lpass_init,
>         .exit                   =3D sc7180_lpass_exit,
>         .alloc_dma_channel      =3D sc7180_lpass_alloc_dma_channel,
>         .free_dma_channel       =3D sc7180_lpass_free_dma_channel,
>  };
> =20
> +static struct lpass_variant sc7180_hdmi_data =3D {

Can this be const?

> +       .hdmi_tx_ctl_addr       =3D 0x1000,
> +       .hdmi_legacy_addr       =3D 0x1008,
> +       .hdmi_vbit_addr         =3D 0x610c0,
> +       .hdmi_ch_lsb_addr       =3D 0x61048,
> +       .hdmi_ch_msb_addr       =3D 0x6104c,
> +       .ch_stride              =3D 0x8,
> +       .hdmi_parity_addr       =3D 0x61034,
> +       .hdmi_dmactl_addr       =3D 0x61038,
> +       .hdmi_dma_stride        =3D 0x4,
> +       .hdmi_DP_addr           =3D 0x610c8,
> +       .hdmi_sstream_addr      =3D 0x6101c,
> +       .irq_reg_base           =3D 0x63000,
> +       .irq_ports              =3D 1,
> +       .rdma_reg_base          =3D 0x64000,
> +       .rdma_reg_stride        =3D 0x1000,
> +       .rdma_channels          =3D 4,
> +
> +       .rdma_dyncclk           =3D REG_FIELD_ID(0x64000, 14, 14, 4, 0x10=
00),
> +       .rdma_bursten           =3D REG_FIELD_ID(0x64000, 13, 13, 4, 0x10=
00),
> +       .rdma_burst8            =3D REG_FIELD_ID(0x64000, 15, 15, 4, 0x10=
00),
> +       .rdma_burst16           =3D REG_FIELD_ID(0x64000, 16, 16, 4, 0x10=
00),
> +       .rdma_dynburst          =3D REG_FIELD_ID(0x64000, 18, 18, 4, 0x10=
00),
> +       .rdma_wpscnt            =3D REG_FIELD_ID(0x64000, 10, 12, 4, 0x10=
00),
> +       .rdma_fifowm            =3D REG_FIELD_ID(0x64000, 1, 5, 4, 0x1000=
),
> +       .rdma_enable            =3D REG_FIELD_ID(0x64000, 0, 0, 4, 0x1000=
),
> +
> +       .sstream_en             =3D REG_FIELD(0x6101c, 0, 0),
> +       .dma_sel                        =3D REG_FIELD(0x6101c, 1, 2),
> +       .auto_bbit_en   =3D REG_FIELD(0x6101c, 3, 3),
> +       .layout                 =3D REG_FIELD(0x6101c, 4, 4),
> +       .layout_sp              =3D REG_FIELD(0x6101c, 5, 8),
> +       .set_sp_on_en   =3D REG_FIELD(0x6101c, 10, 10),
> +       .dp_audio               =3D REG_FIELD(0x6101c, 11, 11),
> +       .dp_staffing_en =3D REG_FIELD(0x6101c, 12, 12),
> +       .dp_sp_b_hw_en  =3D REG_FIELD(0x6101c, 13, 13),
> +
> +       .mute                   =3D REG_FIELD(0x610c8, 0, 0),
> +       .as_sdp_cc              =3D REG_FIELD(0x610c8, 1, 3),
> +       .as_sdp_ct              =3D REG_FIELD(0x610c8, 4, 7),
> +       .aif_db4                        =3D REG_FIELD(0x610c8, 8, 15),
> +       .frequency              =3D REG_FIELD(0x610c8, 16, 21),
> +       .mst_index              =3D REG_FIELD(0x610c8, 28, 29),
> +       .dptx_index             =3D REG_FIELD(0x610c8, 30, 31),
> +
> +       .soft_reset             =3D REG_FIELD(0x1000, 31, 31),
> +       .force_reset    =3D REG_FIELD(0x1000, 30, 30),
> +
> +       .use_hw_chs             =3D REG_FIELD(0x61038, 0, 0),
> +       .use_hw_usr             =3D REG_FIELD(0x61038, 1, 1),
> +       .hw_chs_sel             =3D REG_FIELD(0x61038, 2, 4),
> +       .hw_usr_sel             =3D REG_FIELD(0x61038, 5, 6),
> +
> +       .replace_vbit   =3D REG_FIELD(0x610c0, 0, 0),
> +       .vbit_stream    =3D REG_FIELD(0x610c0, 1, 1),
> +
> +       .legacy_en              =3D  REG_FIELD(0x1008, 0, 0),
> +       .calc_en                =3D  REG_FIELD(0x61034, 0, 0),
> +       .lsb_bits               =3D  REG_FIELD(0x61048, 0, 31),
> +       .msb_bits               =3D  REG_FIELD(0x6104c, 0, 31),
> +
> +       .clk_name               =3D (const char*[]) {
> +                                       "pcnoc-sway-clk",
> +                                       "audio-core",
> +                                       "pcnoc-mport-clk",
> +                               },
> +       .num_clks               =3D 3,
> +       .id                     =3D HDMI_INTERFACE,
> +       .dai_driver             =3D sc7180_lpass_cpu_hdmi_dai_driver,
> +       .num_dai                =3D ARRAY_SIZE(sc7180_lpass_cpu_hdmi_dai_=
driver),
> +       .init                   =3D sc7180_lpass_init,
> +       .exit                   =3D sc7180_lpass_exit,
> +       .alloc_dma_channel =3D sc7180_lpass_alloc_hdmi_dma_channel,
> +       .free_dma_channel =3D sc7180_lpass_free_hdmi_dma_channel,
> +
> +};

Add a newline here?

>  static const struct of_device_id sc7180_lpass_cpu_device_id[] =3D {
>         {.compatible =3D "qcom,sc7180-lpass-cpu", .data =3D &sc7180_data},
> -       {}
> +       {.compatible =3D "qcom,sc7180-lpass-hdmi", .data =3D &sc7180_hdmi=
_data}

This most likely needs to keep the sentinel around so that a match can
be made or stop if nothing is found.

>  };
>
