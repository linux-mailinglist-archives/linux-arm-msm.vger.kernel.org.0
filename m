Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67B75FCCE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 23:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiJLVQy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 17:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiJLVQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 17:16:53 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40047CA896
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:16:52 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h8so22617lja.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VBSiNNdP6Vmjj9hybF4bhmKiJc3VXo8jl0DctURnTs=;
        b=FMP8F7ZeA1LdcgtFQ8df8rDtUJqjsFyu+sNiLiJSYqr86TP1Ghf0Me2o0hvpcH/65Y
         a4W5vMVWeshNrtI2p4b/QsL0TgA9Nmt1ruVkTl0xmF2qZOfA+sOwK5p5t/L94OYjfa0t
         ttj0cYzZ2CDGZnSTSfKL6PsN3D0GhO5L8vIwtDjldDjSshCKjM9q4UlvCrJ6QAiACiaw
         Cjd1r08RnSoba2v67HDfJkSsdXQgsjqeiBz4+nxNV5CSwovN4IOXJiuoz1/r/F5AVbi6
         dtMVa+0hj+5mqdBtD1SFI7uaqf18AWjuyyWIs1CC1PS+2QceBdfVwkJ4R+1VX2ocQDwA
         8YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0VBSiNNdP6Vmjj9hybF4bhmKiJc3VXo8jl0DctURnTs=;
        b=iQvSOHvPlaxurxHTGXO5gyRA7GtHEmjuHPP+Ns1HI/kE6m1WEexmxtnvGSH5SljxHY
         pv2uk7cJdoqcX3G+yLczv/KnEzOLoz6mNsZwus3UmKW/gW3hwbIg6CD3SGxBLOkbrfK+
         1UCWyaab/gSko0opzRAJDUi9fgHfY4YntkMN3l+626ftbkt4JeJTUGxQ9mQCv8KgL+5a
         HmRTE/DZCbGOubikVI/1rz2tDQiSypUexxDvRe+9fLV6WZc3SIqrBvfsIUuVjwRawu2J
         Ub888UK/4SqdRNHEko9un5J10y0D8iGmOYd74Vqd4BBgNBWLaQyygPEcA8jRKemQCmXP
         Y5aA==
X-Gm-Message-State: ACrzQf0SW1lCePhymMMPwJWyQW3Fs6pNjAYU2KdSh9UQq5TBQpnCux/B
        0k7ACldFsFt1qofLLoVvr67c9JvMgFbRNw==
X-Google-Smtp-Source: AMsMyM759DAF2IJ7L6BA6YB2h2c5K0FjBvRsLYu5HqIy1exNyzhwKavziTnQkKo5Uy72UVJV0PyOKQ==
X-Received: by 2002:a2e:a889:0:b0:25e:3d55:b092 with SMTP id m9-20020a2ea889000000b0025e3d55b092mr11979006ljq.402.1665609410477;
        Wed, 12 Oct 2022 14:16:50 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j28-20020ac253bc000000b00494792ea34esm99484lfh.273.2022.10.12.14.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 14:16:50 -0700 (PDT)
Message-ID: <41f7aa58-839b-b8b6-8b81-24f9c06c5503@linaro.org>
Date:   Thu, 13 Oct 2022 00:16:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 15/20] phy: qcom-qmp-combo: drop start and pwrdn-ctrl
 abstraction
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221012084846.24003-1-johan+linaro@kernel.org>
 <20221012085002.24099-1-johan+linaro@kernel.org>
 <20221012085002.24099-15-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-15-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 11:49, Johan Hovold wrote:
> All USB PHYs need to start and stop the SerDes and PCS so drop the
> start-ctrl abstraction which is no longer needed since the QMP driver
> split.
> 
> Similarly, drop the pwrdn-ctrl abstraction which also is not needed
> since the split.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 29 +++++------------------
>   1 file changed, 6 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

