Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E03D714A4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 15:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjE2N0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 09:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjE2N0m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 09:26:42 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDDEDB
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 06:26:39 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f603d4bc5bso33862545e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 06:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685366798; x=1687958798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqVmt/lKkssBEDVutMwAhZNC3UM1BDf38fuEvYw0wZo=;
        b=B403hmt7S5VeGe9JK474af1Rjp2qrCUjbRyCXALxcG9CqIKa4cGSb/aYyafdCeUbwk
         rN3KNbZ7EQnMP+864/GLNzVsrcIJZEUJpAAWZEsoUKR9IXw4wzBHfzz+E9Lfj2/LJSWJ
         vMzwUIAN2SxfLQFRapLD3ksHEvEibga4R8WF3Fv5kqKAaE55Us+mUonjb4SBMDA2wg+3
         dYps8Vr3092spVmnImzBKIqqba5iF2br7HSCTaw2I9k83NYN7gC1oL9GDYddrBtigM6X
         hgva2e9xntIMo25f24dY151FTIjMtMOn9OswX/aYSkwnTdu2cbJFEn+ZkEfjFSOwnl+y
         Ifqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685366798; x=1687958798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pqVmt/lKkssBEDVutMwAhZNC3UM1BDf38fuEvYw0wZo=;
        b=IF3hYKi2CewvyFXp3hRFXqmwqibprnyTTxMEziuhzZD+wnsTSr7dvgymapXSvJWq6u
         UpY+Rv5BRHWRJ/xqaVq00YThBRfgDD6AsVSUEaL037I9A70TYQgjrI3BOVTwS7icYggU
         rbnG/s/18ZInuqFyrf0QYldW6EPmVYEPR+aecmd7aGunfNiAmuMAlrz6c41AMbPnkfBy
         Q3VZQsmpbI741s1IBEPR1fUSRdxYKvb4ma98eUtdwL6uhUoaimbVR72Ugqz/4734ZPjs
         gmKmDdf9kt+QDQAP1BitbUB6z0tVgXw8WWXvqvIwyKOEiQyk6L+NbaO4b2fi9e/ENZDB
         zZjg==
X-Gm-Message-State: AC+VfDxRlvRwpqPDCvKxAeG3oMVwEnrXWLGjfxTOyC8odfDkyXKoOOjT
        uk70erSQh2Ank3gbZ2gmsupkOA==
X-Google-Smtp-Source: ACHHUZ4kz1NRAy8C8TjVRhrx1g1eWYEQtznb381az0vS/v+gb7vgriYX5eDBIssFd2/PkgY2Qn9r2A==
X-Received: by 2002:a5d:6683:0:b0:30a:dda0:9 with SMTP id l3-20020a5d6683000000b0030adda00009mr8457691wru.49.1685366798116;
        Mon, 29 May 2023 06:26:38 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q5-20020a5d61c5000000b0030789698eebsm13712754wrv.89.2023.05.29.06.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:26:37 -0700 (PDT)
Message-ID: <c27fea22-e447-e8ac-1a79-fbc747878b30@linaro.org>
Date:   Mon, 29 May 2023 14:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8916/39: Use consistent name for
 I2C/SPI pinctrl
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525-msm8916-labels-v1-0-bec0f5fb46fb@gerhold.net>
 <20230525-msm8916-labels-v1-3-bec0f5fb46fb@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230525-msm8916-labels-v1-3-bec0f5fb46fb@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/05/2023 13:47, Stephan Gerhold wrote:
> Make the labels for the BLSP I2C/SPI pinctrl consistent with the one
> used for UART by adding the missing blsp_ prefix. This allows having
> them properly grouped together.
> 
> The nodes are only reordered in msm8939.dtsi for now since the pinctrl
> definitions in msm8916-pins.dtsi are currently still unordered anyway.
> (I will try fixing this in a future patch.)
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

