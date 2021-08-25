Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBB93F6C79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 02:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235933AbhHYAQo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 20:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234794AbhHYAQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 20:16:43 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BC6C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 17:15:58 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e5so17155991wrp.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 17:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o8cymvCqZ0PZbJYG/lVJBD2Mv5a6pBJos8SHinki2+E=;
        b=kos0g5kgqe+aZrNOjFA5ZneD/IRFnSmzXw8lX6x2MXAHIpuyHksa8sggnZbdkkSPCd
         83L/+yIRmQ0wTA6ERCowrxIg1d+YfZuokL2SevBuNuGyTOAY6khZQG4qBJPA8OhP1p3q
         HyIXAW3nBXFziPf6oX24qyhBu2NIW+l0L86/mc/SvGgNIlz75B0TYSaPKmDaXawdEOFu
         h8C0ig7d0N4K8jjmdtDmqwJM21u2LzE4oGdfMa8MSYnYzh/o8LnS4QQleY+e6OC4L4aY
         sbh0vI3BqgsVZm9SImAhL9bhUMpf8vw0QCAU+MUeQHrBt1wwYzylim9DxJmCoyCK0qvF
         TvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o8cymvCqZ0PZbJYG/lVJBD2Mv5a6pBJos8SHinki2+E=;
        b=lmS67bz6p4FaJvs0rsbCPAg+3k6IgniDJTXqWGey95HJOfc1/E95pzC3DToFOqj7Ny
         a+4K42gsATvgcTqZ2f74O+peULDO5427YZli7nViHsSBz3dUh7jcStrxX9EnSxksM73N
         qJWoMLcMJv7ih8vltvQw7UVuvfTS3Q08ubIYhSfjZY5xU4QYTB176bYw4M22ZOGYJlTb
         qAEfD/zNzsNOPXQmWU+afMEQl8IFdHjq4xJ6+dlPIJKjV0Qf9+ZjJc6UcbB3cBQ144iR
         lJWb0eysdWPe7GuLE1yb1eidAVy3w9n8ArzV3THIhjHqSTUTcsCZ6pA6c3Jk/BaIYPcB
         6lQw==
X-Gm-Message-State: AOAM530si8gISsMSVb8Cdp+f/50kURU1Zo+wReUTqzGJyrV/3CnM7nYn
        14i2eQTxjMVFJo4h6AE8RQKVSiUVUGlnsJ/q
X-Google-Smtp-Source: ABdhPJyySA23pWTurR24O5Q4+2E3OyOmW0oKr3HeBO0HR4wwqepjneLUl+znTG6xSd5PqVX2/MJ8+g==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr5544936wrv.71.1629850557169;
        Tue, 24 Aug 2021 17:15:57 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n4sm4933772wri.78.2021.08.24.17.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 17:15:56 -0700 (PDT)
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Peter Chen <peter.chen@kernel.org>, balbi@kernel.org,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen> <YOZ3CBNTXFTa+fNx@yoga>
 <de86a2c5-92cf-da0a-8819-2de4c3c88b3f@linaro.org> <YSWGRcla0/dPLDpU@ripper>
 <593dc3f5-268d-580f-76fa-0be00505ac37@linaro.org> <YSWIZ/BNoAaHPByK@ripper>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <7724cf9b-39ec-51de-c469-4c70493ae636@linaro.org>
Date:   Wed, 25 Aug 2021 01:17:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YSWIZ/BNoAaHPByK@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2021 01:01, Bjorn Andersson wrote:
> On Tue 24 Aug 16:58 PDT 2021, Bryan O'Donoghue wrote:
> 
>> On 25/08/2021 00:52, Bjorn Andersson wrote:
>>> But isn't this role switching interaction (both B and C) already part of
>>> the core/drd, so if we can just get the drd to invoke
>>> dwc3_qcom_vbus_overrride_enable() we're done (and can remove all the
>>> extcon code from the qcom glue as well)?
>>
>> Provided we have an acceptable way of triggering when a role-switch happens
>> - then USB role switching itself is a NOP here, its really just a
>> convenience to invoke the callback.
>>
> 
> Thanks for confirming. Then let's come up with an acceptable way, rather
> than duplicating yet another feature already implemented in the core.
> 
> Regards,
> Bjorn
> 

The only other thing to say about USB role-switching is it appears to be 
very much 1:1.

Extcon allows a virtually unlimited number of consumers of an even.

Is it envisaged that a role-switch could or should be consumed by say 3 
or even 4 separate pieces of logic and if not, why not ?

What if we had a magic black box that needed to sit ontop of the QCOM 
layer and further consume a role switch ?

notifier/platform pointer + callback ?

---
bod
