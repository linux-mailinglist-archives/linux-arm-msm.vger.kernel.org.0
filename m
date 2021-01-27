Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0984D3053BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 07:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhA0G6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 01:58:03 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:58969 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbhA0G5p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 01:57:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611730631; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hU8NbJLAILCYLe1C93Kybx4GuXXTXOA9q7/wMGg7isM=;
 b=H2ELE+d5ixXPmsgQfrc4wT09O8CJom/IxZ5lZ+12fYYfNzYrTcsZ163ppbZdOC8fjF6X8RYB
 k6WscxzxWotmjCaGF9zfPfz2nbIgIOgiG3J+wBGgEGirFhrhwoNJF6FM77dfyAtz7NeWPOcw
 whMZdozYufr682eMSIBX3Y5G0PA=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60110ea86287154b878cbe3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 06:56:40
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 20156C433C6; Wed, 27 Jan 2021 06:56:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 001EEC433CA;
        Wed, 27 Jan 2021 06:56:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 27 Jan 2021 12:26:38 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: IPQ6018 CP01 boot hangs
In-Reply-To: <87sg6pcsn2.fsf@tarshish>
References: <87sg6pcsn2.fsf@tarshish>
Message-ID: <9e6d68a8708c08c1dd20f6f8af4b0b27@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-25 14:14, Baruch Siach wrote:
> Hi linux-arm-msm list,
> 
> I am trying to boot kernel v5.11-rc4 on the IPQ6018 based CP01 board. 
> Boot
> hangs with these last lines shown on the console:
> 
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.0 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> [    0.000000] psci: SMC Calling Convention v1.0
> [    0.000000] psci: OSI mode supported.
> 
> I verified that the psci_set_osi_mode() call after the last print never
> returns.
> 
> The board is loaded with stock boot image running 32-bit vendor 
> provided
> U-Boot version 2016.01. So I'm loading a 32-bit kernel with the
> ipq6018-cp01-c1.dtb file from arm64.

Hi Baruch,

Can you boot the stock kernel from the vendor and share the below 
information?

cat /proc/device-tree/tz_version

Thanks,
Kathiravan T.

> 
> The only boot image version identification appears to be this:
> 
> S - QC_IMAGE_VERSION_STRING=BOOT.XF.0.3-00072-IPQ60xxLZB-1
> 
> Are there any missing patches I need to make boot succeed?
> 
> Thanks,
> baruch

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
