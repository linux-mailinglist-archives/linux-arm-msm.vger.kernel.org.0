Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1588141AF89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 14:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240757AbhI1NA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 09:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240577AbhI1NAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 09:00:55 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05361C061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 05:59:16 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id v10so78555093edj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9zsXVooMH58kf0AvksPhazTyUL0hupc4ZNncbmatfd4=;
        b=oE1iKS5kxXY1TO/TlqzncIc1X0d4/JBTuJIREcPN9Z1zaAMzN4hqRcJk2qJfdfVGU4
         A7aC26zHN0RG8wY42w10R6XpKX20J+nRNiE/d5hsBIdBEzE5d3Cbk32KeWDoAacDOcLK
         5ihLgqowDC3FTNWkhQWbC2DC8LWPjbkP3ai02gLEyilvdjIYkjdj26MrkbABHv1Arp24
         rmdYX0vdKQkgMHANDIVebEozP7ZANz3cBIfM2kRDHzSXpVu7DC9LcqJIaRv5tc856V+K
         N1sNOxjE6IM+z2pffup5b2zlcf9c2jFO9v4rHJhrVSMo5Cba1iy450Tq2C8Ri2tW8eY8
         jD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9zsXVooMH58kf0AvksPhazTyUL0hupc4ZNncbmatfd4=;
        b=1z2mEGsENgX+N8AMTAoGt9xpO2xsYKm/O/rwcyvTaHYKXDTDT4YF43pji5g9OVVzhp
         woByI9A06MuVC6tmXqcPXphxQkS8xnUHLoCDHlXyhtkjQKNMoVnGiG0DLo55M7F10xX1
         5iCDRyZcOOe0FixAx5q2XvBsyNWX5b3MW0GwyoN+PMRbMFlpWJwkVdp6uy7v/i0kqNgW
         JOZI8x7HfoLiURTbLNehAl4bROyDc9VZ/mgJcvAHeFcq+VrY1hAwQxImxSxs5gCf75/F
         4YY1uf1GDEeE1kp3BoUFShI5kbu8Rd72oOTI+BCl+rIB4cHg36wq4qGoZRJdqb2e2ahP
         xSnA==
X-Gm-Message-State: AOAM5326WO3aRYys/hEkBRLGuK9IzTkWGbXLSpOGjL2x4blof14YGVUu
        9sdqe3xwmVaSMuMSl7LHPBmNcQ==
X-Google-Smtp-Source: ABdhPJy3q0GG8AXVr+PdLMLUPpcBOevstdfTEANRTnjTLwcir2OIscClskNGAUxs79U1WmYHHublxg==
X-Received: by 2002:a05:6402:452:: with SMTP id p18mr7472135edw.34.1632833954638;
        Tue, 28 Sep 2021 05:59:14 -0700 (PDT)
Received: from [192.168.1.15] (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.googlemail.com with ESMTPSA id f4sm2822077ejq.125.2021.09.28.05.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 05:59:14 -0700 (PDT)
Subject: Re: [V3] venus: vdec: decoded picture buffer handling during reconfig
 sequence
To:     mansur@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        dikshita@codeaurora.org
References: <20210825110841.12815-1-mansur@codeaurora.org>
 <78dec463-5e75-18d7-b74e-154f00b8a7b2@linaro.org>
 <4db580aea0ddfc6092fd86b51e67802f@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <cf3158dd-b379-0e03-2bdd-187dc268b0b4@linaro.org>
Date:   Tue, 28 Sep 2021 15:59:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4db580aea0ddfc6092fd86b51e67802f@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

>>>
>>> +static DEFINE_IDA(dpb_out_tag_ida);
>>
>> No global static variables please. Make it part of venus_inst structure.
> As per my understanding it is not just static global variable.
> We are defining the ida structure and assign to name when pass as param
> as follows
> struct ida {
>              struct idr        idr;
>              struct ida_bitmap    *free_bitmap;
> };
> #define IDA_INIT(name)        { .idr = IDR_INIT((name).idr),
> .free_bitmap = NULL, }
> #define DEFINE_IDA(name)    struct ida name = IDA_INIT(name)
> 
> Any ida related API's expect pointer to this structure.
> If we move the variable then it might be bit difficult use ida_xxx()
> API'same
Add a struct ida dpb_ids in venus_inst or venus_core structures
depending on what you need (ID allocations per session or for all
sessions) and use ida_init(&dpb_ids).

-- 
-- 
regards,
Stan
