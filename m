Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C31D78D93F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236678AbjH3Scj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244265AbjH3Ms7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 08:48:59 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235E9132
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 05:48:57 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so84716871fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 05:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693399735; x=1694004535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcnhbfxFM27/YYGpjtvsx/QJ64Wrwp+MNdL+XQ3gmi0=;
        b=mao3j/LfnX3WA+olYxDSiF9ldkCv8iqzX1KMZG/3CPoUxWJebGkwK+hq6eeOX+fot6
         lg/J4FXhT5CYP8eMhTaL7lIAqWNu37pkDl/Jw829kLoGvtMOpzImXWtddNTaS/3cpRiC
         vi0avOs/nZXXaF58nO6ycumDgkB0v/ycYZK4FAVuegWrQjjrSUen/r3L5JEeP0ruoSsx
         HLuqdWI+9NC1K1oSI9PpH4wQC1BjxqiNyspJ0MNU8835iPMzJdb+B1yL7kAuPvWxnNGN
         6uJ8uilLZjLYv3sCGxUi5VGXhClf1/hwAGqqrxvu0s7IUB7i1vkUj1NPlfpr9uRbJ5JE
         afqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693399735; x=1694004535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcnhbfxFM27/YYGpjtvsx/QJ64Wrwp+MNdL+XQ3gmi0=;
        b=OsqkHMda0FpPemm4pDTABSr21sS+OBz3aABWI29q4tJGDaQ/nFeeEhfwHXetS0JgQ+
         5gPHunqb/YSJy1fO3AgyyBPJCn3ZU8nBt41COiettjMxS3nOf4t/euUBSe/OT4qGaztl
         EeHseiVaOTakjYeDxKDl6z+0pkMFr8ErkT+D4TzqtYUMRlkp+nDxmXvAyHDCrA8yW8RX
         eVQOy2blcAQQz6uW7oDyt8QPsSvcZmrAjdElB34L9t8YD4yz/AJkHJrejsQSYbnApS2o
         iTvoC+uYkIM64BXJkpBDGf5cJBpfCLWpX/qjdYkjGbIJHEHYr7OwbGsTiipt3JgF2ul0
         HbnQ==
X-Gm-Message-State: AOJu0YyIfmW6R+toHzrpAd9h5VX/EHmCYb4f3nuJYDVytULkxBX6hyBs
        sMmoOun7PxqCHNVg9Qe5OXTviw==
X-Google-Smtp-Source: AGHT+IGuEf/6YYmry7qMXTc0R82etA6M+I8h4gEU9tlVVfSLYuGUNUbYuHBtbqImj5xG1Rsfod5A9g==
X-Received: by 2002:a2e:9097:0:b0:2bc:df55:eec7 with SMTP id l23-20020a2e9097000000b002bcdf55eec7mr1471279ljg.40.1693399735467;
        Wed, 30 Aug 2023 05:48:55 -0700 (PDT)
Received: from [192.168.1.101] (abyl195.neoplus.adsl.tpnet.pl. [83.9.31.195])
        by smtp.gmail.com with ESMTPSA id y23-20020a2e7d17000000b002b94b355527sm2602662ljc.32.2023.08.30.05.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 05:48:55 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 30 Aug 2023 14:48:46 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: sm8550: Mark DWC3 as dma-coherent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-topic-8550_dmac2-v1-7-49bb25239fb1@linaro.org>
References: <20230830-topic-8550_dmac2-v1-0-49bb25239fb1@linaro.org>
In-Reply-To: <20230830-topic-8550_dmac2-v1-0-49bb25239fb1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693399725; l=756;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dnJcWN3O+4dW4BpW8WVC+TsWF2Kag9dSFf6u/P+2HPs=;
 b=KDPX0N5yhosxV7DxLW8v3QII3Iz3liG/NKaGK/vHLOmuih4YpdWfTsqd/ayF91PW+S56K/H4K
 XCytdh3vAcxBOt/+OrH8x6tmK7ntcZZOgz6Vk1YDjK8MpoyRm3PcN65
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In a fairly new development, Qualcomm somehow made the DWC3 block
cache-coherent. Annotate that.

Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 8ee61c9383ec..95ba9a9ac78e 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2944,6 +2944,7 @@ usb_1_dwc3: usb@a600000 {
 				snps,usb2-lpm-disable;
 				snps,has-lpm-erratum;
 				tx-fifo-resize;
+				dma-coherent;
 
 				ports {
 					#address-cells = <1>;

-- 
2.42.0

