Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373CE56982A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234896AbiGGCbw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234936AbiGGCbq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:46 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C50C2F3A9
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:44 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id s128so7207073oie.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NcLAVkKmZdSDVuyeAAGgVZ26D1dnd1B8tl4ve71Ac80=;
        b=fkdsEUTU9WqfeGDk88LEfKqKX+4wq7kWTjD3fi9qiBe6V9uuscz4fM9TZAcOfDipVN
         99LY2Im/PHaJlUelVTilWvBhPHAGL7uQZwRPJInSdMtNQ5O27W0xxBKOwrNYe4NgqEwQ
         tntu4PsrCdo0gLmOYaPrUlc7skH4PWH04O/EUhhc6RXUaLj7lxLWrNxYFVSaIDl8YKpG
         bnH8DDqCI6X4nX/9EBh58GTLpUUmaRvdSbupQ6RUsOrKNfwSCZ5wMPO9pJHIp3tVlJ5d
         kL4Rb1RZ7KMDltCaSnx7KBbYIDXX+0cjllG3XaoslO7dBtNe0rSpJ7WXA5lwtilRiMOq
         aN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NcLAVkKmZdSDVuyeAAGgVZ26D1dnd1B8tl4ve71Ac80=;
        b=1P4Nw/U3mZZ2U7tLO5n9iOCfsmP6Kp1I3aaRmW0IhxHgqVMgDRJUebvb/WNxo3Yd0e
         /y9QmBxVPvojkro0eMjz81PlwZTo0vGJ+pnjEbTh8nk3yE2jrNFc0/UnzI3oxCjF7/Gt
         +0zUsZ3Xb/yJO5EXrSNTnfcemyggg+ozsceTaDiiChAPnVbEwi0HorLEXwFrkiRL3baa
         nyO8Sf/C9pnexRcNFrA5icwGvE52YfyevrTojFgwTH9bOcNzn0BfFjVqhxS+l6jRcjjG
         4cmc5iaJFKpxDXpxmggyaq157qrGSceXesFCaeLFF+4A1QUTnsU0pjmIatW+1hLE1lfD
         BErA==
X-Gm-Message-State: AJIora8mF1U1A9D/3U7BDwEzsb9yZz755wxyEdm5kbxyYxpM9CC5DlYU
        ZBAuOoYSTnxrqtVnZH3jYCPCtG3fxuAETA==
X-Google-Smtp-Source: AGRyM1uatRWla1m1e6+KyVh4SO2oDHbDJfjt4mDT3FDNm5MlXwvAgQRwrOqjZvl8QUy6HG7hESpAdQ==
X-Received: by 2002:a05:6808:1b0a:b0:339:c059:b8a5 with SMTP id bx10-20020a0568081b0a00b00339c059b8a5mr209187oib.97.1657161103171;
        Wed, 06 Jul 2022 19:31:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@somainline.org, Robert Marko <robimarko@gmail.com>,
        robh+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: ipq8074: move ARMv8 timer out of SoC node
Date:   Wed,  6 Jul 2022 21:31:20 -0500
Message-Id: <165716107315.864223.10367730438090581299.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220704113318.623102-1-robimarko@gmail.com>
References: <20220704113318.623102-1-robimarko@gmail.com>
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

On Mon, 4 Jul 2022 13:33:18 +0200, Robert Marko wrote:
> The ARM timer is usually considered not part of SoC node, just like
> other ARM designed blocks (PMU, PSCI).  This fixes dtbs_check warning:
> 
> arch/arm64/boot/dts/qcom/ipq8072-ax9000.dtb: soc: timer: {'compatible': ['arm,armv8-timer'], 'interrupts': [[1, 2, 3848], [1, 3, 3848], [1, 4, 3848], [1, 1, 3848]]} should not be valid under {'type': 'object'}
> 	From schema: dtschema/schemas/simple-bus.yaml
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: ipq8074: move ARMv8 timer out of SoC node
      commit: 7d9c1da91a614d52b84a4628e21888bb5c526276

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
