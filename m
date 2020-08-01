Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC38D2353FB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Aug 2020 20:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgHASNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Aug 2020 14:13:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:37994 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726571AbgHASNx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Aug 2020 14:13:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596305633; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cJyeRZPN9m3WfcT3UaEZE4Gf1yPYYNx/SsDF1xhJnSc=; b=K76BjiEeHuo0lkzavtVT7BqSu5xiLKSpUAIfGHgnpz0IQfK1V4Q1w2PenAPnQWf7O1k31FdO
 2YhBqXUnfsudZ6lny+vhB7p5UVBHRiZgh9u8WImeV5WJMun46juzPhzyk35RJdq5dKxspCxv
 H8DPEd5fFYA675UNY3U3GmLyYQU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f25b0debcdc2fe47193e77d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 01 Aug 2020 18:13:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DEC6BC43391; Sat,  1 Aug 2020 18:13:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C85ECC433C6;
        Sat,  1 Aug 2020 18:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C85ECC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2] Add LPASS clock controller Node for SC7180
Date:   Sat,  1 Aug 2020 23:43:34 +0530
Message-Id: <1596305615-5894-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v2]
 - Update the node in sorted order.
 - Depends on the patch
  https://lore.kernel.org/r/20200731133006.1.Iee81b115f5be50d6d69500fe1bda11bba6e16143@changeid

[v1]
 - Clock controller LPASS device Node.

Taniya Das (1):
  arm64: dts: qcom: sc7180: Add LPASS clock controller nodes

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

