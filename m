Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838383AD481
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 23:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234617AbhFRVnw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 17:43:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18367 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232453AbhFRVnw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 17:43:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624052502; h=Content-Transfer-Encoding: Mime-Version:
 Content-Type: References: In-Reply-To: Date: Cc: To: From: Subject:
 Message-ID: Sender; bh=yXhmmp3HnP6JSHafnSyJemeEbnB6pdcDfRv16as6wsU=; b=bQ6XWuUFgvsswpheMAbugBrFU+MCs2/0rP0x5sESgY/P0DPR5vR6jg5ub0yw6e7+6iNY6YdR
 O1XGb2Jb//z7vjtls6Se1/JdjQDaAYf56RVsVm8qDCcNbyHBMUDngBLwq8F/87a6TGYyGpMk
 blWhG3cBW17+LFhX4o97TODuWkk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60cd1312e27c0cc77f90a8dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 21:41:38
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1E07AC4338A; Fri, 18 Jun 2021 21:41:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hemantk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09D88C433D3;
        Fri, 18 Jun 2021 21:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09D88C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Message-ID: <1624052489.10055.12.camel@codeaurora.org>
Subject: Re: [PATCH 1/2] bus: mhi: Fix pm_state conversion to string
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     Paul Davey <paul.davey@alliedtelesis.co.nz>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 18 Jun 2021 14:41:29 -0700
In-Reply-To: <20210618033132.24839-2-paul.davey@alliedtelesis.co.nz>
References: <20210618033132.24839-1-paul.davey@alliedtelesis.co.nz>
         <20210618033132.24839-2-paul.davey@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Paul,
On Fri, 2021-06-18 at 15:31 +1200, Paul Davey wrote:
> On big endian architectures the mhi debugfs files which report pm
> state
> give "Invalid State" for all states.
> 
> Fix to_mhi_pm_state_str by using a local unsigned long as an
> intemediate
> to pass the state to find_last_bit to avoid endianness issues with
> cast
> from enum mhi_pm_state * to unsigned long *.
> 
> Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
> ---
>  drivers/bus/mhi/core/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c
> b/drivers/bus/mhi/core/init.c
> index c81b377fca8f..87cc0c449078 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -79,7 +79,8 @@ static const char * const mhi_pm_state_str[] = {
>  
>  const char *to_mhi_pm_state_str(enum mhi_pm_state state)
>  {
> -	int index = find_last_bit((unsigned long *)&state, 32);
> +	unsigned long tmp = state;
> +	int index = find_last_bit((unsigned long *)&tmp, 32);
>  
>  	if (index >= ARRAY_SIZE(mhi_pm_state_str))
>  		return "Invalid State";

Considering KASAN bugs reported in the past related to find_next_bit
https://www.spinics.net/lists/alsa-devel/msg110946.html

Since you are addressing the BE arch issue, would you please
use this solution instead :-

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 8f4cd4d..744b617 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -77,9 +77,12 @@ static const char * const mhi_pm_state_str[] = {
 
 const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 {
+	int index;
 
-	if (index >= ARRAY_SIZE(mhi_pm_state_str))
+	if (state)
+		index = __fls(state);
+
+	if (!state || index >= ARRAY_SIZE(mhi_pm_state_str))
 		return "Invalid State";
 
 	return mhi_pm_state_str[index];

Thanks,
Hemant

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

