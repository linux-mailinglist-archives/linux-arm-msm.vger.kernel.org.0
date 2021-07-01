Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E573B8BD7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 03:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238499AbhGABzd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 21:55:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56409 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238416AbhGABzc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 21:55:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625104383; h=Content-Transfer-Encoding: Mime-Version:
 Content-Type: References: In-Reply-To: Date: Cc: To: From: Subject:
 Message-ID: Sender; bh=GfsJyQhj+sUiLq2l9kHCkcJApYLVCP2VhlOanwPbPpw=; b=Qfv1UcJXAs3DL2UGnIp7V3ZZJrBrWyePvjZJUinvjdAJr1HNFLgOCop1WaMAlMlXNLKaYIyj
 bbpGVz7OQ3x3En9yWJj2+Yp0AVkdlDQHgQcbiieA3eDY51At0lcl/3EynqIIvpfvsvzwAmGK
 KonQVUtc6kJAJms/jdwu5+vIS4w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60dd1ff95d0d101e38f0df51 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Jul 2021 01:52:57
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5287CC433D3; Thu,  1 Jul 2021 01:52:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hemantk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00837C4323A;
        Thu,  1 Jul 2021 01:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00837C4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Message-ID: <1625104371.10055.21.camel@codeaurora.org>
Subject: Re: [PATCH v3 2/2] bus: mhi: Fix MHI DMA structure endianness
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     Paul Davey <paul.davey@alliedtelesis.co.nz>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 30 Jun 2021 18:52:51 -0700
In-Reply-To: <20210629035357.11091-3-paul.davey@alliedtelesis.co.nz>
References: <20210629035357.11091-1-paul.davey@alliedtelesis.co.nz>
         <20210629035357.11091-3-paul.davey@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Paul,
On Tue, 2021-06-29 at 15:53 +1200, Paul Davey wrote:
> The MHI driver does not work on big endian architectures.  The
> controller never transitions into mission mode.  This appears to be
> due
> to the modem device expecting the various contexts and transfer rings
> to
> have fields in little endian order in memory, but the driver
> constructs
> them in native endianness.
> 
> Fix MHI event, channel and command contexts and TRE handling macros
> to
> use explicit conversion to little endian.  Mark fields in relevant
> structures as little endian to document this requirement.
> 
> Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
> ---
> Removed Tested-by as patch has changed somewhat from v2.
Bhaumik is going to help testing V2 on x86 platform. Change looks good
to me. Will ack it once testing is done.
> [..]
> 

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

