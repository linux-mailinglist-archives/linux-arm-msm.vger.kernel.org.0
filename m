Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E5F2CC180
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 17:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgLBQAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 11:00:39 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:27958 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727824AbgLBQAj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 11:00:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606924820; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=6zFEAybXE2NmgA+iBFqhJLlMW/04xfBUq8tGuC59uxk=; b=BBE/4hRUEilmTlsUeFIJK+mhxrDAnOfXfRF1heWcPhxtaK7I3z8zPh3JwldyhVS/cND2T2iJ
 WLV2DrnpFQwchenoSFTxoQF4Y5R1QRfS4TNGWu/rJW67scQm1/juePpfKSFryh6NApll5fi2
 UJcWBKbcxBfU4faskKLncnA8Qn8=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fc7ba0b51762b1886e1f96c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 16:00:11
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 34D8EC43463; Wed,  2 Dec 2020 16:00:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76FF4C433ED;
        Wed,  2 Dec 2020 16:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76FF4C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh@linuxfoundation.org, hemantk@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH 01/29] bus: mhi: Remove auto-start option
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
        <20201202094159.107075-2-manivannan.sadhasivam@linaro.org>
Date:   Wed, 02 Dec 2020 18:00:05 +0200
In-Reply-To: <20201202094159.107075-2-manivannan.sadhasivam@linaro.org>
        (Manivannan Sadhasivam's message of "Wed, 2 Dec 2020 15:11:31 +0530")
Message-ID: <87pn3si4fu.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> From: Loic Poulain <loic.poulain@linaro.org>
>
> There is really no point having an auto-start for channels.
> This is confusing for the device drivers, some have to enable the
> channels, others don't have... and waste resources (e.g. pre allocated
> buffers) that may never be used.
>
> This is really up to the MHI device(channel) driver to manage the state
> of its channels.
>
> While at it, let's also remove the auto-start option from ath11k mhi
> controller.
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> [mani: clubbed ath11k change]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Hmm, didn't we apply this already? At least I pulled the immutable
branch to my tree:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=526740b495059ebbc0c3c086dceca1263820fa4f

So if there's a new version of this patch (and a new commit id) the
immutable branch I pulled is not immutable anymore.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
