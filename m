Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBCD694821
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 15:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjBMOfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 09:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjBMOfd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 09:35:33 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7643F1554C
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:35:32 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ml19so32527817ejb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=blhaVJKSjHFCrA/yo+9KOY8IN9aLRbh1TbtDUcQRQfk=;
        b=SKFmZdvTj35xR6RY3uf2jtQyycYWzmGF0KdmkAsDnCWVV809OpDMotK34QILvgW8ET
         zn4WXkzFjomfFX0luf9JwNQ8KGWAjss+brbKMMhvFIa0hCo5azXuY2gAjEnWrQmR5EP6
         qK6fuPn7Q8qUNby8tpsiv/7NunnTqv2LbRBdBgOTN2mePeWw8j/lO4v5vBQbq7hhrtfF
         9uL4emsVi1KI7P+B2ADUWUVrt4xEv3Zwyl2we8isL4RZySXmIPPK2r3H9AxeauqU2PjU
         YcscDVkilXFszU/sa6NpNANc4vx9o5LVe7iStJktbsNRpC+Zadw9wfRI2ZSur4UixSMe
         9Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blhaVJKSjHFCrA/yo+9KOY8IN9aLRbh1TbtDUcQRQfk=;
        b=H0ZXi+OJI3bbCHz57JWXYpKd3R5wr/LKeVfHE4UWnYqjcQ8P7WaWq2p6FpXx/IFYwZ
         QThDJsAF2CzKVdl38I/VT3p2lAA6MmLQ9t149CjXrOao+Uz1QfrtWUGoGNASziUrbbTt
         3cCBfh+inzbXRlKtz7Kno/lvMlZmSPkQPTgye/jUhBQ/P5x9GDHCA4F20hwe8d/opjUf
         dJO7xbBBSmAp63Rp1uOahbmruQFFkMt5n/NbgnpDVJXGjKMvdpKfi9pD2y9Fz0akmQJf
         8uDsrvtKiwfufwS1BcPnQ7/qVSEsxz01nhAWvRqaAc26mDVNNDcnL4rtOLy+fRlzIomM
         p/6w==
X-Gm-Message-State: AO0yUKX+OjIMTEQlII90iNyNo2QsMW/Ds1u+2xJk2mDwN951PTzDh6Sr
        bbM5YExIMH8fQBcpesiVsYA5j7vIl3SaI/Vo
X-Google-Smtp-Source: AK7set8nVzdKq4qcbKvMn0lygnsmNOneFUo8vEQcYlEbYpzQCzmVlW/35WFquVlXpoPJy94LzWJYug==
X-Received: by 2002:a17:907:6e26:b0:8af:5154:dd1d with SMTP id sd38-20020a1709076e2600b008af5154dd1dmr15679419ejc.64.1676298930848;
        Mon, 13 Feb 2023 06:35:30 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id uz6-20020a170907118600b0088a2397cb2csm6927186ejb.143.2023.02.13.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 06:35:30 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/9] RPMPD cleanup + parent PD
Date:   Mon, 13 Feb 2023 15:35:15 +0100
Message-Id: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

v1 -> v2:
- reorder the cleanup for better reviewability (read: redo the
  thing from scratch with the only thing being shared is the idea)

- move parent pd patches to the end

- clean up even more duplicates (lpicx vs lpi_cx)

- remove the vdd prefix from pd names

- use a single tab instead of a single space in [6/9]

- only pick up the rb on [8/9], as the rest is essentially new

v1: https://lore.kernel.org/linux-arm-msm/20230125032728.611640-1-konrad.dybcio@linaro.org/

This series provides a big and necessary cleanup for RPMPD..
Lots of redefined objects were trimmed as well as some stylistic
and maintainability fixes have been made. Also, support for parent
PD is added and put to use on SM6375 where VDDMX should be scaled
together with VDDGX.

Konrad Dybcio (9):
  soc: qcom: rpmpd: Bring all definitions to the top
  soc: qcom: rpmpd: Unify Low Power Island definitions
  soc: qcom: rpmpd: Remove vdd* from struct names
  soc: qcom: rpmpd: Expand struct definition macros
  soc: qcom: rpmpd: Improve the naming
  soc: qcom: rpmpd: Make bindings assignments consistent
  soc: qcom: rpmpd: Add parent PD support
  soc: qcom: rpmpd: Hook up VDDMX as parent of SM6375 VDDGX
  soc: qcom: rpmpd: Remove useless comments

 drivers/soc/qcom/rpmpd.c | 800 +++++++++++++++++++++++++++------------
 1 file changed, 564 insertions(+), 236 deletions(-)

-- 
2.39.1

