Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01D6171276D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 15:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243666AbjEZNWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 09:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243674AbjEZNWw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 09:22:52 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98BC1A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 06:22:47 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-561e5014336so7693547b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685107367; x=1687699367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dkep12SrqU2d1u54X75zEtqLiioGZSj5P759U7pvm1c=;
        b=jBbJg0qWLMNpPbjAZb6U50VuH2jCOt/K5jmEaDZaOtb6udYaHAPU1YNnyf8DSiV8CO
         O2amEdBHN+HsHvqIJADv6cRz8xGKfKsCMdt6D0N7st/uMq2QQ1P5o4Jy9rRzTrWRxApE
         S+zunqOg7GglrXnIpp0LBXusDHmq2kvI0uy+yNF7SVwas6rDK1Hh1mSVG8pr/OIqMYWB
         hHCP+Mu3O7J8wqUwEkHpfGpGoXbyxyriK21EBEnuWSpYxr27xFr6l4t6PShNwlk0fezd
         LGYd9TH7a+2fmbV5nhP0ztjJ2syTzTfD5qj0L3zzjOyEcNmPg6ggaxVGr722PhtLBDJ5
         vYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685107367; x=1687699367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkep12SrqU2d1u54X75zEtqLiioGZSj5P759U7pvm1c=;
        b=GCEQ2uoViYxlg1FGcN6xw6aItfKzVXsY9bAtILqHjI+Hv2qtCIhxj6zekP4tTRfXsh
         tsocHc8Nfn2C4ZqOhN7Nc6wsZFZFyE7CB0IqdP+Z5k4N+RYeudNFpMJnFZCii9wy9/gl
         F7hvSq6afOik/xIA5OcerCk9KfmeRx6c1cOvHGMVklMDDfapL2VtfJZCzVFIWDshsXRt
         ShqYma27QukrJqbBDiov8SL75cjHbgljtlG/Js2MHVJXN10IAE9dv11fz8lBgIHEw9iv
         45M59/Z812EVRz+Du2ZOrGMfrOjM5dP5Siv6zRkvKyG6TvDgq2yeO1EKK4pH18yV7wqB
         me8g==
X-Gm-Message-State: AC+VfDyPMAKiPEC3gdCS8jQDLyU/1Xiki8+cv7Grb99N3EK4PhPrfAHP
        IAWoDxBZUxSCqsTB6mYwsmtu/uo72HoE4J+W/wuRBg==
X-Google-Smtp-Source: ACHHUZ41LVMegDwB8qq0PKzbXkyCoZz5r5nyTLSqpgtNNWbnzO77D7yaO1Ka/bU77eLR+0/UQ7P/r00/vI9WwLG0grM=
X-Received: by 2002:a0d:ddca:0:b0:55a:574f:327c with SMTP id
 g193-20020a0dddca000000b0055a574f327cmr2255398ywe.13.1685107366988; Fri, 26
 May 2023 06:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230526125305.19626-1-quic_kathirav@quicinc.com> <20230526125305.19626-4-quic_kathirav@quicinc.com>
In-Reply-To: <20230526125305.19626-4-quic_kathirav@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 26 May 2023 16:22:35 +0300
Message-ID: <CAA8EJpqSsTxpafOQZBBSZts2ZvxR1Wb6LMdcwnTxZvmyN=OSQA@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: ipq6018: add QFPROM node
To:     Kathiravan T <quic_kathirav@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 May 2023 at 15:54, Kathiravan T <quic_kathirav@quicinc.com> wrote:
>
> IPQ6018 has efuse region to determine the various HW quirks. Lets
> add the initial support and the individual fuses will be added as they
> are required.
>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
> Changes in V2:
>         - Reorder the node based on node address
>
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index f531797f2619..0f6d6c6daed2 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -302,6 +302,13 @@
>                         status = "disabled";
>                 };
>
> +               qfprom: efuse@a4000 {
> +                       compatible = "qcom,ipq6018-qfprom", "qcom,qfprom";
> +                       reg = <0x0 0x000a4000 0x0 0x2000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +               };
> +
>                 prng: qrng@e1000 {
>                         compatible = "qcom,prng-ee";
>                         reg = <0x0 0x000e3000 0x0 0x1000>;

It looks like the prng node name is incorrect. It should be qrng@e3000
instead of qrng@e1000. Could you please send a followup to fix it?

For this patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> --
> 2.17.1
>


-- 
With best wishes
Dmitry
