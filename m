Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8762DC3E09
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 19:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbfJAREW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 13:04:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45798 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfJAREV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 13:04:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1AAB26177C; Tue,  1 Oct 2019 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569949461;
        bh=UEkX/cHMbQ0sDePOFVv3FYadMtUY51cOeHadyFKhHvY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MWo5h9KQE6iRhSXNDSxstK3op6HdP7U/hDZ2AALli5OwqN2QqeYIm6Xyr0gxdpXuM
         IvyM5hN1KtE2Mgr9LGJEAzLmgdtSCVDn5Bt91RQr3t0IHGJccCZRGiUdwgfVECLX2i
         AK4GeB3Ocl18d5kbrxP0RVryYf+sbk+uMWK7D9rU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 62D5561728;
        Tue,  1 Oct 2019 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569949454;
        bh=UEkX/cHMbQ0sDePOFVv3FYadMtUY51cOeHadyFKhHvY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Amc4WfDqR/Ia2oe2RA7vGkjDeZHnbdBIgta2AynRkAwnAg0DKlyrue7DBbGM2Zhb5
         vGwuYZkfCUQAHLfmEkZ4PpW4V1SYojQvaVT//h5rwM4kfQ3lgT6iOMSdCCmBo8q1bl
         uGQDcZFuvPCNecg3TlEHS0/XCvOgiPl9Mv/+wDig=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Oct 2019 10:04:14 -0700
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
In-Reply-To: <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
Message-ID: <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-01 09:13, Jeffrey Hugo wrote:
> Sai,
> 
> This patch breaks boot on the 835 laptops.  However, I haven't seen
> the same issue on the MTP.  I wonder, is coresight expected to work
> with production fused devices?  I wonder if thats the difference
> between the laptop and MTP that is causing the issue.
> 
> Let me know what I can do to help debug.
> 

I did test on MSM8998 MTP and didn't face any issue. I am guessing this 
is the same issue which you reported regarding cpuidle? Coresight ETM 
and cpuidle do not work well together since ETMs share the same power 
domain as CPU and they might get turned off when CPU enters idle states. 
Can you try with cpuidle.off=1 cmdline or just remove idle states from 
DT to confirm? If this is the issue, then we can try the below patch 
from Andrew Murray for ETM save and restore:

https://patchwork.kernel.org/patch/11097893/

It is not merged yet. They would appreciate your tested by ;)

Thanks,
Sai
