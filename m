Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4A9631E47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 11:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiKUK1L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 05:27:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiKUK1K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 05:27:10 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242AAAFE71
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 02:27:09 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id r8so3392790ljn.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 02:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2yh63wmYAOV6Yufp8sh5swfAKqvT4hncuecFR721Mu4=;
        b=VxnhELu4pGQ1RyCo+9eN3SRfsWlCbHMwyeKJiGJD+wM+6Va0p5X8qhj3cFSD6j1nQS
         YI2m2l2ba2LzyDHCRWxTUQ7n/AxqKs9kPFV0+4yw40iDgaIWrZ5+bkcxMN/cTQLVz9X1
         nu8WZ1M1nasDb3QHzfrflMgDB0WPlntYg4HAVNOjBhykCtUTSYF7FPPqixzKQVX2fGVG
         2putf6nuN1zbMtFtTYDzUBrqQVSefgmSClCQ9SFcKYAAJwPmjHMEpjNhf3vi4eJpLcYp
         7dgBgd/q8qs0ge2fSfNrcsmBYKEmQ25aSubVWdrjf8Jq3lQhZcFcPTYcVVLXABIzJ3BK
         tNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yh63wmYAOV6Yufp8sh5swfAKqvT4hncuecFR721Mu4=;
        b=71FlZKJ+iIhFq3NVBbk161XIKJoPjejDXnjTUrP0vfZHRGhPn/iOGkUyIKrESYQFhm
         BbTmbHDJVgx2GXsPmvtAZ2/gHx32lLjbXxnkkSiHZZDQSzeguvFedyMDjFeMkz2OXCOR
         JAcV6IjwV7AWCq/MX5aMvYMCPPUDZw9PAVtdsuL2ilEH1pCR1BBrZCfWJKHJnNenW2Lt
         /Xdfy+jTtqXEjtzK47d6JoWWV9wUt6utQZW3Gyfm4wm/fweRMS+iJMqsFeit+ddaJEnm
         FdDf3o4hiXxkRveJ5Jka2iOkvFTWndsIkksJoMeuEPOnlfNILQ3nfuztIpF1ppNNq6WH
         U+jQ==
X-Gm-Message-State: ANoB5pn2SdNcPimLOzyokChn7bvAXhfzM/nbMNQAn1T08pcrl7avJu8G
        8pFlmxR0pwuiMUzJHNyAmsSZow==
X-Google-Smtp-Source: AA0mqf5esehd32lDb/nglaxifEmQG433RI51QfkXxHsjTLHQa1rUrpt9WreNY1bUIZVZgYGAVn8OwA==
X-Received: by 2002:a2e:b63b:0:b0:277:56d:fcfb with SMTP id s27-20020a2eb63b000000b00277056dfcfbmr5050434ljn.264.1669026427499;
        Mon, 21 Nov 2022 02:27:07 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z8-20020a056512370800b00497a3e11608sm1947893lfr.303.2022.11.21.02.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:27:07 -0800 (PST)
Message-ID: <41010ea4-68f4-b0e2-ab30-8ca6223417cf@linaro.org>
Date:   Mon, 21 Nov 2022 11:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: soc: qcom,rpmh-rsc: Update to allow for
 generic nodes
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20221118182535.11156-1-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118182535.11156-1-quic_molvera@quicinc.com>
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

On 18/11/2022 19:25, Melody Olvera wrote:
> Update the bindings to allow for generic regulator nodes instead of
> device-specific node names.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

