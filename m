Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D0E225BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 11:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgGTJmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 05:42:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30194 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727930AbgGTJmY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 05:42:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595238143; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+a+OgeBANKFuGXB0Vdh5PrXcg22QjgsiqPAyOrbjp74=;
 b=Cl+avh4aLe1FC0zcnEShtSdP5Vu91LzdVn7xMn2cv3zj1rj/jQ0geVRARahlPhvAIgwkIOPj
 zqgEsM4iU5pNZmm48v4c/7I7e9O+6y+NEwKGHBXjHtUpCPs6v5j8p9tcQk4IhaSEcEqiWrJ8
 X3t2hxBGxND/yW+xrZD+3viF2Zc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f1566fd03c8596cdb7b4426 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 09:42:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 133B0C43395; Mon, 20 Jul 2020 09:42:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75FF2C433C6;
        Mon, 20 Jul 2020 09:42:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 20 Jul 2020 15:12:19 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, saipraka@codeaurora.org,
        msavaliy@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V2] soc: qcom: geni: Fix NULL pointer dereference
In-Reply-To: <1595237762-6776-1-git-send-email-akashast@codeaurora.org>
References: <1595237762-6776-1-git-send-email-akashast@codeaurora.org>
Message-ID: <ce1514ab9b5fbeabcde8ac6a74fd8d81@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-20 15:06, Akash Asthana wrote:
> pdev struct doesn't exists for the devices whose status are disabled
> from DT node, in such cases NULL is returned from 
> 'of_find_device_by_node'
> Later when we try to get drvdata from pdev struct NULL pointer 
> dereference
> is triggered.
> 
> Add a NULL check for return values to fix the issue.
> 
> We were hitting this issue when one of QUP is disabled.
> 
> Fixes: 048eb908a1f2 ("soc: qcom-geni-se: Add interconnect support to
> fix earlycon crash")
> Reported-by: Sai Prakash Ranjan <saipraka@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>

Nit: my codeaurora mail address is <saiprakash.ranjan@codeaurora.org>.
I don't think you have to resend for this small change, hopefully 
maintainers
are ok to fix this when applying.

Reported-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
