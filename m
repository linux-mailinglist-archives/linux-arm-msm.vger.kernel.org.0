Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95BB740061C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 21:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239368AbhICTu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 15:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234588AbhICTu4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 15:50:56 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FA4C061575;
        Fri,  3 Sep 2021 12:49:56 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id i6so434088edu.1;
        Fri, 03 Sep 2021 12:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TLTZdxt4YRrCWMvs+6x21++pt60qnXzEfJsjuSANXRs=;
        b=UiL94UVzuBo38dNSRLwVbtxoePycFPfUTBEnKlOV420VLhTW3ifejSHECivtt0RB32
         k8XRH7ZfI52Kpsg+tymJqPd7quERFgsvB2GVSKiKc/GYXMg0EgBc9BK4Ms2UfVQT6KMw
         W6OHJs6oh53hEw7TwxKWezrmwWa/umBQZuavHKWECla1pO2EeHcwuM2K6bexj1jPy3E+
         KzBxUy9MU+WIGeq3UkrXFUcXd1OHm6c3QLu7qay2QKP17FXSnk+D3HRna+rau1ehfnI5
         IA3wsY569uWSpeuE4GUMTzCH9bZzR8rQeG6NEsxTAeDHlcfLuwPp2+/A2QZiIOJ3jQLK
         3vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TLTZdxt4YRrCWMvs+6x21++pt60qnXzEfJsjuSANXRs=;
        b=C1rDe9RcSSN9S+U3prg5SdZBVwAKPd1AaMgO8PtAliRyFuMNno4V2R757JAHs0ZArU
         WfPX1pBf/Byo6BrraxQyd6fwbajEklhoM5uUs4jHHoXz6Pb8tcC3XxxA9/uDBJQ0ZC27
         OaBqo2EW9oYQ4TL1IoL+bKDwPaoHhuM0pm6y4shgM2+17eTHEtnWQBxQf32diBGlkHGr
         cb2Df/dazgGGZv9qYmGsGA+yLn/+AMgxrXAmdPKOl6ztvrYidkJI73WBDUUPkOlG0mAi
         Xh2eTavT15a2Zhaad+LM3qEkl2g4HRz4p/bxs8iIy6nNhWaIRhGNMatxrizyJFPYOWhp
         6hMA==
X-Gm-Message-State: AOAM531saU2vSTWQx+1a6ugBkafbjtdtR3UGLnkbS6CHYnbaLVTxjdXZ
        8XOlSspwzxP2jiwiw8Fgv0k=
X-Google-Smtp-Source: ABdhPJz/mJXqTHuH/5zJJp/6ppvybq7ndyoWlsR1DNYoJv073xCYSJgenbik6q89CUGCCYiFQ6vQnA==
X-Received: by 2002:aa7:db47:: with SMTP id n7mr259907edt.378.1630698594838;
        Fri, 03 Sep 2021 12:49:54 -0700 (PDT)
Received: from [192.168.74.110] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id y20sm49071eje.113.2021.09.03.12.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 12:49:54 -0700 (PDT)
Subject: Re: [RFC PATCH 2/2] regulator: qcom_smd: Add PM6125 regulator support
To:     Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20210828115654.647548-1-iskren.chernev@gmail.com>
 <20210828115654.647548-3-iskren.chernev@gmail.com>
 <20210903152331.GK4932@sirena.org.uk>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <b02e3ba5-b3fe-8963-8457-62304a39e100@gmail.com>
Date:   Fri, 3 Sep 2021 22:49:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903152331.GK4932@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/3/21 6:23 PM, Mark Brown wrote:
> On Sat, Aug 28, 2021 at 02:56:54PM +0300, Iskren Chernev wrote:
> 
>> NOTE: The sources haven't been determined, so currently each regulator
>> has it's own source.
> 
> It would probably be safer to just leave them unspecified for now and
> then add them as people figure out what's going on rather than putting
> something incorrect into the DT bindings.

I didn't expect this patch to be mergeable, so I didn't add the dt-bindings.

So should I add bindings and just ignore all the sources (add them later)?

Regards,
Iskren
