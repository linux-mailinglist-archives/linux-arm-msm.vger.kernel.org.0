Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 667D84E9A60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Mar 2022 17:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbiC1PJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Mar 2022 11:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234694AbiC1PJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Mar 2022 11:09:11 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC175FF30
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:07:30 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id m30so20869200wrb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zZJ1VYHzl+uCBWOcy9/JV+qpcRJPPAiZCf5L78FM8SM=;
        b=ELuySM+X/BzCbKbBZ1B2Q2pavEk6t2uubx/lxhuzTEm75tEvlQ7fc8bIdPhvkzbf8k
         Ljwg/BZ6c4kUxmIbsfFo4o3uhaRmgEOFKBgbodDljWDpeq9f3UZkC5PIpekAtOLbeAo2
         rnrefSF/dzj8GLf8NIGnO2b/C9Vm8pZR7PccGScUq5iOWtFTFowlDBcADFYYkg4VNeee
         kMgcSg0JnTpYT0LaoRWEhiRaxC1eilIFUlOoHU+VaYp0a6QaMY1XT6tglHbE8V+1zOwE
         1S1Ta0epEQS9fahMFWkLx9EFF1I2h89pipzH6R+HoGVs47VDmuilEPsWC8xjrE7kIfg0
         4Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zZJ1VYHzl+uCBWOcy9/JV+qpcRJPPAiZCf5L78FM8SM=;
        b=u80s92SeI5hlt9dTTQ7JALyXGVAT20fDZt3RMJ4cKLbdMVN9TISUup0eoVNcC4CQhy
         FQZYqDcPJ181m38OI80rAsZv7xw6OlIF6oywI14Jjn1tF0hWgHIOe72Wr2L5YBtFxn0e
         yFwc21UiszsHFXdiJI8lv47a+eoVULEII0tBoGXTKr02aA0a0m2xSNy8eN1QhYkJztPm
         bceRr8Q5lC/pytjrc7gwHQbhlLF7Ml8AyCHLNX45sVQygHejtJPEUvLzjAelDdaM2bOp
         RNrZIWv37RsMzm7U/sND2FLic4pWgB+md9PoD4a/tiGYHzI/Yyi45g5yaP2/29VNyeEx
         lw1g==
X-Gm-Message-State: AOAM533G2hxCUFUjT21sanqeioyj9EncwFyUMX0nqr/6N8uzIR3P+m+Z
        yEe1VV0f8XRnzr/O2VNBHwQ6wg==
X-Google-Smtp-Source: ABdhPJyflC3cNH6mL7Le9z1FX7QjaOQACGJODNPJLRXsr1Mvb8Qm1tzwLAErODLYkjl7U+FUbPBkKQ==
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id t1-20020adfeb81000000b001e32bf50132mr24038198wrn.246.1648480048111;
        Mon, 28 Mar 2022 08:07:28 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id i74-20020adf90d0000000b0020373ba7beesm18431418wri.0.2022.03.28.08.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 08:07:27 -0700 (PDT)
Message-ID: <784aa271-5c95-3675-07e1-25b495d9eb80@linaro.org>
Date:   Mon, 28 Mar 2022 17:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8450: rename interconnect nodes
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220328143035.519909-1-vkoul@kernel.org>
 <20220328143035.519909-2-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220328143035.519909-2-vkoul@kernel.org>
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

On 28/03/2022 16:30, Vinod Koul wrote:
> clk-virt and mc-virt interconnect nodes were named interconnect@0 and
> interconnect@1. That is incorrect as we don't have unit addresses 0/1
> for these node.
> 
> This causes warning:
> arch/arm64/boot/dts/qcom/sm8450.dtsi:255.27-259.4:
> 	Warning (unit_address_vs_reg): /interconnect@0:
> 	node has a unit name, but no reg or ranges property
> arch/arm64/boot/dts/qcom/sm8450.dtsi:261.26-265.4:
> 	Warning (unit_address_vs_reg): /interconnect@1:
> 	node has a unit name, but no reg or ranges property
> arch/arm64/boot/dts/qcom/sm8450.dtsi:255.27-259.4:
> 	Warning (unique_unit_address_if_enabled): /interconnect@0:
> 	duplicate unit-address (also used in node /soc@0)
> 
> Rename the nodes to interconnect-0 and interconnect-1 to fix the
> warning.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

The DT schema will still need to be fixed because it expects 'reg' address.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
