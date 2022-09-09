Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C61B55B3426
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbiIIJi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbiIIJiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:38:21 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110C6A4045
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:38:16 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x14so1713504lfu.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JSwEzblR3fhWzgBxSTAfIwU+U86WjgXDoByRzUfVV8k=;
        b=xc6HNMUXBP+pMU58wN211x4B9/0BQOvwZNSoA19lABQH94ATxm/ucaaixyIDuFiJtO
         XSw2RvhSZiFm/qjKWpToNJHCbBq2fcVOXTbjhx1jhoj1nN8TgY3DRjIm/4JlVWLaoyQP
         X6nGBPuO1Omag4pBHqviM0hjpiz/gxYckF1pJX83ZX27nEN+unzsMDYWtxycOW8HtgJ+
         T46fEFEVLkmZ6QkylccrXQx3o6omJY6BHr8KKLQaEJxt4dyXH/BgR8kqUEbRR4dBh3TY
         yDyq6ZoK/ui4rrtrxte1/g6Z1oXLSwuxM3rJq9T9veEBp/Try77mzN362wTyDZN01KRX
         czSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JSwEzblR3fhWzgBxSTAfIwU+U86WjgXDoByRzUfVV8k=;
        b=QL2Oo5miaofnq8wZeXQ7nLrpwXCfq/GAZf75WlzkclKFNlh6VKnkzIvo5/DV0+EhE/
         xrbn48lizeuHM7Asd+urmg+MFi2SgB5spcaj94GjFFCf+daR3QyxzyFUlrwjzdPHa/wV
         3kMKVXmaxNDIfvUfzumpQCp1KdMKpPPunvHwKXoLJvvSAs+VU6n55bTEXxQTGIM4JeHS
         FXi0jX+iQ779wyjwgMwxYpQZ1pER8AqWnsBRmtILrRxptwHIpD8hHlLImLSkIedGkOQp
         h3s9GPsVf8Z2q63W5LYzruiacETvSTF46KxV+0YBB3i88zrq6GBJj1CD6r7xz+SZEjB+
         QF4w==
X-Gm-Message-State: ACgBeo1xLGUsI1Tto0kvKuaMrI4HsFBCp4cYKFAG9crcYKd72yc04Sts
        MihSw6yDXAoFyw/y1fb/Wf02RQ==
X-Google-Smtp-Source: AA6agR4NQYf8/THkyhJ6wAWjtOvtzgin1YbJhxuhdzx9K4OkyEsreaPjW/UACP7UY+bPxSJce9khgg==
X-Received: by 2002:a05:6512:4014:b0:498:fe3c:d225 with SMTP id br20-20020a056512401400b00498fe3cd225mr436012lfb.198.1662716294357;
        Fri, 09 Sep 2022 02:38:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u26-20020ac243da000000b00498f1eddad0sm11297lfl.122.2022.09.09.02.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:38:14 -0700 (PDT)
Message-ID: <fc18cd9d-554e-6c49-aa77-c55a922a1a56@linaro.org>
Date:   Fri, 9 Sep 2022 12:38:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 07/16] phy: qcom-qmp-ufs: drop unused runtime PM
 implementation
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
 <20220907110728.19092-8-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220907110728.19092-8-johan+linaro@kernel.org>
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
> Drop the unused and incomplete runtime PM implementation, which was
> only used by USB PHYs before splitting the QMP driver.
> 
> Note that the runtime PM was never disabled (and state restored) on
> driver unbind.
> 
> This effectively reverts commit ac0d239936bd ("phy: qcom-qmp: Add
> support for runtime PM").
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

