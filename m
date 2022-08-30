Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3665A5B8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 08:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiH3GLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 02:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiH3GLB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 02:11:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CCB61D9D
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 23:10:59 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bt10so14132662lfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 23:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=hUQZ2ejLKEXtWhiFjkIEXiKx5+7W4LSI/qrPj7Va8no=;
        b=DjSh7ZrxojdvW/IHtazfcEv3r0dT3Oa1ZJ22pgkSZwBwa0goaY+VpApIDLBgzjgT/Z
         J/LTlLADyeMLChodCmockA/RRD5mBOJOB7GrbTBe16OP4/nuIXZnr5qZzU/+HH/smwen
         bSW6mOa6DuPl/hb34TrX6RuXrMPVCSsQ9FkLjbFfptlMED4UJVH5E/Va9RulZuCSI0Ou
         fqLQPzsb8K4/g/3idBKUfBqJ4IVU4sjqErKdF+f+zDvGZBp2wdEjrDx1ur3uHj0k40Dg
         Lox8PQYC8kQUTI1Vd+C5b+Kzxox6kQO59X01VhjKWNTrfMe+1zmARq4YxZnluMNhJSIL
         lzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=hUQZ2ejLKEXtWhiFjkIEXiKx5+7W4LSI/qrPj7Va8no=;
        b=rYBG7lFfibHhc4sIL/USMoUW41+chibKJ6pCLdqIdLpCpN/uFvu2pbtZZCWWbE7D9O
         DICirEtDw3Hwvb7AxeJh0QSL2+kEJEQzCnjd5zOX1+mvgVj1rbrKo0Ummd+ZVew0J4Zb
         dRFVILZ7kPQrJEZaE5se5KZz1LVtsr0nhzHDlnE1W5ci0sWiE+sVl0Ajnsvy0GkbgP5K
         wH1hQ+Y4Gyy0MyFMIow3tljTRXvrPio+fta885f32sQFaCYr2iK2kCOo+coAc/+6oSad
         Od3D2qMU5b84jsaAtgYEbztwZXCkm6yxPJY5JLTX46X2zDg13xwnRNqJAhhU6QpSSGhM
         Fjjw==
X-Gm-Message-State: ACgBeo0jeRY8cmZKLdCkjWff7pkF2rYoDypENntbNExyFMPNiLYJNT3L
        RrQqxnDb45V7FpJW6EU9iu3KiQ==
X-Google-Smtp-Source: AA6agR7YIuHSExFLCmMqS015z962FMdrfJfgCt1OY2a8PJgFrirhqrDKu3uVqX7f0kX0kQERhZsUog==
X-Received: by 2002:a05:6512:1521:b0:48a:3c5d:5d17 with SMTP id bq33-20020a056512152100b0048a3c5d5d17mr7007337lfb.587.1661839857716;
        Mon, 29 Aug 2022 23:10:57 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id q18-20020a2eb4b2000000b00265757e0e66sm638874ljm.48.2022.08.29.23.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 23:10:57 -0700 (PDT)
Message-ID: <ef905cd6-89fd-f274-7848-ba43edc8dab3@linaro.org>
Date:   Tue, 30 Aug 2022 09:10:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: add missing compatibles
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220828065123.39734-1-krzysztof.kozlowski@linaro.org>
 <20220829220836.4487FC433D6@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829220836.4487FC433D6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2022 01:08, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-08-27 23:51:23)
>> Conversion from TXT to DT schema lost several compatibles.
>>
>> Fixes: 3f5117be9584 ("dt-bindings: mfd: convert to yaml Qualcomm SPMI PMIC")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> 
> Unless you want me to pick it up?

Usually this should go via MFD tree, if Lee is around (I saw some emails
about OoO).

Best regards,
Krzysztof
