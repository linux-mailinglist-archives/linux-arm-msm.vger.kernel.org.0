Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2054A6B686E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Mar 2023 17:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjCLQzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Mar 2023 12:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjCLQzj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Mar 2023 12:55:39 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1CA3019E
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 09:55:38 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id s11so39692098edy.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 09:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678640136;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POqbeetOAweEyMtCxvkBsLQtN4xUNr9EmA/F+zl42R4=;
        b=ZWvcdq7iB5Dym1Ps4EDvkL6d7UWjy7F1xH4daSxe2w7RfIZhjMnm384kwpJRAlZmS+
         LvN9Krz5PoAEpDPS3uOPjCWvG3raIi97+twPXeCF4e7yzvo2wtX6lf9JUp6OsnuUwiiv
         9J3CTK4rMaNIZsznTuqgEv2l7ru6AbTNKakigTMb3VDaLkSB2m025joqfMYTFre1v1SC
         rhwtuunMJPP1B0d8RbgJr61epqwl4AgWpLA9L8c2m8AeD17coik6nR782Uf6NdivnGds
         +dUMevmQwMOd+bdobEAD4Qzpmjv+E4zqnLWR8epb61/NlWaK7CZp0XcvYTCFyLYjSNLy
         Hk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678640136;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POqbeetOAweEyMtCxvkBsLQtN4xUNr9EmA/F+zl42R4=;
        b=Ohe19ptIc9VJLyPGGkbYz9VsryEogGTGc4TWqsK4uFh/Jvj5VwLeq2Swm9PGGaXysm
         Zw+v2walbThFCUIOrnZtVuu8M61wJhriPXLr5NAuF3QERY+otiT0BrPOYxDZJDlRwpnr
         crrYam9M/5uRFYcA6inVLmZolp+ZJ3kZsvJ6AZUvVPOBL/onzXq4gBs8kfmLuAEFWjHR
         ZoUNwZkaBuY4YKOftLo3rnclCJztsICxNtaal+h4a/bUW3viAhIxM8qP5djKa05Ei7Rs
         5/gaFuhM9jpIipeSr8Aj9phUZp2qssTbAUTnf/qI+x8Rp8nd/TrnU/MYQLKVbLls+sMQ
         GVxw==
X-Gm-Message-State: AO0yUKUG6HOHQgwRnAMKzUX2qUH3lpdkCxA5JKkN6qYoPNL12bvqa6WU
        A/jtB57EoU8wdFBcVlxZ2aXYPg==
X-Google-Smtp-Source: AK7set8m1SeJOku9gchIXFZcRpSfg/LyJcU9fAKUYudZDiEUcGnXDuMptGsWNWudczw7aYQnR2OHnQ==
X-Received: by 2002:a17:907:1819:b0:926:8992:4310 with SMTP id lg25-20020a170907181900b0092689924310mr2245814ejc.38.1678640136678;
        Sun, 12 Mar 2023 09:55:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id k23-20020a1709063fd700b008e36f9b2308sm2422387ejj.43.2023.03.12.09.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 09:55:36 -0700 (PDT)
Message-ID: <12eb1e49-0dd3-a39e-cebe-803dc48751bd@linaro.org>
Date:   Sun, 12 Mar 2023 17:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: venus: drop unused opp_table field documentation
Content-Language: en-US
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221227143509.77812-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227143509.77812-1-krzysztof.kozlowski@linaro.org>
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

On 27/12/2022 15:35, Krzysztof Kozlowski wrote:
> The struct venus_format does not have a "opp_table" field.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.h | 1 -
>  1 file changed, 1 deletion(-)

Ping? It has been almost three months...

Best regards,
Krzysztof

