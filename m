Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91FFF62C60E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 18:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbiKPRMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 12:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233987AbiKPRMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 12:12:44 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC485987C
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 09:12:43 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id o4so30847721wrq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 09:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SS13jutQzsVnuHsIxaZzTMZ4qjoqAtaYXdQokyzf1QQ=;
        b=rUSCpZAXfgOMIW6a97mzdM5ZCgsOqot1SrKCKEfmkILfjrm1oNL9QVRdl82DXPzHnc
         6TKEdf5oSupNRWuq8gqp+YMsIyOwS0Uf8rVMjUmWIkVQQjv02XbpPvjXxSmLeBSxVYPK
         WUKEaEqDxJYQkvJEjM1BcC1vB02En0Y9JVXLUeNKhD8hiRQhfHMAJnfClHi9kPtKpi35
         D3vz9DDJ84vyFyTYr7Y4so9Rsw4jU69gahYaG8f4clpC7wYQrunDS9kE1cCQNuaVaoSZ
         hxd09mtec7uA+EYAgooznSZQVV4SqivyS/UUbTZJnww198Tu3G43O4LvAwz1T+8n41lQ
         HmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS13jutQzsVnuHsIxaZzTMZ4qjoqAtaYXdQokyzf1QQ=;
        b=mT24FjPYJKtieMxSZa3mhXI2bSkwAWgJ6oR5KlSQ0Z4tzMaT2VntzKCC4nuc9J2Zf7
         D2QywpBA0n5ro8p7JbSf9ZtMJ4fC6MlnrhCIeSuzKkxsswr3dbxdN8PO/Pm8qxAdA7NI
         gdUR4Z7mhJJ0IoTDSNmNRYhQxRrukI1uW3ck/bjRS8xuNquiYpxW1hlm18VgfQbw1TLL
         070Pq3jkiilgRRK7OeSCYl/SzUJdB7bXOZEJ2wnUFrtptyHAsd3RE0e8F5lkHyYMUg41
         8nOseAPueomf7mVdeEgvzz13ODKS6xzsouMJ29m5tseVSSbGyZYVnPYmi0FgYkt5NCML
         BYIg==
X-Gm-Message-State: ANoB5plLjLHmaLre1e7Bs1Hato+SvzBh142/0QK3DpB2j/5f9kh2t9xh
        IxzFp8a6EmaxZWr/2SodpqR+kQ==
X-Google-Smtp-Source: AA0mqf7wanB2B1LgkVQ+IuL1BNUZ5YNLx7YT2Euv4f4TSg1ZrO2byd2ULUScXoh6u0AlabX9xLCAqQ==
X-Received: by 2002:adf:dec9:0:b0:236:860e:7704 with SMTP id i9-20020adfdec9000000b00236860e7704mr13925019wrn.463.1668618761777;
        Wed, 16 Nov 2022 09:12:41 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a5d554d000000b002366e3f1497sm15897540wrw.6.2022.11.16.09.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 09:12:41 -0800 (PST)
Message-ID: <559bf773-c03d-29db-e8f2-aaee20189dd9@linaro.org>
Date:   Wed, 16 Nov 2022 17:12:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Add vision mezzanine
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, robert.foss@linaro.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
 <20221116162801.546737-8-bryan.odonoghue@linaro.org>
 <3aed0e79-1efb-d6ad-101e-84a5202776b2@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3aed0e79-1efb-d6ad-101e-84a5202776b2@linaro.org>
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

On 16/11/2022 16:40, Konrad Dybcio wrote:
> Status goes last.

Hmm, that's a new one on me but sure

> With this:
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Thanks
