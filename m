Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1EC64CEF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 18:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbiLNRrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 12:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiLNRrG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 12:47:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43FA27C
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 09:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671039979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MRU/7YOQt2xy6rWvIiu4YOafJ8TK5XKhpXf423rIVa8=;
        b=L/4qZDQv4LJghmqNw7XEe8U+TWPvjr0iEpfkbcDhbXoxKyhh8Fkgsj23nwVwhTM16LC0FL
        +JNGmJtMkkxw3kviP4XGv632DFl39ruY9rEkXbbHsE5PI44AF8KQs7WYTSgt281SiYveFk
        HQMNNq6okiyVLkkAc0RyDiQIhbOZOdY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-DolYIoRoOkay5pdNozN0qg-1; Wed, 14 Dec 2022 12:46:17 -0500
X-MC-Unique: DolYIoRoOkay5pdNozN0qg-1
Received: by mail-io1-f70.google.com with SMTP id o16-20020a056602225000b006e032e361ccso4274230ioo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 09:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRU/7YOQt2xy6rWvIiu4YOafJ8TK5XKhpXf423rIVa8=;
        b=kgawUjwtuX1+UKgAnrEsWgbfP4uLdRNuy2lj8NPqVK6mDdLd9s3u1lQoRHRP7femCe
         F+rurAjwGYrjlKkp8wiq+32NvQYw4kg6s5AXzoDOjeyCCnJ/Pea1pAZ2UA5TKQXdKhJe
         jjI/EPleO0llaJnm88vsibQlfXmTCh8JmhdsHIT0pegxQljRggTyXPvZgdv5kPs8SIUM
         VjBQWdz02Rlplhqyc2PuQUSJrjoI+1BT1Sm0PInHjvPyxazImBqvdtaShdmfrZGjXatr
         D8IQ7nA+fyBGa2h/vWDB6xHU/D2JrFOBZJ5WdeLOy3YrwcFCbVLHPbpTU7czJzh3vj/9
         DkzA==
X-Gm-Message-State: ANoB5pnP96CloZI0GBPYApDGO+f7Ytc0gkLlibIEZheyyWODqiYmmzpe
        22WydGvlNnMi34iOY0SBvH5QZ08sXUMDAYTNNC8P2+9KnQad4HGSzIE6P4GSZJeTF5i07beQy5A
        PD8t/URU5fiwaKu9G1gO5+w9++g==
X-Received: by 2002:a92:d644:0:b0:302:3883:e567 with SMTP id x4-20020a92d644000000b003023883e567mr12733989ilp.29.1671039977124;
        Wed, 14 Dec 2022 09:46:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4SQFXckK9/JRL6xKFoc8c9f5Tf7g8nePOQ32v8JjKhIjrT887ZPaM+qLxN/EXk8MQ3BE7Eqw==
X-Received: by 2002:a92:d644:0:b0:302:3883:e567 with SMTP id x4-20020a92d644000000b003023883e567mr12733970ilp.29.1671039976890;
        Wed, 14 Dec 2022 09:46:16 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id t11-20020a02b18b000000b0038ab4a09610sm1898401jah.112.2022.12.14.09.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 09:46:16 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     catalin.marinas@arm.com, will@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: enable crypto userspace API
Date:   Wed, 14 Dec 2022 12:46:07 -0500
Message-Id: <20221214174607.2948497-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-type: text/plain
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

Enable CONFIG_CRYPTO_USER so that libkcapi can be used. This was tested
using kcapi-rng on a Qualcomm SA8540p automotive development board.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..cbe4ed6403d0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1370,6 +1370,7 @@ CONFIG_9P_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
+CONFIG_CRYPTO_USER=y
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_ANSI_CPRNG=y
-- 
2.38.1

