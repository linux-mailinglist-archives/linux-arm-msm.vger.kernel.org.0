Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC7736BB7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 00:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbhDZWNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 18:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbhDZWNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 18:13:54 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E776C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 15:13:11 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o21-20020a1c4d150000b029012e52898006so5806580wmh.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rALIGRiBfkY3zLGEHGN+z0aJ6zoBl9h/Q3t595VB0VI=;
        b=IbKVhu1C1PhwNnMaX8Kmb+sjm0Y890GztYm8ZJHOtTzkwt4BtuVta0YPjDM0nCusyE
         sQQH03XChu5FPTrv7IzIgM3/JIJhYBbqqEXhDTHx/hqxP/djL7EL18txQNawd1I4VHeP
         0Ryt6Erc+2RTPoIlzH0QiYxmv4oDWudHhMGEHQRLvOvrciUJeVBJ72JqmGkEAyXmNOT/
         JOsvl2y8JiRT9/CQAO08IZ3+/y/TylLRPil2pnPD2pwvbIH1lsMiyQrYLIFSHtfSgf4o
         BOp01bopP6NBZqmcGnxUL44LDwvWsO+oLHfBrX7sqP/xbqpoED0XarakuGdmY4pCtNut
         E42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rALIGRiBfkY3zLGEHGN+z0aJ6zoBl9h/Q3t595VB0VI=;
        b=SGGeTvBqAJoVenPWdjOM4qED4hsqgaxPK5ZOvSd3EjhrZayUxLqrthk+xKMRf2B0/C
         42McF23BHum79rqRZnnBXBc+7WdAqIjbAsr5z7JZPJAssCQxGfctCdCdI8y3TGArrXvz
         P+i+9DAwXQ1Vj23kiPuc2CA3m00LlEDHXeBEFKBrryVKrJH0hCgVpLiCdC32y2Itq25o
         Sp6D+Ar/J4ltnJpX2+2WrQjIjhJ1rKoLGWKnD1L86Je5ka+2Y1I8PQxAS2G0TvY4YRax
         W+BJwe77R9EVAimwqdV9fOraC5PbS8T52i4jncPTZo7xP65/8azAu39Zemavuz7LYl5J
         8hbw==
X-Gm-Message-State: AOAM532ZiUltdfyS4ce1MEZdGhBU87iosrN54TnwlHTpHkPVBLs+6gCP
        ytralFDhEtOzyUseuEXKJK0KsA==
X-Google-Smtp-Source: ABdhPJzLfgFXaydFM2Z3e0XnA/fXKcOBeb6LALR75pdfJDdq2sTVgiRCiTvNJRflVBrcT37N2Rb0Ng==
X-Received: by 2002:a1c:7315:: with SMTP id d21mr21899639wmb.155.1619475189766;
        Mon, 26 Apr 2021 15:13:09 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x9sm1756042wrt.13.2021.04.26.15.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 15:13:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/2] Enable VBUS current boost on pm8150b platforms
Date:   Mon, 26 Apr 2021 23:14:44 +0100
Message-Id: <20210426221446.1852572-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

 arch/arm64/boot/dts/qcom/pm8150b.dtsi       |  8 ++++++++
 drivers/regulator/qcom_usb_vbus-regulator.c | 12 ++++++++++++
 2 files changed, 20 insertions(+)

-- 
2.30.1

