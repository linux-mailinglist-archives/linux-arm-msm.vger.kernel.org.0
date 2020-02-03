Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C2B150F64
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 19:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgBCScO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 13:32:14 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41634 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbgBCScO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 13:32:14 -0500
Received: by mail-pf1-f195.google.com with SMTP id j9so4919215pfa.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 10:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y3mIATAg+5LdFoD0uzm3jVblzLIA03DsoYz6n06M99I=;
        b=Jc0bkPXu0q0TJFHgu0J0I3RK3fr/jvvfd9XIt0V72QkJ0/4yfkc9JDfEQcwEo/9jda
         00eu2uEH8hLxxxsTQQoeuUXH4s4LCzG7PPrVQT/HaDeD9MXtRb0rBAkxe7njWA6Dm1yV
         mkXvBw6cJF19/OOQqDfxYT5OCyYpzficnfaHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y3mIATAg+5LdFoD0uzm3jVblzLIA03DsoYz6n06M99I=;
        b=EpQvznuyV1r8bB3y/9BR0GkFkrRaQ4NljU2AW6HQMQy9v1yvv3SI5g8z2VdxPHDibR
         U/l4itbS8VOz/cp8K/lIkIcpmItL63VbnLqYzAMYJ/QKbqHh3crVdPum5aHOI6YcFzKl
         OYuIuTg6UJgKEgCawitb9SNDvEu0GAu+1W3W0myJP0vlcz94zhpWWXHreilgufN3G3UN
         tX9qZQbfPHEBJArDniYYOJ/ZSlSI4tGsu/2ITdrJS1wxUl/N+xGfVt9DwdJCTf8ZlbpP
         9PlqPRbJGaxx3rvwGVKQpdCT//zVuZO1yPWyIiVycpnofFIBBpky06CzdnQ4CiH93HSt
         xSLw==
X-Gm-Message-State: APjAAAXimCW6lnanxGk4Ux2tWr4VfrmbEbZede4IqJJjdgZnkIzl8I6/
        O86VNUHT4riF1S+8W9rrSDFm5g==
X-Google-Smtp-Source: APXvYqwbQrtlwxFZ4HRXRZxhqJZn4EN4SQWxd/AalIpnCgqHAzJYQavSHgOve0nJe/XDjgCBXLdCYg==
X-Received: by 2002:a65:5ccc:: with SMTP id b12mr26278507pgt.124.1580754733211;
        Mon, 03 Feb 2020 10:32:13 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:12 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 00/15] clk: qcom: Fix parenting for dispcc/gpucc/videocc
Date:   Mon,  3 Feb 2020 10:31:33 -0800
Message-Id: <20200203183149.73842-1-dianders@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The aim of this series is to get the dispcc and gpucc in a workable
shape upstream for sc7180.  I personally wasn't focusing on (and
didn't test much) videocc but pulled it along for the ride.

Most of the work in this series deals with the fact that the parenting
info for these clock controllers was in a bad shape.  It looks like it
was half transitioned from the old way of doing things (relying on
global names) to the new way of doing things (putting the linkage in
the device tree).  This should fully transition us.

As part of this transition I update the sdm845.dtsi file to specify
the info as per the new way of doing things.  Although I've now put
the linkage info in the sdm845.dtsi file, though, I haven't updated
the sdm845 clock drivers in Linux so they still work via the global
name matching.  It's left as an exercise to the reader to update the
sdm845 clock drivers in Linux.

This series passes these things for me on linux-next (next-20200129)
after picking the recent gcc fix I posted [1]:

  for f in \
    Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml \
    Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml \
    Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml \
    Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml \
    Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml \
    Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml \
    Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml; do \
        ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=$f; \
    done

  I also tried this:
    # Delete broken yaml:
    rm Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml
    ARCH=arm64 make dt_binding_check | grep 'clock/qcom'
  ...and that didn't seem to indicate problems.

  I also tried this (make sure you don't run w/ -j64 or diff is hard):
    # Delete broken yaml:
    rm Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml
    git checkout beforeMyCode
    ARCH=arm64 make dt_binding_check > old.txt 2>&1
    git checkout myCode
    ARCH=arm64 make dt_binding_check > new.txt 2>&1
    diff old.txt new.txt
  ...and that didn't seem to indicate problems.

I have confirmed that (with extra patches) the display/gpu come up on
sc7180 and sdm845-cheza.  You can find the top of my downstream tree at:
  https://crrev.com/c/2017976/4

I have confirmed that sdm845-cheza display / GPU come up atop
next-20200129, which is what this series is posted against.

From v2 to v3, this series has quite a few changes.  Mostly it's:
- Always split into multiple files (Stephen).
- Use internal names, not purist names (Taniya).
- I realized that I forgot to update the sc7180 video clock controller
  driver in v2.
- A few other misc cleanups / fixes, see each patch for details.

From v3 to v4 this just removes the "bindings/" from the schema ID and
adds Rob's tag to two of the bindings patches.  The third binding
patch didn't get Rob's Ack because he suggested combining two files
might be a good idea.  I'm assuming he'll be OK with leaving them
split since Stephen prefers it that way, but if I have to do a v5 I
can do that.

It feels like with this many patches there's very little chance I
didn't do something stupid like make a tpyo or a paste-o paste-o,
though I tried to cross-check as much as I could.  I apologize in
advance for the stupid things I did that I should have known better
about.

[1] https://lore.kernel.org/r/20200129152458.v2.1.I4452dc951d7556ede422835268742b25a18b356b@changeid

Changes in v4:
- (non-change): Didn't combine sdm845 & sc7180 gpucc as per Stephen.
- Added Rob's review tag.
- Fixed schema id to not have "bindings/" as per Rob.

Changes in v3:
- Add Matthias tag.
- Added include file to description.
- Added pointer to inlude file in description.
- Added videocc include file.
- Discovered / added new gcc input clock on sdm845.
- Everyone but msm8998 now uses internal QC names.
- Fixed typo grpahics => graphics
- Newly discovered gcc_disp_gpll0_div_clk_src added.
- Patch ("clk: qcom: Get rid of fallback...dispcc-sc7180") split out for v3.
- Patch ("clk: qcom: Get rid of the test...dispcc-sc7180") split out for v3.
- Patch ("clk: qcom: Get rid of the test...gpucc-sc7180") split out for v3.
- Patch ("clk: qcom: Get rid of the test...videocc-sc7180") new for v3.
- Patch ("clk: qcom: Use ARRAY_SIZE in dispcc-sc7180...") split out for v3.
- Patch ("clk: qcom: Use ARRAY_SIZE in gpucc-sc7180...") split out for v3.
- Patch ("clk: qcom: Use ARRAY_SIZE in videocc-sc7180...") new for v3.
- Split bindings into 3 files.
- Split sc7180 and sdm845 into two files.
- Split videocc bindings into 2 files.
- Switched names to internal QC names rather than logical ones.
- Unlike in v2, use internal name instead of purist name.
- Updated commit description.

Changes in v2:
- Added includes
- Changed various parent names to match bindings / driver
- Patch ("arm64: dts: qcom: sdm845: Add...dispcc") new for v2.
- Patch ("arm64: dts: qcom: sdm845: Add...gpucc") new for v2.
- Patch ("arm64: dts: qcom: sdm845: Add...videocc") new for v2.
- Patch ("clk: qcom: rcg2: Don't crash...") new for v2.
- Patch ("dt-bindings: clock: Cleanup qcom,videocc") new for v2.
- Patch ("dt-bindings: clock: Fix qcom,dispcc...") new for v2.
- Patch ("dt-bindings: clock: Fix qcom,gpucc...") new for v2.

Douglas Anderson (14):
  clk: qcom: rcg2: Don't crash if our parent can't be found; return an
    error
  dt-bindings: clock: Fix qcom,dispcc bindings for sdm845/sc7180
  arm64: dts: qcom: sdm845: Add the missing clocks on the dispcc
  clk: qcom: Get rid of fallback global names for dispcc-sc7180
  clk: qcom: Get rid of the test clock for dispcc-sc7180
  clk: qcom: Use ARRAY_SIZE in dispcc-sc7180 for parent clocks
  dt-bindings: clock: Fix qcom,gpucc bindings for sdm845/sc7180/msm8998
  arm64: dts: qcom: sdm845: Add missing clocks / fix names on the gpucc
  clk: qcom: Get rid of the test clock for gpucc-sc7180
  clk: qcom: Use ARRAY_SIZE in gpucc-sc7180 for parent clocks
  dt-bindings: clock: Cleanup qcom,videocc bindings for sdm845/sc7180
  clk: qcom: Get rid of the test clock for videocc-sc7180
  clk: qcom: Use ARRAY_SIZE in videocc-sc7180 for parent clocks
  arm64: dts: qcom: sdm845: Add the missing clock on the videocc

Taniya Das (1):
  arm64: dts: sc7180: Add clock controller nodes

 .../devicetree/bindings/clock/qcom,gpucc.yaml | 72 --------------
 ...om,dispcc.yaml => qcom,msm8998-gpucc.yaml} | 33 +++----
 .../bindings/clock/qcom,sc7180-dispcc.yaml    | 84 ++++++++++++++++
 .../bindings/clock/qcom,sc7180-gpucc.yaml     | 72 ++++++++++++++
 .../bindings/clock/qcom,sc7180-videocc.yaml   | 63 ++++++++++++
 .../bindings/clock/qcom,sdm845-dispcc.yaml    | 99 +++++++++++++++++++
 .../bindings/clock/qcom,sdm845-gpucc.yaml     | 72 ++++++++++++++
 ...,videocc.yaml => qcom,sdm845-videocc.yaml} | 27 ++---
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 47 +++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 28 +++++-
 drivers/clk/qcom/clk-rcg2.c                   |  3 +
 drivers/clk/qcom/dispcc-sc7180.c              | 45 +++------
 drivers/clk/qcom/gpucc-sc7180.c               |  4 +-
 drivers/clk/qcom/videocc-sc7180.c             |  4 +-
 14 files changed, 513 insertions(+), 140 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
 rename Documentation/devicetree/bindings/clock/{qcom,dispcc.yaml => qcom,msm8998-gpucc.yaml} (51%)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml
 rename Documentation/devicetree/bindings/clock/{qcom,videocc.yaml => qcom,sdm845-videocc.yaml} (61%)

-- 
2.25.0.341.g760bfbb309-goog

