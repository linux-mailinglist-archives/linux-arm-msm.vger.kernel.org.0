Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 587AE57921F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 06:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbiGSEsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 00:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbiGSEsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 00:48:10 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E28F28E09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:10 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id g19-20020a9d1293000000b0061c7bfda5dfso10566222otg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p1EQHxW5HiBjIRLOc1pgsFcEs6hW1MGSi37sxjV9CgQ=;
        b=PiJitFQdiOzDbtMiLV1650eyucqzC/C24v7d1oUvXT7MR1yGS9cf3lPXnlHbiW4sRW
         pyk7M1gXjGyF81rCHVnwjenj21nkXtlcNWFGsDGxcWTQXXTEClW56A/HtTWKtCYOO6wq
         LvyKsbHs9NDUtBmXFWITLXhklTKojaf/IxaLKeIjsa5t+3OA0u77Q0cZKoKZydQei9Co
         W3Q9Z4mfHp7JpZHxX3damwl2lfc/3Grg9B3PGd3NYCdEa7P609WgXzXNuWolkStQMjr/
         XM9gHp4RXs5/BK3749t0PqPraEOUcb0KFBmR3rYxbkfRmN0eTuwaXJjfh1IuJNOXkRFx
         sXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p1EQHxW5HiBjIRLOc1pgsFcEs6hW1MGSi37sxjV9CgQ=;
        b=gGKhoh7ZQoNanI44xl8i/OfvvADpL2y9HcDYRTNR5rEzKlPewKdo0ga73uC/D23mtw
         y/ZPZ6k8c0eXtqOGmINDso69J/tJZ41D5vyGFk6YuY7+YRSkHnykOlq03FHiHNX/Auvq
         aN1x8rbKbUK0rL5A1AwfeRrkRq3or39v6JHJ/JUDcVrMsUmhAiqKLob4KnfGvgdp3Dmq
         vrw7RlW6QioXolgHT2bvq04+85wt4x0e3KTe2+1+yEsJRDrH65c3GekbZWuvYWu9DyPg
         1Jlhbp9JjxIA20UstEWghp6Z3RSKNzK0jQ8sG3cEikYBM61UyM62+VUn7TBjVum8Nxg4
         Ai5g==
X-Gm-Message-State: AJIora+KIVNHBSvKAoeDbU28LVh6nGbBPNA/jlAQ/BjOB6q2Egby7kAS
        hlpO70Lptu+ch2Td+Z9gIKH5lg==
X-Google-Smtp-Source: AGRyM1vzcX/fQTwrXbwNclc5ZTOa20AKos2MIs53u/Bg9zR9a1KTY1yIQpw8OvpfYfG6z6uFswBYqg==
X-Received: by 2002:a9d:6e84:0:b0:61c:8fdc:de7c with SMTP id a4-20020a9d6e84000000b0061c8fdcde7cmr6587805otr.334.1658206089570;
        Mon, 18 Jul 2022 21:48:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9-20020a9d70c9000000b0061c9bbac1f9sm2803209otj.16.2022.07.18.21.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 21:48:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     bjorn.andersson@linaro.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     robh+dt@kernel.org, vinod.koul@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sdm845-db845: Some i2c fixes
Date:   Mon, 18 Jul 2022 23:47:57 -0500
Message-Id: <165820608075.1955453.14421522069664540577.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220717034403.2135027-1-bjorn.andersson@linaro.org>
References: <20220717034403.2135027-1-bjorn.andersson@linaro.org>
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

On Sat, 16 Jul 2022 20:44:00 -0700, Bjorn Andersson wrote:
> On my db845c (perhaps old firmware?) i2c14 is using GPI, so this enables that.
> And while I'm touching it I added dma properties to all the geni i2c and spi
> nodes and specified a default clock to avoid two warnings in the log during
> boot.
> 
> Bjorn Andersson (3):
>   arm64: dts: qcom: sdm845: Fill in GENI DMA references
>   arm64: dts: qcom: sdm845-db845c: Enable gpi_dma1
>   arm64: dts: qcom: sdm845-db845c: Specify a i2c bus clocks
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sdm845: Fill in GENI DMA references
      commit: 0f064ae7cf703b0527de3a0608ef88548fdb5d9d
[2/3] arm64: dts: qcom: sdm845-db845c: Enable gpi_dma1
      commit: 79cfb1124af9b55e082d9d3efbefa4d3fc8b3cdc
[3/3] arm64: dts: qcom: sdm845-db845c: Specify a i2c bus clocks
      commit: 746ff2bfcec78cfd522b2a490e7207c3fe836634

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
