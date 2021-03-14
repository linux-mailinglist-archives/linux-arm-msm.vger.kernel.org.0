Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D024A33A796
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 20:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhCNTGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Mar 2021 15:06:05 -0400
Received: from m42-2.mailgun.net ([69.72.42.2]:30893 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233954AbhCNTGA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Mar 2021 15:06:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615748759; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Wlc/YV7N+922tpDRWcrdITI4w0GSyTPsIUMd6mujDIA=;
 b=CZfS9xFvutjFgUCuicCYX39ZUVMlbnHXHiCG30wuoZY5wxnce394VKYYrefYc5e3oIl22rGv
 G1fhABwn2tVnDVmyEgbEaBz2z6iQyCMdp2ofmQbbRTZhJ/OnyDK64hdbyGqCmoIvpSRvOAdW
 yK56i7dhVhxsTWr99IJ0r9Uhue4=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 604e5e935d70193f88bd736b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 14 Mar 2021 19:05:55
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4366DC433ED; Sun, 14 Mar 2021 19:05:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C7668C433CA;
        Sun, 14 Mar 2021 19:05:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Mar 2021 00:35:54 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 0/9] qcom/sc7280: Enable various hardware blocks on SC7280
 SoC
In-Reply-To: <YEqkOOuYztTUg1u3@builder.lan>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <YEqkOOuYztTUg1u3@builder.lan>
Message-ID: <1a03621b612562bd8cfb675c5bbf34fc@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-12 04:44, Bjorn Andersson wrote:
> On Thu 25 Feb 03:30 CST 2021, Sai Prakash Ranjan wrote:
> 
>> This series enables various hardware blocks such as LLCC, IPCC, AOSS 
>> QMP
>> and Coresight on SC7280 SoC.
>> 
>> This series is dependent on the base support added for SC7280 in [1].
>> 
> 
> I've picked some of these patches...
> 
> 
> It would be helpful if you split series like this based on how they 
> will
> be picked up my various maintainers. E.g. I think it's quite likely
> Jassi won't find and pick up the mailbox binding patch.
> 
> 
> PS. I sent a patch to Jassi adding the mailbox binding directory to
> MAINTAINERS.
> 

Sure I will group patches(mainly dt-bindings for other subsystems)
accordingly.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
