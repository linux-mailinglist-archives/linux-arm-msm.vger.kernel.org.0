Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 309B5E9580
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 05:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbfJ3EGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 00:06:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35794 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbfJ3EGb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 00:06:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4B79A60C8E; Wed, 30 Oct 2019 04:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572408390;
        bh=r0tGaf1qSrUb7xFSDWv+7Mxo9UoXZ+w51K/d6nmW/4o=;
        h=From:To:Cc:Subject:Date:From;
        b=E5qc+g45o6SZOnimCJf/ReNn5hk6jngef6g2JJsJiad3yXQPkipxoKaKzIjZw4X28
         FEoR8UsoObMF2bUoSojfqQSjZipY22aGtrlAnnLOUctbqcaaKZSppCrJOq33r4O2Gq
         b1RPuj0kPbLE2FV/Q4tOtiTpQ8lwULdd3ewagVuI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 805E560C8E;
        Wed, 30 Oct 2019 04:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572408389;
        bh=r0tGaf1qSrUb7xFSDWv+7Mxo9UoXZ+w51K/d6nmW/4o=;
        h=From:To:Cc:Subject:Date:From;
        b=knKrf4PBU2ytzxWJXZik8TjcN0Dtw1zkeu4v3q14dbhmJoHZ9ig2nAvwud4aidLCk
         tJmFKngZo5910nQa2hw10a5DXF9TeoJHlpiNrwVLcyDUouLpXlSM2NYIJw05hW3U8A
         3j0ewkqvZjQAg5Kg9EIN2NEdSmfbr2XFg8TB1LtU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 805E560C8E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        mka@chromium.org, swboyd@chromium.org, evgreen@chromium.org,
        dianders@chromium.org, Maulik Shah <mkshah@codeaurora.org>
Subject: arm64: dts: qcom: sc7180: Add cpuidle low power states
Date:   Wed, 30 Oct 2019 09:35:17 +0530
Message-Id: <1572408318-28681-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add cpuidle low power mode support for sc7180.
The change has dependency on adding device tree support for sc7180 [1]
to merge first.

Dependencies:

[1] https://lkml.org/lkml/2019/10/23/223

Maulik Shah (1):
  arm64: dts: qcom: sc7180: Add cpuidle low power states

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

