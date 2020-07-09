Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06D421962B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 04:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgGICW1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 22:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbgGICW0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 22:22:26 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2A8C061A0B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 19:22:26 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id y22so663896oie.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 19:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DRE+AnxDTPA67RRsyblsDnMJP7GCjkB5PLB0tWpdoQE=;
        b=nCRjBy6rCZO4tPcusHqvk8I+q8WHCq+AFq8rirKjSah3x23m7XVXGu+vNcFW92y9y7
         xEhpHOfRp6MpBnynd88ykJtbWvcflOLOnsyQWNTRsMqI1CaqRtcF0EnByTqUhJ8sQ8NQ
         o25Hd8Nz0k8StgQqM7qU9DzS36rrlze9fWOx6SKlUeKXvI5a0kTfjChPAzqA7AvGciKv
         GV1xFmOHR6xgXdIVx1mk8jQIyTZIwiphkIwY+k0YJaOlWcUgURjjdHKT4iQhbD0KnWJZ
         wqySEbUIeroyGlYU2KpcCkrPrhgA6L+7SFD12PLRIs1M8dz3Eyb+x19TnUz1EyYzSgpZ
         pAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DRE+AnxDTPA67RRsyblsDnMJP7GCjkB5PLB0tWpdoQE=;
        b=YupUvcFS28EU26C3mfoWi47YWBbmPunaTiiZO2qv/k40vZmvRgyW4Y6w+ezus35t8G
         49DlKhrXWDLPEBKW3ecmAbD883fcQU9ducXQJHFmmBlJmgVj0d3FFFbsySoUAfnRduy/
         CDuZib7Ru62A5aSjmxRVs2nJi0F3ybSgwPMWkkevEgfPeg//6wUf6APVMmi5rBOURq8F
         PP/YdtPwGyJJ5C8kFrg9uPnrsIrkvgQQj34DQ4BsxbDl1vPV7aGk9oFHppgI9yFHu/hM
         3XDim0acGOrwRobR8lj70VnzEj8L0+8cUoDeLcxR1vIxfPIaGr+aytFlDdnsGhDCEMLs
         ZAGg==
X-Gm-Message-State: AOAM5309VU6SPNyrQKBh4AZTW7NEDpZDOtHIg2xO70OaQvdGtYnuaVxy
        jUFTU+Ae+l1vGRYX1jqm2U0aPw==
X-Google-Smtp-Source: ABdhPJzZ3KYDuqCl2pBVz6ZKWW75HF5fDGCk1N4x5FT6TuFs7kUO2+NXH3DohJjIcwdkm+vq6Qbhew==
X-Received: by 2002:aca:3307:: with SMTP id z7mr6660836oiz.171.1594261345319;
        Wed, 08 Jul 2020 19:22:25 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id r19sm290459otn.28.2020.07.08.19.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 19:22:24 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845: Add cpu OPP tables
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, saravanak@google.com,
        dianders@chromium.org, vincent.guittot@linaro.org,
        amit.kucheria@linaro.org, robdclark@chromium.org
References: <20200702204643.25785-1-sibis@codeaurora.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <a61c5656-e21f-f071-1149-a3357fe2684e@kali.org>
Date:   Wed, 8 Jul 2020 21:22:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200702204643.25785-1-sibis@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/2/20 3:46 PM, Sibi Sankar wrote:
> Add OPP tables required to scale DDR/L3 per freq-domain on SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---


Hi Sibi,


Bjorn asked me to give this patch a whirl, and I have to say, I like it
but I'm not sure if I'm missing a dependency somewhere...


In 5.8.0-rc4, I'm seeing a couple probe defers

[    0.131341] cpu cpu0: _allocate_opp_table: Error finding interconnect
paths: -517

[    0.132694] cpu cpu4: _allocate_opp_table: Error finding interconnect
paths: -517

And then a bit later on,

[    0.625837] cpu cpu0: failed to get clock: -2


If these aren't anything to worry about, you can throw my Tested-by on

Tested-by: Steev Klimaszewski <steev@kali.org>

