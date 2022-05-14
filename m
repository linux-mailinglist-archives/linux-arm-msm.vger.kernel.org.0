Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39636526F83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiENDA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 23:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbiENC7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 22:59:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B113916BE
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 18:27:52 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w24so11814061edx.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 18:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fnGbOIacDOeHPxANJTdIGA5GlW84Mld6AYAHqpRdXFs=;
        b=ztS3VeGz/DerKNxUY0CMqZAIjz9zWkiKbItNkc30BB3yPlcWmpuxXzTgFGutaQkaCf
         Y4v4z63MrtO5cAyk5t5anchnLpEDEDiS0rA6BGalQ8rYpUi9pN2Z0L4LkAAGTDqeVxoF
         7M730uspM3An5CoeTZVaAPCEbUVpMxE2nqzgWf+cl9e5n0kxAb22KUeYeGQDW53dQmXh
         npd0/1nVmKczwCjqLXOEZkFldJUrMzje6Z55zfRqRdEgGaUSjQJ9ysADAyJGm49XTGAk
         l1e/kwbBEOvoO5EAybrzMfkrOcKiHDrqR2rsQBsYuNyawZ/FZBEzJHAFN7AStvsSoOtk
         VhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fnGbOIacDOeHPxANJTdIGA5GlW84Mld6AYAHqpRdXFs=;
        b=WuigMo6MqMVmruFLMbNakVBVCI+Onuds/hwHF279pH9V6dTrH4VgkdrQkRIIZlmeVB
         prG8bN2tPefAe2Js2o3TZnT4jCm5SZ5RkhGPPgsFB1t1mm7AWzFTpkHzz4ksii3ZRL4o
         F5jaeX0oqY99ZMhBkBEccOkgyD+o3sbjdBa1FupchmGxoZz7HVRvnli31Tgp23xUtoKx
         6Qf2ZHOmc1HaMlx4pSkl8wXX9s43IykQcGDGQOq/CvG38fJVyVKsCXZduhcpi6dbz6LQ
         3Gj2POAKdx2eQ5n9UyH6t3d9QN8dMT60DWWhMT2D0+s5A92gn0pUp6lxrDQZabH3pHmQ
         z8CQ==
X-Gm-Message-State: AOAM531aMIQ7E0lwLGchwL35v9ctsOXU+qPeVtfBq7tWZWFxUTZABkbg
        OUZOaP/XG1SmepLqu844UgVF5aUnLQd5Fg==
X-Google-Smtp-Source: ABdhPJzJf8XF0A85TKIbvDUGHVOiqsbVeAXLrLgcPG2Fx5svKzNlKypsnq41FfSxrFWiaeTSybdk6A==
X-Received: by 2002:a05:6512:1095:b0:473:bf36:b6b with SMTP id j21-20020a056512109500b00473bf360b6bmr5142217lfg.479.1652486591410;
        Fri, 13 May 2022 17:03:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r10-20020a19ac4a000000b0047255d211c3sm529231lfc.242.2022.05.13.17.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:03:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: enable CDSP and MSS on ifc6560 board
Date:   Sat, 14 May 2022 03:03:07 +0300
Message-Id: <20220514000310.3070578-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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

Add support for the CDSP (existing only on SDM660) and MSS remote
processors. Enable them on the IFC6560 board.

Dmitry Baryshkov (3):
  arm64: dts: qcom: sdm630: add device node for the modem PAS
  arm64: dts: qcom: sdm660: add device node for the compute PAS
  arm64: dts: qcom: sda660-inforce-ifc6560: enable cdsp and modem

 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 10 +++
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 59 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm660.dtsi          | 68 +++++++++++++++++++
 3 files changed, 137 insertions(+)

-- 
2.35.1

