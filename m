Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7BDD5E6A39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 20:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbiIVSBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 14:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbiIVSBT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 14:01:19 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B4FCDCC3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:01:07 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id j24so11425316lja.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=il4FfHFNJa+SLUSzz+jH6qB0ObxCaIOW9FAiJRgPVms=;
        b=BVX7HvSW5vdQ5GCnIRyIwEd8GUOCzggWCzjAvJC1ZhCXs2yCiVOLMW5sTX5pOrY1+9
         ClN28BhPHYCSXvKV2oLkBCGqAa/rjpEWRYYtDZh0p9zqUv9o2rG2EdQbKaj5sbvgykVg
         JIXYQfbTpF4s1OS5ihucm/dMyd+3wVl/TegnYBDeXk6vP2/Zy9jUzOtaLeXbqeRiet84
         30woL2xWX20fsX5NgsDVAMnb07wf7VK7xB06f9/d3R1PKWANhEjXGtIAq/HLdzAhA1Ik
         U4VPL0aAz68vSW4JzPNYzjmKdiFCvRhMx7yfP6XTjoqBSwRmt4v20ODImz4ARMXRyrjo
         AM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=il4FfHFNJa+SLUSzz+jH6qB0ObxCaIOW9FAiJRgPVms=;
        b=1D+erpyWc2EqDUBaNdIxDTavVbGTdz0BJKJHzhWb7fRrPeuBCyVe+KE1p/S5F0cATU
         bYUH15ez3s+90FNnhN2oV9SPwkx4tpIBtTaUAh5ffa+0OrRQx3pANigrspGw2W6HJsTy
         utba+x9zK/UfjfRFx9vePeG6LNZzhrR6NXQS9+OD47+I6B3w+H+wd8JKm4A0da+AqeYj
         wdDZsU4/13umUSSquHpG9hiOSU9oPDBb9qZNh8MFTE4zNbgHbYA+khuEhoh8CSJIjhas
         eYLnN01oEkMo/6EdEIqQ/k2wp5ljLpGS3v04jFSYQQg/yp01u6Zp1zacK8NsXhZX/2zf
         AG/g==
X-Gm-Message-State: ACrzQf0UNfuj67Icosdd6hk+PMaFQ3ZODpT1ZL6udEtizSgyvCf4yWlE
        DUE69CkSIxw5FOqfYKUKbk9NlA==
X-Google-Smtp-Source: AMsMyM6olhD5+tQF0xGTyGy2dUnq+lf4MwtqPAqUGDRcGdJxgKtqE3F7nnCyqJtW9yR0x9Fm6Zreig==
X-Received: by 2002:a2e:9602:0:b0:26a:9ca8:d6f9 with SMTP id v2-20020a2e9602000000b0026a9ca8d6f9mr1679181ljh.88.1663869665535;
        Thu, 22 Sep 2022 11:01:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ac09000000b00497a0ea92desm1041587lfc.135.2022.09.22.11.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:01:05 -0700 (PDT)
Message-ID: <a69b82bd-2540-1953-4236-9e484928aaea@linaro.org>
Date:   Thu, 22 Sep 2022 21:01:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 13/17] phy: qcom-qmp-pcie-msm8996: rename nlanes config
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
 <20220920073826.20811-14-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220920073826.20811-14-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 10:38, Johan Hovold wrote:
> The nlanes configuration parameter is really the number of PHYs provided
> by this QMP block on MSM8996. Rename it accordingly.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

