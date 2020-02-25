Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB1B16C045
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 13:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgBYMIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 07:08:35 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:53002 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728913AbgBYMIe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 07:08:34 -0500
Received: by mail-pj1-f68.google.com with SMTP id ep11so1170542pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2020 04:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SX9C7ZPdxFmb0GlMBS8FC0FI8zrtThCVdwItF7qjLfw=;
        b=kjA6ZmUypj1HTXa94pZwT1LV+aMpSC/ydMHJTp+4q+7EG4FOXyv9INFTwKISt0b+sR
         +mJV5JIIHoFJ1f3kcrgqQyeEaYANDpG8oJd3L4pT5sJ4F/I0ds9vpCpr46TWyruzjVSb
         mYs3K4X8rs7aNqutA28nCMJUxq32XAMyf1+acFED/1cY/i/AIhDUxMobZGtpRqiSeP9e
         a17RztLLMJN/yS6+eRKQERjzDN9lXPi7R5TWZGArptDgtBQwVuD6VYoJGddV5B34zt2k
         HN2N4iFydeEBezXTM5W12mr5NceG5XLhy5v6vjWNGkKDHyPuuzq+TqCOySFSLCa7fiXt
         q0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SX9C7ZPdxFmb0GlMBS8FC0FI8zrtThCVdwItF7qjLfw=;
        b=oqIuxXXONS7DTlubQ9iTUc5Qs5YyUYl8xGSoYwfcI0idpp/jnauuqTS2rTIMJw+pQs
         sJwNsBfrGigzoSJ9bcSTR1vHcN9vegNEr5zZZkzAb9QULcNwsI/T9LDQNslXTRkrE/xM
         w65x3Kiu0Otwk7cMaBaUf7T48fp2SjJ1hoz0z62l+Lv3c+wfng5MKKLO5WooR3YgTbW1
         WML28Z4m8vegAGhumgjJPyFrWA3W8bDkXbYkVSE9gaaZvJzy7we1/qMBeIPPyySPV1xi
         YTrujsHsQGEmXXLL0btOIBpjaeYGmWR8Yo3EieVF/8nubpu0xdBp2gV18N188ITbRfh4
         zxnQ==
X-Gm-Message-State: APjAAAWaF2dC7YG4/JBBAWxsU9mdcO35wvTBWYCbe3szWyslQkrpncC3
        OlRaIcu5QHbDn15wlt0Y/tv99A==
X-Google-Smtp-Source: APXvYqyzTnMsiUNjG7S4OAApXWLWj1aNMDRVPTG3vQ+vG4st5HCB6AZCGVIId6V9JLkteFhP1wx4RA==
X-Received: by 2002:a17:902:426:: with SMTP id 35mr54061530ple.176.1582632514117;
        Tue, 25 Feb 2020 04:08:34 -0800 (PST)
Received: from localhost ([103.195.202.114])
        by smtp.gmail.com with ESMTPSA id t17sm9471387pgn.94.2020.02.25.04.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 04:08:33 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v2 0/3] Cleanup dtbs_check warnings for tsens
Date:   Tue, 25 Feb 2020 17:38:26 +0530
Message-Id: <cover.1582632110.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make dtbs_check pass for tsens bindings. I'm working on another series to
cleanup other DT warnings for QC platforms.

Amit Kucheria (3):
  dt-bindings: thermal: tsens: Add entry for sc7180 tsens to binding
  dt-bindings: thermal: tsens: Make dtbs_check pass for msm8916 tsens
  dt-bindings: thermal: tsens: Make dtbs_check pass for msm8996 tsens

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi                     | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi                     | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.20.1

