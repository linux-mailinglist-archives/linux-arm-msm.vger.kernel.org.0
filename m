Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C76DB45818
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 11:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfFNJBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 05:01:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52026 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfFNJBO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 05:01:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DD6BB60A24; Fri, 14 Jun 2019 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560502873;
        bh=CEPg9SjCJWxoxlllbshGhQypKWjlbh7i11o4DsbvNb8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=a5x7Q5fEklM2XCBFzFCzeUDk6RONP1hA4PTtFOSpxG+YS+p3xX5WKE0iTFtwCxOMA
         e1Vcm7dU6HmZ+xwhfQKLSnaPRTG1N4V+O9hbORhifHiA1WCBYyBfLPfp5ysGUVTZ8S
         nu1VTCR7vgBS8T2CkCMGQJP8VJ+wKuV50Y0k9PR8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.128.120] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F0BDE60254;
        Fri, 14 Jun 2019 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560502872;
        bh=CEPg9SjCJWxoxlllbshGhQypKWjlbh7i11o4DsbvNb8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dTdmPSgyegTwDKNrKINqZdX5vcdA0AXS/1DcJM5O/+fOp4+IeiuZ5LJiENp/7V6MW
         wHjQBVtsCVlk3u0dQMgAki0dfAGQoXUlDjcaP56Mg99dpzbhYZBEJvpEQIv4Gn71tR
         TKTbvwRRBxNU/eLIeiyk0vAWO8tqZUihWnSTLYdg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F0BDE60254
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Subject: Re: [PATCH v3 4/4] arm64: dts/sdm845: Enable FW implemented safe
 sequence handler on MTP
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, will.deacon@arm.com,
        robin.murphy@arm.com, joro@8bytes.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        david.brown@linaro.org
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-5-vivek.gautam@codeaurora.org>
 <20190614040659.GL22737@tuxbook-pro>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <eaa8abc7-07a1-9c52-685c-25883cba67b9@codeaurora.org>
Date:   Fri, 14 Jun 2019 14:31:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614040659.GL22737@tuxbook-pro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/14/2019 9:36 AM, Bjorn Andersson wrote:
> On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
>
>> Indicate on MTP SDM845 that firmware implements handler to
>> TLB invalidate erratum SCM call where SAFE sequence is toggled
>> to achieve optimum performance on real-time clients, such as
>> display and camera.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks Bjorn for reviewing this.

Best regards
Vivek

[snip]
