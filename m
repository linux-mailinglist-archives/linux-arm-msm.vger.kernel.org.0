Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7E26793DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 10:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbjAXJTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 04:19:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbjAXJTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 04:19:38 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B703F2A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 01:19:36 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id w14so17566156edi.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 01:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P3b+zZ3ag0hEuuNzEBfm3AsRPxEk4uWTHAhqNBuaXhs=;
        b=Q1WWnuz/2DHYiEeHVIv68Fuu0RjxK6bMdDj/TNq1YjI87sc364h/7OB3BodLNpSuTt
         mmFt2JyN9u5q7AjN94YCfNW3V0bFaNIk9JO6GbTMaUM7nkw3pl64T7dLFHqkLvE8jG/f
         6+lNy1/+1tzlAtYJN0MlapokRD+92vMtG8jlOIvY7gh06FmhOGlZ42YNrcNvpXAmUrlD
         MiQUxjFrYcXpeD1LX9QnRMqO1omNOCJMDS/VCbmJ23U09HUaXKpUsR5sbsFHz7uDxY8Q
         DMqKAE+wLHXbupu0XPpS0T35JY2Pi2WPV38qKKA6n5udUhpI9mp0yhMLtgDuDZ4FCAof
         OxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3b+zZ3ag0hEuuNzEBfm3AsRPxEk4uWTHAhqNBuaXhs=;
        b=UcvifdBzieuiBH3IWbPwwHQVVcsRcHBQyOon0FlyrLgtx+5XUZbZGsK8T137hSmRzq
         ruf5LUYAMw0v5aR7i1YvpbmJti8ytf6/ohOvveAOkaYZonV9pzJmeTNbf2kHZMWew5bG
         w2zs9+FdTpOQwXa+Ld+f4JlWuApPYtUxPDkmIqlWq8ikZ0/lZj9EzVbf1+qKSvR7O66g
         tgLp7KOhLc51tIBRofaVBc2X30zAuEDj//nYV2BNi9zO0zIDJ/WmxYQoGaqG0XY6RNWF
         udnqXXNO7MKuhlGtn3zYEzXfZZ6W0PoVf/xgDMBSvhhuKw0sdDJGmpm8N+nJF39ZaHUr
         Iydw==
X-Gm-Message-State: AFqh2koCCTlRPFluMKgQUyPA0dvU2gniUB48FnMsunRb9IliTAkkBCXy
        sHZqdcXUiQvoyizNx6L565g5hQ==
X-Google-Smtp-Source: AMrXdXuckgGg73ikSf9utMHlzJ4xzVvpZPBINHL8g6KRm66GCU4U0olqIQM084JpFd2SF1e+/AZnxw==
X-Received: by 2002:a05:6402:413:b0:499:d199:6614 with SMTP id q19-20020a056402041300b00499d1996614mr27872469edv.36.1674551974548;
        Tue, 24 Jan 2023 01:19:34 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g6-20020a056402114600b0046c7c3755a7sm792580edw.17.2023.01.24.01.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 01:19:33 -0800 (PST)
Message-ID: <2fa21add-0198-937c-2de4-05f0f0a102df@linaro.org>
Date:   Tue, 24 Jan 2023 11:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] phy: qcom-qmp-combo: correct DP register offsets
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20230123120807.3101313-1-dmitry.baryshkov@linaro.org>
 <Y86TDYOKtpcLdZYx@hovoldconsulting.com>
 <CAA8EJppU4nQRYWwAahWtjrVbU1ywF4P+zxHs1PZm98bzKswiZA@mail.gmail.com>
 <Y8+KSV/0Jk9nnntK@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y8+KSV/0Jk9nnntK@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/01/2023 09:35, Johan Hovold wrote:
> On Mon, Jan 23, 2023 at 08:59:48PM +0200, Dmitry Baryshkov wrote:
>> On Mon, 23 Jan 2023 at 16:00, Johan Hovold <johan@kernel.org> wrote:
>>>
>>> On Mon, Jan 23, 2023 at 02:08:07PM +0200, Dmitry Baryshkov wrote:
>>>> Correct DP register offsets used with new DT bindings scheme. First, DP
>>>> TX registers reside in separate regions, not in the same regions as USB
>>>> TX registers do. Second, correct DP_PHY region offset to follow the
>>>> offset used for earlier generations/bindings.
>>>
>>> No, this patch is broken. SC8280XP is different, doesn't seem to have
>>> separate DP TX regions and the DP_PHY registers lies at a different
>>> offset than on previous generations.
>>>
>>> You can't just pull these numbers out of your ... ;)
>>>
>>> This is the only platform that I can test the DP part on and it is
>>> working. If that happens to be by chance, then you need to blame the
>>> commit adding support for sc8280xp (i.e. not the one that fixed the
>>> binding). And note that this was added by Bjorn who do have access to
>>> the documentation for this SoC (as well as actual hardware).
>>
>> Ack, let's wait for Bjorn to check the offsets. I find it extremely
>> suspicious that dp_txa/txb use the same region as usb txa/txb do.
> 
> Yeah, I agree, it seems odd, but then again the sc8280xp PHY is a
> different beast which also supports USB4, etc. The DP_PHY offset comes
> from the header file in the vendor tree and there are no separate DP TX
> registers there.
> 
> By the way, I forgot that Bjorn actually copy-pasted the devicetree
> nodes from an earlier platform when first adding the PHY and only later
> realised that the DP part did not work. The fix for that (e.g. to use
> the same TX registers) was never merged to mainline (instead we
> temporarily disabled the DP part) so the Fixes tag you used would have
> been correct if this turns out to be wrong.

Let's check with Bjorn. However even if the original offsets are 
correct, I think we should add dp_txa/dp_txb offsets (and make them 
equal to txa/txb in sc8280xp case). WDYT?

> 
>>>> Cc: Johan Hovold <johan+linaro@kernel.org>
>>>> Fixes: 83a0bbe39b17 ("phy: qcom-qmp-combo: add support for updated sc8280xp binding")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Johan

-- 
With best wishes
Dmitry

