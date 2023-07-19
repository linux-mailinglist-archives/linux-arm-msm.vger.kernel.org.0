Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFEC4758E72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 09:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjGSHMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 03:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjGSHMG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 03:12:06 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DC31FFA
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 00:12:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-991f956fb5aso804315066b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 00:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689750721; x=1692342721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytDahdvKihHrUzAsQ9KIZQ1C13Ss2nKFEn53zvjSNZs=;
        b=bwziY9q1uX8yQCPOYdT2dBFo4JdNT0X/8v5P+nkBvDIEFwt5h6srEFOPMkAA/ymdK8
         CAAOB0b/HzV0tfckB5AzwAzwH30cnTUzYt8/BFoshumhj8s4TI0X7+EpQsZolu5XAMzM
         QUr90lFr7oKlI9i7tkGQNpe2WhshJ7DLGjIWIfyZChnaIVw5LnqYAFyLP2b8Q7gjzJPw
         uIoddjVDaXlRDtuWNYaSTvzE0TET0e2Z8m2wdtD+e1170T7Mzzs2BUkrA48gz6/J6vK2
         pgpqA8PfWgPIsrFd6tGyAmGZZz7E2c3qj1XSBByQdJRx5qaU87QsLos1JyBU8SNQQYK1
         dT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689750721; x=1692342721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytDahdvKihHrUzAsQ9KIZQ1C13Ss2nKFEn53zvjSNZs=;
        b=YhMKKV1H7/XcEEdG6fQAB2gCbYVih6/GotwP6HdKh4rh17dKjiimfaCEv4Gk+pl/rQ
         ESBhlnaTcd5fX1XbvX4CJkuhgIEqhWOKA9vnsjtzL0iTxPS4vf4e6jABQx/brr3cgKyY
         6roThPuLAjQ0sSYGc6tFjgVtjQFBZrxB1ln2z0cNbcm02/yrzILk0lrzBgnQV8qmddlQ
         Kyrrgf2F6Xe91yzTqsNm4AEpLw+Ju2Xe08kxh65q+n/8ZzhLawd0o9MIvgtcfzKlLXL1
         vXsinaAXFQxIQL6KUQrWR49PGW2jkc20t6wMe3z/WWxZi/AWRWjUorAxQGZinVIuGkcK
         sZpA==
X-Gm-Message-State: ABy/qLYYrHicXG69Ghb3qtQXxlzZElEZmwMSxrNVNd9tD+aISvmDy1Ji
        WSttNzkiMpBsLhr+23fFsNQkpw==
X-Google-Smtp-Source: APBJJlE0129byI4243QlE/691K17gxTccBTbfR799sgE9wHBpFf/hWzWlXAx/TOq8SCwoNqilame9w==
X-Received: by 2002:a17:906:530c:b0:997:ba19:61a1 with SMTP id h12-20020a170906530c00b00997ba1961a1mr1548265ejo.32.1689750721545;
        Wed, 19 Jul 2023 00:12:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id i16-20020a17090685d000b0099251942e1esm1901437ejy.119.2023.07.19.00.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 00:12:01 -0700 (PDT)
Message-ID: <26c00059-6176-caca-371d-5f6c1c4ef188@linaro.org>
Date:   Wed, 19 Jul 2023 09:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [V3,01/11] dt-bindings: remoteproc: qcom: Add support for multipd
 model
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_eberman@quicinc.com, kvalo@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com
References: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
 <20230718120501.3205661-2-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718120501.3205661-2-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2023 14:04, Manikanta Mylavarapu wrote:
> Add new binding document for multipd model remoteproc.
> IPQ5332, IPQ9574 follows multipd model.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V3:
> 	- Fixed all comments and rebased for TOT.
> 	- Removed WCSS userpd compatibles.
> 	- IPQ5018 support is dropped because it's base port patches not
> 	  yet merged so added IPQ5332 support.
> 
> Changes in V2:
> 	- Fixed all comments and rebased for TOT.
> 	- Changed to BSD-3-Clause based on internal open source team
>           suggestion.
> 	- Added firmware-name.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

