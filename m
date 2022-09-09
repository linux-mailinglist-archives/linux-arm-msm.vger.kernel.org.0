Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D0E5B341E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiIIJhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiIIJhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:37:20 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C73096752
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:37:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i26so1704261lfp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=x8Y3CR3NsRCi8B/rXKSFsQwnh4mKoxTQWWbEyouuflE=;
        b=RN5XvpZ/B/VR7eGmUkJG7k3fsmmyfy1EQi4hAukLN/ScIYtqSrf2MveBet15oxoig3
         8OCsPzTi47xYK+sufbtwtSFcSD9tN0rsP7VsYNI4YLg7qpWDuWvjJvkqeftF2YkVnjGx
         +9uBdTzDXRbg0vWG8+i9gtBbtdrpyXkykWBuLeOSz20HVJT9bmEUk+ZncDr7LW5avU4G
         JqRP45HEYLKom2cImMryw2Ckzp/Xqx+V8SAA6kyOYrswCkFplY+U3+jsQizvrR58pN0h
         w4Jr+N1mzhpTHSvJejZSGbP/tV1XCKN3EilosX63LsB1rs/W1Tq1T0Wk/G4EJgXWFhgP
         bRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=x8Y3CR3NsRCi8B/rXKSFsQwnh4mKoxTQWWbEyouuflE=;
        b=hoiyVlIRav9pvcSveJ0QAL46pWlp8RGny5MAXAKi8/fEp8tk8GjkbVtMezCYDpwg93
         wOhHQUea5c/fp6NfsEZyRFrE8SKBphUXbUt7zhg9bcVR+5SR1qPugGXyl7CoSnToSQNr
         2pUklD/lfSyC3DqE5rOWqLPytDDy7+gscPI8jtPxmQHqJ1q3SmpVEmOuUvbCMbruG6t8
         d3R8QrUyyvnnHOEM7OfCkkZio69uV69CxiIZbH/k5nA0TSKs7i4tUHcIV0RlCbCkU4dg
         JJAqNfjANsxJLy/XtcY1JvRU+zjps9m3yJm4+/NRcnDWZP6rusEghBFxdDXup9OchC8t
         3t2g==
X-Gm-Message-State: ACgBeo2XsrPnqbnQselHjMr11O6klgXkqCRXrEJE7uNAoOKg+AnCRKvm
        A2VP3YEpZbOvRqQPX2RWPz8+IQ==
X-Google-Smtp-Source: AA6agR4tg4jDITyEd+ydvsYoqEXDelr0wc4PV5xvP7VIfd2Kev1QD0c3wkFIFMxlcvNPq76ds93jsw==
X-Received: by 2002:a05:6512:3f18:b0:492:ed03:1aa8 with SMTP id y24-20020a0565123f1800b00492ed031aa8mr4535166lfa.515.1662716237850;
        Fri, 09 Sep 2022 02:37:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b004947f8b6266sm5732lfr.203.2022.09.09.02.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:37:17 -0700 (PDT)
Message-ID: <a1a29ffc-f0ee-7b26-f342-b4c99e1443c5@linaro.org>
Date:   Fri, 9 Sep 2022 12:37:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 04/16] phy: qcom-qmp-pcie: drop unused defines
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220907110728.19092-1-johan+linaro@kernel.org>
 <20220907110728.19092-5-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220907110728.19092-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 14:07, Johan Hovold wrote:
> Drop defines and enums that are unused since the QMP driver split.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 24 ------------------------
>   1 file changed, 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

