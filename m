Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE42B5FB3CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 15:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiJKNvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 09:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJKNvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 09:51:14 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111CA4D804
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:51:13 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id r22so15591883ljn.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7C53GQvIdU9/jPt0DvQ7RGs3HsrImwAzRzdet7zBxdk=;
        b=C0qShA64hgwnpZF9CF9ghDKd7XM5n8nD2Rw0ReoVo0NxmoK/laSJ7KpbN3S9FbmFN+
         EdfYX8E7FI1st6TpffyR+0GVYXYZTX52j3MuR+fmP4kgU11Mni2rE4G3dCHAv3lvE4rc
         L0Br4rdWBpTUuKTRZQeNmTPyinSt85eIg/MXT5Rp25H6rWdoFnm2LoFLqVMQoRFkvnPu
         uAbPwuZytW7ZwGthddtPya0OBD+7GBa9wd2DFnB+ExggZ68JMwtePdByKxBwbjkR3Ihi
         opIIN8cWm1AkRTRfHdJbRuqjlkAhhdPGD4jQ7YPVV3fj6YuIuVrk9arQ+xdMXdTKM+nx
         VmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7C53GQvIdU9/jPt0DvQ7RGs3HsrImwAzRzdet7zBxdk=;
        b=MN9D4zHPxWiAEWLv85XjDx4W7EsvQq4GIc9XcwcTudB06zGobWfE12/DM0xe8v1y1M
         MsDv1Tl93toLMosDAdpLJkEbHxM1OGLsctSZ33/jWxkvDHOkD/y7zkS3QraA+BKT1Nu8
         Ec1xTo4MEffNt9VLTGcF5ja+rV2an5X1Jc978iZOoREL5gROqN9lP/RN7DEQthXXlNkZ
         Us9Fk3f4IbWecMo2XqcG7gKHqZtsmW5YtbCOjaDbW5jAGBkjxLFZ8fm6ZqZ3xcloDXOy
         NPxlNpq5jrregr2A/lnohzxanY+d+oORtq3hv8McNnjZYbvnIUEieuJczJw3QJFjaZLL
         XbXA==
X-Gm-Message-State: ACrzQf07PLvNYdU6e8Zp5oFbRI1SOWzvMs1vbfuWfLi4CwKU9sbEkp5K
        d6WdwzVpTJLHyJW7hRDUMz4Xlg==
X-Google-Smtp-Source: AMsMyM4vEHz4t5t74S777ZaRAebiTFBYZxtJzXJLzjMeSZG0u+PM1IllE4+HMCgb6gcSt/PruJIb1A==
X-Received: by 2002:a05:651c:210:b0:26f:ab6a:87f5 with SMTP id y16-20020a05651c021000b0026fab6a87f5mr3256979ljn.506.1665496271444;
        Tue, 11 Oct 2022 06:51:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j15-20020a056512108f00b00498fc3d4cfdsm1868925lfg.189.2022.10.11.06.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 06:51:11 -0700 (PDT)
Message-ID: <c483351b-0728-2084-59f3-ac31b255cce5@linaro.org>
Date:   Tue, 11 Oct 2022 16:51:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 04/13] phy: qcom-qmp-pcie: drop redundant ipq8074 power on
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221011131416.2478-1-johan+linaro@kernel.org>
 <20221011131416.2478-5-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221011131416.2478-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2022 16:14, Johan Hovold wrote:
> The PCS initialisation table for IPQ8074 includes updates of the reset
> and start-control registers which is already handled explicitly by the
> driver during power on.
> 
> Drop the redundant register write from the IPQ8074 configuration table
> and along with it the now unused "in-layout" configuration macro and
> code.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 42 +++++-------------------
>   1 file changed, 9 insertions(+), 33 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

