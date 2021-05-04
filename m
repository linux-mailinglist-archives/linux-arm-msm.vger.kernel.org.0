Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3A3372F3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 19:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhEDRws (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 13:52:48 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:43604 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232102AbhEDRwr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 13:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1620150713; x=1651686713;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=eg90j+rKLZIQEComJZMGMdEsMmldPTJdNagnfDTfAIs=;
  b=V4qbecuui1oH3/tlDxIcfFUTadyykLfT5XVJf6lq/dVNccS2iOvjZsos
   K+xpG2OevBrA12Gi5LTW3umIRf1WEptPDZBWX2xjbduRZvWedgcXWjrZY
   gkS6X7Uw1UPbJw2NZFMIfKw5hXVzrReoPMQ2kMNDFA3b13QNTbZzVLhxd
   w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2021 10:51:52 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 May 2021 10:51:52 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:51:52 -0700
Subject: Re: [PATCH v8 9/9] bus: mhi: Improve documentation on channel
 transfer setup APIs
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        <manivannan.sadhasivam@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <carl.yin@quectel.com>,
        <naveen.kumar@quectel.com>, <loic.poulain@linaro.org>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
 <1617311778-1254-10-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <134e6c31-3887-94e0-d33d-7e2a5c946742@quicinc.com>
Date:   Tue, 4 May 2021 11:51:51 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1617311778-1254-10-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/1/2021 3:16 PM, Bhaumik Bhatt wrote:
> The mhi_prepare_for_transfer() and mhi_unprepare_from_transfer()
> APIs could use better explanation. Add details on what MHI does
> when these APIs are used.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
