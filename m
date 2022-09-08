Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD6B5B203F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbiIHONL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbiIHOND (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:13:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60115B08A5
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:12:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f11so13935545lfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CABBHj6GcCNX2cJxlglZLC9Ls/ZaddgB19BlDsUJ2Ig=;
        b=EVxDx41DDAGPIvQy0XA0K51X1QCJDWzcmUp+d7zipnxh1XCQAKpTNhh9WuSTJebz39
         hRagImbaRniKfQWbW3FnzO3HSbPYnnWLpz6k+QOO53coAv79SZqkNbYTiHfztQJKuhuz
         7U7/n9ZtiRa+q2YnKP0r0xi9Sugr1U7oq9vJpGsO9DfS1U4bLRN6yaDrwDAT2Oeqz0fJ
         Y7aAQs0lbpQgPdy7Pzr6XIWKa/lVsDcz057VekfG57RMCRRqTVUf2p+NHN2njgILPR7c
         ye9uBNxKXs5GNUdRZGaiytKMNtawggWH1wZDa5woOnvW9P5MTxVUzlD77xjsM6AUIazm
         OhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CABBHj6GcCNX2cJxlglZLC9Ls/ZaddgB19BlDsUJ2Ig=;
        b=P9laoXqLL/pdqEd0hEpB41UlMw2T3aygXy9ZVuXwUTO58xAckTq5CX9xMi7bi/HdNa
         bempZXZTewYzrfaH/KcN9EsGw2J+Xt1R41t8YxMovXA176y1caNNez/V3K6HshybvwCt
         Hl5i0J6cxKanR9yocHX7c/2Ghbo5DcHcqbkO3Xa/MG6ylU3/NnigHIs2E72cgCagAvBi
         1TB9nipI534KA+8VlAaSYc8f8fFWQ+AeEcVtEbalb4/SYCajOPhSuoqtugd0tk1DA+Kb
         dgTgr4lWtOQtx54mgHyQdgEyLb33pzCkGr/mJ2lnhj4YruhEpU7xn4xgWcp+rhBl3yGl
         4E6w==
X-Gm-Message-State: ACgBeo0fGmzt0nqpEkk5fanbLxnSFPWzXkFDX1zWmHwvwJZlzfqy3EJ5
        lzd5uqdMKmEy3zEJpyfRboLSCg==
X-Google-Smtp-Source: AA6agR73Rs7bLYPvkTuv7ltLnGKTH5sE/80TjjI/fabarfbhIf5OIU4XEdVxFbbrFR1gLyQ5tSij2g==
X-Received: by 2002:a05:6512:1101:b0:492:da22:bc58 with SMTP id l1-20020a056512110100b00492da22bc58mr2940664lfg.219.1662646370565;
        Thu, 08 Sep 2022 07:12:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e4-20020a2ea544000000b0025d5eb5dde7sm1274202ljn.104.2022.09.08.07.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:12:49 -0700 (PDT)
Message-ID: <2a22024b-eb5f-491a-28c4-1bd6e31d2a0f@linaro.org>
Date:   Thu, 8 Sep 2022 16:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sc7280: Drop redundant phy-names
 from DSI controller
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
 <20220907000105.786265-8-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907000105.786265-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 02:01, Bryan O'Donoghue wrote:
> phy-names has been marked deprecated. Remove it from the sc7280 DSI
> controller block.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
