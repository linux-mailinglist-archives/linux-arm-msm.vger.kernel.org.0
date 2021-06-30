Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872B03B8976
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 22:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbhF3UF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 16:05:56 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60154 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234057AbhF3UFz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 16:05:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625083406; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FvxVnM8YANUaubAux0jaEdm4YHnG/3KoTZHgRrNoJFw=;
 b=vkpvboWatUuyymIBts+Z0+2yvRcLFhz4f5zBMbt4WCt6pIy2AO9w6ZXqFEm2EIYVKU4jrQdl
 yNOU2HwnAIoWixNhiEz6+vdaMmcfHrptFSWrfQTh4vSvjti1Zj1ovsaX20OaBpjp5E+PEW96
 4tRaGmP/D2cwg67xUeHjwe8Hd3k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60dccdee3a8b6d0a45f2eead (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 20:02:54
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B8187C43144; Wed, 30 Jun 2021 20:02:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 140EDC433D3;
        Wed, 30 Jun 2021 20:02:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Jul 2021 01:32:52 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 6/9] arm64: dts: qcom: sc7280: Update reserved memory map
In-Reply-To: <YNoQ1d1hUyIh/qxz@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-7-git-send-email-sibis@codeaurora.org>
 <YNoQ1d1hUyIh/qxz@google.com>
Message-ID: <f74c03b939dfd83a1013906e1c771666@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-28 23:41, Matthias Kaehlcke wrote:
> On Fri, Jun 25, 2021 at 01:17:35AM +0530, Sibi Sankar wrote:
> 
>> Subject: arm64: dts: qcom: sc7280: Update reserved memory map
> 
> That's very vague. Also personally I'm not a fan of patches that touch
> SoC and board files with a commit message that only mentions the SoC, 
> as
> is frequently done for IDP boards. Why not split this in (at least) 
> two,
> one for adding the missing memory regions to the SoC, and one for the
> IDP.
> 

sure will split this up.

>> Add missing regions and remove unused regions from the reserved memory
>> map, as described in version 1.
> 
> What is this 'version 1'?

lol, it's the memory map version number
and it's not entirely internal to qc so
we have been mentioning them in commit
messages from older SoCs. I'll just drop
it when I re-spin the series since it
doesn't add much value.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
