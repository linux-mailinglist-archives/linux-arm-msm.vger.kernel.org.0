Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B22E74C1DFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 22:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242045AbiBWVwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 16:52:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235875AbiBWVwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 16:52:04 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C2722BDD
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 13:51:35 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id 8so552130qvf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 13:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7HUVNZQiEEXaUvy3RrhbANmYcH8oGsdxifIctFemNVw=;
        b=SnxuRkXzdbe1wR2S1H3+KBQbfIfB8Losrc/r+oTwCiBTWmQ5dw9Fa8YhkcNJh5N1b1
         67vU/Yjbe2hOZPfPAK2L456wDMBjXmTTw4234gOdFxKY2T/Z1G9vylHw7RxkwOHLDn1O
         sadSZ7aXEeSTaKMePhtVGGU7YPQdZMzgKmZ5V+FF/BZumo1Y8Bs7rrLGicTSUzRo6xRd
         cHYnrCT7HTizDx1O7UEZ4B3pE4Umhx9OYitYHiTaZnQ8ThY+gVfzwTC3FPJYBUbnPOIA
         cvMNhcK2/6GTHLF8w7iBsgJJWc0d1RoLrAYuBb+W4clwWvdIQwWFI27AaFh3X2JnrR1p
         ZUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HUVNZQiEEXaUvy3RrhbANmYcH8oGsdxifIctFemNVw=;
        b=uXNQhdv4TI9EwuKI1dYcOkMpPXLgz66ajFwT13eER1KhSxOO8Prc6hZHyscQhsIiAG
         SC3tSPofPwL8WANlvkFevSK+CvDHss22I2o0eAQPpuyyzSw/8Gifo4EJkoPNeM8Xz8sJ
         6PBOpWuxSwlpPnk4bxvfJJa3GgYTeh/UQvmVSUCInMbgGPexgJx3IyVfv8Qg4nNON7xK
         lpIbek2z0sB5yoRST/lGHRf2WxjjUq/eyCSvSyfrHYv8aQ6GP5VB7skhJ9KxLl7PGK9F
         biaI96ynOmqxMrynfsCoccp2qzAghQX84Fetatz9kQ3QO5hjd9VR2MPpVuBr5FcCADpC
         coXQ==
X-Gm-Message-State: AOAM531i7VfJxJHu2psX9nMAXEVjyEqTLtMABRVFrzSX8/tWjTMoWYoE
        n9LsPDatBbDLn2ujb4ZK9Z68DnEM9QpYBLhD5LsGrw==
X-Google-Smtp-Source: ABdhPJzje7a7YdyFqZl6kLPzcoGrxOi4FHB8EGjU8WIbzSRWfDzPfj6CqCqQ5BsMUuXZxTnCbgaG73MeeM39f6u1zVQ=
X-Received: by 2002:a0c:d807:0:b0:42c:1ff7:7242 with SMTP id
 h7-20020a0cd807000000b0042c1ff77242mr1538738qvj.119.1645653094284; Wed, 23
 Feb 2022 13:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20220223192946.473172-1-bhupesh.sharma@linaro.org> <20220223192946.473172-5-bhupesh.sharma@linaro.org>
In-Reply-To: <20220223192946.473172-5-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 24 Feb 2022 00:51:23 +0300
Message-ID: <CAA8EJppDVo5rN3swiVoE8zAqCTmwQD9RZAxbrP0CPO30kQTBmA@mail.gmail.com>
Subject: Re: [PATCH 4/6] PCI: qcom: Add SM8150 SoC support
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        bhupesh.linux@gmail.com, lorenzo.pieralisi@arm.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        svarbanov@mm-sol.com, bhelgaas@google.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 23 Feb 2022 at 22:30, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> The PCIe IP (rev 1.5.0) on SM8150 SoC is similar to the one used on
> SM8250. Hence the support is added reusing the members of ops_2_7_0.
>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index c19cd506ed3f..66fbc0234888 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1487,6 +1487,17 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
>         .config_sid = qcom_pcie_config_sid_sm8250,
>  };
>
> +/* Qcom IP rev.: 1.5.0 */
> +static const struct qcom_pcie_ops ops_1_5_0 = {
> +       .get_resources = qcom_pcie_get_resources_2_7_0,
> +       .init = qcom_pcie_init_2_7_0,
> +       .deinit = qcom_pcie_deinit_2_7_0,
> +       .ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
> +       .post_init = qcom_pcie_post_init_2_7_0,
> +       .post_deinit = qcom_pcie_post_deinit_2_7_0,
> +       .config_sid = qcom_pcie_config_sid_sm8250,
> +};
> +
>  static const struct qcom_pcie_cfg apq8084_cfg = {
>         .ops = &ops_1_0_0,
>  };
> @@ -1511,6 +1522,10 @@ static const struct qcom_pcie_cfg sdm845_cfg = {
>         .ops = &ops_2_7_0,
>  };
>
> +static const struct qcom_pcie_cfg sm8150_cfg = {
> +       .ops = &ops_1_5_0,
> +};
> +
>  static const struct qcom_pcie_cfg sm8250_cfg = {
>         .ops = &ops_1_9_0,
>  };
> @@ -1626,6 +1641,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>         { .compatible = "qcom,pcie-ipq4019", .data = &ipq4019_cfg },
>         { .compatible = "qcom,pcie-qcs404", .data = &ipq4019_cfg },
>         { .compatible = "qcom,pcie-sdm845", .data = &sdm845_cfg },
> +       { .compatible = "qcom,pcie-sm8150", .data = &sm8150_cfg },
>         { .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
>         { .compatible = "qcom,pcie-sc8180x", .data = &sm8250_cfg },
>         { .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
