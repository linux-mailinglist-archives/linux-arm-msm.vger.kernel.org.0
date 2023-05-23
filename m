Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4021070E3F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237047AbjEWQy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 12:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237841AbjEWQyY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 12:54:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F63FE5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:23 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f4b0ee606cso16554e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684860861; x=1687452861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oq9Gqd3s+SJNrU6CHwihpHO1isoOg9coA9EiJWgBpA=;
        b=AV469U7cbxVjaYCHKeby9/FwCke+WKdlXWoQ9Tc4ltPnpNP38Wl9TeBiULstNoAuOk
         UQ+D6J6/4DJyFKdcOHIrIuXpBsmKdj9r/phSIPehyrW0j+PstjTkXzUxmnavXALtrCCf
         OYCDPlfu+gIPh5NDoKgsg3UiZ1k7KrB5DogzqcLA+etqVOjpwYrxry8QKmIqKe7Vr1+F
         W3N7Iiz3cgQncvSN5vnqDPw3YKNYruG4ScJJ9NhZYJIXYvVdPIz/AGMufraZcSv+IKZh
         +2PTAGtsGaGgTQ1tlfBE+3aIh1RN2QCpetVS9IOKvB/+pzn90Dc1w+QwKt9ZuPj1LORI
         344Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860861; x=1687452861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oq9Gqd3s+SJNrU6CHwihpHO1isoOg9coA9EiJWgBpA=;
        b=bNoEEDSV6X0iDKvIsudNPEVWkh3FqCibK2LtwggmVloiEgrsKzYuq5S/aYhUc92uEt
         OtyVR5pT3FysjCmecqGNXzac8yB8AGgLUp0SnNCAWUPRgWz7m20EqYehaqYQhNcy4XyK
         ZeJCcnfvfWQLZUWAXGBbG5WkyWE2U0gNu0HzLdc/cNR+kW9TFhADqthD/D/uXCHhdi/f
         m/ogSuIH99XJCd5oTmBpgMBZsXJ8Ng9sN09rkEVUhVFCNe2XvY1cw4DF6XDIlYUaE/Pb
         PTS517NSV4M5vm04KR+eomBopoYa04acV1gLvR9mTz/cKz2XKK+yOMq9h+4E3we/dNqg
         N5Rw==
X-Gm-Message-State: AC+VfDwh1YmfvPUNnbHZlINHcsIElzrOGBrtFnVpa+ca2UWFg0IDKkMa
        of31po0LLH3pZbm2v5QK7doTs5qV5PHRlB4hmNQVFA==
X-Google-Smtp-Source: ACHHUZ4x2+C8MUQv6gcEgR7NM4F6LZyKh+s2vgitTxzf/n4NOmfn0CrRcBsR+dKyJa7Aj76gnmJdoA==
X-Received: by 2002:a2e:b533:0:b0:2ac:767c:fba0 with SMTP id z19-20020a2eb533000000b002ac767cfba0mr4960121ljm.2.1684860861039;
        Tue, 23 May 2023 09:54:21 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q2-20020a2e84c2000000b002adbf24212esm1695245ljh.49.2023.05.23.09.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:54:20 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/5] arm64: defconfig: build some essential Qualcomm platform drivers
Date:   Tue, 23 May 2023 19:54:06 +0300
Message-Id: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
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

It's discovered that a kernel image for Qualcomm QCM2290/SM6115 built
from a defconfig misses a few important platform device drivers, the
changeset enables them.

Konrad Dybcio (1):
  arm64: defconfig: Build SM6115 display and GPU clock controller drivers

Vladimir Zapolskiy (4):
  arm64: defconfig: Build MSM power manager driver
  arm64: defconfig: Build Global Clock Controller driver for QCM2290
  arm64: defconfig: Build interconnect driver for QCM2290
  arm64: defconfig: Build display clock controller driver for QCM2290

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.33.0

