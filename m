Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785015AFA7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 05:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbiIGDNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 23:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiIGDNm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 23:13:42 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A979BB6C
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 20:13:38 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-12243fcaa67so32939953fac.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 20:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1mTdsCO/C/kKFVUDXTpaJIDkd4ZzQbzIR100ilftTDw=;
        b=DQGYv3f1y/izQb9VyB9W34zZIJM58Y820knw2g/InwtGC39kpt9jACDjy1eHqnqotz
         Kf/Sj0JRWsOKhQBO8BvwR89xiVhXI7QOykOw4Pcv31vCYYHXIse9Q+OKbRYnEva1yvCC
         u9kblV7dr6wWRPQIphZuZxp+xnS9O4uglEugfbwA1udv8dwy0bYgyYCHDQibDuzeTSwh
         UbHwirFoB1hwfbOKsyFaSLKCtGalre8d71VB9G228aLZNwOLBHcynsQgtRFgwihD+I9y
         /YnQE4tggrp6+or0vJHrLOwUoP6dbsS/pbIlZGKkKLuC+ZMs33VLiUzxW3uyrSM9cXSK
         K5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1mTdsCO/C/kKFVUDXTpaJIDkd4ZzQbzIR100ilftTDw=;
        b=donU04PkXY6qJeqEGww69A25Onml/mXoQzZdkBWja1GotMp9b2eYJchBBIvzIRhzy9
         VyTwXktVF2qdv1uip58lBbyuLR3Es3neq2GHN479mm2oj8gaAouj1CiFb7tun6+k9FPH
         mZzlwjMNfne16bdG5RonBSVCRTodW1BKdil39gA7oRVvYk5iO7SrjMj+rXLNQKsVuw18
         NKYr0ASQbMgqsR988BgxkDNnrerASzN0VQ8XqURkzlGwl/9Y2DkX9e2jMG+wqhD2pty5
         OxbqJOEfKKWbCHCgjpbwWYd5WFCggUL7l0OZ/6LsaUAIMURz9sphrL18Eqyh8yf8glbl
         2UGw==
X-Gm-Message-State: ACgBeo2svFjxC7sh5MN/qZKUinluEsstQ9T5R+RFfysXOTBsYZdjvBe7
        2nxPpIwbsYUqrFgcvowyAlfpOw==
X-Google-Smtp-Source: AA6agR7T3ZTuNpjC4WMaA3SzZ1O+ChrWJObsA64PhQo+0zwhx/96DUxfuj4+R1eTpDzawH+Z0rFdfA==
X-Received: by 2002:a05:6808:199f:b0:343:3592:4dea with SMTP id bj31-20020a056808199f00b0034335924deamr621173oib.163.1662520417678;
        Tue, 06 Sep 2022 20:13:37 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id k13-20020a54468d000000b00344f28a7a4csm6080422oic.22.2022.09.06.20.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 20:13:37 -0700 (PDT)
Message-ID: <01a61121-d4c1-b5aa-928a-dafef74996c1@kali.org>
Date:   Tue, 6 Sep 2022 22:13:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm845: Drop redundant phy-names
 from DSI controller
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
 <20220907000105.786265-11-bryan.odonoghue@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220907000105.786265-11-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/6/22 7:01 PM, Bryan O'Donoghue wrote:
> phy-names has been marked deprecated. Remove it from the sdm845 DSI
> controller block.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index f0e286715d1bd..813af058fdec4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4511,7 +4511,6 @@ dsi0: dsi@ae94000 {
>   				power-domains = <&rpmhpd SDM845_CX>;
>   
>   				phys = <&dsi0_phy>;
> -				phy-names = "dsi";
>   
>   				status = "disabled";
>   
> @@ -4583,7 +4582,6 @@ dsi1: dsi@ae96000 {
>   				power-domains = <&rpmhpd SDM845_CX>;
>   
>   				phys = <&dsi1_phy>;
> -				phy-names = "dsi";
>   
>   				status = "disabled";
>   

Tested on the Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

