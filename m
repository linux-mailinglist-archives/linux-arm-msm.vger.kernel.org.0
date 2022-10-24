Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7647D60B680
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 21:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbiJXTCH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 15:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232491AbiJXTBm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 15:01:42 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEC733A07
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:40:49 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z97so32806701ede.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 10:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xaMm78fM2rUZsQPmBvYXK97To/2DK/rtGwK+0qiEt0=;
        b=r0gnmUhcfoDGmqHuXWVGnOZ8m4Vp2E9CRPBUM3zSGQ0+v3W6eCljPT1bVvefZLqlqN
         CGqHJtZZLjGOgMNOIzZDNUye2auuKVXnxEvNaDglhe+BOT4HQj37jr3Ot/fI3gvN1ByX
         M/d7ZLuzCaSqlvDb2NgSQDH0Mh+QStyVva74R/oPhm4lBYRxLQGKRQiX9EOjbGqDjPWx
         upfpa2Ybp5OkLnYWBBT7X9QSv/EJ5+ZvUANae+mqQdmPjY2P96gPAWAxOJUyklj5bRyk
         Qr6x+4tcHzVmHvcnPyOt+9PKe8Eyx8J7tdoTraqOIHakQI+MOCd/N4Vtv4/ic2g7wa8w
         UDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xaMm78fM2rUZsQPmBvYXK97To/2DK/rtGwK+0qiEt0=;
        b=zQutntTURK0SD2rYUUUc93SsyVdejjnPxEmvuiInPMtEn1l8sNAsIHts6WhhCIUeqW
         EDiMyIX3z+kIsaNyFwGvjHDyC0RSWGnjyk0XwLeWyq81eYYKhhTLgTo/zOgrM4KeS8sp
         CYNlDSh/ta0wgw8g8aDQkMfbgpNxDS4nZLIS7C1B2tIXUOz7kIzi4HBbMUCbE4GbJiZa
         Mr+zvJakiVw+m7aieCWg6F/E5TmIwQPuuTTBUYL/PNs9QFuMhTrwCMXNSVLB2+C6IRly
         +0Q0TSHjOirz46vJTK4D3m52wphgWDRZM5moFKOTvHNNlCVZIXu/uz6/G57ik+1ZlG7m
         KsAg==
X-Gm-Message-State: ACrzQf3xlGBHM/ixeThuJKxA0i/p1MRCfN2HfFAqWzyQ6672fyqIcCb1
        5pFyQazZxmV/lEW2mjVegE1fqE/eGrtZlDtq
X-Google-Smtp-Source: AMsMyM58S+kwJjzf/AcosLQEKY92VlM/X/zNBCksGzwTStER3W9096fbJUbGcKmYoC1waiUXkJ7OAQ==
X-Received: by 2002:a05:651c:1950:b0:26f:ec78:6178 with SMTP id bs16-20020a05651c195000b0026fec786178mr11284200ljb.98.1666618374256;
        Mon, 24 Oct 2022 06:32:54 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i11-20020ac2522b000000b00499bf7605afsm4545272lfl.143.2022.10.24.06.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:32:53 -0700 (PDT)
Message-ID: <614b03b7-e6ff-bdad-449c-b84f840b2e1f@linaro.org>
Date:   Mon, 24 Oct 2022 16:32:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 01/13] phy: qcom-qmp-usb: fix sc8280xp PCS_USB offset
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024100632.20549-1-johan+linaro@kernel.org>
 <20221024100632.20549-2-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024100632.20549-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 13:06, Johan Hovold wrote:
> The PCS_USB register block lives at an offset of 0x1000 from the PCS
> region on SC8280XP so add the missing offset to avoid corrupting
> unrelated registers on runtime suspend.
> 
> Note that the current binding is broken as it does not describe the
> PCS_USB region and the PCS register size does not cover PCS_USB and the
> regions in between. As Linux currently maps full pages, simply adding
> the offset to driver works until the binding has been fixed.
> 
> Fixes: c0c7769cdae2 ("phy: qcom-qmp: Add SC8280XP USB3 UNI phy")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

