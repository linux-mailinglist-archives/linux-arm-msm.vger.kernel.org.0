Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0B8579E210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 10:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238676AbjIMI2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 04:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236393AbjIMI2j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 04:28:39 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D556D198E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:28:34 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a65f9147ccso833747566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593713; x=1695198513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcjHciOEB4wGjPRxzcQg2KY+X5TWNjgyiN/R9k87O0c=;
        b=r4c+LgDtyRnIYnVX5kB0Ld6hWveQwM3R7EN91ItGr5ztAj4zFfAYQFsDLL++ZV94+0
         unqxsKYkryu+33jTQQQlVjo+aCSXoIbsQFMTI8ZO9f+sYo6/UALGkgVx6hJk5Zrxj19X
         X1AQ5e2hD4KBp7yfwq6lkRFX3lOQ83N1XCb6K2lPQsqgNrnylCpzSZXAj/Z7TyJmIDa3
         i5XO7G9bn5bfOSVcME51KCIypZ4sanPYi261yvKfSBc9+ffTNM870jed+BA18Lk6wlCF
         PRVTm/58rYNABMIcYQ5OWrSz6AHiDOenlBUzOPTWPyfGZ8iceW/sIzHSyQ1hw5xf9NXl
         6u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593713; x=1695198513;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcjHciOEB4wGjPRxzcQg2KY+X5TWNjgyiN/R9k87O0c=;
        b=pSH4Sg9is6pM+FFU3ONpMQI4Wo5R7n8InnhLNjPTIQzaA5eh9y46Zhixj6ke0QoS4C
         bykr3jzjg4M/x7knV9GQWKfwksFN5aJ9UOfAQvSyhpqxgvMh8gl8RdE+PRfz89igwYFM
         scgrRr38IVMMoe/QyCFAUYsoWNq/+LQJzEmK1LkZitR8t9uLCGqu1M/3aMaMfydHWx+u
         r6Phjg0nEYlO3QlYfIJuxXbehJH+vuaNgpyw6ojS9rlrBdlxRLlXO9z43fdpgjC4A+X4
         uYldA44mT1OA4Z/mRht+qVrc29s4eLbWZlm4xsfhbWkR4mvt+leuU1dkvb7+4tf6D3OB
         YEjA==
X-Gm-Message-State: AOJu0YwM1pjPir7tSi4uN6tfentWTylpbHBq46VlAikseNxVcQdZ4D4w
        WfdObIt+xnSK06E3l2epLTNKfw==
X-Google-Smtp-Source: AGHT+IFmMNDnYGHGyTxB2kTvPlHFBu9w/k0OtnoM7DCf7UVubTFyWhLBTkhY65paoCVkLDhe1SCRYw==
X-Received: by 2002:a17:906:5188:b0:9ad:99a8:7c4e with SMTP id y8-20020a170906518800b009ad99a87c4emr1463772ejk.55.1694593713320;
        Wed, 13 Sep 2023 01:28:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id v14-20020a170906338e00b00992b1c93279sm7936294eja.110.2023.09.13.01.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:28:32 -0700 (PDT)
Message-ID: <c6b473a0-3576-9cac-dfec-126f3cc5803a@linaro.org>
Date:   Wed, 13 Sep 2023 10:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V2 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc:     quic_saahtoma@quicinc.com
References: <20230825091234.32713-1-quic_devipriy@quicinc.com>
 <20230825091234.32713-5-quic_devipriy@quicinc.com>
 <29a968e9-9c6f-034d-35fe-71c42b5d7cbb@linaro.org>
In-Reply-To: <29a968e9-9c6f-034d-35fe-71c42b5d7cbb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2023 14:30, Krzysztof Kozlowski wrote:
> On 25/08/2023 11:12, Devi Priya wrote:
>> Add NSSCC clock and reset definitions for ipq9574.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> ---
>>  Changes in V2:
>> 	- Referenced gcc.yaml and dropped the duplicate properties from
>> 	  the binding
>> 	- Updated Uniphy clock names
>> 	- Added nssnoc clocks and clock-names
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Rob's bot report is a result of patch #2 failing to apply.

I assume changes will be needed here to drop clock-names.

Best regards,
Krzysztof

