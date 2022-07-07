Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA7656983B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234906AbiGGCcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234912AbiGGCbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:43 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD512F3BC
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:37 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id j193so96386oih.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bVfzu+P0/Oi1+cRUnIH8jaYLfFSf5xLGdlqYMAcLIvY=;
        b=FA5W3T3WzmlVkVU0ONj1xGpRqwnNZRR+tv6ANOHX/iyqk5TpX64sRJeD2K0jGaX4T8
         0c0vsqmJrhfuKfno+nc9ZGz55HYHL2q7533MI781e+p+DuL0MeXWRd9mQX3ivPB48rPN
         f+yS5qzH6zq3K/9MBMSaYsBkMz8Ny3DRfZG7jK23RpSR0Z5FZv7iQwDWoLsWN7fGIuS8
         cAL5Bbmm3S1/wLYpu7AdzEiagzfDq0L2Y20e8ZeDD0lP0IT6Bl8EXwSZrt2YHg8RrdGJ
         GNNpNnbpR6stsP5c5PacByui9PROhTeoRhaDxS9UZO+b9oKBPSxSK0gcvUZiyLS2taSk
         TbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bVfzu+P0/Oi1+cRUnIH8jaYLfFSf5xLGdlqYMAcLIvY=;
        b=nwMEcl+27jvoTpi8KSCjoH1TcKoQZYpInETJVL7obj1GHPwi7WdivnUTQE2Uv2PDN5
         gMhayf6qFqIKos+K9ENu6JOXKugqcTQRlACFHEmh0kWc0NYtn6XvN1tkgxW8gkC/Or4i
         bbdBE4oFI9XzxVbqIglCvBw9+U2f7oRCwkXcgwz452aYschP5UF5ZthfTq1PiX/1mhbl
         VmfpftS7XZtu8Ni/WGkqy8erMTL5HjQpIayH4eszg4DxwHTnBW/KDu9U9mFGdL3Z7MyF
         ZwLsezoPvUrI5YRjQ2SFBj8ZWk7Wjyl958tgo99RTqukYiAFcxqmRUTRQGaPiagLzOE3
         6xdA==
X-Gm-Message-State: AJIora8tF38blVTpvV75uFhjfOEgWIsPIZ1qOJ8btlZWt1omZBXPdOwV
        Mdeteg5+ckGcwjhdXleWBxXufDlinsdBKw==
X-Google-Smtp-Source: AGRyM1sElFX4lFVOUCQI81ddsk2vbxl1O099fV4OwQsh3Zi0iYQpUVONOWqWpAQow86XpfARyajMMw==
X-Received: by 2002:a05:6808:1aaf:b0:32e:fec8:b67c with SMTP id bm47-20020a0568081aaf00b0032efec8b67cmr1086419oib.118.1657161096800;
        Wed, 06 Jul 2022 19:31:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:36 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH] arm64: dts: qcom/sdm845-shift-axolotl: Enable pmi9889 LPG LED
Date:   Wed,  6 Jul 2022 21:31:14 -0500
Message-Id: <165716107314.864223.10951283216862917482.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512054439.13971-1-me@dylanvanassche.be>
References: <20220512054439.13971-1-me@dylanvanassche.be>
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

On Thu, 12 May 2022 07:44:39 +0200, Dylan Van Assche wrote:
> Enables the RGB notification LED on the SHIFT 6mq (sdm845-shift-axolotl)
> with the Qualcomm Light Pulse Generator bindings by Bjorn Andersson [1].
> Patches are merged in for-next branch of linux-leds.
> Tested these changes on the SHIFT 6mq.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?h=for-next&id=a8e53db46f19f67be6a26488aafb7d10c78e33bd
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom/sdm845-shift-axolotl: Enable pmi9889 LPG LED
      commit: 8b936253e3dad69506cb47043dd6451a0a14cf22

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
