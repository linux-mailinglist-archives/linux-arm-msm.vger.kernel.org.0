Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39DF66B8B79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 07:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjCNGpn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 02:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjCNGpl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 02:45:41 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCD97388A
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 23:45:39 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o12so57789289edb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 23:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678776338;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=diffnAOfWc7Vt1DBpcUbHSPpZAZQ80GGOxA9E1+lr1E=;
        b=qJjklaKNl9q69qJguZ1utGkshe4Ocj/kuU8B0J4/Hoo7dd8Jmf8uBIdJOAINZFrIha
         kaBrMeLBK1U39hmLGMnnkAg0VUd+nJE6WeJrsNiWNcas5RhdCJGkKPEc/uYa9nDJvioh
         a3jlSAFGgmGe81pYVI8ZsKlYire8t+mD5nm9CX3+K7kWVI+en6WAttkyN8pBMYkoe+uk
         LSQ9+XFfH0A0THRSUx5j/Mky0HWdSGHtCONGG+9xws4VhAzTfkykgWkNbB8qExRUjVH3
         ITR2uCJEvapaOYC13k/W9+C4wEvZ1s4L6JzrXhVnC56TT764vTxlGGSjJLLTdYEJA2vG
         NUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678776338;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diffnAOfWc7Vt1DBpcUbHSPpZAZQ80GGOxA9E1+lr1E=;
        b=JIZBeDYl9r23YQ4U0FLai5C7SY7dhfhx5Vj8qJsE4yQAPnt5ktTpHl4SZTbRJlRhke
         hkfvFyYiWUj9TPzICGQMMd8TnhuES66/MVvhOxx1GxhThp1JPlIznOGTNH56ysNFyoj8
         ZJ6VfYBBp8AaBlNRl/s1zepb1RE99GcbNIkvpBS+a8hpG0VulbNSqoNwSH66rq49NN0L
         QffkD0KAGJVBd2y8+2fl1akdfD2bZXqBMJVq6tw+xu6+rqYdH2LUfZUGKnmCk1iv3tVn
         Gpv+jApTshxq1LJV+S6LSAKzrmQh5PQE9cuy6YAUZ3AaOaOHkUBJ7ws4hEogruXG0J5x
         Pj2g==
X-Gm-Message-State: AO0yUKVEHPV6oCLA19gTcH0c5H/4OzTDczMNVf16Y5jNYlewxlymfSsh
        2ZPopPcJw8jGF4riqCh5v/EKjeyQ+Rp8RkSeAj8=
X-Google-Smtp-Source: AK7set88kJIe8uWyyN2A07oBX9EhQPPNb6N+PYl6Ybgbqs7DVNtstN0tvxdsruvV6W8S7wdlbUp5LQ==
X-Received: by 2002:a17:906:58c6:b0:922:de2c:fdaa with SMTP id e6-20020a17090658c600b00922de2cfdaamr1721096ejs.50.1678776338267;
        Mon, 13 Mar 2023 23:45:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6932:5570:6254:9edd? ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id z17-20020a1709064e1100b008b69aa62efcsm684050eju.62.2023.03.13.23.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 23:45:37 -0700 (PDT)
Message-ID: <4deec4ba-a905-6460-1d1c-e5a0abd042fc@linaro.org>
Date:   Tue, 14 Mar 2023 07:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq8074: add compatible fallback to
 mailbox
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230314041515.15883-1-quic_kathirav@quicinc.com>
 <20230314041515.15883-4-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314041515.15883-4-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 05:15, Kathiravan T wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> IPQ8074 mailbox is compatible with IPQ6018.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

What's this? Not even a dependency for something as it is last patch in
the series. What's the point?

Best regards,
Krzysztof

