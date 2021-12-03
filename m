Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B90467706
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 13:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380711AbhLCMKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 07:10:09 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:36347 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244024AbhLCMKE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 07:10:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1638533200; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pQZT8IsW4jYbFaXDYqbHE6v8CLACutQ1h0TkuVwudoo=; b=aOqoswpWfdUCR+3mF03fLQl0PoeLuoSGwKZmOa+qGK9DZmpsRjeXMmCv3HbYM33JPzufMHDt
 yzq0wkJTqK0FqlfR42qRzsDjuBuXCi07JVrHonoqTUwnWsJD8lMYV9SH3Y0V5SrUBQ5TuADh
 gTNI/Nd9V3vkLncvvREMJECy06c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61aa084f642caac318e54d45 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Dec 2021 12:06:39
 GMT
Sender: srivasam=codeaurora.com@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 09FEBC43637; Fri,  3 Dec 2021 12:06:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61E28C4360C;
        Fri,  3 Dec 2021 12:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 61E28C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.com
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
Subject: [PATCH v7 0/2] Machine driver to support LPASS SC7280 sound card registration
Date:   Fri,  3 Dec 2021 17:36:21 +0530
Message-Id: <1638533183-19023-1-git-send-email-srivasam@codeaurora.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch set is to add support for SC7280 sound card registration and
to add dt-bindings documentation file.

Srinivasa Rao Mandadapu (2):
  ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
  ASoC: qcom: SC7280: Add machine driver

Changes Since V6:
    -- Remove redundant headers.
    -- Move max ports macro to lpass.h header.
    -- Arrange structure alignment.
    -- Fix indentation errors.
    -- Update module license.
Changes Since V5:
    -- Add required properties to dt-bindings
Changes Since V4:
    -- Add COMPILE_TEST flag in sc7280 configuration.
    -- Remove redundant startup and shutdown callbacks of snd_soc_ops.
    -- Fix typo errors.
Changes Since V3:
    -- Change audio jack playpause key value.
Changes Since V2:
    -- updated required field in bindings
    -- updated Return type check with proper enum in sc7280.c
    -- Updated Header name and Typos in sc7280.c
Changes Since V1:
    -- Indentation changes and typo.

 .../bindings/sound/google,sc7280-herobrine.yaml    | 171 ++++++++++++
 sound/soc/qcom/Kconfig                             |  14 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass.h                             |   1 +
 sound/soc/qcom/sc7280.c                            | 290 +++++++++++++++++++++
 5 files changed, 478 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
 create mode 100644 sound/soc/qcom/sc7280.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

