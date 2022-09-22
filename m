Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5891A5E6A58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 20:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiIVSFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 14:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbiIVSFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 14:05:25 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BA49750D
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:05:24 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id x29so11968083ljq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=WVxa14W9DCNpiIuvLzheW0ZLCfsZJ4vjRgb2dEpJ+Jo=;
        b=EUfYZimbN9JrX7yCouBtnzB2ueWjV0/PnTlvC2rrrVkrYBt4sO24c4E1QIxf5qNTBv
         bM77u7P6eNKA6Qxamh1Laqhz1PdExqBKt6u4OAWWuH3GiM/AKtXmIElaF+pp6N4KoVeI
         OVJ22pzkFtoRij4Rf96T4HJJ6U52y3aLInIjXpqwPbgForn4NJvK+IhQUPHs1Ecb3lAm
         WcX9wbYUmtHem+rwQekAQLE0dAV3HIAwXd2vC2BWR63SjtsoANwMik/OwqkVZ0DM8L7j
         X3Qtk5jB2lvZfXUfDD39nOGDJ2yeKPjNICcQ4B2RNXG5Oxomug0UA/l97WC2gXBtWUBu
         sw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WVxa14W9DCNpiIuvLzheW0ZLCfsZJ4vjRgb2dEpJ+Jo=;
        b=PH44KTwiRBzX+Dbxxg3YjZsQZZS58mXQ0ds/LKMdv4HRk4jURImT9D4OgEsdJ4Ylls
         Un9aIg4SI8Kqym2M3DAjnQ+mNa2mgqnhaTMNuhOh7IPniDVmcbA2yxarTjhzlUwycrQK
         CwpSvqM7PFrt3QMjInEL5rC2yZSO/ijmKWids8/NGRe7m/kfluNN7mBhXYOuqzX3ucD8
         oLcWhfSjSFlhbpbrTzDhxJueV6jV+pdbkasWmOlm3svw/QnnZp6ZjlwV1E1fp5c6kfRE
         SS7kwfFYNCXPYMIQYBLV6BOoYGzhovAj4LfbX8MQN0HLi37rrK2VMwfC9/9UWity5Jh9
         dZpw==
X-Gm-Message-State: ACrzQf1OT7hyGEEdMf1WY3iddZMcZvfoA08z59KAGwptIGEH0wCtT7Fm
        ZiGUnijO2yBZKh5wVYHRCvBD/w==
X-Google-Smtp-Source: AMsMyM4hTaxUY5vhGAEwSILLREKcc5flrHrXzBpFvWcfM4kadYtiTRmRHvRqgwwpnFBafSjkIN6Tog==
X-Received: by 2002:a2e:9dc6:0:b0:26c:5d06:e18 with SMTP id x6-20020a2e9dc6000000b0026c5d060e18mr1482048ljj.64.1663869922465;
        Thu, 22 Sep 2022 11:05:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v8-20020a056512348800b0049adf925d00sm1051670lfr.1.2022.09.22.11.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:05:22 -0700 (PDT)
Message-ID: <96ce54ed-a6d1-7b06-1eff-c153965637f4@linaro.org>
Date:   Thu, 22 Sep 2022 21:05:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 6/7] phy: qcom-qusb2: Use dev_err_probe() to simplify code
Content-Language: en-GB
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-7-yuancan@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220922111228.36355-7-yuancan@huawei.com>
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
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +++++++++------------------
>   1 file changed, 9 insertions(+), 18 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

