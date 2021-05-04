Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BABA372F39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 19:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhEDRvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 13:51:36 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:46926 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232149AbhEDRvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 13:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1620150641; x=1651686641;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=PgaJIZenijv4EN36SHZXJpOUmqXF+CFbsDGQOUMMZf0=;
  b=dzjozPaN3dmO4jUscOa5Je2J1HHdaJA8H6mMBA5/qd2zmAO95dE+7LYg
   vOCu5y+2QX808zwow86mvLON7lticY7xUe7hNoe4cPSO2A0q1Cug+UglN
   sMralZWnSfVZa0syTQU7qNGK12wbmX4cW2AJC53mpipdC/MXodYXl+GFl
   g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2021 10:50:41 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 May 2021 10:50:40 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:50:40 -0700
Subject: Re: [PATCH v8 8/9] bus: mhi: core: Remove __ prefix for MHI channel
 unprepare function
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        <manivannan.sadhasivam@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <carl.yin@quectel.com>,
        <naveen.kumar@quectel.com>, <loic.poulain@linaro.org>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
 <1617311778-1254-9-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <68409861-7423-3bf9-1dfa-67c01df87567@quicinc.com>
Date:   Tue, 4 May 2021 11:50:38 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1617311778-1254-9-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03h.na.qualcomm.com (10.85.0.50) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/1/2021 3:16 PM, Bhaumik Bhatt wrote:
> The __mhi_unprepare_channel() API does not require the __ prefix.
> Get rid of it and make the internal function consistent with the
> other function names.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
