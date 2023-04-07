Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0141B6DA97A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 09:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjDGHqQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 03:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjDGHqP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 03:46:15 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E77A26A
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 00:46:13 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id l15so6717797ejq.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 00:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1680853572; x=1683445572;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftmddGPtFC0OTnDCGzcglP4ydtKIcTHHa+H1nmoP5dM=;
        b=3zYvbAUxfQl1T1iXWWK/b/4iQfGwPmYuHQQJhlEOARJmvTorlhBaVKR3N+YdqnCBA8
         RMQQY06XcBr68/2krbtiQRNgYRnodFEQ4AZt+VLkIbDOWWDuD8od/KPmqPI+4Avyyejd
         krRqbNPIp2wiKM+Ome6nm6logR4sGDaSNjgJwgGkqaSvpbsgrDh4b753ltXW9xL77Wh9
         okGWnbDo/w4kylJbWZa7CZJirIsgO6zqzYXX2OF63upCQNPxiXK6/L2MRZELwsyT+Imd
         tTWvuapU6fntnTtLgu2Y/Intf3lMS6Ntx5zHP3PXARJ08Q6QBrGUjVLqPfvimTiupeCG
         mgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680853572; x=1683445572;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftmddGPtFC0OTnDCGzcglP4ydtKIcTHHa+H1nmoP5dM=;
        b=8LkrKrNn5rhXLANrH2EOXGtsvuJo8Vp0fQohQbT3RDQe+GG8MU2yvwsPOWCaLWAec5
         /kjbpWg9JeeYQuNDOS2CaGzAP8PfeYFp3Mu8D/iw88vX6NJP/n/r7/qGc5tDj0wryqzt
         5pChl4S6QZFRknjH1WLO6/bmieNOoHMmEi1XCoDsn4J4pn73dg3ZpBC6B251E+ainhow
         EeswpNui14p5DDD2kUaw0woyX3sFkBK2qk1O7Hrdv4qNmL8l06JmCSzVebB4ayaMgQgk
         1G2Is1EZ9wTSX/VhKpBV2SUeH7JtnhAK+teb6FTMlachhv5qge30dI4TGG8Xx7zuptia
         eIhQ==
X-Gm-Message-State: AAQBX9f2lOxpe6/4NvnC/Iy2qHmW6PgDlmjTXAFyC1QuZrNLxqvLNa23
        G1VmXQW6eTZjbbq+g+q8INTYZw==
X-Google-Smtp-Source: AKy350aaeK7fo3tEE05vaiCic/7YqE8qTPAIvPh6+RnEHZlIyJK91TKReawucVGXgZFmrxM7P8FTBA==
X-Received: by 2002:a17:906:e41:b0:947:c7f4:2342 with SMTP id q1-20020a1709060e4100b00947c7f42342mr814426eji.4.1680853572016;
        Fri, 07 Apr 2023 00:46:12 -0700 (PDT)
Received: from [172.16.220.24] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id sa28-20020a1709076d1c00b00949c04d1c64sm1762378ejc.41.2023.04.07.00.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 00:46:11 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Make SID for PM7250B configurable (and a small fixup)
Date:   Fri, 07 Apr 2023 09:45:43 +0200
Message-Id: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfKL2QC/x2NQQqAIBAAvxJ7bsHUMvpKdNDaag9ZuBBB9Pes4
 wwMc4NQYhLoihsSnSy8xwxVWcC4+rgQ8pQZtNJGWeXw2JyuVUDhCZuWjPN1q60lyEXwQhiSj+P
 6NZ86Es18/YN+eJ4XQxop5XAAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Like other Qualcomm PMICs the PM7250B can be used on different addresses
on the SPMI bus. Use similar defines like the PMK8350 to make this
possible.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: pm7250b: add missing spmi-vadc include
      arm64: dts: qcom: pm7250b: make SID configurable

 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)
---
base-commit: 7e364e56293bb98cae1b55fd835f5991c4e96e7d
change-id: 20230407-pm7250b-sid-68e37a58244e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

