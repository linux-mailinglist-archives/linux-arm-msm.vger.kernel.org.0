Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E255E6597
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 16:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbiIVObP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 10:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiIVObO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 10:31:14 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7458F3FBB
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:31:13 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i26so14952408lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DPmdZRIENec7MY1a8prShoDiqFdPmTaQvEQ0y2ccFSo=;
        b=B5M3h/VXI+/pqRAQyxHRxl/k2MaoF41qpu8qNBR+R+PIGEAobcudXsF9427aSCYfov
         FFDkBPzQtb2soozIpV8O3x29znvdpckjHGwXkn6Hrhaw7qfZ/qosLDrB/GzUzVBw8QjY
         2P4ZUHSkZ1Ah77GWm/pCWJkOAFKRLVW7O0CaGH+YAgeX26aGe2HZMnPBdjeUFJR7BHs5
         NigEYa0+9g+KJHValkOfauLEu2bGXy5l2DkxBWE+wtQWBT2oBC7mN8V2TEWqV4x+N38S
         nEGQHsZgeFCyupFDb4hKZv20duw9nAVKjuT7bWsnCgGQR4BdKyjkRqqlUoguBCpU55M5
         jdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DPmdZRIENec7MY1a8prShoDiqFdPmTaQvEQ0y2ccFSo=;
        b=Wh3DDnSW75BHa2xVcaCoLaYWdZJvGrJjLT9dj2SWod3AaSfNqOxppJBHPUoyyTOouU
         5bd46FnXhSuU6Ju0jzpKQT4r4sQDx3VMiNCs+IcQpdEE4E47auhzKCwkCWSEkQehJISG
         oE8e19bn3J6pP1q7EK+dx/kGKN8v8CSS/Ls6djD52wN6LZZXzYB7DHwBiQXxgr1TGt7/
         7jH2fmon1yHGaiGkniiXdic669UxmDtBKdLD53C4V14lg7Oc++YiGmrVP8HT01RLjd3y
         16tRd1cPRdM6BkmwfhEDbCgPLHPpsiENY0onIIyjL7w/61j8o7y35y7dU5EjI9Csu0It
         EtsQ==
X-Gm-Message-State: ACrzQf32lQdrxKnwV0q7sY+E3ooIJN+jdWrTU8icybm0+BKhfmfvLGqS
        IjJ9XXMCmacgj4Ip+xUSVjTMlQ==
X-Google-Smtp-Source: AMsMyM72hThyK5AODueaKEuXAJEg2XB3Ts9aACzggiQdzkXc98vTkYz6DVlzMuZkh2j25O8qiQwSTw==
X-Received: by 2002:ac2:4e09:0:b0:499:1e3a:54ab with SMTP id e9-20020ac24e09000000b004991e3a54abmr1335524lfr.170.1663857072051;
        Thu, 22 Sep 2022 07:31:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z18-20020a19f712000000b0049adbc24b99sm971091lfe.24.2022.09.22.07.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:31:11 -0700 (PDT)
Message-ID: <07eb36a9-086a-2f79-99cf-2762487b63bc@linaro.org>
Date:   Thu, 22 Sep 2022 17:31:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 03/17] phy: qcom-qmp-ufs: drop unused type from config
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
 <20220920073826.20811-4-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220920073826.20811-4-johan+linaro@kernel.org>
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
> The configuration PHY type is no longer used since the QMP driver split
> so drop it from the configuration.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 --------
>   1 file changed, 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

