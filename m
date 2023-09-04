Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D0D791188
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 08:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbjIDGkh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Sep 2023 02:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjIDGkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 02:40:37 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD08BBB
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 23:40:32 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bed101b70so169884766b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 23:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693809631; x=1694414431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ln6iy2vpesj9vkVeD945ywUL7jWVYDR4q5RNUFWQJwg=;
        b=lVvBjJaQ2zgKPhU/+dPa08gyYExRJDJwiMOIrZp8RHPicNjR1ntVp/A5yZgWbeWOxX
         SBZF7GqqnxPpn9vM1DRbutgjq+Fzf6+SzkO8gTWr3kmvkU5AO27Mw+UwFsBipvzfzBQ9
         LCu0GHmLfWmG+Yy4+vGZtLQdky+vnxfxQPKHv5MEXwwAFUiDT0k0AEYw3I6B/6B1Mpo6
         b0lN/N1MTj0I3wUjiluej4GidZkaAx7E6lDtA/VMgkogSluy/gq0wSKshbWnKTnrPVwS
         zAfpwDOEoDjghtLPxozcU9jHGMKM9qxCWyiYRJOSUTvRIN8QuwF3d7g65+qNY4l3xg/Z
         wz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693809631; x=1694414431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ln6iy2vpesj9vkVeD945ywUL7jWVYDR4q5RNUFWQJwg=;
        b=RiYdjQUW0w8ihMJu5NAfok65jGD0IPdXTwOhttDSeQG6xPTSQsKSCHLxs2nJf5JMYe
         gvElAzyBWTpHnoavW8mzcxlci9dG4HE4blfE/a0R8bdrnK6hDXcVD248WS1o8b3w0aex
         BkwINNqBHscp+KgvYoKky8Mgc9Qm3cH/7e45CunTH7/POHfeU7kMxHONIR9u0D0wzlGQ
         ALUYDFE+kTh4MGccM6fvGaqiTBk+zHILqHwqV332/vPqSMjBgVGH7amdf6/h2t9f4tmM
         J0SF3D9TzGypPswJyvJvtGfbaOyOS9onCpSBC+8KjNULdNnh9Y4GNTXXkTlmoFg0DqhN
         C1zQ==
X-Gm-Message-State: AOJu0Yzz83EOPV1YxapyXMEdQJhlFJJRP00gpJLZ4Sk3ZOpmf1wC8qeS
        LotekQROq5EWajF6B8eNmS9zTA==
X-Google-Smtp-Source: AGHT+IEEsbwofxQHFtc312dDFAuxOwANF5Ag/tDLHGOKo0BqggtDDKZuvwJWZe0h+VY6Phfi1spQfw==
X-Received: by 2002:a17:907:271a:b0:99b:dd1d:bc58 with SMTP id w26-20020a170907271a00b0099bdd1dbc58mr6984278ejk.41.1693809631395;
        Sun, 03 Sep 2023 23:40:31 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id l14-20020a170906938e00b00992e94bcfabsm5685445ejx.167.2023.09.03.23.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 23:40:30 -0700 (PDT)
Message-ID: <9380d42a-2c24-89ad-14ca-99e0f1ffcbf7@linaro.org>
Date:   Mon, 4 Sep 2023 08:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: ipq6018: Fix tcsr_mutex register
 size
To:     Vignesh Viswanathan <quic_viswanat@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ohad@wizery.com,
        baolin.wang@linux.alibaba.com, linux-remoteproc@vger.kernel.org
Cc:     quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20230904055010.4118982-1-quic_viswanat@quicinc.com>
 <20230904055010.4118982-2-quic_viswanat@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904055010.4118982-2-quic_viswanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/09/2023 07:50, Vignesh Viswanathan wrote:
> IPQ6018 has 32 tcsr_mutex hwlock registers and size of each is 0x1000.
> 
> Fix size of the tcsr_mutex hwlock register to 0x20000.
> Also, remove the qcom,ipq6018-tcsr-mutex compatible as this maps to
> incorrect stride and mutex config for IPQ6018 in hwspinlock driver.

This is 6018, so if 6018 compatible is incorrect... this does not make
any sense.

NAK


Best regards,
Krzysztof

