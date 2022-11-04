Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74ED461998C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 15:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbiKDOWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 10:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbiKDOU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 10:20:58 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B3D2F662
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 07:20:56 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id w4so3128302qts.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfe4QYAii/msXqogDnhvJDFD5ejC6/JC1TdZ0YZAnVI=;
        b=FyxE3aSUOkrzTK/QGnh5iwhxJxO5xXxYiHBPnlQynz1BLSctcEwCGCNrK6jxH+LRPN
         wi1al9drpsMVRxUoR0smZMxu2j0mE5aDRe63spjQNFBvpSYaL4yGKIkul4xq2Rugb7fZ
         V7qB0ImNu5yFaKKtsEJuh/eNL9JRTut59ys/uYhHfRd4dvXiMmVoa1rOn7plCP9oaH5d
         jkbWivYhY3PKK28TERpxgGsz5NoijL80qEi5BHDFkAD7CvnA69T6mVIPrh/qdzeSLXr4
         yAT+AOvd5JcuxdulYEJoJxCmT8saxJNVW8KLNMH1xnGGBzgKBtMyt5RaiOkaZuw/hqls
         IrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bfe4QYAii/msXqogDnhvJDFD5ejC6/JC1TdZ0YZAnVI=;
        b=As4b2/RI6pfgc4WhTqB5rxdS3+LW4kdqlaplJnYjh1bIAtOavGPJL4nKA133yJoDI1
         XEBKp5wcM7/pJMQuBPHM+ESteNU29BOLOhn3YpORmjGIEPKcuSDH2jaHXODBUrrbXLd9
         d+2Zmhj3K5xbEo2bmeT33tZYtI0rdBhmokfHcfgTrLJp1uZs7QHh2nkK2AWHM4MH5cRe
         ZWUmqJqTl3foxGFt3glaYsH4ACY0x5am/IukR18EFfzQmrK3dNJ6eLJS5VGNSmFmDaDb
         I/yaYzu90XMkMqid6WBMrw6Kq05i4ZBTMnITcQxiXVPoBF+0JOhv3Lq/6wfkCkottxg6
         Oawg==
X-Gm-Message-State: ACrzQf2hNrRBiYPNbCVYfO20IdK2ETSpk1iYM39NO2ugiiKvZKc2Y9RG
        OZEEtvPqNI+Aw7oh8XJuPnsP6Q==
X-Google-Smtp-Source: AMsMyM7CV19Vj9XYnilruJJvftU1TZeOxpARoRc6S+ODrtdXMN3RA8hrkRGI8BdB7SK5VPuSclcvsg==
X-Received: by 2002:a05:622a:1ba2:b0:39c:ed3c:6310 with SMTP id bp34-20020a05622a1ba200b0039ced3c6310mr28888623qtb.516.1667571655926;
        Fri, 04 Nov 2022 07:20:55 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id ey21-20020a05622a4c1500b003988b3d5280sm2518844qtb.70.2022.11.04.07.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 07:20:55 -0700 (PDT)
Message-ID: <aa1c6223-e56c-b0b3-ed74-25cdeee36fb7@linaro.org>
Date:   Fri, 4 Nov 2022 10:20:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/11/2022 09:13, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add the HDMI display nodes and link it to DSI. Also enable missing dispcc
> nodes
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you for your patch. There is something to discuss/improve.

> +&dispcc {
> +	status = "okay";
> +};
> +
>  &dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vreg_l6b_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +

Drop blank line.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

