Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19DDD5163C2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 12:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344779AbiEAKkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 06:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345483AbiEAKjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 06:39:03 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C090DAD
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 03:35:36 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id p18so13688932edr.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ar0fHqjgo5tjZGGwiHuVSZF1o7mhrC7JpXZH7xiTZ8Q=;
        b=HA0YlrQGOcEbrOnQFUL7HkbePL0gXgr9vn8ikLY9xEPfqEzVL9ncrNyXowBON7OUe7
         3JW8Rp4bvOFAmwROWmqXBAWwOBnRy6kPj/+FJscHUoJOHOpAB7nfmfho0ejlRwxkqBZr
         p7xWcDl1Btxo2RMjICrcOXCiV+yN6UyCxiZZtNuFglVx6S8U/zGXIswbATzBqyfGlzvC
         07xujiu2XG00NA7gYasBWpCi/IR+F50X0Ggo7ke4XzkezV8hVDpwt2+twmLFKZfuS4dm
         RvTTewxRULVZ1SsJsR6wt83PX/v3U0KrRI3hQ6LXWGEHAnmEDPAE1bbyGTZSoTZq5Xs2
         Bh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ar0fHqjgo5tjZGGwiHuVSZF1o7mhrC7JpXZH7xiTZ8Q=;
        b=XE7TCUiBPmfEGwAsTbQw9TEQKBGXOsERCrAkp16gyuTubUn7HThNLlzvUmw8SMIcvR
         sigPqJNWCdlXVAbOwpMaO1tBy6txw/1wBYcKEs++y9uVuwKR48/+sqTKuIHtVl8TAb2M
         leHZVOhiEpp509EQfKR7TwuaAgr7cM1AbcAyuoqd3s/BOsyPe0MijZ7SfcM2+Uy72N4n
         XCs5UBRHUzeCsvlUWPyTT/WQCCd2NbBHCBfiqjgVb2hTmncHAc2DDu8IIGOCsl/0oMx8
         w4bIPSUX5/8tPDynkMd5Flkjpfp1xqHn+9300qZjzYmwL4aBK3GeQ2CHdRvH/SAMpwwV
         7bhQ==
X-Gm-Message-State: AOAM531+fCK96WZQ/dnP2e1kYZa+NWMZ4Rt2JOayBRZPI+e5HvurfVD5
        0Hq3Jenbse1rzqrwmlXvCtprmw==
X-Google-Smtp-Source: ABdhPJy9iVvaPS8D87fk1AoL09KIG6ZEc5xrgHANt4r9I88xIeHGNAyPFrABB+8y+uGv76PyVuSb3g==
X-Received: by 2002:a05:6402:34d4:b0:426:3517:ba77 with SMTP id w20-20020a05640234d400b004263517ba77mr8287511edc.260.1651401334751;
        Sun, 01 May 2022 03:35:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214df1sm2464438ejb.87.2022.05.01.03.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:35:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/8] soc: qcom: cmd-db: replace strncpy() with strscpy_pad()
Date:   Sun,  1 May 2022 12:35:19 +0200
Message-Id: <20220501103520.111561-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The use of strncpy() is considered deprecated for NUL-terminated
strings[1].  Replace strncpy() with strscpy_pad(), to keep existing
pad-behavior of strncpy.  This fixes W=1 warning:

  drivers/soc/qcom/cmd-db.c: In function ‘cmd_db_get_header.part.0’:
  drivers/soc/qcom/cmd-db.c:151:9: warning: ‘strncpy’ specified bound 8 equals destination size [-Wstringop-truncation]
    151 |         strncpy(query, id, sizeof(query));

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/cmd-db.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index dd872017f345..c5137c25d819 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -148,7 +148,7 @@ static int cmd_db_get_header(const char *id, const struct entry_header **eh,
 		return ret;
 
 	/* Pad out query string to same length as in DB */
-	strncpy(query, id, sizeof(query));
+	strscpy_pad(query, id, sizeof(query));
 
 	for (i = 0; i < MAX_SLV_ID; i++) {
 		rsc_hdr = &cmd_db_header->header[i];
-- 
2.32.0

