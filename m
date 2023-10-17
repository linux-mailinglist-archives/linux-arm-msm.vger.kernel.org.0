Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343117CC91A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 18:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbjJQQv6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 12:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjJQQv5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 12:51:57 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19FC94
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:51:55 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40776b1ff73so34854825e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697561514; x=1698166314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T90E1Wgo5rWvBAOANvbZnM/quFOrnnCVJrCKaT/SFF0=;
        b=K15BRGSdsWHCDzkTfVkk7KRa5DD9nZJohfAHig98ARlKuzRqsoi4ag0oHZT12vsYFf
         WuiEME5J5LfxnwxWBtUDekFvTXp8iYaFancdDcKYADeqUDWVDhhGlfC1UAWwOt/P1AH1
         FHfx/3oNTx/wnLIyjuQXcJJKsw9Jb5IyMpC/PRPNRoa9ACr2jKCtbSE5up4u1yX46Cx4
         DqW0Zf+NzxrENOmnxJIoqDV1/rrNs1iZ8wjXHNGjBBS4TgJX6p68t2Z+Uvn0kGz09hC1
         rizShJXJZxPmflP0aFht6wvEFe4sKYpyFVnxY1H7djz6kbWy57SFbsgUMAccgt4Zfo03
         YRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697561514; x=1698166314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T90E1Wgo5rWvBAOANvbZnM/quFOrnnCVJrCKaT/SFF0=;
        b=lqve2bnYrL8gPFtQsbgGYmkm+XZar5gsaS5/KMowb2mcX3hxuO4KQyRWrPj9J3ozSY
         ghP+BaPSNU1v4J1bTvn29FGUfsaUDphKOmFr62H3WHK8c0bMdO+b38dcL0en1KTRHsNv
         0Bb9ebaidw2nTa43UE+/K9gNX24Ey5TLVxSHSvCOJWxbqASK7NiUB+VF3WDrg0Gcwi7O
         5KoOrvDW4Z8VWJwtyd7G7mz5uDpUAZQ7ZK7hYVODrzUWB/6g7A8ENEUrHHCdN9eKDkeF
         zSrlmeQcmWIJJ0260H3hTeu//izYlCt2DUuAbSdPK5LHMUq7TVHmVQu24fGWmkdi7RQy
         p0nQ==
X-Gm-Message-State: AOJu0Yy40xepSDW5bfTfDenNQdNCsoCFASWmYDbwVEa1bDjimZqmrScA
        QMpi9C9OngxdlSG18VAB02nITA==
X-Google-Smtp-Source: AGHT+IG2uqMJ3zfBEsleTdC4Zn3/o7Z7c/N8IeB4K/K4UHdchlfbiFeX0SCahOLq97VTr+FIEy9qyw==
X-Received: by 2002:a5d:4842:0:b0:32d:a211:798a with SMTP id n2-20020a5d4842000000b0032da211798amr2109528wrs.6.1697561514400;
        Tue, 17 Oct 2023 09:51:54 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d66c1000000b0032dbf99bf4fsm148613wrw.89.2023.10.17.09.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:51:54 -0700 (PDT)
Message-ID: <a4211fc4-a16f-4493-9ca0-9f50c673081c@linaro.org>
Date:   Tue, 17 Oct 2023 18:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-acer-a1-724: Add notification
 LED
Content-Language: en-US
To:     Raymond Hackley <raymondhackley@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20231017125848.84311-1-raymondhackley@protonmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231017125848.84311-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 10/17/23 15:00, Raymond Hackley wrote:
> Acer Iconia Talk S A1-724 uses KTD2026 LED driver. However, there is
> no blue LED on it.
what

that's probably $0.00002 saved..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
