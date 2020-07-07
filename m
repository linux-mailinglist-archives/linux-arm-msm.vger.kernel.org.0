Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4907B216F69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 16:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgGGOys (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 10:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgGGOyr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 10:54:47 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F74C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 07:54:47 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l2so45355810wmf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PzICV5P/5fXN0O8oi3hO1LTBadk24TZeOM2WE369Tyc=;
        b=E+5hkIQUoTRgV1/j/Ma9SS3yMkFKRNhWTaqdcl+5qmDfS9hUkLjwIVZarQFI3ZHI6b
         rlH5ZDKM/dhHSvMwZX2MnqgX1SpikG1diuKSVaIQmftVBmPxVAD8GFe5942oiEgkbfIf
         K4MXWdmpgYGbPN9O8fnM2nE4Pd82giJkcvzg/u32INEnyM54iJm2TxQOiHr6WQVF7nrZ
         fw6huJWr5zZ7djbbyiivbCCGabI6CaY3uAUtQKp6bSNMzUtjeqMPHQzOvyucYIsEPXZy
         /1QOsJYJF61qDA2Peg5s2ZES6oVye/HAV2m6kD5MAeGhYPCKPuQKvGNpkOEyCai/lPjU
         /QAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PzICV5P/5fXN0O8oi3hO1LTBadk24TZeOM2WE369Tyc=;
        b=RAfXFG1E9e8VXNBxodyrdwezvwwaYGn+5RG0zZpzpVXtzZv9lNY1ExiF9ySylJxXx6
         CxjwrHAPdUmVcQLwoxo2UrAXDOhJUbsl1SH8gdJogy5lGb+52jpjbA/jdeqkOiCYZHoj
         ++GPqXooGXto3yFQJ/oFOGN9JZrJPKaIy73ykC7YrrofdInGt/MIKJdrvHvGka1ablnd
         xjgj1Ry2mNXCc3QnS+WZzeoqFlhAuMZZhgmSXJN11Aun4yRl8aXa9egdVAgHhzKHimFY
         dqx9fUB6rnqvTr0yxXnYFI7TIqPLfcENH/62oQi8ALmevJlREKmfVLphGX1hY1ZpT+Rp
         7DVw==
X-Gm-Message-State: AOAM5312J2d2gaL5UPBxM5PuZNH93ha5YjgOIkgD/ElOj4D2/IVzBJNF
        R0YyhWbVWNUtEaSM2IrJA+bYjQ==
X-Google-Smtp-Source: ABdhPJyuonfrVFjpjX9TLl886a/7yKFi5J1qixNTUhlNFpixziv4HhnXXZg5sCj4A2JCjd5SaKBJZg==
X-Received: by 2002:a05:600c:410f:: with SMTP id j15mr4526284wmi.128.1594133686255;
        Tue, 07 Jul 2020 07:54:46 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id z1sm1363432wru.30.2020.07.07.07.54.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jul 2020 07:54:45 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] nvmem: qfprom: Add fuse blowing support
To:     Doug Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     mturney@codeaurora.org, Jeffrey Hugo <jhugo@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, dhavalp@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        sparate@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        mkurumel@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200622144929.230498-1-dianders@chromium.org>
 <20200622074845.v4.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid>
 <CAD=FV=UJ9fm0z-6kAm4wDCfb8Ugr53i4RciCHTJT91ec27Mm4A@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bf75ef0d-1267-377e-9875-e44be3f5e406@linaro.org>
Date:   Tue, 7 Jul 2020 15:54:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UJ9fm0z-6kAm4wDCfb8Ugr53i4RciCHTJT91ec27Mm4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/07/2020 15:52, Doug Anderson wrote:
> 
> Given that I've resolved previous feedback, I've been assuming that
> the series looks fine and we're sitting waiting for Rob Herring's
> blessings on the bindings before landing.  Is that correct?

That's correct!

--srini


