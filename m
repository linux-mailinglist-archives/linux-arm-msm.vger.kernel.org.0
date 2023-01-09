Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B116A6627CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 14:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235937AbjAIN5K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 08:57:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237083AbjAIN4y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 08:56:54 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828D125C0
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 05:56:52 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f34so13038897lfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 05:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gnx2GQH6o1rrdQ5c4hd1mX4hjOI+WjSfSogH78F3vcQ=;
        b=eEVOcLTCpUGS3oRfc9prz/sMABWmtkOv4cbt88gGMdPb/4kFVgyF5ML7yVaPfhbMJq
         cP2Ubwdcblf3olufcMOl6dV7rWQgqVw3rAtGmw1NbsNlB+g4eHoNEqBdXcU9tou5MAYN
         tAL+8h8HahyvwSNJaepSbM6OAfbBgeD4C6C9j3848YZDDgKCd+XVh3Zqa9YAF7huszgt
         bsPRlGvv4i9F/LZIBUlKrEUsV46KK/uQDhDWrDTIB+yTWhihIHgZeTLeefQQ1FD5FRPL
         4l8zqKRhCu7LJ82enc2Fua6RGU0QlK1CWOM1rSlDzaNwJX+OCqDox5NZUrjayd2kFXkN
         XUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnx2GQH6o1rrdQ5c4hd1mX4hjOI+WjSfSogH78F3vcQ=;
        b=LRJbLvIF6hoLgfUHKifKdeA2uX3C6sRdYmlSw40fWur8D4ww5D2p98Rjqmbk3POtGT
         vsvFQbMBWKx6fCSPgxTnTYd2kX7MMHwtogUhbdMg2a4cmH85PvEk7IgxfUYIPAiRNE5l
         H1IOq5RHt5xl+kudLzCQd/dtp7V0drBdh6cCQOtNNVVQU/uobS+cntkU9MxFa1CZn6pc
         8tlcQzgL1I6zMX/nZqiaVKFKEj5POr12umF6CEaPQuHuDnHTgm+CRy80cDyUExFiM48C
         VTzaNmDO88iaus5fgQKw/RG/fSfuvBYV39CNUtMKeoeOs9yzMr9FbtCmJ0QJvqJ275oY
         jeuQ==
X-Gm-Message-State: AFqh2kpNshAJW72jvQjIRIKmdiaKFVaOIkCwJhBjPzDcegZaCOojEVLA
        zv+Y+dc1/PUFBSFo+dZuAsH1q5xFx3PYRs8d
X-Google-Smtp-Source: AMrXdXvEHoS/MOdz4ibBhQnWhFUWbCi/5c7TNwgNn7jVfehf/hFtv3+7y14PakLFbPKy8XWB92ZiIw==
X-Received: by 2002:ac2:5297:0:b0:4b5:a4f1:fbbe with SMTP id q23-20020ac25297000000b004b5a4f1fbbemr22139642lfm.67.1673272610117;
        Mon, 09 Jan 2023 05:56:50 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x16-20020a056512079000b004c89b9fb1fdsm1638226lfr.68.2023.01.09.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 05:56:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/4] SM6375 remoteprocs
Date:   Mon,  9 Jan 2023 14:56:43 +0100
Message-Id: <20230109135647.339224-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This revision merges two [1] [2] previously separate series,
adding SM6375's ADSP, CDSP, MPSS and related bindings.


[1] https://lore.kernel.org/linux-arm-msm/20230107120623.1903056-1-konrad.dybcio@linaro.org/T/#m89d629bd788593dfd27e4dbf0cf0bf94ffd0a7ce
[2] https://lore.kernel.org/linux-arm-msm/622afd8b-a469-4c95-d2b8-030e47b0cac2@linaro.org/T/#m17aee8f3a51cfbd3f92fe2b4dd48b3722a6a0a7e


Konrad Dybcio (4):
  dt-bindings: remoteproc: qcom,sm6375-pas: Document remoteprocs
  remoteproc: qcom: pas: Add SM6375 ADSP & CDSP
  remoteproc: qcom: pas: Add SM6375 MPSS
  arm64: dts: qcom: sm6375: Add missing power-domain-named to CDSP

 .../bindings/remoteproc/qcom,sm6375-pas.yaml  | 137 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6375.dtsi          |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  18 +++
 3 files changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml

-- 
2.39.0

