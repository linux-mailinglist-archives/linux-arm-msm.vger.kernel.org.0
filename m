Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD630790EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 18:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbfG2QdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 12:33:24 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38348 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729078AbfG2QdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 12:33:24 -0400
Received: by mail-vs1-f68.google.com with SMTP id k9so41219581vso.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2019 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=hkKjlu5QjGs/T3e0RTvio/pt/qKYz2W25QWtnEmwNpA=;
        b=B5KEvVPs/R08nW/X8iJscPrmioD+SoELM7xRWLLE0Zm0kwBVrdY5pYjdN1Xuf2NBT0
         rS+xv97P7PgJRnFBFXBXRtPn0E6W8lS1Bco9qxudNc9iL/dKJ3HsHgSqpj2UYPRVsgN5
         ZGNl7/PVqT9L/ByfL+YvaOjXN5cBf1edMWfNbwx88NweWNrqOGBliZDi5RaOsuG9+12l
         SBAJLKE7nb5zTU6lJZRC6vzU0W/76o9x+TMm5WhF9A/8v5aDZpHxkhV0Q7RwkGSqUcKN
         3pib9KPjkAh42bgicvh7s95J8JLdISFwiVd6WK0YEk1m6YRIl+/h4TfD6cWh7joVYsGX
         zDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hkKjlu5QjGs/T3e0RTvio/pt/qKYz2W25QWtnEmwNpA=;
        b=WnqDVWUbmuJzDrRlaS/4n/wC8S7XmSJd4Qo3/AhUO/6kd0OiptDWBcxPDsB+QgJGru
         y5DxlwW2lvegeaQ6VTs5qXbL2uA5VQMuy0W+3bf+i0S7mQafZXpF7UQ8FpZT8bhsTGPU
         24g0LMOtaPLYUbpWiO3MUVAIvEqowA5heiE4B0ge6tqd8Zi1wZmKIj/1k9YRPOIlc8Lp
         CRymD3PyJd2UplvDFVYcXkIFoefsCFpucoofgRsiVb+G3O2jNxLRj36jV3tnoV+2Y8kP
         srVaAi4tA/cIHsHR507XV3HaonXUV17D7zczkY8mAHkgcpNRs//s5fQo3HGxMUTukmKk
         aL0A==
X-Gm-Message-State: APjAAAUEfxmfMN2uB6TBdJcUmVjaSRqbpZ6DimBwPQToyxh7vKYV76s1
        RR1MgCt576CEcvRnGX6TJiCnfJ0y4+4=
X-Google-Smtp-Source: APXvYqxb+t1CMrD4OgI0r5vaUyMz9p0pH+fzMZGSO+XV5OIRRL5VmlcXYTgTA0qJr0wh7Hy/R/B+PA==
X-Received: by 2002:a67:8e48:: with SMTP id q69mr24743215vsd.72.1564418002818;
        Mon, 29 Jul 2019 09:33:22 -0700 (PDT)
Received: from Thara-Work-Ubuntu.fios-router.home (pool-71-255-245-97.washdc.fios.verizon.net. [71.255.245.97])
        by smtp.googlemail.com with ESMTPSA id o9sm39762738vkd.27.2019.07.29.09.33.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 29 Jul 2019 09:33:22 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for AOSS resources that are used to warm up the SoC
Date:   Mon, 29 Jul 2019 12:33:19 -0400
Message-Id: <1564418001-24940-1-git-send-email-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.1.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Always On Sub System (AOSS) hosts certain resources
that are used to warm up the soc if the temperature falls
below certain threshold. These resources are
added can be considered as thermal warming devices
(opposite of thermal cooling devices).

These resources are controlled via AOSS QMP protocol
In kernel, these devices can be treated the same way as any other
thermal cooling device and hence are registered with the thermal
cooling framework.

To use these resources as warming devices require further tweaks in
the thermal framework which are out of scope of this patch series.

Thara Gopinath (2):
  soc: qcom: Extend AOSS QMP driver to support resources that are used
    to wake up the SoC.
  arm64: dts: qcom: Extend AOSS QMP node

 arch/arm64/boot/dts/qcom/sdm845.dtsi |   8 +++
 drivers/soc/qcom/qcom_aoss.c         | 129 +++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)

-- 
2.1.4

