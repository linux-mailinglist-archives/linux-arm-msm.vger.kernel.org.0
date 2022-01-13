Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C6348E0F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbiAMXeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiAMXeK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:34:10 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B27BC061574;
        Thu, 13 Jan 2022 15:34:10 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id t20so5397225wrb.4;
        Thu, 13 Jan 2022 15:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v0aH7RBRzcewEmYCwu3uGeEjeaqQRZNrix/y1VoAsYU=;
        b=ZM0VXB+1QCk0Wwy1FOMCF6LHzhROcbV+NXM4NQKGsvy30mb1pX2s5Ng0WElC9a4Kb2
         h4GFFQkDamyai3w0Pn2Lh21ykCcDT5o31Q7GLSzcgoD0oGcxpMCMnrXgbNjeKrK/EI9j
         cq/klbFRPHQFmDntS31cdcr/TOXnlKIoIl5uITBLltWyjIoXo572VoJfYPerxMiGh2vS
         uevazuGDULfmzwbrcHp2jFg6MvUai+VmLwwksooNedeg1a/AuVyfKFS1pqZAMvRshBA4
         ZVqL5V1mGoqbp/bEHCoMxdp0Rj2qzu/uQn8YUM/p9frB9Ztncq9IM38IhbYdT4gQkpqm
         YBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v0aH7RBRzcewEmYCwu3uGeEjeaqQRZNrix/y1VoAsYU=;
        b=2b7SHQbE4cb1xX91AsVZXKS3lRxthnijSUrlilyvRsiP/o+LaPimgJ9PTAICzvwXXt
         XTINFj8xiKiJabWObABrx7+8uMQKzumB323U9n7rDAJe0MuXSf8PLKLgJx9QZ0EMwr4m
         EX4muIP/xSHW3bTMO11oyL09SGjQjO7IrM8JUytOQxiWcQKKHDeeTUSv/APxMZt03AN8
         GeykTxPjRmGCeA+yTj5hetZOji20LvKAqnxaNIQITGqQ616/cc77lASv4QIA8aFq4AM5
         Km2HdZri9ElrTd47H2E/gqlViSgGCYLA75WtLMU5R5S1y3LFggjunJqZslNkOSVntyRe
         8sag==
X-Gm-Message-State: AOAM530mMDDAHyVXU/hxcYHhGMi2OEzFDoQvFhN/h6bIOtuDByiQ06WO
        P1mhgRRFwOacehKn4lqPoUQKBCiVRCWjwQ==
X-Google-Smtp-Source: ABdhPJyqHgsQFJofWmWm5tZcBTbwBbVQ2/YNZOl2oS6X2GR4l6IzZ3V9qrUt6hsRY1iMm+qzjkcDTQ==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr5792635wrp.178.1642116848690;
        Thu, 13 Jan 2022 15:34:08 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id u17sm3724748wrt.37.2022.01.13.15.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 15:34:08 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org
Subject: [PATCH 0/6] msm8994-huawei-angler and msm8992-lg-bullhead sdhc1 fixes
Date:   Fri, 14 Jan 2022 00:33:52 +0100
Message-Id: <20220113233358.17972-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Besides fixing sdhc1 for msm8994-huawei-angler and msm8992-lg-bullhead
I also rebased and reposted Jean's patches (Makefile didn't apply on
current for-next) and also rename angler's DTS.

sdhc1 (i.e. mmc0) is working on both, but there are overclocking
warnings. I suspected issue similar to using clk_rcg2_ops instead of
clk_rcg2_floor_ops (i.e. 3f905469c8ce ("clk: qcom: gcc: Use floor ops
for SDCC clocks") or 148ddaa89d4a ("clk: qcom: gcc-sc7180: Use floor ops
for the correct sdcc1 clk"), but it looks to be correct for gcc-msm8994.c.

Kind regards,
Petr

* angler
angler downstream
qcom,bus-speed-mode = "HS400_1p8v", "HS200_1p8v", "DDR_1p8v";
[90] SDHC Running in DDR mode
[    8.837072] sdhci: Secure Digital Host Controller Interface driver
[    8.843203] sdhci: Copyright(c) Pierre Ossman
[    8.847536] sdhci-pltfm: SDHCI platform and OF driver helper
[    8.858043] mmc0: no vqmmc regulator found
[    8.861168] mmc0: no vmmc regulator found
[    8.865359] mmc0: SDHCI controller on f9824900.sdhci [f9824900.sdhci] using 32-bit ADMA
[    8.920815] mmc1: no vqmmc regulator found
[    8.923917] mmc1: no vmmc regulator found
[    8.928123] mmc1: SDHCI controller on f98a4900.sdhci [f98a4900.sdhci] using 32-bit ADMA
[    9.018117] mmc0: BKOPS_EN bit = 0
[    9.039550] mmc0: new HS400 MMC card at address 0001
[    9.043971] mmcblk0: mmc0:0001 064G70 58.2 GiB
[    9.048185] mmcblk0rpmb: mmc0:0001 064G70 partition 3 4.00 MiB
[    9.056974] GPT:partition_entry_array_crc32 values don't match: 0x4aa75f3b != 0xe3345ddf
[    9.064044] GPT: Use GNU Parted to correct GPT errors.
[    9.069247]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44

angler mainline (with this patchset)
using mmc-hs400-1_8v (this patchset)
[    1.825962] mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
[    1.826043] mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
[    1.839502] mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
[    1.840203] mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
Trying to mount subpartitions for 10 seconds...[    1.855276] mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
[    1.860454] mmc0: new HS400 MMC card at address 0001

[    1.878747] mmcblk0: mmc0:0001 064G70 58.2 GiB
[    1.883175] GPT:partition_entry_array_crc32 values don't match: 0x4aa75f3b != 0xe3345ddf
[    1.883234] GPT: Use GNU Parted to correct GPT errors.
[    1.894514]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44
[    1.905939] mmcblk0boot0: mmc0:0001 064G70 4.00 MiB
[    1.926200] mmcblk0boot1: mmc0:0001 064G70 4.00 MiB
[    1.928880] mmcblk0rpmb: mmc0:0001 064G70 4.00 MiB, chardev (234:0)

using mmc-ddr-1_8v (and mmc-hs200-1_8v)
[    1.825991] mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
[    1.826071] mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
[    1.837905] mmc0: new HS200 MMC card at address 0001
[    1.846269] mmcblk0: mmc0:0001 064G70 58.2 GiB
[    1.850916] GPT:partition_entry_array_crc32 values don't match: 0x4aa75f3b != 0xe3345ddf
[    1.850976] GPT: Use GNU Parted to correct GPT errors.
Trying to mount subpartitions for 10 seconds...[    1.863540]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44
[    1.879858] mmcblk0boot0: mmc0:0001 064G70 4.00 MiB

[    1.894920] mmcblk0boot1: mmc0:0001 064G70 4.00 MiB
[    1.899991] mmcblk0rpmb: mmc0:0001 064G70 4.00 MiB, chardev (234:0)

* bullhead 1.01
bullhead downstream
[70] SDHC Running in HS400 mode
[    7.069617] sdhci: Secure Digital Host Controller Interface driver
[    7.075741] sdhci: Copyright(c) Pierre Ossman
[    7.080081] sdhci-pltfm: SDHCI platform and OF driver helper
[    7.091419] mmc0: no vqmmc regulator found
[    7.094508] mmc0: no vmmc regulator found
[    7.098731] mmc0: SDHCI controller on f9824900.sdhci [f9824900.sdhci] using 32-bit ADMA
[    7.250588] mmc0: BKOPS_EN bit = 0
[    7.269765] mmc0: new HS400 MMC card at address 0001
[    7.274242] mmcblk0: mmc0:0001 032G74 29.1 GiB
[    7.278448] mmcblk0rpmb: mmc0:0001 032G74 partition 3 4.00 MiB
[    7.286719]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44 p45 p46

bullhead mainline (with this patchset)
[    1.961228] mmc0: Card appears overclocked; req 200000000 Hz, actual 343999999 Hz
[    1.961312] mmc0: Card appears overclocked; req 200000000 Hz, actual 343999999 Hz
[    1.968060] mmc0: Card appears overclocked; req 400000000 Hz, actual 687999999 Hz
Configuring kernel firmware image search path
/init: line 56: can't create /proc/sys/kernel/hotplug: nonexistent directory
[    1.988240] mmc0: Card appears overclocked; req 200000000 Hz, actual 343999999 Hz
[    1.998602] mmc0: Card appears overclocked; req 400000000 Hz, actual 687999999 Hz
[    2.001919] mmc0: Card appears overclocked; req 400000000 Hz, actual 687999999 Hz
[    2.018628] mmc0: new HS400 MMC card at address 0001

Jean THOMAS (2):
  arm64: dts: qcom: msm8992-lg-bullhead: Place LG Bullhead generic code
    into a DTSI file
  arm64: dts: qcom: msm8992-lg-bullhead: Add support for LG Bullhead rev
    1.0

Petr Vorel (4):
  arm64: dts: qcom: msm8994: Provide missing "xo_board" and "sleep_clk"
    to GCC
  arm64: dts: qcom: msm8994-huawei-angler: Add vendor name huawei
  arm64: dts: qcom: msm8994-huawei-angler: Add sdhc{1,2} definitions
  arm64: dts: qcom: msm8992-lg-bullhead: Disable sdhc2

 arch/arm64/boot/dts/qcom/Makefile                |  5 +++--
 .../boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts | 14 ++++++++++++++
 .../dts/qcom/msm8992-lg-bullhead-rev-101.dts     | 14 ++++++++++++++
 ...head-rev-101.dts => msm8992-lg-bullhead.dtsi} |  7 +++++--
 ...101.dts => msm8994-huawei-angler-rev-101.dts} | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8994.dtsi            |  3 +++
 6 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts
 rename arch/arm64/boot/dts/qcom/{msm8992-bullhead-rev-101.dts => msm8992-lg-bullhead.dtsi} (98%)
 rename arch/arm64/boot/dts/qcom/{msm8994-angler-rev-101.dts => msm8994-huawei-angler-rev-101.dts} (75%)

-- 
2.34.1

