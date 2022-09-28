Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1A15EE610
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 21:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiI1Tx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 15:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbiI1Tx5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 15:53:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7517FE4C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 12:53:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j16so21970401lfg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 12:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZllO30PO1yeROYtUdSMa6Q/H6OxWdD+P2ikW3S83Lss=;
        b=ibaQtNJzs8kG3duQWJcLYvC2m9Jy0BYqM6Cfj2FSXDrJYqMBGi2wh2OgSFfQqekfxE
         z1o+/0uPw2bzU6/GqNmz2T/ibUM1LhYPxXFPLsaHmp5URlFcl5ftXDjSLkAAJZaHxBn0
         yNmNxUU/14uD3qyRTEJQjBIV56tY+3Xs/LCEstIkkjXKrSusfXQ5KHlMeDIrMln5exGg
         7/AqavVdjmc6rdx/4Ylxl8NbPZ/Thq4WkrDJpKYt8NvvLNR7/v1L7rH/ndpllb8hS8v4
         I1rBrK9hevidWE1fdwwBQbAQkKfNtB0soUMaD7QNS38krtmM/MbEA8PCUnpZokhIuIMl
         edmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZllO30PO1yeROYtUdSMa6Q/H6OxWdD+P2ikW3S83Lss=;
        b=6IvAK5tH0JG02D5dUodFrTsJL3MP87/9pRcruekX4NuOQMHE3d10Ugdharv4lNpdGM
         uYqJ0rhm8FoGjGKm9sm+Cydt3O+oYVI/6RpgcCcONw4bLgsBD0SxlQknP01/r1NeyqyP
         JDDxbnLS+5PnppvLonSp0oWbo11lGd9zicZma/IXbnxX5tcBXk7RDZPklZjWYEoW7m+r
         X52gZSflvGqhauIrln+5NsiBewgmALKKZQvKpHUhgs6Ah1fKgtlSWhli6FE4Y+hPfQUP
         9v2X5puoN2BjgeYEbpAD09A3bf+nDGaFbK82Ftn1an84fwNSDzYnRf3Npe0dOCDEQp+k
         T4Ow==
X-Gm-Message-State: ACrzQf3P3ZLKYX9d9mL1yJ9AQgLfFoLKnZexKBakzaVKTlqOKPb1GBoq
        RDqRa5HCI3msvYiJcP+MZTUnnQ==
X-Google-Smtp-Source: AMsMyM7km8qhluCC9hWcHc8DaqLBPryy1gqwvYmJLpN0wkSUCa/4AFBbR7zmIjRJYpLYT3PjHEqFAg==
X-Received: by 2002:a05:6512:b1e:b0:4a1:ba8c:7ea7 with SMTP id w30-20020a0565120b1e00b004a1ba8c7ea7mr8341594lfu.608.1664394835262;
        Wed, 28 Sep 2022 12:53:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h4-20020a05651c124400b0026c1cbbf461sm531018ljh.80.2022.09.28.12.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 12:53:54 -0700 (PDT)
Message-ID: <3832dbf9-17dc-9c08-0051-aeaea2394000@linaro.org>
Date:   Wed, 28 Sep 2022 22:53:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 12/13] phy: qcom-qmp-usb: clean up power-down handling
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220928152822.30687-1-johan+linaro@kernel.org>
 <20220928152822.30687-13-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220928152822.30687-13-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 18:28, Johan Hovold wrote:
> Always define the POWER_DOWN_CONTROL register instead of falling back to
> the v2 (and v3) offset during power on and power off.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

