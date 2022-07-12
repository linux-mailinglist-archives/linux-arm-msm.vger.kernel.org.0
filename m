Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605005713DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 10:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbiGLICn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 04:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbiGLICf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 04:02:35 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BAD99E443
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 01:02:32 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id o12so6356229ljc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8pNbEmXsZPlGcxQ/woTELDMNQSFJK4nHknSxZixJDtk=;
        b=BClNTX6rjcddNSokWeew/BeNmjrVSgfp3LdDrj8mYehbBryFN8r8PNxc38CBpR0Q09
         2qHY904ooL6ug9HFMfTOjPdTzCglODQNfh9guOEh5vveoWmJvSnvl8wJiRHL24AkoPo6
         lLWgaXajDVlYw0ZYpUNy+ztAb0U8T1KZ2YgqNamQi69CxcddawROzEhoBLYcQI/Pq9tr
         QJY1kOseKdhCCWz9fzi8oGKioWbkE8FNKW/UCajt4uGsPxhT0l0jGFWIw7lLywsw/D4P
         yG1zjnx7p0jHCJ50mU2wkp1gyxPH7n1QfJqAlSMroF7oK+ANraK1UCxop8Q37sdSLqeH
         CK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8pNbEmXsZPlGcxQ/woTELDMNQSFJK4nHknSxZixJDtk=;
        b=AHQ9v82hutl0Z0Xrjddw2YWJAjypk2ANmf0YwKEclO1MSEPb9/rOERhJtTJ9PO/IN/
         06zfAcDAPu9zorgsl/GFpky4PWZ98WaU3ReivYAPuZq7XG78V9NG6OzuqFpUnAh8h4yb
         z55wXDeGmDmuOgILDnsDcvRt2LBJyWC/1h/i6sxi/Ngr1X3OV+jCObd8Dbv7lpG+QLYG
         4i6lHF0NhdI9v3MJkzw0mwL9Ya351ieKErcGbaYmqJDAAhOdDc60SwRarZWeYJ/CRbkg
         zNGnt/XTlA48NT+Z9auqz6RcoBPrC9ZlIKjiqJsUYH0HPwbzFagtNrgDEAzTIy2kGQtv
         /+8w==
X-Gm-Message-State: AJIora9mk4g7EYZt52Qa6e74yf6LJgF+ZonUQQFIVt0Z1W2MO6ix0NcX
        FAY35blSK1l7ZBen8xsRO5XyQQ==
X-Google-Smtp-Source: AGRyM1sb9X2kygY/k3ZF8KSfgbHXg29S2zHrcl2esgC138PNfe3kp9ndeQl7bbyF1mgzROvNc5iUSQ==
X-Received: by 2002:a05:651c:2111:b0:25d:6b28:3c96 with SMTP id a17-20020a05651c211100b0025d6b283c96mr5385849ljq.39.1657612950379;
        Tue, 12 Jul 2022 01:02:30 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id h9-20020a2e9ec9000000b00253ceefb668sm2189909ljk.60.2022.07.12.01.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:02:29 -0700 (PDT)
Message-ID: <5f7cdd8e-a57e-33c5-9eb5-9a0bd67031a2@linaro.org>
Date:   Tue, 12 Jul 2022 10:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add
 clock-output-names
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org
References: <20220707150933.1889371-1-bryan.odonoghue@linaro.org>
 <20220707150933.1889371-3-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707150933.1889371-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 17:09, Bryan O'Donoghue wrote:
> Add clock-output-names as optional so that SoCs such as the msm8939 which
> have multiple a53 PLLs can latch the appropriate output name in
> drivers/clk/qcom/apcs-msm8916.c.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
