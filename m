Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4C81564414
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbiGCD7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbiGCD6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:58:38 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B85CE23
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:44 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-fe023ab520so8803281fac.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m4vPhry9GlWxolpiEGQx+cJhb0YN4mLCSCVeDPanOBE=;
        b=aChs4oCazzlglDNgvnsWgwsv6vGLrKBrykbXODjJuJzur9VyfzmYgcuEAbsfmdkoGc
         aEbCECmYFMbU6rdM3TzFIlgCSKOZiLYS1203xF5qtAf/OtoATlcCJWvQb/o+GVHweOeL
         P9G8xkgpExouKbxpDwzCo8xZ1GzZV7ml86fWUVoIIXnVgoyqeF81jHW11gCHIByF85Zu
         Plf0bT0XUmIw7NvxQ0dsQFTkz1DrK8uZLv7tmr4Ats4r09m1gNTWa3dMNC9aXDuFAoUs
         f0g/VFiB523V+RbjqUBfK00RolpyuLmSI26grq4ibfQAMn/lvNcGwFen0O0kLMhjlj1j
         YZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m4vPhry9GlWxolpiEGQx+cJhb0YN4mLCSCVeDPanOBE=;
        b=zdbQKdP0MnWVeuM4YuEpvbQTQGaW6YpruifMl93EWzBaHPa9vnYwAHzdhlDVkClrwW
         gnXP+SsNo3qgTeZ/UYAY021G/7QoE9PZ9vkKuVSDi1442lgyz7yeXYurFc73OuhhMg6Y
         A0au1WCFQyDHU+kewzmjNJ++rccCVM7Nhr0z2AUSbccs189sjYJlI1iY7xgcrPjtAcD2
         AQzBLf+bRa7cwCfXWQ7M40WzQOjdn1cBednnOY4SAoxWJbedMcA+jli4nG5/FzvP8V+x
         UpCTxMnfiZhMAKEcB8W+YxrlmP+IlD7KTEAZSleaGJ2ZCqHFqMEyl3P0ykewpybfgEWB
         wVVg==
X-Gm-Message-State: AJIora8wXMaNgmA3WFjxRYhj+W12ZGMOcIB5TxVTQfmoVq4fq9JufS72
        +B3a/y8BPH/gP4cCCI2cqRicATrBoaaoBg==
X-Google-Smtp-Source: AGRyM1sRbwkRIvtXZTXXjH3FDK5zD5Ssm8jQbjrtCoV4W/QaqC2i9IoaIiH/0U4r9AM+08T92hONQQ==
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id ba11-20020a056870c58b00b0010bd21dad5emr2797394oab.287.1656820663899;
        Sat, 02 Jul 2022 20:57:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH] ARM: dts: qcom: msm8974: Add BAM DMUX Ethernet/IP device
Date:   Sat,  2 Jul 2022 22:56:37 -0500
Message-Id: <165682055969.445910.15295732443241491891.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517203450.1155696-1-luca@z3ntu.xyz>
References: <20220517203450.1155696-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 17 May 2022 22:34:51 +0200, Luca Weiss wrote:
> BAM DMUX is used as the network interface to the modem.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8974: Add BAM DMUX Ethernet/IP device
      commit: 4eb1560259de4fd5f89ec5e7faf5d4c6a83bae9c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
