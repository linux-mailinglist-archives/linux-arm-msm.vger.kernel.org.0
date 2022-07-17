Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7016757738E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 05:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233253AbiGQDIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 23:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbiGQDI3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 23:08:29 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B231401F
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:08:28 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-10c8e8d973eso15641349fac.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fo1oTjadiXbuYvCm9pvzlMXZLO+HiUwhaEOYcOpwVjU=;
        b=eLGJZzhgkbS+7XQp4CslcgKdxwc9oDg8a1T3urflsbEcqGCOp4h2Ktjkbf5o3aI5eu
         GpXbeLvioELYSCYzJ1AjplrRoD6aEutXCSSn19gapYI1BXM0a6aOZBYQz6YcAqnaUNiI
         xXtEabuivHb+zwWUSqWtUVCBrYI9w+k0h8OU8ZBER7sJxQP1gCgibvakSIJ00q7gTnEe
         R7WuOPu62JIQizJBaB4lJjYYvFV71LiX3xu6+KoRyoI1bMmlyTYMhsY0UJJyfIxFffTk
         CWPbYGnkgqko7lD4SAafvnMD9w1L+Ccao3mfKxRnusAziku4niqWuc1uGdcrhDKj8Y+d
         AcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fo1oTjadiXbuYvCm9pvzlMXZLO+HiUwhaEOYcOpwVjU=;
        b=jDfTB/rEBDvNs8L89w37QjRoo1mXirGUQ2zIWUmP02yO2Of1GiK7JMdckC7UvrRN5c
         yOl55q9PVyFgcosRRCC8+Ztk4dXN1sVtMeTPUl8G8bXuLWZO977nql1FjNfGGMOOCeuf
         fKnnR/hY8L55twU2CQzLoQcYehbTbL1NQgPdhYexTQfhRwAkhFInVs7IxDdOT3bBpQIY
         yWhs6LIbZdiK86s6hhJYxK9Qw1qlFNqjeI4Dh0qO+pJUETGiyxfvKa/T1cw6JOi2SyUl
         DdRzJo4cOzBAc9V2c4FMuII0oY2OOQoweEyRV96jvSFWJ/k9NnDKrMWNT9MzafaS6q6p
         UqJg==
X-Gm-Message-State: AJIora+gQAcsjQgYP8zCuvG4wFI2dTBs27f2VdP91g3ZgKQn3zVNvKfa
        pU+o7PTKO0dQbeoCjdV8zlPPEQ==
X-Google-Smtp-Source: AGRyM1sy48dMU99BUcVX7EGn1px9o2cFcJkpDBWinwtaQd0N67ik/SKyxvH6xlMUYB3tp/n8dtI9Ag==
X-Received: by 2002:a05:6870:65a0:b0:10c:ec:e9ec with SMTP id fp32-20020a05687065a000b0010c00ece9ecmr13521656oab.63.1658027307976;
        Sat, 16 Jul 2022 20:08:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z203-20020a4a49d4000000b0043577be222bsm3203928ooa.22.2022.07.16.20.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:08:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/8] Add ipq806x missing bindings
Date:   Sat, 16 Jul 2022 22:08:18 -0500
Message-Id: <165802729676.1737676.10295489303293141237.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707010943.20857-1-ansuelsmth@gmail.com>
References: <20220707010943.20857-1-ansuelsmth@gmail.com>
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

On Thu, 7 Jul 2022 03:09:34 +0200, Christian Marangi wrote:
> This is a respin of "Multiple addition to ipq8064 dtsi" series
> with major changes and some commit removed.
> 
> This series try to add some of the missing bindings for ipq806x.
> 
> This still lacks of the cpu bindings and all the bindings required
> to scale cpu clk or L2. These will come later as the driver and
> documentation require some changes.
> 
> [...]

Applied, thanks!

[1/8] ARM: dts: qcom: add multiple missing pin definition for ipq8064
      commit: 4af1defb305798d1a064a5ea0d0c9b30e5eee185
[2/8] ARM: dts: qcom: add gsbi6 missing definition for ipq8064
      commit: d883a12a547b6d42e795ff3b5ac87cfd013b5423
[3/8] ARM: dts: qcom: add specific ipq8064 dtsi with smb208 rpm regulators
      commit: 5c47a46d5e942ea6b041c8b7727b201817c1ff76
[4/8] ARM: dts: qcom: add missing snps,dwmac compatible for gmac ipq8064
      commit: 0ce34e0c13e99c239cce6099f64b0e95697f36b1
[5/8] ARM: dts: qcom: disable usb phy by default for ipq8064
      commit: d63d3124c0a5cdbe8b91d81b922fe56b2462e1b9
[6/8] ARM: dts: qcom: reduce pci IO size to 64K for ipq8064
      commit: 8fafb7e5c041814876266259e5e439f93571dcef
[7/8] ARM: dts: qcom: fix and add some missing gsbi node for ipq8064
      commit: 6c421a9c08286389bb331fe783e2625c9efcc187
[8/8] ARM: dts: qcom: add speedbin efuse nvmem node
      commit: 7f5aecdd4ffcc018f73171bc0e028cd4e3361acd

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
