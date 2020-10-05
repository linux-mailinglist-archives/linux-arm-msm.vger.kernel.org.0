Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CEC283B38
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgJEPkV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbgJEPj7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:39:59 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3A6C0613A8
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2020 08:39:58 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f21so3849047wml.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2020 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C1vg2Q6l5F4FqJLE1Bb5zbVtOaKa/d+4nMiq5xRdW9Y=;
        b=jUNtrqld89Z5bRCRojNuzReM+r6JS6TOjo3LHRpNTCp6R6aoqghNbysIlGI0Cq5x/u
         oFokmONxGKij9rh2UROqxhkr1Yj/3NaUnc8jQYNwAi0NL+rC53HVlNBezK6SEqHjTU0U
         Pcpuyq8NhrAMshWDcSXa2GMQhncJMg2TJz80XavjIZo8xo2U17MIdMGd6HCPAo7CcYup
         5ear5n9cfVdO4JQTTWhf/3KiHQ2ElEpD48KfoJHcDkMFsDsWRQlquyRkr433z8yfni5o
         dglUXTK46Tc/6V6zA4gmXplvBXXkRqVhIgufa3N5ce6vvK3ixzLYfxK3HHwZ+l8KrLd8
         i6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C1vg2Q6l5F4FqJLE1Bb5zbVtOaKa/d+4nMiq5xRdW9Y=;
        b=e41kJg/OkW/d6CPgF59ZwJmhkd6gYJHwsQAaFeID0ECNteve/lpxNBYzebt+8o0pem
         Zq0V2dLHHVt5OCo2UiI9XR9UPcSE/q+Kf3bJcaYzRYvpkQJUfUHNoMoLYDNKY8Xf3eXx
         MGs4ejrDOS2ub770x7+ClWDjVJ1iPptWx/RkyT29Tj+0LWNSqqulOuZ+URTQKcSPObT2
         o5TkQOA3TzNbR2c9IdIWa5gPXZrc6XmX+/m6Yj2t1GxlnPCOogfWgMTKGnaYg1RW48VV
         mGDlZbFJ0kOwtCEzb996nwmiRhc2fADmf0N8g97j5iQvg6Okbr+3HWWdgE6rObsx6EBK
         bvOA==
X-Gm-Message-State: AOAM533QRwiZX7ZVKvx8DoxxxIbOYIzl38oBhj/vRWSK4KT7euqOEkh7
        W7cR2kpRbjEFqVolIh6zWb7aBA==
X-Google-Smtp-Source: ABdhPJxiZm+vESjN0gChJKTJxn9dUw/2Iu2EArIoK2MZBfIfQLbryNdgReBDi7q9GobTXGDWIiz3EQ==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr240476wmh.90.1601912394300;
        Mon, 05 Oct 2020 08:39:54 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:4892:2327:f1c5:e39c? ([2a01:e34:ed2f:f020:4892:2327:f1c5:e39c])
        by smtp.googlemail.com with ESMTPSA id b11sm422714wrt.38.2020.10.05.08.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 08:39:53 -0700 (PDT)
Subject: Re: [PATCH 03/11] arm64: dts: qcom: pm8994: Add thermal-zones for
 temp alarm
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201005150313.149754-1-konradybcio@gmail.com>
 <20201005150313.149754-4-konradybcio@gmail.com>
 <c03ace9d-d983-c1f8-ab74-ed585aeb2364@linaro.org>
 <CAMS8qEXBrF-j5ObahFVcJFMuC7=ucz+y7XBzTyuJAqejsE0F+g@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <0eb34c71-3e1c-9950-de30-6b163d7cca3a@linaro.org>
Date:   Mon, 5 Oct 2020 17:39:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMS8qEXBrF-j5ObahFVcJFMuC7=ucz+y7XBzTyuJAqejsE0F+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/10/2020 17:28, Konrad Dybcio wrote:
>> Don't you want to add a 'hot' trip point, so userspace can get the
>> notification and have an opportunity to do some action like unplugging
>> some CPU before a wild shutdown happens ?
> 
> PM8998 doesn't do that and so I followed.
> 
> Anyway, msm8992/4 will never have all CPUs online at once, unless
> it's put in a freezer, so unplugging isn't much of an argument :D

What do you mean by they are not "online at once" ?

> If you want though, I can resend this patch AND add a hot point to pm8998.

It is just a suggestion, it is up to you and the SoC maintainer.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
