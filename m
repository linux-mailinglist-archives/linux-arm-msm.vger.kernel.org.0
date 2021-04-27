Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE5D36C6AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 15:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236121AbhD0NGU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 09:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235795AbhD0NGU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 09:06:20 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8890CC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Apr 2021 06:05:35 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id m5so5012815wmf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Apr 2021 06:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hyHZv2pQIe4zPxW3vUkDBiN3woZzeIjWNkh06b5/QZk=;
        b=jXG5blgAAZiTK1GhlpNoq1nRmEE4uJb4C/YPMsZAGEqdr2ZyD5+Wr2HJZvjaQZeGKo
         ZvLQvfBL09yuGlRhYcx9Ld1ualcpXa8HBm9Zsnoa5MeDUgWa8c3T3UHFd8KRbeGjfn4v
         OOHxWilyyakFyx5GgPdC54T2kCzSgJ6US4Nt5SRMHSx6Buo9ZFFuxEP25QTVQbFD9ztS
         XOxKg3kmvF9PSA3kWbTfEvGKSZwsMNe3xQzoamfSpkOMEVP80bw3/JPwwGeanpQW9LJc
         30cDyFSe0kW1FpzdfGNT8g2U1eWNsfxLQq33GA8+tPsCHSxTbI5VFNhrRHy/GwaXH6y+
         AMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hyHZv2pQIe4zPxW3vUkDBiN3woZzeIjWNkh06b5/QZk=;
        b=m7G39gtyIAQuNlW0KDgjZu81Ka75NM0Y2MpInWElvk8pLqR+x5wJOhvqBgp2LPTEtQ
         gx6RrwtfOfXvZW0BjkXXR7/3+NhA6dm2m+OUi3qs0uYulFZAtWacZSf6erKDwMjK1RuA
         nJS4lER5sjToNbe+9Y5rmRPHsOx+wbdY1J7u2B9Ze7VX7BmUmikoMO7HAxWoWvk188Cn
         OanJkuxHK+hjgw7GVhPUvMHmhSOMfKq5qIJG5ySccavbP3PhRdqRpi3Jcw617aczImbH
         zBby04LL9NgKRQEVpvko1FPuPAeEFn3MIH8E28SR2xs69EHxtGrBGtr8QooTN4PRlxTj
         VySA==
X-Gm-Message-State: AOAM530/oP6lHphU50zgW3AWNvCjleOeUAVmjgCttSauiSnkLhEdDAFk
        oT/foPSInfxDWx4SFMWd9+mgSg==
X-Google-Smtp-Source: ABdhPJw5Hmu5Szk5Y3EV/jnChUIyhNYAeAguL/ydFympBaDt9Z9Buyek7RHSCXK4c3uqxmn0gpOPCw==
X-Received: by 2002:a1c:4c15:: with SMTP id z21mr4223939wmf.54.1619528734303;
        Tue, 27 Apr 2021 06:05:34 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y19sm2488118wmj.28.2021.04.27.06.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 06:05:33 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/2] Enable VBUS current boost on pm8150b platforms
Date:   Tue, 27 Apr 2021 14:07:10 +0100
Message-Id: <20210427130712.2005456-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V3:
- Drop the SoC regulator constraints for
  regulator-min-microamp
  regulator-max-microamp
  These will be applied on a per-board basis - Mark Brown

V2:
The first version of this patch set the current limit to 3 amps as was done
in downstream. Mark indicated a preference to set this on a per-system
basis instead of blitzing it, as in downstream.

Looking at what was upstream versus what was in my working tree I saw that
in fact the VBUS boost driver had been upstreamed minus accompanying DTS in
pm8150b.

So there's no need for a fixes as this driver doesn't appear to be in use.
A subsequent patchset will enable the VBUS boost for the two relevant
upstream platforms.

First thing though, is the driver + dts change.

- Use regulator_set_current_limit_regmap/regulator_get_current_limit_regmap
  with a relevant current-to-bitmap lookup.

- Add a parallel DTS entry to the pm8150b
  It looks like this was submitted upstream but not followed up on

  I've add regulator-min-microamp/regulator-max-microamp to Wesley's
  original work.

I've made sure to test that its possible to set the current to anything in
the range of 500 mA to 3 A and confirmed the output on a scope.

Once these two patches are in, I'll send out board enablement for the
sm8150-mtp and qrb5165-rb5.

https://lore.kernel.org/linux-arm-msm/8687acdb-75e9-5fc5-dd3e-9a19615676b5@linaro.org/T/#t

Bryan O'Donoghue (1):
  regulator: Add a routine to set the current limit for QCOM PMIC VBUS

Wesley Cheng (1):
  arm64: boot: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster

 arch/arm64/boot/dts/qcom/pm8150b.dtsi       |  6 ++++++
 drivers/regulator/qcom_usb_vbus-regulator.c | 12 ++++++++++++
 2 files changed, 18 insertions(+)

-- 
2.30.1

