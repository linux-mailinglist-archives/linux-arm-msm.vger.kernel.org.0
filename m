Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56CA075986A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 16:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjGSOd3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 10:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbjGSOd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 10:33:28 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D751E171A
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 07:33:18 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99357737980so953913966b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689777197; x=1692369197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v1Uf60tNTGfAfR1+MaSMHHKItd8uNKnfMyyizLcMis=;
        b=JxURig7FBAAC/3I9yT3aHiTqXeWWAq0k+MGxx7xZ1vdG66aZ7E/pUW+2Vufm3nF5nt
         PQRijfFThwLLN+R5vZT+cepzhH9bJqUTHAarRy2saW3hXq0sJ+TgQOkCl+S7betr+2r4
         I1Zsk8Y7AgA3q1gZu0RQooyDAQxZjPz6YNJQzKEERCq/hVknWzKJFTWLjFxbal365wUH
         higiPiWNIGJF2pPpBfQgRyGJaMGwb1cxsbX9puXisiBFXZQrdHTSdqFzuFAunWwO7ky5
         n2Ptixa7nFwWUw+pilJzQBH9JRPhhLbsxRKczXkhgBHDa0LDjyKeZ5DgA9xVDlY0EP/t
         jfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689777197; x=1692369197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/v1Uf60tNTGfAfR1+MaSMHHKItd8uNKnfMyyizLcMis=;
        b=XIOmeiaukSsJFWT1incgQsU9vYB67TaHMySrJt9cXooBuEdFSrl9CwhtvgchgA5EJ8
         1ludu7dvMJyCgsd6NaDkeBawaEQEu4R1sOhqGPUVdHgUJxwYx3UKqRWtur6fK8LRsYWn
         qPiGyy9C5qTYe9RY0oUHqJS/K33rW0+ZMmYE28g37vnTY1cjmtzmVfcIHpLw6/JUuwKR
         kigoRjlwA/4Uh878I4u3skR14NlfhiBElWdWIjvitVhnIRiiMC4d8w7B9ojwg9+X1Y6U
         DWsywxIyS0YBBbgv7InDYbjifLNUuUKArZihR8kymbY4IrOt2VTVwfMs3TslzhtFAmho
         LTWg==
X-Gm-Message-State: ABy/qLbksu7IIxl+lSLUlwUx+u+VacQDOg3QVllw9zgkV2Eemh3O0Nd5
        MRm3gF+rUWddSEwSYcQYQ3UuaQ==
X-Google-Smtp-Source: APBJJlF+JcEt0XZP2Tw59JukE7GuYig+Z35mtFzxo15uZB8/KXGNf8iKMl16iFRTuItUUfVn/5VsyA==
X-Received: by 2002:a17:906:77cf:b0:993:d47f:3c84 with SMTP id m15-20020a17090677cf00b00993d47f3c84mr2864253ejn.7.1689777197337;
        Wed, 19 Jul 2023 07:33:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906374900b009893650453fsm2454597ejc.173.2023.07.19.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:33:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, arm@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/3] Documentation/process: maintainer-soc: add clean platforms profile
Date:   Wed, 19 Jul 2023 16:33:08 +0200
Message-Id: <20230719143309.204766-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
References: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some SoC platforms require that commits must not bring any new
dtbs_check warnings.  Maintainers of such platforms usually have some
automation set, so any new warning will be spotted sooner or later.
Worst case: they run the tests themselves.  Document requirements for
such platforms, so contributors can expect their patches being dropped
or ignored, if they bring new warnings for existing boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v2:
1. Add Rb tag.
2. Implement Conor's feedback: change doc title, follow->should follow,
   minor style changes.
---
 .../process/maintainer-handbooks.rst          |  1 +
 .../process/maintainer-soc-clean-dts.rst      | 23 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/process/maintainer-soc-clean-dts.rst

diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 9992bfd7eaa3..976391cec528 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -17,5 +17,6 @@ Contents:
 
    maintainer-netdev
    maintainer-soc
+   maintainer-soc-clean-dts
    maintainer-tip
    maintainer-kvm-x86
diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
new file mode 100644
index 000000000000..c460923f39be
--- /dev/null
+++ b/Documentation/process/maintainer-soc-clean-dts.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================
+SoC Platforms with DTS Compliance Requirements
+==============================================
+
+Overview
+--------
+
+SoC platforms or subarchitectures should follow all the rules from
+Documentation/process/maintainer-soc.rst.  However platforms referencing
+this document impose additional requirements listed below.
+
+Strict DTS DT Schema Compliance
+-------------------------------
+
+No changes to the SoC platform Devicetree sources (DTS files) should introduce
+new ``make dtbs_check W=1`` warnings.  The platform maintainers have automation
+in place which should point out any new warnings.
+
+If a commit introducing new warning gets accepted somehow, the resulting issues
+shall be fixed in reasonable time (e.g. within one release) or the commit
+reverted.
diff --git a/MAINTAINERS b/MAINTAINERS
index ba5e7344f30e..a70c32790427 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1573,7 +1573,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
-F:	Documentation/process/maintainer-soc.rst
+F:	Documentation/process/maintainer-soc*.rst
 F:	arch/arm/boot/dts/Makefile
 F:	arch/arm64/boot/dts/Makefile
 
-- 
2.34.1

