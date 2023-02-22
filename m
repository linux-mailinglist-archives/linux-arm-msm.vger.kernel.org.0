Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37C8269F8A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 17:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjBVQG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 11:06:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbjBVQGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 11:06:55 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804363CE35
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 08:06:51 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id s22so10578726lfi.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 08:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8USIxg/ch7FSV86aq2IWnMVmX2lOYDkkYcIurOZq368=;
        b=EMWzDHhPFmWX6K1h4sWnl4efdISDePX4QMzUIzv91ih43FiBsgeKUyXXsLw8aqRj/f
         YFx0yomB7J7X3XVqL957/pZXG7RYdtW31SY1ve4Y9vIiGHxP1ZtwRq8NmCj20F6gj5pV
         0oDUiLmJi2ydK7Lfux2cj5J5Og8AFuR8D9lHagVRSezna/+E2OdHwreTT9mhQiTHJrGO
         c37DJgcjZHDevUZhr3wnIWXuMXsI+WfA0FuonExgJvircWhyb/yiZBrleXNBzTtvCn1B
         21JmyNLsLiCEUZ+hi9Ienb8OAQ8L9903f13qYys2dF6TsccTifYfeovi2fM1zgEgpib6
         PlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8USIxg/ch7FSV86aq2IWnMVmX2lOYDkkYcIurOZq368=;
        b=NeIv2YbdYEWx1FJ15K4UELdWnA31kgZKLKE8sxQHZni4MluMm6ycGjle178cUMuh5L
         FVWMcQ7slGkBccwdFnb77TsWEszKY6gSS9CfZbEiL6hIF23yZNn2mN9VdLiIBWBY9KCh
         gJsp7rn6jtzGxBd0mPE3o4sg/uYSwfNVZRKtdn5KJvuJkK/1+89p4BidNz7cRbrNH257
         49NxGOvUEB1FarUKXHxchANbJ/kWDEZtnv27hN9fGNAwOdg6Srax9L2nltYJHIr7KEcc
         S6KphAX1i2YD9U1HpgMQcUDdliZSAjKXK+yrY7MDbmlyl3gzwcFSZesL6DbtZv0AQSXY
         QqAQ==
X-Gm-Message-State: AO0yUKUry1Aj/gePPAdpjPhi/MQRa7XctWLR6IIVipwgeFVWBuFnalYk
        751H/3OMI5NKBZsqNZaF9tUznw==
X-Google-Smtp-Source: AK7set90zq0pUixr/vnRmsiQGKP735fINZmlrvTRuNAivKuiwFZsainImmoqZg2zjT58hixUQD4V0Q==
X-Received: by 2002:ac2:5383:0:b0:4dc:4c53:4460 with SMTP id g3-20020ac25383000000b004dc4c534460mr2813784lfh.16.1677082009120;
        Wed, 22 Feb 2023 08:06:49 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id x23-20020ac24897000000b004b564e1a4e0sm282007lfc.76.2023.02.22.08.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:06:48 -0800 (PST)
Message-ID: <8259f4e1-3ab0-0ac2-f717-7dca72ea4170@linaro.org>
Date:   Wed, 22 Feb 2023 17:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8450: Add IMEM and PIL info region
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, elder@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1677079845-17650-1-git-send-email-quic_mojha@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1677079845-17650-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.02.2023 16:30, Mukesh Ojha wrote:
> Add a simple-mfd representing IMEM on SM8450 and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Change in v3:
>  - Sorted by address.
> 
> Changes in v2:
>  -  put ranges after regs and corrected the sram node position.
> 
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 1a744a3..7671f15 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3689,6 +3689,20 @@
>  			};
>  		};
>  
> +		sram@146aa000 {
> +			compatible = "qcom,sm8450-imem", "syscon", "simple-mfd";
> +			reg = <0 0x146aa000 0 0x1000>;
> +			ranges = <0 0 0x146aa000 0x1000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x94c 0xc8>;
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,sm8450-smmu-500", "arm,mmu-500";
>  			reg = <0 0x15000000 0 0x100000>;
