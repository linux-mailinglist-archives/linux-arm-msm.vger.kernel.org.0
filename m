Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D696B53AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 23:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbjCJWCQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 17:02:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbjCJWBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 17:01:41 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42B354CBD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:58:23 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id s11so26199142edy.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678485502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2Xaj4iSh689/qyGj27neiGsk9yl/lficUi8UV/fm7A=;
        b=Y4b1J0gjRieah4UtLC5DqfEKBMioS7NaU7ooQRSeKaKrTRYnu//H422w8a32ewkD9n
         F/JxGfFa/idU8S20IHQvz1O290iTgRX1PgH0RTTlYIcrOC3MgF85l/2NO8QuJwfpEsFu
         wq44Fd2kiMwLBhE5/m5n3BvX8NO/bqwwosNbum9zOK5sAEGhCptUZx3/jay7mEOo8iE1
         GN/3Y8hHWCNupHHujyV+yNzxkOQF15wLZ3pIfctwz5K3fozG5fbF7ArNGetRAoekJ51H
         rFci3basmhcjGfwJPjsrMv84Fr8VGbK3VcR674Z6PdtUqzKwbMaVd70PHfYk66pXIHPq
         In1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678485502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2Xaj4iSh689/qyGj27neiGsk9yl/lficUi8UV/fm7A=;
        b=kT/Vy4r0qsyyG1yXBvTSK+hlJ2peKHb+yVnRZcAzJEb9TBEOQxbCkTTsR0GmM5PP22
         SHa8kxNmuNVxH11AZnEjQC19Tm6GVbH1/IR7Kl676/FgaMs7hZ5Ry6b700dUFDECV5lC
         NXGqm23enCgnn794S/B5VumyUhyUCKRdNN/OJjoNueujbdo/3SaqKQZmLYYFwgE1q8Bw
         1MsTDrV/YW7Mz6svAk0oJlX0FSx3DC7IfS7BSbXpBHPKheyUc+6ALg40lWZbuGOKAQZs
         qcdcN7Bx/nzx16kIYv6Wc5as71aNEvJ9x9RsrF7fIclcoeGxoAgna/sdtTYBYuOW1Iz0
         so4g==
X-Gm-Message-State: AO0yUKUR+Oao6KORpRPshXOYTCtbv5uAGMfRdD82pc5bugGqWBOehSBI
        SD/WqbnPVa//n+hnNytQLLGvHm1QpQOMGi/qGH0=
X-Google-Smtp-Source: AK7set8Y8CbDyNpUk1qL/iKlbybJRcErNtYcWdpv7HASkaB+D40FRo/ph2ZBE+VfNIL0RyiGBCovDw==
X-Received: by 2002:a17:907:a603:b0:886:7e24:82eb with SMTP id vt3-20020a170907a60300b008867e2482ebmr27928777ejc.21.1678484759246;
        Fri, 10 Mar 2023 13:45:59 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:45:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/9] regulator: mp8859: Mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 22:45:47 +0100
Message-Id: <20230310214553.275450-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/regulator/mp8859.c:132:34: error: ‘mp8859_dt_id’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/mp8859.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mp8859.c b/drivers/regulator/mp8859.c
index f2300714d5a9..f893dadf2abb 100644
--- a/drivers/regulator/mp8859.c
+++ b/drivers/regulator/mp8859.c
@@ -129,7 +129,7 @@ static int mp8859_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
 
-static const struct of_device_id mp8859_dt_id[] = {
+static const struct of_device_id mp8859_dt_id[] __maybe_unused = {
 	{.compatible =  "mps,mp8859"},
 	{},
 };
-- 
2.34.1

