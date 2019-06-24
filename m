Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3EFE505A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 11:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfFXJ2A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 05:28:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46860 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfFXJ2A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 05:28:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C8DED60A05; Mon, 24 Jun 2019 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561368479;
        bh=Rxclg2J+fWA8GUEmOU6NUxxB+KBcECPCvwJIpsOLICs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=R7sTpfaUnBiAsHi9QzlvcwBvEgnqax/4UEsrkq3OvRM/v0oaOcrHTEBOSn9fuQHpB
         FYOJhdyiXixMYbToP5dONeUR+9R6LrLQPkBsDhYJ5YnUQ3CSr7DBCRUouVc4l7FP3n
         AZg5FIKSQv8/uT1Upxd+To/5PVCnt5/JwJRYy3rg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B25560208;
        Mon, 24 Jun 2019 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561368479;
        bh=Rxclg2J+fWA8GUEmOU6NUxxB+KBcECPCvwJIpsOLICs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=R7sTpfaUnBiAsHi9QzlvcwBvEgnqax/4UEsrkq3OvRM/v0oaOcrHTEBOSn9fuQHpB
         FYOJhdyiXixMYbToP5dONeUR+9R6LrLQPkBsDhYJ5YnUQ3CSr7DBCRUouVc4l7FP3n
         AZg5FIKSQv8/uT1Upxd+To/5PVCnt5/JwJRYy3rg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B25560208
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv3 1/1] coresight: Do not default to CPU0 for missing CPU
 phandle
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        mathieu.poirier@linaro.org, leo.yan@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, alexander.shishkin@linux.intel.com,
        andy.gross@linaro.org, david.brown@linaro.org, mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1561346998.git.saiprakash.ranjan@codeaurora.org>
 <635466ab6a27781966bb083e93d2ca2729473ced.1561346998.git.saiprakash.ranjan@codeaurora.org>
 <4db99204-8553-7a80-f952-30cbd149593d@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <d1fadd8d-4b3d-38a4-1d26-e72e8eff8ff1@codeaurora.org>
Date:   Mon, 24 Jun 2019 14:57:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4db99204-8553-7a80-f952-30cbd149593d@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/24/2019 1:56 PM, Suzuki K Poulose wrote:
> Sai,
> 
> Thanks for getting this done.
> 
> On 24/06/2019 04:36, Sai Prakash Ranjan wrote:
>> Coresight platform support assumes that a missing "cpu" phandle
>> defaults to CPU0. This could be problematic and unnecessarily binds
>> components to CPU0, where they may not be. Let us make the DT binding
>> rules a bit stricter by not defaulting to CPU0 for missing "cpu"
>> affinity information.
>>
>> Also in coresight etm and cpu-debug drivers, abort the probe
>> for such cases.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks for the review Suzuki.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
