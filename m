Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC5F425780
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 18:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242586AbhJGQSN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 12:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242624AbhJGQSK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 12:18:10 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53061C061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 09:16:16 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u18so26879814lfd.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JPnT4IpQsu6GWrhFYest0dabRyyCsorT5rlqIt2XyBk=;
        b=tCO7+DXwMMUKzKawpnAckHOhMLHXBMexNKIJ71+XuvkEY6UqKTLBuoDOXeWkBtO9O7
         JEQStB4pAh7Q4JJmlmuqtfMOLaf/ai8bozykRxRPSbbDtkNI8iP+NvWnJ83C5Zyovkov
         NZC3DvM77HGpvnLFXQP9A95bAxrxP31Brdu+NnrRuUgvhziyD9/MWoLF4r3TPt8gAODm
         KgMKksJW9MG087YskbBg30CzgsD6pIYS6OGvIHQ+7yeJg/JM24WR8avFDW3rxUWZVzsF
         oZNVI8xFpWaEZ8dXV+zzF/+l01bBo3H1XG4Sm32rZJmSuyjgEGkb2TCWFw7fSRk3JTUm
         DzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JPnT4IpQsu6GWrhFYest0dabRyyCsorT5rlqIt2XyBk=;
        b=G+j9TAiLTF2PKY5ry71FUMHp7bjky/PBvSy+hUXO+Mvw4qUGTX5w0cPJEEgSGbeFx4
         HiqmXWeiRf7IXx4Kbjv3xzvPId9SN/Xi2EfT06KO77lFTdOW4Q2V2yotcrdgm5hXxiSD
         0ED8jEwQYU0DP0f0mamuxjFfrQHqUVSCY9aOLbtaWonJysfXZf6W7KJer2HstWaJewm3
         ggz3zdRl6rELAkbLIJI7j8kcvw19jS0ViaGqr4fjID68mG5Hy2eURueGRaRXQQ0H3ETk
         L3F2mckQNdg0Du77JuGvoZldznsymYX+6Lo+pFCOD5hdKf+cSDLPk+T6/gaetI1eFroQ
         Ib+A==
X-Gm-Message-State: AOAM532mf7LHc2r2Ji9VEO1AlU4LyyFjh7NDpsC0j2Pchhzun7mgfYm9
        atvwz5EjDYsIFtZqYzpXqKnjGc0RGRMs8g==
X-Google-Smtp-Source: ABdhPJyWyNkSm3vUTGocVNe1vwyuX9qAZbEiipyo4qdoRtXwIb0mJnifjuLeaXBLQUipK9GTsK5YpQ==
X-Received: by 2002:a2e:978a:: with SMTP id y10mr5411636lji.317.1633623374682;
        Thu, 07 Oct 2021 09:16:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p7sm434717lfr.275.2021.10.07.09.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 09:16:14 -0700 (PDT)
Subject: Re: [PATCH v7 7/8] clk: qcom: dispcc-sm8250: stop using mmcx
 regulator
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
 <20210829154757.784699-8-dmitry.baryshkov@linaro.org>
 <YV8WsQb9H7+CaLjP@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4614587c-b87a-4375-cb6a-6af6f5462c6b@linaro.org>
Date:   Thu, 7 Oct 2021 19:16:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YV8WsQb9H7+CaLjP@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2021 18:48, Bjorn Andersson wrote:
> On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:
> 
>> Now as the common qcom clock controller code has been taught about power
>> domains, stop mentioning mmcx supply as a way to power up the clock
>> controller's gdsc.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Once we merge these, I expect that the boards will start crashing if
> the kernel is booted using an existing DTB?
> 
> Is it okay to just merge the first 6 patches in the series now and
> postpone these two until we've had the dts change sitting for a while?

Sure it is.

> 
> Regards,
> Bjorn
> 
>> ---
>>   drivers/clk/qcom/dispcc-sm8250.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
>> index 108dd1249b6a..cf0bb12eb6e1 100644
>> --- a/drivers/clk/qcom/dispcc-sm8250.c
>> +++ b/drivers/clk/qcom/dispcc-sm8250.c
>> @@ -1129,7 +1129,6 @@ static struct gdsc mdss_gdsc = {
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>>   	.flags = HW_CTRL,
>> -	.supply = "mmcx",
>>   };
>>   
>>   static struct clk_regmap *disp_cc_sm8250_clocks[] = {
>> -- 
>> 2.33.0
>>


-- 
With best wishes
Dmitry
