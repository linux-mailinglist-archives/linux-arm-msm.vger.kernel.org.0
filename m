Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472DB274211
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 14:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgIVMaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 08:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgIVMaL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 08:30:11 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25644C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 05:30:11 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p9so22585154ejf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=37wPUZzrX/ueT6NMg9kdHB6XHwPYogZuEw4uPuTq8sE=;
        b=oIhyeuaLGj08cdvdACtvkvydNaPZPaFq+WpBao9Pq15yHvRG3/hr3cMSGxrakQvPdO
         ivgc868sYCW8yoOCajySlIRRVuGIdN3W7TXk4u6unCsJv5Ok0NCaPdYIVDAxzAZCJBvG
         9Ulm9Gmytr6eqnPVwAaWnm5rjwIGF96PP9sR/MhKlQKBLnrGjUX+LYAcXnkRGSTohfFz
         Fided702z52zWX+vUitJZqtB25hhSY6cJ7rdBqgk1Nkmmwg8lI6hRJlP1mrtphWBpMeM
         J2+Glq25J3TIVLJ+5Mwh4udr0a72SPJ3ArI6htoThIx8pf73XumzKILmDD6fXxpBCmnu
         ycSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=37wPUZzrX/ueT6NMg9kdHB6XHwPYogZuEw4uPuTq8sE=;
        b=lKiwnyh1oC0X0PMmU3zfvDrf1XXZRudUpsdk1dXn2cH81E+JhgnrLLBGv4fj4ykZx4
         IYgyr/rgeMHjEiyhS45Uz8MSsOPWF/UKFADCT/sYK4IbFLbH+zYDwy/Z+yhOY4mvWkRV
         /Mk4sMgQJiTbnj0zO85M2X0AFJ8AL3Slw75Xeotg3TeXHwuluMtORJftKd77EVVLZRp9
         7UqAXGYsktDSmg0xSqvqGzdfdK2bxOXHlq0Mkntppm+q8mM7p74iRuVCRIAE7ynEG1jW
         YpnqaBor9iy4FoMXeJG9rMWHhcpC44j+/owUpimrpQ7EJogQT8Rwvdw6RXw0wGVio9lo
         sMWQ==
X-Gm-Message-State: AOAM530SXUI2Lw2pA/twjeMThOat4X2ocEPqN83JL192uHGInaZeiA+E
        +DDVV6K4lGBknuTQLhOR5YRfagviz4ERGA==
X-Google-Smtp-Source: ABdhPJxT00Lhh7CKmtwtRvJkiNRG1mTv2/4NaMz46PvjY+Fy9xDQmUgYWIosjtWEk2vlmISB5kLEww==
X-Received: by 2002:a17:906:2cd2:: with SMTP id r18mr4762639ejr.371.1600777809712;
        Tue, 22 Sep 2020 05:30:09 -0700 (PDT)
Received: from [192.168.1.101] (abab42.neoplus.adsl.tpnet.pl. [83.6.165.42])
        by smtp.gmail.com with ESMTPSA id t3sm10887234edv.59.2020.09.22.05.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 05:30:09 -0700 (PDT)
Subject: Re: [PATCH -next] clk: qcom: Remove set but not used variable
To:     Li Heng <liheng40@huawei.com>, agross@kernel.org
References: <1600773678-46320-1-git-send-email-liheng40 () huawei ! com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Message-ID: <3724370a-19da-d4c6-fa6a-245e5017869c@gmail.com>
Date:   Tue, 22 Sep 2020 14:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600773678-46320-1-git-send-email-liheng40 () huawei ! com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This is not the correct solution. I sent a proper fix here [1].

Please do not modify critical platform drivers without having tested them on real hardware (I don't see any Tested-by's?). Instead, file a bug report so that more people can take a look at this. If this got merged, it would have had to be reverted eventually anyway..

[1] https://patchwork.kernel.org/patch/11792407/

Konrad
