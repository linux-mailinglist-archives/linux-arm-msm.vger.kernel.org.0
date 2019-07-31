Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26F097B96D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 08:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfGaGFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 02:05:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59102 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725209AbfGaGFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 02:05:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AB91760735; Wed, 31 Jul 2019 06:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564553153;
        bh=hEk5PTdhSlKYsF9BXBhjcZBTRehJjUX5duLT6JssgUI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=L7QZGwJ0INkOQxR7UU4hxuC1jBHQfyR/j1TeOlzjZqMssnkNWO1poRKVn27FyBlnv
         K13xaqM+DJ1odTPKtpHVkgiu9ArMtMKkjVn2vfcHJIw6A8hXD5XOmLYRM+sTKSOz24
         oQFLXvD9Wq8eTTyRSCfCtu1DUfZJuhBk1glBKWYc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37482602F1;
        Wed, 31 Jul 2019 06:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564553152;
        bh=hEk5PTdhSlKYsF9BXBhjcZBTRehJjUX5duLT6JssgUI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ioDPYOhc1zZYTYKDQYsrRAN8bInbnXb4qZ95Frt66pd/Z4f7I3Cn8+RB3dXiDXMZ5
         qxrqORFaXA/XnmfRdMoEb5atqtBHbwwCEUIWrTl1k/+mSFQlKsChhkVHOqqRA7NUFk
         aahtVZzAqwLrnD3bZySkzv62zhy4DwWoSurO2Ec4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37482602F1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv9 1/3] arm64: dts: qcom: sdm845: Add Coresight support
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <be6d77eb6c7498df09d04e0a369d4d65b38f4b8e.1564550873.git.saiprakash.ranjan@codeaurora.org>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <b50c06d4-8298-7abe-4442-2aff336509f5@codeaurora.org>
Date:   Wed, 31 Jul 2019 11:35:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <be6d77eb6c7498df09d04e0a369d4d65b38f4b8e.1564550873.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 7/31/2019 11:28 AM, Sai Prakash Ranjan wrote:
> Add coresight components found on Qualcomm SDM845 SoC.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 451 +++++++++++++++++++++++++++
>   1 file changed, 451 insertions(+)

I have tested coresight with scatter gather on SDM845 MTP and MSM8996
based DB820c board and posted the results in

- https://github.com/saiprakash-ranjan/coresight-test-results

Please let me know if you need some additional testing done.

I could not perform coresight tests on MSM8998 MTP with latest build
as it was resulting in crash due to some AHB timeouts. This was not
due to scatter-gather and mostly likely the problem with the build.
Maybe we can keep msm8998-coresight on hold?

BTW, patches are based on linux-next.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
