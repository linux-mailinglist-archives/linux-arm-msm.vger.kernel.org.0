Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13F127E107
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 08:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgI3G01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 02:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbgI3G01 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 02:26:27 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BB3C0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 23:26:27 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 7so433682pgm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=i+GbXtSN8OMkuM1fcRwI+jB0OKDXeyKPEb6yNFJorRg=;
        b=vskKHA+T4JIz3sxM16oEkPsviTZNtDB4dz9Q6N+RQLKlUWgmFptl0yaOEcjJOaBvAN
         Hh09RCrfdDekfCtyRNbVydeec1a9PCy77J9qrpL07ThIp8w2Uu8wytC/pwnJ2WRRHmDx
         aRtqXst4uZs0vxMRwX30KnN509HwiTPm1VZE6fSVZ8c5T/XcAIKOQK5VuhP9zf0+bfdW
         Ho2tgZ+bms+EElC/FpgSJBuk/XN/q9HUKKx8X5EBsjZ5nT628U5s1n6pjnk4LEJSDsGJ
         ZKHfl1aNE+N0x5CD4GZkJqOnhMByUgvWCmbXS+cuRgKR+clOoUUK1UK2vYWOvjsJxmjF
         R55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i+GbXtSN8OMkuM1fcRwI+jB0OKDXeyKPEb6yNFJorRg=;
        b=kmdNP7wjl3H1x8P1Z9nMPdVopaZct0rvgVRsyW+lztlZiInTXyD/1Zim/Igjy/jAEf
         XH4iXDaEB3TAwDInMM7hSxWSduOoc1CAER+WVCo/EwdkQ9pVwnE0Axond34tFZYMZagx
         V8cg8pr/SLOgEyCNev9YVQTfEwQmOIMyYA1tlJrLbzyQq0zJvETK092G5i9qkPlGJ5N4
         UN5pkQ5hf1pV+j4I+WTHaZhBymdzHFQfnVoEx4/EkiacSLgBnDk4El5xO/qLf1r2Afb5
         lJAw6wQkwQj1Pul/DGiyzNOCCCZzkAOnGTRkimk67HqRyHMVsmYlxie5cKygw6fV4Xfs
         ptPg==
X-Gm-Message-State: AOAM530iFslC42VOYXQlpg5mkwvgxQxS305J1G/JcDVSWifCGkQebvp4
        SrJNZ0ceDfQd5eRjZTiJxb8W/w==
X-Google-Smtp-Source: ABdhPJxbQjKvBx8BJfTaJgcRt6Zy56Vcv3Bo3V+sqxggPZP4iXy5EIrszbtXwBK12oBpyFF0G/5pNA==
X-Received: by 2002:a62:6490:0:b029:13f:c196:bb77 with SMTP id y138-20020a6264900000b029013fc196bb77mr1281983pfb.14.1601447185916;
        Tue, 29 Sep 2020 23:26:25 -0700 (PDT)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id t5sm772462pgs.74.2020.09.29.23.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 23:26:25 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     nks@flawful.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     shawn.guo@linaro.org, Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 0/3] Support CPR on msm8939
Date:   Wed, 30 Sep 2020 14:26:00 +0800
Message-Id: <20200930062603.29009-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support CPR on msm8939 with adding corner adjustments.

Jun Nie (3):
  cpufreq: qcom: Add support for msm8939
  dt-bindings: power: avs: CPR: Add corner adjust properties
  power: avs: qcom-cpr: add support to msm8939

 .../bindings/power/avs/qcom,cpr.txt           |  38 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |   1 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c          |   1 +
 drivers/power/avs/qcom-cpr.c                  | 366 ++++++++++++++++--
 4 files changed, 382 insertions(+), 24 deletions(-)

-- 
2.17.1

