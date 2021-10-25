Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D8343A491
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 22:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbhJYU0z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 16:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235086AbhJYU0m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 16:26:42 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F49C053A41
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:12:15 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id d21-20020a9d4f15000000b0054e677e0ac5so16514647otl.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vA/CE8tf842bYqq8xkTI5gJmfVh7UR2D5fj0Mld4W6s=;
        b=HgciXcK1j11C3WxpCUFggFy42vlLBbDqPAH8m/VUMHP9glyYYXAF1orhW+CdfObMSj
         wk7G5OC+Fy79xi3J4Vn/owoj74VwCoxe9qNpy0vDODL02E0h9JBq8/r/n2IM087M9C1D
         fWjrkgvPJlroPmE5AvcVmR3axTOCuwMlOEyQta6+3t8rH8Hp7SXdixuHPLRZ3CUSICMz
         B5+Dt1UqbqXcVaEUPkqL2nC12A/dK0WjeFNsZtLSgUcdjyoNu4GnxDy9BF1YPxe9iJ+3
         t5WdSSKs3ufgvUsWXLVFOGP+Qq8Rkk3eMU6CXE4blXrlL4WE6EE75Qia9fo2K/JKRSOJ
         C8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vA/CE8tf842bYqq8xkTI5gJmfVh7UR2D5fj0Mld4W6s=;
        b=L2sfnQ2R6R2WZo4rONlT84HvvedcZzGRyeUcwlGHxNclAuIiBIAB5TOA4Gw/S/6o4r
         WRxAA/3Fj+uqSt57+vz4OhUVwotcpR6PFntvbAgLR1tdzUhNJ43pY60nTZAzzdeNrTe1
         3tOs/wYwfLD2wtA4W9r8HS+dxG/K+mpQnyZKLO+fuAQLjRYtATyhomswRKXIsy3cn7Yf
         7rmcQyPZCFIhn2pDbPpYwQ7hdizUm61iokQ/CEqQ/ff9m47UwsrCxICMtIcjtuPFxRUW
         2XDxNXV9kH5irZREqgu6lrF31ll5S1hYBb6UZRvnxpzOh9j3qiLfeWbnPav30p0znyHI
         qASQ==
X-Gm-Message-State: AOAM532vwSCLRsWqDSl08zE7m8sOBL7BfEn7Jn/Uw4RsBYFldnVQ8Ahc
        nUxizJJ355WOfob4x3xkvJSpVg==
X-Google-Smtp-Source: ABdhPJxq+gvESjkG+CE4IiqKiokANqUfFi8wFAY+fGKV2JBeSFGrVLYJWNB03zZZvt34VIw7q5yLzw==
X-Received: by 2002:a05:6830:1c64:: with SMTP id s4mr14998879otg.174.1635192734647;
        Mon, 25 Oct 2021 13:12:14 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id v9sm3822211oth.62.2021.10.25.13.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 13:12:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Amit Pundir <amit.pundir@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS one more fix for 5.15
Date:   Mon, 25 Oct 2021 15:12:13 -0500
Message-Id: <20211025201213.1145348-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry for the late fix, I hope we can still squeeze this in to make sure the
Qualcomm RB5 boards will boot v5.15.

Thanks,
Bjorn

The following changes since commit 1878f4b7ec9ed013da8a7efb63fed1fbae0215ae:

  arm64: dts: qcom: sdm630: Add missing a2noc qos clocks (2021-09-24 10:05:22 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.15-2

for you to fetch changes up to e091b836a3baee4c8b1423a969589196b88a9e06:

  Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss node for sm8250 target" (2021-10-25 14:26:00 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS one more fix for 5.15

This reverts a clock change in the Qualcomm RB5 devicetree which in some
combinations of firmware and configuration causes the device to crash
during boot.

Data on an adjacent platform indicates that this is probably not be the
root cause of the problem, but this resolves the regression seen on RB5
and will allow the SM8250 platform to boot v5.15.

----------------------------------------------------------------
Amit Pundir (1):
      Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss node for sm8250 target"

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
