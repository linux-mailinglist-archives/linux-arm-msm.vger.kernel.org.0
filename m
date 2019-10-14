Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF2FD600B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2019 12:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731485AbfJNKXf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Oct 2019 06:23:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53852 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731466AbfJNKXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Oct 2019 06:23:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2436C609C4; Mon, 14 Oct 2019 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571048614;
        bh=bh4wafHDw++VWs77gOJXxYbvINscPs/xH/zF7/QUm6U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NDjFBUvzP7/CdrApWwDd1MudFVw4orThdHMhsuu7l5hHYK/SHTLRbgskkl16Oa2sw
         ibz6nUtjj2d9Y0nxbbCF8mfn3rafDVAIvGFhbdqVzteVVxV/xhANegS9MJMFPoS6JS
         0rDfM9gpDZO8BuD0jy/O63StE60lLoW2lFcDZqSE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 20EC760615;
        Mon, 14 Oct 2019 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571048612;
        bh=bh4wafHDw++VWs77gOJXxYbvINscPs/xH/zF7/QUm6U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b7yaP77LRA9KwJ1QaCwhMZjYAwf4y0VFq8FG3qIBW6jftDEvCEMjlF7ZCJBK1ViaR
         0MA5pip5tq5Bw0Wac7l9BgYOMk9FG8Kk1eD14zfVpAlzh9y5O7QXjZDHC4NQHQJN7a
         YbLhhpyTNiNnEvudnREdTqfE7AHD7gO+IV4n8xbs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 20EC760615
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 2/5] clk: qcom: common: Return NULL from clk_hw OF provider
Date:   Mon, 14 Oct 2019 15:53:05 +0530
Message-Id: <20191014102308.27441-3-tdas@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014102308.27441-1-tdas@codeaurora.org>
References: <20191014102308.27441-1-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Return NULL in the cases where the clk_hw is not registered with the
clock provider, but the clock consumer still requests for a clock id.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 28ddc747d703..caba81d18c70 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -218,7 +218,7 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 		return ERR_PTR(-EINVAL);
 	}

-	return cc->rclks[idx] ? &cc->rclks[idx]->hw : ERR_PTR(-ENOENT);
+	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
 }

 int qcom_cc_really_probe(struct platform_device *pdev,
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

