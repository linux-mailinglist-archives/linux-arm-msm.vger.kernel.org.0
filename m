Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B8D213BE0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 16:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgGCOeQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 10:34:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57527 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726432AbgGCOeP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 10:34:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593786855; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=FRH1WL7dNGYlUrzjhSeDlO2/E0xxcXcZoxCJBRIgKXY=; b=GHdjU58Ajs+obj0O6OPLiESJo17LoXKh05/tTYr/kDZRMU7WI4GFesX1MvQyaCYQqgwLLPBg
 QPfOFZ3HQ4nuef9md0/uUjX4UCA6WSaVZReIfBALYc9VlLHtm1gOa1dyV8JKfDPtKItj03mO
 VoQSmApikSux+RkJpHfoRsnbSrs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5eff41dd6f2ee827da3f6db2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Jul 2020 14:34:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C038C433CB; Fri,  3 Jul 2020 14:34:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1ABBC433CA;
        Fri,  3 Jul 2020 14:34:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 03 Jul 2020 20:04:04 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Przywara <andre.przywara@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH 3/3] arm64: Add KRYO4XX silver CPU cores to erratum list
 1530923 and 1024718
Message-ID: <7335e7fa1303a56a5e60339ed0c5d619@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will,

On 2020-07-03 19:25, Will Deacon wrote:
> On Tue, Jun 30, 2020 at 11:30:55PM +0530, Sai Prakash Ranjan wrote:
>> KRYO4XX silver/LITTLE CPU cores with revision r1p0 are affected by
>> erratum 1530923 and 1024718, so add them to the respective list.
>> The variant and revision bits are implementation defined and are
>> different from the their Cortex CPU counterparts on which they are
>> based on, i.e., r1p0 is equivalent to rdpe.
> 
> So just to confirm, revisions prior to rdpe are unaffected, or do those
> parts simply not exist?
> 

There is one revision prior to this r0p1(r7pc) which has a different 
part
number and are used in v1 of SoCs which are limited to only internal 
test
platforms in the early stages of bringup and not used in actual devices 
out
there, so I did not add it to the list but they are affected. Plus we 
would
need to add another MIDR_QCOM_KRYO_4XX_SILVER_V1 if we are supporting 
them
which I thought was not worth it when devices with those CPUs are not 
available.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
