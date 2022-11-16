Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B52662BFF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbiKPNsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbiKPNsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:48:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE6848751
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:48:10 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j4so29631955lfk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MI1iynjaN2MkTCyeDmF5KXhL4b89LEiGbspfsqe0RI=;
        b=oYDdqY2BP99k+KjUrX/FjnK0syahWIBeLB8nszKCTAJU8zDlg9phHEBor98LaLM+dr
         EUetHDXaNXgw/I4uYZQnE5Xv/DKbsPtZjVLnfZCEnNMdzfSUlJvt2n/PblWXvcUWfod0
         tQkLAeKiBzpHeiHHyW3P/GhOwKdj8dANsOntYkg4AjT7phR128NOgYBHb1zfCC+fc5Qw
         lX+6hb1m6/7AHrZay0AEglZjNjT8LUE6vvWGo9t8InrqLWthAYUMoEps70/YajK7LWoH
         Y9S2cs/xasUWujccqCpKLHTSkROLq2mtkx7wN+VMproowLUk4rjyHriaHQoC7ng69ktC
         LCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MI1iynjaN2MkTCyeDmF5KXhL4b89LEiGbspfsqe0RI=;
        b=IZWOfEQWdK65c1s9OpN1IHjaj9GJiw8WotdHVor72Q/HeYyMCCU1AO+dOa8d1sD+P9
         jHJl/y6SKwdLyy/WQtn2GHhsMT6NbmXXq/SQ0LyUvZ3JcxJ7O/W5SGP+E06VQYWQRph8
         aXoI5FGSIV2WEjWACvECwPHXOLt/lNPAQ26YW9N6Nz2ufKNCpPjutyyR6ijvGBgcZEX0
         ZE4s6xPHdOO04kwYaJ5y0RYVUWYNpwNUD2jCiiFNFpZ7vcn4mVuyI7aaaRJZ9h98nt4J
         RUD7OlM5wn/vUdymwZelpdzZI5+2JXXgSLISG73X9vfcIN6su0O4jigeIGSaahAF65ce
         JRmg==
X-Gm-Message-State: ANoB5pkY9vIDxXGfbfeiuxL8neeKdarK2jGMXZUjKkUVhnH2TlSZPzeP
        4ccV+tvi2+DKKkeI67ZhRX3WvQ==
X-Google-Smtp-Source: AA0mqf4KwwnWXCvyTJLAOg4Dq/b7ld3u8mbqH9lZwe5Rse4BDZdsEvxhv+A9ssNs9X84ndRBbFXsTw==
X-Received: by 2002:a19:da01:0:b0:4a2:29d9:6587 with SMTP id r1-20020a19da01000000b004a229d96587mr8447877lfg.477.1668606488497;
        Wed, 16 Nov 2022 05:48:08 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e5-20020ac25465000000b00492dbf809e8sm2593865lfn.118.2022.11.16.05.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 05:48:08 -0800 (PST)
Message-ID: <e75b8957-4035-5e3e-4ade-e7f44490e958@linaro.org>
Date:   Wed, 16 Nov 2022 16:48:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 03/15] phy: qcom-qmp-combo: drop v4 reference-clock
 source
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221115144005.2478-1-johan+linaro@kernel.org>
 <20221115144005.2478-4-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221115144005.2478-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/11/2022 17:39, Johan Hovold wrote:
> The source clock for the reference clock should not be described by the
> devicetree and instead this relationship should be modelled in the clock
> driver.
> 
> Drop the management of the source clock from the driver for SC8180X and
> SC8280XP. Note that support for the former is not yet in mainline.
> 
> Also note that the binding has never been updated to describe the v4
> clocks for SC8180X.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

