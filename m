Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2B8121690
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 19:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730908AbfLPSaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 13:30:14 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:29899 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728499AbfLPSaO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 13:30:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576521013; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TfuUlFywcHJXSJ0alv7KYk4aSCzvzEvraTMqxX+xQ+w=; b=Q5OnBk5JGscogj+6+jLM277Yscb/a7Cl4fe7WWle/IpYlU5EeCps4x2Awwand8uMWNTkMAdO
 A8lUCBuUN3JizfRj0WdVMKBPneEmhyzgnbTVX36ksv1cONwoBQttjyVmC6EuEm188N3GoN6J
 48nbcPjt6x3AIMb+Q9gxK9+3Pkc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7cd33.7f2d8a1e65e0-smtp-out-n03;
 Mon, 16 Dec 2019 18:30:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D1402C447A3; Mon, 16 Dec 2019 18:30:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.79.43.230] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B666C43383;
        Mon, 16 Dec 2019 18:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B666C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add OSM L3 interconnect
 provider support
To:     Evan Green <evgreen@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Dai <daidavid1@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-kernel-owner@vger.kernel.org
References: <20191118154435.20357-1-sibis@codeaurora.org>
 <0101016e7f30ad15-18908ef0-a2b9-4a2a-bf32-6cb3aa447b01-000000@us-west-2.amazonses.com>
 <CAE=gft5jGagsFS2yBeJCLt9R26RQjx9bfMxhQu8Jj4uc4ca40w@mail.gmail.com>
 <0101016e83897442-ecc4c00f-c0d1-4c2c-92ed-ce78e65c0935-000000@us-west-2.amazonses.com>
 <0101016eac068d05-761f0d60-b1ef-400f-bf84-3164c2a26d2e-000000@us-west-2.amazonses.com>
 <CAE=gft5cS54qn0JjxO58xL6sFyQk4t=8ofLFWPUSVQ9sdU4XpQ@mail.gmail.com>
From:   Sibi Sankar <sibis@codeaurora.org>
Message-ID: <b11c2116-f247-17c5-69ca-071183365a01@codeaurora.org>
Date:   Tue, 17 Dec 2019 00:00:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAE=gft5cS54qn0JjxO58xL6sFyQk4t=8ofLFWPUSVQ9sdU4XpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Evan,

On 12/7/19 12:46 AM, Evan Green wrote:
> On Wed, Nov 27, 2019 at 12:42 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>>
>> Hey Evan/Georgi,
>>
>> https://git.linaro.org/people/georgi.djakov/linux.git/commit/?h=icc-dev&id=9197da7d06e88666d1588e3c21a743e60381264d
>>
>> With the "Redefine interconnect provider
>> DT nodes for SDM845" series, wouldn't it
>> make more sense to define the OSM_L3 icc
>> nodes in the sdm845.c icc driver and have
>> the common helpers in osm_l3 driver? Though
>> we don't plan on linking the OSM L3 nodes
>> to the other nodes on SDM845/SC7180, we
>> might have GPU needing to be linked to the
>> OSM L3 nodes on future SoCs. Let me know
>> how you want this done.
>>
>> Anyway I'll re-spin the series once the
>> SDM845 icc re-work gets re-posted.
> 
> I don't have a clear picture of the proposal. You'd put the couple of
> extra defines in sdm845.c for the new nodes. But then you'd need to do
> something in icc_set() of sdm845. Is that when you'd call out to the
> osm_l3 driver?

with sdm845 icc rework "https://patchwork.kernel.org/cover/11293399/"
osm l3 icc provider needs to know the total number of rsc icc nodes,
i.e I can define the total number of rsc nodes and continue using the
same design as v3 since on sdm845/sc7180 gpu is not cache coherent.

or have the osm l3 table population logic and osm icc_set as helpers
and have it called from the sdm845/sc7180 icc driver so that we would
be able to link osm_l3 with rsc nodes on future qcom SoCs.

> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
