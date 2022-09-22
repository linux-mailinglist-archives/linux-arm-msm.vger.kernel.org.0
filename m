Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1BB05E6A4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 20:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbiIVSDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 14:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbiIVSCt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 14:02:49 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBED107583
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:02:22 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a14so11929070ljj.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2ykei3W9LQd1RzBfuNAPmmjbg1pi4i2oQK8s3yOPURE=;
        b=Fyk3AqDThJ8EGj7FSaldRI6IowkrpiZevbhXo2BiH5oMLJQdzO9NAyGGNtgkrO/h+8
         hbfhotTECYP/YlelL8KHDjVFerOtlXEAmLM0j4L48U0Ngd9DLHegkGkbg37tmR4oKmii
         NRgkJx7jVHZkThHncpYJptaWog1wnuJW8FAxwthqxfnkhhz9C4qybKPVDyyI5Eqx2bzb
         6j5x2jfvZw+4WLEvEKX2rMBLEOIE18D1G+NxPGgaaLBN4AfKKTZ2wAht4/a23+nHyqzs
         B5P71dc72QlmVXC8eAlgNn+y0pYq9TMgbhBXy+s5R4DRrdiarMKL5kBF2rDSyzF6DpiN
         ey5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2ykei3W9LQd1RzBfuNAPmmjbg1pi4i2oQK8s3yOPURE=;
        b=qrF9AcP5wz4Kg0ZWG6CrdMdKCblVenuv+q3SlH65wOul6s6FUXOePC9ngrlJrv8cYL
         sl78vwBEIJpN9Z50QstW3W+oBRWVeWcEKV/WtiSZO238vW4Ap0xagdHbLcjL85yawyNv
         o4MvJFeQpc5rkg1hc3KcCebhgD7Rq+JjHBqy+Hwvw4d8BaZvdyUDVWHZ5Tcb+q2h8zs6
         doASp/ThoaatHMnzKdeq2CiP8YcV6nC1+H6xyJYs17Ok0y2YvG9jkM4stLGjo7Ldaiui
         WOM7rsziA+yRHNjN95DQ9igLqr1C7Ft1O7AEWyPW3hjt4ZmJ2KhVkPedA/BtZpR5KG3P
         1OOQ==
X-Gm-Message-State: ACrzQf17iHLblFu/u+TN0pSUeqHLnbK8sBgX0jZc9Ix71BwhBYKywE6L
        biCMYdhAs/IBTwkXivE4c7J6PQ==
X-Google-Smtp-Source: AMsMyM5FLpAMmuNQHjmlmpFYMpp5Q2Pd37Fauoc4Ihu1kvKrSaKiLWQowiY27QVdhozOHJdQ7i033g==
X-Received: by 2002:a05:651c:a04:b0:26c:50df:75ad with SMTP id k4-20020a05651c0a0400b0026c50df75admr1519340ljq.416.1663869741075;
        Thu, 22 Sep 2022 11:02:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e2-20020a05651236c200b00494791fbd80sm1029715lfs.307.2022.09.22.11.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:02:20 -0700 (PDT)
Message-ID: <8a0beaad-2eb8-b5d5-28af-f44285644ff5@linaro.org>
Date:   Thu, 22 Sep 2022 21:02:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 16/17] phy: qcom-qmp-usb: consolidate lane config
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220920073826.20811-1-johan+linaro@kernel.org>
 <20220920073826.20811-17-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220920073826.20811-17-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 10:38, Johan Hovold wrote:
> For legacy reasons, there are two configuration parameters that appear
> to describe the number of lanes a PHY has, even if "nlanes" was actually
> used for a different purpose.
> 
> Replace them both with a new field simply named "lanes".
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 52 ++++++++++---------------
>   1 file changed, 20 insertions(+), 32 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

