Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A81E8426383
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 06:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhJHEEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 00:04:49 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1608 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbhJHEEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 00:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1633665772; x=1665201772;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bpgFCoDtwqdBtzv8bSN4Dwrl9eosbsbMAkSRZSwTkbo=;
  b=khLbrJMGgjmFMe7r+Dm1moMaWYq1k4vdwcMJBOhbofZEOCRCOdiupdjh
   2yLdK4hhRkQM2lnmgYA5+hqzD9iNR6IZ2S9hTdO+ypcQ+wYrgCoahsQSW
   g2IWae7UgDXstj06CDNajJSPX5U+YHTYyXQsGz4UgCvEfXkUxo8qrxtPx
   c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 07 Oct 2021 21:02:50 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 21:02:49 -0700
Received: from [10.50.59.212] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Thu, 7 Oct 2021
 21:02:46 -0700
Message-ID: <7c34bb83-ac0a-3676-a2b5-f4397bf5e910@quicinc.com>
Date:   Fri, 8 Oct 2021 09:32:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] arm64: defconfig: Enable QTI SC7280 pinctrl, gcc and
 interconnect
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Matthias Kaehlcke <mka@chromium.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20211007052812.3717-1-quic_saipraka@quicinc.com>
 <CAE-0n51EBGqOZ7D+sn5=M-ig=6p_NUb+8veaaXXQJo+UrLoQfA@mail.gmail.com>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <CAE-0n51EBGqOZ7D+sn5=M-ig=6p_NUb+8veaaXXQJo+UrLoQfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/7/2021 11:36 PM, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2021-10-06 22:28:12)
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 156d96afbbfc..87584769cf71 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -984,6 +985,7 @@ CONFIG_MSM_MMCC_8996=y
>>   CONFIG_MSM_GCC_8998=y
>>   CONFIG_QCS_GCC_404=y
>>   CONFIG_SC_GCC_7180=y
>> +CONFIG_SC_GCC_7280=y
> Any reason to not enable DISPCC or GPUCC which selects the GCC config? 
> Same goes for sc7180. 

These are the minimal configs required to boot to shell with an 
initramfs, I wasn't trying to get display nor gpu up on either of them.

Thanks,
Sai
>>   CONFIG_SDM_CAMCC_845=m
>>   CONFIG_SDM_GCC_845=y
>>   CONFIG_SDM_GPUCC_845=y


