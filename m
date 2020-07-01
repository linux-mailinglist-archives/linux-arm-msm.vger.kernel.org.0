Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E842111B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 19:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729512AbgGAROn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 13:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgGAROn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 13:14:43 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF97C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 10:14:42 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id i16so19003963qtr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 10:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uyDrreb5/43nRuyXAG5DxhddbAStHj2IykaaREeLOAs=;
        b=lrfta52O1r0UsfmM79fscXfWiTmQ4Zl4t2olGT+gIZQ+ikYdcVVjEEd7tfkDk3mVJo
         2yeVQsPbar4qpD3ErrFTsEMkmKrRg76t0/D5OdajQasvPoDo2HEYmv2xcnO+9Cr06g/5
         Jhgc14xFsLMXwm3zxMkcSzoq/Te/N+53cBoyeqOmOdNzg12m6a2/JCR96jBDDynnF+0p
         XdFp+xxEdg2W/Hqx+zlpYGrcRGmEMvYDfAktg0VnTxy3DKaeHF29ak7MAJVmOg3kobx6
         o+dyGtunNjmaa4MAMH2gTlnr4U/10Ur7ZqaShJOB0OaBuTd35v18MCOnI/NBMC8jQ/bp
         xv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uyDrreb5/43nRuyXAG5DxhddbAStHj2IykaaREeLOAs=;
        b=pnUiaYItbU6M10SRkJJkVha6rrCA55Xb0tjNa34RSMtkSP9uMPLqW9yUgOSC2v2eXV
         /xvL0V04MJEK01XssU9oargIUXfreffVJ6EJTjj3UuHq8BZK/GxzSamS+mf82CwxB6oO
         N70TaeYcgYyRRtiyyBwYVKeVaCnkm6qm1CNeLs+a3usITMGQ8VeoeJkN4w3+D3qN14Bj
         4tBB40d1ZVqdGXXhP7fnkfjMwesoU1F34FOASr1mFTTJ/YrFjVvqPIpFCdmL9gzsGeGQ
         9HSw3QOVQWFS2O700sDYIMROkICgOBw5DXcKno1TBn9VMgEfJE9Tph0v2HdMxKriB1Tt
         Al7Q==
X-Gm-Message-State: AOAM533m1DA87765WvQ4Py/dbUWhzDwnXTjaKuE3n7bKg0q1JKpHrfVt
        UEAqf65O3QeXOZfa/Ds9j98Tdw==
X-Google-Smtp-Source: ABdhPJwsdDTczZS+vX8/Nxdl4H4faN26QV/tRRi0cKAX20gxeG3JVW5sYGRaK3dP0UeDm5JOzT1QbQ==
X-Received: by 2002:ac8:728b:: with SMTP id v11mr28496958qto.297.1593623681674;
        Wed, 01 Jul 2020 10:14:41 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id u27sm6069257qkm.121.2020.07.01.10.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 10:14:41 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: handle for EPROBE_DEFER for of_icc_get
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200701030842.24395-1-jonathan@marek.ca>
 <20200701171228.GC3191083@google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <49af8f44-51d4-aded-a34e-55c7c5780008@marek.ca>
Date:   Wed, 1 Jul 2020 13:13:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200701171228.GC3191083@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/1/20 1:12 PM, Matthias Kaehlcke wrote:
> Hi Jonathan,
> 
> On Tue, Jun 30, 2020 at 11:08:41PM -0400, Jonathan Marek wrote:
>> Check for EPROBE_DEFER instead of silently not using icc if the msm driver
>> probes before the interconnect driver.
> 
> Agreed with supporting deferred ICC probing.
> 
>> Only check for EPROBE_DEFER because of_icc_get can return other errors that
>> we want to ignore (ENODATA).
> 
> What would be the -ENODATA case?
> 

The of_icc_get for the ocmem_icc_path can return -ENODATA when the ocmem 
path is not specified (it is optional and only relevant for a3xx/a4xx).

> If the 'interconnects' property is not specified of_icc_get() returns NULL,
> shouldn't all (or most) errors be propagated rather than staying silent?
> 
> Thanks
> 
> Matthias
> 
