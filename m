Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A27517B41
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 02:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiECAjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 20:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiECAjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 20:39:40 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD58438BF5
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 17:36:05 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id w5-20020a17090aaf8500b001d74c754128so891303pjq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 17:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uqiaq7Jqs3Kyzc97Ns7y2Q4dTJuj+TxHkNHfjMJ/lmU=;
        b=ejvH4/c2stqT98pdw1Fp7eB8qphh7WHLRxZuBH6OLtPxNaQhMKKijIdWEoYn68PNWD
         Lggq8xbxLbtpsay8ghlOKYxLQYY8jP0VoriJK8DYX0uAmgG2+lJoRfofltqr54Zh+nYI
         qX1HgaOKO3K6/9CzN8iFw55x7NUAFxnU8bD2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uqiaq7Jqs3Kyzc97Ns7y2Q4dTJuj+TxHkNHfjMJ/lmU=;
        b=S62Gfn0p1RqALtnTAj0jnhS3hYTfM+j6zVu9HQpYVbqg+aFWuzM47jDjuCkxyIP5HB
         hvOgggw6yUQa0YycaLqmubRrUi1bcDbLsVbmYxOUcgRSIewlfpen/qXhHN225DZlkTME
         dvXdUAuucP6NMOYFH/YMW5iCvi3ySVGoSSUHqOMXw+tI+5altC6MUpWxNtYFxLuis8TB
         QlNoMqxmsDj+D8XR/CtLY+OrE/l1QhnBxsQRqZXVzQwV0EeFxF6RZh73HtUAXacyr9/b
         U5argPs5QORYNazCJPEGuXCV8dWoIRVpTApMgO/oNGxlzIjwwZm8Xmt4/hVbByFAE9U+
         ItSw==
X-Gm-Message-State: AOAM531lUbEtX5Wa8sPvg5XltNJ28DTk8t+DRY7zE8jz1CDQyx16+W4c
        l3fLCSLL4snp5EQUSPFw1MUt/A==
X-Google-Smtp-Source: ABdhPJwCS6A1z84jdM1427Au2WBhQuzjFtJIpPBB5tzeBQ+TItFksouHXRb54ywuVzNVXXP2gp+SiA==
X-Received: by 2002:a17:90a:4581:b0:1bc:d215:8722 with SMTP id v1-20020a17090a458100b001bcd2158722mr1908183pjg.149.1651538046729;
        Mon, 02 May 2022 17:34:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:b078:bf46:ffc:3276])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902bc4400b0015e8d4eb1f9sm5187303plz.67.2022.05.02.17.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 17:34:06 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     matvore@chromium.org,
        "Reviewed-by : Stephen Boyd" <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: Add another ID for sc7180
Date:   Mon,  2 May 2022 17:33:45 -0700
Message-Id: <20220502173338.1.I26eca1856f99e6160d30de6d50ecab60e6226354@changeid>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It appears the some sc7180 devices, like the one in my
sc7180-trogdor-homestar, report an ID of 407 instead of 425. Add
another ID into the list.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index cee579a267a6..2ef1dc2a1dd3 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -318,6 +318,7 @@ static const struct soc_id soc_id[] = {
 	{ 396, "IPQ8071A" },
 	{ 402, "IPQ6018" },
 	{ 403, "IPQ6028" },
+	{ 407, "SC7180" },
 	{ 421, "IPQ6000" },
 	{ 422, "IPQ6010" },
 	{ 425, "SC7180" },
-- 
2.36.0.464.gb9c8b46e94-goog

