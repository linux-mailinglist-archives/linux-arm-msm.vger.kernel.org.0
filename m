Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6669348EFDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 19:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238541AbiANS1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 13:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236007AbiANS1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 13:27:16 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0090EC061574;
        Fri, 14 Jan 2022 10:27:15 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id m1so32975936lfq.4;
        Fri, 14 Jan 2022 10:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EWbE2gQenkRBpqFtUHvMNIlG3F9M61Y4FK6clETAY54=;
        b=AgKLRlA4reW1UBeb3TFTVxYK8E63d4yF/volniz+HfwVysLseJNWT03yIyGJsqYemt
         e0xPuxHKvtz+0XGuDE/IbphGyjkm2bRPWn2WOuHG9tiKUgYM/Nne8YaKhWUOrmKsO1o8
         3OFJkZXGyi9xMCsu3r+AMGBDQAcycGlJRF4ZWV5y1qvoX9PV7Dv26cWOotaKDqaBSBrU
         liwG4mEmzLmSsDt7h287ycDsju95bqMYpDKVQM6J2HbBPv6BNgOrBGEreERETjNehNvR
         eh1jUqgMkXpN+tx/DQJdheU06hwNDV+LlQy2WidA+HqMvzBAqeVrbU3tgxBDjdVMA0oI
         qHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EWbE2gQenkRBpqFtUHvMNIlG3F9M61Y4FK6clETAY54=;
        b=LQBzI0BC2OftJUcLh3RZhLOQB4qUoX6cv1Gnd4lraROxcwOBZIQMZCyJrva3w7L7Jy
         9lYFvHdZ5EE4fQuJBe2LxIuUhxoHgbsILXJH0fZMjpIJ8fVWf2m0R/7dx5lwDE/W5yHs
         WPqkWI893xXNRIrGIAKJSY52IBLAREttBbLz+CkX9j8JVasBk9IGaP9n9DokEH2tP/26
         LZuV6aufYwBjgA2aELiWWsLuOUHwOnSWbI4MSD+QksZ9N55wRUo+Jv+nnwhvWP62DPLl
         B44ctzgDKpWS5pRE0bL3XCFpM0j0cQQ58FiOZtcvSBkXLyZulZc05cYLRkbR6kcNv8aG
         7MFw==
X-Gm-Message-State: AOAM531GwULSWDja+IUhi81r2mnJ5LpoR99H1BeASaGteELMKVtHdK8J
        Hc4ijnMziw4JckOzfOmUF3s=
X-Google-Smtp-Source: ABdhPJxuBKVlVcqSdnHaTtFGt5x9qdRoXFOx2qdyMR9FhsnspjiseOcXGu6i3XHzSiABejO5a9CD+Q==
X-Received: by 2002:a05:6512:3ed:: with SMTP id n13mr7468550lfq.361.1642184834348;
        Fri, 14 Jan 2022 10:27:14 -0800 (PST)
Received: from [192.168.1.101] (83.6.165.232.neoplus.adsl.tpnet.pl. [83.6.165.232])
        by smtp.gmail.com with ESMTPSA id j4sm650057lfg.147.2022.01.14.10.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 10:27:13 -0800 (PST)
Message-ID: <b249531e-ef1a-da29-0d3e-eef251b22c87@gmail.com>
Date:   Fri, 14 Jan 2022 19:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8994-huawei-angler: Add
 sdhc{1,2} definitions
Content-Language: en-US
To:     Petr Vorel <petr.vorel@gmail.com>, linux-arm-msm@vger.kernel.org
Cc:     Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org
References: <20220113233358.17972-1-petr.vorel@gmail.com>
 <20220113233358.17972-6-petr.vorel@gmail.com> <YeC4Y+rZrNpubxhR@pevik>
From:   Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <YeC4Y+rZrNpubxhR@pevik>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, please check if [1] can solve your clock issues, as it did for me.


Konrad


[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/20211230023101.1122588-1-konrad.dybcio@somainline.org/
