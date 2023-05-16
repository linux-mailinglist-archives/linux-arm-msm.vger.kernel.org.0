Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785047047CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 10:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjEPI3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 04:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjEPI3O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 04:29:14 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284824C27
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 01:29:12 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f4449fa085so47946765e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 01:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684225751; x=1686817751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/ypdlKoJzYeteQaEdxqwC+GyLlhFe9AxiId8OT+9jg=;
        b=YoNqViKvzNmMhhCH+oiB1FQOuMBnr7xP9dkHfITqVLJhPuTk8wF33B+IztamIVkSvU
         Q3LTK+D69ddlGKbpvp0il8KfEZ7gqicQ1Kh2egq9NRsJ79Os9hLhAW0j3Gxyf/fFOHtt
         uXvbOphhHb6KPi2UyRK6JbyvclPKlXZt/PF/RKHEIVRpsRgB1sW8Js+fF0aUCOrLeTYc
         zcDM0O+Yjmyp0GiJJYwagRsLsDdpW1fnblN7ZPl0fWRQ+Z0rKxM0rMd8bodnIfwmfqUh
         4TscFK/rft71kUGBul9IRuWwpy28QVyTW+JNaNy7j/gC8/W1WIJ1BDMhGSEZBmwTvYod
         KCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684225751; x=1686817751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/ypdlKoJzYeteQaEdxqwC+GyLlhFe9AxiId8OT+9jg=;
        b=fpmwwOTL9w+pJGOMtmsp11ZOxjJElbPhpMgW82wB24Vi6TOApqF2cNxoq/SOppA7t0
         jvh7FqmmVypSo2pEBzlPAvvJ7G3Xv1cXirICMECfNcYBry+9u4l35p3jAy+bcTO7Ql0Z
         0VZz1DeKIUks4dG15LI8IinYY2/QFFS3COaEYX5EmXv/a31kcNgfwxcNrF4upr73gHy4
         vQNgGaGDAulKOWj7lymm+ALSJgPNsZNopnBXE/P3/19mI0I1qdTk/8BCBbSYwoMU0WO6
         G/BqjkGrEdAaMgT1YFmV8KaXBKd0MRSfQ0kZwAQ7fRIwldARoVQUnf6FngbwJJEljhSb
         o3gw==
X-Gm-Message-State: AC+VfDyiurH/oEXg4Z7IkXiU/r3ohiVqoYLHcOzncbV8Asii8Vz83Yt1
        3++9DtrynhbOhjUyNLttVyMn5Q==
X-Google-Smtp-Source: ACHHUZ4kkNBHq5+iZvTyaGaWiUJOUodv3eeLzUx/XoBAYWzqs3SUMm8Wabmz8Ntc7R9E6MxfLazK2g==
X-Received: by 2002:adf:e4c8:0:b0:304:8888:87ad with SMTP id v8-20020adfe4c8000000b00304888887admr28523576wrm.12.1684225751120;
        Tue, 16 May 2023 01:29:11 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id h16-20020a5d4fd0000000b00306344eaebfsm1753300wrw.28.2023.05.16.01.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 01:29:10 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>,
        manivannan.sadhasivam@linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH v3] soc: qcom: Rename ice to qcom_ice to avoid module name conflict
Date:   Tue, 16 May 2023 11:28:56 +0300
Message-Id: <20230516082856.150214-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following error was reported when building x86_64 allmodconfig:

error: the following would cause module name conflict:
  drivers/soc/qcom/ice.ko
  drivers/net/ethernet/intel/ice/ice.ko

Seems the 'ice' module name is already used by some Intel ethernet
driver, so lets rename the Qualcomm Inline Crypto Engine (ICE) module
from 'ice' to 'qcom_ice' to avoid any kind of errors/confusions.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v2:
 * kept the filename as 'ice.c' while renaming the modules to 'qcom_ice'

 drivers/soc/qcom/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 0f43a88b4894..89b775512bef 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -32,4 +32,5 @@ obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
 obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
 obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
-obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= ice.o
+qcom_ice-objs			+= ice.o
+obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
-- 
2.34.1

