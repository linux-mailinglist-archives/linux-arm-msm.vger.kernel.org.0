Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDE0E735BF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 18:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbjFSQN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 12:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjFSQNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 12:13:25 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1156B1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 09:13:23 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b4725e9917so23447651fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687191202; x=1689783202;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdJyfM0wQbXVorPTo/xhbHvwBGV6R1GO0tiAajjVkTc=;
        b=GJ6cOZ91sa5wua2rUcyeQ0M2MJI+XPL9FfWQmkX0F1URArzw2jzsibCA3VVVsfRju0
         BYEzsgEbbxZtBa8kZM17Fo8qhzDvnlH9+fL6zGk0toceoLIxcgwRx77AAJ9kuQgv6wn/
         D6G6sWMJxT/nimw5A5ciI6shRZzZVMk3DUq9+GTsPD8CtBshrUn2pXtd0zNvY/gm4tRT
         FZW5b92KH/lfRH/IieMylKY63mUKF7mYIm00SUBt3bAHZF/1VRqh0OsPwnlAsk+l5nqB
         yBpYJyEN4m5i/JuSQL3ecdSWbEZOLUqLLGL3fbcxbzlr8zQ8IpoyakdWAsNNqO5/8zb3
         MBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687191202; x=1689783202;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdJyfM0wQbXVorPTo/xhbHvwBGV6R1GO0tiAajjVkTc=;
        b=PSAAlDrhwl7xgP0Sgbl9zXvvMy2SM8/Azs1eeoTXMZaBZ/ogWa0eR/G77yrU8Pn4WK
         f5pIth8fHLGOO/kD5QNRSYja2s9QoIiRKQ1fKFM3YqaFDmui2njVjQuM9pJmUhg2TGXN
         rxxMfJ9Xtfs6ZFqbjXb26ijGo+nja8wbC5LARhkAdP8HPU9gsSop+N6C9iZibQ8TZk1G
         03ChIWvGQWmBx63uw/GHfDLK4dkOtzp/szkTr7TGRoeIZLhe2gcqndZW1cQ5GC8EmxtT
         Dh3pj4wIZdCfklxFerOdzNk+xISVTf/CCkNCIx8o/9AxS8+i2+N9CrI/0F2NGO0PIY8k
         Vvxw==
X-Gm-Message-State: AC+VfDww2i9V0FhEqeC5bET/40qolHssGPOpvsm1d64XyzNQD9MZr0Kz
        dxHSbQSNpxbChVFxZDMEOfuQ5g==
X-Google-Smtp-Source: ACHHUZ7toL2rdZPnjv56/gQRsxXwX8ZSK5dbAZyZn8H5ZcAQi5iTHDxmxNhoI9rEpwj/K2sTpYXB9w==
X-Received: by 2002:a2e:9f54:0:b0:2b4:479a:aaba with SMTP id v20-20020a2e9f54000000b002b4479aaabamr6051054ljk.19.1687191202175;
        Mon, 19 Jun 2023 09:13:22 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id x20-20020a2e7c14000000b002b471efb253sm1011714ljc.46.2023.06.19.09.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 09:13:21 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] SC8280XP clock runtime pm
Date:   Mon, 19 Jun 2023 18:13:16 +0200
Message-Id: <20230619-topic-sc8280xp-clk-rpm-v1-0-1e5e1064cdb2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJx+kGQC/x2N0QrCMAwAf2Xk2UDWoVR/RXzostQFa1faKYOxf
 zf4eAfH7dCkqjS4dTtU+WrTJRv0pw54DvkpqJMxOHIDXforrktRxsbeedoKcnphLW+c2NPgzpF
 CjGDxGJrgWEPm2fL8SclkqRJ1+9/uj+P4ATBEOaB9AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687191201; l=659;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6t4hMp1VbI7Kk57kUEUY0uBWHVgMinJG5qAuxHi3rEI=;
 b=OmHWFgsr/nCvi5E1fj7GlkSK0nx2BNJNlkssqEyX1dGu617b4n32KYICXInHl8DsUnuAGb9LD
 Q4PkgKAliFHC9NVaqmsYrEzsLVsCkQli+uZXIuLo6iGYbQjLKnyDHCF
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Keeping power domains always enabled hinders power efficiency. Add runtime
PM to 8280 clock controllers to prevent that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: gpucc-sc8280xp: Add runtime PM
      clk: qcom: gcc-sc8280xp: Add runtime PM

 drivers/clk/qcom/gcc-sc8280xp.c   | 18 ++++++++++++++++--
 drivers/clk/qcom/gpucc-sc8280xp.c | 19 +++++++++++++++++--
 2 files changed, 33 insertions(+), 4 deletions(-)
---
base-commit: 47045630bc409ce6606d97b790895210dd1d517d
change-id: 20230619-topic-sc8280xp-clk-rpm-dc80325f0aff

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

