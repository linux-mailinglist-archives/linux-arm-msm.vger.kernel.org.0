Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 025D36B9671
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 14:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjCNNjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 09:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjCNNit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 09:38:49 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03144A42CD
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 06:35:25 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id o8so73180lfo.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678800923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUHiE57I9vqzcvHU4zgDQJA1HrvWTKd2bWfWM+fvWnI=;
        b=dIKTcfigrdfVniTNRB2H0A+nn91D+syjjteC0pkBXrPw0FUIuUTlzaQpH3B37QIkiD
         acjV0YFntgaCtzkD+eaP2LvpfeCdxvPtqhUq8N04LWdm25eErmJXeXQDS+zhPOiB1HHI
         Kiz9WuMuG49iwdOfI4y+Ny9at+P8gtdI/4Rf9L4iupTvVbX65vrR38JqIQKkFqB1Ivho
         PzKxXhW43HDp8K2lEvDr+74VLFbPEuC1iAi6rp6wuTUzXqD6FFFii6VvC0kcvXX62ksB
         NHu4eoV9FZ0Txbp3QSMKiPq/jA5AT0VyuZ2LbyTEDi6cCVKFSHVPI/34HljIRzEhf59r
         y4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678800923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUHiE57I9vqzcvHU4zgDQJA1HrvWTKd2bWfWM+fvWnI=;
        b=rvLgmJQ1aKHh9ZSn5kI4J5IRA8q5Nog0TMFGjO+wu88jZr2hHKIWYX/CZjH2uMWron
         DMmmiwPATRJAjaSpqyzVk2IyK47cELPE+P6cawp9YxCXXZT45edkcWBgGqwdXmoMvqSr
         9sXrgGCyhMSi0JbMSRRF/2sSttn2//tdcVZiORwyxp6kTKGG116nGtv0DrG9xE8Y1zSF
         P5qSx1Aso1x7hgaXtKqUVSJWTHx7fQrNEk+PLS1cD6DPBw05o85iZcRFvaVaDvpw0ggc
         BhwdInDQe8Q8NnC4iP40XNQ57YI+ujWDkkFiPS41nmIQvCiRDi6zy0npIGrazr/tCFQa
         /mqQ==
X-Gm-Message-State: AO0yUKV3kLb6ZZoKKqe43qstRd6rzL0cHv5UYXL+4r/Gf3vwKkEfs9Lf
        cvuocl75dll2LhfuMHvVUdZ2qQ==
X-Google-Smtp-Source: AK7set/CFo1ATdaJrUbF1v6AcHcSyGCOw//Wkz5H19HVsdeZ0WhLtWn0Hi5qoo9FoWROAa6iv4UaDw==
X-Received: by 2002:a05:6512:72:b0:4db:1b97:13 with SMTP id i18-20020a056512007200b004db1b970013mr747423lfo.54.1678800922858;
        Tue, 14 Mar 2023 06:35:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id c20-20020a197614000000b004e841e52b48sm403556lff.117.2023.03.14.06.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 06:35:22 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] 63(50|75) QFPROM compatibles
Date:   Tue, 14 Mar 2023 14:35:16 +0100
Message-Id: <20230314-topic-nvmem_compats-v1-0-508100c17603@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABR4EGQC/x2NWwrCMBAAr1L224U0USteRYqkcWMXmgfZWoTSu
 7v4OQPD7CDUmATu3Q6NNhYuWaE/dRBmn9+E/FIGa6wzrj/jWioHzFui9AwlVb8K2niJdHNmuA4
 WtJy8EE7N5zBrmz/LorI2ivz9rx7jcfwAbdTDYXoAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678800921; l=564;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xGOu9u0tx08BqWek7BbksUiMYHpYpNTjfNeg+ZWLaqQ=;
 b=eE48o6pLpP7yu5qcSNlvkepIUBhRQo+wmSPXMliDgaHrEOxd83Nt4Li5gvKCFyNkng1cA0/6MKAZ
 Xe5VLC1bDkHbwdMgPdUiEG6Sla3fto5uSXesOsr2epHF74K+9c3G
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I've had this sitting in my tree for some time, it shouldn't hurt to
merge them separately.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: nvmem: Add compatible for SM6350
      dt-bindings: nvmem: Add compatible for SM6375

 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: ec0fa9a0a6fac454745c930bdb8619d0a354bac9
change-id: 20230314-topic-nvmem_compats-2f5fe8307672

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

