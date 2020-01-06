Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADE6131539
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 16:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgAFPtw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 10:49:52 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40897 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgAFPtw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 10:49:52 -0500
Received: by mail-lj1-f194.google.com with SMTP id u1so51373107ljk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ce/1aFrnoifjRzRwwUUN80DX+TjZ3K4olDu1l2r/o60=;
        b=iC/o4WF2v67C4lJ3/1fEmvcx2oyjC9MHGxEXLT25m4l2GuS/YNbSQ9z8JW9YUnLFEE
         nh8ZfG3VWAXKY9v5UpyOdz3imyGDDOlOxAtRynl3EZ+ReEmwiXjthyeiS7pVJoQf18nw
         YyehXoFrcYbh3i5IXEbaE7Y0v9Op6aIDPTtA4010d3lMQSJUv3gnA/UBxNw6TOptS5R3
         dd/+iJlXf6mkpejexqoZGo1it0TzrGP2zv6VtzlsDEyk5a1E9YhA8Ld50u8nyMjBpRld
         Q44fTb3Tr9KC1+ymjfnWbBIXvfdi0glkA8tmT+MOCuBh6P1yXBMMTa1DQQrIuyUOc+SD
         vPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ce/1aFrnoifjRzRwwUUN80DX+TjZ3K4olDu1l2r/o60=;
        b=Hplxy3ksBrtsEAq6sibztHsPHy16RGvXNpyuoqcVoG4Pc6cC4tLwOOcqW0gEuWrGqf
         DJv/oRH8LTYw1fCKfbih5tYkHc7jQlonlJRoazV+SYIhzDA4QMDIkAv5nPGjhUOewe1N
         xgzk6GccNcmL7VEWIciyJN2ibWJsJaeE32U9Cx90Ao8REVFEp90o8Z7QS42HbK9s9XxM
         GGjO1T8HcMZZpGEx+mfNkVlIFm7dgnzz8UDypv+2vh/OkAWT20sRQbsDRVTqZxe551np
         8cNAYTiCBLX6U7bnDMR/2Nsi+C0dqMcuffOzrniC+o3JcRe0mkn6Aj0NOXbxvEABLMAu
         woEw==
X-Gm-Message-State: APjAAAXrB1Ab7HVEe3qT+Th3D//KxXRVH3bSQ1EEy6Hp6GexOE4Ocp1p
        2UZKJeAQUijz5ZHWTmo+KIzVXEeCRN4=
X-Google-Smtp-Source: APXvYqwS0cfLO0xV7ze62Bq3045NzAxOrvxWUiPgixg34OagOq3t9eGLcU4qPScwFx2KriRqfgfysg==
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr61219423ljk.201.1578325789880;
        Mon, 06 Jan 2020 07:49:49 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:49:49 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 00/12] Venus new features
Date:   Mon,  6 Jan 2020 17:49:17 +0200
Message-Id: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Changes since v3:

  - Dropped quotes in compatibles and fixed the number of iommu items
  - Made iommus property required for video-firmware subnode

v3 can be found at [1].

regards,
Stan

[1] https://lkml.org/lkml/2019/12/23/184

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

 .../bindings/media/qcom,msm8916-venus.yaml    | 119 +++
 .../bindings/media/qcom,msm8996-venus.yaml    | 153 +++
 .../bindings/media/qcom,sdm845-venus-v2.yaml  | 140 +++
 .../bindings/media/qcom,sdm845-venus.yaml     | 156 +++
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
 21 files changed, 1875 insertions(+), 647 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.c
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.h

-- 
2.17.1

