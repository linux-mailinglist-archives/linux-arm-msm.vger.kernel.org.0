Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 151C9564444
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbiGCD7I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbiGCD6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:58:23 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E26BE36
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:34 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10be7325c29so1566502fac.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u9N8NjI9RBrK1bB9eLmzIxfM+IEIjeSqvIr00rCFrxQ=;
        b=zU2DrGyy7lyOGwSFs8J7uDLDzJfFW/2EW1zwVcWQbXbPySwG0Ttk8+O0I5dGJtUgtq
         UIIm3THiA4zYc7K3x1sJgWBAWpL8yp7KO4PIpgV/h+TY+Fj7kg0dootOqXJAoC55CwuQ
         BRT/hoqU7neaTxjV0tXA+poq8yDWlDTCJxLMxo/ZGDG7S195YWcj5OmdVLtwkuDf7XLM
         gXwSgbmt4PZXBlTpQWxeGUKql2qhrAuhegxURu/8pUnFKs0SFBc50pLFLXxWTVEd7uCp
         s26zoYFy6FD8Q4EZKFyEFEt7aHGcQDZTehXKzTrSNwH95jST0mdhflFbsgdXS9f8DeaL
         muoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u9N8NjI9RBrK1bB9eLmzIxfM+IEIjeSqvIr00rCFrxQ=;
        b=7/TkflnuSj1QAMCP0UXnBb9cGdW3eUrRKEH53rbL/OPmHQDXeK81X8cLF7LVwd9dVg
         xq+QrFr2qmowDHLnc5/dRILzy6hEPoqD5aCBWLS1pSZ5xkrb05FmCLnixnR4li60LHJE
         hHpQqKgHE7xU7Sdb8LzrpcptWPq1zthDzfhZh7H8ANfN8zrLhQGYRsb/qQFrCX6Veb8d
         22e2rDVl7YBh4O8jZC0xxbY6K0rEg04ccleRhaD8bSCtqqjTeCC7zSaIrByhyZhVdZj0
         WtBxuBKSM0vYM1xmwHPx4mbXuU0wQNRhU/WPQuKhZ8LfuZl2iBwur6BNGxa07HGgWLnQ
         mqaA==
X-Gm-Message-State: AJIora/WXOiuzlRbjSokYkpPfdaEwj4CQ718HxMlIicHnyWZ7queExBs
        /smVucltjUc1VOsBxmg9sET1Yw==
X-Google-Smtp-Source: AGRyM1sCO2vgss9UERO0Jwo66AuRz/k9wQea3+pwnz8Osbr0h4IUvpUIsNmnDsYnrES8IjESIFLO+g==
X-Received: by 2002:a05:6870:ec91:b0:101:becc:467c with SMTP id eo17-20020a056870ec9100b00101becc467cmr13776664oab.186.1656820654633;
        Sat, 02 Jul 2022 20:57:34 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Subject: Re: (subset) [PATCH v3 21/40] arm64: dts: qcom: align gpio-key node names with dtschema
Date:   Sat,  2 Jul 2022 22:56:28 -0500
Message-Id: <165682055971.445910.10604625512115231111.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616005333.18491-21-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-21-krzysztof.kozlowski@linaro.org>
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

On Wed, 15 Jun 2022 17:53:14 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[21/40] arm64: dts: qcom: align gpio-key node names with dtschema
        commit: b08f5cbd69dcd25f5ab2a0798fe3836a97a9d7c6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
