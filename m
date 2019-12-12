Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFE9111D763
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 20:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730512AbfLLTpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 14:45:09 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:50554
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730284AbfLLTpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 14:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576179908;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=eQxrK8Iw23uSBOiCp/yidrRTawxLunZnrXI4AtGvRN8=;
        b=kmM4+iiuXzCz2sueL2jv0+TXTB390Tqs2792/h/RdYEVoWV7JwaSEBTeqxBK98oZ
        WtQfRQw4Q+sqxpSt7CDHeYF1DhdUaDO0CFrNxQh7wVQzUq/jU2/x9ARG0dNbtdyQqYe
        rsScXiVTufva5gvgP3PSp2RYgL4p1ydIbBIC+Qzk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576179908;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
        bh=eQxrK8Iw23uSBOiCp/yidrRTawxLunZnrXI4AtGvRN8=;
        b=Pl8nwW5Ya+d3N3VA5qCjysPpYh23dMxfCF1/3RovGlW3OPqazIshzFsUxXXUz7Gn
        0YDQAd/CUC7qKsTQI2PuBbYfHI/lvkNELwyHwqc/Cm6a0ofBfRPcj0oMKawiLm8xKRb
        7iwjENbDNgTkjLrLUvwaLfdFRRkLHEkKWf6dXwxY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 99458C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
Date:   Thu, 12 Dec 2019 19:45:08 +0000
From:   Elliot Berman <eberman@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/18] firmware: qcom_scm-32: Use SMC arch wrappers
Message-ID: <0101016efba4bff6-afac982d-5c34-4c5d-a383-05522db4d45f-000000@us-west-2.amazonses.com>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
 <1573593774-12539-12-git-send-email-eberman@codeaurora.org>
 <5dcf45bd.1c69fb81.297bb.9cb9@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dcf45bd.1c69fb81.297bb.9cb9@mx.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2019.12.12-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 15, 2019 at 04:41:32PM -0800, Stephen Boyd wrote:
> Nice. Can this come earlier in the series?

This patch is the first in this series that applies only to qcom_scm-32.
Patches 1-5 were some common changes, 6-10 clean up qcom_scm-64, 11-15
clean up qcom_scm-32, and 16-18 merges the two. I'd rather not move this
patch earlier in the series as it breaks that organization of patches.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
