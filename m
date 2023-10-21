Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04C807D1EAA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Oct 2023 19:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjJURe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Oct 2023 13:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJURex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Oct 2023 13:34:53 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F9011B
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Oct 2023 10:34:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so1346434f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Oct 2023 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697909683; x=1698514483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAD8koNag2d2JiuZzDEdme1uco389oMcfmj0tVw3ir0=;
        b=YalzfpQGXQ6NOgnlTaIEwX1Dc12UFy6oBKITgvJ5jET9H9W+K+PlYjIhhFI3BOT3JT
         C7jBJV6SyQOR/5+Fq98faQXj7og1xxv8jEqjCJNoQy0Nlq+7Ilwc5KYs1e3eHyvUMY+H
         KpTiqcqPlZHHgAK2UInrlKlRWQku3YrFHvVENDTOO4klmJ9+GoD5WnNjQ2pXpQ4N4rsR
         1HPjEHUXZWxEjGg/WvVyMy4M6Ej5kjuHJIIIKmvkjXbRme9Mv+I4tLwrjEHjbgMZM73L
         kLW6xZFNSBdi/xoZ6s4+os6E2VM+k9DSFDt7BFVNmFlvK/ZRDLO2VyXLjhtJW+pin/dA
         REpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697909683; x=1698514483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAD8koNag2d2JiuZzDEdme1uco389oMcfmj0tVw3ir0=;
        b=xMOff9VxGq+VVk5U1XGXKZ7+3KeHAUDMPI7oq9wibh6urNnKxsL7rab0OYTaIoX+J/
         jzgJxXeq5HLoRtN7hIIVZC/BedHcjzZY1vKU0c4cxDiuW0h7co6GnctBzDRMxkzX3i6y
         fMd4FBI76MEZiX8xCOHetgB+kyYCsdEz6V/8bk8RvP71CsmINwV2EHcHQhOp38U8LMeS
         VYgLBj/YITV48g5VD/CbpJeBNUChCf0JCSsPvaJiMH1UhBCEyLtREltG+q6gfB6hrC9V
         FwSO47zSbhdu47PCVf5B5CPqKO53jIN9jTgy2U9U/8sIOnrXouheLAERGJfP2BdLKm93
         TimQ==
X-Gm-Message-State: AOJu0YzJBX3HVKEweDDQh0Z91dk4z2fMOTB1zEE3V3qPDOZoaYFEcnfr
        DlB0o8dEyAkU5pNZmwNfEtakTg==
X-Google-Smtp-Source: AGHT+IEdWOZfR7p1w9Gb6XxLwAdNTGUgNWToaW2hfYQYWWvy8WPkZ2M5RTmKk2TbFj+qKJVFImmR2w==
X-Received: by 2002:a5d:5691:0:b0:314:dc0:2fca with SMTP id f17-20020a5d5691000000b003140dc02fcamr3367064wrv.29.1697909682769;
        Sat, 21 Oct 2023 10:34:42 -0700 (PDT)
Received: from [10.66.66.3] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id h12-20020adff18c000000b0032d402f816csm4019129wro.98.2023.10.21.10.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 10:34:42 -0700 (PDT)
Message-ID: <5e148fb1-c04c-4dd1-bcbf-27c7475d4f01@linaro.org>
Date:   Sat, 21 Oct 2023 19:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
Content-Language: en-US
To:     Lukas Walter <lukas.walter@aceart.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Raymond Hackley <raymondhackley@protonmail.com>
References: <20231021143025.77088-1-lukas.walter@aceart.de>
 <20231021143025.77088-2-lukas.walter@aceart.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231021143025.77088-2-lukas.walter@aceart.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/21/23 16:30, Lukas Walter wrote:
> This dts adds support for Huawei Honor 5X / GR5 (2016) smartphone
> released in 2015.
> 
> Add device tree with initial support for:
> 
> - GPIO keys
> - Hall sensor
> - SDHCI (internal and external storage)
> - WCNSS (BT/WIFI)
> - Sensors (accelerometer and proximity)
> - Vibrator
> - Touchscreen
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> Signed-off-by: Lukas Walter <lukas.walter@aceart.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
