Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 877DD770238
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 15:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjHDNuW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 09:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbjHDNuV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 09:50:21 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C264E195
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 06:50:19 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so20638095e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691157018; x=1691761818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcL/kSvHfHjHPWvRz7Xqp63rLeJznJ3srntvAjxHUlM=;
        b=ghNC6IH8SV+HCWCsb7VmU5W1wZSaMaMqKjthnnSnzGAWZOFQ9GtftdgHCZ835ZoNGW
         HWBlKckPtshVFe5WzT9mjg1oREwY5zdgpAr0Yb4p55zL1IgwfgeGAQpoD31FiFNutS3S
         EigcHI361jlBUZ21bQmCxKe+jv8FTHFHIUd6atL4IqIjYBoq5QCoL2Ccff0GAxxli+Hk
         lNp9vhlieo1VyRghBfGeTJO6D5HRCq93qgHTXWHiyUtBeFE9ypoUXmHRY6U7kjV7GEYo
         7ETi0wEipBIEqz0YjcJ+lXbtSFcPpkxVprrDX7FQMme8p+iZ5xp8IiMgjqsF/kMFqeaR
         B8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691157018; x=1691761818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcL/kSvHfHjHPWvRz7Xqp63rLeJznJ3srntvAjxHUlM=;
        b=YZocQLMaQ0yYubqFRw8z2/YjovtNL5zlsD7/WByfrrCRFp1WA7RpFvr2KCPyLxznWZ
         4yvjrdiZQxU40oZafBLd4LvJiJonvGu4Bb7qvFibQZbKkpP3bbbqxbBPuqRxN5oOIEi0
         WxxNeu3IRK8meUQ0eDqLxalwh/tSnfcEIwOPCqvw4BliqlQ8f8KN8rllTLvyIYk48FYI
         mg+1VzOImAGjvxMb2yZVMmcQaA4qfyBrPl+wOX5xMXulqAUsvLglGYqIjrLlCpeLmcMd
         i0HzXqcuQHyCrQHOec1CuNI8lP8dLQmpx06xpe1OEQqbkbc0AR4gFqcKt8BQMO1stwWw
         Y4qQ==
X-Gm-Message-State: AOJu0YzCbKkdUaZiCQ1EM5tQ5E54sQNGsj1GMrCJZk+jHM/5nDtEWfnW
        FwOBSzosNJmsmq6mTDQYJf+th2TXl5IjgL+3SFUt0g==
X-Google-Smtp-Source: AGHT+IEIOKn6UThmMtB9Tbany5L9GGNY+rYb5Vyy9mNXEpAUiYq17CHMf+MSiXUg4qh2FCQvr1yVNA==
X-Received: by 2002:adf:f091:0:b0:313:f957:bf29 with SMTP id n17-20020adff091000000b00313f957bf29mr1404835wro.65.1691157018233;
        Fri, 04 Aug 2023 06:50:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id u25-20020a7bcb19000000b003fe1cac37d8sm6894793wmj.11.2023.08.04.06.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 06:50:17 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/4] arm64: qcom: sm8550: retrieve USB-C port orientation
 from gpio
Date:   Fri, 04 Aug 2023 15:50:06 +0200
Message-Id: <20230804-topic-sm8550-upstream-type-c-orientation-v1-0-36dd3edec7bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4CzWQC/x3NMQ7CMAyF4atUnrFkGgoVV0EMIXXBQ5ModhGo6
 t2xeNu/fG8D5SascO02aPwWlZI9jocO0ivmJ6NM3tBTH2ikE1qpklCXcRgI16rWOC5o38qYsLi
 VLZojSA9fONMU5gs4VxvP8vlf3e77/gOGS5sFegAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cFLzTvuteabA2FCuM5q5Rad6hbL4oHHiHVTp6hkfiVc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkzQIXNkaluJaatUw5eFmSqGG4VQMX1T89BWw/+E6z
 Lkb9cDmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZM0CFwAKCRB33NvayMhJ0UzLD/
 4q/RWAWHr+nCRrstKyBqEA6weLQfNJ6S1CTjYjt0WL3brjTthaq5CjgH9l6WyafeWXaGVm0iyjVPC/
 mByYXJ3uYmGszRIVg5FamZbWZTVE7/DIUmM4NFPGiHWYtAdLyh9i896UtMMaSahlM8JfevNV1nNZAy
 PkIXUXuhJfe62UZNq49T+43g7oEF/qa+aTn9zjpC19pfUiYUlOK1/WVCU2Q8JotT0FWNmOd5Y0ysn1
 5dtvACYmdkM74c/RKhaBJOP1bNYYeQTDjPUjzIogA0v6a7UW/a//C4R0UeECNDBfUbCGeFiVqJT2hx
 L3hTI8tj0LnVtj0PlR4EAm1uMwBmxCSbHToQQX09PQxzYWfAUu/EoXyVKEOsZN9CG3ij781fIJjwc3
 VPc6ytxSET0MUvyjwhSvCQI6g/EKbmovLkiV32sZtYJS7zR7CGTbwaqudqlVQ90kcVVpvtQQ6bdXYj
 K3K39yzWoXRtc2faft2ATNNjVOd1jmohK6NlGIjq5KJtIbbUB4Id4rU4pRcJCVjOssPso83NKHqC7G
 q1UrFG/UXH+5av9g/jgO50zJUjJMTfS3Jy4Sj8gQFy38IXrDJn6qG0l3NkkdQts/35qn8TOjNMrIkk
 gXnJWFWo5W3xQlAjPpg9vehOfXK3M0tS84nRyplB40xPN7woGAP3X4UcCMCw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset is derived from [1], with only the GPIO orientation.

On the SM8550 platform, the PMIC Glink firmware doesn't emit
ALTMODE events for all USB-C port changes like it was done
for older platforms (like SM8450).
This means we only have a valid orientation when an Altmode
compliant device is inserted, but not for all the other devices,
including USB cables, dongles and non-altmode Hubs.

But the actual orientation is shared by the PM8550B by
a signal called CC_OUT which can be read on a gpio of the SM8550
SoC.

Let's add support for this feature by using the UCSI PMIC
Glink driver events to read and dispatch the orientation
to the USB-C connector devices on the DT graph.

While everybody would prefer having a proper PMIC Glink event
for an orientation change, this is not implemented and not
planned for future platforms either.

[1] https://lore.kernel.org/all/20230601-topic-sm8550-upstream-type-c-v3-0-22c9973012b6@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (4):
      dt-bindings: soc: qcom: qcom,pmic-glink: add a gpio used to determine the Type-C port plug orientation
      usb: ucsi: glink: use the connector orientation GPIO to provide switch events
      arm64: dts: qcom: sm8550-mtp: add orientation gpio
      arm64: dts: qcom: sm8550-qrd: add orientation gpio

 .../bindings/soc/qcom/qcom,pmic-glink.yaml         | 18 ++++++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |  1 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |  1 +
 drivers/usb/typec/ucsi/ucsi_glink.c                | 54 +++++++++++++++++++++-
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: fb4327106e5250ee360d0d8b056c1eef7eeb9a98
change-id: 20230804-topic-sm8550-upstream-type-c-orientation-0bbbb360d3f7

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

