Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4C4336DDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 09:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhCKIcl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 03:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhCKIcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 03:32:17 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107E0C061574;
        Thu, 11 Mar 2021 00:32:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id d3so38287856lfg.10;
        Thu, 11 Mar 2021 00:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XBrCYPbxmHSRsQpecyUBPGXT5bPuh1fsbvmZotyc0Vc=;
        b=mmtaOXBdHANgTwP+IKodN60KEM+ilDF/ob8aXHSK1l8sCVUdrM3QG58YcRCfv+Ag95
         ywMVOF7HhXsKCK/UX0RGBTgHI+xaRTBsSGKziZ26wg6WwgEJOU1gGiKSznuz43W3AzH0
         Sg3jSsov+JlpqeRrMMwz8CM/u6LsOplQ5cr0f5R3G72uBwrWUxcfqXo+zp98iUEMK5iV
         5yI03LvZWAQcW1byzVfA24zDi8qiW34RPef4rRHN0PFV+8SOnPvVBoKQg5tUxkn/7dQG
         QIaS/5vADeqYH2jLJLQ+Nv6uv3LFjPq9KBiU7+CItIbbQDoc2jdPbVTVjWCkY+Fxilkj
         qZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XBrCYPbxmHSRsQpecyUBPGXT5bPuh1fsbvmZotyc0Vc=;
        b=gydNDXbtdEOl9ogBnbSdbRBDnu1yHDTkEgYUj+Ta7smNDepH26Krn4JqF9vDkBXo/D
         HrIMYsu9UxUTVhCRMp5VWDP9rMLxNb0FBCxN+9Jhh7BriPN0M9j2IusLwBToqjhbVQjv
         Bau23N98nvfsHXiza5t3M3YTtAORxu0ld0RihSwUxvH2R8BZyVL8uxHs5leUy2B1buYv
         VpgCb9vJLFBvVldL+awWqKih0ZI1ry1decRzZrhn9s39kO+T6AcxThWuJ3dDoJk/jbqx
         amyygI8mAJjBVeOPVel36iJRPddzBRk8eLezLcWQwXkxxulj1xRNoA0oH8UAKSIXK2pD
         axog==
X-Gm-Message-State: AOAM531qnCcSTK3YCgG06i7vPUqoZ/TiaV9e3SSePRgqujad/bdZM5FX
        xMwftqAoqOdDoI0M9vbqaNn5sUKTN/U=
X-Google-Smtp-Source: ABdhPJyu64nFTRHlN+O0NcHcwzG8gnhzFp06tXnfw4YjvZmMGMlY02ZHY7bDC745jtPxQMW6GG1Rlw==
X-Received: by 2002:a05:6512:3a8c:: with SMTP id q12mr1594058lfu.213.1615451535395;
        Thu, 11 Mar 2021 00:32:15 -0800 (PST)
Received: from [192.168.1.100] ([178.176.72.229])
        by smtp.gmail.com with ESMTPSA id l29sm619170lfp.63.2021.03.11.00.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 00:32:15 -0800 (PST)
Subject: Re: [PATCH] usb: dwc3: qcom: skip interconnect init for ACPI probe
To:     Shawn Guo <shawn.guo@linaro.org>, Felipe Balbi <balbi@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20210311060318.25418-1-shawn.guo@linaro.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <94984a60-444f-a2f5-1928-3eeba2342f2e@gmail.com>
Date:   Thu, 11 Mar 2021 11:32:01 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311060318.25418-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello!

On 11.03.2021 9:03, Shawn Guo wrote:

> The ACPI probe starts failing since commit bea46b981515 ("usb: dwc3:
> qcom: Add interconnect support in dwc3 driver"), because there is no
> interconnect support for ACPI, and of_icc_get() call in
> dwc3_qcom_interconnect_init() will just return -EINVAL.
> 
> Fix the problem by skipping interconnect init for ACPI probe, and then
> the NULL icc_path_ddr will simply just scheild all ICC calls.

    Scheild?

> Fixes: bea46b981515 ("usb: dwc3: qcom: Add interconnect support in dwc3 driver")
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
[...]

MBR, Sergei
