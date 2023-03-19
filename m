Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98836C0112
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 12:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjCSLvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 07:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjCSLv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 07:51:29 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DED1F48E
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:50:38 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id b20so3746826edd.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679226634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rumD8lIzWRdrpyfCHMg2b/usSS2zheCCdMmehWl07mA=;
        b=cziGIdIyrqTfReP+t7/JHLiwNUpobHVwZNBl7jLTJMuXy6gPdKmJl4hCPEdOgW1x9R
         uHrAgmgE7bu242+ZbyQkPWqx5hYloW9m9Fe2QAZ24wLMupHP06QJC5qUFhofG4NROaDh
         GIdB8j5uEqf0/4CxaVs/Q5in73qCF1lKcta0fMJwmOlg0Q+qGJUFE199Ht8FJS7n6tF0
         YNKMLPQUyi/+UJTMtR3WqC3YVrEpb8ygYgThAeYcMKw11PsQPtgAfNZM3gqeJtCXJt4H
         hnm0SEj8uRuBUWXTbmAKv73dBlrPjg461vSRVIVL62eA2x1R1giiOwcMtKqK02rKh/UW
         Z3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rumD8lIzWRdrpyfCHMg2b/usSS2zheCCdMmehWl07mA=;
        b=HpWHc4zgMHInTniQlOY8EbqoDB+4VMAw4vaKkrjqBUDAemMTO4NdlaBCBHQs0awR8u
         2K9G+7cqukXBxDKaxLE99hiyvFmP+Q6fbYxhw5Km2wr57DhZ3FtJOc3xQNxwUEcSdWqm
         A1hJwTQGqxYnV63WPSoUGLhrTGsVSJB6lH07EUutTlqeKU6hOCCs9xU5sWzL+38qY32O
         bMKwCi5mliM8zcv3PKLO2wVlRXCWQKA/wz1IBR3gVK81e27O632rQcxoj5aHpWw/myym
         qCz2hZ95AwzHJur9D+rvh6yYPhb37bQ17tLHPAy4Jg41L38uO/KDUNQatPYEJVvH7/qx
         sF8w==
X-Gm-Message-State: AO0yUKXcOdGkVihEozIgx9qJgTP7zqdE/JHvwIduo/obzw/+qjkeEUQe
        1urD2oBoaYoVpsbnJYJY2wFZyg==
X-Google-Smtp-Source: AK7set9jJ6Q1NcJ8YSB6BpXes/pSO6lmYVIUUaia3CwbeWp3oglUuGG+EwwbOFYak6klMULFzGZERQ==
X-Received: by 2002:a17:906:b255:b0:932:c1e2:998b with SMTP id ce21-20020a170906b25500b00932c1e2998bmr4851565ejb.15.1679226634358;
        Sun, 19 Mar 2023 04:50:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id 1-20020a508e41000000b004fc6709cdd6sm3438665edx.35.2023.03.19.04.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:50:34 -0700 (PDT)
Message-ID: <c1f91a8a-2844-393b-6dc1-127828446c6c@linaro.org>
Date:   Sun, 19 Mar 2023 12:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 05/18] dt-bindings: usb: Add qcom,pmic-typec dt-binding
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
 <20230318121828.739424-6-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-6-bryan.odonoghue@linaro.org>
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
> Adds a series of defines which are used in the DTS and type-c driver for
> identifying interrupts.

I see your driver uses them, but I don't understand why and what for...
Why would we define them as bindings? We do not define interrupt numbers
as bindings. Why the driver needs it?

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../dt-bindings/usb/typec/qcom,pmic-typec.h    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/usb/typec/qcom,pmic-typec.h
> 
> diff --git a/include/dt-bindings/usb/typec/qcom,pmic-typec.h b/include/dt-bindings/usb/typec/qcom,pmic-typec.h
> new file mode 100644
> index 0000000000000..733e23b6cdbc4
> --- /dev/null
> +++ b/include/dt-bindings/usb/typec/qcom,pmic-typec.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

If the file stays: dual license.

And squash it with next patch. Binding headers are not a separate
feature. It's the same as adding bindings.

Best regards,
Krzysztof

