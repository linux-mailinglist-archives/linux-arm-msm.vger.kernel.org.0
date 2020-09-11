Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B2A265B8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 10:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgIKI0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 04:26:32 -0400
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:38488
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725764AbgIKI03 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 04:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812789;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=Suw0PG/fZ1BCpafDijGnb5vPJXoo0m2bMenuQ7bZnxg=;
        b=SF6ZfqEZQxVCSMc0BR7jTVDWwqizlwPEzTc7Vsm+5PBPKNUghmOPF57AGCoivCjP
        4JF5izGRZJjAWIk53Owmc6paUD+9WBBGHf71C9CEozNe7O2loJIgW++oUBhGWZgNZOp
        nGuRFZgZptHL4wdHoGojUwldTC+FMyah7n4uE47o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812789;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=Suw0PG/fZ1BCpafDijGnb5vPJXoo0m2bMenuQ7bZnxg=;
        b=bb3ckIdPbfyp0jKPtjLlM731ZJX88kSwLv13Imp1KPjBPNQubTO+8PVY0eKJXfgN
        +aNb2yeHJCChPHQgIIFCu6At/5PTuPJF4ocHEqxZvJA1uZnX+YoeAlfEXzvjchqf9fQ
        5DDhsxjDcdZgJlBJpXxpsv3ST9xcFTC0WoDepa/I=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 08:26:29 +0000
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 5/8] iommu/arm-smmu-qcom: Consistently initialize
 stream mappings
In-Reply-To: <20200904155513.282067-6-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-6-bjorn.andersson@linaro.org>
Message-ID: <010101747c45e395-e7b8299e-f3bf-4dbb-828f-c3608b2121d3-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-04 21:25, Bjorn Andersson wrote:
> Firmware that traps writes to S2CR to translate BYPASS into FAULT also
> ignores writes of type FAULT. As such booting with "disable_bypass" set
> will result in all S2CR registers left as configured by the bootloader.
> 
> This has been seen to result in indeterministic results, as these
> mappings might linger and reference context banks that Linux is
> reconfiguring.
> 
> Use the fact that BYPASS writes result in FAULT type to force all 
> stream
> mappings to FAULT.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
