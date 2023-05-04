Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FE36F65EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 09:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjEDHi7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 03:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjEDHi5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 03:38:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EBEE54
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 00:38:56 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f139de8cefso7485299e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683185934; x=1685777934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jC4wlIyJhxN1VQGEjPZd2jM105JhW3Q65wf5sU4nicE=;
        b=Ms7yGuAigJxFHsDnEU3SVseIPRBMKS9FDUx1gP0xJFfdlBeSw2j/9KwE4OQXD6HeVl
         GluY6wlIdyQ23AErVuHYNHxKUVmPVy3PwK1UKGrPoX0WLR4NOWizsJM5InoAb9smQ23u
         Z/CGIx4egBTKSJq+9mPo525FE50w72nuOT2wncxKkkEh2ZSRw+4Gczn0+m2LjkqUWd1G
         hW1OmwjgjV1oxRrXC/ZYHIG8yMQzHJ6e4WwUY3lvNdC2sCfBI+ilW7tbHr0b2SESFjUl
         eSQIDRtrlmcSmBPL13BIaOIRhTtDO/5glMYptNjQgBNyaihU7sD1VehB2Xcpb5wJ95kQ
         NMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683185934; x=1685777934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jC4wlIyJhxN1VQGEjPZd2jM105JhW3Q65wf5sU4nicE=;
        b=EMKVtmpNbn1nPQH6w4PRUStunlT+ofu+7wNxQAxu4jjNoRaeA3Y03JJ9Jkeu9XDEPr
         BOVaD3kVZxmSzFLjUmY74H18APJaEPpYNrLsIbnWimGe0aAYOmJHLh0VdWsELK2f0QdX
         aUW5SWAAlmPrANHhdTDXpkQMUzdedQZdk/w29kdi+twemTN1yGMsWHrJVsrLfN4oRBQ5
         +1aI69/srJceKbnBZCY28WCtxV70lpulQ2wZhnuuv5tr7Oj9hay4qAgohCmmMR80H3p1
         /+t0srUmb6nTw6wdIa0KEDu93L+NrDbfrdXJnbyZ3Xb1ngfBoiSy4XZybHfK2T2+WU2o
         y8OA==
X-Gm-Message-State: AC+VfDwTgk4do8S1ls1EBZSmjFh/kpOQuFimTdu4Tjq+eQlNecWvHjhZ
        qPTYJfsp5WrNdQDENrmLxxrPhw==
X-Google-Smtp-Source: ACHHUZ6EO7Ze7bsbChbIQt402HARkKepi+XUqSOLJ9BP9CMJqiI/FVzWofyh7OAY74xgIZMPHVmPkQ==
X-Received: by 2002:ac2:4316:0:b0:4ac:b7bf:697a with SMTP id l22-20020ac24316000000b004acb7bf697amr1086966lfh.4.1683185934244;
        Thu, 04 May 2023 00:38:54 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004eff66716a6sm4772901lfm.113.2023.05.04.00.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:38:53 -0700 (PDT)
Message-ID: <4ce083f8-1ad1-c5c9-59cb-7511211b574f@linaro.org>
Date:   Thu, 4 May 2023 09:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8350: add ports subnodes in usb1
 qmpphy node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230503-topic-sm8450-graphics-dp-next-v1-0-d1ee9397f2a6@linaro.org>
 <20230503-topic-sm8450-graphics-dp-next-v1-1-d1ee9397f2a6@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230503-topic-sm8450-graphics-dp-next-v1-1-d1ee9397f2a6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3.05.2023 15:10, Neil Armstrong wrote:
> Add the USB3+DP Combo QMP PHY port subnodes in the SM8350 SoC DTSI
> to avoid duplication in the devices DTs.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index ebcb481571c2..d048f4d35c89 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2149,6 +2149,32 @@ usb_1_qmpphy: phy@88e9000 {
>  			#phy-cells = <1>;
>  
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <1>;
> +
> +					usb_1_qmpphy_usb_ss_in: endpoint@0 {
> +						reg = <0>;
> +					};
> +
> +					usb_1_qmpphy_dp_in: endpoint@1 {
> +						reg = <1>;
> +					};
Shouldn't dp be a separate port@2?

Konrad
> +				};
> +			};
>  		};
>  
>  		usb_2_qmpphy: phy-wrapper@88eb000 {
> 
