Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E046E572BBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 05:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiGMDGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 23:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiGMDGa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 23:06:30 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB20BD7A5A
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 20:06:29 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id r136so6045696oie.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 20:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYPMLoqpObkqC3vgX9JDRezJjjz1Bs5ZuvCnnY/zKFg=;
        b=Rf6IhA51Sd4oNvbXtVVGzOFdtvYjN5ahcBK0IiYWjfCzzj5CnmD5/UzYx15R0Rm2eg
         yL5QlMwV21M+To8lxcJvUuZ8/xyx1bI9JdUgLMJodN5jiyViQOtD1YCdtiIVEINrQ9Aj
         fDVWnURK8zX1vkmIvOt5f1YR9+AvJHUFyETcR0FHNN9OkPXqaFyZ9++wDWVJ+QXDcMzI
         otAFRBk2WTM49/NyVk+drztRfCaqHFX282DrNFus3e56oS2i88aD2wVSzOoSEzh88Jcf
         3fjBDwX6c0Lrgivp8rtDhinF85U3LBmyw31KWxAl+BtwCKVlloBePfctTv6Yf2S4oRHT
         RqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYPMLoqpObkqC3vgX9JDRezJjjz1Bs5ZuvCnnY/zKFg=;
        b=Nbnz8/QNjrWEhG5EvHl5Eo4q1rU2LA9Bu7h7EIbf0n8KNXEgQ+e+dyMIk5QYf23Ypm
         f8rh+6mlUPgE7Bsmw7oPpwyWdX68vGDqhqgMMNHCXcxVAi7Hc2R/8P6iwrFWIK3OfFSV
         azAQVG/9cxjCADeF0l8lE3ax0/Or8PlMLqFuRrLydq3bB3ybq4FSl9ndvbbJsyvssDwm
         AsW+mM/3U0bIhxC7+UlpL9MoqB0whrOZLjPgztMzW0P8CrHRdwC2Xt0vmsAu1XnEjqGC
         2P1/sgndyGcYnuD/f3jiqAQp98ZmztOSI/rDtFz+Xf6zs/FvKCM3EvRFXgFsv7NhdFaK
         nK1w==
X-Gm-Message-State: AJIora8ANdzYF/Yjvx64BwuFpxlP8IxXiDFB62FglzoLnhuoaIoLsKQh
        i+15NEEBS3UEcPruzTLDpouYvg==
X-Google-Smtp-Source: AGRyM1v+pWl2D1Z4tUtCZV9U8RJqsB5Q0JzfADmQ+eSX+oMcadn5yvrWUDoaGnwE6sTuPdabsUWfgA==
X-Received: by 2002:a05:6808:3088:b0:33a:19c0:c95e with SMTP id bl8-20020a056808308800b0033a19c0c95emr2995752oib.41.1657681589046;
        Tue, 12 Jul 2022 20:06:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g30-20020a544f9e000000b003351fa55a58sm4826865oiy.16.2022.07.12.20.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 20:06:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] Qualcomm DTS fixe for 5.19
Date:   Tue, 12 Jul 2022 22:06:27 -0500
Message-Id: <20220713030627.1371156-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.19

for you to fetch changes up to 03110b46c99bb0c712f46bec660b1c3f674ce100:

  ARM: dts: qcom: msm8974: re-add missing pinctrl (2022-06-30 22:13:35 -0500)

----------------------------------------------------------------
Qualcomm DTS fixe for 5.19

The pinctrl state was lost in the recent refactoring of the MSM8974
Devicetree, this contains a fix for this.

----------------------------------------------------------------
Luca Weiss (1):
      ARM: dts: qcom: msm8974: re-add missing pinctrl

 arch/arm/boot/dts/qcom-msm8974.dtsi | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)
