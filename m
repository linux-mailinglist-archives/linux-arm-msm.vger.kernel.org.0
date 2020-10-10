Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA49128A273
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Oct 2020 00:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgJJW5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 18:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731091AbgJJTuC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 15:50:02 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB59BC05BD09
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2020 06:16:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 133so12297705ljj.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2020 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I6GLcoUpo4y0TA4rpDhzzmDcBN9KGSF4okvjQ/EzDKw=;
        b=dbKFu/0xJ40OfYyUCpMPFDakjxp7Gl3QQfRQVZsLYZNvGaWowfCN/6WvlDkeEAmWan
         jvQt5imfuiC/aVURtOcyCsXiXsq/1kbEwQpScyw2EuhftRmlh8iB2kda1PREabWBc4V2
         Hz4d8KO59WUp7xGIIdoJu8CIXq1XoVwfo6KqMCrhOhEuc4go3z30AXBpfHaNTcCcXjiX
         cPUrkdy3K5IgGSIFp3Os75jomspfFSK3TPBFMOO4oU/6hMz1r+/kMfAuZZtsPcgKqH8F
         04i+q5IQFeuNq9CKIq0sLl0nuTY82X1iLKxZmiHw9g3guAcKB663xEleDUrU93OdCBZk
         szTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I6GLcoUpo4y0TA4rpDhzzmDcBN9KGSF4okvjQ/EzDKw=;
        b=rsIXk2n5tA/Wg5QFdYceGhsPAOqMEHacy2y8fJbIvqOMxgZRRk2No/yXmMxOMGTopv
         0LP4DrkCpZHpixDMkhEXs+2gAM6XzTYwYLb9sreo5cqh5xjtU4uldhY829Er5zcpP76V
         ssyPQn9twBPmziqHLxim+GAdgLYdpk7QHqldauCNL/64Rtsjq6B1CZ8I/sZyR0Nctftr
         +YrlfZlIwnlkBvUy7z7op1g7Hh7+/CDB9SX9UyPnjByqnY9H/y2Tm+w08xLliJc1jokl
         N+CDQ+4WS8XE6JfKwMfer1kESd8LJ7yOoz4Wa2bvXowR69e+KqEAdXywe8b3B9QR+MJJ
         wDeA==
X-Gm-Message-State: AOAM530ae5b/VPY7X/fs4mjgMWUQ7ay5qctrCTNv6wIAPkofaZQ9gnKZ
        Roiaxk7XVjaTCcWWo95NpVxYXA==
X-Google-Smtp-Source: ABdhPJwlXMQJxFWBfenbvdcBiEfKPnu9TbzWaGCDysOHjfEB50KaSJXJjYDYWKf6ptVKsw0kUEvQMA==
X-Received: by 2002:a2e:9d8d:: with SMTP id c13mr6464279ljj.339.1602335812137;
        Sat, 10 Oct 2020 06:16:52 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.65.231])
        by smtp.gmail.com with ESMTPSA id w20sm67086lfl.220.2020.10.10.06.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2020 06:16:51 -0700 (PDT)
Subject: Re: [PATCH 0/3] i2c: i2c-qcom-geni: More properly fix the DMA race
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-i2c@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <20201008225235.2035820-1-dianders@chromium.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4dcdc8b3-94aa-8e68-934d-70542897db6a@linaro.org>
Date:   Sat, 10 Oct 2020 16:16:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201008225235.2035820-1-dianders@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/10/2020 01:52, Douglas Anderson wrote:
> Previously I landed commit 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA
> transfer race") to fix a race we were seeing.  While that most
> definitely fixed the race we were seeing, it looks like it causes
> problems in the TX path, which we didn't stress test until we started
> trying to update firmware on devices.
> 
> Let's revert that patch and try another way: fix the original problem
> by disabling the interrupts that aren't relevant to DMA transfers.
> Now we can stress both TX and RX cases and see no problems.  I also
> can't find any place to put an msleep() that causes problems anymore.
> 
> Since this problem only affects i2c, I'm hoping for an Ack from Bjorn
> and then all these patches can go through the i2c tree.  However, if
> maintainers want to work a different way out to land that's OK too.

These patches fix I2C DMA issues on SM8250 we were observing
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
