Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B16B4671BD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 13:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjARMTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 07:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbjARMRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 07:17:05 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB44D54234
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:40:14 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id r30so9208582wrr.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 03:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kM4TmYHUESokHiFW3imA6PqhaD3cG8rorNJ+MQr3euM=;
        b=h0Fl4+o6vE2/vPJbrvZttRQMtkF6bZ0VG2f6mJvUzGuUY5Vfo2lCxRx1AeTqaevaOE
         VZQiNWTh98uL+Y7Y/yvfRdblexzTpjTeDAni7U6z1mEUaowNzkPhYDc0XP+o4KFP9d+g
         shJ26R5xvZikoZEh2l35A0ruzCYdqtg9Z+wc0H2Q7Firyp48H9l0iWXH1NB2z3RMP5V+
         ZOoGHS4Tpgu17SENmG515AJ2NO8ymKFkOI9rOyLhl3crtUK3tkbd3iavCqpIPDdV9jgN
         Dn8pmIpfK2THl1M8vIuclFVjid8r3sNxxAe95+5DUrLr0t1EzBOCG+SRose7XP4/VLIh
         PZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kM4TmYHUESokHiFW3imA6PqhaD3cG8rorNJ+MQr3euM=;
        b=wovKPwHnytKei2AYlWFm5yu/RZNtHhDaoKqruX+st9pF1+QbBKp922v0KSkyKrfdX5
         BJrgKgHUMzBA8JgJDRYu/sc6RI+YfbB+8TbqnBpKlzoIKJRYaKnMXVrKi9TChWbRayZ8
         Kw31v9+bdKnPXGDJqRBchoTY19uuV/LkHCMr5S6tOpVYJwRKqAG5onLRFPRPQURFEX1c
         /LBglvH5ImXAIyEMod3qpGLSELSox218p6vJgtcGW3gV3sS4M4QJi9pW6Et8/Tj3ilqB
         +BPnFL0yMLLlgnlssBrah/ChI9Yupo75vEiCWV3pbv8I2mxBL1tph42qsI3X2DtUgkEY
         0Rrg==
X-Gm-Message-State: AFqh2kpt9FjGOvD4GUyWNOc30WLbI0plCDNErlDIvQ13ncbfSz/Eurh8
        fjq4Z9fG6dPcQzvjxB5d4aQ7nw==
X-Google-Smtp-Source: AMrXdXuBdBiAcwQWG/BeyGrwSRj2MigBb3eyc9eCrsnkqKeP4E8cQkVLTDUgmzDXiDagP+0iXvFQxw==
X-Received: by 2002:adf:f90e:0:b0:2bd:9b1e:165a with SMTP id b14-20020adff90e000000b002bd9b1e165amr5883672wrr.6.1674042013397;
        Wed, 18 Jan 2023 03:40:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600012c400b002bbb2d43f65sm28061605wrx.14.2023.01.18.03.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:40:12 -0800 (PST)
Message-ID: <ba0c861f-6349-32d8-33e8-26c7380fbee2@linaro.org>
Date:   Wed, 18 Jan 2023 12:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 1/6] dt-bindings: mailbox: qcom: add SDX55 compatible
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
 <20230117223013.1545026-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117223013.1545026-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 23:30, Dmitry Baryshkov wrote:
> The commit 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55
> APCS") added SDX55 compatible string to one of clock-selection
> conditions, but failed to add one to the main schema's compatible list.
> Fix this omission.
> 
> Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

