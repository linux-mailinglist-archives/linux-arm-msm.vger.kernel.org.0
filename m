Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FE068213B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 02:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjAaBEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 20:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjAaBEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 20:04:38 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65DC30191
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 17:04:32 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id w11so21860933lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 17:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RPb92qw4kjDeI3aHDlTv6TKpmyAS8e7ioXRB2XuSebc=;
        b=I+sKTBPtPSbTSA5QuDoUaZj1ts2qGmKV7O8pkD8QpD/QDp8qnGh/UhpMxXOJOqojoB
         bwSQYmi1mHm5pJ/K01yA3kyTQzW3gjlWuc14L+E/Tv33aPBTJe8MTNFGUXYcVFmDrjnG
         hTSxRVUo5jAlFe1UYfC+fI6LfOXK3mZfkf858=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPb92qw4kjDeI3aHDlTv6TKpmyAS8e7ioXRB2XuSebc=;
        b=Tk8pGLtJ3VwTfTc9WSGCvA8y9MctijaVz4WDl0/yr/+eK/os65JBKLz7cuQc8aXn+n
         hZGwUblD0YSrlNNUgGDjsTXugULLG4t7V9UNzJQ9EOBVA14ja+gCzEF+xMzVGzZG8XRD
         WcEScY2qf1Bg+Mn4CQbS080sQvxHL6ArI9k0WS2aHxYyagWmgMas00dQwNrLolJE7rfx
         +ybCvCLY3pPHm5a9fMo1H+GZpIbjCpoEgv24+k3EmNzMVK7mZZV9hLhrsSbVjoQtR0z7
         7NpUBzxqX5iIb1KHqNqf3+N24WM8qXDpTbzbFY4FeaGoiZQXiKXEN/WaTTwhAdxzPTz6
         cTiQ==
X-Gm-Message-State: AO0yUKWZGYqt5eLFjPLNRR2Hz9iWdNbAH5BYRz3Dv2iyCZcFTNTZlDF1
        +IbHXpj28jY0yvDtkG032HudXMfDm/5VH5+M9Gt1qA==
X-Google-Smtp-Source: AK7set8liNys4c8rwIc7DLJ2bUrEfqy6w+R3DtR4hUj9/7iNbhNCYO2xfzLnEry5cRkOhnvPllU3+AX1icGV1L98C9U=
X-Received: by 2002:a05:6512:3b9c:b0:4d8:62ec:1ec0 with SMTP id
 g28-20020a0565123b9c00b004d862ec1ec0mr1144990lfv.247.1675127071026; Mon, 30
 Jan 2023 17:04:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Jan 2023 17:04:30 -0800
MIME-Version: 1.0
In-Reply-To: <1674728065-24955-6-git-send-email-quic_srivasam@quicinc.com>
References: <1674728065-24955-1-git-send-email-quic_srivasam@quicinc.com> <1674728065-24955-6-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 30 Jan 2023 17:04:30 -0800
Message-ID: <CAE-0n50y4JEQqW2wgS_qoDkdrqP=bzpC6b_LpA6Q9P+jDc00ZQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] clk: qcom: lpassaudiocc-sc7280: Merge lpasscc into lpass_aon
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-01-26 02:14:24)
> Merge lpasscc clocks into lpass_aon clk_regmap structure as they
> are using same register space.
> Add conditional check for doing lpasscc clock registration only
> if regname specified in device tree node.
> In existing implementation, lpasscc clocks and lpass_aon clocks are
> being registered exclusively and overlapping if both of them are
> to be used.
> This is required to avoid such overlapping and to register
> lpasscc clocks and lpass_aon clocks simultaneously.

Can you describe the register ranges that are overlapping?

Here's what I see in DT right now:

                lpasscc: lpasscc@3000000 {
                        compatible = "qcom,sc7280-lpasscc";
                        reg = <0 0x03000000 0 0x40>,
                              <0 0x03c04000 0 0x4>;
                        ...
                };

                lpass_audiocc: clock-controller@3300000 {
                        compatible = "qcom,sc7280-lpassaudiocc";
                        reg = <0 0x03300000 0 0x30000>,
                              <0 0x032a9000 0 0x1000>;
                        ...
                };

                lpass_aon: clock-controller@3380000 {
                        compatible = "qcom,sc7280-lpassaoncc";
                        reg = <0 0x03380000 0 0x30000>;
                        ...
                };

                lpass_core: clock-controller@3900000 {
                        compatible = "qcom,sc7280-lpasscorecc";
                        reg = <0 0x03900000 0 0x50000>;
                        ...
                };

Presumably lpascc is really supposed to be a node named
'clock-controller' and is the node that is overlapping with lpass_aon?

>
> Fixes: 4ab43d171181 ("clk: qcom: Add lpass clock controller driver for SC7280")
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> index 1339f92..8e2f433 100644
> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> @@ -826,10 +829,12 @@ static int lpass_aon_cc_sc7280_probe(struct platform_device *pdev)
>                 return ret;
>
>         if (of_property_read_bool(pdev->dev.of_node, "qcom,adsp-pil-mode")) {
> -               lpass_audio_cc_sc7280_regmap_config.name = "cc";
> -               desc = &lpass_cc_sc7280_desc;
> -               ret = qcom_cc_probe(pdev, desc);
> -               goto exit;
> +               res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cc");

We shouldn't need to check for reg-name property. Instead, the index
should be the only thing that matters.

> +               if (res) {
> +                       lpass_audio_cc_sc7280_regmap_config.name = "cc";
> +                       desc = &lpass_cc_sc7280_desc;
