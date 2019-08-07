Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE12E852B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 20:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389041AbfHGSNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 14:13:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56288 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388163AbfHGSNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 14:13:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 88E8360E57; Wed,  7 Aug 2019 18:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565201604;
        bh=vxW0t5Vft4mszEDCzVQPjiEkFFY/eJG7abF/A3CopRw=;
        h=From:To:Cc:Subject:Date:From;
        b=FMqIBoj+V4VR5YUHXlQkTDFQV04pT6Mp5ndwiau3rwzw7vBTCLRD8EHMfPc+1d9Ip
         4Op0nf/IH2qayyXX4ssDzOzl5JdrQ5ZAE0gZ+C2LuLTBvTT8kH9wxokGKHs4rvlFJj
         9dsCVp0Ssxxnm60I9PQMGtZeHmCFqqv32JqXyzw8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5493460907;
        Wed,  7 Aug 2019 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565201603;
        bh=vxW0t5Vft4mszEDCzVQPjiEkFFY/eJG7abF/A3CopRw=;
        h=From:To:Cc:Subject:Date:From;
        b=Nk1ecPt5PuYa97Sk+v+5cVcLUhaPRjtgqKWXKQndgGEhl19Ih6kkVMDyExA/xtJgs
         vuvYa/nkmjIY649AFBo7KRYN8fOAXEIABBq4eKCxW21vlMRml9joJgLFAF+JySldcs
         da9wsHTZG33Zh/5z4nxbCeZRB+iNMk0IHy4kzvzY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5493460907
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/2] Add Global Clock controller (GCC) driver for SC7180
Date:   Wed,  7 Aug 2019 23:42:59 +0530
Message-Id: <20190807181301.15326-1-tdas@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add driver support for Global Clock controller for SC7180 and also update
device tree bindings for the various clocks supported in the clock controller.


Taniya Das (2):
  clk: qcom: Add DT bindings for SC7180 gcc clock controller
  clk: qcom: Add Global Clock controller (GCC) driver for SC7180

 .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sc7180.c                 | 2496 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h   |  155 +
 5 files changed, 2662 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

