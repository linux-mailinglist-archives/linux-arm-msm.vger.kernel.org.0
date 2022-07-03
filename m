Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD571564443
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbiGCD6i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbiGCD6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:58:17 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD4DB484
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:29 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-10bd4812c29so3083731fac.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2t70EqaCAX2EIHEkB/F1VpDKZkBCdo0fN5cl2gsNC/0=;
        b=pzw90zch/lqhVJuZMTOx8gesTxsUma4Pg8ASH8JTxkCBd/Mxh7EVENuwrFBefxpebc
         12q04WRV5Qe81sH+VrxQ8eFYe0uUW6EzHFXBXtgPZO+eRpszhQlmKjg0ovzT8Xxw+m56
         qX0EA8MFJmSfmaacmEGjN4vVxwihybWzAU5yM3ESzY5EOydFMuakII2R9hK+2kkEydrO
         qm8Hz3PdtE48GMGMgHj36FOT8TRSld6jtaOAAFqToKG+qyrYVwKOYmwjAL2gC2PGOpPn
         +PezBST+2qQetFmEnAcmayF/pq3XpD/u4rx8L0XhvV0B89A7YoPmg3fcSAXRHG//oRlB
         3k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2t70EqaCAX2EIHEkB/F1VpDKZkBCdo0fN5cl2gsNC/0=;
        b=iSwpoO/b6V4CpY0RG015U7iRMir+BRtQgvHsNeeNBO8N83mjhuqJK8DtyVFMi5jgZt
         HVGMUTVGvvwoYCYn+8M+kDuLk/OMeqh87wxuiEsz0uXss/zs6LIB/slaPFNGMZAvA7Jo
         Fypn7nH3hJmNXoSxnXMqcGQ/5DBSYPbseUpI0AUuGvsm/qUm/e0sYaYnMLDNc5pd0R1G
         vMxJJ5xZWJG2Jitdzg5L88j9uZzRNFKS9rKI56b/3Fl2HneYHtud9CeWHstrx9bNRA7D
         2VOoqtXflPTy6R5ZT7N2zMofNzJsue57R0fuy2+UeYxMtjoKq7SqWyar/jJqRfZ/PsKh
         UW5g==
X-Gm-Message-State: AJIora/5iGrSufiwTwqSoiKNbAzCZoXUPaI9IQYQ+cUfIbC8vLKPQK+Q
        //pjPVJi/ps1945xLLI/kXx2dQ==
X-Google-Smtp-Source: AGRyM1tfFSgdyku+GAdBGmnenRQEV1SRTVop1LLwpS7Gb8p210aLhk3EsnPy3hUUoysDDLYPPffJnQ==
X-Received: by 2002:a05:6871:547:b0:10b:f2b9:7618 with SMTP id t7-20020a056871054700b0010bf2b97618mr290088oal.146.1656820647355;
        Sat, 02 Jul 2022 20:57:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Kumar Gala <galak@codeaurora.org>
Subject: Re: (subset) [PATCH 2/2] ARM: dts: qcom: pm8841: add required thermal-sensor-cells
Date:   Sat,  2 Jul 2022 22:56:23 -0500
Message-Id: <165682055971.445910.7709192781079493994.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220608112702.80873-2-krzysztof.kozlowski@linaro.org>
References: <20220608112702.80873-1-krzysztof.kozlowski@linaro.org> <20220608112702.80873-2-krzysztof.kozlowski@linaro.org>
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

On Wed, 8 Jun 2022 13:27:02 +0200, Krzysztof Kozlowski wrote:
> The PM8841 temperature sensor has to define thermal-sensor-cells.
> 
> 

Applied, thanks!

[2/2] ARM: dts: qcom: pm8841: add required thermal-sensor-cells
      commit: e2759fa0676c9a32bbddb9aff955b54bb35066ad

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
