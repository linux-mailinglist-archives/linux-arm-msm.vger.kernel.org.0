Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3A7D6FB51A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 18:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbjEHQ3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 12:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234281AbjEHQ3p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 12:29:45 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6F16A5D
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 09:29:44 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so50324329a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683563382; x=1686155382;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPXDrt7IdOrTqCpkR1P8P9GF2BAzVLMP6fdtVkD62YU=;
        b=VvP0og3f5cmbDGbGd1xw9V3u3C6S5YE2rrod9+pT2+E9v/AUMEw93icukbqxdZMTsh
         ohSwWQIgiywbxOHp9e6FwjdxmUR7k9O013E1ipNNPgZ4T1sERNwkK7T9GfUErwesBWzA
         svYyeKrOZeviLGBjpu6q/ISIPDLOfGNWA3GkAxZ90YXgVD/JcgEYPEJSDwVhJjrcZh2l
         LCq+WGGNGTa+MGObb8jJUR22D1lblvCDGYslAoRTZIYbyNy3lTu+7wmM3CfaZcHi6Yhx
         FrUMsKGkLo3X+5JPHfKXYz+4zALgHU872/2pSZmfToIVRsTEKJEzNcI7+kOfRoEo+5Nl
         IM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683563382; x=1686155382;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPXDrt7IdOrTqCpkR1P8P9GF2BAzVLMP6fdtVkD62YU=;
        b=ZqlP9LyNp+2pHfQqnQTeTUKzzhoYW5u3fRT4XwEjZlHwu4JsaKaxXdNcOF643+yKL4
         UvFDi0CvU1PW4VBrCzhyRXQTzgyMF5pM3b2fQvIUcCVSigD9wiC2Jtk15hT8cIpvyZLN
         y551NCMgDBb9wepe0UwOf7nxkflqaFYzj6EzsJvJqxjFA21ndLyH1dS3u9e8d1hv3xtZ
         Tp+chTInT37Kyg6qZQwazffe/7zIL/vW9s9Dzei73WhVDDVZGmw0dVJlyTdTbuqEFPys
         pNT6RpWPRwfWZE92VYrxaNpb3gLbAsRSB2x/whqO1S6nozyUxwwSqcdE4nhBFCdUhMvb
         Fzmg==
X-Gm-Message-State: AC+VfDysDU/YVjF/urdaz63eN7QH8q45Gsm5OWsh+HZsluwFZMxwGlNw
        y9EQKIK+CXoOi17arb+Bny709Q==
X-Google-Smtp-Source: ACHHUZ4XCLB7diXWh2eH6vQIehFRTxYyC4M/HACmt20ekY8CVuLLA9UmmTAZGeXfTQ2DmPkYY7iaYQ==
X-Received: by 2002:a17:907:3dab:b0:94e:6edc:71bc with SMTP id he43-20020a1709073dab00b0094e6edc71bcmr9641816ejc.25.1683563382690;
        Mon, 08 May 2023 09:29:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id s19-20020a1709067b9300b00968a2286749sm168999ejo.77.2023.05.08.09.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 09:29:42 -0700 (PDT)
Message-ID: <1231934e-04d2-7c63-1eac-64cf86a7a3fb@linaro.org>
Date:   Mon, 8 May 2023 18:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: add SoC ID for IPQ5312
 and IPQ5302
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230508152543.14969-1-quic_kathirav@quicinc.com>
 <20230508152543.14969-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508152543.14969-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 17:25, Kathiravan T wrote:
> Add the SoC ID for IPQ5312 and IPQ5302, which are belongs to the family
> of IPQ5332 SoC.

s/are belongs/belong/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

