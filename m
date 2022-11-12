Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273616267D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 08:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbiKLHwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 02:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234680AbiKLHwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 02:52:08 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1800A1B9CD
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:52:08 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id c1so11468600lfi.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDQX/PjKkRG4x6Pkdzn6ObFIUuJQnbWONq3jUFUhLhE=;
        b=yCpjYZKAveVBN9///jLj1/M9776TpdzcK/O4D1N8JKjjaMFlLpHfIVKMDXukTnE9oW
         DWossp+MKzO/1db0Eq1vVvQhRXsqMjyyk5Rzf4dAwXTnG7VrhC0BRBthcuAaEpPBuDyU
         uBSlI5XtRchngQ0xBcJPzMb0Rd2gPwIkHBu7qcZLjbidPWcjMzayEBcObuTPfgE4Ipp/
         OdG9/l6ClIQqg36Gth5/50iVkDAYPZzj2awkpMN361q1DQvcYmx3wV0aNg/sJ+YnQyJE
         qZ+grcR7EsJGk6a09Vvdv7DRi5ROXo1CcEyzSeA+M2yXy2jfwqFCCsgHWYFSP4naZN6O
         B9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDQX/PjKkRG4x6Pkdzn6ObFIUuJQnbWONq3jUFUhLhE=;
        b=LsJHpw3Icqol25P6YIeSywpFUGHWmCaP6AuVB4vkFXE4c32q1EBQEQMUz19bzyZjzk
         j324W2kH97e1mm+eARbxQKA8Z97/HOk/eiop2TaSvxx7G5se9abrskFPzvAdszy7WUVt
         RHNvdinQHzM/DkcPAyAi/WLvTkcu/rMAHBZfxyTnuzGK1CjVO+V+bk4niJrhmPPji5jC
         M7Szma6WSZOdMhCzZOAQBOUjMUwhzRRLSS7qc0SSMrOSo09ijcvEYHGs8b/D8NOk+Zvw
         gpiNlghWOGq6VeZ0eLbo9gf/XI6CvablUsYKHHZ3kjYqlgacD/F1HM+xqPXPOQO5NGCk
         b9/g==
X-Gm-Message-State: ANoB5pmHMqW3UggxmmilH6cvfF8fFwzGU7UJugd78sA7aqBt3Ie1Huhz
        khYM3hdwmNPRLeN0/Hu1cC6IKQ==
X-Google-Smtp-Source: AA0mqf5owtBxZMBfsAnkOV666BH20Pfu/hTIUNJqkmqDRrHYUbraQDsTZPJEXRGziCjIrYTXwNZaKw==
X-Received: by 2002:a05:6512:370a:b0:4ac:52cf:559b with SMTP id z10-20020a056512370a00b004ac52cf559bmr1847901lfr.476.1668239526494;
        Fri, 11 Nov 2022 23:52:06 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id du11-20020a056512298b00b0049f9c732858sm742166lfb.254.2022.11.11.23.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 23:52:06 -0800 (PST)
Message-ID: <df8f21f6-4282-993b-fb17-b8bc94db887e@linaro.org>
Date:   Sat, 12 Nov 2022 10:52:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/3] phy: qcom-qmp: drop unused type header
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111094239.11547-1-johan+linaro@kernel.org>
 <20221111094239.11547-2-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111094239.11547-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 12:42, Johan Hovold wrote:
> The PHY type defines are no longer used in the PCIe, UFS and USB QMP
> drivers so drop the corresponding include.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 2 --
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 2 --
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          | 2 --
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 2 --
>   4 files changed, 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

