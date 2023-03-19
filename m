Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A271B6C0115
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 12:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjCSLvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 07:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjCSLvt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 07:51:49 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BA8212A0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:51:02 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b20so3748034edd.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679226649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D8bpoRE3e5LV/CzWes6FBwbUytImqk6PipilJxsj7bY=;
        b=IzoyjbQ4nNjkmNW0+CgJU5IX290R+G5TCobpHK1bvykNNwIwj8L/vZeAeY08m+q+Lz
         +OawHsxrXLv6OHKInX24/LIXpnRbb6ttPpy/Oiv2WTW7SUss0ZX49k3uHshkiWXEQkTK
         AUFQBrvHdKkDRGKjFLPjbMm2NZtdSSHU3vB8VCfmw8IR5/BMNSM4Hvu8988wajqxnUSy
         wDd6UozeRZZ/MiwGAK9poqTYiQAMtzYk0pZzxCMwLKv6yahm3EolODVncHXc8evuX9x9
         L+4uj/qDVH6U9lAnAdz2Jf8eUD+c/PlJcxz+6rBgGL5Gd3x4hdd7wWs/2ALKtP/J8wQv
         F/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8bpoRE3e5LV/CzWes6FBwbUytImqk6PipilJxsj7bY=;
        b=YlGuMSXVKX8lTlXt9xsuYZ5foDSUu2RKNc1zCJlKz6CyOe7YSObPKs16A5p8XEMY2r
         U99Eap2JgMbQtndASVpQFnKe6T9qDECpQ3asGz/5QYsjZ3tz45lGsPDaP0TzXpxTu8iL
         /DWqrhW2zh1wp9371mATFAdqjrQeSLneykyJzs8dYeg1dxFWkDnScyOd5HcJxmMywiqz
         FoeQjR/BETwqFYOyfJ2fJw5Tcr5svgY/eXd8BvKEkX5+BFxJtZSawuCKP+/u8HyXYWCs
         DQKQTOFn0CMBWENAujFYZEbcAvrJaMkQXHuC11m4CTVZoHbx4B1stTOnyPtPZ5RjDzj5
         wejA==
X-Gm-Message-State: AO0yUKUzkZXFxqgLL1jub0jykLLk3Vv+5jTo76TCutRPj4xaH7OlElT8
        5cIH5ol1rZo7bf8KU0j9kA50TA==
X-Google-Smtp-Source: AK7set8gqJXALqWruM7I92SgRQvU1wMBeQ17mn8r1TSJ9yJo6FAzm+sDqmG+Io1Xvw3rj+h/wXO6YQ==
X-Received: by 2002:a05:6402:180d:b0:4fb:994d:42c9 with SMTP id g13-20020a056402180d00b004fb994d42c9mr9340499edy.24.1679226649500;
        Sun, 19 Mar 2023 04:50:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id l22-20020a170906079600b009333288d0ffsm1733920ejc.194.2023.03.19.04.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:50:48 -0700 (PDT)
Message-ID: <527070e2-f7d8-9b0b-fbb2-a4aad59588d8@linaro.org>
Date:   Sun, 19 Mar 2023 12:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 07/18] dt-bindings: usb: Add qcom,pmic-pdphy dt-binding
 header
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-8-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> Adds a series of defines which are used in the DTS and pdphy driver for
> identifying interrupts.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../dt-bindings/usb/typec/qcom,pmic-pdphy.h    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/usb/typec/qcom,pmic-pdphy.h
> 
> diff --git a/include/dt-bindings/usb/typec/qcom,pmic-pdphy.h b/include/dt-bindings/usb/typec/qcom,pmic-pdphy.h
> new file mode 100644
> index 0000000000000..7d39985bcc779
> --- /dev/null
> +++ b/include/dt-bindings/usb/typec/qcom,pmic-pdphy.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Same comments, same questions.

Best regards,
Krzysztof

