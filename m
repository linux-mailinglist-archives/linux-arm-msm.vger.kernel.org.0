Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5CDB3C9273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 22:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbhGNUvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 16:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhGNUvU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 16:51:20 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0508C06175F;
        Wed, 14 Jul 2021 13:48:27 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id dj21so5070692edb.0;
        Wed, 14 Jul 2021 13:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VB9qeVzW5ZTD8G9o9lV5Rx+cA3rqjHRpw3e+hnvVfbA=;
        b=BmqdGFdRyn1zQnaArA9LAcaEVY4Qc7m2qZxWD7gyRCV1C4cOWhQlXYM5PVqlogvlq5
         JzKmJkoJZuQS/gfQJPU3eGuToSsDfxncmnek53tkHXXITuM8X+ZKx8U+/++T9wEFWJhT
         MsQNXczNsaC9J7rKuqT4r2GcBWVC0DrjDIMnnywWGUP320UjiOJ/cJ6dV0tC9+ng3UZX
         mybOKReSFzRGukdaX1cvQp2h8L1Kx/J9DeVFqs4hfMtAaU4PrdqMPhd/TeW6V+vAqfHJ
         JDhil6LlSLaJsDie1H1cus6celLlrHuDerxdp6JqJHRQPf6YinPMcwG4rqCFz70s7uwP
         almg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VB9qeVzW5ZTD8G9o9lV5Rx+cA3rqjHRpw3e+hnvVfbA=;
        b=S3TYguxNTiJATkfsBqruLAIRpPRvbA5ryIdK9ElU4opa+Bc2b5eOPq+V3Zfkkwnmf/
         SlJGbY4Gz+331IUUZbfEBBYeb8thbc/DRmnD8aazGmLve3BWR0arEwQOTBoFzCWueB0w
         ZlqmMwZItRovFLfXc7EpvLT7S56Z5t8mnJHcVi3LuDW++26a4FrZkF9oVWxBtaTSQjl3
         LCSWfwIUiLB98ddei9Apt5y7/Nf0sqziXMAuPvypzuD49fdPEVTa/4QNLV7LWv/aRicq
         lpLwjVisRE4SSS0Pqzxflm1WCTwwYNhPZMu0Q42r/TX7mW2+c34ZaEmUw7rjUjXfTbb9
         E3MA==
X-Gm-Message-State: AOAM533ZseNufQfWT8ExJdxc460IY4b8PSgRAw7jg/3LCyQjQdCyJ09I
        dAc+S6fEiDhp5QcS+xwT8gE=
X-Google-Smtp-Source: ABdhPJxaPUz/pVNwc71fze3quHj5hQPybKUR9THlmd5U9VpU08zPruFLfUDC8E91ifeHbHkH8ji8eA==
X-Received: by 2002:a05:6402:34d3:: with SMTP id w19mr282779edc.53.1626295706651;
        Wed, 14 Jul 2021 13:48:26 -0700 (PDT)
Received: from [192.168.74.110] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id ck25sm1487793edb.96.2021.07.14.13.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 13:48:26 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] dt-bindings: mailbox: qcom: Add SM6115, SM4250
 APCS compatible
To:     Rob Herring <robh@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
References: <20210622203759.566716-1-iskren.chernev@gmail.com>
 <20210714180554.GA2855492@robh.at.kernel.org>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <1bfa7490-2d00-15b0-0096-0fd9a27a491e@gmail.com>
Date:   Wed, 14 Jul 2021 23:48:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714180554.GA2855492@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/14/21 9:05 PM, Rob Herring wrote:
> On Tue, 22 Jun 2021 23:37:58 +0300, Iskren Chernev wrote:
>> Add compatible for the Qualcomm SM6115 and SM4250 APCS block to the
>> Qualcomm APCS binding.
>>
>> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
>> ---
>>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 ++
>>  1 file changed, 2 insertions(+)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

As was discussed in the pinctrl series [1], the two compatibles are actually
different bins of the same SoC (codename bengal), so there would be only one
SoC dtsi, so I made v2 of all of my series, the v2 for this one is here [2]


Let me know what the right thing to do is (keep just sm6115 or have both around).


[1] https://lkml.org/lkml/2021/6/25/918
[2] https://lkml.org/lkml/2021/6/27/167
