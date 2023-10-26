Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE41F7D88DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 21:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjJZTVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 15:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJZTVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 15:21:47 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C87A4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:21:45 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so19587951fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698348104; x=1698952904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIxb/ONKHmSh9MGHpSB58CgpbgZspYu4kkt1AsE4v3g=;
        b=xaGn4y1eB3p8bI6QgzmcztmEtEcfo/XsZJKHg8j4zBgcqWdZ7wx4yADZYey4caS+YB
         xvf1FcYN7j724hlv3iCh9PXMaI5sVC5gmHcNIwpY5PyOYeA+7iO0+MTp+FezLa/WZc/c
         M0UxW8+VBZ/LW1zAj2VMgES9wl6ekNtjTyaXUH0E4aAxs1lNB8iPu4c2QRn80ZIpJBf7
         6hIzYX67Oz6Z7JzK7U0xDAu9sPAvewM9CegB5r3t1vmODNHZFPlTl6hJ3C5kRhVNeOWU
         amwGe18nXGMF0MrW0EniJqfRmfy0CiKd18DxCgFJIhLYASNshtcWYBvXhTnI4So+jz/H
         FD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698348104; x=1698952904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIxb/ONKHmSh9MGHpSB58CgpbgZspYu4kkt1AsE4v3g=;
        b=l+Uk9ExUcfrbADLfD9BPlHnranBbI9bmw/90mb9zpazQ9a64+khEUfphdqiTgnDeYk
         +o2378KQ0CkUGofLcBOnELyTZK2SeRdexN4Oxe0SCJP4A6tohhyQJrKDW8W3Umcr7ncn
         ySTrt45YN8crY0yQrRvy+wNOG1o61MmoIXsQSQ38LuZ+7OgSJUN4MoRBqCY5BjI9CTqy
         +eMOT9HMyTzRfQ/EHDHvy/7ccsMoGHSJr0rLGaXICZ4Qu1Zk9HC6u15qH/56I9l5Zlw5
         02OVgiI53SL7GqTpL7Lvb37cCmzasFAdNxb8L6/mdXUgRMs/+iQccBgrgPK8NKWuDztb
         lcaA==
X-Gm-Message-State: AOJu0YxrSVHFcUKJ67qeuhr/LPIxCxsE/DzGRxic3t7IwN0Ow5tHJc1H
        l0wV8XWSryrvpcDZOgBANuqJfw==
X-Google-Smtp-Source: AGHT+IFUl7Jt4mUgiFchqCwIflupH794ffikoeGsidoDutS836DWxpG73h8f4DI5qAtR9B3+wiCF9w==
X-Received: by 2002:a2e:a16b:0:b0:2c5:13e8:e6dc with SMTP id u11-20020a2ea16b000000b002c513e8e6dcmr475562ljl.31.1698348103932;
        Thu, 26 Oct 2023 12:21:43 -0700 (PDT)
Received: from [172.30.204.229] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z13-20020a2e8e8d000000b002c013211ec7sm2872594ljk.100.2023.10.26.12.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:21:43 -0700 (PDT)
Message-ID: <46906704-3762-4710-a682-cc48761050c3@linaro.org>
Date:   Thu, 26 Oct 2023 21:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: starqltechn: remove wifi
To:     Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20231024154338.407191-1-dsankouski@gmail.com>
 <20231024154338.407191-4-dsankouski@gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231024154338.407191-4-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/24/23 17:43, Dzmitry Sankouski wrote:
> Starqltechn has broadcom chip for wifi, so sdm845 wifi part
> can be disabled.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> ---
Fixes?

Konrad
