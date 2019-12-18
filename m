Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB9712481C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 14:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfLRNXo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 08:23:44 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39691 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbfLRNXj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 08:23:39 -0500
Received: by mail-lf1-f68.google.com with SMTP id y1so1689204lfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 05:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5SkJ4zyZx5Gc3ntyaEJs4TJQW06uBI/jmE9PJA8MRnM=;
        b=pNxmEJx9Ga6kWrGleWquQnRu+x3IT4w1xzdjQfVYIZVWuru47elp68vnOsLTC9ZZHZ
         rDLkSDl37TzgFL4Gf4Fy67tihwWMznjflIrHiWUFbowKfLb1P5EU9RaBZ57PkGEwky6z
         gn4PnqxcjjGDq/H3F2uDq34+kxhWS26Cq/vI/bIwdujMtGAgdlZvRY+/sCcEcGyTPOYS
         Q23ldAXtkmV2ol3H0s+5ji9ebp3gBQ+QAl5D4LBObw8gnEjgL8VfQYB5VZBLpl7GqlaD
         namvOYPapFh5swcHHrLHSogN3GZTDGWg7vT/A3RnV0MDx6fNbtO0VjbgA/mHBDAMLL8/
         Uhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5SkJ4zyZx5Gc3ntyaEJs4TJQW06uBI/jmE9PJA8MRnM=;
        b=BFTHLURGCsI9wAmvgQvE+lJlcSc5j6HwDuMBZBwthl+KJHioPF60M0ZMiRBQpw4ELT
         Z0/9SRF2ObEKdPtqijpScggHS10v3OqqlAS9cI6/tFaepZFyWraF9NkAYIZh2bTXePoo
         zh+Z700N1M0aqJe1aHGbmNkRAq/3d+lbzLp7sbFnqtYV3NB2DqFnzm5w4nv+f12zHXJ9
         pfrA0tSeg9HNadFhGgG9AEVBEMCqTv36ZJRvBE1X+a4dhiSKlRLf2lR9f9Y2vHOOjEwW
         f5hk4q+qGwj6JHBez5MnIokvuQH9OBiVy5JDOnam4y8HWS2vZcXXaki5OUcKpYKlAyZL
         p4OQ==
X-Gm-Message-State: APjAAAVGD/+uC5Jz+eN8riRa6rFV1ocATxfMDNRHbzhHbIiojKtuIAtY
        eH3e7SJxJXvCyfpWE5a3G9GB2EsV1ao=
X-Google-Smtp-Source: APXvYqwjvj3hNKYMIv28Jm1ph10aljnG35FIxC2qpNMG2AVVRU1HuPC7o35HF9tZxE1MVNZ9r0+NeA==
X-Received: by 2002:a19:6a04:: with SMTP id u4mr1798924lfu.62.1576675417586;
        Wed, 18 Dec 2019 05:23:37 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id z7sm1440667lfa.81.2019.12.18.05.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:23:36 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 00/12] Venus new features
Date:   Wed, 18 Dec 2019 15:22:39 +0200
Message-Id: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Here is v2 with the following changes:

 - added patches for dt-bindings conversion to DT schema, and
delete the obsoleted .txt document

 - introduced qcom,sdm845-venus-v2 compatible and resources to
better describe the ability for dynamic core assignment and also
cover SoCs with one vcodec

 - 01/12 - move all clock and pmdomains names in venus resource
structure

 - 02/12 - fixed locking issues when deciding on which core to run
current instance

The previous version is at [1].

regards,
Stan

[1] https://lkml.org/lkml/2019/12/9/121

Aniket Masule (2):
  media: venus: introduce core selection
  media: venus: vdec: handle 10bit bitstreams

Stanimir Varbanov (10):
  venus: redesign clocks and pm domains control
  venus: venc: blacklist two encoder properties
  v4l: Add source event change for bit-depth
  dt-bindings: media: venus: Convert msm8916 to DT schema
  dt-bindings: media: venus: Convert msm8996 to DT schema
  dt-bindings: media: venus: Convert sdm845 to DT schema
  dt-bindings: media: venus: Add sdm845v2 DT schema
  venus: core: add sdm845-v2 DT compatible and resource struct
  arm64: dts: sdm845: follow venus-sdm845v2 DT binding
  dt-bindings: media: venus: delete old binding document

 .../bindings/media/qcom,venus-msm8916.yaml    | 115 +++
 .../bindings/media/qcom,venus-msm8996.yaml    | 139 +++
 .../bindings/media/qcom,venus-sdm845-v2.yaml  | 137 +++
 .../bindings/media/qcom,venus-sdm845.yaml     | 151 +++
 .../devicetree/bindings/media/qcom,venus.txt  | 120 ---
 .../media/uapi/v4l/vidioc-dqevent.rst         |   8 +-
 .../media/videodev2.h.rst.exceptions          |   1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  25 +-
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      | 122 ++-
 drivers/media/platform/qcom/venus/core.h      |  31 +-
 drivers/media/platform/qcom/venus/helpers.c   | 435 ++------
 drivers/media/platform/qcom/venus/helpers.h   |   4 -
 drivers/media/platform/qcom/venus/hfi_cmds.c  |   2 +
 .../media/platform/qcom/venus/hfi_helper.h    |   6 +
 .../media/platform/qcom/venus/hfi_parser.h    |   5 +
 .../media/platform/qcom/venus/pm_helpers.c    | 964 ++++++++++++++++++
 .../media/platform/qcom/venus/pm_helpers.h    |  65 ++
 drivers/media/platform/qcom/venus/vdec.c      |  88 +-
 drivers/media/platform/qcom/venus/venc.c      |  75 +-
 include/uapi/linux/videodev2.h                |   1 +
 21 files changed, 1849 insertions(+), 647 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-msm8916.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-msm8996.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-sdm845-v2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-sdm845.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.c
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.h

-- 
2.17.1

