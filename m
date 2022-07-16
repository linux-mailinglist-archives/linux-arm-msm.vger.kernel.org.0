Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BF3576FAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiGPPTL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiGPPTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:10 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCCA1CB02
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:09 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-10c0e6dd55eso12821277fac.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xkpLQm8YJg8MMZ7rkQZ7L5IADrikvYdUPwyFUfpYqQ0=;
        b=wPpbqdIdTr857Ho5pJfVfJTPoDIjyuKOW3Z9Jnp6Jzt6xBQcMepq8krPZewxa4uepa
         3e6kT1paPJJU0DhsWR8B1DfNqe2skY1cgG94VK2QMRekNoIHkYJ9eLxAZ9Al28AhSV15
         o1Hz9+aLHiQGkpBN4o2Gk2fN22B+ziw4XnAy47iYE8+weim7dS9mrEStoHidffVNc6lY
         f3wvX7ci4Z17h8rtvOc2EbYS4g2jamHw458QviY1ihIZMiWTg0etwdik7EMN80iOIQ0q
         8HV7lFRWTak1uAIT/amDRNqXHwDCdqmK67tBypN7StyrMOvpgN2XEXxAfM1plksiT4Sj
         iEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xkpLQm8YJg8MMZ7rkQZ7L5IADrikvYdUPwyFUfpYqQ0=;
        b=EYXEAg8N4ZHpmiXhLyw/FedPEP4iEkiAfggayb9q4r+5smiJpOpQp8DUduncUX67Ev
         PYR763TmbId201KSqvbHgRTo7H7o/urp/h8VIKZCDr+t3sulBDb6f23G1YRbfP02HMzz
         kh7m203tZg7KDGEvxwJvn3en0g74ULvM089CMq03QnMF0iQ+OaZNBj8MOj4zC8P17uTf
         yfn3fEQIdzMC2+biEJYOSEcRJAZpVhBuROBqOwkZzuifd37fSflYb4DweGf7RkZO/S13
         e3aEghLgCnvpEeooQm0FfOoMauuBPsxsZjrv1+jv0q7NzpeT9Ngi7ikrGC9UFX1XQTio
         0TuA==
X-Gm-Message-State: AJIora8uc1t+NZSSenqFhj55E1rtyc+Sc/oZ8pQkIz2B2JQsSkFYvptb
        dvj8J65kRQcynYyCJP5YHRHuew==
X-Google-Smtp-Source: AGRyM1usNH6IyfMi+TO7ZirPYH8Wauz14R2Z48dKwzipsRBvYLV1Aptq8xcDyIsJz9Hbkkwx2e4TIg==
X-Received: by 2002:a05:6870:8905:b0:10c:e400:75c1 with SMTP id i5-20020a056870890500b0010ce40075c1mr9631804oao.91.1657984749267;
        Sat, 16 Jul 2022 08:19:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-arm-msm@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SC8280XP providers
Date:   Sat, 16 Jul 2022 10:18:52 -0500
Message-Id: <165798474063.1679948.12897299312975095223.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707161014.3178798-1-bjorn.andersson@linaro.org>
References: <20220707161014.3178798-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Jul 2022 09:10:13 -0700, Bjorn Andersson wrote:
> The Qualcomm SC8280XP need the global clock controller, interconnect
> provider and TLMM pinctrl in order to boot. Enable these as builtin, as
> they are needed in order to provide e.g. UART.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Qualcomm SC8280XP providers
      commit: 4cf02f2e0d4dff38dcfe43a168801306aed714dd

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
