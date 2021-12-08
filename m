Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA9546DC7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 20:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236480AbhLHTxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 14:53:54 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:53205 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236471AbhLHTxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 14:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1638993022; x=1670529022;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lTRP/X9SZ8Y4Aedx5B4JywtW70ULvhdwRz7UYQFhih4=;
  b=BQ1CNWVBbV2d9ivLY/pws6D+mgJRf9VxOeTFxvjUuj6V7spwVNCWVmgF
   /KENQs6PjaL25lNG0znlSfcRQ+M/ck93I36/tiGoEShLGSogPGl84aad7
   EBXo8oPuIXpksU+ncApNYcbrCPK67bBrndjZQxs9G3p6fGqi4OwXlz8jW
   c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Dec 2021 11:50:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 11:50:21 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 8 Dec 2021 11:50:21 -0800
Received: from [10.111.164.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 8 Dec 2021
 11:50:19 -0800
Message-ID: <57372311-1063-d1fb-d642-43fcec9364e8@quicinc.com>
Date:   Wed, 8 Dec 2021 11:50:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH igt 0/2] tools/msm_dp_compliance: Multi-connector support
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@chromium.org>
References: <20211208192216.743364-1-robdclark@gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211208192216.743364-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I have not validated compliance with this but it should work.

For the series,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

On 12/8/2021 11:22 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Update the compliance tool with an optional arg to specify the connector
> name.  This will be required for newer kernels, which will move the
> needed debugfs files into a per-connector subdirectory.
> 
> Rob Clark (2):
>    tools/msm_dp_compliance: Small arg parsing cleanup
>    tools/msm_dp_compliance: Add arg to specify connector name
> 
>   tools/msm_dp_compliance.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
