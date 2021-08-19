Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C133E3F1B30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 16:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240350AbhHSOGO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 10:06:14 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:13831 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240394AbhHSOGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 10:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629381937; x=1660917937;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=wwEbJAwsBPQfHi0nLc5Ius6bVVJXjXqU+Q2IzZhXtsQ=;
  b=TnW5Ck5ZzQiwTsWnmLPgaEQ78HlHO5S1w2jSJMuwxuH1DjteanZCSQRP
   R1kGtYZyB2UAoFxyYcKM4ONEtNFIuA3al1jXDZyFas/5Btw8CXfJWhnNE
   Msi2R77W4lKWzTfQU92o1mvSsai05qP9PmYxEKywCF26/s7n4OaFzHj81
   I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Aug 2021 07:05:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 07:05:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Thu, 19 Aug 2021 07:05:36 -0700
Received: from [10.226.59.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.15; Thu, 19 Aug
 2021 07:05:35 -0700
Subject: Re: [PATCH v1 2/2] bus: mhi: core: Optimize and update MMIO register
 write method
To:     Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        <manivannan.sadhasivam@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <loic.poulain@linaro.org>
References: <1629330634-36465-1-git-send-email-bbhatt@codeaurora.org>
 <1629330634-36465-3-git-send-email-bbhatt@codeaurora.org>
 <62646f45-6b31-af0d-4b3c-cc4b5c355a92@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <995a9d93-8338-45d5-6ff6-a5662795aa9b@quicinc.com>
Date:   Thu, 19 Aug 2021 08:05:35 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <62646f45-6b31-af0d-4b3c-cc4b5c355a92@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03h.na.qualcomm.com (10.85.0.50) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/18/2021 7:41 PM, Hemant Kumar wrote:
> 
> 
> On 8/18/2021 4:50 PM, Bhaumik Bhatt wrote:
>> As of now, MMIO writes done after ready state transition use the
>> mhi_write_reg_field() API even though the whole register is being
>> written in most cases. Optimize this process by using mhi_write_reg()
>> API instead for those writes and use the mhi_write_reg_field()
>> API for MHI config registers only.
>>
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> 
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
