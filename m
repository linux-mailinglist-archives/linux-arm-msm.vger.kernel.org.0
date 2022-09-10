Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7825B43AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 03:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiIJBmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 21:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiIJBmL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 21:42:11 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FA578BC8
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 18:42:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso6122993wmc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 18:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=H4VqG/6ZxCN5Dh7jCkZt+AM8SOOoSh34idm5LR+1F6Y=;
        b=rJvAqw9R7VDezv7CmZTSI1YshPPugly8u70at5EuhIqxCyh+U2vv/3E/rr15qPRvUV
         m9mcGr34EDw7wLif3bPonS/DRvVI4yr5YEfMnaNEAT9/JNYYY+3zXHfKr0+ustjkrFxq
         6pHZwUuIzVRfZxJ+3XSwlmE+fyoj610rdlYbI05W9yBIYJ3GlxmXkGpBNH5iozkSoIj7
         nLxvwevq6j7IUcXi1+WIPEWHu4ZfTT5/XudURdLxsASwFagqta8xsNaVhrXetUBE9TYG
         Dg/SZ+ZCCESrSk7PnZJt7b47DULA4zLQS5IUNsjyTGb5caBoy611L4wUGJF6TBR5LPKf
         uoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=H4VqG/6ZxCN5Dh7jCkZt+AM8SOOoSh34idm5LR+1F6Y=;
        b=tu7x210fKqz/jaTpMjiHFmkMWwk7/4rlA4jXajlDOdfXPzba8D8TepWgE4rMYt1mDA
         vei55zQq6X6yXbS3Hq2Ylw+jxf09M1VanZMqdqhdrdnwNlrATRgzO0qhFe2llk6CmQIj
         8ug9GOtfOP/nOEqWs1vxag4F/pKIiqL7mgQWYfQnFQZbFluCZp+LxzIryXMNSDq0zttC
         KExviKVhZAMIEsJZg/zVVHEjoFnB7Jt0l0iWHbWwXXsco/j/9IFHZWRPud6IH7N424+k
         grdhw5aCEO1af9RGwMrkT6HCeZ06qVxYGW0UCR2TxoJnDCbWM2ggeZwIBrvaxnpFRNL8
         e18Q==
X-Gm-Message-State: ACgBeo2IJIdCauRk04z71Km//t55L1TUZdud+y8FGy5M6RWTNA/WSJZv
        Aa9vGOl4JVBNEv6tacjC4ScnxYHdXtpr4g==
X-Google-Smtp-Source: AA6agR4lnIAeVfMqEOHWFAKia+LGKyJMM3xoTgZ8OwpavR+R3R6wn5QMdUanHTeGFSwwCWxo5krJSQ==
X-Received: by 2002:a05:600c:502b:b0:3a5:d36a:8b93 with SMTP id n43-20020a05600c502b00b003a5d36a8b93mr6980266wmr.180.1662774129091;
        Fri, 09 Sep 2022 18:42:09 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j24-20020a05600c1c1800b003a8434530bbsm2420910wms.13.2022.09.09.18.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 18:42:08 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/1] Update apq8016 lpass-cpu compat string 
Date:   Sat, 10 Sep 2022 02:42:05 +0100
Message-Id: <20220910014206.1101962-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V2:
- I polled Krzysztof about the right way to do this and then completely
  forgot to implement it like we discussed. Here's V2 the way we agreed. 

V1:
Per discussion with Krzysztof on this yesterday:
https://lore.kernel.org/linux-arm-msm/20220908105720.857294-1-bryan.odonoghue@linaro.org/T/#mb16386b0b6d45de6a7d7e01733d5b6a7d0b85c25

Mark the old lpass compat string as deprecated in yaml and leave a comment
in the commit log to explain new SoC additions should use the corrected
version.

Bryan O'Donoghue (1):
  ASoC: dt-bindings: Mark old binding qcom,cpu-lpass-apq8016 as
    deprecated

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml   | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.37.3

