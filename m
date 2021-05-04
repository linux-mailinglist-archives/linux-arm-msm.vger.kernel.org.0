Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE5B372F10
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 19:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhEDRmb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 13:42:31 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:22586 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230425AbhEDRmb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 13:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1620150096; x=1651686096;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ek1NDbSmNE2dBVRUjlUYh6SnWrzq5ADKqO2/Os5bhv8=;
  b=GdIhcYe3ymh+5OVVnwyCeB7QROg9u/MRGP2g/uBV9iSgjrNj65Z1gLF7
   PHw6NfD0nx0XXsOUuTr6xN97oIgyNIr1O4Lw71aj0x8CdVBPWGVWpdVqC
   Q+7MVe+KQ8EOmVQiw6PtYsBcnXyw1daCe+wgperPVnaS37G0B9/2U/XfF
   c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2021 10:41:36 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 May 2021 10:41:36 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:41:35 -0700
Subject: Re: [PATCH v8 2/9] bus: mhi: core: Clear context for stopped channels
 from remove()
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        <manivannan.sadhasivam@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <carl.yin@quectel.com>,
        <naveen.kumar@quectel.com>, <loic.poulain@linaro.org>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
 <1617311778-1254-3-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <2d540a2a-0152-1357-67c2-b6047e423dd9@quicinc.com>
Date:   Tue, 4 May 2021 11:41:34 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1617311778-1254-3-git-send-email-bbhatt@codeaurora.org>
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
> If a channel was explicitly stopped but not reset and a driver
> remove is issued, clean up the channel context such that it is
> reflected on the device. This move is useful if a client driver
> module is unloaded or a device crash occurs with the host having
> placed the channel in a stopped state.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
