Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D53A116A40C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 11:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgBXKhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 05:37:54 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:31937 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727229AbgBXKhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 05:37:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582540673; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qjzPp+O8tXzYCBRUzA0c7FdmKgMX92vvMqwCboWI5tU=; b=MHqiZ2sAIoNY6+FvuYM0le3mwLFV+KoSE26bTDgGNffN17QszMy3ENwOt8QZWmeH1PSnzd9Z
 7Y8CUZK45KS4o2wsG52M+c/RtZIhpbAsOyjr1DuNZ7yd77B8JXMyrjk7JDElaF1o+8dsseTF
 cnnvZHNJkAWAstYx9vzXiTI2naM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e53a76e.7fd75365db58-smtp-out-n01;
 Mon, 24 Feb 2020 10:37:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB3A1C433A2; Mon, 24 Feb 2020 10:37:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C681C43383;
        Mon, 24 Feb 2020 10:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9C681C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-soc-owner@vger.kernel.org
References: <1582049733-17050-1-git-send-email-tdas@codeaurora.org>
 <1582049733-17050-4-git-send-email-tdas@codeaurora.org>
 <20200218230026.GA3778@bogus>
 <6298769e-09bc-eb69-bf72-5aedd0e87f16@codeaurora.org>
 <7cf3950b53a7b5881c840ed371e64158@codeaurora.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <bee354db-23a0-3654-dc8b-a2487ef060d4@codeaurora.org>
Date:   Mon, 24 Feb 2020 16:07:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7cf3950b53a7b5881c840ed371e64158@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/20/2020 4:48 PM, Sibi Sankar wrote:
> Hey Taniya,
> 
> +    <&gcc GCC_MSS_NAV_AXIS_CLK>,
> 
> error is because of ^^ typo
> it should be GCC_MSS_NAV_AXI_CLK
> instead, with that dt_bindings
> check will go though.
> 
> 

Thanks Sibi for pointing the typo.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
