Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C037F793810
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 11:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbjIFJZD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 05:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjIFJZC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 05:25:02 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB17310C9
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 02:24:58 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so4597059a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693992297; x=1694597097; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QEeewtCJX96vdoe1lD/TlnO9FO5p7gStcke3V/kqO4=;
        b=yGGGt6nrpQEBIZyb6QUPlpz36sQdoCMBdLIeAFQqzpgPXoxQC4wUhj5NcOfa5ZH+k5
         tClIDCYicyx4Yp72KmSHp+KZWDyGCHmanV7SzNtCXSXuqhnGj9v924EIckKgIXcls2af
         K8ZuvJbYJ/1w9IxLNBuTZUibf0W6xvrwFGfGjT3jdlN10Ii7b3pGsARhssNIEQZCsJ9A
         MfVZz4wnvY4is6bQoYjgrKsB/pFXzMMXoyxlVwrUR4U0seWrswxCoN5fIqFpj32uf7gL
         KkCsMTdhJEKOyJB4j8X7vyusYx/h5Ut8ePEiF6r+M3chTnERdTXz7HCd2VmIjgtshlLY
         GnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992297; x=1694597097;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QEeewtCJX96vdoe1lD/TlnO9FO5p7gStcke3V/kqO4=;
        b=RuLvyQgOYGPtnD7E6ysqYFAamZWUZmSFJB1suzHiun+p1LDgZU8LPKmwJLZ04FJ9oC
         Gh+uoF8kvvRetVdC8OFNYbjoJU2jOjVcwGe/2n/IMj5rPe3Tlwbva6/6XQ5305vmIDhX
         oDK1fY8EKXFtSuHhUa2lgccAsP+7rJpq7jhu5OaWIDnmkyklbbyhcbqTGv5kt+L+fzDk
         AJBpGdQEx6mlutqGnVsRbt3NdBQ2uWLNbE181BIUoUProy1QmVSihODP5H61jb+K+yQy
         ntg1LdQo7JXu5IAnk+B374LL28jN/29Xy+6KpaJg6/OvsD6a3VX9mNb18nrAhfavAdKy
         MO5g==
X-Gm-Message-State: AOJu0YzbyhqzvcvfwbkxQS+3SMwzZdmU4TuW0QS/IVrJDzqrH78e67yq
        EQnA29RlYfFJD+SC6Y6HFYNWng==
X-Google-Smtp-Source: AGHT+IGlZvngRlcpXMyoCLmAR2zVJDEFtItBfSu3P3s0C7nPM5E4ulgkiJ/AK1BllqGGIIlidsfFRw==
X-Received: by 2002:a05:6402:1a37:b0:52e:21f3:aa0c with SMTP id be23-20020a0564021a3700b0052e21f3aa0cmr1703831edb.37.1693992297129;
        Wed, 06 Sep 2023 02:24:57 -0700 (PDT)
Received: from [10.167.154.1] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b005232c051605sm8096155edt.19.2023.09.06.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:24:56 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/5] RB1 features
Date:   Wed, 06 Sep 2023 11:24:54 +0200
Message-Id: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZF+GQC/x2N0QqDMAwAf0XyvEKrILpfGaOkMZ0BqZLoGIj/b
 tnj3cPdCcYqbPBsTlD+islaKoRHAzRj+bCTqTK0vu386Hu3r5uQ0xRiZtwPZYuGxaIQuWkYw0A
 9oc8EtZDQ2CXFQnNtlGNZqtyUs/z+y9f7um6xfTwvggAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693992295; l=881;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=kW+riKSLDoUJkj7H0MKvPMMu+DtUc8NEX6XV+4qMHe8=;
 b=uF8r3wJLnDh77IeyJLVRVzdDFu9dSK/qVywtKybcBVLMQeb1EFVSoQf5CifSkJ5VRNtRAdvWF
 CqFWYdVQ9T1CdcdytA0IAN0457aDubdFYVb0WygBWg9jZVYJ0YtSo1P
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series brings:

- a boot fix (Qualcomm's promises of updated hw never materialized)
- regulator fixes (way back then schema didn't notice my mistakes)
- GPIO LEDs
- USB3
- remote processors

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      arm64: dts: qcom: qrb2210-rb1: Swap UART index
      arm64: dts: qcom: qrb2210-rb1: Fix regulators
      arm64: dts: qcom: qrb2210-rb1: Enable remote processors
      arm64: dts: qcom: qrb2210-rb1: Add GPIO LEDs
      arm64: dts: qcom: qrb2210-rb1: Hook up USB3

 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 147 +++++++++++++++++++++----------
 1 file changed, 102 insertions(+), 45 deletions(-)
---
base-commit: 66d9573193967138cd12e232d4b5bc2b57e0d1ac
change-id: 20230906-topic-rb1_features_sans_icc-d8918c6ca0fc

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

