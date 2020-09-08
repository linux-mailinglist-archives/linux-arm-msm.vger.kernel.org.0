Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE6F261687
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgIHRMt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:12:49 -0400
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:33702
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731977AbgIHRLT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 13:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599585079;
        h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type;
        bh=63I/CWXUQwQ4/xw3SHOSh+a3A2fsvq0vypwFNw9Go4s=;
        b=L3ILoWYsKkLDcDRZx5KSPUsEkNSrc8vHFmJ+w7df1trri+AFnN+nK9l9b/oj/z1v
        +F2PelB659msjkutNbGxG1V0sIIzQDVBGix/Q8o2HIGmrrCk5fwzMhz5JrRwA/XnRtJ
        uOmVwcEs4kIhDyxIgtUwgotctdfR8lggc8jJe4EM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599585079;
        h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:Feedback-ID;
        bh=63I/CWXUQwQ4/xw3SHOSh+a3A2fsvq0vypwFNw9Go4s=;
        b=VQYNyJxnieRiVfyUO9Ihz8lIv8a/yasU0vn7R6J14bOMIOb168R5dLzg7uLlGbZ5
        8AZkS54Xlmn2mkSS5VJoioOGxaVEWTnwk8YbsBbTFiY7CyhDv47YGM8UMLXHqu0O0a4
        rnKuGiKt5I1gG+ZDehYX50AxPuUX9EqgTvEEqO88=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01565C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 8 Sep 2020 17:11:19 +0000
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-firmware@kernel.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Adreno GPU microcode update
Message-ID: <010101746eb34f5f-3b16012e-0cb1-43d5-aa5b-af662d8c434e-000000@us-west-2.amazonses.com>
Mail-Followup-To: linux-firmware@kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2020.09.08-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit d5f9eea5a251d43412b07f5295d03e97b89ac4a5:

  wl18xx: update firmware file 8.9.0.0.83 (2020-09-01 08:07:59 -0400)

are available in the Git repository at:

  https://github.com/CosmicPenguin/linux-firmware.git for-master

for you to fetch changes up to f48fec44127f88ce83ea1bcaf5824de4146ca2f9:

  qcom: Add updated a5xx and a6xx microcode (2020-09-08 10:03:36 -0600)

----------------------------------------------------------------
Jordan Crouse (1):
      qcom: Add updated a5xx and a6xx microcode

 qcom/a530_pfp.fw | Bin 15876 -> 16144 bytes
 qcom/a630_sqe.fw | Bin 31316 -> 32056 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
