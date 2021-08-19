Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6883F1B2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 16:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240329AbhHSOGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 10:06:05 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:56567 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234281AbhHSOGE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 10:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629381928; x=1660917928;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=HpW4hbTi5PSEovgBt3uxfRIvDZZhIFQAPSs4Cf7gvDk=;
  b=ltwXqrfs9QZIYxLczCpnUUlS9qqiWBXA0fk5X/aGho92WT2KdLldL5pi
   zqDh35TpgVKPxRmgpuMAfIPW0rT8eyYTiQBPuPWodtzHVda/+nqY4jhCx
   S0lCmRk+5Dx1Cz5i2qiNOqgLfIwy1kfjJmY23AbPswi/NyW9U46pPlIsT
   w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Aug 2021 07:05:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 07:05:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Thu, 19 Aug 2021 07:05:27 -0700
Received: from [10.226.59.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.15; Thu, 19 Aug
 2021 07:05:27 -0700
Subject: Re: [PATCH v1 1/2] bus: mhi: core: Bail on writing register fields if
 read fails
To:     Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        <manivannan.sadhasivam@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <loic.poulain@linaro.org>
References: <1629330634-36465-1-git-send-email-bbhatt@codeaurora.org>
 <1629330634-36465-2-git-send-email-bbhatt@codeaurora.org>
 <45fbfe24-38eb-82f0-7134-a04854269247@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <48d494d8-1323-87fd-4a95-c1714bfa2ae9@quicinc.com>
Date:   Thu, 19 Aug 2021 08:05:26 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <45fbfe24-38eb-82f0-7134-a04854269247@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/18/2021 7:40 PM, Hemant Kumar wrote:
> 
> 
> On 8/18/2021 4:50 PM, Bhaumik Bhatt wrote:
>> Helper API to write register fields relies on successful reads
>> of the register/address prior to the write. Bail out if a failure
>> is seen when reading the register before the actual write is
>> performed.
>>
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> 

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
