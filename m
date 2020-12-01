Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8332CA732
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 16:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388229AbgLAPiC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 10:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387672AbgLAPiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 10:38:02 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC7FC0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 07:37:16 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id x22so3822922wmc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 07:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1tdT9VkIaH9wWJpbxE5lJpDmELxG1sVxZZj9o9uu3A=;
        b=fIAyafuTplF29ELTSUubZtnC1Dyco6rIUzftoOb0UqSkgUFVmFCEURfWkTQ1A+3GRJ
         DQBxJqPptP/Nf9Ety2eKQKTY2hSnVdBl1RuGBL9rZHpCnav58Fs3NmqApk4zVvAI07Lt
         D+IFze3fa5mS+CKy35+rNPzCy3KY7ihbliGjjKRlGJzj5IFcjuxqj78Z7LmQMpLisXPX
         U0fFlB9UiHNHcmE8wefkQ0T9CTVNd99+QQzKdJojbdmBnn7RQqUp59FQhX0HUZqR3FNV
         B3/r7gBGIsVyG9gdMt7KWzr1qtd+ZBr4Gs4x8MUOh/23vGgkJzNEvOmHzw8hC7OC4rKX
         CU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1tdT9VkIaH9wWJpbxE5lJpDmELxG1sVxZZj9o9uu3A=;
        b=XUn306jzyDEHBcbAvbb+MqvrjWgb5I4pKDnKhK1b5tcWjw20ffxLcUrcPPuFj8InZe
         uVZqbQajU99OsRkvkmDu+plqabojl6BGPtp6nV5QBSy4CvwqqoijUqk5N003zpto3EM0
         v7gpIG9ZSHGE0OmvRgr9EPKwaElH3BSX3TW8+29TFomd79HgIVNKO1jywHrJ+3a59yGP
         W4KgqQOe+cHTmyxw4f4VLXrOhIkaijlHOehXuHblltbhcvA5Z4sSyyTPDTYe/1MdFGGJ
         OwVBxrwKMkwYr9ynFnCuW3Nic50uiwHjhQNOHxvReSdC/YK6RlciqCQDz0RPpWb7Tbvx
         guaA==
X-Gm-Message-State: AOAM531GQYwMUe+EYuogs8+uvTMaU3ebpcxdiPZBG7Ri+E50EsC6lXA3
        2LhC5unUi2qM9FlRmpGu/yxfOp1Roqba2w2F
X-Google-Smtp-Source: ABdhPJwIXAaeDJBvwMcw42rQ2vmRrhH0lyO+aKysIJbAeKzKRYsHiu/BePVKP1XpaPQj5dQxkkJ15g==
X-Received: by 2002:a1c:240a:: with SMTP id k10mr3190455wmk.173.1606837035050;
        Tue, 01 Dec 2020 07:37:15 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id y7sm302171wmb.37.2020.12.01.07.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 07:37:14 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/6] arm64: dts: qcom: qrb5165-rb5 audio support
Date:   Tue,  1 Dec 2020 15:37:00 +0000
Message-Id: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds support to Qualcomm Robotics RB5 Development Kit based on
QRB5165 Robotics SoC. This board has 2 WSA881X smart speakers with onboard
DMIC connected to internal LPASS codec via WSA and VA macros respectively.

All the audio related driver patches are merged via respective maintainer trees
along with bindings. Only LPI pinctrl driver is not merged yet, however the
bindings are acked by Rob, so am guessing that the dt changes should be okay to go!

Thanks,
srini

Srinivas Kandagatla (6):
  arm64: dts: qcom: sm8250: add apr and its services
  arm64: dts: qcom: sm8250: add audio clock controllers
  arm64: dts: qcom: sm8250: add lpass lpi pin controller node
  arm64: dts: qcom: sm8250: add wsa and va codec macros
  arm64: dts: qcom: sm8250: add mi2s pinconfs
  arm64: dts: qcom: qrb5165-rb5: Add Audio support

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 125 +++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 327 +++++++++++++++++++++++
 2 files changed, 452 insertions(+)

-- 
2.21.0

