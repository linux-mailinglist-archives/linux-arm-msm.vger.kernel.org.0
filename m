Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3E063BADB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 08:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiK2Hke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 02:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiK2Hke (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 02:40:34 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD46D51303
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 23:40:32 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id z24so15849465ljn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 23:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKBkjaGLrP+hJZHWPlY+tg6ZuyURt9SchAR6qmGbE1k=;
        b=mm+0Kb3YA1Yz81IK4mWHnsINuNn0g1BQvrCfBDphg5hrUAZtpiIcaPAAyOuGDMkzol
         AH4daSmuWhKC/1CPK13CeurHSzI+myQ4bAJe5S94ChJNODhhAPpZRhlxe9yTr6LjRrqd
         EthmaObelQUuRKXLo1rmzzT61Bl1Bd4drhWaWE6SmCdHMWKWkReowG9sAnjnCaO3L6MD
         bVWico4+Bt1XzVZo6LC25wiJVvo7mRSsdtEo6ZRMglJGK+xhnI7Kpw1NGj0eALg9etKN
         Kj4FRDJ8uGFG22DwkVO+VLD2sm2SLTqW6f9As5T5syAyb5Ep3LPh0Og7ZgXeyvN36JAN
         5M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKBkjaGLrP+hJZHWPlY+tg6ZuyURt9SchAR6qmGbE1k=;
        b=mGgp8e3PIEcBijpr73gZEJPQCblkJNHg8378smDYaqR3pqGEdiwUujcD22ENGpn9If
         m9gHOsun/4iIZFX+Vvoc+UitYQ5qL/7yMFW+tAhDifRSPHARDKLQJFyjMdtk/TbM6YVw
         EPkFvp+Bmeeazu+Yvhr14FD6znhCjxEP9+JfjvSnj3cxuxRhyGfRjHgOEmM+xEESGSP8
         Vm9Wsd4+MPyxERDHBG/iwph9kJIXUkuiVd8B5t4sXX32F6YaSSj6uWygE2sJpXZss7nI
         wh0uu1kPLTT0k2HEP6W3Zmz3qv7Z7fiC7GfYKbEs6cif5Y9rbbJ4wpLfh4kUt26KXHpA
         Q0FQ==
X-Gm-Message-State: ANoB5pmp5NwgUN8hRgFzV7RRdgo+QS/c9nP08jV8c2Vu5ojqrjaozdqb
        vdp3M6LeFC0XBoRc3DCQphB0sg==
X-Google-Smtp-Source: AA0mqf5OJOej2rZM3WY0TlmkZzHNQ06DoIYrfWY2jiAevxbN1beNrVc2UNZHhG5OXXgk5fDAHpvnSw==
X-Received: by 2002:a2e:7e05:0:b0:279:a6f9:e587 with SMTP id z5-20020a2e7e05000000b00279a6f9e587mr2667748ljc.89.1669707630976;
        Mon, 28 Nov 2022 23:40:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d15-20020ac2544f000000b004ac393ecc34sm2080102lfn.302.2022.11.28.23.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 23:40:30 -0800 (PST)
Message-ID: <29c3fe33-de57-832f-dbb7-ce50968af5d2@linaro.org>
Date:   Tue, 29 Nov 2022 08:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] soc: qcom: Select REMAP_MMIO for ICC_BWMON driver
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20221129072022.41962-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129072022.41962-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/11/2022 08:20, Manivannan Sadhasivam wrote:
> ICC_BWMON driver uses REGMAP_MMIO for accessing the hardware registers.
> So select the dependency in Kconfig. Without this, there will be errors
> while building the driver with COMPILE_TEST only:
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

