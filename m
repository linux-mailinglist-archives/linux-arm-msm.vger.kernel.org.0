Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA44B6E11E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 18:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbjDMQM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 12:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbjDMQM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 12:12:57 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FDF9EC2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 09:12:53 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id rp27so1744383ejb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681402372; x=1683994372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJ8yZnKo2ciUycy3fDWr4JbLsJRyFcG2ZUFoRMEKgTA=;
        b=vxL/Q7QEmmjX98MNNirP0+3OsrDOlCx6l7A7c2jbrF3KkT4xeoRS3RJ04WJGZx/Tv9
         Laru0Vso6Y7wEW8RSCLihGnULIXbRsZL4iLfrJiUe/rSpn65nToRY7OzXthKbrvOcJrF
         hRGjKKHWLRZ0dgjFXZ/0ZfSgyEvx/Wr7Umxh/pyc/Tq/UInVpGBmnqZui/iibfIHqMzx
         L+lqdhUWsasfbDv8wJoZk3sl+Otl19jfpyb/0gbV6pgm+CB3fm+/3b9NudHDgwa0HiAa
         eRf2IoeeUx3bKqhUzB8jQBn6YfGMysQ6ykCrlYe+6vxMsntuN8X1o3/VArdBI2s7qoHo
         yy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402372; x=1683994372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ8yZnKo2ciUycy3fDWr4JbLsJRyFcG2ZUFoRMEKgTA=;
        b=a5qytR0YfbQ0OyWP6vEDssb3mIDR5qq3iPA4kYqLXPX5RsM7J9vZneQlyLXC1fm8IQ
         8ryOqf+MnmybKpZDRc6Bl33616AqykA2OARaH4QtQ85zBYCWtSTMHA2SIQHTe/8zUXEZ
         6VRDVtY+q1E/1QJrQ/B08oJSqUyBjlWf1TZkcWjEUo+LphY51CV3H19w+SIYrtiatvyT
         7uElkPGutBKonSMpk88kMHJ/drztaeOAJjkDpnWu1B3Erw760n0a958ut7YIWLpg+N9X
         zl5LTKPQm/Uh2E6qmIz8yhEuwZ1GF6tIjPPim6yf3BJi+gUAUq+0obUqt0DT9R6eARs1
         jnpw==
X-Gm-Message-State: AAQBX9eqYLeQn+TKx+ughtGgnDXdXN2fG6TbjhfX3++XoPpshb9CF245
        CiEFm8WgtAm0UvZ/witssS4Xmg==
X-Google-Smtp-Source: AKy350aEyp4aOnI97LGS1Pu9EbHMptg5RVMwyBXZj7K1XJdLcNsUbvBx7m6ittsOeRa80kimevxypg==
X-Received: by 2002:a17:906:e82:b0:94e:68a5:b7b8 with SMTP id p2-20020a1709060e8200b0094e68a5b7b8mr3172478ejf.76.1681402371804;
        Thu, 13 Apr 2023 09:12:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5032:d2d4:ece5:b035? ([2a02:810d:15c0:828:5032:d2d4:ece5:b035])
        by smtp.gmail.com with ESMTPSA id j14-20020a17090686ce00b0094a57f50d7csm1148558ejy.200.2023.04.13.09.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 09:12:51 -0700 (PDT)
Message-ID: <3e361a73-797f-41c7-1ead-ecafee3928e4@linaro.org>
Date:   Thu, 13 Apr 2023 18:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sa8775p: pmic: remove the PON modes
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Parikshit Pareek <quic_ppareek@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230413131705.3073911-1-brgl@bgdev.pl>
 <20230413131705.3073911-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413131705.3073911-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 15:17, Bartosz Golaszewski wrote:
> From: Parikshit Pareek <quic_ppareek@quicinc.com>
> 
> Remove the power on reasons with reboot from the pmm8654au_0_pon.
> Instead, the PoN reaons should be part of different sdam_0 mode, to

typo: reasons

> be interoduced.

introduced

Anyway it does not say why. Are these power reasons not correct?

> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Best regards,
Krzysztof

