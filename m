Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22AAD7CC8B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 18:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjJQQZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 12:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbjJQQZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 12:25:31 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC72B0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:25:26 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c503da4fd6so61075651fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697559925; x=1698164725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2vb1XTNsfZ5m/BsQX9yIiGSsnUXjkotdRfEp1ocJIc=;
        b=cR5IqRLhXGkfi0FuhyZRet7dGDLQ7a8XepbPVmgGmacw3y7tSzzNX4u1aUwZqphsWM
         aj0ZizpigWJ0XelbmCRrxxX8kOoRBu5EORw8XXx7pRgUHNh7xXNtUAas+slDtiUGNebJ
         SZB7GlxUfJm3GBNNuKY5zCMc/tM6EIU7YZMwl5+fssdInoUdrhiS8iPVwhlaSGD8AoRB
         dB5yk8D3BKnegugzujD0V1k1LI9ntR0hE/Ky6svY1R58SVRrpwSmnUF3zI6I/bII70rg
         nP3E7cfLhk4EHFjVCOFXJ4RSKQVxsYjkV94dvyuM7MPeDt30Qis4DsnbJQoagnQWNUmL
         rxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697559925; x=1698164725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2vb1XTNsfZ5m/BsQX9yIiGSsnUXjkotdRfEp1ocJIc=;
        b=AjecpumbROGf9Jo9ufVMwCVo6fFtUAscQSbRr6ct7NCRP1CoH8Xg0MFWVVaM7hLCrm
         KgLvHlPb5QJsYoTWTYyPVXrx7R1StpGIp8F6XYwKI2BAKuHYJrmJDfEJdLF2eVF75R/v
         2e3nimYqsrxlSWxhUR1y9l2UrZImbY5f9pJElAwgb6ZHIm7rRxOkccQ3YQkZ1Ga10bil
         MNHyQc1guo3Gee1JJKmTQ7A1vNXEnr6WUxj0KbFKzOR0DJHGxeTNAp+iNmuoKVBid/jF
         MXrERnDVcvZLMcdq/QrA+BexBHw55tqfRDBgBjde3mt0/UvOxLcTD3SAUhaHm3SkM78q
         RZZg==
X-Gm-Message-State: AOJu0YwampQcZg1dVv+Fzb+OCxquy/ug8i+mjPMEI0UhvpVZy1pfB0JX
        DyUOHJbxN6Nb1QduW0Ut07huWQ==
X-Google-Smtp-Source: AGHT+IHWYI3YdD4u17EV22k+TxJ8a4G31u0Rd7E+oANUptnfVtuZcNmNr3WukHh7GNrQrXXXJplpWg==
X-Received: by 2002:a2e:9bce:0:b0:2c5:1f57:1ef5 with SMTP id w14-20020a2e9bce000000b002c51f571ef5mr2280248ljj.39.1697559924923;
        Tue, 17 Oct 2023 09:25:24 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c4e8c00b0040772934b12sm10459334wmq.7.2023.10.17.09.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:25:24 -0700 (PDT)
Message-ID: <3aede886-3219-4b9f-a44d-0c414979c260@linaro.org>
Date:   Tue, 17 Oct 2023 18:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-longcheer-l9100: Add
 proximity-near-level
Content-Language: en-US
To:     =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20231016-bqm5_prox-v1-1-2acdc732be9d@apitzsch.eu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016-bqm5_prox-v1-1-2acdc732be9d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/16/23 22:18, André Apitzsch wrote:
> Consider an object near to the sensor when their distance is about 4 cm
> or below.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Out of interest, what is it set to by default?

Konrad
