Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10402280B44
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 01:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733222AbgJAXRM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 19:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733131AbgJAXRJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 19:17:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEAEC0613E4
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2020 16:17:06 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so535774wrm.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2020 16:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lsAtKdbbGwCFSZvYEK9LUdJCmMnTxvc7zkOvFkI0M00=;
        b=lxdO82HCa9E2YycZTS2qqXAS5Yo7m1LuRhU1iYTtrP5Nj++fBqSsSDiYZ45GPj4Dxt
         EJA0LQGIC2ufGci443gnZKEPY8iJ1Eu2V14sD3w0nhs2h5INIG5JqEWOsRBAXhxzREtm
         CvzjX+Zdgar8Rs7Q1ck7I0FflIkRQTw6gEaRhlwvvIONK8FjbSdWaImTCBzUW/C5MtId
         Cf7xqqyZB8aCT1kqlChy9Md18tOSTvheayZ0HAPXj0pXwLkX4NE3++loguZsouvAa5F8
         Nasj54K54vpUyNYBPmR88ghkA1PBrbCRZqbrBcCO8k8sxT96Ky1rLxx5op5RP00Rqsnm
         Qd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lsAtKdbbGwCFSZvYEK9LUdJCmMnTxvc7zkOvFkI0M00=;
        b=GALuBggiydlOla6Veibtf1FSoWbQkv0YyaAg+8vqzERoqkB1sn2AZxb0bLcfd9YYbg
         Ugl07hp60dOX8Z1AxXmZRV6gCBONlDUgdGqm9Ze+lzL6ZQPK2t/VYjv1+l4PA4dFWVbW
         3gnA3Xy4Sv9nslkPoG/gIP8nYrYZLOpMAz9pL8zPCKRVaL0JtFyvdNSTZ6TxfK6VukLP
         hnXMQadqgjWBogfuket9+uE33+x9Dp37skgqe+HEktbjzLCklDUezcwBqJ0rmOEqdMr5
         T6nM/clHya4oYeSwo1MXPQysYM0onzw6xJmI2znvtFaUVy7XQSeMlZlmTUrLfJ8BuImF
         OlQQ==
X-Gm-Message-State: AOAM531C+RPmRosa1rrANODpfaPS0psyloFkGxD2RuVfwb5+yj4vKlaM
        m5HqtkJU8gmu/zN5jLp6NTgwhA==
X-Google-Smtp-Source: ABdhPJyce3UDx0zfoKvLMrvqG+BBLnRweOGD6TtIsyQPWDZyrmk5GImxMgnDwomAHbx/YW73FO0xzA==
X-Received: by 2002:adf:de11:: with SMTP id b17mr11356928wrm.82.1601594224596;
        Thu, 01 Oct 2020 16:17:04 -0700 (PDT)
Received: from [192.168.1.7] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id v2sm2271598wme.19.2020.10.01.16.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 16:17:03 -0700 (PDT)
Subject: Re: [PATCH v6 0/5] DVFS support for Venus
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
References: <1598970026-7199-1-git-send-email-rnayak@codeaurora.org>
 <34ed34bd-90fd-0e84-6020-c487d612ad2f@codeaurora.org>
 <aec87de2-500d-763c-df01-c0daec56b1e2@linaro.org>
 <CAD=FV=U=OCQpVL6VOVd4B6rW7HFC5S-wGauMAsOdvzwjLzKLuw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <5c9ce5fe-f903-e1bf-8a6e-3714a023ee4f@linaro.org>
Date:   Fri, 2 Oct 2020 02:17:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=U=OCQpVL6VOVd4B6rW7HFC5S-wGauMAsOdvzwjLzKLuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 10/1/20 11:40 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Sep 16, 2020 at 12:26 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi,
>>
>> On 9/16/20 8:33 AM, Rajendra Nayak wrote:
>>>
>>> On 9/1/2020 7:50 PM, Rajendra Nayak wrote:
>>>> Rob, can you pick PATCH 1 since its already reviewed by you.
>>>> Stan, Patch 2 and 3 will need to be picked by you and they both have
>>>> your ACKs
>>>
>>> Rob/Stan, any plans to get the patches merged for 5.10?
>>
>> 2/5 and 3/5 are queued up for v5.10 through media tree.
> 
> Normally I'd expect device tree bindings (patch #1) to go through the
> same tree as the driver changes.  Does the media tree work
> differently?  If you're expecting Rob Herring to land the device tree
> binding change, is he aware?

I sent pull request to Mauro with 1/5 included.
Thanks for spotting.

> 
> 
> -Doug
> 

-- 
regards,
Stan
