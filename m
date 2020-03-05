Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4709A17B108
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 23:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgCEWAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 17:00:23 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:36230 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgCEWAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 17:00:23 -0500
Received: by mail-pj1-f68.google.com with SMTP id l41so171544pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 14:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wfm6ayNE4wy/7YaGXfXadlkUakLeQg3UKTG0DwefcsQ=;
        b=QT3H37b0qfM0BSUCS6IVtLykGWqqs12NwaHzXe65aJ8KVqh/60M8DBrM7FyJRW0rql
         5pDuv+cDrRc3rD9aD8KJyov/+VKdOcCaDMvQeQ+w6uHcUlAKuD7E7x5ppqr09Yw2d1Gk
         ry6t6WkWT+3SNi7DuM8iFPhhMXfHwnIzulZsDbDDH9u5KFTarbPtzVrVmXjWSyFJj6ms
         R3r/uZuKIYaK5jP4tbWDXSvpE/HPjLxABNicOKeRduk2VdaZ6+qhSTSus+VtQsQn5Y+9
         DD/4UAs11DixjZsek6XOoxt004QwGw/aB3UcCUa3tw0cuXYBL35jqqrU4BjL/egARrW2
         yUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wfm6ayNE4wy/7YaGXfXadlkUakLeQg3UKTG0DwefcsQ=;
        b=iBQu7KV47dfd0Q07YGgdnEI7ooCAxxkq2jnPty4NJ5p3jDbo74zfkTo8JjY5xEEFH3
         lBGWtoD9a7s+fByTmj9WrcCR/CZTg5gi0xk0h+o+x676DK2Qn4fKyN2YcXOqm/tK2Ztw
         yjTvliWPegES58fFZdKGX+u1IBh5YmfkYsrE7Rm+P/lL6/1WSlpHpYQSZBorguzwhAKB
         yxdoOm5ixrZHWKufcZQ1d3QEl2M5ijxtxKvo8XN7TiIkq2avEPQ0hMkwKaqHqjkRlptf
         oDdzyCuSCST0jwz4iDfVvtyp5sq1BoAM363pWzzUB99N5A3SUBLl4EZQy9dfxcXIBOwR
         PsOQ==
X-Gm-Message-State: ANhLgQ321MUV60gRJGEoPkluq2l3lSR2tCfT911KyY3d04+QSzZ9aQrd
        LcPyqegRb0kJipQrMZ8Kvj8oNA==
X-Google-Smtp-Source: ADFU+vvFvGjwJ+dMpKZfLYrMZG2DVMlcV+NyLhGza5CGl9eZZCxGMx+E5rgekeNVYP8w9F+M+8bqaA==
X-Received: by 2002:a17:90a:c218:: with SMTP id e24mr233300pjt.64.1583445620935;
        Thu, 05 Mar 2020 14:00:20 -0800 (PST)
Received: from localhost ([103.195.202.232])
        by smtp.gmail.com with ESMTPSA id d1sm32233596pgj.79.2020.03.05.14.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 14:00:19 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/4] make dtbs_check fixes for cpu compatible
Date:   Fri,  6 Mar 2020 03:30:11 +0530
Message-Id: <cover.1583445235.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix them up.

Amit Kucheria (4):
  dt: psci: Fix cpu compatible property in psci binding example
  dt-bindings: arm: cpus: Add kryo280 compatible
  arm64: dts: qcom: msm8998: Fix cpu compatible
  arm64: dts: marvell: Fix cpu compatible for AP807-quad

 Documentation/devicetree/bindings/arm/cpus.yaml  |  1 +
 Documentation/devicetree/bindings/arm/psci.yaml  |  4 ++--
 .../boot/dts/marvell/armada-ap807-quad.dtsi      |  8 ++++----
 arch/arm64/boot/dts/qcom/msm8998.dtsi            | 16 ++++++++--------
 4 files changed, 15 insertions(+), 14 deletions(-)

-- 
2.20.1

