Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07AC6DD898
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2019 13:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfJSLhc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Oct 2019 07:37:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33968 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbfJSLhb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Oct 2019 07:37:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DDA6660D4C; Sat, 19 Oct 2019 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571485050;
        bh=SXx2kiu5NLFhiS5bVSElPNmvxlJ+z/9/H8Eg0smDOa0=;
        h=From:To:Cc:Subject:Date:From;
        b=OP4FA2+LWrd/ko6d+C9RtWrwVz0Gd3O0a8qCt0+033TehMAGyBhZYE9AuAUXmWOG2
         XPK+A80fnlwfMqOWoTJE7hN1ZG8Tgw/RZ3w+Uv4/CxY0J6OHqdEEeExekuHhviQu68
         y01yWSO41aP0nFKtK4R+x4TWwD6UBXYNWf+JYAzk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3BF496044E;
        Sat, 19 Oct 2019 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571485048;
        bh=SXx2kiu5NLFhiS5bVSElPNmvxlJ+z/9/H8Eg0smDOa0=;
        h=From:To:Cc:Subject:Date:From;
        b=LUHBQT4lOJ5wPreKsc8Qs0l1jA2IZ5/VQf17OXb6cjclvhnh5Y0DE8x6pbNUpYCep
         b+n/u9MZumAhZP0A0cQWQpYZIA9dUUzzvgwaY1//XonoklDaMllLkyCmqQ640DJAWr
         8f3/jCHLXePdClDKO3byEf6xyQBlNaI2zd6M4cl4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3BF496044E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 0/3] Add LLCC support for SC7180 SoC
Date:   Sat, 19 Oct 2019 17:07:10 +0530
Message-Id: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

LLCC behaviour is controlled by the configuration data set
in the llcc-qcom driver, add the same for SC7180 SoC.
Also convert the existing bindings to json-schema and add
the compatible for SC7180 SoC.

v2:
 * Convert bindings to YAML and add compatible for SC7180
 * Address Stephen's comments on const

Sai Prakash Ranjan (2):
  dt-bindings: msm: Convert LLCC bindings to YAML
  dt-bindings: msm: Add LLCC for SC7180

Vivek Gautam (1):
  soc: qcom: llcc: Add configuration data for SC7180

 .../devicetree/bindings/arm/msm/qcom,llcc.txt | 41 --------------
 .../bindings/arm/msm/qcom,llcc.yaml           | 55 +++++++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                  | 15 ++++-
 3 files changed, 69 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

