Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6700E20A49B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436523AbgFYSOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407020AbgFYSNQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:16 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB3EC08C5C1;
        Thu, 25 Jun 2020 11:13:15 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id w6so6865104ejq.6;
        Thu, 25 Jun 2020 11:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wyyTfoYKUal+Im2XFp9aLfEoAp0H4cTyYoV6q1T4GSs=;
        b=cKNbPpYZkMPGKNjYYC/5Wr0d5HgXe9m0rOfLOWuQtlbUbx6x5A3BjgnCoP9VC2GfCH
         56Z32Zv3lT8II6SvnLv5PtHwYmx3X5rKRBC35oSvivonP3oFT8/3WOxrk47380nhKzdx
         NZ1Qeg90WSpl9lQOHj9SharKmnym8eUsGZWdiKrRSOtoQDp+B/YkmlCRqcYQu2+XPW89
         b+sUF6yv0vzYOz8Y0oa0iPpR6A/eDWOAWlIUnJLE6PfA7s7RXDyU1qHxeYGpgzsifm6Q
         C+zSHXfcKOF8TkonNwS9utmkpcY6/vfWL8SYXDlqHZdq0cdQIdcHEe0ewUG7Z1S3crJ8
         LneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wyyTfoYKUal+Im2XFp9aLfEoAp0H4cTyYoV6q1T4GSs=;
        b=XqHjchvK4SpBKUqAfckizsuE+F/CCz1yJWUSyVvxicNCcthexTm21cS249YMlTCe5T
         FDb6o+KKd2B9hz5UGxvxrYaDZLem4SnF2CkDOB7TeeUmdaNGs0xCd2YiHDinUP2c+fbm
         8aiSvMNlXVDzOXvolFb5XsVWIpg8oqPnwIr3iQhXCMBMuPbSkW4LLoslow0DgmgLEyE2
         3hbMQ2j5VgalOiHbgCmpnzhWik07SsOzT9tI8CUlGYZDDFGhrrEeyy+tYiOzdIAwGrYc
         hyxonFMrWfP+iABAmGMXuQxqRUdlWPBhWmazElxtF0J/vbPmJhJeduwTCZf8Ktbahdzu
         WIAg==
X-Gm-Message-State: AOAM5304KtBUUgOppEHPGCiglTETp3WG4M+sLYHg8XsRnmI5ahU2tc2K
        MW+Fz6/8mw682VM6uvEc19Q=
X-Google-Smtp-Source: ABdhPJyFL0qB4dqYmzJYms3J9dUCA7vTO3T6chZCbVWy26cw2gNhuRmNhDwxXstpLxPNuMObkM+Twg==
X-Received: by 2002:a17:906:3b4b:: with SMTP id h11mr6346796ejf.433.1593108794646;
        Thu, 25 Jun 2020 11:13:14 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:14 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] arm64: dts: qcom: bullhead: Add qcom,msm-id
Date:   Thu, 25 Jun 2020 20:12:51 +0200
Message-Id: <20200625181303.129874-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the property required for the bootloader to select
the correct device tree blob. It has been removed from
the SoC device tree as it should be set on a per-device
basis.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index 1061fd5404aa..4f70681e730d 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -11,6 +11,7 @@ / {
 	model = "LG Nexus 5X";
 	compatible = "lg,bullhead", "qcom,msm8992";
 	/* required for bootloader to select correct board */
+	qcom,msm-id = <251 0>, <252 0>;
 	qcom,board-id = <0xb64 0>;
 	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
 
-- 
2.27.0

