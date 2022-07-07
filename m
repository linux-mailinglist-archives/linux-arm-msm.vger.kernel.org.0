Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC1B5697F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234836AbiGGCb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234613AbiGGCb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:28 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574D82F3A4
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:25 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id n11-20020a4ad12b000000b00425b01c3326so3239810oor.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJ0Zy8n21p/451fO2qk3Ej39X+4GOuyMowllXrT7FCs=;
        b=BdcmuK960OGHTyBhGuWZATuwy1KHi+kvSUrLAd8tDD0LSgLICJDLvAekHxhWLQxBEv
         VumGdUPRJsoOMmuzVSFCYwOebHHf+IvPAZGnJYqnCFAdeNdUuhhX8n1skTjpfOVsc0fF
         jmGaa5Enflu6eumuIfwYvo1CfspqB/8JinarQ4L37jTKSoucbYVoo6UlaXrYH9mSwP2q
         4gcQmsCD8hZv6YYuaLASEPj5CVGofAJUaTjxfOVkPmFd5kevownigZIllwgm5vKVjdsb
         hf+qURhtAkCtITvDs4BykK6O5vSqvRj1niPZN41F7Miog9a0w1sa9UH28erQo0hHhJLP
         P7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJ0Zy8n21p/451fO2qk3Ej39X+4GOuyMowllXrT7FCs=;
        b=V434bAlLi/eXnbdvJ6++2jka39XOLhUpmvHq6teZfD7L6m9j2oQ/8fOdQW6vVxvGdG
         9supGUiKyE0Emjjp4vHcpRi2POsCRgGkN6VQqPi41CGO9c+IyNpNKmRhDbZCJAm3ApGe
         cwF7PzXAHCy9Ol8aVwegLZ3l7z9m7pbmPdFrK/21ct+cbUVQNhXL0uhiTsLjCWLTHidc
         o4fPoiH0Ll+U6wzGs64GelDn4maVpKN6xi8fJ824aBi5Z9+E0pPNWzqcWrJimWlczeUE
         0F+JTiTCHits8jdcEPPer2CHYyZcMhVukvbzS6DO9CEkGTcUXBkQq+71idgtmBiIfL1v
         bZIg==
X-Gm-Message-State: AJIora/af/MIlTAJ5+7CPx7Psnp4xysYliD/SmrNPHmEEJ+/qlRICuLT
        VFEUf//WTFsCQa9kU65oDT0+iQ==
X-Google-Smtp-Source: AGRyM1sMml8PNTyqN8an3prlaq/e8Q2pf1wNdRxcAKRGyLTfnE/EiGk/Ld20pJSmxJM3gA1+VpOuCA==
X-Received: by 2002:a4a:8f14:0:b0:42a:c31d:1c84 with SMTP id e20-20020a4a8f14000000b0042ac31d1c84mr3629550ool.34.1657161084649;
        Wed, 06 Jul 2022 19:31:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v2] arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI
Date:   Wed,  6 Jul 2022 21:31:02 -0500
Message-Id: <165716107314.864223.8586562367162350135.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220630101403.1888541-1-abel.vesa@linaro.org>
References: <20220630101403.1888541-1-abel.vesa@linaro.org>
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

On Thu, 30 Jun 2022 13:14:03 +0300, Abel Vesa wrote:
> Switch from the flat PC idle states of sdm845 to OSI hierarchical idle
> states. The exceptions are the cheza plaftorms, which need to remain with
> PC idle states. So in order allow all the other platforms to switch,
> while cheza platforms to remain the same, replace the PC idle states with
> the OSI ones in the main SDM845 dtsi, and then override the inherited OSI
> states with PC ones, delete inherited psci cpus nodes, domain idle states
> and power domain properties.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI
      commit: a1ade6cac5a2adc87099fc040074305804684cf0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
