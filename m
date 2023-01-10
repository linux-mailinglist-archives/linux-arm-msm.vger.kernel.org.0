Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8ED664C56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 20:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbjAJTXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 14:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239577AbjAJTWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 14:22:43 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B901E2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:22:42 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so10903077wms.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUb4nZ/uid0GmXuvVy6M50G/1xeOw7CDnO6niaaqy7M=;
        b=IuNtwXfI8mddBSx07aGXfvx7Lh8qMn2QDhLaJlcTuENk7BT69QGnv7OgIZxKhC86xH
         4Dn9rISxjtcJOs3sF5wK2FKdKhmjFr+NKuohAmSPvL0iHJysxL+r+9is8y2+ySLhtKtQ
         Rv4oQeiKhOWnyH76ciMSPqmTSVOt/TviJCewMHqTQ1ObqDYXuSpLbV6eIRGy/BKaQUkt
         lpb4sD7tRNOUxF/4rZFwNMM0aY7gY9hYBub2CfaHf/+rjD2lhEsQPU8wFDJojUpz0k7g
         l3JtiqRThqdAmAYG3ALywjy1l7B35ilSU52wQix72b3fV6R35ThMkEBKpnmJtoJqCevm
         ckbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUb4nZ/uid0GmXuvVy6M50G/1xeOw7CDnO6niaaqy7M=;
        b=A6Kon23vz5MgPkKpIvB7L4ko+GqHCyNLmXpRU1LDxVp3A0JnJLQhm6VKVHDfw6XURs
         O9XAPzJ0DXbsWJWvoBFsdKT0lOWDsQ08Q26hGrM6xFVQUxwahZtKblh91itn1imN3N06
         FqH/vbz+Aa2d5KrxBcWHPYr67D+U91npME6KJ2/9i6DgAQQlX9Bia7l415ii77W3UWXe
         Lp32erCTaDSFV44ik4NzHOSlPEU4cseMFmNX7s0viXm6HfCokpMmy0KdZLLY0GyAFhAU
         +n4A4KYCI8yYVqKhEYNINrsE6cjN2D+jUG9J0mNw4FwLk53dUbHGz2gYX7z0kj9y6Ea9
         moKQ==
X-Gm-Message-State: AFqh2kqiqE4DL2YX0AuUAd2sdBiS63nKBpsMO4xajV0JBzHJc53RjUuK
        EmsOcjXRi/TtkRmSFzOESBvd+baKUQzvG9PY
X-Google-Smtp-Source: AMrXdXt8+PjvWuaGaWHUN3fDK/QIlRFrF+JmhC8vzNvn58zgR7YOe7VdolqnmQd1/FAC73P7liceAg==
X-Received: by 2002:a05:600c:54c2:b0:3d3:3c74:dbd0 with SMTP id iw2-20020a05600c54c200b003d33c74dbd0mr49808527wmb.13.1673378560859;
        Tue, 10 Jan 2023 11:22:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm22284343wmq.30.2023.01.10.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 11:22:40 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sm8550-mtp: enable DSI panel
Date:   Tue, 10 Jan 2023 20:22:36 +0100
Message-Id: <20230104-topic-sm8550-upstream-dts-display-v2-0-9fbb15263e0d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPy6vWMC/5WOQQ6CMBBFr0K6dkxbRcCV9zAsBhhgEmhJB4iEc
 HcrN3D53uK/vyuhwCTqmewq0MrC3kWwl0TVPbqOgJvIymp700bfYfYT1yBjnqYalknmQDhCMws0
 LNOAGyBaW6WPnNBkKu5UKARVQFf3ccktwxDlFKjlzxl+l5F7ltmH7fyxmp/9J7ka0ICEVZGlprB
 5+xrYYfBXHzpVHsfxBfoaCMvoAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree nodes for MDSS, DPU and DSI devices on Qualcomm SM8550
platform. Enable these devices and add the DSI panel on the MTP device.

Dependencies:
- [1] SM8550 base DT (applied)
- [2] MDSS/DPU/DSI bindings (applied)
- [3] DISPCC bindings (build dependency, applied)
- [4] VTDR6130 Panel bindings (applied)

[1] https://lore.kernel.org/all/20230106201047.337409-1-abel.vesa@linaro.org
[2] https://lore.kernel.org/all/20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org
[3] https://lore.kernel.org/all/20230103-topic-sm8550-upstream-dispcc-v3-0-8a03d348c572@linaro.org
[4] https://lore.kernel.org/all/20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Changes in v2:
- reshuffled properties in the order konrad shared
- updated DSI PHY compatible
- renamed mdss@ to display-subsystem@
- added back dispcc bindings include
- added Reviewed-by on patch 2
- Link to v1: https://lore.kernel.org/r/20230104-topic-sm8550-upstream-dts-display-v1-0-aeab9751928f@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8550: add display hardware devices
      arm64: dts: qcom: sm8550-mtp: enable display hardware
      arm64: dts: qcom: sm8550-mtp: add DSI panel

 arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  78 +++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 299 ++++++++++++++++++++++++++++++++
 2 files changed, 377 insertions(+)
---
base-commit: 813d028f81ae4e84926fbb9a499652539eb8694a
change-id: 20230104-topic-sm8550-upstream-dts-display-aa22b568ea17

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
