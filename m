Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D9C34B4E5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 07:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhC0G5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 02:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhC0G46 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 02:56:58 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8040C0613AA;
        Fri, 26 Mar 2021 23:56:57 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a7so11684165ejs.3;
        Fri, 26 Mar 2021 23:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BOSw1tqmVbtb8yDh/ufUk9oj9UN3uU1y/D/d/r+XjQE=;
        b=hDX2Au7MRPlbG0qfCV0T6ZwQLEjgfKs4h9lTRz/krkJ40YtOoavuMnPoYVvollXtA9
         jW60PQdqlm/6EAr46GAnKvvi2F64kjkEG8MSFoHqXcpD3yoHwdZWREXl1qEjFwochkKi
         x9oRQkYunecaNohdadANkByUFc3VL5pMJYxsB6s5KMdY9d/yZkG5c4C3oYkR7j71CuRH
         LkATtSba9Y0DQBZF56yyvt8kMfdzKjW/MNuPNqWGsunlJaQxs8++kmxK+1jjdszQ4Afi
         gno46sqGbrEa59YLQN4OCuRMV+7l6whE2Q0o4n3FdL0JLGd7FcGroBZZwiMyHF0kTdnb
         GlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BOSw1tqmVbtb8yDh/ufUk9oj9UN3uU1y/D/d/r+XjQE=;
        b=aef/U/QD4k34MaIfJMDv8KyBg8j1mm4ZryB62uOArMKLcZQgbGfa6CZmdp7TppBTZ7
         +aKyEgKDwQJOmIdWN0eoV/WlRaV1s9cJWqjNjqqSpgpJBgrgADmOAOMv3bkDG0vJU016
         0+HCSGT0e8lyuxeCU4avq7LJjOVmL1xaIxFY/CZW8C/vaEbzSZyb4Bn7pMsHi/bu6mLp
         9b5qHo2KvpKJnRihyREAfwJLyMoFBQTMPqLDVGP72Z8x6LEYYlsOP58B3M2b5qjxSzjh
         epzpX7c9yO3j4ql+CTyvYEoquw/JcINhEjoavU3QCDSfhda9mMP7xprRrJW34w7XsDy3
         Q8BA==
X-Gm-Message-State: AOAM531DZr8McGnIcumTx7VkcgyalCc/cadcdIpKhDL5N4SizPF18FW1
        bHFLJ080o4fRgplyzKPka3A=
X-Google-Smtp-Source: ABdhPJzL6AWJm00o2LASfnoXzc8f8EPEfZg9p5NrKwwr2R3Vb1kO5POMEQ7vlHKkdJZvDex7Ko9N7w==
X-Received: by 2002:a17:906:c0c8:: with SMTP id bn8mr18838784ejb.445.1616828216720;
        Fri, 26 Mar 2021 23:56:56 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2de6:9900:7d51:74f6:ebfb:3cdc])
        by smtp.gmail.com with ESMTPSA id i11sm4774005ejc.101.2021.03.26.23.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 23:56:56 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 1/2] MAINTAINERS: add another entry for ARM/QUALCOMM SUPPORT
Date:   Sat, 27 Mar 2021 07:56:41 +0100
Message-Id: <20210327065642.11969-2-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210327065642.11969-1-lukas.bulwahn@gmail.com>
References: <20210327065642.11969-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The files in ./include/linux/soc/qcom/ are headers to the corresponding
files in ./drivers/soc/qcom/, which are assigned to ARM/QUALCOMM SUPPORT.

Possibly, the file pattern include/linux/*/qcom* intended to match this
directory and its containing files, but unfortunately, it does not.

Hence, add a file entry for this directory to ARM/QUALCOMM SUPPORT.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 67b104202602..ec43d5c3a1a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2298,6 +2298,7 @@ F:	drivers/tty/serial/msm_serial.c
 F:	drivers/usb/dwc3/dwc3-qcom.c
 F:	include/dt-bindings/*/qcom*
 F:	include/linux/*/qcom*
+F:	include/linux/soc/qcom/
 
 ARM/RADISYS ENP2611 MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
-- 
2.17.1

