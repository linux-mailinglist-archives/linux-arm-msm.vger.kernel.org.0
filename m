Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0753E47913A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Dec 2021 17:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238966AbhLQQRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Dec 2021 11:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235575AbhLQQQ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Dec 2021 11:16:59 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB51C06173F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Dec 2021 08:16:58 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id bk14so4305626oib.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Dec 2021 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7Wq4MgxHkO+MaOw126YWWMoQhIngGsKaWJCKmLC5qco=;
        b=OeZ4L8IaoKd27I02/ySpc8uOVaMNGfmBx3WzRrCeZsBdhhJX+mna/MicXwFZXRTtEx
         lOVmgq0s4GCej8uME0PkntFRM045oWiT/EWdvzjvwPGc00ppuAB+aBv2v9E874G3c2wh
         t5BPoQmpjKRcsXcpyIxhUGoxnrHcn2sq1jNMPcEECd6Bkn1+3B00OgEoHyDFGn3ZJGHa
         Kjx5LzaiJNTrmTHshq51RrJGppXF/B+Z2GesC+tNzXnkIheup5kWSCSb+/T3XzHEo1kg
         fJ8dYT+VmEhST+oXR3KsIwvQruihW9ghwXm1QJw9cvH982SreoMjLC9EA7YVTvjoWGSZ
         /GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7Wq4MgxHkO+MaOw126YWWMoQhIngGsKaWJCKmLC5qco=;
        b=Yw7El2oo8XgZrPhxTn93007XH/6LdxSFDwY71SW38W9nUCY+Rb92tD/OzCP88nQFTn
         ODV642l7Hhs28NNDAtMDchhXCSoAyawocgkgz1FAhOYi8WlRaY+11UWFXPl8wpFWp+Wp
         iLHwDebRyh3oo1p+g/h8UvQXQN+BwUco+L+lUWHhSQlrTeAk9SiGFeCQUQt7zu7ochVA
         saWRzo2V0zx++CktS1Xl9MKCXTjD4x1qXlEFdBgSN0JoEBlvtQUZFRVFVlTH2u9cBA51
         DIfvi3KjHjMeMnlN4zOfYWR+XQ2f8p/k/c7P3L/MOWqnN4S9ifEsdkYO/+71Tj0pPvyb
         KVlw==
X-Gm-Message-State: AOAM532u5LD7R0BeRGXyOY0E+xBhYcy2YLZun8ScStwLMVVRxQjPOB/o
        NkM6OraJCXORsgxOKWObcLvlHQ==
X-Google-Smtp-Source: ABdhPJyQ3wcKOplQsq/kToioZLkAQUcZsk3CXTKtqip9/DVAJHUV/jwFuMRvm9C6NGIFuJj7fcXQqQ==
X-Received: by 2002:a54:4791:: with SMTP id o17mr2724827oic.114.1639757818136;
        Fri, 17 Dec 2021 08:16:58 -0800 (PST)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id k24sm1716178otl.31.2021.12.17.08.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 08:16:57 -0800 (PST)
Message-ID: <7e2502ac-10c6-32e5-369c-260d19d7c225@kali.org>
Date:   Fri, 17 Dec 2021 10:16:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] clk: qcom: Add display clock controller driver for
 QCM2290
Content-Language: en-US
To:     Loic Poulain <loic.poulain@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org
References: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org>
 <20211216034909.3EFCBC36AE0@smtp.kernel.org>
 <CAMZdPi9eAFaExcTTgOt6TFE37EA-bb9xSy3nq9=nKYd5kqwmfQ@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <CAMZdPi9eAFaExcTTgOt6TFE37EA-bb9xSy3nq9=nKYd5kqwmfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,


>>> +       .cmd_rcgr = 0x205c,
>>> +       .mnd_width = 8,
>>> +       .hid_width = 5,
>>> +       .parent_map = disp_cc_parent_map_4,
>>> +       .clkr.hw.init = &(struct clk_init_data){
>>> +               .name = "disp_cc_mdss_pclk0_clk_src",
>>> +               .parent_data = disp_cc_parent_data_4,
>>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
>>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE | CLK_OPS_PARENT_ENABLE,
>> These last two flags are needed for what?
> NOCACHE is probably useless with mainline.
>
> I've added OPS_PARENT_ENABLE because AFAIU changing clock rate can
> lead to parent switch, and parent switch can only be done if parent
> clocks are enabled for rcg2 clocks. Otherwise the update fails and we
> get the following:
>      disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration.
>      WARNING: CPU: 2 PID: 77 at drivers/clk/qcom/clk-rcg2.c:122
> update_config+0xe0/0xf0
>
> I'm a bit surprised other similar dispcc drivers don't use the same
> flags though.
>
So, we do actually see this on other devices - in particular, on the 
Lenovo Yoga C630, and people have been trying to track down the initial 
cause for a while.  I tried here adding CLK_OPS_PARENT_ENABLE to both 
disp_cc_mdss_mdp_clk and disp_cc_mdss_pclk0_clk in dispcc-sdm845.c as 
well as for video_cc_venus_clk_src in videocc-sdm845.c and while it does 
seem to cause the messages to go away for disp_cc_mdss_mdp_clk and 
disp_cc_mdss_pclk0_clk, the one for venus seems to continue to show up here.

video_cc_venus_clk_src: rcg didn't update its configuration. WARNING: 
CPU: 1 PID: 404 at drivers/clk/qcom/clk-rcg2.c:122 update_config+0xd0/0xe0

I'm not sure if this is due to venus being a module and not built-in.

-- steev

