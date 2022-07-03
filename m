Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B70705643D3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiGCD5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiGCD5F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:05 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF84B1E7
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:04 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id w193so8945043oie.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jXBj2zte+82Kd/PHFxKln46sR0S+3vMoDcS7kCmGV/U=;
        b=TA8jXCzUyYXtA3na/qjR2A2FS0kiVwQFNyHGRWAc+KgiCZcEefWNbXgtPc7wKIAPLE
         b71AQe3MXpobmjsP4m2fyUHNvJTGz8GUprXEPZ+FHAhyn2Rncc5xCYYeBbVSVG7UsrPG
         jTOzzS8+0wtZy3QWXluWcbdndrVpQQrlyS51n1diWycp7iropEHYiuD5xR3QcGX38li2
         TOQeGc2WlL77iK/gUazWcwJjfBWylLf7tk7P6h+DQRDaO+8RYVvR+jhEqdtfpjgV7IJg
         GpeJg/wtNxP/zrqVLRnxxsUL0sijzcdHT80ScxxcMutpaCjHJgZlGtWqPLFYh7gTnnX/
         y0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jXBj2zte+82Kd/PHFxKln46sR0S+3vMoDcS7kCmGV/U=;
        b=qkSH5+HYCuSZaJK+Rioa10SypMdPjkuvShza2AXpmXFDFIP6j44AcDsirjzqHdgWWK
         J40VuOyvNzESjukIBnrFCW6pfvaRhXAyo5ViFxFaa9ODuqjrBzMYq7QuyTK56eK47j34
         lfi/+vAP3slkXQw/6yzKlbwdNbtcuf9eavWy3/yQ8LVUo60hN2ymyo0XVq6itE3cFj8G
         j/AA5SiSoHgzg3Ec7nh3E9jCCck1brG96iR4BuoF1fRXPAe57tSovaqd5f4bIPbEbney
         3CgEjDcBvCblIGAXaZre1MOVdXX29Re5q+HvE/J6EiBvLebNLobiRdUeugAqgQoleJKs
         1Fxw==
X-Gm-Message-State: AJIora91D9QoPmj0+Nw0i0KCKDIYDRC6CuwpUrzcz08M9egc1gxBqgCk
        EjarKjf9k97veXODXBQnIoPNew==
X-Google-Smtp-Source: AGRyM1soH+NTEfJwNuUB4v0cA1/Nl8f2cLTU/tVz7heqXai6iHI0lZwGUaMIbd4X15JrzjFP1b7tpg==
X-Received: by 2002:a05:6808:1792:b0:337:af80:e140 with SMTP id bg18-20020a056808179200b00337af80e140mr2349846oib.240.1656820624189;
        Sat, 02 Jul 2022 20:57:04 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:03 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        agross@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 0/4] clk: qcom: msm8939: DDR and system_mm clock fixes
Date:   Sat,  2 Jul 2022 22:56:00 -0500
Message-Id: <165682055969.445910.13240091041676603649.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
References: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 4 May 2022 17:38:31 +0100, Bryan O'Donoghue wrote:
> There a few omissions/bugs I found recently which are worth fixing up.
> The BIMC_DDR_CLK_SRC command RCGR points to a value off in the wilderness
> and should be fixed.
> 
> More interestingly a number of Multi-media peripherals are defined as
> pointing at the system NOC for their clocks, instead of at the System NOC
> MM.
> 
> [...]

Applied, thanks!

[1/4] clk: qcom: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
      commit: 07e7fcf1714c5f9930ad27613fea940aedba68da
[2/4] clk: qcom: add gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
      commit: 63d42708320d6d2ca9ed505123d50ff4a542c36f
[3/4] clk: qcom: add gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
      commit: dd363e2f7196278e7a30f509a0e8a841cb763b14
[4/4] clk: qcom: add gcc-msm8939: Point MM peripherals to system_mm_noc clock
      commit: 05eed0990927aa9634682fec58660e30f7b7ae30

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
