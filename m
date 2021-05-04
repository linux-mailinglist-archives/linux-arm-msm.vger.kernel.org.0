Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7569372F16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 19:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhEDRot (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 13:44:49 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:55953 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230331AbhEDRot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 13:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1620150234; x=1651686234;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=U3GLipCjgI2eLHosYx9PUnpP0j7sShIr3djY0YdLDcI=;
  b=MdJYqpq3H/OTeoQ1ScKPmjlDHQhDw6GrTvsQKiWmeOIR/N13eMw8K0dR
   +I8wx1K4EILg1mVYw4WHhNZSXeli49olCtfqBusOSQ/Pm63FmBOBS2flS
   IauqTsYgRd9Z1vWC5uYOfhDBcdGNvorSekj6QbI0g/lvVMhgqtRg0qdZh
   Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2021 10:43:54 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 May 2021 10:43:54 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:43:53 -0700
Subject: Re: [PATCH v8 3/9] bus: mhi: core: Improvements to the channel
 handling state machine
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        <manivannan.sadhasivam@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <carl.yin@quectel.com>,
        <naveen.kumar@quectel.com>, <loic.poulain@linaro.org>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
 <1617311778-1254-4-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <770e6e03-905f-887a-2f32-19a2eb9e3cbd@quicinc.com>
Date:   Tue, 4 May 2021 11:43:52 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1617311778-1254-4-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/1/2021 3:16 PM, Bhaumik Bhatt wrote:
> Improve the channel handling state machine such that all commands
> go through a common function and a validation process to ensure
> that the state machine is not violated in any way and adheres to
> the MHI specification. Using this common function allows MHI to
> eliminate some unnecessary debug messages and code duplication.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
