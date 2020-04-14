Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A4B1A875F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 19:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407622AbgDNRXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 13:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407600AbgDNRXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 13:23:32 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968B8C061A0C;
        Tue, 14 Apr 2020 10:23:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 131so356537lfh.11;
        Tue, 14 Apr 2020 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRrYyXQg46xRoqmJ8FML2EKoxj0EcjNg9UzSVd5o+KM=;
        b=hiueGBkkLdKSSbi5XfXTTt994KiRowt4CtPMc31ckVOjo25feOSt1YYXe+qTrB4LDi
         jNfvQEqlrcmq1Ps06Yg2fgFtTX9NIzg/nFeKjH28cPk4yJjruxQtZ+uQdVvA9+Cb1wCa
         ubyLXYIddaJbWeqgDV3t9B7rPf4gXDj4tpjOFn/vgrZyLbudG0E0F+OIiS6g53gYqU+s
         viTtaL8Dkn4pg5X0Md1rgVHyAI41bIKzAOARnFgIPCgQZOYO64uOQi56BckYqNAILLb9
         vQkehwqoxo/7QC2lHTjNKp29o8fCmm3rbHBzWs948bACi2H3zJLuzMwRBw6dcTrUs3Wc
         anjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRrYyXQg46xRoqmJ8FML2EKoxj0EcjNg9UzSVd5o+KM=;
        b=A++lKAijsJRlb44Y262xBI20tLPd5aJQw01Y5Uls+arnQCpqCvy87dGFc32V1PK6Cr
         eyFVl+De8A91Ah/7/vHypFaibkh8AVo1qPdRlnaRw3//hq9SvrjNLpk1vhFhoHRl0kgi
         dTZUGQ50N5Cb/C7meVk2gdx6BP/ArRX0ZQQYvRf11ik+uUxqpbzPdNGLMqULwt6AtWAe
         hTU5mtkMHXSwfHSJ/YN3BBzgoVV3NtYJMsuniOs21gFx9wCvIJoDCJsW3fqnVm76ecPW
         Hfc7egTSSsY3O2e0yUEcaQcPDyAdst7ZEsVQtDv3RiZrdoblvM5CeUl19w1ENjypGftM
         RY8A==
X-Gm-Message-State: AGi0PuahYYNCMi75M+wq1QiymftiRXDPwct+/pwrGm+1moINbdqccjEY
        CyLrKUvYPQdJdZo1m9cuF2nF7OI0voEs6Q==
X-Google-Smtp-Source: APiQypIp3l9KI0s54qNwUlCgu4EaIoGTXSqRboDfsP19bPTqJOGlln8McKWlcgB4Kqy8FhIjAFtDqg==
X-Received: by 2002:a19:f610:: with SMTP id x16mr516833lfe.79.1586885008627;
        Tue, 14 Apr 2020 10:23:28 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id b73sm10746213lfg.86.2020.04.14.10.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 10:23:27 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 0/3] regulator: max77826: Add MAX77826 support
Date:   Tue, 14 Apr 2020 20:22:47 +0300
Message-Id: <20200414172250.2363235-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MAX77826 is a PMIC found on the Samsung Galaxy S5 (klte) and possibly other
devices. It is produced by Maxim Integrated and contains 15 LDOs a buck and
a buck boost regulator.

v1: https://lkml.org/lkml/2020/4/13/489

changes in v2:
- change compatible string from maxim,max77826-regulator to maxim,max77826
- reword DT bindings patch message

Iskren Chernev (3):
  regulator: max77826: Add max77826 regulator driver
  regulator: Document bindings for max77826
  ARM: dts: qcom: msm8974-klte: Add max77826 pmic node

 .../bindings/regulator/maxim,max77826.yaml    |  69 ++++
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 110 +++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  11 +
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/max77826-regulator.c        | 301 ++++++++++++++++++
 6 files changed, 502 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
 create mode 100644 drivers/regulator/max77826-regulator.c

--
2.26.0

