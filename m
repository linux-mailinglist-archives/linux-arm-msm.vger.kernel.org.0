Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007A61B3B12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 11:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgDVJWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 05:22:40 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:16929 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725810AbgDVJWj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 05:22:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587547358; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QtrH0jI6pxLYTskWegU/r5ueqBUsmiWERsTkHhoNS2A=; b=gOXvWCekaATinoVencVjm9mWxHhCYORAQ5samKkdLWssbMMluR3vV7QqTnb3HORU29XN7gLn
 QKVLjEEmVBVA4lJkXVmwS+ErmbcniIH+3UaovjldElSyP4bGhxrW0iJYf1pS2RaDsriQJyo/
 /rUJKqEKpu5kdiBMhOgkw21Abdo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea00cde.7f2b72109960-smtp-out-n03;
 Wed, 22 Apr 2020 09:22:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38304C43637; Wed, 22 Apr 2020 09:22:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.79.162.214] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C594C433CB;
        Wed, 22 Apr 2020 09:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9C594C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 01/17] tty: serial: qcom_geni_serial: Use OPP API to
 set clk/perf state
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
 <1587132279-27659-2-git-send-email-rnayak@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0c9dcb67-5742-ce13-50a5-41c29bbbff51@codeaurora.org>
Date:   Wed, 22 Apr 2020 14:52:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587132279-27659-2-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,

> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd46494..737e713 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -24,6 +24,7 @@ enum geni_se_protocol_type {
>   
>   struct geni_wrapper;
>   struct clk;
> +struct opp_table;
>   
>   /**
>    * struct geni_se - GENI Serial Engine
> @@ -39,6 +40,7 @@ struct geni_se {
>   	struct device *dev;
>   	struct geni_wrapper *wrapper;
>   	struct clk *clk;
> +	struct opp_table *opp;

I just realized this is going to cause merge issues across geni serial and geni spi
driver (PATCH 02/17 in this series) unless all of this goes via your tree.
I see this is also an issue with the ongoing ICC patch series [1]

Do you or Greg have any thoughts on how this common header across various drivers
issue should be resolved to avoid conflicts while merging?

- Rajendra

[1] https://patchwork.kernel.org/patch/11491015/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
