Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B500424A97F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 00:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgHSWj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 18:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgHSWj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 18:39:28 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660FEC061757;
        Wed, 19 Aug 2020 15:39:28 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y3so276362wrl.4;
        Wed, 19 Aug 2020 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nRpCADsHOf/cWhcypV5jnkA5SHzSc6g+QJdTCoTw3Ds=;
        b=UiFY5EFg4f9I/213bZd57Gg8sKrk9+m6VDfEtWtAXi5DIt7Kb8yENRGuPg46iMtuHO
         VF/6fWP3m0inhANxal8sMy2Cpy1Ui8Jj3ChCNwbL6voIjWBhlUHLJ+bjN/ihOAqJz1hJ
         o95p+grke16tJSIiwBcl8gtbdLXl3Svbs6OEWhABY7wR+sIhu1pe2gIaPtSyEtxibn5k
         xug8GlgMoFMeeCbtQrEtAZYZSifQ6miaW8ubqwnodnY8bA5c9bWJPEwr8f5qdyR1XxYF
         UWqevL4r4pxh+pa70G0+Eo7ngQCEflQln2vQjxdqJS5TBMbmFVUjOGdBWBcT3aTEF0Ec
         yFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nRpCADsHOf/cWhcypV5jnkA5SHzSc6g+QJdTCoTw3Ds=;
        b=NdDtnaJEZeMFRymGi4Al7neZe+1OEqELPJ64Yp8z9jZzPNnH/vrnzMM3MBIdIFkbQD
         hc+grGQ8kjSo90+ru1dWfCFyMRJPILCAQ5W42vu1UlVw70m78kTXEY4Zy21zU+UXrN7H
         pU4CiUMt+pP3fMaFNuqCgdki6AM94X9BCF8Vl70NoyryHLQMACjl30wFzcNPFC/VqPZW
         EKNyOLmqp39MxrHDK+6aTjqqHXI4c5Gl0u3suvEEKb5V3vgEXNZPM3gFkCHA5BbxXe80
         pvQgs51YGKVmpmFcND3wQf5Nt/ASbPM99uNfKpEgde3lJjVGDHR3EiQyn9mGna8ZCEMo
         MRCw==
X-Gm-Message-State: AOAM533HFZ8i1xL/r6JG28t1D9EBQr9pgMfBHUdEc/ewc98X2fr5Jvdw
        el/aSbVmo/rbcb+rcE/+kZGVuy+q1m+b9g==
X-Google-Smtp-Source: ABdhPJyFRJO0AZRVyZ+C0c3HOnzZQn+Vqb9ABZGDytFjKz/PRua8HhDRp9AbY74tQIK5x195uVkZ5g==
X-Received: by 2002:a5d:4d8f:: with SMTP id b15mr191393wru.341.1597876766413;
        Wed, 19 Aug 2020 15:39:26 -0700 (PDT)
Received: from ziggy.stardust ([93.176.180.54])
        by smtp.gmail.com with ESMTPSA id u7sm414472wrq.89.2020.08.19.15.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 15:39:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-infracfg: Fix kerneldoc
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200729074415.28393-1-krzk@kernel.org>
 <92ac7165-765e-da75-4c0b-3b232521b5e9@gmail.com>
 <20200819174805.GA394@kozik-lap>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <38e5f452-d049-f323-4a24-f7dafcbdb72f@gmail.com>
Date:   Thu, 20 Aug 2020 00:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819174805.GA394@kozik-lap>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19/08/2020 19:48, Krzysztof Kozlowski wrote:
> On Wed, Jul 29, 2020 at 09:53:59AM +0200, Matthias Brugger wrote:
>>
>>
>> On 29/07/2020 09:44, Krzysztof Kozlowski wrote:
>>> Fix W=1 compile warnings (invalid kerneldoc):
>>>
>>>       drivers/soc/mediatek/mtk-infracfg.c:34: warning: Function parameter or member 'infracfg' not described in 'mtk_infracfg_set_bus_protection'
>>>       drivers/soc/mediatek/mtk-infracfg.c:34: warning: Excess function parameter 'regmap' description in 'mtk_infracfg_set_bus_protection'
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> Queued for v5.9-next/soc
> 
> Hi,
> 
> It looks like this missed the merge window. Do you plan to keep it for
> v5.10?
> 

Yes. I'm using the confusing way of v5.9-next branch, which means v5.10, as long 
as Linus does not decide to switch to v6.x

Anyway it's queued for v5.10

Regards,
Matthias
