Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 451C55B4F13
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 15:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiIKNev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 09:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiIKNeu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 09:34:50 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1D313F14
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:34:46 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i26so10648909lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wctNSXNbMq1vwHivguPTh0Fiiygf6p6HSq32K97qKig=;
        b=ACjGbNo2nFAOSs8ADfceCgCv47HpBNYHrjK1k1nTaPSqt49MT3AQjtASUpKyN+td47
         cbG8KD2ekdI1Njx1RkC4slaOPjzLsaI+WPICNF6FwM3zK4SduCFqM5i0j79OFoFwTiGu
         W4dZUw387LoTe/OJWbe2KKn9lStbMpApbdddTo8ycNzRdST+fAY1RxipMWX0Z7PrhyZw
         BoYKMVwH2QIHiOGEjhFFkbJPxpadO0VlTZeObNzyRLgNnRMOurp7ucYql02n5xyHkDNB
         jpPiEBu6dQiHNZ9g4beGYaFQyCFhRBFzn0iL5YECE8FZ7F2cTbXlazRXhk2ecKMBkn+4
         TqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wctNSXNbMq1vwHivguPTh0Fiiygf6p6HSq32K97qKig=;
        b=6W8FfSUsx6Egk2mA/4jb47f4ccS87jIZiq7rVW0puVJWZxHcrGuvS5MfDCgppjcIel
         QTe9P1n8IqArCGU6tqkfDo8D8OXCjh3CoHYBQDhKz4+GyNJEqCfZ/f74LYG2uf6kk8Z1
         llO3AgLWyAVyLJxUQgwg+sY+PIqjLf2Xoabx+VaUeR/sbmro26+Mz8WE7ShW0a5uMWz5
         5u6U+uzLGp1rwAddp2Cr6L5q74pyEoXD2Z1ISOZS2Qi2zdUZoqD9PsLyVPRVL31aHP2V
         kDx/V6dLmwcon+rsj0q7eS2gfofFS6Jx3GeCjQqcdd6c4kJdct1DIUjLZ21ecsXeUYlR
         K40Q==
X-Gm-Message-State: ACgBeo1N2Vs152tP9T3KLShxQnQIDEOipgJa1O85uExa4/BMxbj2ig9+
        4ca3qpTMReaOKXH6xtWCTlTKgw==
X-Google-Smtp-Source: AA6agR6Thu5GlYp/fIo0gdu4ChNB+/s/q23ujBMXgqZNrzL3hCAe49WPkEQzgjVBAMD3CBKpWyHjfw==
X-Received: by 2002:ac2:44ca:0:b0:499:b6ff:bc75 with SMTP id d10-20020ac244ca000000b00499b6ffbc75mr2249105lfm.233.1662903284712;
        Sun, 11 Sep 2022 06:34:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a21-20020a19ca15000000b00494b2d8030fsm610018lfg.177.2022.09.11.06.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:34:43 -0700 (PDT)
Message-ID: <45d1de3c-6bf4-571b-58db-b65c8ffce061@linaro.org>
Date:   Sun, 11 Sep 2022 15:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: Mark old binding
 qcom,cpu-lpass-apq8016 as deprecated
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20220910014206.1101962-1-bryan.odonoghue@linaro.org>
 <20220910014206.1101962-2-bryan.odonoghue@linaro.org>
 <1662821635.164850.34696.nullmailer@robh.at.kernel.org>
 <ee9f1ba2-cc53-beeb-7f96-5d1097f8e2e7@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ee9f1ba2-cc53-beeb-7f96-5d1097f8e2e7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 19:22, Bryan O'Donoghue wrote:
> Bah, you were right.
> 
> I didn't see this in the noise generated by the tool
> 
> /home/deckard/Development/qualcomm/qlt-kernel/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml:23:9: 
> [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> Is there some way to slim the output down to just the yaml file I am 
> interested in ?
> 
> Dmitry submitted a patch for this at some stage I think

It's since long time and documented in writing-schema.

Best regards,
Krzysztof
