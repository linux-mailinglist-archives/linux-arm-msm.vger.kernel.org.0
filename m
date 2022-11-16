Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72B8162BD33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbiKPMJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233766AbiKPMII (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:08:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819D22CDEC
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668600068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qXpS5ogY+quOVBSqhFr3jD7fUFESPhWtnRgSpqA/kiQ=;
        b=QYPYuRb20GOIQ3kfdzjAlm1WVJPqhrAyWBbMkEhhKDTy4LcZUsKz4yKQHSl0TjHLfBDFiE
        U/7nj0PkvNuNnOJNVJRa/cV8fAxuaBv/jfUSM4lSkqwYX/fylOUVIW8G4I5iAz8gfzjh7a
        +b7gtFMinVyqtuC0getY3izwJhWxB48=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-5rAZNVw-PpK-2qxbgZms2A-1; Wed, 16 Nov 2022 07:01:07 -0500
X-MC-Unique: 5rAZNVw-PpK-2qxbgZms2A-1
Received: by mail-wm1-f72.google.com with SMTP id r67-20020a1c4446000000b003cfbaa32cfdso307566wma.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXpS5ogY+quOVBSqhFr3jD7fUFESPhWtnRgSpqA/kiQ=;
        b=Jwv+Is25dlJeD4299YTtwkz3oQrbqIHfKywkj1gRqUf2vzUMxxL2q91gM1nRFlfVW4
         sjBuuf9L4tjgE14OZQcex4MKXPtIsNzyIGH/RflHiY0djjz+FY4V2m8s4p3EHCiynAvX
         uKAOIc/xDpshd1fOxlG0UZqNKlVjWbGSZyh+7y95HMw8ya5ue+PLz/BYvEv735EeWFB1
         AV6ZqNfTpUA9Qav1CN9DsPPdsf1iAoxi1xNdr0YuEXHnFZg8J7qx6TAcsvxEybjERevc
         ffTpXJaJPqwGeBLt25aE+3BiOm3O4E/24QKrod5ZK6rWT1h8q3wEHGy8SSvitG3+TXfK
         CnJg==
X-Gm-Message-State: ANoB5pn0zJFd0QcVRFSmZS6H8Rp9koA0I1c4GTUrJU4qaMvz+7Zlq25V
        oREFF+Vqu8oAhFMRmFQGS6gZYcmyzZzj4tCPhTZdzykLVDALw6fT2xKiIKbuVlJ98aASSam0mgo
        rSo481+rbDeF8IjXByBC6cIu87Q==
X-Received: by 2002:a5d:6752:0:b0:236:73b2:f026 with SMTP id l18-20020a5d6752000000b0023673b2f026mr13799520wrw.396.1668600066249;
        Wed, 16 Nov 2022 04:01:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JOT6/zsQCPAo4bnANXkeD6+Wah+l7xo5KbcAGf+Aw9JQb7E9QHfplxlEHsyJcBBgtA/Vxqg==
X-Received: by 2002:a5d:6752:0:b0:236:73b2:f026 with SMTP id l18-20020a5d6752000000b0023673b2f026mr13799498wrw.396.1668600066055;
        Wed, 16 Nov 2022 04:01:06 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id by7-20020a056000098700b002368a6deaf8sm15112370wrb.57.2022.11.16.04.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:01:05 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Saravana Kannan <saravanak@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, John Stultz <jstultz@google.com>,
        Peter Robinson <pbrobinson@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 2/4] driver core: Set deferred probe timeout to 0 if modules are disabled
Date:   Wed, 16 Nov 2022 13:00:43 +0100
Message-Id: <20221116120043.519614-1-javierm@redhat.com>
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

There is no point to schedule the work queue to timeout the deferred probe
if all the initcalls are done and modules are not enabled. The default for
this case is already 0 but can be overridden by the deferred_probe_timeout
parameter. Let's just disable to avoid queuing a work that is not needed.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/base/dd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 040b4060f903..1e8f1afeac98 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -350,8 +350,10 @@ static int deferred_probe_initcall(void)
 	flush_work(&deferred_probe_work);
 	initcalls_done = true;
 
-	if (!IS_ENABLED(CONFIG_MODULES))
+	if (!IS_ENABLED(CONFIG_MODULES)) {
+		driver_deferred_probe_timeout = 0;
 		fw_devlink_drivers_done();
+	}
 
 	/*
 	 * Trigger deferred probe again, this time we won't defer anything
-- 
2.38.1

