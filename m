Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0FDD520CD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 06:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236578AbiEJEdC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 00:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236690AbiEJEbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 00:31:41 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D231FD877;
        Mon,  9 May 2022 21:27:19 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id iq2-20020a17090afb4200b001d93cf33ae9so1023615pjb.5;
        Mon, 09 May 2022 21:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4u/RzkeXys0EMuELTFpzcOuvMIBYe4ncU5xl9El+u4o=;
        b=lh6e00EZoQ+eTQpYgYU1qFSGjsvbjIEuoeOVnwDqoGbGxxQG0BdC9IBhQvOGscIgjA
         EDEo9YvAmkhED4LbYTn9KJTR7H3Sl7KO8PCe9UKbzKYE76nqs9qK2Grp/wlkI07Ew2ZV
         TxbPIWf6oe9dl7Ht7XdezDfLZMQwBJ2JqIX+DHgiguyGWC3FxLAMv0rO/5RPFQ4wtf3w
         KcJ4iK9HvoYFBPpRiV/6HOmaj9H9Xgyre09OjKa7X6nl7KIKfWL2SvQ/W9DUAtqXpFGZ
         hyEaEySqF2K79pm0ClB+C+nuqCsbr1/wczmYRqxwW/sMBhUvqVwNdE+mFgChR4d0VtYM
         ddyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4u/RzkeXys0EMuELTFpzcOuvMIBYe4ncU5xl9El+u4o=;
        b=KskHZSIQDtsyD5B2vvfsCHkx2GBGbD/xjC+2rgp8y9zsKGiNT5uVvrU7hhJmwQNa0j
         H+t8XlFeZhVRWJo/DjVkKra8LpZ5DhNl2zrvWFTsM7AGPGfLWLly6sjnQZ+47A0MBEB3
         DKagwBKkSImDLIzv12KR/ls955kHMUOxwt+VKXXVt7TtMfDT4/XBKAF+8FInQ037UVHf
         /5v32d2axItmnQyqck4ajHGtPbl8bLJ7ajg2RJ2Fvf2Rr3UZt0fMpybsA1ZBenWO9MVY
         /WV6STXHELjhX/lxUo4X6MRHCaQ7JXYu8/EQHMheQ5Qmbw+HRDMO3IigzraxbUhpHXgk
         QEsw==
X-Gm-Message-State: AOAM5305gI061fZsJBugrp570TnR3EtLugzBxI8E9bS8c+aSxx/+8oxw
        DaYxH65czgXubsKidnltnigpCY87O5FBnQ==
X-Google-Smtp-Source: ABdhPJznbQP8rceqpEitUK4xljll9kCPLkyWendrilqrLKk+iP0/GScYWhUPD/6FQn1fYqjZjIiD4w==
X-Received: by 2002:a17:90b:210a:b0:1db:cbc6:ca57 with SMTP id kz10-20020a17090b210a00b001dbcbc6ca57mr29635611pjb.69.1652156838989;
        Mon, 09 May 2022 21:27:18 -0700 (PDT)
Received: from skynet-linux.local ([2401:4900:33a2:808d:da42:4e61:10ad:478d])
        by smtp.googlemail.com with ESMTPSA id x4-20020a1709028ec400b0015e8d4eb2aesm741263plo.248.2022.05.09.21.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 21:27:17 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Cc:     bjorn.andersson@linaro.org,
        Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: [PATCH 0/2] remoteproc: qcom: Fix handling of WCNSS IRQs
Date:   Tue, 10 May 2022 09:56:52 +0530
Message-Id: <20220510042654.71152-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Due to a bug in the code that fetches the IRQs from the device tree, the
optional "stop-ack" IRQ was never used, even if it was defined in the
device tree. This also allowed a typo in the MSM8916 SoC device tree,
where the "stop-ack" irq was instead labeled "stop".

The attached patches fix the handling of IRQs in the code, and fix the
typo in the MSM8916 device tree.

Sireesh Kodali (2):
  remoteproc: qcom: wcnss: Fix handling of IRQs
  arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node

 arch/arm64/boot/dts/qcom/msm8916.dtsi |  4 ++--
 drivers/remoteproc/qcom_wcnss.c       | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.36.0

