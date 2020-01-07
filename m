Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 336C0132F8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 20:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgAGTbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 14:31:44 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:53526 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728834AbgAGTbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 14:31:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578425502; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=H1ad7rjFwqJKREdfqPrnUil+yQWGOMad6EBf7VMu6sw=;
 b=QyKVUg/BUcBvqqBLnXZtifEp7SpbpOg2+mX0Q4XmxiJQRHJYwiqjs+raJy9RKJgajy5UbWR4
 40aXFAvJGLUlNRGmibqCQptxMlGKxi7FnJCz4bLXGCN1zLPCCHPn9fnI0g5Qxj7ZRHkR43+Q
 SonVDvET9cGuB+qAxy4Tkiab7LA=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14dc9c.7f2e05dbefb8-smtp-out-n03;
 Tue, 07 Jan 2020 19:31:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 959F1C43383; Tue,  7 Jan 2020 19:31:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D159CC433A2;
        Tue,  7 Jan 2020 19:31:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 08 Jan 2020 01:01:39 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
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
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add OSM L3 interconnect
 provider support
In-Reply-To: <CAE=gft6Dr_=zQ1h93qdxzi-GsZv3caddyOGaGQpSi+8BmBSO+Q@mail.gmail.com>
References: <20191118154435.20357-1-sibis@codeaurora.org>
 <0101016e7f30ad15-18908ef0-a2b9-4a2a-bf32-6cb3aa447b01-000000@us-west-2.amazonses.com>
 <CAE=gft5jGagsFS2yBeJCLt9R26RQjx9bfMxhQu8Jj4uc4ca40w@mail.gmail.com>
 <0101016e83897442-ecc4c00f-c0d1-4c2c-92ed-ce78e65c0935-000000@us-west-2.amazonses.com>
 <0101016eac068d05-761f0d60-b1ef-400f-bf84-3164c2a26d2e-000000@us-west-2.amazonses.com>
 <CAE=gft5cS54qn0JjxO58xL6sFyQk4t=8ofLFWPUSVQ9sdU4XpQ@mail.gmail.com>
 <b11c2116-f247-17c5-69ca-071183365a01@codeaurora.org>
 <CAE=gft6Dr_=zQ1h93qdxzi-GsZv3caddyOGaGQpSi+8BmBSO+Q@mail.gmail.com>
Message-ID: <d2ceee796d27283506311a0b61f80931@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-01-08 00:44, Evan Green wrote:
> On Mon, Dec 16, 2019 at 10:30 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Hey Evan,
>> 
>> On 12/7/19 12:46 AM, Evan Green wrote:
>> > On Wed, Nov 27, 2019 at 12:42 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>> >>
>> >> Hey Evan/Georgi,
>> >>
>> >> https://git.linaro.org/people/georgi.djakov/linux.git/commit/?h=icc-dev&id=9197da7d06e88666d1588e3c21a743e60381264d
>> >>
>> >> With the "Redefine interconnect provider
>> >> DT nodes for SDM845" series, wouldn't it
>> >> make more sense to define the OSM_L3 icc
>> >> nodes in the sdm845.c icc driver and have
>> >> the common helpers in osm_l3 driver? Though
>> >> we don't plan on linking the OSM L3 nodes
>> >> to the other nodes on SDM845/SC7180, we
>> >> might have GPU needing to be linked to the
>> >> OSM L3 nodes on future SoCs. Let me know
>> >> how you want this done.
>> >>
>> >> Anyway I'll re-spin the series once the
>> >> SDM845 icc re-work gets re-posted.
>> >
>> > I don't have a clear picture of the proposal. You'd put the couple of
>> > extra defines in sdm845.c for the new nodes. But then you'd need to do
>> > something in icc_set() of sdm845. Is that when you'd call out to the
>> > osm_l3 driver?
>> 
>> with sdm845 icc rework "https://patchwork.kernel.org/cover/11293399/"
>> osm l3 icc provider needs to know the total number of rsc icc nodes,
>> i.e I can define the total number of rsc nodes and continue using the
>> same design as v3 since on sdm845/sc7180 gpu is not cache coherent.
>> 
>> or have the osm l3 table population logic and osm icc_set as helpers
>> and have it called from the sdm845/sc7180 icc driver so that we would
>> be able to link osm_l3 with rsc nodes on future qcom SoCs.
> 
> I see, so if we use the same design as v3, then the number of nodes is
> established at compile-time, and ends up being specific to sdm845. I'm
> fine with either approach, maybe leaning towards the hardcoded
> #defines you have now, and waiting to do the refactoring until you
> actually have two SoCs that can use this.
> -Evan

Thanks will stick to the #defines
for now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
