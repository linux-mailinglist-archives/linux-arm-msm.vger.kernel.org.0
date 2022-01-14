Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE05848F1FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 22:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiANVTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 16:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiANVTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 16:19:41 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D3DC061574;
        Fri, 14 Jan 2022 13:19:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id x7so34281483lfu.8;
        Fri, 14 Jan 2022 13:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9KqaEd/orzPaRDHAcmr+KkzSNx57MD4aPF0oDzJ/wLA=;
        b=HTCyYdif+hOSUfWUY+hAHr1YywYGjMUAZe6drFu7PT6zyOoc6RvnaOJqjt0U6PqeUW
         tYIkALSedBBlygfgejYE8ptTVTzVpKOCo+fbji7pSXk0mf1Qx95SaPm0UT6P0o23XPT2
         gS+xsvW6bxEnBCVvIghmHj61KttnW/MDNBDsDc2R6Fo6j7FtwEGqazi1E3AF9wOz8vmN
         xg3jWiZBLnyVCXf0rv7agPQi2lEm6wAZCun19Dg+Qi+zadv7L45ivp5QugMiqg8FJtpq
         dF40L4pk/LlcE7ZgC9dS5961pz+yxGWKcFTL5X0Twoa2Z2G68l2wMiuwSHKwcO3uivkP
         f8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9KqaEd/orzPaRDHAcmr+KkzSNx57MD4aPF0oDzJ/wLA=;
        b=AsFD4JGuTm9yxmeSyE8fQW2SCLiqbwAHzY+UZbAZk01zwAj1xwdo3uh/hk56XoXz9+
         ZII2BdVnBukmR52lda+sGjB6WW15lAnfLSt59+8Gv3yJiY6NTto3DurJFdpdTopdzKVd
         r/nhpkavK0MN4DNAU3BZmhej19Cw6DiucKU19XWXaN1ApQhrYozGEvl6OglQVdxQ5YGo
         AYDta0uthwrDIBo2jgJN1in3jetRYBukUz6oHU/GKh8ADAPJrj7kxGCwdrMYZqoO4bap
         u55gvtC4J/nSWw0Zt7qp+7EXQT/Q+E4BPP1aiK5rFJDbrl/YHBSBLv8lHlJoBc9HzH/v
         V7ww==
X-Gm-Message-State: AOAM530+A29l2ck8bCswP69jKWxPHqm7Rtt/um3LOYu18CsImhjULSeW
        UFDpPt7nQ0bmNMEbTOpknV0=
X-Google-Smtp-Source: ABdhPJxpar866DKZqgIPew+HmhhXCaMC0R3qYQ1QWUtVP2HqeV9Y7ed7eigbXpZkNaPNOfKtsm3G3g==
X-Received: by 2002:a05:6512:1085:: with SMTP id j5mr4619386lfg.588.1642195178843;
        Fri, 14 Jan 2022 13:19:38 -0800 (PST)
Received: from [192.168.1.101] (83.6.165.232.neoplus.adsl.tpnet.pl. [83.6.165.232])
        by smtp.gmail.com with ESMTPSA id b18sm656486ljq.62.2022.01.14.13.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 13:19:38 -0800 (PST)
Message-ID: <d269ddea-85c2-defa-abb9-733006f0d622@gmail.com>
Date:   Fri, 14 Jan 2022 22:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8994-huawei-angler: Add
 sdhc{1,2} definitions
Content-Language: en-US
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org
References: <20220113233358.17972-1-petr.vorel@gmail.com>
 <20220113233358.17972-6-petr.vorel@gmail.com> <YeC4Y+rZrNpubxhR@pevik>
 <b249531e-ef1a-da29-0d3e-eef251b22c87@gmail.com> <YeHoOL7KH01LJ5nc@pevik>
From:   Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <YeHoOL7KH01LJ5nc@pevik>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> Hi Konrad, all,
> 
>> Hi, please check if [1] can solve your clock issues, as it did for me.
> Thanks for info.  I still need my patch "arm64: dts: qcom: msm8994: Provide
> missing "xo_board" and "sleep_clk" to GCC" [2] regardless I use "clk: qcom:
> gcc-msm8994: Remove NoC clocks" [1] or not.
Yeah, that slipped my watchlist as well. I was supposed to send this (or have
sent in the past but then forgot to resubmit it? not sure tbf) before gcc changes
landed, but I forgot to. Providing the clocks is required.

Konrad

> 
> Kind regards,
> Petr
> 
>> Konrad
> 
>> [1] https://patchwork.kernel.org/project/linux-arm-msm/patch/20211230023101.1122588-1-konrad.dybcio@somainline.org/
> [2] https://lore.kernel.org/linux-arm-msm/20220113233358.17972-4-petr.vorel@gmail.com/T/#u
> 
