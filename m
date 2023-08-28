Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4562678A9AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 12:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjH1KMc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 06:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjH1KL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 06:11:59 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4753F0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 03:11:55 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31c63cd4ec2so2511134f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 03:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693217514; x=1693822314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KxMYDWrmWip5GRfbWZcYYCMd0Q+v1s2v0orIqYVim0Q=;
        b=QGevEIm1sfSzY8UxpRtwVOVuxHMzTJ+fo/XN8g5T/iuNhopwhF4ODLs/OPXpkv0gCL
         BIMdWQnV6482PXKY5FXgZbVvaDui9cE5BfSsPiJCAo6owjiMyKu9PK0qIulddJLi2lXw
         hQRJjcbt9F4ZaYJXreflUBOHyS4z+P9dGkKFg1ywjkecKBqEU4HCu0bY4K4cOxkFDkuZ
         lyup6/ZH2qRk7vtTkck68871nuJEao7AF1T0Sejw7m9QTiJMifpDPMSAwJLTQH6iUTQ/
         K9mNgN5HVZkDg8FIiLIwL0aTC4uTMxBdEG+WhkyJC1+AI50L50QFGPnwXv10w5m7AZdN
         rb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693217514; x=1693822314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KxMYDWrmWip5GRfbWZcYYCMd0Q+v1s2v0orIqYVim0Q=;
        b=NgplT6OQSk6ep2LFu9yZocCnVuR4WRETtZePx/bDCtEg+o+vuh0ce6O9TndUTytqoh
         TiWHN55nohnopH0I4omw7pEO+DaEFjw55pqFf7RR17FjkZepqeNf3Lv6z7Rp3Ba2KTg+
         7vZNF7xLZ1ZkCYUEyKLA7jgMCPP78xgR16ZqJa1NPnKhbCaDA79xgY8uu2TqtJmOvwj0
         f+gdeOOzqVdBzGuClKNh0yrsAPZWKNoj4WB5XFyuC/6/qY4OivSTcNYnvvdCw7vnfPMj
         N0SDe7LYvCgvj6FzXKO9NvRWuU62Faycd/j74+apw1q+MqcUJ++V1IjR9FQRvZvgoSYU
         1v1w==
X-Gm-Message-State: AOJu0Yz5zM8Ih/J+ncD+jULPttprAI3sqaFABvPJCXNrWt9k3NuYzKQB
        3qECkIeDJvj36x9WIVOZnEY+Og==
X-Google-Smtp-Source: AGHT+IEOs4r8QYFAj4okhJBDJjLLb7lQLyIZ15BivCiEZiSKOrht5FCadlcERfkvPc1sCvEPUDUvIA==
X-Received: by 2002:adf:fcca:0:b0:319:85e2:6972 with SMTP id f10-20020adffcca000000b0031985e26972mr17116408wrs.42.1693217514261;
        Mon, 28 Aug 2023 03:11:54 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v3-20020a5d43c3000000b003140fff4f75sm10031257wrr.17.2023.08.28.03.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 03:11:53 -0700 (PDT)
Message-ID: <f8887296-5075-28d8-335d-41dc435a3c7e@linaro.org>
Date:   Mon, 28 Aug 2023 11:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] usb: typec: qcom: check regulator enable status before
 disabling it
Content-Language: en-US
To:     quic_huliu@quicinc.com, Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com,
        subbaram@quicinc.com
References: <20230828-qcom-tcpc-v3-1-e95b7afa34d9@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230828-qcom-tcpc-v3-1-e95b7afa34d9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/08/2023 06:16, Hui Liu via B4 Relay wrote:
> From: Hui Liu <quic_huliu@quicinc.com>
> 
> Check regulator enable status before disabling it to avoid
> unbalanced regulator disable warnings.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>

You can retain my Reviewed-by and Acked-by here but please spin a v4 
with the commit log fixed.

Good work, thanks.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb5

---
bod

