Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31291528389
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 13:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiEPLuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 07:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241825AbiEPLuG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 07:50:06 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1156EE14
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 04:50:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b32so17803098ljf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=ZFe7/wdjx5mxMqWgs4Osx7jXifgklv9bLHg970iFRUk=;
        b=klXOGYWvVmZaudgsJvnSuPoQYgQ+QiMV5vqkaC5z9UwO2+FQ+RjX5dstk7S+s3ver3
         bh6ovJTb79U0SL4tL8kPE8hhEM2NE9L8TLabHBmLAxv850tLy8xhJQzuSU0Vsd2Xhi/k
         dDGhg/s2khWI2W66z7hFAdU1/rdSF5hFq99rhcCU2SZ2dsRixVRV6wx94kXfV8G3RCpI
         BXaIwdJ0de3pS+YkA1KEv5kCCdIqA576bir65XqNilS0DleadYPaoZE4hFccFdWy8JLJ
         IXBIAnGx7QiaMpTN0MtsRG+rKSNJ3pZp5mEYJZ1w6wMN8aNvNgQQg/n5+ck2KLY/Rpxe
         0kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=ZFe7/wdjx5mxMqWgs4Osx7jXifgklv9bLHg970iFRUk=;
        b=S1bkD7N9Kd/4abF70Nla0WqBkR9Iki9VnETRjUaPgKLcQ13qBjcAJSdfYFi2xfitwJ
         VzPSjCJIpAYw1oMhlKPou2rxeuT4t8jaAcuXmIxVCF5itRZiE4auGTY707bO5bGKDme0
         4sWl++9q4DKhgboC5pQKTaoWVEjW0LSfUGizu/CjO8Yxld/G06jn6Yfx2qg3zunRK0Qb
         oS0Z+kKAANYxc6+V0v3Py+3zJW9z+RLFf1A/WaA2+gIub6AQMkUD2SvKXlgyyX1PI51X
         wJaSOwpikb7Eg6uKlLg1RR3d6hc1gS8vWebKP6/v7iOLSCJbsA8hPHhjClULQ5gwmTQm
         +SaQ==
X-Gm-Message-State: AOAM532QyYXu25bTMLbS+2rHAKJ98w9xjt3HvfPrCMgfkScyGPXYpqB7
        Wd29H4zuIVHS0pNNhNtYHvo2GgsLUAMi7g==
X-Google-Smtp-Source: ABdhPJxl43mB4mx017SbIkg3y2yheFOLhF2zqj3Nl6AA/ntbvBQkAmYFbpoFQs1XOI3tKOM4axN6NA==
X-Received: by 2002:a2e:bf1d:0:b0:247:dea7:f657 with SMTP id c29-20020a2ebf1d000000b00247dea7f657mr10934815ljr.454.1652701804105;
        Mon, 16 May 2022 04:50:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m3-20020a2e97c3000000b0024f3d1dae94sm1533170ljj.28.2022.05.16.04.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 04:50:03 -0700 (PDT)
Message-ID: <652b11e8-bd2e-e1e1-363f-4f460bb20913@linaro.org>
Date:   Mon, 16 May 2022 14:50:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH 0/5] phy: qcom-qmp: split the QMP PHY driver
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20220516114525.3596196-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220516114525.3596196-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2022 14:45, Dmitry Baryshkov wrote:
> While adding support for the PCIe EP mode support to the QMP driver I
> couldn't help but notice that the QMP PHY driver has slowly become the a
> beast with tons of conditions and corner cases being inserted here and
> there.r
> 
> This an RFC for an attempt to to cleanup the QMP driver by splitting the
> QMP PHY driver into four smaller drivers, each targeting a particular
> family of PHY backends (DP/combo, PCIe, UFS and USB). Yes, this results
> in some code duplication, but I hope that the end result is still better
> than the current situation.
> 
> If the idea looks good, I will continue polishing the drivers. A
> feedback regarding the common functions (ones, left in the
> phy-qcom-qmp.c file) would be appreciated.

Oh. 3 patches out of five bounced because of moving the tables between 
source files. It looks like for the review I will have to split this 
somehow. Ideas are appreciated.

> 
> Dmitry Baryshkov (5):
>    phy: qcom-qmp: split combo PHY support
>    phy: qcom-qmp: split DP data to DP-specific structures
>    phy: qcom-qmp: split UFS PHY support
>    phy: qcom-qmp: split PCIe PHY support
>    phy: qcom-qmp: complete split of the QMP driver
> 
>   drivers/phy/qualcomm/Makefile             |    2 +-
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 1362 +++++
>   drivers/phy/qualcomm/phy-qcom-qmp-lib.h   |  290 +
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  | 1945 +++++++
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c   |  863 +++
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 2104 ++++++++
>   drivers/phy/qualcomm/phy-qcom-qmp.c       | 5983 +--------------------
>   drivers/phy/qualcomm/phy-qcom-qmp.h       |   43 +
>   8 files changed, 6732 insertions(+), 5860 deletions(-)
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-lib.h
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> 


-- 
With best wishes
Dmitry
