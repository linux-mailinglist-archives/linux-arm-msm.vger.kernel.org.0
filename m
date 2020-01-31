Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14FC114EC36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 13:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbgAaMDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 07:03:55 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:39679 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728374AbgAaMDz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 07:03:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580472234; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=DATLwmm6gFXl+yI0FvjPg5/iHOuhkrdRvmV/WIqzDAQ=; b=KQA7ghDOrcQTz9VwAX/5R8zkgHQ+YV5hkej6dol+3IVzmTUL5hbP+tR4gEMMMdvZYPOQf3v3
 BlxwY4tZyn6lmAVIikDnknQmyIJ2fPAf188wyav3bR1X7YJvauooYKiS59GHarsOAf1M84Kg
 hPQI2xYoSyu93ON+Pipq7ijQy1U=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3417a9.7f2554fedd50-smtp-out-n02;
 Fri, 31 Jan 2020 12:03:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AAE76C447A2; Fri, 31 Jan 2020 12:03:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ACF31C433CB;
        Fri, 31 Jan 2020 12:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ACF31C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jcrouse@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH v3] Add A618 GPU nodes
Date:   Fri, 31 Jan 2020 17:33:39 +0530
Message-Id: <1580472220-3453-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I used this branch qcom/arm64-for-5.6-to-be-rebased as suggested by Matthias.
This patch needs the clock patches and the clock patches have not yet landed, so
please apply the following series and patches in order

a) All patches from https://patchwork.kernel.org/project/linux-clk/list/?series=203517&state=%2a&archive=both
b) Patches 1 and 2 from https://patchwork.kernel.org/project/linux-clk/list/?series=203527&archive=both&state=%2a
c) All patches from https://patchwork.kernel.org/project/linux-clk/list/?series=221739&archive=both&state=%2a
d) https://lore.kernel.org/linux-arm-msm/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59%40changeid/raw
e) This patch "arm64: dts: qcom: sc7180: Add A618 gpu dt blob"

v3: Addressed review comments from previous submits. Also removed the
interconnect bindings from this patch and I will submit as a new patch with its
dependencies listed. Also I will be sending a new patch for updating the
bindings documentation.

Sharat Masetty (1):
  arm64: dts: qcom: sc7180: Add A618 gpu dt blob

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

--
1.9.1
