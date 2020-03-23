Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C604F18F20D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 10:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgCWJnl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 05:43:41 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23152 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727779AbgCWJnl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 05:43:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584956620; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2HfQKcmZY8wkCxlBMQg4ncbqBdorw86rlxGU/P4LKZ0=;
 b=Vkhh6vlIMV9xgbfbUtowbA45xI1HvfVKWbpI2zRTMw2SwM1XCRS68NAdq7CG0vvHISdA+QKX
 TZ95IiDBaJFnSabZmLX1PgsCMwQuILPKbgIHJbFY9AB29ifZuSyc5VyD6Oc7YhvCsFyyuLz0
 PJ+Y3jjrjP6FrexHFPf8T1Z7IXI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7884b9.7f7d10b49810-smtp-out-n02;
 Mon, 23 Mar 2020 09:43:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8B34AC432C2; Mon, 23 Mar 2020 09:43:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47E68C43636;
        Mon, 23 Mar 2020 09:43:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Mar 2020 15:13:20 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
        robh+dt@kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        agross@kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
In-Reply-To: <497e40b8-300f-1b83-4312-93a58c459d1d@arm.com>
References: <20200309182255.20142-1-sibis@codeaurora.org>
 <20200310112332.GG3794@8bytes.org>
 <4ed6ddd667a3e6f670084a443d141474@codeaurora.org>
 <20200310162320.GL3794@8bytes.org>
 <a50040a9-54fe-f682-dd7e-b2991b48d633@arm.com>
 <ff805c5c647326c5edaddf2efec5cb87@codeaurora.org>
 <497e40b8-300f-1b83-4312-93a58c459d1d@arm.com>
Message-ID: <defd76aa8551858eb568e0ca644d4f4f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2020-03-12 17:35, Robin Murphy wrote:
> On 2020-03-12 6:28 am, Sai Prakash Ranjan wrote:
>> Hi Robin,
>> 
>> 
>> Are you talking about this one for SoC specific change - 
>> https://lore.kernel.org/patchwork/patch/1183530/
> 
> Exactly - this particular wheel needs no reinventing at all.
> 
> [ I guess I should go review those patches properly... :) ]
> 

It would be great if you could review the patch - 
https://lore.kernel.org/patchwork/patch/1183530/
Sibi has posted a v2 of this series based on that patch.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
