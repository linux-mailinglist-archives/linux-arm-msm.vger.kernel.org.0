Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 855A2D4B2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2019 01:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfJKXsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 19:48:32 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42036 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfJKXsc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 19:48:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id f14so1534444pgi.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 16:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AmsaWR6UIYQFsskmsBUdb3fnHuvmiQm3ZQiAWL6V5Qc=;
        b=jllI4sbRj/cCNWxGttqdKesUD1HiYXaKIvs794DXXkc+PoCdkcM6erto6iQpJ2rVud
         8x8uYDcnaphLecfMmemcLRSW39ZOAsiY1fpX57AgoFA76OdqMj/YC0hmd4h+OiH4iynt
         jy7YCSb1g1byOhT7+4nEcBeBc9rVr9YUKFpTFGTtrTxVmTOlwQDIvcSmMdvAyNLBEniY
         zsaFaa8R6uL7KmJQMdTWGJv6LsPDDGctdIyqL7lENT9fX9FmOIFJyFBpld8huwIfhQDb
         LqKAHiLoKH5XlxH+7NG4g7NzAeUnTviUWArEsPTKSF7qeUbLlSAEJWfBAp78UEmB30Ps
         8Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AmsaWR6UIYQFsskmsBUdb3fnHuvmiQm3ZQiAWL6V5Qc=;
        b=pP4dx0lfPvp+HyoGb0+XXw7J7gfCrNCxex3XkxBJQRwhhjEXgA46TqhcQRd5Mj0sKY
         8sHulmX9nilx5dpq0FXo3wwUigYcD9XaKysCd4hVRtxOWOfZX8VmAqpTGUcfMGTRuX2H
         JDhzxJK3RtSpHKOYhedSLUO8CU1H5m08XOzZ7LcNkNEMfrNNVblrrHBrOon5623+0j5n
         p5tJATkPICtxWBhebpvEqfLE7QKUgOZeCer3PYyQ9ih+JyKTcL1Bo9Rg96QgT3YG+TRl
         M89UXUnx9yLB66S8Px530iwq2IDhi2jF4bugPk3cT1SjmfouhXcJz8d+RIGB5S+s7EYs
         OjLQ==
X-Gm-Message-State: APjAAAXJVdg7JwZOW9VRavZ7qOhZ5LRMtbDECMa/fWntTT8W3sTr2K1G
        WGRJrRr4Wrcr/hpPW1gdOs8dRw==
X-Google-Smtp-Source: APXvYqzQQMfZB/vfwkNtGeT6aWfRdgIU/ygvDWyu2BePS2QK+kJUi1HassUgKqK1qK042mIzuwELyg==
X-Received: by 2002:a17:90a:d793:: with SMTP id z19mr20089752pju.140.1570837711757;
        Fri, 11 Oct 2019 16:48:31 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m102sm8477015pje.5.2019.10.11.16.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 16:48:31 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm socinfo driver
Date:   Fri, 11 Oct 2019 16:48:28 -0700
Message-Id: <20191011234828.374419-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm socinfo driver provides SoC information to userspace using
the standard soc interface as well as a number of debugfs entries.

Enable this to allow certain user space tools to acquire this
information, as well as getting developers access to the information in
debugfs that is useful when reporting bugs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45e55dfe1ee4..a5953b0b382d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -744,6 +744,7 @@ CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
+CONFIG_QCOM_SOCINFO=m
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A7795=y
-- 
2.23.0

