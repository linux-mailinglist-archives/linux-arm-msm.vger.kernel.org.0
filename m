Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2275E6A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 20:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbiIVSFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 14:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbiIVSEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 14:04:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1F21075A4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:03:42 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id f9so15989880lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=tO2L89ScAtD8bTq4bm0kMbpJAPuelr5Yfp8Eooncy54=;
        b=ZWmtI/f+y8gegorLV1xCahcE0zjrLPkXHvKc1lqdKOe9+7fcIjHroNjgzF4jXL9tja
         cXxKCaMp8lltyz0CSyDoS/X82SQpfuQ1R4jqNs0P5ki0aSjbxXQ6OzmDgXKGUG09WiUu
         dHfDN12QCVVA2x7cZ1Z8ibudeDu3gr6xIxgVxtffpavbMnkUwEGfSo+nBZFhrLmzwiGx
         bw7xi0qI1GkFdA8XjnmlAU2xMnbKTyk5wzUxioQMwdgY6Qe7FPCGqGpKrBw0rx8CPOya
         FxavIKhZrpW6JJ/tJRfTiiV+iILOPVrhU22a8JPGjfJI2l7rHys72CXrGXqw+gzG9abc
         frCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tO2L89ScAtD8bTq4bm0kMbpJAPuelr5Yfp8Eooncy54=;
        b=ysLx2cOT9gCTubbto86RHYIajGQDtsogXaCmszLAkKtRrqiVOaKAa10DiovEcBu0Cc
         04c7CcNsLlAz4O/K2tk5bYMMn2/RFHuVYmwlijQFnxXO4sWF8KeounEyK3hoOzRshS8T
         nQXbeQ66chusL7VRUrJ2g44n+JU4VOjM7LrpF/9bvg5Lu8y1S4WfiR+mTNgJpMkbw6Fy
         pzDSFgU+9jFjg4F0CEQtbgU+JXoKR/8Ls6YHLxKsgayNeVqVD3CZIT0MgOsASl2iHMUN
         SQbZh/LJGTZfjx38/iUEDvY5IDrRLHo3Le0AeDkRNkmGvum/ZS2VN+y2U3bYAU9k1ofj
         ceVA==
X-Gm-Message-State: ACrzQf29E0jhljt32epU1Bign3Qr/kGJPQG11UbhQeQzMlfvinX+iDJZ
        3Hv+rvmSImOsIPeT3eIp321YyoWejLwd7g==
X-Google-Smtp-Source: AMsMyM43HA7Lbdg3eayYNayGa2gBj0dL6oO/DWBPg7VxdCCdsmm9X4at4UvPbn1UTgqEe/GQxnm05Q==
X-Received: by 2002:ac2:559c:0:b0:497:a7eb:26a1 with SMTP id v28-20020ac2559c000000b00497a7eb26a1mr1663820lfg.49.1663869820742;
        Thu, 22 Sep 2022 11:03:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025fe7f33bc4sm1015741ljc.49.2022.09.22.11.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:03:40 -0700 (PDT)
Message-ID: <6ccb9913-e802-9cd3-3c9f-66f5e605aca6@linaro.org>
Date:   Thu, 22 Sep 2022 21:03:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/7] phy: qcom-qmp-pcie-msm8996: Use dev_err_probe() to
 simplify code
Content-Language: en-GB
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-3-yuancan@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220922111228.36355-3-yuancan@huawei.com>
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
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

