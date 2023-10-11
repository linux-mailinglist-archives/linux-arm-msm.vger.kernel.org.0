Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9998F7C5020
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 12:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjJKKaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 06:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345779AbjJKKae (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 06:30:34 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5609E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:30:31 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bfea381255so82039111fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697020230; x=1697625030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzHKCgjb8/zw/flLxHNtdD2jh+riVKfmw0ipQhtOwLE=;
        b=pqfTt118gv/2PLnUGZUncLjgvEzV3FvIdVs5DF6QNEp9JxMDSL16mzP44q+5XJJfji
         DPQa8VUBr4PnWejYa40KeTLKFgJu8dMv5VWSBSFQezceQ1WUhw9d0Wzk1cwMqDHUMpKX
         YwvOCExdX+ZChSFuhv5AuHGE0PJKpZsI+JFmP8DmMJBO++9E8799dUUljHLMWp1K6FRG
         tcE+1mrmcCxpVVHbnXQUPkevDayDxTeIV6+BOP4qp+BZEV6GHhgJ1fhSz/8EKmdFcoTC
         Q+m5SC/bD3mpmo/Xd4gWktc3hXZoFyymdCDI/Hv3Ki5GnZEjUV8/W70CwN6uxQN6wYZb
         J+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697020230; x=1697625030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzHKCgjb8/zw/flLxHNtdD2jh+riVKfmw0ipQhtOwLE=;
        b=rKjQkVrZ04k1bQJMw1MQfE4b3uD6HjJenolY99HEQSnJwHg1xkXfG0oJjTQAaUCBKf
         aTOFP53FhDAph8Q1gORxcKuWup8U9aVY8mRV8GZFGdQdf+pocU5pp4g1wDwtD0oigxHW
         HfrEiRCeMMdPTCX29jmc9PbvHK4DGV6/RoF3eo5Y+Nn0wG28BYzIsar9G+hXZVyl7yui
         9ogY1qG5ele8bSG7SiRP0tKQCC6Ho++dlgO19DD+pC4XI6q5BGcHjCumlirJdta6m1ct
         tAu+4FoQdNJb3joXV+s8o0KN0/38YsrVLhnoXVTarsk8BnEgEJ1lUE87oK8K71kCLVYb
         2ajA==
X-Gm-Message-State: AOJu0Yxsnp+NBXXdyiPL4OPar5unu0BBKXVRdoPsDXYU9+sJ6IdwudYQ
        /gc4lp0dnihrjxer54DCR64XTA==
X-Google-Smtp-Source: AGHT+IEaw7rwDtUJYy85sJqrAFyVJ8Sl98KLuplFuXyA7yQPW41U0XXgksBo+0yN9rEAMltSVET/gA==
X-Received: by 2002:a05:6512:457:b0:503:35af:3058 with SMTP id y23-20020a056512045700b0050335af3058mr15408059lfk.52.1697020229684;
        Wed, 11 Oct 2023 03:30:29 -0700 (PDT)
Received: from [87.246.221.93] (netpanel-87-246-221-93.pol.akademiki.lublin.pl. [87.246.221.93])
        by smtp.gmail.com with ESMTPSA id v1-20020a056512096100b0050480e8a676sm2213434lft.268.2023.10.11.03.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:30:29 -0700 (PDT)
Message-ID: <3c7115dc-f9b4-42ab-8923-098d96b75e86@linaro.org>
Date:   Wed, 11 Oct 2023 12:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] clk: qcom: Add ECPRICC driver support for QDU1000
 and QRU1000
Content-Language: en-US
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231011090028.1706653-1-quic_imrashai@quicinc.com>
 <20231011090028.1706653-4-quic_imrashai@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231011090028.1706653-4-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/23 11:00, Imran Shaik wrote:
> Add ECPRI Clock Controller (ECPRICC) support for QDU1000 and QRU1000 SoCs.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
[...]

> +static int __init ecpri_cc_qdu1000_init(void)
> +{
> +	return platform_driver_register(&ecpri_cc_qdu1000_driver);
> +}
> +subsys_initcall(ecpri_cc_qdu1000_init);
module_platform_driver?

Konrad
