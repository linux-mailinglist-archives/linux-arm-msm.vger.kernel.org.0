Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D054A3DEAAB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 12:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbhHCKRN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 06:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235058AbhHCKRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 06:17:12 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4871C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 03:17:00 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id h11so27463453ljo.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iqd7quPL1WYvjaIscp231slV4CSuWpyxNWeRMDXfDYg=;
        b=hAw6QdSzz7ht2/95djyPnaSN1wPcm03tQEHPZQOhjkZZ06m0qLZQ44+PP6R246pz5V
         bh3TQU9CXAP/ndO+GRcOKItNNlFhNQd7ce1tHN+8S1CwQ16FXRlaCVXVKyw642eryo+y
         znsLS7rHYmSH1iJIkz9L5/LGSUHUaN3gqLuky/msFbV90u7uWMHDN7y3fuI5bWBEipiJ
         /cb4yxqU6EFglSuCPVXwmaXpHS76eMCIigJmzc1axzpFvM7ql93yXhgZEXRC7/nOQVcr
         ule8g+oCvCFPDCYgTnuivtNOaRBumY6ZCTt6n7MZ914wNIQB7MtScFYXK6Or/0gPINSo
         Kupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iqd7quPL1WYvjaIscp231slV4CSuWpyxNWeRMDXfDYg=;
        b=Pk/D6r7eRT9dA3zhUHk77ZAY7z1W4hVNIBYHvcGaErJI7q5+3KCPJDxupD+Q2nmHiw
         mbyIpRu2P21p5DH/jjp3kJYQ2jvFxiRJqQ6EFy8vE8g0SSo6wTy5nyVSPxifwrLxBXpf
         jsv2VK3+5uYP4qXHH/FkPkQ8ZQ4d7m+QXO6RUebQudMdAKSFAeNzDdXeFy4JrtL2eP1E
         OG2vtNiD9X+7QcazZFhMmuJ9G0kD4d6X9OI03boPOqXWWaGVbp2KDBqNqeFkO3VItrRd
         ou7x9jrO107oXcijNhNuxh6C1894L3h5Ct5y5My6zSdRxgcF3tB7rwt0Q8cgznvbniwb
         ka8g==
X-Gm-Message-State: AOAM533JKvRx3moLq0/EFewH8rUWE6eFa/8HImhvNyAjzSn0Q00hQA7G
        9jYmZebkAMkCW5gsjnINtXrnvQ==
X-Google-Smtp-Source: ABdhPJz+HsxrfCrKNjb3P8l6jxnieC81OoQVe1N7Ze95vFfOKAy8ODChxM+W81OweuRIvqqNwpPHxQ==
X-Received: by 2002:a2e:7c19:: with SMTP id x25mr2700834ljc.169.1627985819081;
        Tue, 03 Aug 2021 03:16:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y10sm1056692ljj.10.2021.08.03.03.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 03:16:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/msm/dpu: always use mdp device to scale bandwidth
Date:   Tue,  3 Aug 2021 13:16:55 +0300
Message-Id: <20210803101657.1072358-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In 5.13 the DPU driver was changed to vote on the bus bandwidth for all
the soc families, however suggested [1] dts changes were for some reason
not merged at that time. Let's merge them now.

If the bootloader does not setup the bus vote, clock might not be
enabled before the driver votes on the MDP bus bandwidth. Originally bus
votes were static and happened in MDSS hadling code, while now they are
dynamic and are moved to the MDP handling code, thus bus clocks also
should belong to the MDP device.

[1] https://lore.kernel.org/linux-arm-msm/04b4612dfd3f651ead068725409211a0@codeaurora.org/

Changes since v2:
 - Dropped merged patches
 - Rephrased commit message for sm8250.

Changes since v1:
 - Add dts changes as requested by Kalyan Thota

----------------------------------------------------------------
Dmitry Baryshkov (2):
      arm64: dts: sdm845: move bus clock to mdp node for sdm845 target
      arm64: dts: sm8250: remove bus clock from the mdss node for sm8250 target

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

