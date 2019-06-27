Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F01B557D1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 09:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfF0HZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 03:25:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50972 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfF0HZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 03:25:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5660160AA8; Thu, 27 Jun 2019 07:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561620344;
        bh=bnqFFWmIcyjWf0nQfnzyJ/okEG85Snj80+71ypFni4w=;
        h=From:To:Cc:Subject:Date:From;
        b=ZuKlUdsVHDmbQmzvRE+ryDqncrNNpvHXldaFHBNgjY9nQtNfwPwYkkk9oF5n4KbJi
         k/3y3hhe+y82ruYFZdm4V+Eus1VElRBKe0nP4Tg+iLWiiUVlSQw8K3YVnlT9RQrRke
         ODxYGApQQn6q1Nqk74du+vDeu7UKc2MYF0+6VsJk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from amasule-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: amasule@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C13966070D;
        Thu, 27 Jun 2019 07:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561620343;
        bh=bnqFFWmIcyjWf0nQfnzyJ/okEG85Snj80+71ypFni4w=;
        h=From:To:Cc:Subject:Date:From;
        b=fmrtC8DC0lNiE9FB2bOcJpXngEoUM56XhGey04nLApt0Llz8pws5fl46ON7p5aCC4
         8yDkgtq9xtyEKmazV5sYSsfatjgLO1on1RFWyzDZJGKDsSZ1mJP6xP/3OCiri7A0RJ
         DihILmxQr0RmN0XOHXv8XlqfCo70QhLbOXxxiWIM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C13966070D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v2] arm64: dts: sdm845: Add video nodes 
Date:   Thu, 27 Jun 2019 12:55:33 +0530
Message-Id: <1561620334-17642-1-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds video nodes to sdm845 based on the examples
in the bindings.

Changes since v1:
 - Corrected the Signed-off-by ordering.
 - Corrected the node position based on the address.

Aniket Masule (1):
  arm64: dts: sdm845: Add video nodes

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

