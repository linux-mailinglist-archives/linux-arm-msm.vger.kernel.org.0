Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF86139BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 22:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgAMVcb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 16:32:31 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38993 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728871AbgAMVca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 16:32:30 -0500
Received: by mail-wm1-f66.google.com with SMTP id 20so11390745wmj.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 13:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4kF+t8rXPA54fVuTBRUcpKVz9sRuckZYn+ok89LwgHk=;
        b=nSSsL3wNKADjnYoswmrLAY+33jqF6r+FDcxlo9OsRnMJ0T2auZ3PrF/zdkrJRTqMjh
         4NjAAG2VGq+sigYr2NirFf6BWoHbykE5YxWw0qRNDdVeub9GIZwYq2Ln/78QBlxSK9wx
         Z42a8+t5qhJIOB2S6HSW/i7DMuk9DYXzdxxoLTSULPmd90pk3eiSEP9Fy+9otsl62awG
         ndDdw0a3l3Vf3J1k+rXSwlOBwtmRUMElt4jQhVVUedpukxuPFQGJs6U3GPshcBPSIrar
         +IFbtndDnSvyXfOaV8Jd7hj41R/5LsYiTEVUWfeXxDIUSNWWD9MqOZ1ZRyv4XFZdqPHa
         FHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4kF+t8rXPA54fVuTBRUcpKVz9sRuckZYn+ok89LwgHk=;
        b=TbNzj6dCOayIdwZ1RQxYXmJLCi+CVagQ0j+h/bdeAGp1dFmko+L36cqNvY8pT/e/aU
         u0byiA6lfC54ExjFdYU30iupYBusN0tAWFYrJYK0LIq5JfX136yiqbZV1kZG4Co6emvK
         wvRKIP+jLzcO1dRgdQntzCSz+bOVEcLq9gvRyK1k2UcWk4t2MmQUSg4O/wwDUiXdNxAT
         JW6RQfRSMrja5HbmHYjrG9u8T5AH8wWY8FALVv1E1TfRmmVStUV7O7A3MEb7lfsxgkdI
         VvXE9mi5D3fLTqtW0ukfyPq95W43HOJ3l6lMNEyyFM3nhM85wFy7LmgeJl8O2mI4jegI
         jUUw==
X-Gm-Message-State: APjAAAUGRoolaNY+CBeNJdmEsIS3W81aMniiGQfX7C1tLcqBFrXPE36i
        J2j9DNz8jT+239OdVavvJf5Rfw==
X-Google-Smtp-Source: APXvYqyTWc0+SVAQ2AospY4KCF9spziSZOcoE3VBHgOfx5hKYIhcnlE0z6vuyV/6QSBoTHI4qG3BMQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr23287336wml.55.1578951148810;
        Mon, 13 Jan 2020 13:32:28 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id j12sm16725120wrt.55.2020.01.13.13.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:32:28 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
Subject: [PATCH v8 15/15] Update MAINTAINERS to add reviewer for CoreSight.
Date:   Mon, 13 Jan 2020 21:31:49 +0000
Message-Id: <20200113213149.25599-16-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113213149.25599-1-mike.leach@linaro.org>
References: <20200113213149.25599-1-mike.leach@linaro.org>
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
index 14076468dd25..256138198bb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1644,6 +1644,7 @@ F:	arch/arm/mach-ep93xx/micro9.c
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
+R:	Mike Leach <mike.leach@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-- 
2.17.1

