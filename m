Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD141575F9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 12:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbiGOK7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 06:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiGOK7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 06:59:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BA681486
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 03:59:38 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bf9so7185198lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GBmXbS4sCCl5rx50+uIDLqX6ff5PcqAcBWqbK1Ns69I=;
        b=LxD55eEwo/uIa552Wl2ttUkvkBFjB5gbufpNK0JiZzVzguDKGy4GV3KZODz8I1Oo4/
         wrzg7MvVJiJzO/piFcSOd44mOd02VfE9/Ocl3IWkp/zSEKtfc1u6LqSCaA79wS0EbDYK
         dPKKlhe5xCsUj/7B4s6z4BvUpvbCtEQa4ocD4Zf9iHusA1q7oNl86J4Va3ZK9uX/Qmyn
         GTsYNR6//O1YARbNTlQPSLPOSM/DYCBYxgp6OQruEwQ/JraE0yEfoHYv/0vOUjhSeSrv
         ttIPSDJPAgZC7yWM3GGRv2S5i3fs4GIXIONolLfye0JMlsbwdq//xI+DDOI4bSv6kKdn
         dLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GBmXbS4sCCl5rx50+uIDLqX6ff5PcqAcBWqbK1Ns69I=;
        b=Fo/MhU15GHfx/Ol036NR45ctcMLLTIXuoaI+M8DL8PFGMP5Jp8iRw7QhyjxA90wagO
         yIsk8xgfK2GXY+hJNTeiv34XFNI4Dv5bzxBCPWVa/d9UPq9S1JOiI9mLpJOq3FG1vs3L
         WxjOBk6AOeCEOhvHCTifG5SyZF81dCxv2mWoHQOLOAoazTMi0MPCeWhwc6No2LYy61+N
         c2VEEjt0gnAT3v6CkN14GfLuXCwzFHEA7p+8/F6uobG2YqxaHPT12YsILEwgHN6yErKY
         xEZ3B9JnQ9Bqps8wHtMoEzWbbvxY3fnYnP8HhOAFLQsYk+9m9sRP7K99uNlXHC6EJutu
         bM2Q==
X-Gm-Message-State: AJIora+icnwfUvNVUWpycplBdaTF0tWFAnuBq2i2jtXZqJfWONDAse0U
        tP+Ic6eQUUrVx3F3Pjc+F5SqAg==
X-Google-Smtp-Source: AGRyM1vskZB2XS3F97xZuPCHS4RFNBtV0rM8xtVWvVtraR4XxVbfgQ3bkC35c5EWy9GsQVsfM4vwVg==
X-Received: by 2002:a05:6512:33c1:b0:486:1f96:505e with SMTP id d1-20020a05651233c100b004861f96505emr7685792lfg.690.1657882776411;
        Fri, 15 Jul 2022 03:59:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 5-20020a2eb945000000b0025a65ed7aa4sm721903ljs.51.2022.07.15.03.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 03:59:36 -0700 (PDT)
Message-ID: <98998938-9637-b602-be2a-0279ffc6e7ef@linaro.org>
Date:   Fri, 15 Jul 2022 13:59:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 27/30] phy: qcom-qmp-combo: drop pipe clock lane suffix
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220714124333.27643-1-johan+linaro@kernel.org>
 <20220714124333.27643-28-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220714124333.27643-28-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/07/2022 15:43, Johan Hovold wrote:
> The pipe clock is defined in the "lane" node so there's no need to keep
> adding a redundant lane-number suffix to the clock name.
> 
> Update driver to support the new binding where the pipe clock name has
> been deprecated by instead requesting the clock by index.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 


-- 
With best wishes
Dmitry
