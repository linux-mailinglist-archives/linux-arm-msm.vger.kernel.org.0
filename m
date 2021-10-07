Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A398F425EFC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbhJGVf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:35:58 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:50809 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbhJGVf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:35:58 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 71B273E7BE;
        Thu,  7 Oct 2021 23:34:02 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 00/13] backlight: qcom-wled: fix and solidify handling of enabled-strings
Date:   Thu,  7 Oct 2021 23:33:47 +0200
Message-Id: <20211007213400.258371-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset fixes WLED's handling of enabled-strings: besides some
cleanup it is now actually possible to specify a non-contiguous array of
enabled strings (not necessarily starting at zero) and the values from
DT are now validated to prevent possible unexpected out-of-bounds
register and array element accesses.
Off-by-one mistakes in the maximum number of strings, also causing
out-of-bounds access, have been addressed as well.

Changes in v2:
- Reordered patch 4/10 (Validate enabled string indices in DT) to sit
  before patch 1/10 (Pass number of elements to read to read_u32_array);
- Pulled qcom,num-strings out of the DT enumeration parser, and moved it
  after qcom,enabled-strings parser to always have final sign-off over
  the number of strings;
- Extra validation for this number of strings against
  qcom,enabled-strings;
- Recombined patch 9 (Consistently use enabled-strings in
  set_brightness) and patch 10 (Consider enabled_strings in
  autodetection), which both solve the same problem in two different
  functions.  In addition the autodetection code uses set_brightness as
  helper already;
- Improved DT configurations for pmi8994 and pm660l, currently in 5.15
  rc's.

v1: https://lore.kernel.org/dri-devel/20211004192741.621870-1-marijn.suijten@somainline.org

Marijn Suijten (13):
  backlight: qcom-wled: Validate enabled string indices in DT
  backlight: qcom-wled: Pass number of elements to read to
    read_u32_array
  backlight: qcom-wled: Use cpu_to_le16 macro to perform conversion
  backlight: qcom-wled: Fix off-by-one maximum with default num_strings
  backlight: qcom-wled: Override default length with
    qcom,enabled-strings
  backlight: qcom-wled: Remove unnecessary 4th default string in WLED3
  backlight: qcom-wled: Provide enabled_strings default for WLED 4 and 5
  backlight: qcom-wled: Remove unnecessary double whitespace
  backlight: qcom-wled: Respect enabled-strings in set_brightness
  arm64: dts: qcom: pmi8994: Fix "eternal"->"external" typo in WLED node
  arm64: dts: qcom: pmi8994: Remove hardcoded linear WLED
    enabled-strings
  arm64: dts: qcom: Move WLED num-strings from pmi8994 to
    sony-xperia-tone
  arm64: dt: qcom: pm660l: Remove board-specific WLED configuration

 .../dts/qcom/msm8996-sony-xperia-tone.dtsi    |   1 +
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |   7 -
 arch/arm64/boot/dts/qcom/pmi8994.dtsi         |   5 +-
 drivers/video/backlight/qcom-wled.c           | 131 ++++++++++--------
 4 files changed, 73 insertions(+), 71 deletions(-)

--
2.33.0

