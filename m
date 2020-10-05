Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35737283BF5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 18:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgJEQEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 12:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727487AbgJEQD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 12:03:57 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFB5C0613CE
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2020 09:03:56 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y15so71940wmi.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2020 09:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uo220a6rdlw3GxUuDIlr3sYYY1g7LV9qmd8uQhsVPEo=;
        b=lODvluOe5dzSF58N0UVpCpmhQlXLxHfuNm5BS1+EKic7A6XyT1oJPsMhXrt1qqTrWo
         Diixboxg6cBWwo8ja+D+F8Jx22w/6R9HZQ21BHmRuPiUNDILPeobf+WCj33QPLiUuuX0
         4Cl/PN/elZodhinZlIt4e+w4XerCOyJBDOE2gskXQXEzLtvdWOLF7TBNPFVvtwzWy6kL
         QYKKZsOchYFjQxM0jk/rp4AFMC2wfNOiD+IDxVeA9Q9drPI0QjaVe8rhPiQIMa8nvO2L
         RB339s7SY4jNKxrE8wqG4vhnYQv2zelgLErJxX/CgXkuJQhtpBK+TKV36fMeZJieC34t
         dSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uo220a6rdlw3GxUuDIlr3sYYY1g7LV9qmd8uQhsVPEo=;
        b=YbOhQ7kzl6BLhqkZLbx4xeKohV1+hklDqsS0mwEP+Bp+EZtdWsurI3O0Z/V3llNI1f
         8aCLYLUHg8nNSsXgxOkAUcCNZ8qatAlFQ97P65y9msyBHDmSjRV72FIfrQnHRfrU0yF0
         thWtrBse1DjW1aW637JgFrxg4PP/ZAXo3s7G0mjKqzVdlgR/GXycLY82IogHuW+aWiY5
         F7AfNt65b+rlv35QIXivtxgO8YQLisVHytWGyWi73v6++ue/fLvz9K4bcH4Tf4mXi9Es
         JybZoyKzrBA1pczKe4dbniMAsYppONq2qVItbxvsMqFycO7tyfNzTYe+mafukYYOHM29
         h+Bg==
X-Gm-Message-State: AOAM533zq1zwu5HdJ+Czz/Niv23xLjsqQaUu7R6KimOBhqJKnLDUKmOb
        mnApmWYa7q9dWJHqukaJYRhy8g==
X-Google-Smtp-Source: ABdhPJx7oiNZNU8rPFOSk/6JrMpDhyGXaAHiJ+eFN04aZ5VckTnqfxasRJGGYPFyzij5GBhIHIklBg==
X-Received: by 2002:a7b:cb07:: with SMTP id u7mr62850wmj.57.1601913834561;
        Mon, 05 Oct 2020 09:03:54 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:4892:2327:f1c5:e39c? ([2a01:e34:ed2f:f020:4892:2327:f1c5:e39c])
        by smtp.googlemail.com with ESMTPSA id m3sm433878wrs.83.2020.10.05.09.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 09:03:53 -0700 (PDT)
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
 <0eb34c71-3e1c-9950-de30-6b163d7cca3a@linaro.org>
 <CAMS8qEW2rxYCc-7dQKPMBKQzbw0w1CtxNPVJYbeBPb2-1WvfDg@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <12ee5c1b-66a7-22d5-29f1-31e25cfbe32e@linaro.org>
Date:   Mon, 5 Oct 2020 18:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMS8qEW2rxYCc-7dQKPMBKQzbw0w1CtxNPVJYbeBPb2-1WvfDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/10/2020 17:49, Konrad Dybcio wrote:
>> What do you mean by they are not "online at once" ?
> 
> msm8992/4 are infamous for their thermal issues. Manufacturers have
> been known for straight up disabling some cores or tuning the kernel
> in such a way that some cores get disabled due to the thermal
> constraints.

Thanks for the clarification.
I was imagining some kind of hardware feature :)


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
