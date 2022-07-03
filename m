Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8375643EA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbiGCD52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbiGCD5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:19 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6FCB1E3
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:16 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id y77so8957076oia.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fRwOqQ/85sp5lF97lpgTtu23mAk2f8CqxwUWAJh8dkM=;
        b=VXcwvHIvIGG7yOoViwRjDZOGto0oviiZeaTaSJnzcSXUKOb2xlQ2Xf28U+q9u1P4D7
         cNBTvkzyNW/ak58Rd1q2z+dSgGrEkc9iTVMFaKPsb1eCPvKcogHT1eGegRUQWHFH43V8
         Okv1OqBJYMf5sPJgEQLxkWbPJuU0RtImLVe3x7EdGCixRUbrGXwMwOIoxaIdNwSFjfud
         EoWssrhgSpRWOkXP+snYu5lEldyJKW3jJmr69xmt6BPknKER3GsjsHQUtEDwMxxQyJKM
         QX6j7c1cXTIGBOtp5Rn0Q2L5BE2dbUcdKJ/m5WRIHXfk3anr6mEC8pbC9AT3ojEeZ2hw
         0CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRwOqQ/85sp5lF97lpgTtu23mAk2f8CqxwUWAJh8dkM=;
        b=RUQyBN+zCThdYm0iyUfN/CU1ZTXu9z6Gd3ShZVVWBej0Wiv6EniIQLbYvdGifg/cvd
         MEs0vAH53lMhFeqshjIRDy9eTvI68e57Q1IsAYMuj0HXxZvkXVSarG0GbNZMexgkBA63
         OYuN9gITIXI5Ir5Xit+NvETmduGdPpBO4BfaATwCU/OpjpupiReoMsy6F5rhknBNzDgi
         fsz68po036kzvxEAUp8h4H/Q7HJ2PirdAnpIU7zVnFXgMrmfqdxa9r2YfNjHXNPW/DVK
         sncLSNsViCLhJ0YCe30bojJm0B4hfP+9v1ZCbTMTv+BnrAtroWXoHTF5Q1fmHBV/jZrm
         vbNw==
X-Gm-Message-State: AJIora9TrL60w1iw2eI6qFVwke2izovlf6lLalybrhT66ZfHjcIDjDf5
        2oAMdjZUegJm8WQDQ7at2gA3zYNk5FUPiw==
X-Google-Smtp-Source: AGRyM1v8l9HsMp8ZvDlnJsJrod2ErjCqtAjExLs5GevL+iRU+k4XwVyO8XUovRbgGThCScRgNhUG3g==
X-Received: by 2002:a05:6808:1790:b0:337:aee7:ac78 with SMTP id bg16-20020a056808179000b00337aee7ac78mr2365267oib.21.1656820636118;
        Sat, 02 Jul 2022 20:57:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-sc8280xp: use phy-mux clock for PCIe
Date:   Sat,  2 Jul 2022 22:56:12 -0500
Message-Id: <165682055967.445910.2483056046671899758.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628085707.16214-1-johan+linaro@kernel.org>
References: <20220628085707.16214-1-johan+linaro@kernel.org>
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

On Tue, 28 Jun 2022 10:57:07 +0200, Johan Hovold wrote:
> Use the new phy-mux clock implementation for the PCIe pipe clock muxes
> so that the pipe clock source is set to the QMP PHY PLL when the
> downstream pipe clock is enabled and restored to the always-on XO when
> it is again disabled.
> 
> This is needed to prevent the corresponding GDSC from hanging when
> enabling or disabling the PCIe power domain, something which requires a
> ticking source.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sc8280xp: use phy-mux clock for PCIe
      commit: 9410fb940114444f37a0b787bd84077b61d76bf6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
