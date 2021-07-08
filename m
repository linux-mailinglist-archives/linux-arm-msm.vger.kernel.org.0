Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2793BF343
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 03:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhGHBJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 21:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhGHBJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 21:09:34 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE95C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 18:06:52 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a13so5235952wrf.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 18:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oA9UOp+aOWbGt9gYRdEc80N/OPKEOFffXtxKbJLAR2c=;
        b=wyLdhZCIjYaXJmP5TWft/ImeGrmmumfMGTOY2oAL1I2qPvC5MolLEdmHhXVZ7N6Uga
         mt2XiTTOGXwtLCTwqisfg1KmJHO+WzShbk6aTL9TSdiOSmQewhkdOt/H3d5KOM14wfPN
         ThVvtkPVY9kA00fWRFagPmKmO4HMsapaogxi8di6UVzI3ne0V3OGF2KYrQ4xmC7pwq1O
         2rMpcsBm7hzBcwgqGdBwho2jJ0biSBLY4wgDyfiIG+iegX/kGN+HXzg+v4NiBnGv8p45
         9WnnpIlTB2gaa939A6Xhgjeu4N5QDeGf4pIutxN6ckxjmootwI8BE9QIKyULu9MKBFKr
         vcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oA9UOp+aOWbGt9gYRdEc80N/OPKEOFffXtxKbJLAR2c=;
        b=XZAQ7eTCCE1LNgSL6e5DKL1khS/PpQD5iKXSYNQGCPMQbW3mXQJje0IgG96uNSQqi4
         MuVGps/9BqM5o0JhVfh4vBVz++0K39tSMjyepYzXgWjz1YKti/D1secHYXezfK3uQBsc
         7W4VkaTOuNpiPXv1/D8kwrp6q/Usvok/1P5cofUuzL3QM6mKtixvaqV7Lj7Tlsh6GdDc
         r0YHNnTYclAHWrwN870zeR58YpZ7ouWZeBf5nMffMATywWxWl0sUwJOiD+JGzFiSrq7P
         EG/5M4PI7pawEO3mpneq5wIcJdj1o2KXB+Km5KyUWec+BQhbeBdtUx7TMa+cWU9YEh9v
         eHdA==
X-Gm-Message-State: AOAM530dVCcK8bIr/AM5khbTaRp+cDkFD7M88iQV/24IVcHAtApd5aXW
        7yEiJzBF9f7Fa/Z/g72b1uoysg==
X-Google-Smtp-Source: ABdhPJzQZ1h1H4ZiJjMyNURfXP6S7+QlSjHpBqDSA6OgeIjZhotk2zxO4/wNoxXIMAgvbXXeV2AoDg==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr31122448wrw.194.1625706410592;
        Wed, 07 Jul 2021 18:06:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g3sm537368wrv.64.2021.07.07.18.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 18:06:50 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 0/2] Fix and enable camcc-sm8250
Date:   Thu,  8 Jul 2021 02:08:37 +0100
Message-Id: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains two patches.

First up the fix, we are missing the mmcx regulator for the camcc-sm8250
block, so if you run minus X you'll find mmcx hasn't been switched on and
camcc register access resets the board.

Second is a bog standard enablement for the camcc in the sm8250 dtsi its
nearly a 1:1 mapping with the videocc node.

Bryan O'Donoghue (2):
  clk: qcom: camcc-sm8250: Fix absent mmcx regulator reference
  arm64: dts: qcom: sm8250: Add camcc DT node

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
 drivers/clk/qcom/camcc-sm8250.c      |  6 ++++++
 2 files changed, 20 insertions(+)

-- 
2.30.1

