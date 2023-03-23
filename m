Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0B76C64F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 11:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbjCWK0h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 06:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbjCWK0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 06:26:03 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C441C33A
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:25:34 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id e18so8323870wra.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679567133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLUTPlE00BSnjiP+YKOutfDTs6tTX6QAssulhGKRHLM=;
        b=R48HHx1wdjnhsHgZ4ALbYG0+8j5SMxooMuHnduChZHWwZ0OZgwykIJ+MkPtslt7r0N
         /wF/FuDu1ONXfoH65B19fv9bddghDB7pFtm3bKCiTIXM5bFO67PiNTUphoTFh78n+Aji
         st7CqyEQ014AMyKaW2V7iBNOgL/BDbCnnVnsZU3MnLSQct4Y6WEN8uVBA35bnY87IGV3
         A1ZmLm3Z5MbuNfateEye6dFjAf1p2Sg1hZ/TOJ8hhZ418TCTE77tCkNqeKRG9SNih5HO
         6QRbR6dIRE8+jVvZqg7fVfRpp5XmJqLydMorfJTPnBYb5h8y9L18rlhp2WLeKvgHr02z
         Ho7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679567133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLUTPlE00BSnjiP+YKOutfDTs6tTX6QAssulhGKRHLM=;
        b=rxzs7PLFpJ/87XsGDmbaeb3fHR/UV+y0xNpTX92WVkyVRE24B19vdEWB+jzEm+xSkN
         fyT9Cm38W6T/Vq6IX/hJ8F/hl4cnelE0F947G/YJb708hTSIfiwfkmnjoiloVR75Yabh
         aMFaHdv2IIfr4HW1NbGscTuY6HwxQrNDComhecenB0YiSmgHazsY2LC38hIB9+CfRSBU
         406Bcjj2c2a+0oAHire2bU8UlSCPbjPBZB7hOKlei3qoBosW0yGYiwUFZxBGtSG2SxEU
         KObiobF0wxApFN7iGXhk/r6le9DqyKSm+KINOfiWRgQpLsbN17exHGz0nF0YBDpa6ni6
         Ozgw==
X-Gm-Message-State: AAQBX9fvImBAm3I/H9mF7dqNgG8jE9OEfdwRIc8il81yBuAev9oTCmFb
        aitUqVS6xKEYIj34aKhP6IYmVwwhpgvHK/Y4QKakHQ==
X-Google-Smtp-Source: AKy350ZmFe/sap13zmBOBFD0LzVyhIlb1i6EkPaP2YxaME1R9IuEZr2IyS123FR1V2zVbBWgDAb8MQ==
X-Received: by 2002:a5d:6709:0:b0:2cf:e449:1a9e with SMTP id o9-20020a5d6709000000b002cfe4491a9emr1930821wru.30.1679567132966;
        Thu, 23 Mar 2023 03:25:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 03:25:32 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 23 Mar 2023 11:25:21 +0100
Subject: [PATCH 6/8] arm64: dts: qcom: sm8450: remove invalid npl clock in
 vamacro node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following DT bindings check error:
codec@33f0000: clocks: [[137, 57, 1], [137, 102, 1], [137, 103, 1], [137, 70, 1]] is too long
codec@33f0000: clock-names: 'oneOf' conditional failed, one must be fixed:
	        ['mclk', 'macro', 'dcodec', 'npl'] is too long

The implementation was checked and this npl clock isn't used for the VA macro.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index bcb51e612261..ef9bae2e6acc 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2321,9 +2321,8 @@ vamacro: codec@33f0000 {
 			reg = <0 0x033f0000 0 0x1000>;
 			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&q6prmcc LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-			clock-names = "mclk", "macro", "dcodec", "npl";
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk", "macro", "dcodec";
 			assigned-clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
 			assigned-clock-rates = <19200000>;
 

-- 
2.34.1

