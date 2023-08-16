Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED20B77D9D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 07:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241903AbjHPFig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 01:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241908AbjHPFiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 01:38:16 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93D583
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 22:38:14 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3197a71a9c0so1545429f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 22:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692164293; x=1692769093;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8F8dsCkk6ZPrci6fxkiAuyGIgEKgA2xSQZz7L6wCHm0=;
        b=B2BOVwAVzvcsUEILOBGaR3Qa2q0ygXF+je8fx+7e9tlqwuwSWKXN5heJMWK7PuDIDJ
         tNjm+fcvPaGftv/zOkZ7CB12HMreW2biM9RlPlfd7C8lA1cwTFv/T0NKHHd0puKgy63y
         JkzfYkbhCFi3fvpeZQkPyrhM1iLv7425HO4uT0vI6G1IU0gIDiGDeyf9LH56hnJE+3By
         cnavjGzQoIHntNquQ/ORiCX3Hc2UfenePi03MBhZnDm2VA+uKAGPtBfPMAGN9POZMq06
         D1P5G02UvgX5qxm/EYoYRAnkUkR0Ct2+CuY5NUsWSC7RcGZzGfcWk7TI7eeq1j5rHv0E
         i3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692164293; x=1692769093;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8F8dsCkk6ZPrci6fxkiAuyGIgEKgA2xSQZz7L6wCHm0=;
        b=Ojx35Zj469stqAbcFSkJPs+e5lC1yrqvDxeYEAkg2Q+nA9aSFAAVQ/Ir5SZftqJ7It
         HTDKX7nLYubIuRsdjZU+dDR8QL9/5jvmiq+JNCs8+vsSMCu6q8B9gIi95IKHYLzpEWTz
         7ENrCm0/HOy4rU1Lt8c5FXDe0WiLHJccXJEvE/jkvy9+z4WSgYTcF3G7CnJFj4/daXLJ
         6stMMTtfnnXXixqO4GzxbL82LDvxewFzVccqsdy/9SErkD/MP2We0CzZa50QenB6ZXjz
         u41deHJQ27zZR2B/Hgf3YN2qpQTpCkpDeChsoNZFiwW4eXDNqoro0zloN1A1pQP/FArY
         hjuQ==
X-Gm-Message-State: AOJu0Yxn/WWS1T2p7vi37OOZQzxP9JXwapLqfYvRtXxebvKakK98fn98
        roOXjHiwf+0yalFWvh6JnEmQ8w==
X-Google-Smtp-Source: AGHT+IH8d0jEduR2jGvvdHBTTTW+3Pwg15uUMmJmSaTcjdGFrXK7owZU613L5tXrSuWbBeRmQ+pSdg==
X-Received: by 2002:a05:6000:1a51:b0:317:59ea:1c6b with SMTP id t17-20020a0560001a5100b0031759ea1c6bmr2444807wry.35.1692164293271;
        Tue, 15 Aug 2023 22:38:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600012cb00b003177f57e79esm7743919wrx.88.2023.08.15.22.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 22:38:12 -0700 (PDT)
Message-ID: <34ae2658-f6eb-1ad6-5d59-35ff5ad3a97f@linaro.org>
Date:   Wed, 16 Aug 2023 07:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670: add specific cpufreq
 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230815223108.306018-5-mailingradian@gmail.com>
 <20230815223108.306018-8-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815223108.306018-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/08/2023 00:31, Richard Acayan wrote:
> The bindings for the CPU frequency scaling driver require a specific
> compatible for the SoC. Add the compatible.
> 
> Fixes: 0c665213d126 ("arm64: dts: qcom: sdm670: add cpu frequency scaling")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

There was no such compatible in your series, so backporting only this is
not enough.


Best regards,
Krzysztof

