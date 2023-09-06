Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0F487936CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 10:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbjIFIGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 04:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjIFIGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 04:06:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078E7CF1
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 01:06:19 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso517961566b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693987577; x=1694592377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6rX866dZWeyzbwrDmGLylNXIPdDEierfj+vUzSrXHo=;
        b=OpMftCNYvMQ+JX4HPuHRdIFb38miZd91DdOI3N/Ld6RtW2c/lv4p5MMNFcpzE7JccN
         qWQIu/LtmocXSUYM/4rBYjhULtYLL8yw/674zROjMM6y2cZ/JXIaEn3I5OqK0h0t34qI
         OMuyuH43IRou5PHTNrf64n5rF02DVYOoiW9Dhv12NECcj1NCOF1LZqX0/oL6IMjOIOHx
         juVjHVa/JGjVHf/goJjB/Vg6SogQO6caoZ5RZuWz4tkdxb/CGyZyibtVM+qjYkIbLQSu
         1c5seF0GQQP6KKhi1z4xZgp1j8V2RQijBYfq+hFlB3xH1csRBQzlhOrpug6POQnJx6VB
         lvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987577; x=1694592377;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6rX866dZWeyzbwrDmGLylNXIPdDEierfj+vUzSrXHo=;
        b=S/WOH01dEB67iwoRV8LssFUqybWnWWCxahLqYNcPpljPyrKQBNmJd02USavdqhETCE
         jRIwEqRVX8w1+U6K/YLMRdcVJxtb+SBlc+A+7FLtjRklpZSykW8w2Kx7nZnU/piYJ69g
         ObiX9kiLQ3p4s72//SsxWWFrnQwnq7JwVQdm1O6JJjx8szzazUuiwP55U8dyON/EU1gx
         2+GlJ4hvcZwOUtlpFIsyuMsSjZafUz3yYJ6sPSPMyof670+x0vdJZB081VUKu/UOLW9U
         mn7MzIgsxHUCwnAJS8U6UGAjCZa2uDZKxVNSWrqUOiETOvIOxhO55zdZTpDrjcr7l1Kn
         aX/w==
X-Gm-Message-State: AOJu0YxCdjknZAzzN8ugzqplX8lV7rB4t3wWSyBWC49+AzWUDJwNWgJl
        d2l5UJvcpaiT5TjKl8MbIIFpnA==
X-Google-Smtp-Source: AGHT+IGAd+DD8OLZo0kvehoHFC2Eczx87NK8Bkhpv9Weu6nYexYG43coH+qot4a4ptKUU/3kIRogPA==
X-Received: by 2002:a17:906:cc4e:b0:9a2:292d:ea63 with SMTP id mm14-20020a170906cc4e00b009a2292dea63mr1488410ejb.37.1693987577410;
        Wed, 06 Sep 2023 01:06:17 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709062dc500b009a2235ed496sm8871288eji.141.2023.09.06.01.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 01:06:16 -0700 (PDT)
Message-ID: <9df52150-f18b-cebd-11a8-a1c9dece09f0@linaro.org>
Date:   Wed, 6 Sep 2023 10:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH RESEND 5/7] dt-bindings: mailbox: qcom: add one more clock
 provider for IPQ mailbox
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230904-gpll_cleanup-v1-0-de2c448f1188@quicinc.com>
 <20230904-gpll_cleanup-v1-5-de2c448f1188@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904-gpll_cleanup-v1-5-de2c448f1188@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2023 06:56, Kathiravan Thirumoorthy wrote:
> Mailbox controller present in the IPQ SoCs takes the GPLL0 clock also as
> an input. Document the same.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

