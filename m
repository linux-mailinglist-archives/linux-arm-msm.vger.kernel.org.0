Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6316255D4D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241018AbiF0UEb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241027AbiF0UEF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:04:05 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87B61CFC0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:04:01 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id t26-20020a9d775a000000b006168f7563daso8173622otl.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uvASVoyRie75/d1IF4UsXjOW/g7ubfd1N2Ai2wysIBE=;
        b=EbZil76lM8Fm2VjbtaHTxvOA00cxzifKm1oZjLzIFEv2akxaz9esTJjR42hcS51f7+
         zPkAhUGWhAk25O0p4dVVFZWr6lL4TazbF1LrOhE4arBZ6hLuWfpEI8FW1oTfSzlfvfvT
         k4RdfRi0h72QCLWe9ZuoX5I+FuWTJxvSjg4BpDD1TXBqyUhdzwgpr+P+tNL77vBu8mmS
         +wtIXSuB+pZfLXsKLocee2bjbfmgYvIYa/Y0TMG8+k7Sfsx18E6frUPZM/YCnqgqIVBp
         taHMsJINYuj5ubCehNEiUGwABho6D8fxjhY7baeQeWhbyKE9zGP7Oeu8c5lCAqYJnfJ9
         mH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uvASVoyRie75/d1IF4UsXjOW/g7ubfd1N2Ai2wysIBE=;
        b=zDeoTWybEwk/9vKd8FvaGFj0ZU2vVg/F1xMPwnEEjxIPB/bYFQqV9qDBljpOivYxaI
         lDcTgAuyHvebs7zOfMKrv3XgC+AOadzRUCFVsvTu/ZYLXTrZ8pX7NvaB2/K8ZeiThHOr
         w+K9vXL7+PIPWtFSGZAH1CTcNxyl92zRdGR48T2Iq8Tnc3Xk0MH6hkqB8trkLYyNms4v
         KPYhWp/CBDQ9YTIPNJjaYKl/UikCnIkOmmIv8MxlHSk5Tofc7+y+59wWez1VOY+23hBg
         DSyEXDkqaXQFB/bF4hfIEeRvOBjUcc69vjSuFa8asjEYHxqxlb4wkAMwyb7ODqCSl20L
         APww==
X-Gm-Message-State: AJIora/5Tv98Iz3Tu6K/j748GNzHuRCoy9kSvzyieWHUkUklWgrwISep
        Ngma6eyNN0vTFDfIvZOMVqeP9Q==
X-Google-Smtp-Source: AGRyM1vNfa4uNlhLhaBfPbvHsqv9w7cLT6aLSw5MOWMbc2TO++Fi76SspE6gydwCB06yeKIjPHpGeQ==
X-Received: by 2002:a05:6830:2aa3:b0:616:c90e:ef46 with SMTP id s35-20020a0568302aa300b00616c90eef46mr3964323otu.287.1656360241139;
        Mon, 27 Jun 2022 13:04:01 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:04:00 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Robert Foss <robert.foss@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: (subset) [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
Date:   Mon, 27 Jun 2022 15:03:11 -0500
Message-Id: <165636016349.3080661.9546157097583799715.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
References: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
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

On Wed, 18 May 2022 13:35:54 +0300, Vladimir Zapolskiy wrote:
> Access to I/O of SM8250 camera clock controller IP depends on enabled
> GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the latter
> one is inited on subsys level, so, to satisfy the dependency, it would
> make sense to deprive the init level of camcc-sm8250 driver.
> 
> If both drivers are compiled as built-in, there is a change that a board
> won't boot up due to a race, which happens on the same init level.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
      commit: c4f40351901a10cd662ac2c081396d8fb04f584d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
