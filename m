Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16850712342
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 11:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242802AbjEZJTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 05:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242730AbjEZJTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 05:19:23 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8650D19C
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 02:19:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4effb818c37so474700e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 02:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685092752; x=1687684752;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o36okfJ2uXjfHbZxRNBsbZSyvdC2S3fpL263mheqSmo=;
        b=vQRnVBYmeQ5r49U/LFOTf2jeEmMDnH94pikWS1tLhOHMSGIrGQHFWwJb4uoBl5BCGh
         k+yN7+laDi7Mitz52m9VHVfuT0lsQ5Q/g9gp3xq751umWi1JdXIBTqZI1ajvim/g1t3c
         AZZ6Gzs0ZMa9lBi1MzRLGafJZoae39zAI68+4w7iXugRiwi/QgEeY7msrPK/1GM6+oP6
         +7q3h+52kOskK5NHMo8jubWyEZu5yddYWsq1LJeNQmt1MWImtapzAW5jJLaPJ226WxOH
         HWTnwk+DmwnPCVEihOE1IXxiNq/e50EQwYLni9m6pJU4OEQ1m5MxMaBTifuhJqZbsDv4
         xTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685092752; x=1687684752;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o36okfJ2uXjfHbZxRNBsbZSyvdC2S3fpL263mheqSmo=;
        b=K3E0OoTMTcdc5w6fsA4hMPowKzaviKQ+v+Z6nL/GXs2yQDApEkXpKfHwouTyW1le7z
         6PwF/zbjKztHLUOZ/SmSlrf5NPUzKq1SCKw7gjMiwenP4TvnQnLst+owKyvCm89mcjpQ
         CFOuSkixOQ/LpbUixTnLLr3ynuWI8EoTSYe3FAbOLXhmUjyZaLDCIaP4SyEsq91TS6k+
         KGwxVT1zE3Hwc6v5n1XfcEkYLhjhEJ5hAoyTH57AoTU068GyOJf0bwiYmraouIUdngq0
         bXYLL60RXgL3wWAvRd6W/jTQC8BfxtK56zJzLyaMowIapXJ/bVza1UZzjzm9ae4qb1xZ
         80Mw==
X-Gm-Message-State: AC+VfDy2+Vk0LK1myPUXIqwft3llYL2T8tSJv5KiG3MRnfBVwRCm4dd7
        ORTuopjwYzenGFWXV9ftPrOP1w==
X-Google-Smtp-Source: ACHHUZ4u6nLJGekNISitOdsob7tY7FVdqTfo56b0HhdPHzyS7ajhwNZdGV966pZmHerVT/E/IUYq3Q==
X-Received: by 2002:ac2:5605:0:b0:4f3:8244:95dc with SMTP id v5-20020ac25605000000b004f3824495dcmr307361lfd.15.1685092751809;
        Fri, 26 May 2023 02:19:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id d10-20020ac25eca000000b004f3778239adsm549377lfq.19.2023.05.26.02.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 02:19:11 -0700 (PDT)
Message-ID: <55200328-735d-6571-fcad-735cc9d1568b@linaro.org>
Date:   Fri, 26 May 2023 11:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: ipq5332: add QFPROM node
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230526070421.25406-1-quic_kathirav@quicinc.com>
 <20230526070421.25406-3-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230526070421.25406-3-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26.05.2023 09:04, Kathiravan T wrote:
> IPQ5332 has efuse region to determine the various HW quirks. Lets
> add the initial support and the individual fuses will be added as they
> are required.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index af4d97143bcf..c2d6cc65a323 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -135,6 +135,13 @@
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0xffffffff>;
>  
> +		qfprom: efuse@a4000 {
> +			compatible = "qcom,ipq5332-qfprom", "qcom,qfprom";
> +			reg = <0x000a4000 0x721>;
That's an odd size. Are you sure this is how long the corrected region is?

Konrad
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		rng: rng@e3000 {
>  			compatible = "qcom,prng-ee";
>  			reg = <0x000e3000 0x1000>;
