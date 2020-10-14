Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DDC28DD80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729900AbgJNJYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730348AbgJNJUB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:20:01 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2428AC041E4B;
        Tue, 13 Oct 2020 20:12:41 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id c6so1020382plr.9;
        Tue, 13 Oct 2020 20:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=4nvU+eV7iYHUQLYFDTIcrlgtcxo5Rsjbojd3ypYNoPc=;
        b=DdZu7BsapmAZuOuDViqs55Nc9qtjJ2aWfxqiyJL9Qyg+FOF8K9STZE6BjZ7gneB7ZE
         M3qPOGWilyBKx8dB22q23yMTr6VDYdCUvBzq1AEjuV8QXFNcwjVV1anbCz+3bqEwuOGU
         97n4ZY+n4pZccC6DcMypv2rE6doDcWuM1OZ7REzaDnIo32sAS6ntW52CgD0SwO1Cpb4E
         MmhsU49DLH3nonz7/EuKIo1NKhAWzvTfxyBwS4DmukTHvoH9fgRNFYHfPunA7ZlhwPsr
         LZbg0/NL8cU+6m3LZstLFnG8rAFbmoOh3SSbe3Qb8fpVZ99+7IPnIeMMF9s3iIXHTPwj
         FfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4nvU+eV7iYHUQLYFDTIcrlgtcxo5Rsjbojd3ypYNoPc=;
        b=C0jOjX3GEGpxbjLCatej7sip11MaqiiaydrzmyjqQal6IDUTvzZnkEKyBwIwByBUcB
         IjIO8TgXQLnuphSshH/yPxC6zBJXdaA9xYTR5is3J9AKlRgw9gOl75/o4jkXlDYhJVCa
         3/e0o2w8WJq0FqLdcZYd5Rx5/k6SV5cRu+xRv6wK/ZeW/MIi509qCdY1L1395Jr9Hb/8
         l4aazsQC3g/4tYjFmoqU5RZW9teNCBTz20/Qp5wXg5Kffh7tLWj78F6epEJpzJJvFQa/
         hevA1Y94fSRM3jLK5HR9YktbjMpL7PzAjQi4/kPNbwG+ys94mZGnNXJSQ3wBIizcalLa
         ZUcw==
X-Gm-Message-State: AOAM531AgZf5IdDdV5zgm9SuMQzQkrYa5+QjAs/KUm1XYexofM0gQJ15
        KkvR3L1LivPoC5E086eMDkHOTE+/Gwo=
X-Google-Smtp-Source: ABdhPJy2Day9JQ/9urHVr7LLwG6P90nqn2XGhFFTNI5IO6XI6iAkYSGFa/o4ogW3rGWET9Abny5AZw==
X-Received: by 2002:a17:902:342:b029:d5:ab9e:19ce with SMTP id 60-20020a1709020342b02900d5ab9e19cemr2435383pld.48.1602645160113;
        Tue, 13 Oct 2020 20:12:40 -0700 (PDT)
Received: from [10.230.29.112] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k68sm1241671pga.36.2020.10.13.20.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 20:12:39 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: remove an unused property
 dma-ranges
To:     Zhen Lei <thunder.leizhen@huawei.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20201013060623.1711-1-thunder.leizhen@huawei.com>
 <20201013060623.1711-2-thunder.leizhen@huawei.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <fa40441b-6ae1-6018-3da6-424d0252c1ba@gmail.com>
Date:   Tue, 13 Oct 2020 20:12:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201013060623.1711-2-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/12/2020 11:06 PM, Zhen Lei wrote:
> stingray-usb.dtsi is finally included by three dts files:
> bcm958802a802x.dts, bcm958742k.dts and bcm958742t.dts. I searched all
> these three entire expanded dts files, and each of them contains only one
> dma-ranges. No conversion range is specified, so it cannot work properly.
> I think this property "dma-ranges" is added by mistake, just remove it.
> Otherwise, the following error will be reported when any YAML detection
> is performed on arm64.
> 
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> its #address-cells (1) differs from / (2)
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> its #size-cells (1) differs from / (2)
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

This looks fine to me, Scott, Ray do you want to Ack this patch before I 
take it?
-- 
Florian
