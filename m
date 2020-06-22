Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091CB203631
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 13:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgFVLvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 07:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727864AbgFVLvt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 07:51:49 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A8BC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 04:51:48 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dr13so17690325ejc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hfeqg5svRM6AenSA89xK8sTv1AU7dxZQbNyjn/q1dmQ=;
        b=P8yU5Vm7f3xPa3sMw5Gd38SN97XqjSTmEK5kf0Um2O31nYv7NXPFJoqRPyeVVf4Ge+
         R7KFYKaXRzj1Kc6l9iXQyyYgsLYOTW68jVdZK7hBtOilBuvDdaoIokmWPydROGNgeARi
         HmrOVarL7dMhl3h6n5XjH/++GR1PDaJDASGKx4Nf9FCUQYbuP23NPw5s335J2lDDJQ/V
         VOQJivOHqkstDYDub9MP/y49UuNP4UhvIIQcBk8iNbg+rYc9MMTRo0lDP6oMERyFDWre
         Tu+lLv7nb8bUPw+nDceXtoWvW6NMHlilMf8zWlrnrjqCE4wODHRIuLXg0liYJt1pDntJ
         ahAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hfeqg5svRM6AenSA89xK8sTv1AU7dxZQbNyjn/q1dmQ=;
        b=o+NNyxNouOyMcjaZ/vMhgyJe65280I+RkOYtbXNJza1G1elk0zpy2j1AXMIb4wCqok
         +t7phdGx51FuTLPHE7Xo+L3S/3XftEwi6pJg0PEZpYPwrNuhhfdQWF3Q8+ifYx7JuA9b
         o3Y5t3NOGPq5DITR4zsqOl4nj15f8gEZ6O9BNy9HOJRjC59k6u8ITFkizToAza56srqH
         44lyXnXOYjw3H1s+gHN/4qOKFy5dy2w6p0Y/m0u/C448sefGBGu8F4SuMM6nBAtOX8Mk
         BW6ok5VE13FxCT+AqF7gK4i4umnJ8IVgze9GleYCWNkw0LLB5+bU9/x3IllNXmEBSALE
         lhWw==
X-Gm-Message-State: AOAM532qbhB1L9+IqLdkcw034JI0AcDC0wUmDJ6VVB6ZxjbUh6Tv1xBi
        spwtQy3+1vJ3qI8hTOKT8m714iGODZztcw==
X-Google-Smtp-Source: ABdhPJzdV0DBQnEECRTdLWeq+3+i9302Pe92hAb4MTCLJ3WcrYRmWt/8Fw14fh96ludqACYbjua9bw==
X-Received: by 2002:a17:906:9243:: with SMTP id c3mr15210048ejx.400.1592826707183;
        Mon, 22 Jun 2020 04:51:47 -0700 (PDT)
Received: from [192.168.1.5] (212-5-158-237.ip.btc-net.bg. [212.5.158.237])
        by smtp.googlemail.com with ESMTPSA id l6sm12294521edn.42.2020.06.22.04.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 04:51:46 -0700 (PDT)
Subject: Re: [RFC PATCH] media: venus: Fix NULL pointer dereference in core
 selection
To:     Doug Anderson <dianders@chromium.org>, amasule@codeaurora.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
References: <20200601150314.RFC.1.I1e40623bbe8fa43ff1415fc273cba66503b9b048@changeid>
 <CAD=FV=VHGm8EhsLOw_XTNRy6b-AKXgpwwGKE4kAm0-x4XT0ovg@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <7538429d-8445-95e4-4506-d5f28008a68c@linaro.org>
Date:   Mon, 22 Jun 2020 14:51:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VHGm8EhsLOw_XTNRy6b-AKXgpwwGKE4kAm0-x4XT0ovg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thanks for the fix and sorry for the late reply.

On 6/2/20 6:39 AM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 1, 2020 at 3:03 PM Douglas Anderson <dianders@chromium.org> wrote:
>>
>> The newly-introduced function min_loaded_core() iterates over all of
>> the venus instances an tries to figure out how much load each instance
>> is putting on each core.  Not all instances, however, might be fully
>> initialized.  Specifically the "codec_freq_data" is initialized as
>> part of vdec_queue_setup(), but an instance may already be in the list
>> of all instances before that time.
>>
>> Let's band-aid this by checking to see if codec_freq_data is NULL
>> before dereferencing.
>>
>> NOTE: without this fix I was running into a crash.  Specifically there
>> were two venus instances.  One was doing start_streaming.  The other
>> was midway through queue_setup but hadn't yet gotten to initting
>> "codec_freq_data".
>>
>> Fixes: eff82f79c562 ("media: venus: introduce core selection")
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>> I'm not massively happy about this commit but it's the best I could
>> come up with without being much more of an expert in the venus codec.
>> If someone has a better patch then please just consider this one to be
>> a bug report and feel free to submit a better fix!  :-)
>>
>> In general I wonder a little bit about whether it's safe to be peeking
>> at all the instances without grabbing the "inst->lock" on each one.  I
>> guess it is since we do it both here and in load_scale_v4() but I
>> don't know why.
>>
>> One thought I had was that we could fully avoid accessing the other
>> instances, at least in min_loaded_core(), by just keeping track of
>> "core1_load" and "core2_load" in "struct venus_core".  Whenever we add
>> a new instance we could add to the relevant variables and whenever we
>> release an instance we could remove.  Such a change seems cleaner but
>> would require someone to test to make sure we didn't miss any case
>> (AKA we always properly added/removed our load from the globals).

Thanks for the suggestion (I also thought about something similar).  I
will try to cook something.

>>
>>  drivers/media/platform/qcom/venus/pm_helpers.c | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> This fixes the same crash as the patch:
> 
> https://lore.kernel.org/r/1588314480-22409-1-git-send-email-mansur@codeaurora.org
> 

I'm going to take this approach because it takes into account the state
of the instance. The instance could be opened/created but the streaming
could not be started in near future, so it shouldn't be correct to take
its load when doing the calculations.

-- 
regards,
Stan
