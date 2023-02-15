Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE316976B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 07:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233532AbjBOGzd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 01:55:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233525AbjBOGzc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 01:55:32 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22BA34C23
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 22:55:31 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id b5so19368335plz.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 22:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dSwftWU2F5+UTSHoENK8S8rRksgligsrF8ZnqH0Z/+c=;
        b=r0GU0FrgvuWSrTHQzfjG7T0NncxujdbQ0vayQzl0RG+iWcYm0XQ1pCGHOUElYwhpOD
         BVGEiAy4SXWES9OG+dMRSUqiBXwOInbJ469hf8UCS0RffRJa/U/2rT15mwyWZh1V3fIT
         4/5luP93WoWkGiyFGEcJYGqgK+CWV9DzCREtoDuKwxdp1KZF1cpJdWpiSIpQiU4umUds
         ce4d3eJ+A715kaFGInuplLDo5LGUr1uCEHyJM+6ubsuL/sxvOmz6rbvy7V3b1d5rTmZb
         euBzUxJS6ETOOV/5N2Ej1o5Rfx7VmEPRSJufWZw+xUENqfGDB4nG3eqbgpKfa9pjz+Kd
         kPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSwftWU2F5+UTSHoENK8S8rRksgligsrF8ZnqH0Z/+c=;
        b=az/umitiHpRW3ld5KAPlCeUhHoeMFVAmzE+Y9UZbWSwvgT5iqR9IjpgauuDcKJWgta
         4JLI6SeKQfhb9N9EjM/a5GBI7qCJq2XCP6uRtDM8sAx59hNa9l2nDheHbifnK7X+2dKr
         PiQgKhfTK6kagzAEDZ9Haz7dI8U0DnjR7P3SAZlgwtnWRwrC8Z6Kcpy8wvbu1PeNCyiO
         B3hI0m+qkGUmVdDkFEILekHiK4mdOLioGitRAFYzwxGV7qJjNQOaevBBLZx84vFDylUe
         L6Sybw5VTowiSDaUljprbqTJ1nz7WdU3wNYnJf5XcnyJx9ae6gqR8Um+aorgUgu6MHVm
         y/4g==
X-Gm-Message-State: AO0yUKV0Ev2KFMGgS43NgTN3QKLfym3lihSVPjUfr/SGbXllGzkeN7GI
        wUzsta/hDEsEeOen7EOPOhgC
X-Google-Smtp-Source: AK7set9Y7ILgoFMCWGJJivuvjVaAZrV3BSCh8WD3upABWi2XyyCj6MlwbToqBqhkCzTY5DEe3y813g==
X-Received: by 2002:a17:903:5cb:b0:199:bcb:3dae with SMTP id kf11-20020a17090305cb00b001990bcb3daemr1023260plb.56.1676444131115;
        Tue, 14 Feb 2023 22:55:31 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.87])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm10276870pls.183.2023.02.14.22.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 22:55:30 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        viresh.kumar@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/12] arm64: dts: qcom: Supply clock from cpufreq node to CPUs
Date:   Wed, 15 Feb 2023 12:25:11 +0530
Message-Id: <20230215065520.5535-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

As a follow-up of [1], this series adds support for supplying clock from
cpufreq node to CPUs for rest of the SoCs.

This series has been tested on SDM845, SM8450 and SC8280XP based boards.

Thanks,
Mani

[1] https://lore.kernel.org/linux-arm-msm/20221117053145.10409-1-manivannan.sadhasivam@linaro.org/

Manivannan Sadhasivam (12):
  arm64: dts: qcom: sdm845: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sc7280: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sm6350: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sm8550: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sm8250: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: qdu1000: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sc7180: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sm8150: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sm8350: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sc8280xp: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sm6375: Supply clock from cpufreq node to CPUs
  arm64: dts: qcom: sm6115: Supply clock from cpufreq node to CPUs

 arch/arm64/boot/dts/qcom/qdu1000.dtsi  | 5 +++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 9 +++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sm6375.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 9 +++++++++
 12 files changed, 104 insertions(+)

-- 
2.25.1

