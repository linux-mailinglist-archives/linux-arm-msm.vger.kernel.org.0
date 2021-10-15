Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED79442FC37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 21:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238515AbhJOTga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 15:36:30 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:10682 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235221AbhJOTga (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 15:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634326463; x=1665862463;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G3CergfSL80+EprYcKGxfPUrJsbcAnhbDOz2wsIr4UA=;
  b=VwJE7Ux5eNUGDLVkY4AW/BrQRbFoJyemDuIsCYd8MKgspQg16XWDpXSl
   7FnazG3T8lMvghdT/29Wlf44yegsJBdYMsR6XzxwsM3rXtBBSi5bPqGuE
   EszGZXQdq0TBu+Ui59ZEAGYN+wy73RK+is2qAzFFBgzA9Z71giWQWdVnY
   g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Oct 2021 12:34:22 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 12:34:21 -0700
Received: from [10.110.46.218] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Fri, 15 Oct 2021
 12:34:21 -0700
Message-ID: <1f3f3047-327e-15dd-3179-d012edfc1865@quicinc.com>
Date:   Fri, 15 Oct 2021 12:34:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang <jesszhan@codeaurora.org>
CC:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sean Paul <seanpaul@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>
References: <20211001123115.GE2283@kili>
 <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
 <CAA8EJpoDfWRT48J=G5-VQcHC6Zg8D-0VujjnjQyvHD0PQ=SoKQ@mail.gmail.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpoDfWRT48J=G5-VQcHC6Zg8D-0VujjnjQyvHD0PQ=SoKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Dmitry,

On 10/15/2021 11:24 AM, Dmitry Baryshkov wrote:
> On Fri, 15 Oct 2021 at 04:43, Jessica Zhang <jesszhan@codeaurora.org> wrote:
>> Hey Dan,
>>
>> On 10/1/2021 5:31 AM, Dan Carpenter wrote:
>>> Hello Sean Paul,
>>>
>>> The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
>>> well" from Jul 25, 2018, leads to the following
>>> Smatch static checker warning:
>>>
>>>        drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
>>>        warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
>>>
>>> drivers/gpu/drm/msm/dsi/dsi_host.c
>>>       721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>       722 {
>>>       723         if (!msm_host->mode) {
>>>       724                 pr_err("%s: mode not set\n", __func__);
>>>       725                 return -EINVAL;
>>>       726         }
>>>       727
>>>       728         dsi_calc_pclk(msm_host, is_bonded_dsi);
>>> --> 729         msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
>>>                   ^^^^^^^^^^^^^^^^^^^^^^
>>> I don't know why Smatch is suddenly warning about ancient msm code, but
>>> clock rates should be unsigned long.  (I don't remember why).
>>>
>>>       730         return 0;
>>>       731 }
>> I'm unable to recreate the warning with Smatch. After running
>> build_kernel_data.sh, I ran `<path to smatch>/smatch_scripts/kchecker
>> drivers/gpu/drm/msm/dsi/dsi_host.c` and got the following output:
>>
>> CHECK scripts/mod/empty.c
>> CALL scripts/checksyscalls.sh
>> CALL scripts/atomic/check-atomics.sh
>> CHECK arch/arm64/kernel/vdso/vgettimeofday.c
>> CC drivers/gpu/drm/msm/dsi/dsi_host.o
>> CHECK drivers/gpu/drm/msm/dsi/dsi_host.c
>> drivers/gpu/drm/msm/dsi/dsi_host.c:2380 msm_dsi_host_power_on() warn:
>> missing error code 'ret'
>>
>> Is there a specific .config you're using (that's not the default
>> mainline defconfig)? If so, can you please share it?
> Are you running your checks with ARM32 or ARM64 in mind?
> Note, esc_clk_rate is u32, while clk_get_rate()'s returns unsigned long.
> It would make sense to change all three clocks rates in msm_dsi_host
> struct (and several places where they are used) to unsigned long.

Thanks for the response. I'm aware of what's causing this issue and how 
to fix it, but I want to also be able to recreate the warning locally 
with Smatch.

Thanks,

Jessica Zhang

>> Thanks,
>>
>> Jessica Zhang
>>
>>> regards,
>>> dan carpenter
>
>
