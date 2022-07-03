Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA3F56442A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbiGCD73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiGCD6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:58:36 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91065CE01
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:43 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-10bec750eedso1122185fac.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ywkPZufTnD1xHLiTv5IWpd6Pq71Ja3jgwwnqALPUIeY=;
        b=XT7HWcqAnAn8cZm9UIgQQAPke8Mw/3lizgqKFx6p58hNuVvAqE+tVbtp80SqdvqoeG
         yVeIu79eDZYxqE1tAkXXPWPY5bhm4K2yBkJwXgk3NuEgAf+tHoP33UkCl9hByBwBudSK
         AcM0PxOY2doYuMO8RhMRpazTFNrCdn9eTrXxv2VFqdbftWeCTwbOMSejnMp7KrN/mvkE
         IV9YIlSoC6X5Y869QmdQ4d3FVWddRjKMtMpQ4mCrzXXepIHXHOC92zTxhatPu2Es9e3B
         H+IuHR/GLRoOQoeWE5mCYtaGr8vufPuCkEgIhwlYcIcRGDeG+ahy+XPj7m87eLjl32JF
         ShmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ywkPZufTnD1xHLiTv5IWpd6Pq71Ja3jgwwnqALPUIeY=;
        b=xhkkwvz9y1BJArlwVLGWuzcqSx7qUTirbgWErtaKXakj5jxkMC/csmnGUxxC75BPZ0
         9wgjLPGkfAmFdwUhOiDZfG6x1cMO4bTZpuJ3WO+ctfcZXNXBO3IL6EV/uXFmBUTa9ksm
         ma+T9dRIs54fEK+AGefVz7gnqdZs/qLH/dEvlaqKJaDO4I1/42tmP/cU7c53eYBZ2a4y
         oaxE4g8WDpn0NBt1zOK3NmykG6rNJb5iRorNGI73LwoZC30mednK03T/FvZ7AlmXPXx9
         ShnJUyceLluD56e01tL71YMk7Z1iHmJBcF/NIjluX3EEED6wWmQo3YLHqjB/uOY6U8To
         HAMg==
X-Gm-Message-State: AJIora+smqN8ujuIK+jhZ5G/EylNOzM3g0z3D97mGXmP4RbwpmTXcuSQ
        jeDRJm2cZgmZxflc4czfxuPVLdnvapDLew==
X-Google-Smtp-Source: AGRyM1vWHafWg3xMomiCjHCB4819Hr7lbc+AFHzVCFuyBw55VOA+C+R+jhRui83frtUIXuGbCXUiYg==
X-Received: by 2002:a05:6871:4707:b0:108:a985:65f0 with SMTP id py7-20020a056871470700b00108a98565f0mr13668107oab.262.1656820662938;
        Sat, 02 Jul 2022 20:57:42 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974: re-add missing pinctrl
Date:   Sat,  2 Jul 2022 22:56:36 -0500
Message-Id: <165682055971.445910.5175604693918801698.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220606160421.1641778-1-luca@z3ntu.xyz>
References: <20220606160421.1641778-1-luca@z3ntu.xyz>
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

On Mon, 6 Jun 2022 18:04:21 +0200, Luca Weiss wrote:
> As part of a recent cleanup commit, the pinctrl for a few uart and i2c
> nodes was removed. Adjust the names and/or add it back and assign it to
> the uart and i2c nodes.
> 
> 

Applied, thanks!

[1/2] ARM: dts: qcom: msm8974: re-add missing pinctrl
      commit: 03110b46c99bb0c712f46bec660b1c3f674ce100
[2/2] ARM: dts: qcom: msm8974-*: re-add remoteproc supplies
      (no commit info)

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
