Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83E769303E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 12:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjBKLTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 06:19:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjBKLTa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 06:19:30 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0572DE7C
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 03:19:28 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id r2so7611248wrv.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 03:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HedU73Py85YegRJs77VEOjTv5q8omvTRRWTMaFvNQA=;
        b=MYkR5vF6yGnszA8nbuYP3kxKErFCUnn8Dw1Mvfo09R/YEBjmbexC9nu+qFisn8LATT
         A3rMGgqAPHmO2+acYIUei2ZYOguNc6ADiwvNmdR+IhCEA55lyXGoGIr6bEkMEbHP3E6P
         F7a38XypmaqwT56mLY5HuEB9LCXvPPNxasj9SP4kIFTfS7gFFwQMebRj1v6RgWapG3ro
         HHhtPixUeHIVIQJUZRxZGOQeuKfcLml/KvnkoJwAbDHt0I1WXua7/3Kruc7f5erMUtcc
         E6OaFYbbHr9fdwWvv/Tt61UomZb/oHqbWJn1fQDQR7qpyKGWAYMloAJJrYNV9stGUvC/
         mNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HedU73Py85YegRJs77VEOjTv5q8omvTRRWTMaFvNQA=;
        b=N8RcfdmtPZXLLbuCQKX70PW1GLIJX+aRpCo55zkvaNz6U7JqrpOrcBFxUMmjt78cjI
         /eQDOUl9emK487s6np8vGciupnQId/+kDF4ZbPVqDL7JgCouXQ2OLtAYMK7RDCPYAdN8
         iamI4ogwXft+NsPCEwxNom+drR0kGINkadfrxQuXYgDCNpf9bcf+rU6JtsT3AxrMhKKu
         /LC/l+d3USNY74jqh9PuwiJD5blqasI4lEkPpPbuMWk0XWGeAT8csKsYH7fo1DMAW88i
         VBzmlSrkZFv97k5bddafmddPazRpB4hC3/blDa2o8Gc6eRWKeInWIZKthop4TWdQ48oU
         IJ9Q==
X-Gm-Message-State: AO0yUKVvQUlBf80JH+BexFw5mJElokNDYMXfrDjYVxpTThTCfRUDLxOZ
        w+cBov74eBSUii9mz4RbW6i7dQ==
X-Google-Smtp-Source: AK7set9A1FV9nulqq7N/n39ZSMXAsD8ZyMhcZZU8zMMkclO8C65gPePOsAPDWiLZTfplPNHDkPCskg==
X-Received: by 2002:a5d:6c64:0:b0:2c3:be89:7c1e with SMTP id r4-20020a5d6c64000000b002c3be897c1emr12394725wrz.1.1676114367094;
        Sat, 11 Feb 2023 03:19:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a7-20020a056000050700b002c3e3ee7d1asm5873863wrf.79.2023.02.11.03.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 03:19:26 -0800 (PST)
Message-ID: <8ddf54eb-6971-aed7-3067-f66393a40b44@linaro.org>
Date:   Sat, 11 Feb 2023 12:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] clk: qcom: restrict drivers per ARM/ARM64
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
 <20230123094925.54824-2-krzysztof.kozlowski@linaro.org>
 <7ddf5c74de84c5dc291996423cb1eb46.sboyd@kernel.org>
 <febd59ed-ff7b-ffc4-5568-d856703c9123@linaro.org>
 <9367139a425dc7e4811c757b62f33a4e.sboyd@kernel.org>
 <bced492e-08f3-90d9-4ca0-41ab0e4cca9d@linaro.org>
 <350b296b62a982f83e273f0f385f2b6f.sboyd@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <350b296b62a982f83e273f0f385f2b6f.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 23:32, Stephen Boyd wrote:
>>
>> If DTSI (and/or board DTS) is in arm64, you still need DTS or a link in
>> arm directory. If such one is added, then the restrictions here can be
>> removed. Have in mind that I did the same already for pinctrl.
>>
> 
> I'm saying that you put the dts file in arch/arm64/boot/dts/, compile
> the dts to a dtb and stick it on a board that boots the kernel in arm32
> mode. If it is possible to boot the dtb on a CPU running in arm32 mode
> then this restriction should be loosened to 
> 
> 	depends on ARM || ARM64 || COMPILE_TEST

I get your point. I don't think we consider this as use case at all,
especially that we are changing some of the boards from address-cells=1
to 2. Also whatever is happening out-of-tree it's out-of-tree problem.
If we want to support such case, then the DTS would have to be in
arch/arm directory (like we do for few boards).

Best regards,
Krzysztof

