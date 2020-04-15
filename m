Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8959E1A9300
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393499AbgDOGOy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2393496AbgDOGOx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:14:53 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8EDC061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:14:53 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id u65so1072870pfb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HqQvOKqfrHmlAX92Y682AdF2gTPigwd+5eBqOa7fcfE=;
        b=Df5prwBn+5ezXeOmd8ekPAfWpFczjY16mDdI8p+4Df4zHEeJNSIey/YUZdmd2ArmYO
         GJ1oVoj4lzgWnaT0TTHmdXzfvcNCHi8JCId35FXkwqW4c6dzhb5pzDKRlFYn/Feta8eA
         LH1ozPrQgPOZLh9V4iKOJYgXaPwQICXPJlvqRzRLOXatsSbHw3GX/6Uh7w8oV1ClQdLF
         TT5pLTY9AgC3hYk849f/1m9Dv1+RVIVPjnwPQN1Do+ftkAiT7Y7WaUIbowJcjq9UWnM1
         ytAgJ62QB8rA5bcgAaO2o8uYlbuvq1NjDprxzbFbzfktDHiTAlmzt9TpjJSNKJ1EMvz0
         bufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HqQvOKqfrHmlAX92Y682AdF2gTPigwd+5eBqOa7fcfE=;
        b=MDIOQix0ZmG5830J66GZpGgQqPjyQLyWkpaKcUTWt+WcVIy+Vt4Zm2hTo5ik2ZR7/X
         TUDesnQr4ghRQcQ2BHwyPFqTqwcfcrAFX76aaKiG42J1xE9YlZQNlhajyVW4y6t4Hyca
         19gdYA9lZVoPzhM0ZrJU0BcV455k9RintkcTqnXNkN9H6wIszLMhQi/G2JkIaOIgbLVm
         LGhScV8dec1QomZ1m/DmavbwDnzWN2W0BCMQsygrm7iZGEqklik3obZBOpgXE1JTqfJ0
         zloWQ4QSwu/juPTNEULJr+VXAahHwWrN4poMj5m6XwCniixIo2rbPF9ksPZ+RU1aPCzZ
         si5w==
X-Gm-Message-State: AGi0Pua/LsJKQaT6mJ6yGV2qPP1dA7b5G9LOOK2BcmBqk8ufnp04WPqR
        nSg7j0B8+VQ5SL1KhUClte0FQw==
X-Google-Smtp-Source: APiQypK4jsIQQbeIVh7i0t4TdFr1EvsteW6AJaD6lxkNT7mK5sIRI0rfopbstmRfzG2YOPYTpTb5HQ==
X-Received: by 2002:a63:e210:: with SMTP id q16mr24711275pgh.26.1586931292670;
        Tue, 14 Apr 2020 23:14:52 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e196sm2939332pfh.43.2020.04.14.23.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:14:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Qualcomm SM8250 regulators and UFS
Date:   Tue, 14 Apr 2020 23:14:28 -0700
Message-Id: <20200415061430.740854-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define regulators for SM8250 MTP and add UFS nodes.

Bryan O'Donoghue (2):
  arm64: dts: qcom: sm8250-mtp: Add pm8150, pm8150l and pm8009
  arm64: dts: qcom: sm8250: Add UFS controller and PHY

 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 351 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    |  71 +++++
 2 files changed, 422 insertions(+)

-- 
2.24.0

