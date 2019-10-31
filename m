Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2C8EAE91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 12:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfJaLQx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 07:16:53 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38853 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfJaLQw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 07:16:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id z19so1306629wmk.3;
        Thu, 31 Oct 2019 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+PNsOE4fENaOwhTZnvRCyw50CWL6R5gR5zazjJkSQ7Y=;
        b=meu+aGMBXztMLuPJljDcgF5XrXgqTSoWhNAe7rIW/BovvNzp17mkiSKP2LQD2qy0eJ
         UvNxEoignSKWWBR8SvH1HkQa4Y6J4RD8905XNjKFKNLNWUOfDIktmoVAYOyDIldhY0iE
         RAdWZciZO7bQL+ZLprv+/9koTpBn16jGppJbLiFGayrTQqSx4LkJG4nDxD0Ng1YHbaja
         kmnpsSgk6fUh9W5Fnk8cAZ6fmvPQbd1xZXwaDja4zWbZZDwMJKSJqtXL7QHA5wW/59Zr
         E8aGzZ7k/+EPt1JrRILeWEhgwc7+WHsCbiUOxSC9cSiYFHe+NgHBR9xs+OBlEWrFpm6D
         xSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+PNsOE4fENaOwhTZnvRCyw50CWL6R5gR5zazjJkSQ7Y=;
        b=VxDpFVLABxChNCGwQqNIN7RY/j/p7aYb/RREi+8biPoJbPgaUkQDlVuZVWYCHXmPhT
         nL5tlZtLAzEeQO3YKY0ix4wsb4irT92gQKebUwN1J6c2fRh8eK8nH6HfVl6Na6Bu2Nnd
         mIy5WlkJY39Zmnlfj1sF9IG2UKsQrWc59qAclAcIRRYespI39lHdYtkUQKkc9yExWkUN
         TsxfRGDRxmvRdNGKpGt8Ph3eUBB56bpsxIgWbtLGdTIn72YGsqpYJAJyRPl2bkeKIYje
         hmIQj6REmeDmWB087McnOjdNpCn9iXEN/lbHVi7Cpd5GVimZ6w8aD7r50c48xdXi+LTC
         1tkg==
X-Gm-Message-State: APjAAAVXRJVp3jJ6OrRH6H6lEIcJ0xQHrniayHxHnJWqSyNpzEHiqnRY
        qAw9e25E7w3TxWuHR472R9mXzaqbJlM=
X-Google-Smtp-Source: APXvYqzlcyG1MenaxSM7ZLfN5aIk9CUiireojdgdzin/zZ07O/IQhOu+6VBowUajq2vKu/XTbV6rZQ==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr4727564wmb.125.1572520609176;
        Thu, 31 Oct 2019 04:16:49 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id s17sm3009306wmh.3.2019.10.31.04.16.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 04:16:48 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH v2 0/5] MSM8976/56 Sony Xperia Loire (X/XCompact) smartphones
Date:   Thu, 31 Oct 2019 12:16:40 +0100
Message-Id: <20191031111645.34777-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Here it all comes together.

This patch series enables support for MSM8976 and MSM8956 with all
the extra functionality that has been tested and sent upstream and
also adds support for the Sony Xperia Loire platform, including two
devices in the Loire project: the Xperia X (Suzu) and the Xperia
X Compact (Kugo).

That's only a subset of what I actually have in my hat.. I didn't
feel like sending the entire thing because the rest is not perfectly
clean yet (even if working, and we all know that "works != clean").

As for my entire local stuff, here I can successfully boot Android 10
with nice display and 3d on both smartphones.

So, this is composed of:
- A main device-tree for the MSM8976/56 SoC (*)
- Standard configuration for the PM/PMI8950 and PM8004, which are
  found on all (from what I know) MSM8976 and 8956 boards, since
  that seems to be the recommended hardware configuration from qcom
- A main device-tree for the Sony Xperia Loire project (**)
- Device specific device-trees for Loire Kugo and Loire Suzu. (***)

(*) The MSM8956 SoC is a "broken" MSM8976. It has got two *disabled*
    BIG cores and you can't preventively know which ones are enabled
    and which ones are not: there you only know that you've got two.
    So, you can get any combination of disabled cores (relative to
    cluster 1, it can be 0,1 or 1,2 or 2,3 or 0,3 or 1,3.. etc) on
    the chip that you own.
    After many trials on (various) downstream kernels and a number of
    devices, I have concluded that the only way to get both the enabled
    big cores up is to actually declare all four and let Linux error
    out on the disabled cores (and - of course - never use them), mostly
    because there doesn't seem to be any register that can be read for
    that purpose... may sound stupid, but ... eh :)

(**) The Sony Xperia Loire platform is composed of 3 devices with their
     specific region variants, specifically, two MSM8956 smartphones
     (Suzu, Kugo) and one APQ8056 smart projector (Blanc). All these
     devices reuse the same base board design, so I thought that it is
     just better to create a common DT for all of them, hence avoiding
     a whole lot of code duplication.
     P.S.: I don't know if I'll ever try to upstream the SmartLoire
           APQ8056 Xperia Touch projector. I hope to have time to do
           it as it's a great device and I really want to but, as of
           now, I can't make any promise about that specific device.

(***) These DTs are now very light, but they will contain some
      more nodes as I get more components upstreamed. For example, the
      X Compact (Kugo) smartphone has Type-C through the FUSB301 chip,
      which resides on i2c, a RGBC-IR sensor and a VL53L0 ToF, while X
      (Suzu) has just MicroUSB and none of these sensors.
      These devices also are of a different form factor, so they've got
      different displays but connected to the same power rails anyway.


Changes in v2 (all changes requested by Bjorn):
- Reordered DT nodes by address and padded them to 8 digits
- Dropped useless inner subnodes for pinctrl configurations
- Removed the forgotten useless "qcom,init-voltage" property
- Moved BLSP2 UART2 node to main DT, declared as disabled
- Refactored SDC related pinctrl nodes as suggested
- Deleted msm8976-pins DT, moved stripped-to-the-bone pinctrl
  in msm8976.dtsi, plus remaining board-specific nodes in the
  loire board dtsi
- Removed the split mux/config in pinctrl nodes
- Added explicit "qcom,scm-msm8976" to the scm node
- Removed PM8950 regulators configuration skeleton from msm8976.dtsi
  and moved the entire thing to board specific files (in this
  case, msm8956-sony-xperia-loire.dtsi)
- Moved non-mmio nodes from /soc to /
- Removed the remoteproc/hexagon configuration completely, as it
  was just a forgotten node from various tests that I did on the
  platform (sorry guys -- plan is now to enable modem and hexagon
  in a future patch series)
- Fixed trailing whitespace issues in xperia-loire DT.

AngeloGioacchino Del Regno (5):
  dt-bindings: iio: spmi-vadc: Add definitions for USB DP/DM VADCs
  arm64: dts: pm8004: Add SPMI regulator and add phandles to lsids
  arm64: dts: qcom: Add configuration for PM8950 and PMI8950 peripherals
  arm64: dts: qcom: Add MSM8976 SoC support dts files
  arm64: dts: qcom: Add Sony Xperia (Loire) X and X Compact support

 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/msm8956-sony-xperia-loire-kugo.dts   |   56 +
 .../qcom/msm8956-sony-xperia-loire-suzu.dts   |   17 +
 .../dts/qcom/msm8956-sony-xperia-loire.dtsi   |  744 +++++++
 arch/arm64/boot/dts/qcom/msm8976.dtsi         | 1705 +++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8004.dtsi          |   10 +-
 arch/arm64/boot/dts/qcom/pm8950.dtsi          |  187 ++
 arch/arm64/boot/dts/qcom/pmi8950.dtsi         |   98 +
 include/dt-bindings/iio/qcom,spmi-vadc.h      |    3 +
 9 files changed, 2820 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8950.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8950.dtsi

-- 
2.21.0

