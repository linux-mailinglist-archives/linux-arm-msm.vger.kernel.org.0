Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802577CD6ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 10:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjJRIuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 04:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjJRIuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 04:50:13 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F023F7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 01:50:10 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso42231781fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697619008; x=1698223808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VY8V074ZaWHR3uxPsaqqpbxmTtftcDfFzH7Dssm9LII=;
        b=p5f7KhhSc7cBaTlx5VdOHiZxPxaZbsYhD5lw4ZBavMdgIgM/Vb6zaSFd6hl3orzys3
         p9qKMeHQFkcQF4RrD7+t27oYC3f9U5jSzRAv3bIpWcITG/8D74GyWOREX3yGcmZXiO7b
         a8Nb7uIgIgNJKTkHrz6P9Z9VLntIh4Vj72C5RC5IsCHfTiKdBPIhtlIW5l3d3triwBfI
         RodFmm7ucL6GIWiY8wmtTPr07rhHDXOnvSoGj1aR9THKp8Of8ZTYwjHFcF3Q/r+CKmvL
         aO7VFWJSJB3vzAZfi66DdWSTJukO9UziAZTuSyR5oFTV3MOtko17/iWfEXB61KosHiK7
         Eouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619008; x=1698223808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VY8V074ZaWHR3uxPsaqqpbxmTtftcDfFzH7Dssm9LII=;
        b=YnY1hpIkq1YiTHc5lMrjgYXwspbzpOba7YsWnevOt09cHN3Ubr2S2CivvSeH41VGZT
         TkvDlk/cRiq6hBdTcC3cY0oT+tOogwIfVuqzoRpxvNRxiFKn9idPXu6sMX93VhKwNHS/
         BpgbzLhvIdoVutnT41V2dN/lwOp17R/PvpzJ/xXCftr/xLnN3Ammm+YiQHPEJBlpzIMd
         KRi//iywrq04vrjA+FLOZ9ZrIwQl3YHOplZGnvuPf1LbpCNyNRntyOnVbQcFskSgbW8C
         42CA3tszPj1Z3t69L9XkriY7DLMI7NghrhIFFsQ26JKzmG5nkAkN9ucgw9Ys2s6BeIO9
         hoeA==
X-Gm-Message-State: AOJu0Yxwx38Jh7GCbNOD6VxBvMmMLm/CibHMFZQFaURkuL49TjPG9T6e
        Tha5OyFCShOmb/JgWI1Hs5gtSw==
X-Google-Smtp-Source: AGHT+IF5XWZCdhFd+sdr7SW9sr+WDumaME1Zk8oICpesr0u85VtPi3laTpJVUkx0QZ0bIQz0st1WIg==
X-Received: by 2002:ac2:5586:0:b0:500:95f7:c416 with SMTP id v6-20020ac25586000000b0050095f7c416mr2891199lfg.7.1697619008563;
        Wed, 18 Oct 2023 01:50:08 -0700 (PDT)
Received: from [172.30.204.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x20-20020a056512079400b00507a3b8b007sm615700lfr.110.2023.10.18.01.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 01:50:08 -0700 (PDT)
Message-ID: <6b4c544b-5325-42cc-9479-bd4db7250687@linaro.org>
Date:   Wed, 18 Oct 2023 10:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8916-longcheer-l8910: Enable RGB
 LED
Content-Language: en-US
To:     =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
References: <20231013-bq_leds-v1-0-cc374369fc56@apitzsch.eu>
 <20231013-bq_leds-v1-1-cc374369fc56@apitzsch.eu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231013-bq_leds-v1-1-cc374369fc56@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/13/23 22:51, André Apitzsch wrote:
> l8910 uses KTD2026 LED driver. Add it to the device tree.
> 
> Tested-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
