Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1209C627B39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236179AbiKNK7U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235983AbiKNK7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:59:19 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6B9F59B
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:59:19 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id f7so16701885edc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8YGXQQoceru8xg26Tk1VwC8A8r+/gdTVSnEGfsNUm0=;
        b=RJCFaa7sh3dvpYealcjXNEO68n35wly4GRBuqubGlODw5dRBvxb7dDUSYntR5/CNB0
         xFyNh3XzaUotyilA4VWhUS0/EX0iG7Vww6AHCchigtHWkv4KdGOB6k0e2xwY49ABLfEZ
         pKEPIBnUMGXxB/vr6g+XYFrLACRDhwGRnXjAD+Ydq/r3F71/uKeSNT0sJim3c1cdlhDG
         SOXh3Ts1qMd/SShNBMSLwUoxTqCmJ042z6n1g9GRak91ETgMANUlqiK4wYVmwu6lXR9J
         msPVyTB85BxuVbOyUzWmhy882hVEQsKZYn9zBDNGudStkKF3BB1iOCJX2JOcFbWyZsic
         Zgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8YGXQQoceru8xg26Tk1VwC8A8r+/gdTVSnEGfsNUm0=;
        b=AbyiaV3MeA9/fxBCWpiOIpj6zplRF1kM/5Wez57tUF2foAXlGTtWiFUwPBUpPtu1B8
         QiGhTHH3gFnWgwsm87CNnjIYf2r1WVapL/llBkgIV0IiITrUfFV4VyaVu3arqPk+7I3D
         Hqb9JJukbA8UqWWqBHh2S2hMLq9t2/GThzTnKD+BvdkzjXvlrVUFAw6W3rMikHlV1Qa/
         AkAKeui43pjelbrXk6O41mY2Uc/b+A8JHcpbNZCCiVZ8YM/79isPRGe1jYMx7ZMeOu5V
         pGrIkWCBUXGm1QRvN5C15tLM5XBTEqk8p7mlFoxbWj5y+Npxo7grQuwC0ar1PabrBiS5
         wFCw==
X-Gm-Message-State: ANoB5pnVkkC7PXZIQ0LpSQABEbYm19XC5C08wXtUdH7S9nzl+p/eGuNb
        jTsPbeSicsB4PQo4ocb+GnMvqHhQoDCUYuLV
X-Google-Smtp-Source: AA0mqf5GLCwbo/E4+NsGCgm6Exg8CnbbSg+Mtsxfz+bXr/ORd9wEm6tvmXjKmNf4fcCH9WR96QPP7w==
X-Received: by 2002:a50:fb01:0:b0:459:cdb:92ad with SMTP id d1-20020a50fb01000000b004590cdb92admr10629129edq.77.1668423557348;
        Mon, 14 Nov 2022 02:59:17 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906210900b007a4e02e32ffsm4036308ejt.60.2022.11.14.02.59.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:59:16 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] SM6375 / PDX225 [AC]DSP DTS
Date:   Mon, 14 Nov 2022 11:59:10 +0100
Message-Id: <20221114105913.37044-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the required nodes for ADSP and CDSP on SM6375 (and by extension,
PDX225).

Depends on:
[1] https://lore.kernel.org/linux-arm-msm/20221114104222.36329-1-konrad.dybcio@linaro.org/T/#t
[2] https://lore.kernel.org/linux-arm-msm/20221109170822.58281-2-konrad.dybcio@linaro.org/T/#u

Konrad Dybcio (3):
  arm64: dts: qcom: sm6375: Add SMP2P for ADSP&CDSP
  arm64: dts: qcom: sm6375: Add ADSP&CDSP
  arm64: dts: qcom: sm6375-pdx225: Enable ADSP & CDSP

 .../qcom/sm6375-sony-xperia-murray-pdx225.dts |  10 ++
 arch/arm64/boot/dts/qcom/sm6375.dtsi          | 121 ++++++++++++++++++
 2 files changed, 131 insertions(+)

-- 
2.38.1

