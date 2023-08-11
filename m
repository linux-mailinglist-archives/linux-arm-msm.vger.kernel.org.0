Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD87D7798E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 22:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjHKUvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 16:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbjHKUvI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 16:51:08 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F772D5B
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:51:07 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe655796faso3831978e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691787065; x=1692391865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7dwX7d2dU/+Fcf4YUfoOQ8dtmFpWA9dQl9ljKJ8KV8=;
        b=kOivY6A78wD3tWHGor9Cb6KP6jgrIb7TqJ+AjqJaGYfU2vA+LInbZR9s1mfmRUwA/h
         iyuRxlM1WFZseiNI3SW1FMdj5MdtBxsC1Dl1UzjMb0X4AyjOnT9OQsjOWUfLhgiOMw6m
         H9qEcL2q6KDjH6Xxj6wBx3MqqDQD3ST+0IBVkXIGif0GsgpTK3q5g3IBBXdLY2M+39Mb
         ZaX5tM+gDyqK+52Zcfv4aw40+wek0TXQHrGVfaSExFktQAq+GTDsIWLvL5hNOmuXQu04
         D1ijZdcgllbE4tAaz95z5tbea3/nJJfhtptxbfcg/a7TXDU6FiZikzWv+KpFa7kd72Co
         Q4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691787065; x=1692391865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7dwX7d2dU/+Fcf4YUfoOQ8dtmFpWA9dQl9ljKJ8KV8=;
        b=YM7zsXnFkanpMUBHWQws4+YxBYp8phXW48OvDN7Q5c4ZteP3eqMi/BOlAqYP+VEtG4
         wtbFQb2a6TExK0K8D59HkBn3m4mAXD3XgVqx7wwuTLrjXo+LiIWrwXIYLEg56vh4SuXi
         UrPzx0wtgpJs70wuQXKTvwpONAladPPnWj5ndR8PIxDUXwQwGDp+/cqOCrSz7a2oTUoh
         yERifyFSdKZCAFeNHWoFGwO07TpnhGvvbHhib0BLxb4byOUqmPKWAWNgabHO17PA8sh0
         zph7FZcjONdNsFCrBFUTdF5Eov9v6FDSsKoEs2fW4ey+Wigr5fwb26YCne+HBwCseI4a
         w0Ag==
X-Gm-Message-State: AOJu0YyXHza5R7Ep33o2Cyf/IK4B+g+6GHPyFVzJKDcAua3uQ4lhYiHs
        /GWr3bAAqna5loUUZmtgriHVrw==
X-Google-Smtp-Source: AGHT+IH0f7VkHrdSE5JI85lrLR+IIkp0OZpQwcdyDA34Xp1fap/jwI98RHyGsQns5XeKhGWo59Uv4A==
X-Received: by 2002:ac2:465a:0:b0:4f9:5404:af5 with SMTP id s26-20020ac2465a000000b004f954040af5mr2325253lfo.46.1691787065714;
        Fri, 11 Aug 2023 13:51:05 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id w26-20020a19c51a000000b004fb964d48e6sm858285lfe.95.2023.08.11.13.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:51:05 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 22:50:58 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm8450: Add PRNG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-8450_prng-v1-3-01becceeb1ee@linaro.org>
References: <20230811-topic-8450_prng-v1-0-01becceeb1ee@linaro.org>
In-Reply-To: <20230811-topic-8450_prng-v1-0-01becceeb1ee@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691787056; l=726;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DAjiq74UUefJdsfOInU2jHQz0HV2BK7biar8Njrb1Tw=;
 b=+8cN3Nbx0tNivhACQMoC05m52yue+77h5opat4b8o/IbMvK06IRdMl0t0wPmP1UQpkMU/RcXg
 tnG4E4qQsXICNSa1PVVsHI4XzKoktqX9Paoa3cRrpgDRNQxE3JytCS3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the Qualcomm Pseudo-Random Number Generator.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 4bc1c46a5f44..48618e88a273 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1738,6 +1738,11 @@ spi14: spi@a98000 {
 			};
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,sm8450-prng-ee", "qcom,prng-ee";
+			reg = <0 0x010c3000 0 0x1000>;
+		};
+
 		pcie0: pci@1c00000 {
 			compatible = "qcom,pcie-sm8450-pcie0";
 			reg = <0 0x01c00000 0 0x3000>,

-- 
2.41.0

