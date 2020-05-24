Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562091DFE0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 11:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgEXJtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 05:49:47 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:48721 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728825AbgEXJtr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 05:49:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590313786; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Hpny/BC7WaaZVZire+fOYb5SmUYL/GKQYSit2tQ3rKs=; b=uwIPFdCW0TYxG23SY9itzjXFwFHYWDwwkoCDQwhtXvs8YfWVMRkbMpHLiuDxT+Wvfn2SIwEx
 /lRTNuuaGE/JudA9U6CB+s8Po3j84ierQnGNNp5H7QuIL3nYqs7lBNPI1C47r/T0bbbPdmB/
 +kKgJ7c9VlsgE4ZD0rB9yP7Ub/s=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5eca43227522fe8b0891e866 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 24 May 2020 09:49:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25FB4C433CA; Sun, 24 May 2020 09:49:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [49.207.133.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A588C433C9;
        Sun, 24 May 2020 09:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1A588C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V4 2/8] dt-bindings: clock: Add schema for QCOM IPQ apss
 pll
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
 <1588573224-3038-3-git-send-email-sivaprak@codeaurora.org>
 <20200512195608.GH2165@builder.lan>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <6c1120c6-5344-e404-53fd-0f2277aa1f36@codeaurora.org>
Date:   Sun, 24 May 2020 15:19:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512195608.GH2165@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/13/2020 1:26 AM, Bjorn Andersson wrote:
> On Sun 03 May 23:20 PDT 2020, Sivaprakash Murugesan wrote:
>
>> Add dt-binding for apss pll found on QCOM IPQ platforms
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> This seems quite similar to the existing qcom,a53pll binding, can't you
> just describe both in the same binding?
ok.

