Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE916912C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 22:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjBIVtj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 16:49:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjBIVtj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 16:49:39 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4DA60E6C
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 13:49:37 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id b13so3734217ljf.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 13:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+hWz7mZJWvEqZkUNY9rF0NUfKN5FMSK3bvphPb5LMAY=;
        b=EIX9B2h+69ulth/0KTEV/dCBE9jDolM6Be0Vb7N+iyFVGKlPpIW4++6lmWvYSMesqg
         6Hb9jLVe3JuSh8gjyMpBgBKv7PmyM+4cmbUy8K+DYNdSeVRWKt/y2lwA3Y4shSvuh9MW
         igPiu8k3NgCn79X/mq9u5plZ1v45LiC4Hcc14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hWz7mZJWvEqZkUNY9rF0NUfKN5FMSK3bvphPb5LMAY=;
        b=tWRvfcFS7rwB+kqmUa1qNiSdn8wINbPJYCf/SxWdAEjp3OJEWhu28CFZs5PtUlE/c4
         jAKvxV/GSDZHz79LTmCesOAAOt8jiiIsSZZqm2Pbg3yp2VPrGI5gBaH2cdUK/D0+DLJb
         GJK0UA9cYlFAGMBAJfBRBEUuw8M6mHyFcTPJQoyVATIwIRuyG519f7PuojdfDWKrWyBo
         ahyvJ8t4vxlvYrtrm4B9yCBHYMc7UXiS6g2qhZHk2+ZwvMq4OisT7VNgVqwBLt3XojHt
         6zyff6qKQFMNgl8v5d2PmOBPVaHm46GIIWdFJe/f5pKKTuQK7EzbojAXJzdHc4QVLXUw
         9vqQ==
X-Gm-Message-State: AO0yUKWFADjv/1rdiWzFdb/QONrZwRHFvS0vTo0A0sBtIO76pmBEXwvH
        74lTTTSH3MwxJ9e744ilD7w911BWfOgVZBeBKIXE5w==
X-Google-Smtp-Source: AK7set/tVvpInH7kCsORem0GFcmD6Wk69koafv46VGU3LB9YCuQKKMGUPBRjHwNpXv1kUB636LjDVAbrQaSJNhoYAes=
X-Received: by 2002:a2e:8e6c:0:b0:28e:bba7:22dc with SMTP id
 t12-20020a2e8e6c000000b0028ebba722dcmr2252599ljk.56.1675979375448; Thu, 09
 Feb 2023 13:49:35 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Feb 2023 16:49:34 -0500
MIME-Version: 1.0
In-Reply-To: <1675318653-28352-5-git-send-email-quic_srivasam@quicinc.com>
References: <1675318653-28352-1-git-send-email-quic_srivasam@quicinc.com> <1675318653-28352-5-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 9 Feb 2023 16:49:34 -0500
Message-ID: <CAE-0n510UAMzGovJrQtAgtaxEeoPM9VgPHghCeouKvJ9gjrf_w@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] clk: qcom: lpassaudiocc-sc7280: Merge AHB clocks
 into lpass_aon
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

Quoting Srinivasa Rao Mandadapu (2023-02-01 22:17:32)
> Merge AHBM and AHBS clocks into lpass_aon clk_regmap structure as they
> are using same register space.
> Add conditional check for doing Q6 AHB clocks registration only
> if regname specified in device tree node.
> In existing implementation, Q6 AHB clocks and lpass_aon clocks are
> being registered exclusively and overlapping if both of them are
> to be used.The regmap region used by Q6 AHB clocks is <0x03389000 0x24>

Add space   ^

> and of lpass_aon clocks is <0x03380000 0x30000>.
> This is required to avoid such overlapping and to register
> Q6 AHB clocks and lpass_aon clocks simultaneously.

The commit text is still really hard to read and understand what's going
on. Hopefully a binding update makes it clearer. It could also be
clarified by indicating the compatible string so we know what "Q6 AHB"
means or what "lpass_aon" means. Then we can grep the dtsi files for
those compatibles to better understand what is intended.

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

This should be index based and not reg-name based. Can you point me to
the binding update for "qcom,sc7280-lpassaoncc" compatible that supports
this?

> +               if (res) {
> +                       lpass_audio_cc_sc7280_regmap_config.name = "cc";
> +                       desc = &lpass_cc_sc7280_desc;
> +                       return qcom_cc_probe(pdev, desc);
> +               }
