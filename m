Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0C260003F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 17:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiJPPDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 11:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiJPPDM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 11:03:12 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8500441D1F
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 08:03:06 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id bb5so6410272qtb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzvwTMSw07ABrDaayCgmtud3SdcvEAeM6AiZcmocPSY=;
        b=kIzHvxErSVmdpJvFvU9Vz4nFeDGuLpvoTBfdwJGS+c4txKn5I7jebPxATJBeuLRVLq
         3sSb/derXAqtnw/dwiV+d9NBYcTggBQPe0K7G3Mmlxao0k8XapS4Z41IrJtYuZn2H48d
         EWaldfISw4+VydHYRlcSQpMycdOqPMBVqUZqn3/BzXCthJPxfjrdHJhwImMVkPIft3lK
         zR8OdWvGaNTH6+Lo1Oiwc8g0lS3UKEyE33/6Dv/F3bSGg6tJyoZuJ69oE0nTfcELmJQ2
         LxmEKQ2Puvjlb9nLQh1uX5PCnhmxkAkuG7/jJLJPc/PEClzQn9QZqnknlFR/HLl3BFLg
         6J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzvwTMSw07ABrDaayCgmtud3SdcvEAeM6AiZcmocPSY=;
        b=qmSSlnGh/XXxDnfZ8hjbQ9rxZQJdHQqynztQUUGZF/xOaSJUMMES6WSF7ya2rJ3Cck
         2BB1yjXWfKW1xcg3bX1AaXneAegqn/5l3loDn/Ub4BHsAPJuhLGvCKBQX6qjTPCsBFLQ
         rEXxvoqfMu0n6COOhEr8ESUq8t8fXxgmKwBUMhVUGa3i81g6Anz0wzGL/al1StGvy/Fp
         /YeLZ1a6s2CrCXH6gn/QtB6/qQXcjjMfDNWXkIrVLnAjS6svUXTh380dPBENUvrqtuNF
         CWfk0pjPj3H6LSx7xidj2bGDPlv6FEc03WSaElDiuZ57ECGWy54FRRX4rCzfUHS92g16
         900Q==
X-Gm-Message-State: ACrzQf3XJQdtI8yRo51CnJTETT951y7GnUwHI6ZmNGcMS5nPjEDXfFCg
        JvejOKF/ky8y1gR9o7VLk9wIaA==
X-Google-Smtp-Source: AMsMyM7MI4MznPnSRUqpABKoUxqzhTj/616aM1ma4X3elQoeOPHjLUgZ5XfE/YXnms/IeHvE/RF0JQ==
X-Received: by 2002:a05:622a:1a9d:b0:39c:d634:be42 with SMTP id s29-20020a05622a1a9d00b0039cd634be42mr5469607qtc.476.1665932584256;
        Sun, 16 Oct 2022 08:03:04 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id ay30-20020a05622a229e00b0039cb5c9dbacsm5902532qtb.22.2022.10.16.08.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 08:03:03 -0700 (PDT)
Message-ID: <734431fc-e2d9-df81-ce6a-87d38e71e9f5@linaro.org>
Date:   Sun, 16 Oct 2022 11:03:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 4/5] dt-bindings: soc: qcom: aoss: Add sc8280xp compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221016090035.565350-1-luca@z3ntu.xyz>
 <20221016090035.565350-4-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221016090035.565350-4-luca@z3ntu.xyz>
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

On 16/10/2022 05:00, Luca Weiss wrote:
> Document the aoss-qmp compatible for sc8280xp.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

