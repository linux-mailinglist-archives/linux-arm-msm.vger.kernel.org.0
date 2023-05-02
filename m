Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56C2F6F3E1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 09:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233597AbjEBHFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 03:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbjEBHFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 03:05:08 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83A949F8
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 00:05:06 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-957dbae98b4so517359966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 00:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683011105; x=1685603105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L51EizQC2zCWZYATlatpVUpNqpK8pQtdGLE44zI48wo=;
        b=EQJI6zRs3pAfQDf/7lSLopw96S1ujOqVNDMRNdEsvQtdkxm8j0TmgoRvAsO93wUTAM
         QCBWu6cgGRwTRFghmt0r4s1Ruyuu4KoRBrcF1ataNmprYQs5lCv7L38EuJY/Pn8job7I
         xX87snBk8G2IiShy+Q+XxIE+r5SKEjH9ug0lzxYb2zaRpW0rFWZVthpot0gyjV9zDBUG
         4N0F5VcCrGw2Dd9BxMNh2Yn8lN3B1/OlDfxL9Q2IfsstW2XxBy5GG2KtR3L4n9fLQGGe
         0nUg+ErHjOE4ocmx7ujuKXSVEJxMzafSTsV0K+4jQlsfQh1WOGOBAY9qu4ZNwf5jzItd
         crbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683011105; x=1685603105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L51EizQC2zCWZYATlatpVUpNqpK8pQtdGLE44zI48wo=;
        b=YG2aP/DQa7RhdktlsPcMfd7YLCI7sOuArUCSIrhH+mHPYHasJ3pCyJ4GdSIQ7CnHKp
         Ts3fafW6Ut4hWWJfCbosF8QPneIbEcw/iXGv1PrQP8/EMO3hTqC87eUPFZed0iekTRCA
         sY5eY5I93FrXiyZPeI+t+PPcQV/eElpZKHCrk0awvrEdRNgw4WuFeITpx+6sYKr/WVyK
         m4COj4ePWWD6sx5dAzKb9WuUUhbOJTw9Osq8Ihk1xHuCP360njXFkaBc3hJkzdN/xtMf
         JlSaIl/kz5WA/4cFMvPHdYvo277+OPTVx3XkA2s0hMZt9QpbbHTqrXDb2oyeukzMTN4A
         lmNA==
X-Gm-Message-State: AC+VfDwRxBiwPnA+bPmPzDBpKzLPn7kXSiWw7k+03m2HTWHuVNIM/oHj
        7CfdDEDdladNGKyGUtwUjlN2cQ==
X-Google-Smtp-Source: ACHHUZ7CVJTGcPdEy1k95ZcsIWZuDKMC0m72NOp1oJscMMQSrXzv7qrGJEOHhnhtX5PfuLE2VW2Q0g==
X-Received: by 2002:a17:906:7307:b0:94e:e5fe:b54f with SMTP id di7-20020a170906730700b0094ee5feb54fmr16353459ejc.23.1683011105210;
        Tue, 02 May 2023 00:05:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id t25-20020a17090616d900b009534603453dsm15520709ejd.131.2023.05.02.00.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 00:05:04 -0700 (PDT)
Message-ID: <d280b9c3-7d91-1a1a-0634-a4a079f0ef9e@linaro.org>
Date:   Tue, 2 May 2023 09:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 02/10] dt-bindings: clock: drop qcom,lcc-mdm9615 header
 file
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501203401.41393-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 22:33, Dmitry Baryshkov wrote:
> The header file for qcom,lcc-mdm9615 and qcom,lcc-msm8960 is the same
> (as well as the drivers). Drop the qcom,lcc-mdm9615.h in favour of
> qcom,lcc-msm8960.h



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

