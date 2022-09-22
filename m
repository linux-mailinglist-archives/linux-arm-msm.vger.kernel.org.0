Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEB85E6A53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 20:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbiIVSFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 14:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232339AbiIVSE6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 14:04:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F44710AB19
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:04:13 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id k10so15992022lfm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Cp85iI0TQdLsLCfuvpK7iznKKPb7bjdE0o2CLpGmQWI=;
        b=DX6POr78vXwYPv4oLHURm29u9IRx7BsjpNzdD7pXXfcVDMYYsdPzTY4v61KeL3EUhD
         z55YVKBUGIkPCWqUOOIthpFU+asopGNPPRl3dtRIjazHP6G3kK/kk4sBe4UmjikylkQr
         Qs0AwrpI8rGbb68JcFYr9cvIcGgD2h1g6ogCRthtxIr+75bzHhMouYoJrsHtt0WQWYLI
         hoXdHuhPUpMFbldn9tgSFVzJLOwwPfEGe/qxu5ttK8ARvjwojSGgbPb12I9XhFsg4GYz
         iYA00ykObTdfq8RvPE8E4LvNJ73B4tcm2cW/kU93unPF4HB9WetcQ227I9x7yEfCbgHe
         1D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Cp85iI0TQdLsLCfuvpK7iznKKPb7bjdE0o2CLpGmQWI=;
        b=aU1ZXoSx70csD5aYCkCR/aMfYyWIKJonnUUsEiYpJ4tPzjcTtqbNEZInOC80ZyMYrW
         sV/uIKBUwh7xHdSCw4kPeEde3nGPqBF+nFP3KBhKkZm0DNqhjDNDFibvk+pmuavvpLOF
         kql4bYG8+iLf0lyFVs/R0GR8uLeQIJoPlw6/I1HP5StYPjLDd5LuwFPmaiOXT4BXjPsM
         NLLdkJdbKz3ccKQ4RD00Vt7irixyu488BamkcoQXPDrT7fZ65UKS10jz+i4Obi0EROUa
         2Zdf8tFUjYkPOFGYjAG+qIU63YdFqqy2422xyxBveoSFckh9ASM4tju3vYKO2L1I4ApD
         FA+g==
X-Gm-Message-State: ACrzQf3EoVq5nyuueKDSmg9FeuLg3qD55JVpb7QlnQJuMBWGhpfBdxjG
        5rfBHC6NHfrMUUo/sKst+bvrQw==
X-Google-Smtp-Source: AMsMyM5GZh7KHQbmQl7t9bBvNAnBsDkJhci5NdYii1rhp4/MdDipgssEm0EzujLmV/aktXLjugIYiA==
X-Received: by 2002:a05:6512:2612:b0:49f:15dd:290a with SMTP id bt18-20020a056512261200b0049f15dd290amr1634962lfb.361.1663869851817;
        Thu, 22 Sep 2022 11:04:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o3-20020a198c03000000b00497ad9ae486sm1048129lfd.62.2022.09.22.11.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:04:11 -0700 (PDT)
Message-ID: <ec2a6966-7764-032c-b603-7887e17827b1@linaro.org>
Date:   Thu, 22 Sep 2022 21:04:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 5/7] phy: qcom-qmp-usb: Use dev_err_probe() to simplify
 code
Content-Language: en-GB
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-6-yuancan@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220922111228.36355-6-yuancan@huawei.com>
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

On 22/09/2022 14:12, Yuan Can wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

