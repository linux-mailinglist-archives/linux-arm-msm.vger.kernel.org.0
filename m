Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDA452D9B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 18:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241646AbiESQEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 12:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236199AbiESQEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 12:04:23 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BA54DF63
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 09:04:21 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ds11so5763581pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zg+ynRXLZeMnK1oxqyeYVjcC5/X4aWhcXC6yBD5OT4A=;
        b=JqngR68puIkzlfBafI5k1wJZPvRZLdo970iM1/sHRkJapZDCKpCkU0bRTyqldOD2KA
         1ZV0XBzywrjm6qyCzUUN2gge2PdeBNmhfqHpeSnuuDb/TmzoAUwZhNT/oDH5hKvHckiG
         CvqVPWCajw2s1CqDgtrug4r5cEza1q7Ar7kSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zg+ynRXLZeMnK1oxqyeYVjcC5/X4aWhcXC6yBD5OT4A=;
        b=OO9cOVzwe8hd1svEgeXnCFdqxJ3l5Q4SxsuyQVFsLD0LxsFR6FCXc5YOiKa+uaqtUp
         vXl/eaYO/MPJquyuuDAAgw5ROmjxEKVG0h5fQ1fLtwWDDZBRJYl8r9sSdXkjpK3asdft
         0K6sAfE29/naYYbdaMcpz3PZC9jQky5TtwOrn/UzaecPUeq4WL+Z+22LEjSo9roYcBAJ
         r7v0G8o1m/6OlElnXu8lurtqiHB2VxMnqYgf8Vrgc2xbL2xMMN3FAXXr9J0T0v+JxPRm
         zaGszqDS/PcCFqicDiZfeXx+OKq0GRQg5Jg57cQTuqXlnWC1O3PlZSbm74muSc258btm
         aDfg==
X-Gm-Message-State: AOAM531BmKdNijbezG050W1RP0jIbhhjQdXfjgcWnjDgDMHot5K/q6G7
        0aq6T/wS7i4khdHvSPEtKWCyqw==
X-Google-Smtp-Source: ABdhPJy9S9/dhxwqs8xQPVr2FwoS6jmgVHh+Zr6FjGsyF9xmE8GmXAJRlr5lWzWVg8d0+Ach74RPtA==
X-Received: by 2002:a17:90b:4b8a:b0:1df:75f2:d2f4 with SMTP id lr10-20020a17090b4b8a00b001df75f2d2f4mr5908520pjb.109.1652976260975;
        Thu, 19 May 2022 09:04:20 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e229:79ea:227e:d9dd])
        by smtp.gmail.com with UTF8SMTPSA id jx12-20020a17090b46cc00b001cd4989fec6sm5750078pjb.18.2022.05.19.09.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 09:04:20 -0700 (PDT)
Date:   Thu, 19 May 2022 09:04:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v1 2/3] arm64: dts: qcom: sc7280: Add
 sc7280-herobrine-audio-rt5682.dtsi
Message-ID: <YoZqg6KoZilkuPZV@google.com>
References: <20220519084119.675990-1-judyhsiao@chromium.org>
 <20220519084119.675990-3-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220519084119.675990-3-judyhsiao@chromium.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 19, 2022 at 08:41:18AM +0000, Judy Hsiao wrote:
> Audio dtsi for sc7280 boards that using rt5682 headset codec:
> 1. Add dt nodes for sound card which use I2S playback and record
>    through rt5682s and I2S playback through max98357a.
> 2. Enable lpass cpu node and add pin control and dai-links.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

A general note: this series depends on others like "Add lpass pin
control support for audio on sc7280 based targets" [1] and "Add
soundcard support for sc7280 based platforms" [2]. This should be
mentioned somewhere, either in the cover letter or after '---'.

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=638776
[2] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=638274

> ---
>  .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> new file mode 100644
> index 000000000000..9e449817f6fd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *
> + * This file defines the common audio settings for the child boards using rt5682 codec.
> + *
> + * Copyright 2022 Google LLC.
> + */
> +
> +/ {
> +	/* BOARD-SPECIFIC TOP LEVEL NODES */
> +	sound: sound {
> +		compatible = "google,sc7280-herobrine";
> +		model = "sc7280-rt5682-max98360a-1mic";
> +
> +		status = "okay";
> +		audio-routing =
> +			"Headphone Jack", "HPOL",
> +			"Headphone Jack", "HPOR";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#sound-dai-cells = <0>;

Is 'sound-dai-cells' really needed here? The binding doesn't mention it and
the sound card isn't really a DAI.

> +
> +		dai-link@0 {
> +			link-name = "MAX98360";
> +			reg = <0>;

Eventually the 'reg' property should be removed from the binding and DTs
([1], [2]), but for now it is needed to match the binding.

[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/1649863277-31615-5-git-send-email-quic_srivasam@quicinc.com/
[2] https://patchwork.kernel.org/project/linux-arm-msm/patch/1650291252-30398-5-git-send-email-quic_srivasam@quicinc.com/


> +
> +			cpu {
> +				sound-dai = <&lpass_cpu MI2S_SECONDARY>;
> +			};
> +
> +			codec {
> +				sound-dai = <&max98360a>;
> +			};
> +		};
> +
> +		dai-link@1 {
> +			link-name = "ALC5682";
> +			reg = <1>;
> +
> +			cpu {
> +				sound-dai = <&lpass_cpu MI2S_PRIMARY>;
> +			};
> +
> +			codec {
> +				sound-dai = <&alc5682 0 /* aif1 */>;
> +			};
> +		};
> +	};
> +};
> +
> +hp_i2c: &i2c2 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	alc5682: codec@1a {
> +		compatible = "realtek,rt5682s";
> +		reg = <0x1a>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hp_irq>;
> +
> +		#sound-dai-cells = <1>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <101 IRQ_TYPE_EDGE_BOTH>;
> +
> +		AVDD-supply = <&pp1800_alc5682>;
> +		MICVDD-supply = <&pp3300_codec>;

The regulators are not mentioned in the binding, but the driver
expects them, so I guess this is fine (maybe the binding should
be updated in a separate patch?).

