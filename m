Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4690A370B73
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 14:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhEBMVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 May 2021 08:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhEBMVe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 May 2021 08:21:34 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344D8C06138D
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 May 2021 05:20:42 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id n25so3208941edr.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 May 2021 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erZ/hSW11kcsKCRUIcvxSo7XKXnXb+kosLOsAnmkOzw=;
        b=Ws0bt+uQoQN7Aluocnt+DgdjAWfSG1h6rZbzpSAxR5aUxp0ERuIT1boLotdE10yBnp
         4EUKg2dwLpTeQgubVTT55x3sdt0SeaYtS2LjY8XF2lekkxRECH3bEYn4df3fuXt6ZD9U
         lDcqMe+8FAm1i3rLcz94BlgqcsZo3SHVEugjEearoi8rWtFfFJD4qr+7mWg7K6xwCgVN
         l9cw/b5PQlVgEA9vjRXLQ3y7iYuFllpLa4YvtLKjBoyWBtupQo5FVWt9Q4yqkbQ50Fa5
         zE3P7ViieSoCXZ40h8hAZwN8CXfCO5ZaheEuH0UB5aqOwn953yvxEReaz9nBbHcIVOfm
         Czhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erZ/hSW11kcsKCRUIcvxSo7XKXnXb+kosLOsAnmkOzw=;
        b=tVTH6KunAj3YYW4U6IyGR5BS0YI0so06mbn8VIdjBsOBeYpqr9DT81myv86hN1+DyR
         zwUHHhHfr6JkOV9KTnpa4HQKyZ0MMv2Ku8Vxq/cDk0hrArEcC04NbfFqlHzaPhwMfIUR
         ihqfKLYqhV1gYakOaf5yMQSlmhCPtAaKsH42rRZdkcp4BtOa9yrbCDmVYt72aIhN+FlV
         QYMwcwIs18alBALeHVbf08vN0VRD/8BGUtbBGYSdh8XdqvV1jyLfsOPfSKNZKWRHUcgR
         I0trypkWpF9TvVsvAsRFsVZC167+UHGMGxRCh+bMhJ+QzyBitvEGPHjTawkZtenPKaNN
         zXOQ==
X-Gm-Message-State: AOAM530oV2l7hMHOthGDWXq7PKqbl73aFzlZZGX2f2XKKX03ks+5tDzH
        kC2aCUqnfmQIu+c670RtN0TzHA==
X-Google-Smtp-Source: ABdhPJy/A/Q/5vxcW51k03G3qPNBSej8IUlSSrS7fpXBaxvcyWoUAHUn79q6oRLgARpl0HpzT1BwfA==
X-Received: by 2002:a05:6402:b48:: with SMTP id bx8mr14981979edb.157.1619958040801;
        Sun, 02 May 2021 05:20:40 -0700 (PDT)
Received: from PackardBell (192038133011.mbb.telenor.dk. [192.38.133.11])
        by smtp.googlemail.com with ESMTPSA id p21sm10064085edw.18.2021.05.02.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 05:20:40 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 92da083f;
        Sun, 2 May 2021 12:20:32 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 0/4] soc: qcom: Add support for MSM8226 RPM
Date:   Sun,  2 May 2021 14:20:23 +0200
Message-Id: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Resource Power Manager (RPM) and RPM Clock Controller
(RPMCC) in MSM8226 SoC.

Bartosz Dudziak (4):
  dt-bindings: soc: qcom: smd-rpm: Add MSM8226 compatible
  soc: qcom: smd-rpm: Add MSM8226 compatible
  dt-bindings: clock: qcom: rpmcc: Document MSM8226 compatible
  clk: qcom: smd-rpmcc: Add support for MSM8226 rpm clocks

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 .../bindings/soc/qcom/qcom,smd-rpm.yaml       |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 74 +++++++++++++++++++
 drivers/soc/qcom/smd-rpm.c                    |  1 +
 4 files changed, 77 insertions(+)

-- 
2.25.1

