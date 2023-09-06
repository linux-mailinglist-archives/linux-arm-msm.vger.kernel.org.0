Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CB579386D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 11:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237191AbjIFJis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 05:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjIFJir (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 05:38:47 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170AB10D0
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 02:38:44 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so4910487a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 02:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693993122; x=1694597922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHg/PnZPAmHNCn9sgOYr+tYtY1Bqd8zviST80lc2aw4=;
        b=r9XJ49dlJG192gaIxnY628pDp9it358verdz1sqfGt4eZHs0FaSVtcp30u9vvBgbRG
         N5rIO968zNk8ej8kE4sj/TVhkHr6+s/NAkxFuIi/bT86HA3bdyu+dZy8rFbHhyBEUtWK
         kLOcreQAHdBgjKv9Y1NJ48Kj5KR04IbzYViddrXpNpZvGXoBRqJUN1RsGULDYPs2EDbl
         krM5KGrxpNNejfNxEQ8wr9F3ScYNNDpOkCBN83TP64ExadffvJEW7DElL7YrfQLJ4cwv
         Dwokfh8q5R/Y7dyojDAUZh8bTJ7lTxNPo5N2p/ZhMC2LLutnGZmGw4iOPGgpkp3KIqSS
         eOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693993122; x=1694597922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHg/PnZPAmHNCn9sgOYr+tYtY1Bqd8zviST80lc2aw4=;
        b=MxO8mltt547bEMMK+6fFNzzXxXCTknasIKSIPx5iwp05w/Tqo9QrLJAyNQIaQZ7EXP
         nxDvU184sQk/BbjAy8Sz3CeG2iD6GF9M0aDSkYJ7EDMhEFK0s8Al/Ulf4wmJOvzAL6Bz
         0g8+JaR43BcwF7crM+prUpm+XP3QqXQ7WiO1XYr/3IiVzKU6pItJ4xs4nRMibuvtVo0w
         JwZlNLTgclpBujPNJdaD2Wk5aD7seJxiqzjpy19lvF6gQ1vt47aiXORj9u/4QZqMT9qf
         rRijjs/u/c8yX5/YXM/hCYBiwQsHOgU56nfJUUhDRHdsJhw7qjMZlhb+ikozjNFLZWaJ
         OCGw==
X-Gm-Message-State: AOJu0YwR8LCVf/cOzt1ei+lmdGH0s83E45Eva+k60CNL/KiaJlJXdRH0
        XLAqoKSSdjFLOlsiF3gdQeum3A==
X-Google-Smtp-Source: AGHT+IEwkq2sY4g0DPxicF7yqTjk6DEJ2KGo5cVCVztNdl+qSYXNw4B9GRl4qit7TtYJmTRtKVKrEw==
X-Received: by 2002:aa7:d402:0:b0:521:e502:baf8 with SMTP id z2-20020aa7d402000000b00521e502baf8mr2201320edq.11.1693993122553;
        Wed, 06 Sep 2023 02:38:42 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id r14-20020a056402034e00b00523d2a1626esm8244673edw.6.2023.09.06.02.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:38:42 -0700 (PDT)
Message-ID: <c32d93c1-a7f5-6e8b-cd43-96479c17899a@linaro.org>
Date:   Wed, 6 Sep 2023 11:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qrb2210-rb1: Fix regulators
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
 <20230906-topic-rb1_features_sans_icc-v1-2-e92ce6fbde16@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230906-topic-rb1_features_sans_icc-v1-2-e92ce6fbde16@linaro.org>
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

On 06/09/2023 11:24, Konrad Dybcio wrote:
> Commit b4fe47d12f1f ("arm64: dts: qcom: qrb2210-rb1: Add regulators")
> introduced regulator settings that were never put in place, as all of the
> properties ended 'microvolts' instead of 'microvolt' (which dt schema did
> not check for back then).
> 
> Fix the microvolts-microvolt typo and adjust voltage ranges where it's
> necessary to fit within the volt = base + n*step formula.
> 
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: b4fe47d12f1f ("arm64: dts: qcom: qrb2210-rb1: Add regulators")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Dmitry fixed it already... but apparently never sent it upstream, so his
loss.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

