Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345ED2F9582
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 22:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730246AbhAQV3i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 16:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730228AbhAQV3d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 16:29:33 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F41EC061574;
        Sun, 17 Jan 2021 13:28:52 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id y22so16179125ljn.9;
        Sun, 17 Jan 2021 13:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JHN448ie4lfoHdGU7Kihh3TQ8isAnLB0leDLe4VpFls=;
        b=i5lWv6gwm3PGlcuLhc9DzYxVC9hU4FjAXY8q3GwdQ/x9JMJXRH8A/iU/1esfYBAoIK
         QGC1yGPjitZHGUInJB7BUpJ2s/Pu8bE17W1JCZv37Tf/zY0jkHzO4Sz9LXnENz3L55QG
         R8MK31jght6Ot6uXi4rC3JfAKp5fFS2GrxtLcpceKDae7v5HH4W4vVwPeDLouwDqvqbP
         YT+09mlhqvheMPoPOnevHP1V5zH/u3Jjen6nZe1XIg+itz/eSgwJ5wF68TS0EreK7huj
         dWf3P1aNIwcuYbRRNHJ20z2i8dM/DhNudBNtHxiO4bluWkliUan3yJ4kEVUhDMMWTzAf
         lPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JHN448ie4lfoHdGU7Kihh3TQ8isAnLB0leDLe4VpFls=;
        b=Bw6+ak/oUxNsu3MX5Q3kzJmy32YJMyUueMf6w+LKyoNW3X+9+OdkFaKh1O0+DrwKaQ
         3DAJjAbB19VTgXa7CxaFHT3XYE8yw3BX5mm+Sd3m6iuKC+qXvWxbx5sxgO7Nmc4r8ow4
         rVswz0tPPugPTpADNd1H+AFfB+6D9ArUt90tiVRAWN37yVIDnPb/+358Hj4Ns2ZUGD5q
         nyZo0CeqmcUkZfktXAwvtogjPgJNUWWm8p/YdOZWlzxpR9HYq4W7F348ti1pFNP8uJ+l
         ODKrQJ9xfw37kzPvcK74DjtwHN85LwWxGE0mIAz424fXQZDJMq4qQ6QPlCJm+0li5jy6
         PUcQ==
X-Gm-Message-State: AOAM5301ip4Ahc9BjXWQI9Rj4X5NZdaD6f4i8uTJ2yenoIv9OeKoRCY5
        6Xm7Ws19YoGFI6tzUJjjUTw=
X-Google-Smtp-Source: ABdhPJyzI/2DMWJbg/+GIOI1ETZcCKHQW4Jo8YNBwC6yEfSWqY8Yb4qm04yi12TgD0eZsSkFbZgJkg==
X-Received: by 2002:a05:651c:204f:: with SMTP id t15mr9840691ljo.161.1610918930702;
        Sun, 17 Jan 2021 13:28:50 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se. [158.174.22.164])
        by smtp.gmail.com with ESMTPSA id s19sm1678858lfc.41.2021.01.17.13.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 13:28:50 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc:     Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 0/4] drivers/perf: Constify static struct attribute_group
Date:   Sun, 17 Jan 2021 22:28:43 +0100
Message-Id: <20210117212847.21319-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thie series makes a number of static struct attribute_group const. The
only usage of the structs is to put their address in an array of pointers
to const struct * attribute_group. With this series applied, all but two
static struct attribute_group in drivers/perf are const (and the two
remaining are modified at runtime and can't be const).

Patches are independent and split based on output from get_maintainers.pl.
I can of course split differently if that's desired.

Done with the help of coccinelle.

Rikard Falkeborn (4):
  perf: qcom: Constify static struct attribute_group
  perf/imx_ddr: Constify static struct attribute_group
  perf: hisi: Constify static struct attribute_group
  perf: Constify static struct attribute_group

 drivers/perf/arm-cci.c                        |  2 +-
 drivers/perf/arm-cmn.c                        |  2 +-
 drivers/perf/arm_dmc620_pmu.c                 |  4 ++--
 drivers/perf/arm_pmu.c                        |  2 +-
 drivers/perf/arm_smmuv3_pmu.c                 |  8 ++++----
 drivers/perf/arm_spe_pmu.c                    |  6 +++---
 drivers/perf/fsl_imx8_ddr_perf.c              | 10 +++++-----
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c |  2 +-
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |  2 +-
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  |  2 +-
 drivers/perf/qcom_l2_pmu.c                    |  6 +++---
 drivers/perf/qcom_l3_pmu.c                    |  6 +++---
 12 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.30.0

