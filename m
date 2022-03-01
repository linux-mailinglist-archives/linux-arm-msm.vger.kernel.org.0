Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B24C14C8024
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 02:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbiCABLI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 20:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbiCABLH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 20:11:07 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72155F54
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 17:10:27 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id p15so28352306ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 17:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BbqDwcjXsXCL6kTMj0YCp6PGwzr/251RPmtgzCoFEyg=;
        b=Ik+NVh3CPD8GsoJYQqmUUGgp15DF5ACPGNAA3aEa+OtKST1rLe5gBLLmayjH3liIyT
         zYsDmk39c7rHmGbFKJ4PImoNKy5RX5cy1kfe2mXgGT1zSW4ymL3cmNbnY7EaK9CpzaUe
         bj+bd/arywMdD8u8U+Xuwf26B5pjNxrE1+n/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BbqDwcjXsXCL6kTMj0YCp6PGwzr/251RPmtgzCoFEyg=;
        b=Mcwp0cV0JgwyJHAezmXU0vTvXSPO/3/3DbYxxp/xE2tlLHTdVstZew4td7G1ul4H8q
         j37/OTBa3DYZPy90yI6jhaJGItfPLmOWupdV9uJXT6d5kwinyQSnJmWMA4eTXNklHgQh
         I1RiJOxwWnIoq22mBIDtRGztfHLKaSRhR7qV/dm0rx/DLTq00qHEUddu5Q7iwEPmBu9V
         Ia9XlpXqCV0V9SJOvZR5YgNO6q8ZZ4Sy/vtcZuAz+/ABii0cw8CKdrAeT+LEm6sILq5Q
         9zlKPldLFnFyi3c1hqKeO1oIy+my8xMyGAPoU6jk1WC88jCp1lPi9Oas4Qp+3YcwNFEI
         B72g==
X-Gm-Message-State: AOAM532TLgrrvJ5mySPlDWfRGGZqtsmGYUGQQwVCcIp/6Im0UAvmj8C7
        yiIwegPM3G7DPXkukZcxvodglVrFOSxs9v1Q
X-Google-Smtp-Source: ABdhPJzC12e9FSnFxKx2JeugPLkdSvAapmatBVr+kq4YmjzHHgLB5yD0cW8dsva5yCbaJHBDpNI2cQ==
X-Received: by 2002:a17:906:199a:b0:6d1:aa59:2927 with SMTP id g26-20020a170906199a00b006d1aa592927mr16579554ejd.215.1646097025991;
        Mon, 28 Feb 2022 17:10:25 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id w19-20020a17090633d300b006ce3d425b22sm4816672eja.1.2022.02.28.17.10.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 17:10:25 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ay10so199755wrb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 17:10:24 -0800 (PST)
X-Received: by 2002:a5d:62cb:0:b0:1ef:5d3f:7b56 with SMTP id
 o11-20020a5d62cb000000b001ef5d3f7b56mr14343243wrv.513.1646097024460; Mon, 28
 Feb 2022 17:10:24 -0800 (PST)
MIME-Version: 1.0
References: <1644591438-6514-1-git-send-email-quic_srivasam@quicinc.com> <1644591438-6514-3-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1644591438-6514-3-git-send-email-quic_srivasam@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Feb 2022 17:10:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xm7UVXX9NQfKs+BymsZpG+aoYqvXXRL5WhJjEZRqi7ug@mail.gmail.com>
Message-ID: <CAD=FV=Xm7UVXX9NQfKs+BymsZpG+aoYqvXXRL5WhJjEZRqi7ug@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: sc7280: Add lpass cpu node
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Feb 11, 2022 at 6:57 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
>
> @@ -1750,6 +1751,64 @@
>                         #clock-cells = <1>;
>                 };
>
> +               lpass_cpu: audio-subsystem@3260000 {
> +                       compatible = "qcom,sc7280-lpass-cpu";
> +                       reg = <0 0x3260000 0 0xC000>,
> +                             <0 0x3280000 0 0x29000>,
> +                             <0 0x3340000 0 0x29000>,
> +                             <0 0x336C000 0 0x3000>,
> +                             <0 0x3987000 0 0x68000>,
> +                             <0 0x3B00000 0 0x29000>;

Lower case hex, please. ...and pad the address to 8 digits here (just
don't do it in the unit address in the node name).


> +                       reg-names = "lpass-rxtx-cdc-dma-lpm",
> +                                   "lpass-rxtx-lpaif",
> +                                   "lpass-va-lpaif",
> +                                   "lpass-va-cdc-dma-lpm",
> +                                   "lpass-hdmiif",
> +                                   "lpass-lpaif";

The order of "reg" and "reg-names" needs to match the bindings
exactly. It's almost certainly easier to change your device tree since
the bindings have already landed.

That means that "lpass-hdmiif" will be first. ...and it will also
change your node name since the first "reg" listed will now be
3987000.


> +                       iommus = <&apps_smmu 0x1820 0>,
> +                                <&apps_smmu 0x1821 0>,
> +                                <&apps_smmu 0x1832 0>;
> +                       status = "disabled";
> +
> +                       power-domains = <&rpmhpd SC7280_LCX>;
> +                       power-domain-names = "lcx";

power-domain-names is not in the bindings.


> +                       required-opps = <&rpmhpd_opp_nom>;
> +
> +                       clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
> +                                <&lpasscore LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
> +                                <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
> +                                <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
> +                                <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
> +                                <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
> +                                <&lpasscore LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
> +                                <&lpasscore LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
> +                                <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
> +                       clock-names = "aon_cc_audio_hm_h",
> +                                     "core_cc_sysnoc_mport_core",
> +                                     "audio_cc_codec_mem",
> +                                     "audio_cc_codec_mem0",
> +                                     "audio_cc_codec_mem1",
> +                                     "audio_cc_codec_mem2",
> +                                     "core_cc_ext_if0_ibit",
> +                                     "core_cc_ext_if1_ibit",
> +                                     "aon_cc_va_mem0";

Clocks do not match bindings.


> +                       #sound-dai-cells = <1>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       interrupt-names = "lpass-irq-lpaif",
> +                                         "lpass-irq-vaif",
> +                                         "lpass-irq-rxtxif",
> +                                         "lpass-irq-hdmi";

interrupt-names ordering does not match bindings.


-Doug
