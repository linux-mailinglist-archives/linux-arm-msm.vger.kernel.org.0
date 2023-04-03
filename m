Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D682F6D4F22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 19:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbjDCRhN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 13:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbjDCRgp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 13:36:45 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BF430E1
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 10:36:40 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c9so28659444lfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 10:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680543398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VG1Z/PAYBy2HTkfroTsP0RD/589mq3Zv0lGIJ6IlK9M=;
        b=vgiQPAQ2+IPhA/MUViyxgMeR6KxNCnmVKeur1CtNCSexGRSQiKM2ZsHLPFOqFGHbbE
         Y5IUNHHPJQeBmFiR01++x+VMyqXiJ1xLpQaay8MfsolVDx972nMiLvBmWZjiNyTV5Qyu
         PDex2lXRF1ZArw38RbDRO4psT7twd2qVZFQZvNsWhmKYAftViTfGK2oaLSnXg2jwZQE1
         cz6AEsxdO0belKV7B1wpRUFQ4sNXixnuCEIL/P5YyrInMbzkhFaZb+hO1VB33XVcn+x8
         1dGtpg5E3KZs2Y3F+0s8vAlw258LVpFaga9i/WAAIw8J1Uj5xy8n/8PQeHvH3RKI5YDW
         r/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680543398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VG1Z/PAYBy2HTkfroTsP0RD/589mq3Zv0lGIJ6IlK9M=;
        b=7yt5wXn4NPKqxQF/+Lo6HdEYfpNCvwwWMOU5QlRY+7fZ7as1/EjWDpUnEJ8FG4fGah
         OiiT2QdghtP6nxEfv7IDvJr8gakvVc+ea7lxm2RsAK1vl5hRDnCAO03v8Y2+IFXwXZkh
         rfmFYPTiHgw5rzlATanhCTuEgda9EQodXM3Lxjad0DsL18wXfFKm8h8u01Msp5tqa9bE
         YUw2jHdFq4sd7NApH6TALCG43BSx8gszJ62Tj0SuFLNjn9dOhYXRVz2JcZ/m3OW9Tcez
         AGms4OxHMVml+blNM02qdkoOAycUyJotq2YcrtuWh0qZlj8dDqaj71bfeh1/RREfNE0E
         OmsA==
X-Gm-Message-State: AAQBX9fk0SetDc4rcij4PE8j8B6v4mt/WpkfqBHh9rADPPfPS5D6K4sp
        E0A1pKqaNlsSf0eQGQ6Ekl2WAQ==
X-Google-Smtp-Source: AKy350ZkK5lZHlNctyhc9z0vGE/UjBxG1Q9DhuyQG67nNYGJ3BBqccMGpcSy+jO6E6TzZiETZl8/fQ==
X-Received: by 2002:ac2:562b:0:b0:4db:3a70:e9f3 with SMTP id b11-20020ac2562b000000b004db3a70e9f3mr10472683lff.69.1680543398816;
        Mon, 03 Apr 2023 10:36:38 -0700 (PDT)
Received: from [192.168.1.101] (abxj135.neoplus.adsl.tpnet.pl. [83.9.3.135])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512096200b004cc5f44747dsm1871094lft.220.2023.04.03.10.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 10:36:38 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Apr 2023 19:36:07 +0200
Subject: [PATCH 9/9] arm64: dts: qcom: qrb2210-rb1: Enable RESIN Volume
 Down
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-topic-rb1_qcm-v1-9-ca849b62ba07@linaro.org>
References: <20230403-topic-rb1_qcm-v1-0-ca849b62ba07@linaro.org>
In-Reply-To: <20230403-topic-rb1_qcm-v1-0-ca849b62ba07@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680543384; l=675;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=nMXvXyIJXzMgyB2m7D3cD3hqNd8nV6QKFZj5jPwhtS8=;
 b=UELeCJ5UDxYClrydmV8W6uXF9LG3WnTrJQTtwrjy7yrh746RV8fQ/DNq7X8ou7CccZqcEydqebO8
 L+NJZW20CVDoiO5tVAvyscKftX1VRfWaPHiVQq6Fke1SnULZIj6y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RB1 has a Volume Down key (the one near the power button) connected
via PMIC RESIN. Enable it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 539a06456334..ef3616093289 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -40,6 +40,11 @@ key-volume-up {
 	};
 };
 
+&pm2250_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.40.0

