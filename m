Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C77372E93
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 19:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhEDRRR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 13:17:17 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:20267 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231758AbhEDRRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 13:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1620148582; x=1651684582;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OkFz34xGip9rSgKNkrxBDPhE2MkMQfstZMZUHWZA9HA=;
  b=DHkGt4ZXWBfNZahUJMSd9SZtATc7dXsuAzqTvpBNeeCBtMdjQ5IhbCpu
   yZPR1vHGy+ko7/IRLpT094+kZZySrYqZ9JrFkl/wdfKSlmFoFRuwhijO/
   1wVFAcwCQMlAKQOA88UY6nFyMxwC99ekpA/PWcwlKYcowDkhfWqyM1RWk
   I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 May 2021 10:16:22 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 May 2021 10:16:21 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:16:19 -0700
Subject: Re: [PATCH v2] bus: mhi: core: Improve debug messages for power up
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        <manivannan.sadhasivam@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>
References: <1620072038-36160-1-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <e13300eb-2717-ac56-c089-16cb56c473a2@quicinc.com>
Date:   Tue, 4 May 2021 11:16:18 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1620072038-36160-1-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/3/2021 2:00 PM, Bhaumik Bhatt wrote:
> Improve error message to be more descriptive if a failure occurs
> with an invalid power up execution environment. Additionally, add
> a debug log to print the execution environment and MHI state
> before a power up is attempted to confirm if the device is in an
> expected state. This helps clarify reasons for power up failures
> such as the device being found in a PBL or Emergency Download
> Mode execution environment and the host expected a full power up
> with Pass-Through and no image loading involved.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
