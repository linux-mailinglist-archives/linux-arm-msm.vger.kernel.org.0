Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4EF372EF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 19:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhEDRe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 13:34:56 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:49375 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230289AbhEDRez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 13:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1620149640; x=1651685640;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=aA/o9tGodjRH1L8t2M/4P+yxDy2AADcvydn667//4T4=;
  b=q5WQbximSYA1//g84PTAUF/FHsImKH6hLY6trg5x0B+L1jbaTxfa+yup
   t8DMvuLbHozPcnBsVBK2aoqFW2mH7tDHepF8ORKLIUpRrdR1r706S3mVV
   OmIalgS5GBVkqPF7G1nxC5zZXavdkXLsxv0CIkAChlTVP+qcPrZYcljsc
   U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 May 2021 10:34:00 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 May 2021 10:34:00 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:33:59 -0700
Subject: Re: [RESEND PATCH] bus: mhi: core: Remove pre_init flag used for
 power purposes
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <carl.yin@quectel.com>,
        <loic.poulain@linaro.org>, <kvalo@codeaurora.org>
References: <1617313309-24035-1-git-send-email-bbhatt@codeaurora.org>
 <20210407050730.GC8675@work>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <68e9bf2a-9de1-a731-25d8-537d4f3423d8@quicinc.com>
Date:   Tue, 4 May 2021 11:33:59 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210407050730.GC8675@work>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/6/2021 11:07 PM, Manivannan Sadhasivam wrote:
> On Thu, Apr 01, 2021 at 02:41:49PM -0700, Bhaumik Bhatt wrote:
>> Some controllers can choose to skip preparation for power up.
>> In that case, device context is initialized based on the pre_init
>> flag not being set during mhi_prepare_for_power_up(). There is no
>> reason MHI host driver should maintain and provide controllers
>> with two separate paths for preparing MHI.
>>
>> Going forward, all controllers will be required to call the
>> mhi_prepare_for_power_up() API followed by their choice of sync
>> or async power up. This allows MHI host driver to get rid of the
>> pre_init flag and sets up a common way for all controllers to use
>> MHI. This also helps controllers fail early on during preparation
>> phase in some failure cases.
>>
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> I hope Jeff is also okay with this patch for AIC100.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 

Sorry for the non-response.  This has minimal impact.  No concerns from me.
