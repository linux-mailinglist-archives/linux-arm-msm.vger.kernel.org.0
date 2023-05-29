Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68FC3714A2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 15:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjE2NWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 09:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjE2NWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 09:22:01 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7D0A8
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 06:22:00 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f68fc6b479so33821005e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 06:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685366518; x=1687958518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQPnGID00Brxksr1LEFVX3pOkofF35RoN55bi7pgARE=;
        b=gDWZdNkikMtW4jwWJdMwNzOTeQk4XvTMscX5BPzfte6VLW360lle6e8nAPlUk9g/o8
         xd8wZgiMFPhfztetNazQ8wsnZQFaI88+oW4POxwsz+1GQuVs/DmN/acHJycNy6r+Ps7f
         fF3/keTavialx5OmeiHTOF6Ui4Uf7eEq9tMAVBM8km/Sd8ZuwJ85Q97IBqXr6/x+sjbE
         S3pGNhIqb4ct/ZeUSH6toXAJnGCgK5x4qhD7ueiq8QiYUL0B20fbb4yYJ7ERWOT2A0Pn
         gYxOZK/+sK82Nno81ex8nMHW0dQtNdc+u/9T/T7/QTYrHhCVMclfHrp3J+MHeQdik3RB
         Sokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685366518; x=1687958518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQPnGID00Brxksr1LEFVX3pOkofF35RoN55bi7pgARE=;
        b=Kns+92EzhhwV2gCKdgFQ0Kcb99ga21dcTKaTP1W+iyMfjYxP63GfNkrNEzF8LPvbQ4
         NOS/EUwli3V2CfFs6A+BsRLb5jSs6O2NGZEUvoE8YzbWADoGDVRhSXCHCLVBYuNwNmLK
         ooqB64P1nuQ6xPKc9e6defVAR10WkscQfUk8GpyDKfhQGTYZ0wuB4kHGSo+11AF+zJWw
         Qd3ogG+Bco1GLqiiqOsmYIpzVmxlePopkhcAXwVGavI1SX0edmEl5sMjVxI0saJQqqzM
         3kyY1ERr8v1EXmYS8LUPAho8z2Upt95kI1Q94ef+Ukrl9TSjdNiBQy7Tmuq+Lcz9K52I
         W1Ig==
X-Gm-Message-State: AC+VfDx0RWXYHSGRlcVsMj/3zQTFU5/jeLaIx43GHS8tXoZLFDHafIoA
        n+tR5iGr8CCXQoDE6BnXDK52ng==
X-Google-Smtp-Source: ACHHUZ7I186EtiGbOGB/RbLAQfHQJKOuhNb282Woas7dhrX98jASbnMChjEDiPUjYpdc2Fh5m03Dlw==
X-Received: by 2002:a7b:c01a:0:b0:3f6:11e9:de8e with SMTP id c26-20020a7bc01a000000b003f611e9de8emr8649611wmb.4.1685366518607;
        Mon, 29 May 2023 06:21:58 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c214700b003f4f89bc48dsm17990815wml.15.2023.05.29.06.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:21:58 -0700 (PDT)
Message-ID: <cf8f746f-93d2-8ddc-7e6d-6324322e46e4@linaro.org>
Date:   Mon, 29 May 2023 14:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/6] arm64: dts: qcom: msm8916/39: Rename &blsp1_uartN ->
 &blsp_uartN
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525-msm8916-labels-v1-0-bec0f5fb46fb@gerhold.net>
 <20230525-msm8916-labels-v1-2-bec0f5fb46fb@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230525-msm8916-labels-v1-2-bec0f5fb46fb@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/05/2023 13:46, Stephan Gerhold wrote:
> For some reason the BLSP UART controllers have a label with a number
> behind blsp (&blsp1_uartN) while I2C/SPI are named without (&blsp_i2cN).
> This is confusing, especially for proper node ordering in board DTs.
> 
> Right now all board DTs are ordered as if the number behind blsp does
> not exist (&blsp_i2cN comes before &blsp1_uartN). Strictly speaking
> correct ordering would be the other way around ('1' comes before '_').
> 
> End this confusion by giving the UART controllers consistent labels.
> There is just one BLSP on MSM8916/39 so the number is redundant.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

