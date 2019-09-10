Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBCDAE710
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 11:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbfIJJet (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 05:34:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38510 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfIJJet (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 05:34:49 -0400
Received: by mail-wr1-f68.google.com with SMTP id l11so18699625wrx.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2019 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1s+ZG63MAQccFl9RI5BId8EEo4YivDiX7geRRVwkm2s=;
        b=VZjHJldhG0W3JDoaKZJebBv6Nu1AnmYHqVop5+xyxHcpiFcHKhSdgyCvDLtabgiUkb
         aNZrPr+1tl2zkEnl3X0VUImt6sUHiofe+F3X5IHEHfpOytlb1OKMc9KJgJVHsWiwpBfQ
         mqHdMk0u2gQrQsxKFF8iXB3C3no8IW1ubgYLNVaytshnavnPzwBpOh1bIpmkG1fLPjR0
         cdOere/WA0hk5zOsZtPATfWVO4CrPuImlrzrs3nMsaq9nzjuGK2/3E61mIfm4Ca/dDXq
         53RNh3xlJM+xnY42EOq4e6q7174kRNQkYhVyj3oZmGOvtAKlHQR8NTbzzcXLdt9Z7bjp
         G5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1s+ZG63MAQccFl9RI5BId8EEo4YivDiX7geRRVwkm2s=;
        b=Oyve4NWBiyzp9YqWOyIDkf4/8+xbMVy8QqqtLp3Rpo1bH8AsdZChZZuB674IOkyYFB
         zWGyt4EH31xkSBke0nIkWGqpDN5ThAAJujna6p603pO0H9WAJ6OyBTQup1QhgyI0wNeR
         MAMPrD41qrPmrAJ6sXezm1QC8cXms5hB555W6/p8o1W7Ny6wCQ+4QOe00GrfrLiD0tXG
         DOqSSm4XWTZCz9WdN+Q6iVMfEKJMkgNNX2m0lpZGhq4z2eCkt9vmfL+LLpwkSFXlkr0R
         fO64BRnwSBsJh+Q6uabjgHz/ZrYdt/YxNFIVq9iKUqkRxTq2EO8hPb2mXJUN2OhRCjGX
         7YJw==
X-Gm-Message-State: APjAAAV9Tg4hgkGUZnDCwPObdjc4wVGVXYuu1DGC2MKKMIU4UprPmKXa
        /07mHwahO3oGdqztB824VOeYrA==
X-Google-Smtp-Source: APXvYqxJvqDDgTOUB+fbAweVs87j9YToDzCTcDRxjeiuUhtOrOlS+jia9dUzciDQe9YIL2egPmffog==
X-Received: by 2002:adf:de03:: with SMTP id b3mr23565048wrm.14.1568108087657;
        Tue, 10 Sep 2019 02:34:47 -0700 (PDT)
Received: from [192.168.1.6] (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id 74sm2332116wma.15.2019.09.10.02.34.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 02:34:47 -0700 (PDT)
Subject: Re: [PATCH 2/5] clk: qcom: apcs-msm8916: get parent clock names from
 DT
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
 <20190826164510.6425-2-jorge.ramirez-ortiz@linaro.org>
 <20190909102117.245112089F@mail.kernel.org> <20190909141740.GA23964@igloo>
 <20190909161704.07FAE20640@mail.kernel.org> <20190909165408.GC23964@igloo>
 <20190910091437.CCA78208E4@mail.kernel.org>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <fcac3f60-6a96-b3ee-f734-a03636fbbee4@linaro.org>
Date:   Tue, 10 Sep 2019 11:34:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910091437.CCA78208E4@mail.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/10/19 11:14, Stephen Boyd wrote:
> Quoting Jorge Ramirez-Ortiz, Linaro (2019-09-09 09:54:08)
>> On 09/09/19 09:17:03, Stephen Boyd wrote:
>>> But now the binding is different for the same compatible. I'd prefer we
>>> keep using devm_clk_get() and use a device pointer here and reorder the
>>> map and parent arrays instead. The clocks property shouldn't change in a
>>> way that isn't "additive" so that we maintain backwards compatibility.
>>>
>>
>> but the backwards compatibility is fully maintained - that is the main reason
>> behind the change. the new stuff is that  instead of hardcoding the
>> names in the source - like it is being done on the msm8916- we provide
>> the clocks in the dts node (a cleaner approach with the obvious
>> benefit of allowing new users to be added without having to modify the
>> sources).
>>
> 
> This is not a backwards compatible change.
> 
>>>> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>>> @@ -429,7 +429,8 @@
>>>>      compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
>>>>      reg = <0xb011000 0x1000>;
>>>>      #mbox-cells = <1>;
>>>> -                   clocks = <&a53pll>;
>>>> +                 clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
>>>> +                 clock-names = "aux", "pll";
>>>>                       #clock-cells = <0>;
>>>>                };
>>>>                                                                                                                 
> 
> Because the "clocks" property changed from
> 
> 	<&a53pll>
> 
> to
> 
> 	<&gcc GPLL0_VOTE>, <&a53pll>
> 
> and that moves pll to cell 1 instead of cell 0.
> 
> 

what do you mean by backwards compatible? because this change does not
break previous clients.







