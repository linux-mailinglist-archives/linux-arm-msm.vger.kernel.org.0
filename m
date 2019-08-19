Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30DE491D59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 08:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfHSGyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 02:54:23 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35177 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfHSGyX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 02:54:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id n4so634748pgv.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Aug 2019 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sWJlQTSBEOMCh5nB5DH6siEGtKeSyl6ScBGH9ifHyOQ=;
        b=b9uL31NcY/WwfuxOp5cPuq95N14dbd6KNGhcRQNo2BqseqQDuhhLTS571/TXal5NaB
         xcOaeMCtVeOj/u8L7L+NZsxgVrdJ5eJYzHN8KJla1coSoyV8sf87/OTYZHrK9vbw3pbs
         XcebGCvoaXgFduNAwQjASZC5BOB/HWQrCmXlJuK6aMRFtyGHTcypNsGLnmwjFq1v21I1
         VbcM9t0s5cZdQrYwdZbwsuzdURpOYBs9cbs62dJVSete1KAD/KXv8nVB5LimiECaHoPb
         LRbeaQRi/nZvRoVkJ/kEozuG4urdVr/ZKbI4UfeUmf22492iszcEfbytVCcWZaqdMFrs
         Ng9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sWJlQTSBEOMCh5nB5DH6siEGtKeSyl6ScBGH9ifHyOQ=;
        b=anp7Ch63oelwrUgQ9hOKHSwwGoJamiE1A3lqzCkyKtzbnXqr+f/txTlyhvC1VQTwm+
         2eQZghzheYZ8dki0reKPQ12UyeAvpseuAmlOLZ9u5kBSYofpEobYTDkHvzfDbrNiVoIk
         w764hfxjs8sdQT01T9rimqeIAyuOaCLJYShs+4SIOBco1b3Vd6//krnxTY0mQ5k/h+v/
         v63/ZOpGkAok7KCIxSfQ/NzJTCZiddTno67XFrLn9RWt7xqt2MHH9k+uzRWJzOY9G2+f
         aUHu5p3gExLMsYxLyjGkzT/lunb6rADubd6PocpWtvAYSP5xZTAuyxEXl7AZcsVN/qmR
         kjMQ==
X-Gm-Message-State: APjAAAXLBIOUho8O7ggPERYnMlmuO2FFXDBMI449jz/1zLrWDphBYsGO
        XJ3yOO/MctInuj8eQSEh57UB3Q==
X-Google-Smtp-Source: APXvYqyn6XNQMkA+NZOqYySmlT0/AvqE7dviESCrNc+0i71jmW58wFNIu2D2DzIxJxzZuwGu7xo6jg==
X-Received: by 2002:a17:90a:358a:: with SMTP id r10mr19651582pjb.30.1566197662461;
        Sun, 18 Aug 2019 23:54:22 -0700 (PDT)
Received: from localhost ([122.172.76.219])
        by smtp.gmail.com with ESMTPSA id m9sm14943320pfh.84.2019.08.18.23.54.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Aug 2019 23:54:21 -0700 (PDT)
Date:   Mon, 19 Aug 2019 12:24:20 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, bjorn.andersson@linaro.org,
        amit.kucheria@linaro.org, rjw@rjwysocki.net, agross@kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: Update logic to detect turbo frequency
Message-ID: <20190819065420.3ch4cbfdsbbs67rz@vireshk-i7>
References: <20190807114543.7187-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807114543.7187-1-sibis@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07-08-19, 17:15, Sibi Sankar wrote:
> The core count read back from the each domain's look up table serves
> as an indicator for the onset of the turbo frequency and not accurate
> representation of number of cores in a paticular domain. Update turbo
> detection logic accordingly to add support for SM8150 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Applied. Thanks.

-- 
viresh
