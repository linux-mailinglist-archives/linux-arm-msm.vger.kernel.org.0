Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B98D643630
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 21:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbiLEU7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 15:59:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiLEU7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 15:59:06 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5241325C5A;
        Mon,  5 Dec 2022 12:59:05 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p36so16166991lfa.12;
        Mon, 05 Dec 2022 12:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPNFi5M94/IqI7pOWxoC968X74QQ2n1ZVdzxSZn9iNc=;
        b=FwgXn3xZhD5zRRqCMs4hDFdMz4tZrrxnPm7MttsWNyzhcWldTwt/80xEQZzeg3rdL8
         U8+u40YXQuv7hPhziqdh78CfTkFwsghc9LicQlgzUNM0VAV9CQj/PPpHC+U/q7H4I9gG
         J19k3bwTm3MJmrzOfec1jrN2i+4+XYrs+d1beDtWqNWH3hmz6+IObhp0Mo4ZRC8qR5xr
         xSD7ezE6nLaMO5CnuTNNaQsRNHFn8ksBKPRGpIFQRn1HCB5xxm5C4LRUQRGikqbQF42b
         QiKIA15Irwii6ntu65w8jXl8HiOSuInnedIF7p5kwEEbh8vihJrs39iQ2gOg/NvHOKUK
         f9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPNFi5M94/IqI7pOWxoC968X74QQ2n1ZVdzxSZn9iNc=;
        b=i/oE7x9/LxElS2lM1MkLPbKJy7T6Qtt47SX8WpyxLlopQwv/HW1/5Xi5edYLOLyMAX
         KyiIb6BtgXudIvymWJ0YjZUQI4tneMzTqqIS6x+6DhPUniQQUPnGMIT4yPEOuYKEc0Gk
         woetn23yNVC11VBWk57Hfglai29ammxVqzp1JM8BusJlGF9DEjFOU5AjUwPjycKcUtrd
         tcTHfRwC0YaH3TkwiA1Mu4jM+X7+8arB/DKCi58vH0XGr9DOX6ucbpIb4v4m4A2j0dX5
         l8PXBqgj7NMA1RZ6tmXBw08YQJZngn1Jpw/lsJHTe6Y6wra0rMyWT0pD6viGpmTYAhO3
         n9nQ==
X-Gm-Message-State: ANoB5pnYXSAkKKpWD2TFZkH/lz9qTIWoDuKa2rZXmXD5UcBfCwvBZvJT
        VTGUZ5sDMql3tFWhyzq7lQQ=
X-Google-Smtp-Source: AA0mqf4Y/QbR0gP0eR82q9nn+2ByZK5n5Nsf0nxr+rI4fSU1rzgBQrMqSzZ+AjqqJrA+GtXIe4sXig==
X-Received: by 2002:ac2:414e:0:b0:4b5:114c:fc4c with SMTP id c14-20020ac2414e000000b004b5114cfc4cmr12971797lfi.522.1670273943610;
        Mon, 05 Dec 2022 12:59:03 -0800 (PST)
Received: from localhost.localdomain (user-5-173-104-25.play-internet.pl. [5.173.104.25])
        by smtp.gmail.com with ESMTPSA id x7-20020a056512078700b004978e51b691sm2233948lfr.266.2022.12.05.12.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:59:03 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     konrad.dybcio@linaro.org
Cc:     agross@kernel.org, alexeymin@postmarketos.org,
        bjorn.andersson@linaro.org, bribbers@disroot.org,
        devicetree@vger.kernel.org, dominikkobinski314@gmail.com,
        linux-arm-msm@vger.kernel.org, petr.vorel@gmail.com,
        pevik@seznam.cz
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8992-lg-bullhead: Disable cont_splash_mem
Date:   Mon,  5 Dec 2022 21:59:01 +0100
Message-Id: <20221205205901.2248-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <2cf45767-7974-3b40-fa18-ec33db5d5ac2@linaro.org>
References: <2cf45767-7974-3b40-fa18-ec33db5d5ac2@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

> Is it loaded with this DTB or does it rely on ACPI?
It is loaded with this DT (booted from grub with efifb enabled in kernel config)

The uefi is just Lumia950XLPKg (link : [1])  with some modifications. 
It also contains code from SurfaceDuoPkg (link : [2]) that resets the platform, 
and uefi then reinitializes MMU (with a more windows-suited memory map). 
I'm guessing it could be the reason for the difference in behaviour.

Kind regards,
Dominik

[1] https://github.com/WOA-Project/Lumia950XLPkg
[2] https://github.com/WOA-Project/SurfaceDuoPkg
