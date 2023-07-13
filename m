Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6D97518E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 08:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbjGMGii (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 02:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233139AbjGMGig (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 02:38:36 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C141FC0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 23:38:34 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98e39784a85so348584066b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 23:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689230313; x=1691822313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhvrUb30J2edJpoQqu3Ve5o4Vqiq35Gsxr6puMxZdLE=;
        b=WO/84obLzqfprnuZf5BucZpZNEvlWLPVvU/nZvAWiDIXft56fOIwAq2w4H5i8ujdtx
         bb5Jd7JkkdCPT0kV+9bix3JFASCntRjLV2VWxvrmbqAzEBblSf1Gpb+x9Wq517i9WTka
         F6ewDCsdMK11IAKlfWc6G2Zz6bh0AwyjL6jXfpj9GG1q2325yg1S6S6m5XUo9yrcX6zu
         8qIiXvT+TmAlt1+VY47c06hYxRhrOLR8dPxAgqx1nM1CsYrjr+gGFAPJSOl9MwLK3xoC
         Jz4H7A1tPFT1u+khPap5pyriIbMphKMtG7ALCFtT7iP8DVVhHiM9sT8yIbrumsHF7DAy
         rOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689230313; x=1691822313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhvrUb30J2edJpoQqu3Ve5o4Vqiq35Gsxr6puMxZdLE=;
        b=G0x9QEbjCDLs2qXHsxOphtZ3zIYfDUtVFzZt22Dye2ahAntqaJyc/5h2wTIJZ2Lic6
         j+1a8bc9R10YVLkSeDEHmNEQbB7squnINiUgoDoYr7Dt98iPXqUy4R4ztnqZz9TaNvIy
         ZyJZT6wezNzEr9UkEn+YCPJvOnEDaIB2CFPBswZAzcPcj4Bd5trxTR8QWrly/xYmvEme
         HRP9xcjk+VreVpRLb3ZUSrWg5br72/7xtZnla60CQcKwE+bSzBw22/Br7KxLHtC4CmHX
         +ZJN/yfhOm9rkRhilY5/wgpJYFySVNNQrlclPJ8GBFENF00BLmaWrhNaYx9loCcYBRtV
         qIWA==
X-Gm-Message-State: ABy/qLaijstIirE2jNMAdYsOmVzj3O0lu8iPWn4Ydb5BPZlZfejca2ZM
        h/ao8GKaZw6aHX0nsP3yNxnwUQ==
X-Google-Smtp-Source: APBJJlHK8KOdzhadChYh2RosBkx2P1ku9Uxjv4wZmPQuC8miB0eN51h561Npnb9y3ofJwDZE0xoN/Q==
X-Received: by 2002:a17:907:16a5:b0:98e:48cc:4cbf with SMTP id hc37-20020a17090716a500b0098e48cc4cbfmr5764765ejc.26.1689230313392;
        Wed, 12 Jul 2023 23:38:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t20-20020a05640203d400b0051de38eb925sm3795981edw.93.2023.07.12.23.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 23:38:32 -0700 (PDT)
Message-ID: <29358bac-6c1b-1e6e-9f21-20ec62518cec@linaro.org>
Date:   Thu, 13 Jul 2023 08:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: adsp: document
 firmware-name property
Content-Language: en-US
To:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712235409.97213-1-david@ixit.cz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712235409.97213-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/07/2023 01:54, David Heidelberg wrote:
> Signed-off-by: David Heidelberg <david@ixit.cz>


You miss commit msg. Anyway, this was sent:

https://lore.kernel.org/all/20230309083548.47205-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

