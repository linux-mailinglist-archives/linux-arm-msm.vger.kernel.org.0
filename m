Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD12645DD7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 16:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiLGPrg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 10:47:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiLGPrf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 10:47:35 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A062C22
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 07:47:33 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id b11so17999260pjp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 07:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9GXVtFbyLH9bXbPp6XoAN6tnNePeiBDOdXpTyQdMNU8=;
        b=qBxziTGIEROT7SzFrJFkWDorJCQs/P38DM7vdfqHze/nkpaFKYGBCX14OryUXqwC6U
         0js3/UxKdJRK+y7bI55wnV1GJNiPPxagXJssETECJoLRMa4N+utAOam1dN9EIQFi7M8z
         Yc3sa1SxKfuVxfI9ky3VUawKcgQzJ4PunzOxx4+z15IswpsslAMOjtxtbYMavVoVFOxR
         d/yqfycBOQHg3N3dK9hMSVIACD+xVPqoCTFwp0qPdlssuqjS/NXnseecyzS/SOLdE8J7
         QphHNRlExgkTaUfGepgyxMVI7dEeQKlXawqczZZsB85U45fezwIzFIv6qVRHA8FhDjKp
         +9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GXVtFbyLH9bXbPp6XoAN6tnNePeiBDOdXpTyQdMNU8=;
        b=Y9piUKwZjbKvbEb7riuXnfiQWD9Ld7SS5f5Yfcl36z3xsve7/gIFi0tj/Q+or1lmaV
         RORieLDsYd/9O/kQmGOOQqvAg9dItbgbuTXOwxyXsQ+957yrmx2ai6hCS7Z8xnOHYFTs
         eQtaoQVasm4pwrpEP5Qkn+TR4QpOHGCS3BBt4maUSYsUSPj6kZa39WtJEOL4hbIp77bR
         1rFboFdyu8dT1LNZDK7XkcygUCCbZCOFy+TsphfMBYf1Zh59c8U/368ysF61UUeAHeoq
         LG8TO4kC1mPDI9eYtlQRx9IO9WoAGIlAhqiQHqlAGUSLWCS6UJs08QR6GRykoyqNnjmK
         9BUg==
X-Gm-Message-State: ANoB5pmaQHwCodp2Al7/uj8neYlyD+s7+qXK0P+5g+nvFI8pSHYJVaGR
        hmlGSD/sBh0IWEZgSOHEmIgrisj50RnoSaL3d0Obew==
X-Google-Smtp-Source: AA0mqf6zI+5THu783lV/KS0RegQypSJtxXtCFoiK5hcSCkIGi/jqzF9fmfUHD5ZQXNbKUlXI09uuOn20iQQL/GbIT1I=
X-Received: by 2002:a17:90b:268b:b0:219:ff4d:b64b with SMTP id
 pl11-20020a17090b268b00b00219ff4db64bmr8237396pjb.164.1670428053074; Wed, 07
 Dec 2022 07:47:33 -0800 (PST)
MIME-Version: 1.0
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com> <20221005143618.v7.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
In-Reply-To: <20221005143618.v7.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 7 Dec 2022 16:46:56 +0100
Message-ID: <CAPDyKFp8ynYSyMc+gXWuW8dC1j07X+8k3omsKKnLA_u+4X-vvA@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset support
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 5 Oct 2022 at 11:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Allow a consumer driver to poll for cx gdsc collapse through Reset
> framework.

Would you mind extending this commit message, to allow us to better
understand what part is really the consumer part.

I was expecting the consumer part to be the GPU (adreno) driver, but I
may have failed to understand correctly. It would be nice to see an
example of a typical sequence, where the reset is being
asserted/deasserted, from the consumer point of view. Would you mind
explaining this a bit more?

>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Kind regards
Uffe

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
>
> Changes in v2:
> - Minor update to use the updated custom reset ops implementation
>
>  drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
> index 9a832f2..fece3f4 100644
> --- a/drivers/clk/qcom/gpucc-sc7280.c
> +++ b/drivers/clk/qcom/gpucc-sc7280.c
> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>         .fast_io = true,
>  };
>
> +static const struct qcom_reset_ops cx_gdsc_reset = {
> +       .reset = gdsc_wait_for_collapse,
> +};
> +
> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
> +       [GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
> +};
> +
>  static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>         .config = &gpu_cc_sc7280_regmap_config,
>         .clks = gpu_cc_sc7280_clocks,
>         .num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>         .gdscs = gpu_cc_sc7180_gdscs,
>         .num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
> +       .resets = gpucc_sc7280_resets,
> +       .num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
>  };
>
>  static const struct of_device_id gpu_cc_sc7280_match_table[] = {
> --
> 2.7.4
>
