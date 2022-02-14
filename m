Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5B34B5A11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 19:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234470AbiBNSkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 13:40:47 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350782AbiBNSkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 13:40:43 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F0A65797
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 10:40:32 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id p14so15094283ejf.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 10:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8VBh79+Ny4PA51B+SNydGU0RP7+vIBXuirFrG98oTUI=;
        b=EKWS4ZcN8j/y+e+UDo7BAsXTLiGLDGVs1ahspXmtcfR36HMSDxYj4hnPSyGmHAnnGB
         +o0BNZO8w66S0VO8zRU11UabZr7OR0PfCFxN5d7VnMf35XOdZ1DjnPvoO+zbAJVMildU
         ZErWmf0OHl7TzS7q/vDAk6cY3JRIzUxQrSaj5MaX3tQ8Lwx3jQaEgrVWJNAPcbq1adHh
         iF3BDX6SzSJXPHZJzbiq/clCj72pkLNkFMVbK/gkq/iWtIN49/buPAexp5UtaXj8eimY
         xOrhH+kOxVi9Vw0j4kYPv9zxx8flEN/kB8ffEI4sXUFNVY+pgvJuMIp8upux4H8YViQF
         RWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8VBh79+Ny4PA51B+SNydGU0RP7+vIBXuirFrG98oTUI=;
        b=DN3JiiDqOCmIxZch+CqE7fteip3aqFL6XHxrxtYKMO0fmy/bk6ok32GdsF39YynIq9
         e+qhzrDgmyu5Fx++QlfLDLtCOGv+LAshvlqVhz8tiDyQdmCtnaBDHLQPqgrlGfLRfK8d
         QNga2JTwbYlolwDk2XBLSXhru93bXueRP2WdlsGSM58UJwRtlTBLAbKsKIfLjOUB/w2s
         CX+qTe+8QT0cJF4aRCYCLhOnp7cs2oSMSqICfSOqBQ55F/g5gAZ6nWkqRGkc0lTM/64c
         M7jtzKJGYdwIlzTdRC4pEDS+udlKEV5uU9u1sfePWN5pnS7ciA08obmlGiAmf7829gNC
         bzBw==
X-Gm-Message-State: AOAM531jH4LmWfTLDwLwEMo/4h/HySotp24l6tF4m9U/1V0QAI7f79V2
        rzUp7mBZH9C8Y0wAPdGJw4EsSZbTyKSu8Q==
X-Google-Smtp-Source: ABdhPJzcf/bY0fMRy6QzFYpyNVamteykkK9AxwzIMrV2bm0KQUR//QzDoLIE52Qt54+xHwPIA0ZJmg==
X-Received: by 2002:a17:906:5d0d:: with SMTP id g13mr74936ejt.351.1644864021411;
        Mon, 14 Feb 2022 10:40:21 -0800 (PST)
Received: from [192.168.0.30] (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id y16sm8076378ejd.72.2022.02.14.10.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 10:40:20 -0800 (PST)
Message-ID: <cf69e1b7-28cb-eaf1-1eaf-c4a7fc7e4ddf@linaro.org>
Date:   Mon, 14 Feb 2022 18:40:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 1/8] mfd: qcom-spmi-pmic: expose the PMIC revid
 information to clients
Content-Language: en-US
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
References: <20220211211959.502514-1-caleb.connolly@linaro.org>
 <20220211211959.502514-2-caleb.connolly@linaro.org>
 <20220213165550.13051272@jic23-huawei>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20220213165550.13051272@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

I've found some pretty bad bugs with this patch (specifically qcom_pmic_get()),
please do not merge, they'll be fixed in the next revision.

On 13/02/2022 16:55, Jonathan Cameron wrote:
> On Fri, 11 Feb 2022 21:19:52 +0000
> Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
>> Some PMIC functions such as the RRADC need to be aware of the PMIC
>> chip revision information to implement errata or otherwise adjust
>> behaviour, export the PMIC information to enable this.
>>
>> This is specifically required to enable the RRADC to adjust
>> coefficients based on which chip fab the PMIC was produced in,
>> this can vary per unique device and therefore has to be read at
>> runtime.
>>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Hi Caleb,
>
> Looks fine to me, though obviously needs a tag from Lee as MFD maintainer.
> I'm assuming I'll take this series through IIO once everyone is happy
> with the changes and hence it'll pick up my SoB, so I'm not giving
> RBs or similar in the meantime.
>
> Thanks,
>
> Jonathan

-- 
Kind Regards,
Caleb (they/them)

