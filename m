Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B89487100
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 04:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345456AbiAGDGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 22:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbiAGDGQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 22:06:16 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511FDC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 19:06:16 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id u13so10591236lff.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 19:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Le5b+gfm8kEhoQGFgPM2eB+8FLoC7vz8a2SlJRnSDGQ=;
        b=Zo5y9ZH8M2cqtZIKViHJ4SXxuJPxDlI+tHz1eH40NGNhxEvrKF6WfuwCYBX1/1kyv/
         5rvBgW/eDCw99yCXUEGbMl/A4XRIdPmwEUlYSO6CR8XX4XOz20SkyYpdxdm0j08RcB9w
         WrKL9T8vV7GqQBFcXHmo29oGlYmzXYDCdtcKYmG6ektDwfdEGXizKI4lddsS6Z/gQ2VX
         v65AidI2OA2sBKAhKMQFnkxNFOGB2CAIfues3B+4ZkaMIZgLSMO+S4koUAEUHvEck6gs
         QNAZxvvM+eeTQhLNo6oB+yLF212K27/+wIMWrY9eJpf+oVppOwloU3hTUDKrNWMkkE02
         Egwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Le5b+gfm8kEhoQGFgPM2eB+8FLoC7vz8a2SlJRnSDGQ=;
        b=vq+Ou4ieWFM1jB4t1S+CDmLXkV2/1PaEt9aH9OxOc9tThTu/kkULdu5tdofX3n6B4p
         iOP7e1YeOBYx/nKgH8C84EOjyWEIlxEsRgrP+DWaAjOHbk6Z+Cs7bVMvh2TeaaH1uHcU
         fEx+wSbuRivTK9EjloVhfCBoGjlxY/BzJMKtDxVhKAld3WMbJSihvrfyjI3ObX9hwgrE
         AlbiSQnqC+PnNr4inDsww4pWZhFzpZTzADiGKJzeepcp4B+00AE2ncqy9uCcdAH6305I
         mvyX82AocJJeo2k/iZN+wMmuSua2Mcn8uJOfj6CV9aialCigWuSaFVQ+lFLEOzZfaTKE
         VTyA==
X-Gm-Message-State: AOAM532IBGBrGSJDx3lM4NBFecKgSpq7sas+5NQ/iLaPt6Tow2BX7BDE
        c16ikF96Pb9MSmWiPWlQFD5r9Q==
X-Google-Smtp-Source: ABdhPJyuJrIFR231OR4pS4P0aMgoBzgDhxyRUxHpUfwtWAajfQcCZXRWZgHwytL4KPjF7en/yVrAxg==
X-Received: by 2002:a05:6512:1155:: with SMTP id m21mr54717647lfg.188.1641524774613;
        Thu, 06 Jan 2022 19:06:14 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n10sm400669lfk.246.2022.01.06.19.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 19:06:14 -0800 (PST)
Message-ID: <63e0e911-6a01-0853-47eb-0f4e9cfb261b@linaro.org>
Date:   Fri, 7 Jan 2022 06:06:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH 0/7] Simplify and correct msm/dp bridge implementation
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <CAE-0n52Si84XZxURUZ6ONKOCsyCDGF=AXHrStOoMPC67xRiVfQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52Si84XZxURUZ6ONKOCsyCDGF=AXHrStOoMPC67xRiVfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/01/2022 05:16, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-06 18:01:25)
>> I noticed that commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>> enable and disable") conflicts with the panel-edp (panel bridge)
>> support. Both bridges will try to attach directly to the drm encoder
>> itself. I started writing lengthy letter describing what is broken and
>> how it should be fixed. Then at some point I stopped and quickly coded
>> this RFC (which is compile-tested only).
>>
>> Comments and tests (on both DP and eDP setups) are more than welcome.
> 
> There are some DP patches dribbling in every day or so and it's really
> hard to follow along. I asked Kuogee to resend all outstanding patches
> as a single series but that hasn't happened. I'm not super interested in
> reviewing/testing out these patches until the outstanding patches for DP
> on the list are reviewed and landed. Have you looked at those patches?

I haven't been following the DP patches. Well, in fact I was mostly 
stopping myself from looking onto the DP driver and getting elbow deep 
in it. Partially because some of the patches circulating on the list 
were clear hacks (e.g. PHY timeouts). Some would be too complex to 
review them without deep diving into DP. Most of my attention (and spare 
time) goes to the DPU/DSI/MDP5 (and to lesser extent MDP4/HDMI) drives.

With regards to this patch series, the patch 1 is probably most 
important (and might warrant sending it separately), as it should fix 
eDP support for Bjorn.

So, initially I wrote just patch 1. And then the surrounding code 
immediately prompted me to update the rest of the drm glue code. Elbow 
deep, as I said. Patch 7 might be a bit advantageous (and maybe I should 
remove it in future),

> See [1] for an example.

I think most of the patches circulating through the list are irrelevant 
to this patch series, as they do not touch the drm glue code.

>> The following changes since commit 6ed95285382d6f90a3c3a11d5806a5eb7db715c3:
>>
>>    drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17 15:09:46 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-dp-bridges
>>
>> for you to fetch changes up to 7eff304d50ba520e9193a293a8e42bbd9d7aa0e1:
>>
>>    drm/msm/dp: stop carying about the connector type (2022-01-07 04:56:06 +0300)
>>
>> ----------------------------------------------------------------
>> Dmitry Baryshkov (7):
>>        drm/msm/dp: fix panel bridge attachment
>>        drm/msm/dp: support attaching bridges to the DP encoder
>>        drm/msm/dp: replace dp_connector with drm_bridge_connector
>>        drm/msm/dp: remove extra wrappers and public functions
>>        drm/msm/dp: remove unused stubs
>>        drm/msm/dp: remove dp_display_en/disable prototypes and data argument
>>        drm/msm/dp: stop carying about the connector type
>>
>>   drivers/gpu/drm/msm/Makefile        |   1 -
>>   drivers/gpu/drm/msm/dp/dp_display.c | 263 ++++++++++++++++++++++++++----------
>>   drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
>>   drivers/gpu/drm/msm/dp/dp_drm.c     | 250 ----------------------------------
>>   drivers/gpu/drm/msm/dp/dp_parser.c  |  28 ++--
>>   drivers/gpu/drm/msm/dp/dp_parser.h  |   4 +-
>>   drivers/gpu/drm/msm/msm_drv.h       |  32 +----
>>   7 files changed, 203 insertions(+), 380 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>>
> 
> [1] https://lore.kernel.org/r/1640220845-25266-1-git-send-email-quic_khsieh@quicinc.com


-- 
With best wishes
Dmitry
