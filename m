Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C82E824BA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 11:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfEUJfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 05:35:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34924 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbfEUJfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 05:35:25 -0400
Received: by mail-pl1-f195.google.com with SMTP id p1so2790455plo.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BcrBjNA9Tz5dGFNp5fZjQydBqPzFfr7sOnV00Q/kGKk=;
        b=mHnuGqwcHVA9QzUzGRIKoiCvFyVfKiGJP6H7y0Cp2QQlhUyM7G/saLc/IHsxYHTwMY
         4NHNLLxX0/CHcCb59QKSUsrh+dU0H9NtQU1pBkpJxgnEfT4P45oEwHv0wYxRaJdhv3NU
         TFl9+8FakXz2Thwqfqr/KfUXeGW6/+d7V7R38raqQZ7Nx4rZvhq8z+QhMkK7aMpVxYXV
         xriAdfsqiPih9oqpc4JGK9eN3MX2A+UFHjUPvp6XEivePvPVIhzPaxeLWAykvb/D9wMG
         /FCr2p84dKHyzkV18sbme240jtTPFIwQz1VQeFEW4RYTBXspZ5lPkuNIIg5YRz+ELfAa
         1IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BcrBjNA9Tz5dGFNp5fZjQydBqPzFfr7sOnV00Q/kGKk=;
        b=QrOxmLkMfG/Q2jyA4PkSC6saBJMsM2Y4siGyHZYXCAuOmPbJGculwPp3uTgU4RBgzQ
         QshrgjRjsVkLd8JVdMa6o2ifTaDV8tSz7DXFOlmVsZ+fQeCcHI+QLDWrQxwCGuKib8L3
         jwAjuPAKlhAC9aCiffkonQZX38Opq3DkfJOArLKslAIv6Kf8nrCaq8qv6wMueG6uky/2
         ONzPfMfSzn8uw0Dy8tOZOEZJBFooMQ8kOw6FOO0LBcOlWdMkc0vM+9i8cuiHsqnZ4KfS
         /fi66HefZoO6izj5LjxYm23+fF7TRLQMXHTCc3/sHKT0bDJBiTWid55D4RVI4W+aGNnJ
         h6Fw==
X-Gm-Message-State: APjAAAUOmHALOujsFlcAjha96RQhb5rZOSJiY6ZmewTEaNObgLFSbQVI
        a55UB+Kl/PimH9UlrtLuW+ca1w==
X-Google-Smtp-Source: APXvYqwXbni4FmWu8cVHkn7REQOdZWicQVyH7AbWOk5ATCaQQKLGT8i5VShHXpOcZkUcef7q6DJpGA==
X-Received: by 2002:a17:902:4481:: with SMTP id l1mr68079415pld.121.1558431324465;
        Tue, 21 May 2019 02:35:24 -0700 (PDT)
Received: from localhost ([49.248.189.249])
        by smtp.gmail.com with ESMTPSA id k22sm16995349pfk.54.2019.05.21.02.35.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 02:35:23 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        niklas.cassel@linaro.org, marc.w.gonzalez@free.fr,
        sibis@codeaurora.org, daniel.lezcano@linaro.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/9] qcom: Add cpuidle to some platforms
Date:   Tue, 21 May 2019 15:05:10 +0530
Message-Id: <cover.1558430617.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
 - Reworded changes to the idle-state documentation on Sudeep's feedback.
 - Renamed several idle-state node names to be homogeneous across qcom
   platforms. We now use cpu_sleep_0_0 format for the node name while using
   LITTLE_CPU_SLEEP_0 format for labels to help differentiate the different
   states for different CPU types.
 - Add a new patch to add capacity-dmips-mhz property for msm8996 to allow
   topology code to find its true capacity.
 - Add power-collapse state to msm8998 in additon to the retention state.
 - Added acks

MSM8998 changes are untested for v2 because I couldn't access the mtp I
usually have access to. Hopefully Marc and Sibi can help with testing.

Description
-----------
Fix up a few entry-method="psci" issues and then add cpuidle low power
states for msm8996, msm8998, qcs404, sdm845. All these have been tested
to only make sure that the C-states are entered from Linux point-of-view.

We will continue to add more states and make power measurements to tweak
some of these numbers, but getting these merged will allow other people to
use these platforms to work on cpuidle, eas and related topics.


Amit Kucheria (7):
  arm64: dts: fsl: ls1028a: Fix entry-method property to reflect
    documentation
  Documentation: arm: Link idle-states binding to "enable-method"
    property
  arm64: dts: qcom: msm8916: Add entry-method property for the
    idle-states node
  arm64: dts: qcom: msm8916: Use more generic idle state names
  arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states
  arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
  arm64: dts: msm8996: Add proper capacity scaling for the cpus

Niklas Cassel (1):
  arm64: dts: qcom: qcs404: Add PSCI cpuidle low power states

Raju P.L.S.S.S.N (1):
  arm64: dts: qcom: sdm845: Add PSCI cpuidle low power states

 .../devicetree/bindings/arm/idle-states.txt   | 13 +++-
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 13 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 21 ++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 50 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 18 +++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 69 +++++++++++++++++++
 7 files changed, 177 insertions(+), 9 deletions(-)

-- 
2.17.1

