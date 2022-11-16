Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B8E62BCEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbiKPMDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiKPMCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EC02181
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668599650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YSf6lqgrQaBsJ/0K/DNRpP5ozpW+gGv/TdDdDL02QJw=;
        b=ESXN8108t9vb9Pdjorssxd1jv6AHgAq83K/Ep3cUBPMKo0SecWkyUauSZPlDlznnZJOJmp
        qlYZOeHjsZYzCNHqIp1F1Pxldgpmrfml30KycF6jSMV5v5h8phageyFxmvTgknr4IWsZTr
        IfFfIat/kD5zGD9gXRzy79sZQyUZJ60=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-dMEFYhs7MvCNi8UEMTFg9w-1; Wed, 16 Nov 2022 06:54:09 -0500
X-MC-Unique: dMEFYhs7MvCNi8UEMTFg9w-1
Received: by mail-wm1-f72.google.com with SMTP id m17-20020a05600c3b1100b003cf9cc47da5so9865647wms.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:54:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSf6lqgrQaBsJ/0K/DNRpP5ozpW+gGv/TdDdDL02QJw=;
        b=zWv7O/MSEqH7i3wPepTkIz5tBW8WzkCyCTSNKWO9rG56FG9HctAIKVjKsD4gooQjzh
         1bSs/YAnZw+ZlZtRRYatvQOz69jb6XVGESSvTGY+criCjEEyEH6QjBOQHJE7T10RIpMY
         mgbuBFtzJy5Vt/NE3asdoggYbnBUuRHqNYxI8f75+WBM0OWdOY3tesX+NU4hdVI8GJV/
         N5I3LxdFGoXenNb2ORXvmwOeM0d5PZhL47+Y8qBErgGvqPZJajdo2z4Ng3yVO/Y+udRL
         pM7ITKxOYlfjpKFqMRHjUgeGaaWUgtPPP23W/X7CbZg1ev1z/wjnxOhiDaloYwrDN9+Z
         1Jzg==
X-Gm-Message-State: ANoB5plsHAVkgwTddYDKXACuH2rn4VPlifWBGoI8EkalVhtX9XHXJmiG
        jo5Ou9xCvGnWzMNiKQp9lt/Ugo3aS/GHytWwxFg6OIfMK3x/gRRQZrFQdY3AM/IIY8ULU85UrDh
        f69XM6UDaYtgIZhSa6JXICBEZPA==
X-Received: by 2002:a5d:4525:0:b0:236:5d8d:630d with SMTP id j5-20020a5d4525000000b002365d8d630dmr13215836wra.462.1668599647019;
        Wed, 16 Nov 2022 03:54:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Erxz6YYsabeDSMLZkJtHfUkWBeL0vY3a8N5BG6vE2LmYE1UTkfZbnDw//T0xT469YGI54zw==
X-Received: by 2002:a5d:4525:0:b0:236:5d8d:630d with SMTP id j5-20020a5d4525000000b002365d8d630dmr13215823wra.462.1668599646828;
        Wed, 16 Nov 2022 03:54:06 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b003cf37c5ddc0sm2059939wms.22.2022.11.16.03.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:54:06 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        John Stultz <jstultz@google.com>,
        Peter Robinson <pbrobinson@redhat.com>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Herring <robh@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v2 1/4] driver core: Make driver_deferred_probe_timeout a static variable
Date:   Wed, 16 Nov 2022 12:53:45 +0100
Message-Id: <20221116115348.517599-2-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116115348.517599-1-javierm@redhat.com>
References: <20221116115348.517599-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is not used outside of its compilation unit, so there's no need to
export this variable.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/base/dd.c             | 6 ++----
 include/linux/device/driver.h | 1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 3dda62503102..040b4060f903 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -257,13 +257,11 @@ static int deferred_devs_show(struct seq_file *s, void *data)
 DEFINE_SHOW_ATTRIBUTE(deferred_devs);
 
 #ifdef CONFIG_MODULES
-int driver_deferred_probe_timeout = 10;
+static int driver_deferred_probe_timeout = 10;
 #else
-int driver_deferred_probe_timeout;
+static int driver_deferred_probe_timeout;
 #endif
 
-EXPORT_SYMBOL_GPL(driver_deferred_probe_timeout);
-
 static int __init deferred_probe_timeout_setup(char *str)
 {
 	int timeout;
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 2114d65b862f..50d0a416a5e7 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -240,7 +240,6 @@ driver_find_device_by_acpi_dev(struct device_driver *drv, const void *adev)
 }
 #endif
 
-extern int driver_deferred_probe_timeout;
 void driver_deferred_probe_add(struct device *dev);
 int driver_deferred_probe_check_state(struct device *dev);
 void driver_init(void);
-- 
2.38.1

