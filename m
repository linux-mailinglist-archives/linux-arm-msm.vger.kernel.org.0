Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57B285E6A15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 19:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbiIVR60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 13:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbiIVR6Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 13:58:25 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F9D10653B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 10:58:21 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id o2so15931869lfc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=l478WV2PQrEPincbg/O4NBfPJTT4Q+S9mMJy9BBn9a8=;
        b=Hb3m1qSIZlO0ry2k89IBZPpA4nRFpA2iWKCH0ptaFKAtKTlVBkmUqVKJXpP1uv+iqL
         Bpq6iY0xoewsqqpOuNQ1dztfX9Yl+RYF8O90kcT08YahUow/vZyM6G/v15qqnQ/q+IBY
         45oKHp5p824FtfnHleaBBAMopHhquUHf1GzvjLWGdLr6xhDRqeq4x1+W+HLj3dPb80cV
         ppqTEihAApF2J0Y44kH+C+/WVn/DgWgSe281UAT/6CjabmQwEFw2EaGRfBuOnpCxZMq9
         7tPypK3EZQv40V7iAT2R9unbAK1YaHNi16SWZvrncLiJT6OC+zPUt7bWal7mZsLeFYl5
         9SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=l478WV2PQrEPincbg/O4NBfPJTT4Q+S9mMJy9BBn9a8=;
        b=MlEZ9eLOk8Odeuxn+tv+KJ3V8Q0dA3K283+cKrKZ/jA5pnEMoZB0gcEfK9U8GWlf6J
         COcOHHM2LLeJzMFmHo9qPCqCsPZMj8JW+JyMFyOIYICIx+dBS7S4GL+7TeU/vJw9WJR1
         KuHmBES7el3Vk4H/kwDg6frTH75NuXE+rNAGhgpMixVYiiFCB8ShWZ0ZNvQzbfkJtG0H
         SC7UxrV45aWHuv6wwdxkXcQEo2tu0Q7iFEfc75PChK5O9z7/jaLxi/Sgi+WHRgTx/92G
         hmtIYXPegLj2v8vEDxcGMGJeQUsXlPdLgfh411zdn1mfeWb8vybEmsdm7q7LUap8TEa3
         PT/w==
X-Gm-Message-State: ACrzQf1LGingRB3IIpnZG4xIsd8D5z2pU9tMctk0273Y8pC7q8sI0Bf2
        rIgrfMXtVszuO+VzVoRlkXuIOG281jbTNg==
X-Google-Smtp-Source: AMsMyM5vNqMo+hkzshJzO0Qq1ZzNX6nDvB7bj8jVMr5fO2m3SsASi78YwcnbXvJGoN+FkfvM+77GoQ==
X-Received: by 2002:a05:6512:13a1:b0:48d:f14:9059 with SMTP id p33-20020a05651213a100b0048d0f149059mr1898038lfa.110.1663869499748;
        Thu, 22 Sep 2022 10:58:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 3-20020ac24823000000b0048cf43c3a85sm1032371lft.238.2022.09.22.10.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 10:58:19 -0700 (PDT)
Message-ID: <0d802f2a-5bed-28b3-7160-e1fceee34ae6@linaro.org>
Date:   Thu, 22 Sep 2022 20:58:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 06/17] phy: qcom-qmp-usb: drop init and exit wrappers
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
 <20220920073826.20811-7-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220920073826.20811-7-johan+linaro@kernel.org>
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
> Drop the unnecessary PHY init and exit callback wrappers.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 29 ++++---------------------
>   1 file changed, 4 insertions(+), 25 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

