Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83DBF5BDA8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 05:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiITDDt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 23:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiITDDh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 23:03:37 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0655852C;
        Mon, 19 Sep 2022 20:03:34 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id f23so1061472plr.6;
        Mon, 19 Sep 2022 20:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=d5r8esVy3ANfC6SBBM4WymwNqfWTzCsP7FNOWu86Js8=;
        b=RqQdyrt4NByyAV7PPMdEj9SQxke+vAHOtZYJqIe2LHCWILuKHvCXwBbR7TWc11uLgJ
         wofBmq++Vk1fxwzkgSF0EK42iZmOFINmut8or6OyBPOQs0oRWTPqjm+ISdPN4kfNQdG5
         IP1fcz0KzQdMV++IhvUQvLOOtVyXY14gPOIQMdvdHkRo2qwfj7gBgHBcI4J8Oc6zjoth
         s+4UJ6g95prcEJkllFZSI9x1PkQYUAFXKKYHLmRVMA++Y2M+VCRztWjVKaa/lqb8QiOE
         y6Vz5Kut0h6lUBs042WbMaHtcFd5w2nLd1oQxZOPctzyBKCCWHkvXwNPA4KGR1Obe1Wn
         CIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=d5r8esVy3ANfC6SBBM4WymwNqfWTzCsP7FNOWu86Js8=;
        b=qfHlnu52XhvvxtkMMDrNHCkWLY1djziNR3A+umlBylW6aRyG28BHCAINQZou3ibtK1
         zMSmpp2QlkxATKGK4Nu+s617jig3hwqdi+bp9Bl4EO6tDdTO3oxFTt20AZD81Tq6PAD1
         VWAmAIHFRe1e5nA9jkMqtt4VaudpHB08x9rG2/bfX1vf/ifHp66nrbvv1hnYtatTIUfH
         hGlgOUEEGPrukbFnVBOqmLnm/w5V99zTzxRdWDakcHUp5/lktBEl1x+nK18GBZnWXkxA
         DDal1ajhWBWgqcnNMpWgf/KqkeW9vxDTBtbLOrONA1hjunsv+G+Av5tY3cpkQLtb9TiD
         fm+w==
X-Gm-Message-State: ACrzQf2Q5xBye8hN+uG4Facy7OQgH+fMuIU3l/XaTi+uWkbndl8KCZpx
        jdqVgEXUHA3HdunXzIFq43Z41XHc4YM=
X-Google-Smtp-Source: AMsMyM7qQOt6IFG9IWx7pIYxYDwh3PAFGAQQBeGIAftcisP4cnSQPSa9oc3dEYRGnIJOv0tFh63Efg==
X-Received: by 2002:a17:90b:194a:b0:202:e6eb:4b62 with SMTP id nk10-20020a17090b194a00b00202e6eb4b62mr1514543pjb.33.1663643013801;
        Mon, 19 Sep 2022 20:03:33 -0700 (PDT)
Received: from skynet-linux.local ([2406:7400:61:8a0f:392d:db19:673c:627a])
        by smtp.googlemail.com with ESMTPSA id t193-20020a635fca000000b0043a18cef977sm171083pgb.13.2022.09.19.20.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 20:03:32 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     andersson@kernel.org, Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: [PATCH v3 0/4] remoteproc: qcom: Add support for pronto-v3
Date:   Tue, 20 Sep 2022 08:33:12 +0530
Message-Id: <20220920030316.1619781-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for the pronto-v3 remoteproc found on the
MSM8953 platform. It also converts the documentation for wcnss to YAML.

Changes since v2:
 * Fixed email for maintainer
 * rm qcom,wcnss-pil.txt
 * Add more details in commit message for qcom,pronto compatible
 * Fixed dt_binding_check errors

Link to v2: https://lkml.org/lkml/2022/9/8/1199

Sireesh Kodali (3):
  dt-bindings: remoteproc: qcom: Convert wcnss documentation to YAML
  dt-bindings: remoteproc: qcom: wcnss: Add qcom,pronto compatible
  dt-bindings: remoteproc: qcom: wcnss: Add compatible for pronto v3

Vladimir Lypak (1):
  remoteproc: qcom: qcom_wcnss: Add support for pronto-v3

 .../bindings/remoteproc/qcom,wcnss-pil.txt    | 177 -----------
 .../bindings/remoteproc/qcom,wcnss-pil.yaml   | 288 ++++++++++++++++++
 drivers/remoteproc/qcom_wcnss.c               |  13 +
 3 files changed, 301 insertions(+), 177 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml

-- 
2.37.3

