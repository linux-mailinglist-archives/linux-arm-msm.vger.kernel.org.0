Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18AD648D37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 06:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiLJFY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 00:24:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiLJFY6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 00:24:58 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B0413DD7;
        Fri,  9 Dec 2022 21:24:57 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id x28so10143490lfn.6;
        Fri, 09 Dec 2022 21:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gp2u14h0dnYSNhcfL3eNILAFSlGBrCZqmYzWKjZ3+A=;
        b=XOxh6XFDEu+b7+FKIte4ImHu252tGNYpf9imSmjEhbTO23txERGzb04HV8OFNXJ05b
         QAhVC4rlsWM+3eIKBS3YR5ib3w6c8oN3qQRbkwxhnG2nVDVlrSfZ+xOWxzxo0fsR63dA
         4+fOe6Uq+FZqpD+e+9lrgLOI0ek0aH1PU1FFP8fnipJ7yJtiPIlTGWG4ear/1XbN+Bz3
         OayMqwxDcSHTj9Zt04hyy75GdZSnLdlI0JwzJnEVCC72NQFklOzmczv81TDaBwqmNZjv
         1HHguXhcv+uggxGlOoWu0rcCLYb+rGZAgCedOukZ2fL34zqRjrmT6EExukUwyNwqO9NM
         heOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gp2u14h0dnYSNhcfL3eNILAFSlGBrCZqmYzWKjZ3+A=;
        b=aLgsTrmWAuFPEcTzPSj7Yebzmio8fehw5eED8PmJ+1JoAnNuMN12gXc9vTN/uYmoqD
         zai0sQln745RgE/sDAV/ceCfo+VhUZ07ZsLeUSffceOd6n4WdYY4VDPAxqwxG9Lc860R
         YH234oubaByGtY9ivUf1OvXeYo+T7nL/uXQQSww4r7FuDQBreRKQ8Mo44pjxwY3HHwzw
         XCqIIcNB+bOb26PbmnLAuPHYcc3H5TZzH3/hhk9EbRsgnhYdvkKwg3RcYadM65cotRRE
         U2RyYhVUDMLVBts7P57YgZ887DsrxS5K4JjGxe+ejXEyBHyTpUx8dLbwyJz1/tMwEMSn
         KnIA==
X-Gm-Message-State: ANoB5pncdX/vLsUnqHlzpUnOh4kJH6WEmqjbH43/Gv52trKPdb067Tgj
        +AuYqzjqiJGBGgv3S4ppXd0=
X-Google-Smtp-Source: AA0mqf6/5Dc7kI1T98sGYAP121BGY/V1iSHtQPEl/mcu/QL9XdOCU5jR5PfMpRg5VEEzacF/6PQnDQ==
X-Received: by 2002:a05:6512:1283:b0:4a4:68b8:9c37 with SMTP id u3-20020a056512128300b004a468b89c37mr3628595lfs.31.1670649896116;
        Fri, 09 Dec 2022 21:24:56 -0800 (PST)
Received: from localhost.localdomain ([176.106.35.163])
        by smtp.gmail.com with ESMTPSA id z19-20020a056512371300b004b4bab7d5a9sm572702lfr.46.2022.12.09.21.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 21:24:55 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     konrad.dybcio@linaro.org
Cc:     agross@kernel.org, alexeymin@postmarketos.org,
        bjorn.andersson@linaro.org, bribbers@disroot.org,
        devicetree@vger.kernel.org, dominikkobinski314@gmail.com,
        linux-arm-msm@vger.kernel.org, petr.vorel@gmail.com,
        pevik@seznam.cz
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8992-lg-bullhead: Disable cont_splash_mem
Date:   Sat, 10 Dec 2022 06:24:54 +0100
Message-Id: <20221210052454.314693-1-dominikkobinski314@gmail.com>
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

Looks like the reboot issue was caused by a memory hole not being reserved.
It's defined in the downstream kernel source (link : [1]). 

Adding it makes the kernel boot fine (tested when booted from lk2nd)

I'll try to send a patch with it tomorrow.

Kind regards,
Dominik

[1] https://github.com/android-linux-stable/bullhead/blob/android-msm-bullhead-3.10/arch/arm64/boot/dts/lge/msm8992-bullhead.dtsi#L144
