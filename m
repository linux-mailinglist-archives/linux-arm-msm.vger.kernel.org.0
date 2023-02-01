Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED8116861AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 09:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbjBAIbg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 03:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbjBAIbf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 03:31:35 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835F113D5F
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 00:31:33 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id m14so16035840wrg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 00:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pi0S5+v/dBGmGVxhgYmKDghiP8zJ5sWOP0ylESbi+7k=;
        b=fG/QGmR5VksUXnmQhNoukzfjbbyDB7A74onzir5+DEx4e94JhgCzpbjGq4nOlpfqSW
         nFOjDFeHhx1+d3h0hKjty7sPkjEHUMN1LB/QDlt1Vct1Y2wgkPPvj4a+Vb4/HLfsQHM5
         /hdkNzg/PVnNGHIMfbkDXdCxSk/KBvMQL6rbrGrVeotzDwPeekHZ3Uljz6/QB1cqErOB
         MhB5gAI7/zyFa/QgDuS74V4FC+B5QU09Y/fLq8nj8ri9/lNdy8Dgbe98LsS4U55VfNWQ
         U/8McNqFy+FKqVUDzS59v1l0PWjIOo4YEkwD6TINblmcY/PoL1uAV4/OVUSZgObnxcyE
         sOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pi0S5+v/dBGmGVxhgYmKDghiP8zJ5sWOP0ylESbi+7k=;
        b=rB33iz2FxMTvGVfdidsvE322q6kR+zBiFy2j7nOWMPuDi3J970MFfrG7LPCl0WwOiJ
         xXeFX/cZogr2fXRCwQhP7rDATsQbaQlR+z1f/s5rgf2LlgkuN9NvmwTSyoUnw7CeDWnt
         apkHPy3fxYUIzRk9SKiXB/0IL7L83nZJeeW6btsXzZsoBrmKdTOmZju0AaEgXWi4O6ha
         10V3cPbiDZC1TO5ap2HaR2+I/tKOzoues5vAw3a7JNRNSDlL0WH7dzUpHGHQdGVuzARP
         xBsqMiRgNsDwr2H6/m5jpsfvyaeT7EqeaXgu8svvLJUBhm5oVt4Y1e5wfVK8nYty4BxY
         BBlg==
X-Gm-Message-State: AO0yUKX6z06x8eFXAAj7UDuPk7QaoZ4vwNZtCACk8VkPpaj5c9zHnTpI
        QHPKLCYAX2ZOBwGfbqhqPxzRRA==
X-Google-Smtp-Source: AK7set/Im4s46L4B7cT6IGbLvDVrKykdy62E0HrrXAX5LzGNt6DPUwIprpzv7JMtMhRChrwL6HIxVw==
X-Received: by 2002:a5d:4bce:0:b0:2c3:24f3:8b47 with SMTP id l14-20020a5d4bce000000b002c324f38b47mr1618945wrt.31.1675240292114;
        Wed, 01 Feb 2023 00:31:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b11-20020adfd1cb000000b002bcaa47bf78sm17783053wrd.26.2023.02.01.00.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 00:31:31 -0800 (PST)
Message-ID: <d3816502-6c18-db97-cd54-c4802dea65c6@linaro.org>
Date:   Wed, 1 Feb 2023 09:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/7] arm64: defconfig: add PMIC GLINK modules
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v1-7-0b0acfad301e@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v1-7-0b0acfad301e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/01/2023 10:54, Neil Armstrong wrote:
> Enable the PMIC GLINK core, altmode, battery and UCSI
> aux drivers as module.

Please add short "why", e.g. because they are used on Foobar board with
Qualcomm XYZ.

Best regards,
Krzysztof

