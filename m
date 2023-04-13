Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEE856E0E56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 15:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjDMNR0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 09:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjDMNRV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 09:17:21 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329C41726
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 06:17:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id k36-20020a05600c1ca400b003f0a7c483feso1072298wms.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681391838; x=1683983838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5fFOxM2M8ye7OTBHtbOgOjz+8frsv+eTncE5p8viM8=;
        b=T9BU71wavViVUYBMTDE+hcbRAc77asym97Q+vAZdeQ0/tt/SvQZu4WFosGI0lp1zDI
         /4ZUBDyrIVTMjE9tZRT6DXigjhxwaxshTBOZkuxX5shKdEzjR53fag+SEEJARuwGTak1
         Fpob0YAdn9wBMUDHq8H+x7isdAAo/tSUCRx2JSBbs51pOVNhyCvuJjH5fD2j180PtURV
         mwKhNEaZwq55CodUwD1Qt/2Y67nDCt5ZEmuWdTEOdLAtKhMzHGDQfKEGIsaAaomw+Hkw
         C/D67FQB/eQa9XS0sDhRSP74aOQwzSYh67IZLOFwQEOzY3eU20/cjfRnHK9OKBo2YZvA
         t/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391838; x=1683983838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5fFOxM2M8ye7OTBHtbOgOjz+8frsv+eTncE5p8viM8=;
        b=iuaWV2o9nidotZGcv0aXVZ/Y+G1BfbnEu5Mkn4/hrbx3Qimaqk/5DQZYoiWlyjYhml
         tiQfmjuagj5i5MmwwHvt+15mgzmc3nOFjEzsqyyiaSUIVKFAgBAFTGJXNiB/2FL2ynCY
         yEJm/iKIhnbfgZe/aKe7MYKqzhZsIw1bekA6uSbQjvQdWMnYE0PRyu6n18TNwpo/FCIL
         unZ+HxKoccAaZ9ZyPiDTLClm4W830L0wVrLZkzZv+O/l4A9fndKAa6GoG9yAbC+kUfQS
         7qgxgPXSu3Kh4fLME7Kog2+KptU8WOVPQ+GQzq3ow1YOODnpxbh1UfnwKE4nc+mknftR
         raHg==
X-Gm-Message-State: AAQBX9d9NedbIiSZsufEBp7OlLw4zux3M8YBoN8aGKEv+KjRb6w21m8Y
        NazcOobbd/I3roaDk+kHQr2nzg==
X-Google-Smtp-Source: AKy350YD+EK+uim1v734a2iSFmcFos4CRGtJzrjtuPy3971LpNkXMYN9/oHNtdckCkZvhe02C9ZFaw==
X-Received: by 2002:a1c:7905:0:b0:3ef:5fe3:c57c with SMTP id l5-20020a1c7905000000b003ef5fe3c57cmr1420333wme.23.1681391838576;
        Thu, 13 Apr 2023 06:17:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:814c:fc8a:da02:39ad])
        by smtp.gmail.com with ESMTPSA id v3-20020a1cf703000000b003f04646838esm1796400wmh.39.2023.04.13.06.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 06:17:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/4] arm64: defconfig: enable building the nvmem-reboot-mode module
Date:   Thu, 13 Apr 2023 15:17:03 +0200
Message-Id: <20230413131705.3073911-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413131705.3073911-1-brgl@bgdev.pl>
References: <20230413131705.3073911-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This module is used by the Qualcomm sa8775p platform for passing the
reboot reason to the bootloader. Enable building it in the arm64
defconfig as a module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e1063ab32658..5bdc9cede807 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -614,6 +614,7 @@ CONFIG_POWER_RESET_QCOM_PON=m
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_SYSCON_REBOOT_MODE=y
+CONFIG_NVMEM_REBOOT_MODE=m
 CONFIG_BATTERY_SBS=m
 CONFIG_BATTERY_BQ27XXX=y
 CONFIG_BATTERY_MAX17042=m
-- 
2.37.2

