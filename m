Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBD416BE44C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 09:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjCQIvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 04:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjCQIvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 04:51:03 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B396303C8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:50:59 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y4so17585741edo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1679043057;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUhD0MyixfIqswuuyf5YxBcoxL2uotSy4IJZo8MuW1o=;
        b=1aHHVElTR/UGBUj8wrqxRU7knv+qQq6srORFnJdSeG4SP3eD8POuSGHdIptMsQoZaY
         S6ipdLQ+fDl/I0Pkfz3caKmvsszoQdRSQHNQnJQf/8UI/rdWJEFAUhvf+JaXryd7zz0M
         0+GooKTIKQWKX7Gn1iw7j8UProeZsbQEhZpsdZoExDHrBMcwmn4rgt4LPPabxfGXyAyp
         VrkVlfCnBisHnxj4wD6yAvHIAFYro2yARAcaLldJwNTmeHkvolA8NMfxsnVUec6u+89n
         Qn8YQUtb8WsqhMdFjapEvpyDXmJndu5qRpXAWcapvpRx6k/TXyLt43TzWhhQ55W4cHlW
         WUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043057;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUhD0MyixfIqswuuyf5YxBcoxL2uotSy4IJZo8MuW1o=;
        b=tmWNldiAkVQ5oGwhTjs9KOZyjhSuDeWH/A6NGNSiq6aEIHq74pCIT29yLa/FeMIDkt
         SdcyXvR6Ntie4StFrll95PXehIvnYNwVUuHZOV2Vp6ut80siIe3mkEgvljzDOxXdk7B6
         1cYQ1XyY0yYWMiuL3Y03An7RBAs2hHD1BTJziLdQ1ZoaEWDVUDhNRE+9mIBc5p+mWu13
         M6CW+Up6e+ELj7PPGlboiBScPMPpQCevc0W2vxQiqk2B+smy+CEPdnMem9vPeYEHCO71
         7brcEdPomiaV6+AeySQgDOPVTmugbfERFM1ySniQEKbHeOZyqjwsxWEM0Poc3OyHkSF0
         ttBQ==
X-Gm-Message-State: AO0yUKVyfvUz1cg/xFDyRENzrvomzpDRbwzrKrHFIe/kCIZxgVNHCq4U
        4mLsa8LPDL2R3JnfAuIN1rEMzQ==
X-Google-Smtp-Source: AK7set+7ONQpWPeXdAkH0lEOUfQerwdYwh+LvG+oh9YEVCWvEuOiaMnwgSPB85zPE3Nbzwi+gepGkw==
X-Received: by 2002:a05:6402:5159:b0:500:29e3:ce with SMTP id n25-20020a056402515900b0050029e300cemr2169796edd.36.1679043057613;
        Fri, 17 Mar 2023 01:50:57 -0700 (PDT)
Received: from localhost (2a02-8388-6582-fe80-0000-0000-0000-000b.cable.dynamic.v6.surfer.at. [2a02:8388:6582:fe80::b])
        by smtp.gmail.com with ESMTPSA id q30-20020a50aa9e000000b004fadc041e13sm756198edc.42.2023.03.17.01.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:50:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 17 Mar 2023 09:50:56 +0100
Message-Id: <CR8J37NBHHRY.2S8LQ5O7IQ9PU@otso>
Cc:     "Marijn Suijten" <marijn.suijten@somainline.org>,
        "Rob Herring" <robh@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm6350: Add QFPROM node
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
X-Mailer: aerc 0.14.0
References: <20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org>
 <20230315-topic-lagoon_gpu-v1-3-a74cbec4ecfc@linaro.org>
In-Reply-To: <20230315-topic-lagoon_gpu-v1-3-a74cbec4ecfc@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu Mar 16, 2023 at 12:16 PM CET, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
>
> Add a node for the QFPROM NVMEM hw and define the GPU fuse.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/q=
com/sm6350.dtsi
> index 523c7edfa4b3..60b68d305e53 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -637,6 +637,18 @@ ipcc: mailbox@408000 {
>  			#mbox-cells =3D <2>;
>  		};
> =20
> +		qfprom: qfprom@784000 {
> +			compatible =3D "qcom,sm6350-qfprom", "qcom,qfprom";
> +			reg =3D <0 0x00784000 0 0x3000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			gpu_speed_bin: gpu_speed_bin@2015 {

gpu-speed-bin@2015 ?

With that fixed:

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> +				reg =3D <0x2015 0x1>;
> +				bits =3D <0 8>;
> +			};
> +		};
> +
>  		rng: rng@793000 {
>  			compatible =3D "qcom,prng-ee";
>  			reg =3D <0 0x00793000 0 0x1000>;
>
> --=20
> 2.39.2

