Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C06B86BE48D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 09:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjCQI5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 04:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbjCQI5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 04:57:13 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04F46B5C0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:56:49 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id o12so17529155edb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1679043406;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tr5k3/w3leHyi4aocCURJSRCZ6+xZ7Mx2vRgpBalJI=;
        b=qTPUX1zDbkh0t+aQ/8gYzvh9TkOeBZPEOeruQc2Ql+n1b62gGuCXmj5KEjR7OLD2tB
         7hR4vEaj4s+bc/AqYrIHyxmpmUC8FFpQtcOT2T6JHDZpWAKeid9vYSZToXSQaDCzcTlb
         4a4OjvKeXxEKUSn54U0Qmv6X6WJe7gP/dkYdpNH1YNKMwaS3PcKB3ZB0mHXOGQAKBiT6
         VDpFM5jRRJgekY3UYR2dOv9r0KZy3KDnRIwNMX7Zi0HAnopnEBlUrs7GgMGieJG/FM8U
         OC2pl98dtD825v4342zKYDWSaYAY5NOZwxTdnMyJ7F3Y1u4xrkACkgEYBu5Xbq3Bfneo
         u1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043406;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tr5k3/w3leHyi4aocCURJSRCZ6+xZ7Mx2vRgpBalJI=;
        b=UHfkyJL7RWalHvb853lly9S/bAnTlp7tgpbl6gsslbe+kzD0UkTzOaLeyeGxDjCrnC
         okawhSqjUWtJiPbEAf0TwcKfHHAlq8apvPmfKqfvY+K7WYwVuKuo3KqyVcjJ+n+5yg16
         KUmqExN4X0nMOg6i3JDir5pP2KfLYSA43mXpkQW3J4YoBqmMhYoGMWG4b6+M+J5cLiUM
         BIpLzrImKA6P0hHR3ll1vGyKBb/mkDPLdyNKXa0lEv010xwQ8Bcg8RxWLPSJ+WHFuNTR
         slo1ycjMIo/x+cAhp6/16D1UZvu1mxLv/mV9GUhvtTuwUDRg5dOIjSTfCUA02gDejF4c
         Vdgg==
X-Gm-Message-State: AO0yUKUv1w35EWfQ2qC0zbghOOoigLmbIJhSab6/Pk91aI9UHO+WEUfl
        +12JM71SZQoCk6m9E4Ny/Mrf8A==
X-Google-Smtp-Source: AK7set+efCng4cHamJNfx7vBd5TB+fXK9PZgEtWM3lu3AIBCbxF4iQ/B6/Rr+A1n/0Xtf5BLRYIplQ==
X-Received: by 2002:a17:906:a04a:b0:8ae:11ca:81de with SMTP id bg10-20020a170906a04a00b008ae11ca81demr15625732ejb.34.1679043405918;
        Fri, 17 Mar 2023 01:56:45 -0700 (PDT)
Received: from localhost ([2a02:8388:6582:fe80::b])
        by smtp.gmail.com with ESMTPSA id lm15-20020a170906980f00b008c76facbbf7sm714385ejb.171.2023.03.17.01.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:56:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 17 Mar 2023 09:56:44 +0100
Message-Id: <CR8J7NPGU3AQ.NUJ64VVNTJYD@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "AngeloGioacchino Del Regno" 
        <angelogioacchino.delregno@somainline.org>
Cc:     "Marijn Suijten" <marijn.suijten@somainline.org>,
        "Rob Herring" <robh@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm6350: Fix ZAP region
X-Mailer: aerc 0.14.0
References: <20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org>
 <20230315-topic-lagoon_gpu-v1-5-a74cbec4ecfc@linaro.org>
In-Reply-To: <20230315-topic-lagoon_gpu-v1-5-a74cbec4ecfc@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu Mar 16, 2023 at 12:17 PM CET, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
>
> The previous ZAP region definition was wrong. Fix it.
> Note this is not a device-specific fixup, but a fixup to the generic
> PIL load address.
>
> Fixes: 5f82b9cda61e ("arm64: dts: qcom: Add SM6350 device tree")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/q=
com/sm6350.dtsi
> index e967d06b0ad4..3fe4a5fa3021 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -466,11 +466,6 @@ pil_ipa_gsi_mem: memory@8b710000 {
>  			no-map;
>  		};
> =20
> -		pil_gpu_mem: memory@8b715400 {
> -			reg =3D <0 0x8b715400 0 0x2000>;
> -			no-map;
> -		};
> -
>  		pil_modem_mem: memory@8b800000 {
>  			reg =3D <0 0x8b800000 0 0xf800000>;
>  			no-map;
> @@ -491,6 +486,11 @@ removed_region: memory@c0000000 {
>  			no-map;
>  		};
> =20
> +		pil_gpu_mem: memory@f0d00000 {
> +			reg =3D <0 0xf0d00000 0 0x1000>;
> +			no-map;
> +		};
> +
>  		debug_region: memory@ffb00000 {
>  			reg =3D <0 0xffb00000 0 0xc0000>;
>  			no-map;
>
> --=20
> 2.39.2

