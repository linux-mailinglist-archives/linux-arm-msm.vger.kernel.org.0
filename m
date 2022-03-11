Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258B64D64EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Mar 2022 16:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349432AbiCKPuh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Mar 2022 10:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348660AbiCKPug (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Mar 2022 10:50:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4FBCA97287
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 07:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647013772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qTfEf7yr9paJUlzwxSKVIzpRbR+ggiBcztvNLiAH+tY=;
        b=Chdir7Llre8Lys4KPWjRsF6ur6tSx7G4HZ3+qsCOZlyqaZL1rFd4SDBsg8ABNy+LQVSYLR
        Ri8YkgCSFYZEH9zn0J9he/kr3PXX4Edb6sdRrY/3eHwW4cKpX0DvEHetYPB7V248ukjiWI
        bJ7BIZFmwKEGQXHBlWVhF2nbkd8KCiI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-Z3me0w56M86HGyyLDNCRkQ-1; Fri, 11 Mar 2022 10:49:31 -0500
X-MC-Unique: Z3me0w56M86HGyyLDNCRkQ-1
Received: by mail-qt1-f199.google.com with SMTP id m12-20020ac807cc000000b002e05dbf21acso6752141qth.22
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 07:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qTfEf7yr9paJUlzwxSKVIzpRbR+ggiBcztvNLiAH+tY=;
        b=KiycdNSnQVE9CfsQhZIhsY7Q75DYkaXCR4n8ojrN5adD+W1RE2sy+DDBv89sc5MmsL
         YzKJ70eWwFbVJZxyrPVvuSIezrdvGC4xOo2vlv+EKSbeOlrWbhcv8su2C4CW5mun251D
         kMvbsqX3ITytw7wOr5uwGrb+Gwtj9BVPLRIrDYwpebFVEpPgeby20mCWSnlq3K6bzHCi
         K4qh9W+KrujJIDy/0mRv2VrG6GBj2+Jmbnv1LHCCaJVPFuWt8JiyJ6/0R0rH2CplJHxB
         EhHnDQTA1NNM9SunX07xFzbT6eslonOUQR6dRercn3u0t4aADoAVewkurioVTBB9s8KB
         kt+Q==
X-Gm-Message-State: AOAM5311+vPx1yt06cr0K/+OERTksKulFBrunbBp8ss6tlb4hTfkF1An
        yQLV1pwYSVALYBhvdW7BdTu5xEGgRvwGArLghCWS9Ia36Il33NoJA9ep4YAHmb5EoYRDJcFRkHU
        sU6BKo9j8kqdAHNKKb/nyLgDnHg==
X-Received: by 2002:a05:6214:5290:b0:435:208a:5fd with SMTP id kj16-20020a056214529000b00435208a05fdmr8244514qvb.66.1647013770722;
        Fri, 11 Mar 2022 07:49:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWg01x03AaRegxM1Hv5DU8L2U/TjmBjwQz2DtkoLyKiBE5QG0qlg6M5cwrZ/osbrpgVxDXBw==
X-Received: by 2002:a05:6214:5290:b0:435:208a:5fd with SMTP id kj16-20020a056214529000b00435208a05fdmr8244493qvb.66.1647013770479;
        Fri, 11 Mar 2022 07:49:30 -0800 (PST)
Received: from xps13.. (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id z6-20020ae9c106000000b0067d3b9ef387sm3602719qki.28.2022.03.11.07.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 07:49:30 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     bjorn.andersson@linaro.org
Cc:     mani@kernel.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] ARM: qcom_defconfig: enable debug fs support
Date:   Fri, 11 Mar 2022 10:49:19 -0500
Message-Id: <20220311154919.1797920-3-bmasney@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311154919.1797920-1-bmasney@redhat.com>
References: <20220311154919.1797920-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_DEBUG_FS since this is useful to have around.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 50e28a74c361..5cd935ee148a 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -308,6 +308,7 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_WATCHDOG=y
 CONFIG_QCOM_WDT=y
-- 
2.34.1

