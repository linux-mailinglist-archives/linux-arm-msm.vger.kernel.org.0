Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5461387FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2020 20:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733064AbgALTyN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jan 2020 14:54:13 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39279 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732957AbgALTyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jan 2020 14:54:13 -0500
Received: by mail-pj1-f66.google.com with SMTP id e11so1784324pjt.4;
        Sun, 12 Jan 2020 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yud86Z6TCLSzd0rR4y2aIB+ldRZqkAROXID9MEYSFRY=;
        b=LSneU5osfAdaRa9Vis9gXCnleS2SMgQoqlVF/rEy1osnQVkvwuFe6u8RCRMr3wWcMp
         E2rVGBfMju31g+0ewn3GNANjbuulCUd5V3VSGix2PEO57fWsxVASbXyz063zxmSX+XZ6
         21MfAudMiQ53BiNHLWuWOCk46PTajisQUTlYp12+Hq8cRLcU4xYaHFC7HKaZyb0AFOQK
         ci32Mh6d2ppBTnOStnwnILDtlMzErf0hYp8e2dEqBAvpolSLU4p/rVnj/NIbqtbt3+o7
         VAzJ1mknsTEVjFU6k2PN6nIR0G6R8KarlkyXSkuNfUMpvHcCRQauRPeQQK69GlR3XB22
         f5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yud86Z6TCLSzd0rR4y2aIB+ldRZqkAROXID9MEYSFRY=;
        b=PSVwbEp4mAkmA1mKMKmDBMVw+9r3v5Aein29muCX/5uCFlLPLK8rgzaiXeWbs5wZEE
         2eXx9FhlqwP+HA4tKXJt6vH3gE7I/II6dwg2b6AeLxg2jIx/C6y2y0B9gAiUiWAdGKCV
         ICAvLZHrvFtftxIDz1cyIWWGZKGiI5acmxdmZOle5R6826kOjZmXkzTBmmvcdrfiU95U
         jeVb6c1AJ2J/R8g7Up5QV9O7h8M4ZBtorzObsTtieOnKW4zhoKMPsNjfXf3DbOHyg06a
         VxIHM20fw+RgKkufCgrOj5L4BsmAF4/Tk11xJSvMxOuSR6DDMVdMhU3UOzUa+WLGy/Oi
         7qnQ==
X-Gm-Message-State: APjAAAWaypDa4CyW3x5wQag00zyNB2SmMrkSqdLqaw9+0sxJt4VcKaSz
        xp933umjKe7iEULfY4s5wFw=
X-Google-Smtp-Source: APXvYqzg3ZTlrgWnSzwGAoyDQpR2QVy2mV1UbfhCVOs0nnzZiJ5QYI/WrPy1+HK2WaVmhK9ISXkm4A==
X-Received: by 2002:a17:902:aa85:: with SMTP id d5mr17395774plr.16.1578858851944;
        Sun, 12 Jan 2020 11:54:11 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id u128sm11418702pfu.60.2020.01.12.11.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 11:54:11 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Douglas Anderson <dianders@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org (open list),
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 0/4] drm/msm: use firmware-name to find zap fw
Date:   Sun, 12 Jan 2020 11:53:56 -0800
Message-Id: <20200112195405.1132288-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For devices which use zap fw to take the GPU out of secure mode on
reset, the firmware is likely to be signed with a device specific key.
Meaning that we can't have a single filesystem (or /lib/firmware) that
works on multiple devices.

So allow a firmware-name to be specified in the zap-shader node in dt.
This moves the zap-shader node out of the core sdm845.dtsi and into per-
device dts files.  Which also removes the need for /delete-node/ in
sdm845-cheza.dtsi (as cheza devices do not use zap).

This aligns with how Bjorn has been handling the similar situation with
adsp/cdsp/mpss fw:

   https://patchwork.kernel.org/patch/11160089/

Rob Clark (4):
  drm/msm: support firmware-name for zap fw (v2)
  drm/msm: allow zapfw to not be specified in gpulist
  dt-bindings: drm/msm/gpu: Document firmware-name
  arm64: dts: sdm845: move gpu zap nodes to per-device dts

 .../devicetree/bindings/display/msm/gpu.txt   |  3 ++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  7 +++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  7 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  6 +--
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  7 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 50 +++++++++++++++----
 7 files changed, 64 insertions(+), 17 deletions(-)

-- 
2.24.1

