Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B731353072
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbhDBU6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbhDBU6L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0D5C0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:08 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i26so9076406lfl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lh6tlwGlVgsjPbfd4aPH/Z77SrxX/auFbVs6qPqa7sg=;
        b=LwdaSBXvHjNJ55j9n67G0fDMnPv5DeXfWSEO2HnTWgZxyLimPHa+MAatCZxxyTmlYs
         vibw8//CB3Uz6m24al0XmoQa1CBaiUy5OWj2tYPkSphd9wJMOykZuUU/Qrnbe5T2IJfE
         /kAL8FqO1YueleLlMR5NDaXT23zTfLEuQ1EWTqVoDAIKjiu0LBAZiwyzZ/S6hefrh6qz
         JU1hG7uNQa8my0AcMUnVI+lG8TRvXvQn31yoS0GSKG64ufsS5mT0kSiuwaSFKdV6AGd7
         oJKpNltqOuysK+o593rc3l9ezrGXsEVWzj4EIAXnnwm9S6CBDBWZFtP3HQyKb+z3tfd4
         QnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lh6tlwGlVgsjPbfd4aPH/Z77SrxX/auFbVs6qPqa7sg=;
        b=ofPr2g+WROYGg9zZoMjAnKl+8DrWMK//DGzbp7gSSRMjt7HiTULkCh7Oqz4oIQ6y23
         xyU/PFVXEXLAA2ht/MaFM0t7jJzcp7d427BZS9EdF7kVuTETgPRUqvklKCfiIdEWHHIn
         Oi7GcTynpqgiDi01u2ze0fucsNQWi83Jz76SeP1bKHVPX0IODhtW1RXPn3eT3vxzOUxo
         Yp3OCR6JFt/9WptaCfsj2YfekVzAIXzEy52BHKIO0cvQ1n1qLJocTKiRV2D0Nagj287Y
         B16rS08B3aGPj3Ue892F7EQEzQGdBPxx9QGRCko6OI/7xrGwVgW/RHiq8gkQ+7phQyHj
         iAbw==
X-Gm-Message-State: AOAM531PgmyE0/y3fAPsAsHcYGGjeEJ7L+F1Au0I/jYi8NTGUvgYmXUP
        C6Bil5IwReGB74EnVvFrzO00LMgJM9qdRQ==
X-Google-Smtp-Source: ABdhPJwfwmuDegn+wMJPwNB5jKPfcAxb8qAssfftTChaKVyIr40iI+qiNYhybnujlD2Qs0zEi3AyTw==
X-Received: by 2002:a05:6512:c02:: with SMTP id z2mr10245023lfu.595.1617397087083;
        Fri, 02 Apr 2021 13:58:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 00/16] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
Date:   Fri,  2 Apr 2021 23:57:48 +0300
Message-Id: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cleanup several Qualcomm clock drivers by removing unused entries from
parents map, removing test clock, etc.

Changes since v2:
 - Comment out unsupported video_pll0_out_odd/_even clocks instead of
   removing them or just using .name for them. The clocks are
   unsupported, but mux values are provided for the future reference.

Changes since v1:
 - Remove unused entries from gpucc-sc7180, gpucc-sdm845, videocc-sc7180
   and videocc-sm8150 drivers
 - Restore video_pll0_out_odd/_even entries in videocc-sdm845 driver as
   requested by Taniya Das.


