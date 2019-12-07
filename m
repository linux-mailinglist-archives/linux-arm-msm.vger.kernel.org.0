Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB0C115E70
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfLGUWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:22:15 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34536 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbfLGUWO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:22:14 -0500
Received: by mail-pj1-f65.google.com with SMTP id j11so3050181pjs.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2019 12:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv9PFgxd+0ufyuR7A03LfCaab8lYp1IYh77BW2Yyv2Q=;
        b=sMdhhOEeF+9PHB2cISUhVxSv54pX/6w6qa3Pco8zbpZ74ZrDvyFmZ4O9n628qcD/p/
         N4DWKYO3/hEbax8NPH7mgct9uSiMkYXOmi4pX5SKP8cHuAirfbnlgdymWlW0PO2t0biE
         A/Mmz/RDlGAe8zv28mESWOQXD0RA7xbNaJ3toERYw9PVdaZjpYFxVISrePGOblhKiX/G
         El+LCTr3Oi+1lUe6dElaFkSVfsBtcUpXO5GLjK+UxD75U+KzzLQeEpLjgbg3ZcjPDZaU
         y5k94WsVzUEzFg/tWnB9Bv7A6qll93Oab/cAPEdaalbDhszP+mn3hod6HpwFeHLliDKN
         jC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv9PFgxd+0ufyuR7A03LfCaab8lYp1IYh77BW2Yyv2Q=;
        b=jTmmnzN6OzYe3yeyAuEgKNdWz+tpcLdaN5qLIEYoNyQC+Gww6mFfLfdyPLUbOUgITH
         VrzrGlvwDNGVN2i0BTiy50v0cKGo4aGoJ6A0GPRP2qpPTNAsmoRPkd5YhpDGB6xitI1K
         18aIS1ee4+OrtGIogXm/ORyiwOQbs1YdHd8/+TuVJhH1up8bY5FMH4NQttqN2ELTEhST
         dVqS5H4CYno0aV3SA87WgZGkBYzAmWn7pGbz22tChWNhBVGTKUMTjDNMMUfMr6T1j8gb
         GD+9IR8JTzPAu5/k/0jNA+SH2kd2UtOHv1/mWha3JeJXjcGEeU+ZcpNPJ8xNvWj0dF/P
         +svA==
X-Gm-Message-State: APjAAAUUfe0Ah1BNoRfcfaDiAAiyxvPlJh1BQsP9d4vOH44frFWluxwi
        38+iIrkIlnR1Ey4vgWRNbBLYjg==
X-Google-Smtp-Source: APXvYqwOnrQuvearhvCVS49JtKer/rXeakhDpM22xC6kF7PQKZFidEccTgLMHFoQWd0Yc84CRXNSqQ==
X-Received: by 2002:a17:90a:cb0d:: with SMTP id z13mr22886140pjt.111.1575750133903;
        Sat, 07 Dec 2019 12:22:13 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r7sm21969662pfg.34.2019.12.07.12.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:22:12 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, vinod.koul@linaro.org
Subject: [PATCH 0/2] phy: qcom-qmp: Add MSM8996 UFS QMP support
Date:   Sat,  7 Dec 2019 12:21:45 -0800
Message-Id: <20191207202147.2314248-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds support for the 14nm UFS PHY found in MSM8996 to the common QMP PHY
driver and migrates the msm8996 dts to the new binding, which will allow us to
remove the old driver (and the broken 20nm driver).

Bjorn Andersson (2):
  phy: qcom-qmp: Add MSM8996 UFS QMP support
  arm64: dts: qcom: msm8996: Use generic QMP driver for UFS

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |   5 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  33 +++---
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 106 ++++++++++++++++++
 3 files changed, 129 insertions(+), 15 deletions(-)

-- 
2.24.0

