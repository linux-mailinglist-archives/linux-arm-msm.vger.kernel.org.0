Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE17C1AB1F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 21:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441830AbgDOTpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 15:45:40 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:48057 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2441844AbgDOTpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 15:45:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586979939; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ibbsr5ypXdlwHeDCbyU70XBfIzXR6KVFiTZ4QWWPCL0=; b=m7SQr2o3NVSTiVRDKX2BzpUI7GH2dhoNxJ7A4wb8Ty7txPlzDJf560EZUBmWHkXFHxhv1IPh
 t11Soz/Ah9/9fP16/LXwULCTHG6i/ZNHGo6b8K90bovZxLbg9kCic7jPH82SqIhT1monTMIh
 5i/tMRisgTKaz/GKEqfD6zhMU18=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e976457.7f8fb8566fb8-smtp-out-n05;
 Wed, 15 Apr 2020 19:45:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 999E3C44788; Wed, 15 Apr 2020 19:45:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E8595C433CB;
        Wed, 15 Apr 2020 19:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E8595C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Wed, 15 Apr 2020 13:45:25 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: cmd-db: Use 5 digits for printing address
Message-ID: <20200415194525.GA3469@codeaurora.org>
References: <20200415192916.78339-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200415192916.78339-1-swboyd@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 15 2020 at 13:29 -0600, Stephen Boyd wrote:
>The top few bits aren't relevant to pad out because they're always zero.
>Let's just print 5 digits instead of 8 so that it's a little shorter and
>more readable.
>
>Suggested-by: Lina Iyer <ilina@codeaurora.org>
>Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Lina Iyer <ilina@codeaurora.org>
