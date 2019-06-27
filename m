Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432C8589C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 20:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfF0SWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 14:22:06 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43574 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfF0SWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 14:22:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 37A1060A0A; Thu, 27 Jun 2019 18:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561659726;
        bh=L4rcvZr/+aW0fXo6jf8y6SY/AYN6T06PMSeRbTAx/RQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bz9ZvbKk+19cPUYMoVAHtGANzVgSuBRp/ozL/ndHQM3D8RVuuxcyw0hTF86WXXS6h
         9++uVXYO49wWWrosmRXwMNfFrXvbdoXXQFNHytkfUTh7AqWIurHlJvAFBxGMSl+gX4
         iwuMbPOmm7qrzRH2MOeyYiNBi5yJumE/Ks0JAHMk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [157.45.87.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9AB56021C;
        Thu, 27 Jun 2019 18:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561659725;
        bh=L4rcvZr/+aW0fXo6jf8y6SY/AYN6T06PMSeRbTAx/RQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EZDHDrlLSCTmFKqx3BjfzxaFmF3ZfvGKnPZ5oWdKl9PIvqN5VaMsgsaMgh86g7I3E
         rmbmn62Xl/6Z7nbfE7QJri2QUjRtXObt411a6Tv3fJOospRRPIYZFancWErn1IpP6R
         4EcuZvfI5z8eOvnDDh7F44ysWsqGuVtl6bbrle7g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9AB56021C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [RESEND PATCHv4 1/1] coresight: Do not default to CPU0 for
 missing CPU phandle
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <cover.1561610498.git.saiprakash.ranjan@codeaurora.org>
 <0a20cf9eb34b14a191381af98af1694bbc222734.1561610498.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYkyaeroow1dRaffy5pxSCH7ocb9=EMeZeSjgpjDWXu18vg@mail.gmail.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <0e33a1f2-f535-91e3-635d-dc8852833a0b@codeaurora.org>
Date:   Thu, 27 Jun 2019 23:51:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CANLsYkyaeroow1dRaffy5pxSCH7ocb9=EMeZeSjgpjDWXu18vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/27/2019 10:54 PM, Mathieu Poirier wrote:
> 
> I want to apply your code to my tree but it isn't easy for me to do
> so.  Did you notice the checkpatch.pl warning about the DT bindings
> being in a separate patch?  In this case it is not a new binding but
> following the process gives the DT maintainers the opportunity to at
> least look at your patch.  Because the changes are trivial they may
> decide to ignore it but that choice it theirs to make.
> 

Hmm, git log on coresight dt-bindings showed some examples like
this where bindings were updated in the same patch.

Anyways, I have separated out the patch now and resent v5.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
