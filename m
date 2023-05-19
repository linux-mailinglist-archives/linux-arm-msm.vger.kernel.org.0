Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31808709494
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 12:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjESKPq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 06:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbjESKPp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 06:15:45 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407651AD
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:15:44 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ae408f4d1aso24535645ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684491344; x=1687083344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ylo0BLiLHMimnGwbEKAmy5UwI760pNmz133+iY2EX80=;
        b=jYRgD1LfOzdrMF1zi2cwWMk5xekUG2l2wjsnhAbGE3S8O3LqNTLGA/1eQFFBfDE9d1
         fW/4MAB1GOb3BFoPtRfXm0ZGrmHnYbL46ozdL8q6Cv7zI9NamALOJ+U2o7fgsUElJlOt
         iOPG4gzxGTVXPUU1CAggF1LvDgXCIW8WItWHSDP8T7RuDlQSyz47NuKdxzX3c8LEi0pb
         NiCZLkoK9JQmz8VL7XewO/6vqbYADa6DLEG04TvwptaTxZqSKsnWCuj4KoFQmcVYMQx8
         xyHsWu5A/waUMal0sAeTFGoBXBmqiIXKRADXJStS33vR2fYRcJQBK++caEmokiujLcHN
         tJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491344; x=1687083344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ylo0BLiLHMimnGwbEKAmy5UwI760pNmz133+iY2EX80=;
        b=XO5pPGxRU94bZI94Hzppv7Q+KwP6xcZHqkf8+hukstzCXFOPCrTOO5V/rOECqOZg8y
         lq6d78wcQOgNl1r+Hy8kl1Yu+C435dDBjWSuPqV+kErLThzi2ee7DcmzqHVHcZumWIrn
         EXl+5oAmnUxb3swCs82Ci8PsU2zTvnt6k+oPHIDwjogFMWss4d6EZMPkWm9zG/eu6WOd
         D1pUSRXT9KmCJTWYCJwjVbY7To+OaUS199+aSQjNeesVWslo4Ge3Yi5WK9YCzY3YYStT
         K5igm0kFtzV9YPgWNtqJvfhKaB53FGOO11T2dIMOjrSnvDPV2zB27eBiwyrij5apU2xG
         rxmA==
X-Gm-Message-State: AC+VfDxQIz6A8Vr8g2lX1jFY3XwVk3OilbNIDJQ0i6d/9uW+aPdWnrxn
        Fj7qnr+zIlDO7zACPfDr67tvT8mXZ6a7Lq7s8pI=
X-Google-Smtp-Source: ACHHUZ512MKsw7qshc+IsaVgyWhGa8nzHkG4bOmOmgqecRqpTMd8iDObkkAmxyQ1XV1TFv80d5/aOQ==
X-Received: by 2002:a17:902:ba8c:b0:1ae:6290:26d with SMTP id k12-20020a170902ba8c00b001ae6290026dmr2213537pls.7.1684491343711;
        Fri, 19 May 2023 03:15:43 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c60:d309:883d:817e:8e91:be39? ([2401:4900:1c60:d309:883d:817e:8e91:be39])
        by smtp.gmail.com with ESMTPSA id w24-20020a170902a71800b001a80ad9c599sm3011525plq.294.2023.05.19.03.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 03:15:43 -0700 (PDT)
Message-ID: <4419a3a5-f6b0-967b-7477-4c0b22c48204@linaro.org>
Date:   Fri, 19 May 2023 15:45:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qdu1000: Add SDHCI1 pin
 configuration to DTSI
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230519085122.15758-1-quic_kbajaj@quicinc.com>
 <20230519085122.15758-4-quic_kbajaj@quicinc.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <20230519085122.15758-4-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/19/23 2:21 PM, Komal Bajaj wrote:
> Add required pins for SDHCI1, so that the interface can work reliably.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qdu1000.dtsi | 50 +++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index 6113def66a08..556942bfca5d 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -1160,6 +1160,56 @@
>   				pins = "gpio31";
>   				function = "gpio";
>   			};
> +
> +			sdc1_on_state: sdc1-on-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					drive-strength = <16>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc1_off_state: sdc1-off-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
>   		};
> 
>   		apps_smmu: iommu@15000000 {
> --
> 2.17.1

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
