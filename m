Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E617D12D240
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 17:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfL3QpN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 11:45:13 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38665 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfL3QpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 11:45:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so33199795wrh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2019 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Q8etfoWT2jfX9dgh2kmChcjY+MdQxMMNc40Nuy8WnTw=;
        b=xWbR+AordFuc2u2uhpGUpRjkGvXmnY1PrIITONCIHgZu1aOftTzJ7zl4T7qQz1l+4v
         QeMzq5niJI1Zs0/PzH4O33klMIT40WAc8sZptVmLhZwsutb8HIlDiKjMIvpvr9lyOIS5
         VojZNC4T+pFMpT25Sge/EKqbSBiAO8PyWpHc9+/nVx1u43aW0lkEIMUqBTLjuCspdkIU
         3XlwM1rhrGEn4Y9CVrv6pVnK+bO0kRKnb4QqGoXPd/8/FqYfNFPLcLVEG7Tik94p7fEd
         gTnNfu0uv99D7R0dgi6kVJx7/Rs16a8Hp7wHBNnt/Jd4I9EedLGBwASarvVSHqRuOwte
         rdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q8etfoWT2jfX9dgh2kmChcjY+MdQxMMNc40Nuy8WnTw=;
        b=Yt9omRI63pBudft2SguqUmlOWPNVKHuXPBfNmBu+2THTPbYeygJaPLk6PF4+vhr0ZU
         hXbbTSRkyqBmpjkddG/gLC2/tX7X3L4y2ORYGVoiVa29WUTkgMnv53hCklObA0H0ahXx
         WUBIU7XYriyf5jJLKr5OQD8u38SW4eo+fwrIx30K+fFgmAfeN2sjv9LIsenw2zt9/fIC
         TCU15LS0nrRB64kKKmNaPQEIdITUPx3NNShL3mEkJ51wlEk+ytUR8owls7QfRaLbjDfe
         k5pJp5GJOss3WoOTCvKIKFNhU6m3jRcylHGqRjrU2osvHD8W30O2/AfC1dhPZ9EerwVo
         eG+w==
X-Gm-Message-State: APjAAAXnrsfSPAPvLgJ7O+2jndTZ7fWDJhSZ8coEKVLTaKbRNHhEv3yk
        Uohj96VoE26JdgLssGzdfJJrBg==
X-Google-Smtp-Source: APXvYqxkPXqtQkDMbYIZtRNcBiK8Q5WHw6zsX6XE0LPeA8O9OqNaU+QY9hCAC1d8XAL2xbkwRxrilg==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr67217505wrr.98.1577724311480;
        Mon, 30 Dec 2019 08:45:11 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id p18sm21508071wmg.4.2019.12.30.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 08:45:11 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 15/15] Update MAINTAINERS to add reviewer for CoreSight.
Date:   Mon, 30 Dec 2019 16:45:08 +0000
Message-Id: <20191230164508.28432-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added myself as a designated reviewer for the CoreSight infrastructure
at the request of Mathieu Poirier.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77f5d28fa84b..3051a3765955 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1642,6 +1642,7 @@ F:	arch/arm/mach-ep93xx/micro9.c
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
+R:	Mike Leach <mike.leach@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-- 
2.17.1

