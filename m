Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFC785FB3B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 15:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiJKNtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 09:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiJKNtv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 09:49:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8511ED11C
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:49:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b1so16206822lfs.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+BwPLVCEI9mF/rLBXMUzn2Ll2qqkV7d9SFJM7M3LtU=;
        b=cWRJZzXau7Gnr/HVDe41secSzWglvGGkCNzljUdT1qmGb5dqLhqUsz6CyQTnBTJoIo
         5FdkkBjLg4JYbrT+HMESTPjva2VooD+GBAJUXb4G+dM70goAhnK8K5FIXBU7qe0P8PvO
         fThtwZYQlds8DHt4Z52jxuXjKb+dCo87KXb3fTozrCpECA8zJDDKM4cfSsn0ZjFZdFkK
         15nSDj9sNuXfLvDRISt1BACNb6bzO+kSCIiwtJ16POnWF7BWABlyemehc1oZyM5vGyP1
         2ItkwJQ6PM5KJppH1ZnC50xMAUIivtS3K+MUjrIWewacvSJsDnZl7xEqOqyBe81DmsL5
         OqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+BwPLVCEI9mF/rLBXMUzn2Ll2qqkV7d9SFJM7M3LtU=;
        b=wpepv1qeVRrQ0knzIVh2PM6er6J6ANwRKKwTG1cSbCQVwveGohhQ82nh1R7JqgXN9e
         kFOygfRfgAuI9dNx/qhl0yie1XLhv5qD+Bh7MhqLInc1cQkWodjRGEroeBjKxsvyQ5RO
         x4hSd5UxuAsrJozqEvsV57jCiudoo8i87Vpj7hkEN/K3f4+xhTyQsriCWQwbrfcjqiQ2
         xpkAQCZZlrxhdYqxw2iORVOOGvU1hmiH94Y7VjXCzo9B9x5Qm6MLUL8TGX8fyz44Ojf5
         6Xfk1/gTIa7hR6RU4QWo1QFH0OipUJH9PRMgxV3xXfUuAuS+lZ0CESxefmn0vrIoR0ID
         mHag==
X-Gm-Message-State: ACrzQf0kdUyJT7MECTZQQy+roZb+yVEt9vrFwVn2NqWfdxsPFBjgMVmq
        XiqudskeFMSBKSmjwsYEnosQuw==
X-Google-Smtp-Source: AMsMyM6c8JfoAyStPDL8zU4aaz+c5a/daQc06oOoy04zGjW0JZLSAC+7zT1/DsnmTpJkOWK9Jq/jhQ==
X-Received: by 2002:a19:915a:0:b0:4a2:458b:ffed with SMTP id y26-20020a19915a000000b004a2458bffedmr8263961lfj.181.1665496188628;
        Tue, 11 Oct 2022 06:49:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c22-20020a056512239600b00492e3c8a986sm1864356lfv.264.2022.10.11.06.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 06:49:48 -0700 (PDT)
Message-ID: <777c54b0-7e38-3ce0-2dab-7754129fde94@linaro.org>
Date:   Tue, 11 Oct 2022 16:49:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 08/13] phy: qcom-qmp-pcie: drop power-down delay config
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221011131416.2478-1-johan+linaro@kernel.org>
 <20221011131416.2478-9-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221011131416.2478-9-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2022 16:14, Johan Hovold wrote:
> The power-down delay was included in the first version of the QMP driver
> as an optional delay after powering on the PHY (using
> POWER_DOWN_CONTROL) and just before starting it. Later changes modified
> this sequence by powering on before initialising the PHY, but the
> optional delay stayed where it was (i.e. before starting the PHY).
> 
> The vendor driver does not use a delay before starting the PHY and this
> is likely not needed on any platform unless there is a corresponding
> delay in the vendor kernel init sequence tables (i.e. in devicetree).
> 
> Let's keep the delay for now, but drop the redundant delay period
> configuration while increasing the unnecessarily low timer slack
> somewhat.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 27 +-----------------------
>   1 file changed, 1 insertion(+), 26 deletions(-)
> 
Anyway, we can move the delay later.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

