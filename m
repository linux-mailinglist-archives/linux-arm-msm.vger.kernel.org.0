Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46BCE6A86E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 17:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjCBQjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 11:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjCBQjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 11:39:22 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C58835A5
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 08:39:01 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5384ff97993so438153537b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PGC7FexSUDuE13biGFJ/Du9EMRxwYtWt7jLQYTTJIb0=;
        b=JcpthHHzlczfHnEAWweKijtEL5eu+oR2yGMUKX4OU1/+JQS3ANQD3h7dAOp5V7TWV7
         6Fw2vL5hy0DkeNBZ2DE0BrPiCTVwTrLZ/qCLVemHL/RZwHTnjPSXppBQ1NzFDZhbaFjg
         ORDfPLvR3Bjnj0qPbMtCcHX1rZlM8P+rxekiSLKQa4XrGzp1e0k/Z9joOGIWuVdjNCln
         4uy0JRmrdJCslGA/9taRcxMrX+2ox2CQi5pqTf0n++buftwlhEa71sGkaaxEhs2PYW1s
         DqB/a658rixzYbTLSNW14o2keAYrAamjHFnR9/rkYXBGP8YWrjNZYSpulyOZ/92xkHep
         5W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGC7FexSUDuE13biGFJ/Du9EMRxwYtWt7jLQYTTJIb0=;
        b=Nxwqyj6R5dPs9i0HJ4uPgAq9b2cLaUFZjooJ202e81MR2H5/yfN3TCxDF0No/oWh5d
         kATRkbpDch+s2GdpbPY7I3QYGDMiB7RiuRyf2I0kk69MyNRlDkefxYOmk81xzaVEyfFs
         AUZcecRn3WGI7JiA8aX1DtxYQPdeyZPof7onS4IS1+RJ0v5KP9yHnVunF1pjo0xmgZPB
         A6ONqk7rbUbrz/tzNfB7O8mqXSxcnt6HBqM9dZCVpcyQRvHwVOdXh/5Cd5ZucG19VfyH
         9lq91GfE49wZzlhTunU6RhCVpxPe0/mxruy9zK1UupQUeKv5uWWGMAaB3BMxggG4pXGH
         qLbQ==
X-Gm-Message-State: AO0yUKXRqPkDiasyr90niV9sJcYw15eoinVfyiIs24iYhZZ6/NJKj+PN
        uPIyX3hCAjcz3mWk6DNy8Cac4+GXfIKvRaYEEAeMAg==
X-Google-Smtp-Source: AK7set9K8jJPZUlDxy83PEHgBkdtZZCQuBT0j69TZkB7pMGcFEQExvBE0Z6nzo20Xj2S+Muoxl0GE46SntlTIf4bzFM=
X-Received: by 2002:a81:b71b:0:b0:536:7529:55b4 with SMTP id
 v27-20020a81b71b000000b00536752955b4mr6642631ywh.3.1677775140455; Thu, 02 Mar
 2023 08:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20230302123051.12440-1-a39.skl@gmail.com> <20230302123051.12440-2-a39.skl@gmail.com>
In-Reply-To: <20230302123051.12440-2-a39.skl@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Mar 2023 18:38:49 +0200
Message-ID: <CAA8EJpoxtKQfmdbX+CGmri6RUf3YauxNUc1z62Xn1TczcsWhDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8956-loire: Provide rate for
 xo_board clock
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
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

On Thu, 2 Mar 2023 at 14:31, Adam Skladowski <a39.skl@gmail.com> wrote:
>
> As xo_board is part of board not soc we define rates per device tree,
> assign common 19.2Mhz rate to make consumers happy.
>
> Fixes: ff7f6d34ca07 ("arm64: dts: qcom: Add support for SONY Xperia X/X Compact")
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
> index 67baced639c9..085d79542e1b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
> @@ -280,3 +280,7 @@ &usb_hs_phy {
>         vdda3p3-supply = <&pm8950_l13>;
>         status = "okay";
>  };
> +
> +&xo_board {
> +       clock-frequency = <19200000>;

This doesn't seem to be board-specific. Please move it to msm8976.dtsi.

> +};
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
