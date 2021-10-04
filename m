Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53F2421A8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 01:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhJDXYT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 19:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232582AbhJDXYT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 19:24:19 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E61C061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 16:22:29 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id e15so78362530lfr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 16:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y88jSQVnbJBOQYQ4AxCD943B/erEatCzVKFIFOSQuww=;
        b=NlwkumD8rqfvMouZ849F/ee6LWUvdKs/sAZNaFRj6REJukjsoJxBp32AFWIN7Zf/Rk
         IL85RvrJJD/NUxUf9B+8AlCR3HxpRAjBocAMePH8DLq7PVlajL+7v3PnOvwyM1Bf+J8g
         YTjApK3fqFB20XnINQuVB4PFwLp5BaKKzBYja8ejr4KQBOjjXkK7mJyoI/dV+2TD1x/U
         9IZDhfl/0i9/tsDEZ0xPy/eShhahH2CWT7mdeGAhXu80gENF3LaEfIfcEqyS+Snitonp
         62BpcZHAzmSp9gxhRaJolbOXYqRPNr9WI72PmH03BY0EL+qMmxlobqCu6TBmDP6uJgJF
         oszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y88jSQVnbJBOQYQ4AxCD943B/erEatCzVKFIFOSQuww=;
        b=OvTN+dPaPZkLPt80YqwtyNtl+kufjmLSNJJSgCzXBAzlXEkaVe48Ca8TLbUIngB7AI
         sJSKiV781hXA7WwcLk7o6SWNHSdjQLjUnjSz4McVpqXirqb0cUdXlTkDk3RDGVLJNkjz
         AXj6sg4uGaapIKCSp3I+cLYybxjB5qfvjCWoRCkzdwE1Qpx7hK938fHyYn4vVKNfEzXe
         Rtsrs1zeUaCLunL13JGnnr3Mj5RSmofbLV/kg4du9kSE37XKmJzjtsvTkq9Sf/1BEa2c
         XoIzdVXvqJxkMc2JKGBbm+NKuOkNHkeGQ/CkpFLWY/5xZ6Omfhy99aGb8dsNgKVeMjHG
         H3TA==
X-Gm-Message-State: AOAM531Zyd3lvVmlMv7gw4LgLpxgPthhFz/iCo6AmgVHGD1jpJiOlvhi
        agfSON+p4Ib8HI0ycAKmz51axbbt7hjMjQ==
X-Google-Smtp-Source: ABdhPJxKcYVxOuCYWUyFhWdw0qggcKyAXeGfIDGQyJhmbX7PJRBKWzGt1aB79wWah1rzcnAOGl1aUQ==
X-Received: by 2002:ac2:508b:: with SMTP id f11mr16258716lfm.318.1633389747792;
        Mon, 04 Oct 2021 16:22:27 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h23sm1786219lja.131.2021.10.04.16.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 16:22:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] pinctrl: qcom: convert ssbi-mpp and spmi-mpp to hierarchical IRQ
Date:   Tue,  5 Oct 2021 02:22:19 +0300
Message-Id: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In 2019 (in kernel 5.4) spmi-gpio and ssbi-gpio drivers were converted
to hierarchical IRQ helpers, however MPP drivers were not converted at
that moment. Complete this by converting MPP drivers.

----------------------------------------------------------------
Dmitry Baryshkov (6):
      dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
      dt-bindings: pinctrl: qcom,pmic-mpp: switch to #interrupt-cells
      pinctrl: qcom: ssbi-mpp: hardcode IRQ counts
      pinctrl: qcom: ssbi-mpp: add support for hierarchical IRQ chip
      pinctrl: qcom: spmi-mpp: hardcode IRQ counts
      pinctrl: qcom: spmi-mpp: add support for hierarchical IRQ chip

 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  | 187 ---------------------
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml | 177 +++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            | 111 ++++++++----
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            | 133 +++++++++++----
 4 files changed, 357 insertions(+), 251 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml


