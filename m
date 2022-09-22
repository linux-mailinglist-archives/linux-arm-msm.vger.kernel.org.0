Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06E8E5E6A54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 20:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbiIVSFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 14:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbiIVSE6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 14:04:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5766D106F52
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:04:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id w8so15949284lft.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=H7+ooF/tH3iY7f3hSlBgtyNTBl6q8LL6YfgYqWaZw7U=;
        b=Cn0NpsLM2yB5hWPYP8CZLXMb0t/ePWWGynaimsTKmIi5sScc9itfDLXGDUFVAfmMlu
         aEbE0bIfL+MNO94VsxBnspF2TDTaKS3O2gyzkjSOvrO+FSPR9uB+8urRbE31q2ZlPd2j
         bhl/wNdoraysSwIugaPlhak7xPNBeDEhYcGswA2jVFhx0im/RxkFGd46bLFQq493PAsV
         GefOaeTOV96bKzFx/cFHD4PNQ3p/OqKvY16HN72vdWuyqdZvLGqAoUISXRATuE+D2o6N
         RN9Cv09CKIHhWkPIqx+Vle91aQIyfAjn+QE0lgUE5xpoesZNAm1+MVryxG5ulVRJWINR
         vRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=H7+ooF/tH3iY7f3hSlBgtyNTBl6q8LL6YfgYqWaZw7U=;
        b=WER+GZtOzaLaEKjivXEXK11MvfIUYpAGq70HHyL2eejbL4lV6m4N9kPQg4ULbzCjWX
         Dn7LOPdLd9TUKeNPB0+HzZbdX5E8RtpCYzz578Da14U9fTvCW3MD/qqDqL3nz58o8BCZ
         GGI9csCCw1ACkj9au6r0xsMF9KCTI2C8FpFL3el7w7eGchYTjZM7qZCRnH4hrpV0IQvZ
         tFNOSuVC6SoDHAcFYpR6PDu5+xSWFFciwdrxOcRbdmR4BAtvnlIhg62tWBmk6llqcw66
         ZF20H2vvmFA+2OXrOq4wgOwdFH8MrcEU7xvch3RBEgFEJV8AkCFqylmHmualNKKwL5C1
         tO2A==
X-Gm-Message-State: ACrzQf1VbPCG/eG9VsiKF8ChtUOUxh4mXglNO1dWUELycMigGqJb4bEE
        gnH5+EDNkILtbWkeKQVIG9DfGw==
X-Google-Smtp-Source: AMsMyM5v/2seiSERhm7v2X9MBz/y6K555rKFmNrrAWfRC+uK2Gk91A1DY7J1HrzMSf6CZQCa0LHY1w==
X-Received: by 2002:a05:6512:3b0a:b0:49a:7ce8:c450 with SMTP id f10-20020a0565123b0a00b0049a7ce8c450mr1907267lfv.231.1663869840355;
        Thu, 22 Sep 2022 11:04:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t12-20020a056512068c00b00496d3e6b131sm1035691lfe.234.2022.09.22.11.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:04:00 -0700 (PDT)
Message-ID: <ee1db15c-e811-2eef-dacf-f6de42b00aa8@linaro.org>
Date:   Thu, 22 Sep 2022 21:03:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 4/7] phy: qcom-qmp-ufs: Use dev_err_probe() to simplify
 code
Content-Language: en-GB
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-5-yuancan@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220922111228.36355-5-yuancan@huawei.com>
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
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

