Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091DB372F23
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 19:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhEDRrt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 13:47:49 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:37431 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231835AbhEDRrt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 13:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1620150414; x=1651686414;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=86tB1ZeQi45Dw3rGD4G74qfgbGne5hAz+b/ViIYbvNg=;
  b=DGs1FKFp2jTuDwhBZ29AvnIGU11masgedcO4joLxJgGPpxNl0jCGIIxY
   JKG+kdCkbZd7I76kqnHT3mBIw+V5DNehROsrRWbF3CadIY4lU2La1fuob
   lHVzHGrGR8kI3DkXO3n0tP4COlJIlgH7uTEFqLdGI95h8kd3kWBQyco/c
   E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 May 2021 10:46:54 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 May 2021 10:46:54 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:46:53 -0700
Subject: Re: [PATCH v8 5/9] bus: mhi: core: Hold device wake for channel
 update commands
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        <manivannan.sadhasivam@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <carl.yin@quectel.com>,
        <naveen.kumar@quectel.com>, <loic.poulain@linaro.org>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
 <1617311778-1254-6-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <a065b7b0-c42a-045a-b9d1-0b92dce21ba4@quicinc.com>
Date:   Tue, 4 May 2021 11:46:52 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1617311778-1254-6-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03b.na.qualcomm.com (10.85.0.98) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/1/2021 3:16 PM, Bhaumik Bhatt wrote:
> MHI host can fail early if device is in a bad state by attempting
> to assert device wake and holding the runtime PM vote before
> sending a channel update command instead of performing a wake
> toggle and waiting for a timeout if the send were to fail. This
> can help improve the design and enable shorter wait periods for
> device to respond as votes are already held.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
