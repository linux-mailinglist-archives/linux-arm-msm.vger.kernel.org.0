Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8AA45FB416
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 16:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbiJKOFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 10:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiJKOFv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 10:05:51 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E88A8FD40
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 07:05:49 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id x18so8393570ljm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8vXGY2FQD0SmjquwVrvQMgguyJMrvlVrQ9GO3c0qOHM=;
        b=HkGuYtt/EZyPyD9ckg/JYMMda1MAxj0DBMlo/GDBvLTh3AKZ7WW2AIkLAx0b+E/8br
         zUila7U6c1voNoKmeB+k85RHDCck5geZ9Tx18LMvkMKwqQ2d0yvwogHPyM4IsUWYERAB
         jcJNGedzyPu8tGWv0hhkQyEbWFM2k/yQY3H6bmvu7G3OGz5Gjl3f0Yo0R7J7HD4yOshm
         BJ7alVpacFwCVTdysKBTTLNZ1XyeHKVd3TBn1Z9UudF2qMUguj75BP96/WL6Gfq8Y50j
         PRgMY6eIhEnAl4qYHU1JPFFAH4JaXu3R3IJIySTW0XEgLI8M0JdCaBLYzzshr8rCAKd7
         cVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8vXGY2FQD0SmjquwVrvQMgguyJMrvlVrQ9GO3c0qOHM=;
        b=t8jaWhYQn0I7wyvj4DCPTQjSKMPCVAaxiM6oq58HT1oeBwbxVUBSxnSZAu4+dHrn5I
         pYrKYCgfbG7UKw/ZTxm0qyS5MZFJwKfiPjgo/mw2YctPOl+yLAMa46Rg0HG+g/uvnMSx
         zyvq+isqKezK+QTWb5nXDD9lXA+EBaXgrYuI8FRKw8ftCOeeXkPYF/VyuslgZWbFv6RS
         EnADyfm5WNtHjZ4yzW2PGQuqAwBOElE9QdcV9D01nTOZr2ya8HXt5e5ufucOP6VotQ91
         hFfQtziPBZzMV/Gmmx7ltQV4MaISoSZ4Wy9aDnpbG3hUO947kfUMHmCG9vnmDoIHwgF/
         w2Bg==
X-Gm-Message-State: ACrzQf3rBodzmVB3bRRZdkl2vkVU36XDg2Huqbs6OjKYgnJ/Ant/3LUi
        QcIGNKCNXicrNFap8+lrMXlhVQ==
X-Google-Smtp-Source: AMsMyM4oVTsQAm4QAWtn9JgMcWAYzDKMUyCQcIEkLooLNkHTIKRbbJ5kAke70XfECNOILD6oPqQJAQ==
X-Received: by 2002:a05:651c:158e:b0:26b:46a6:bf63 with SMTP id h14-20020a05651c158e00b0026b46a6bf63mr8530052ljq.21.1665497147910;
        Tue, 11 Oct 2022 07:05:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q11-20020ac2514b000000b0049f54c5f2a4sm1868188lfd.229.2022.10.11.07.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 07:05:47 -0700 (PDT)
Message-ID: <236ee060-4001-992b-a1ee-b40c66fb94eb@linaro.org>
Date:   Tue, 11 Oct 2022 17:05:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 13/13] phy: qcom-qmp-usb: drop power-down delay config
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
 <20221011131416.2478-14-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221011131416.2478-14-johan+linaro@kernel.org>
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
> The power-down delay was included in the first version of the QMP driver
> as an optional delay after powering on the PHY (using
> POWER_DOWN_CONTROL) and just before starting it. Later changes modified
> this sequence by powering on before initialising the PHY, but the
> optional delay stayed where it was (i.e. before starting the PHY).
> 
> The vendor driver does not use a delay before starting the PHY and this
> is likely not needed on any platform unless there is a corresponding
> delay in the vendor kernel init sequence tables (i.e. in devicetree).
> 
> Let's keep the delay for now, but drop the redundant delay period
> configuration while increasing the unnecessarily low timer slack
> somewhat.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 35 +------------------------
>   1 file changed, 1 insertion(+), 34 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

