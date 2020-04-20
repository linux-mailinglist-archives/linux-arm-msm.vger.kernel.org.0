Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84B61B14C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 20:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgDTShP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 14:37:15 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:21054 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727776AbgDTShO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 14:37:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587407834; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7e3eo1fJ3V4W47xQX8u/gUmo/iNTfiSlIlfQaS2lzFU=;
 b=WMFUovZyLRqV1GDHWkZKKNkceuC+SNFisOgzo4HOp8zn7W2Lbaj9T+en3Ms2rcd2Czoy5vpg
 t0sXn17MQnFmOqS2JB37oqy8ypi4rSz6Ii4ULU2ZiAGG7l6g0JyxFrusK97508wSS1cczV2/
 BqOFTDfDcC/MRrZ7jwJSmYBuF0E=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9debb8.7fae3df34ce0-smtp-out-n03;
 Mon, 20 Apr 2020 18:36:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7EB7CC4478C; Mon, 20 Apr 2020 18:36:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF97EC433F2;
        Mon, 20 Apr 2020 18:36:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Apr 2020 00:06:39 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>
Subject: Re: [PATCHv3 2/6] iommu/arm-smmu: Allow client devices to select
 direct mapping
In-Reply-To: <b69fc30c-e6fb-70bf-4d6e-0d9b39404bdd@arm.com>
References: <cover.1587400573.git.saiprakash.ranjan@codeaurora.org>
 <d36f9c9ef3ef8dc84da02dfb160cd6846d2869fc.1587400573.git.saiprakash.ranjan@codeaurora.org>
 <b69fc30c-e6fb-70bf-4d6e-0d9b39404bdd@arm.com>
Message-ID: <0702f3186327b419ee38e4775c040052@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-20 22:27, Robin Murphy wrote:
> On 2020-04-20 5:42 pm, Sai Prakash Ranjan wrote:
>> From: Jordan Crouse <jcrouse@codeaurora.org>
>> 
>> Some client devices want to directly map the IOMMU themselves instead
>> of using the DMA domain. Allow those devices to opt in to direct
>> mapping by way of a list of compatible strings.
> 
> Neat and tidy :)
> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> Strictly, I think patch #3/6 should really have come before this one
> (with the header change moved accordingly), but don't bother resending
> just for that.
> 

Thanks, I have sent the updated version with this change as well
in addition to the commit msg update for modem requesting direct
mapping.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
