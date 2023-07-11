Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212B974F9DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 23:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjGKVhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 17:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjGKVhS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 17:37:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510FA19BA
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 14:36:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so9694438e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 14:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689111389; x=1691703389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NrSX7PhPKOGnA92pPm2YdNBTlBhRtkFT2QjTzX6SGZI=;
        b=rtPZbS4PGX83gYcAKsGtXuy7/HFRYvxeEKew1hmWfVgNZ5jtsyvTcvqu9uZ0nwB8C8
         sy9Wncq0GfGluYHEnwcwt1oREemNWxvdGtV5rATUhZisrtLmLf6+thIxGsyjEXSUCyXv
         FswX3LlRToL2g0U700lFE6maQEupl82vZZp9lOQCGBUjNqKyhZTpwQffLZ7z5zE6g8BP
         s21GkOZv7PnLCT05hCJwIQX5QGW+QvmyiMafr3dFFwuVfvj/fSnVNXyRsoW0ete/Cmm0
         s37jxOstrvIE0VWbnoM6FDskalvRIbmQuUqRsS2TBNafIdf0rdeEXhsfxjK+7E1eNlzN
         VEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689111389; x=1691703389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NrSX7PhPKOGnA92pPm2YdNBTlBhRtkFT2QjTzX6SGZI=;
        b=RRoJNnMzs+TisNPLnSJaiEN91m1M0bus76oBzVE2zaitYEHtIM7Nv5DVa72HTeGfyV
         XQR7qdhOynhoSLZBTJdfLCqzBTlNySPC3OjBRgqgeq4DR4IGTHupN2DWkLeagOCdxmEU
         a01NFINCPhMSJosmR9IcH+rw9GCOWm2Ki9Q0uppF16N7m0f0ow9b3lgoyOVa9WpX/+Gs
         UjK1vyFmDQiqQ9DZOzbcGcR6u41cuYGd9+5yZIKkf0EXgTVKjA5kCg2U7tf3ITm9QW6U
         yAvC5pk3xe45ZwEIdc8+qfFvSEYTx3wKHH+SnjYTH4/X3h6fEQAcsU50VAKTGkItgpmn
         FjUQ==
X-Gm-Message-State: ABy/qLYaIhonlP9HesKniqFyAFjeTmoL9dy0yjEpSBb28n1mchPpOXPu
        Z8MSoZCPFtUD+YBr1VSbvobBPbslU9c5jXGSuyfyPQ==
X-Google-Smtp-Source: APBJJlFUOSi8MCkUH+Y0rUL8y5Im/qUftlZYctWGmBHInd6hTEn4AKz8A/LXxDZ5a/Ta/o2gsyLoCw==
X-Received: by 2002:ac2:5b9c:0:b0:4f8:6800:86f6 with SMTP id o28-20020ac25b9c000000b004f8680086f6mr13412888lfn.49.1689111389300;
        Tue, 11 Jul 2023 14:36:29 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id t3-20020ac24c03000000b004f8730eecf4sm453442lfq.184.2023.07.11.14.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 14:36:28 -0700 (PDT)
Message-ID: <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
Date:   Tue, 11 Jul 2023 23:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9.07.2023 06:19, Dmitry Baryshkov wrote:
> Add the nb7vpq904m, onboard USB-C redriver / retimer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]

> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_phy_con_ss: endpoint {
> +					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> +					data-lanes = <0 1 2 3>;
That's USB+DP lines combined, or how does it work? I'm confused :/

Konrad
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				redriver_usb_con_sbu: endpoint {
> +					remote-endpoint = <&pm8150b_typec_sbu_out>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &mdss {
> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
>  };
>  
>  &usb_1_qmpphy_typec_mux_in {
> -	remote-endpoint = <&pm8150b_typec_mux_out>;
> +	remote-endpoint = <&redriver_phy_con_ss>;
>  };
>  
>  &usb_2 {
> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
>  			port@1 {
>  				reg = <1>;
>  				pm8150b_typec_mux_out: endpoint {
> -					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> +					remote-endpoint = <&redriver_usb_con_ss>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				pm8150b_typec_sbu_out: endpoint {
> +					remote-endpoint = <&redriver_usb_con_sbu>;
>  				};
>  			};
>  		};
