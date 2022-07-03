Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D686256447A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbiGCEAI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jul 2022 00:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbiGCD7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:59:25 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0930ADEC0
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:53 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id h12-20020a4aa28c000000b00425ab778155so1250444ool.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nt2X+uNdLrpqdwW0aiTYtzYyC6r+nlmftQUdxFVU4Xo=;
        b=BPMHef0X/UE+4gfLJA/7h77BuJDDzVheYqkpw++CWW1epTNRvaYvKEFhd47ROXcSsG
         FxLj4ooKK5PwIH27TXSsHnONma/iG6enxCHozjekdUvETqDuLexD8kDRSHH70cQQifWq
         SKga7najfdqZe9ox6b8qxJwrFeQH5adIMWau/iORHltnLhQt7C2uY+OBYNQrGIc7TKqL
         iyfiMJ3kN4GgikvTXDcCjP0dtVloWvajjiLncFDaM+Veb7tXmMQtmj2IWwBmzmo0vcoU
         Sc8jsv/EvLZT5Zab3DdKIfVJd+RwuJF4fLB+BNmEvI1tIANuQdyX1I/T3gE5yqRelPrL
         Ezug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nt2X+uNdLrpqdwW0aiTYtzYyC6r+nlmftQUdxFVU4Xo=;
        b=vdwP2zya89/icae1VjLevlRHbh3RA5QM1v0jECmiLrEZbqOL7FYcV8u4ERKwtnRerj
         10zpbnXaKqRP7jQ/cRmNfOWdPEOsMRVgCGESFJH5mTt0vZRwqTyB/nTWf36otzopC7TK
         r+e/LRIzNltIlqPwa4knbrQAtlyRxo+5Zp1bkc9TpkQEsyhxVP+6fXYS8valZ75fK1uw
         L8gfkRyoYlBgJv8Eq9ip8kYDO8hYDoZ8ntIoJ67sk8ZVH+3Mww7dKvNY5cjBK777PbGR
         XoTUoRy1dfcrJkWVaP7laSafh4ZLNnpdqN7Lu8RPB3Ezcl26vST37yog3Nv8JHVuhcAg
         iUKw==
X-Gm-Message-State: AJIora9IT6z2wIXJzE9n8w4He5RBvhsGQtzpjUJd2ISE1bdzVuDNaRUS
        Q+VZLZAMZvFE176GHnXrRKkHdw==
X-Google-Smtp-Source: AGRyM1vE0ezP6iYXpSJ8kJRFJ+KDpplJyvj1NhwUowXIodyfRExwifaK97ELp5c/+kfnP67lB6y+Ew==
X-Received: by 2002:a4a:3813:0:b0:425:8005:1289 with SMTP id c19-20020a4a3813000000b0042580051289mr9430592ooa.63.1656820671202;
        Sat, 02 Jul 2022 20:57:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, Sibi Sankar <quic_sibis@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        swboyd@chromium.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        mka@chromium.org, agross@kernel.org
Subject: Re: (subset) [PATCH v4 1/3] arm64: dts: qcom: sc7280: Add proxy interconnect requirements for modem
Date:   Sat,  2 Jul 2022 22:56:44 -0500
Message-Id: <165682055969.445910.10978173770600627077.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1652978825-5304-2-git-send-email-quic_sibis@quicinc.com>
References: <1652978825-5304-1-git-send-email-quic_sibis@quicinc.com> <1652978825-5304-2-git-send-email-quic_sibis@quicinc.com>
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

On Thu, 19 May 2022 22:17:03 +0530, Sibi Sankar wrote:
> Add interconnects that are required to be proxy voted upon during modem
> bootup on SC7280 SoCs.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sc7280: Add proxy interconnect requirements for modem
      commit: a0cdc83fa89b3a53cf03ecd338832392be0dd4b3

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
