Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58E152CD1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 09:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbiESHdK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 03:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiESHdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 03:33:09 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C361C9346D
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:33:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bu29so7667786lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ALKgqLX03rO1JXR9FQHpQsvlscWjKCc3EL2LxNPWDa4=;
        b=jJ8J4mqV9cqzWX/FHDUWZ9ZfihApeYo0kNor+zZTTfLaNjiAdT+yiXoVU4gMgyXE7I
         J+wPnINsxiGrac62g0wYS1dDSUSvsPLxQdpx/tIrQGcHWOYOL1Y+/vLm4M0afCpH3YWz
         LjRh/QWLyvUc0cIk49613szHNas734U8wIsuOE1zPlKrGAP75OU1dWEp8Wfw0G/siPWW
         Pds3mCP5llT/3bnrARBdpAxx0qpBJrZ90rk02fj+YxTxSyyx7iIur1QmQC9PyLIpMb6n
         0V/wspNLxjJuwnHNmhLqUIbXvCmNVuNDdFCYlyUJ8AMR2G7OHQpd9oE/n3MqOv1V18aY
         ArNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ALKgqLX03rO1JXR9FQHpQsvlscWjKCc3EL2LxNPWDa4=;
        b=WvbjcC/m5scicf63d6JIdqqQrfJqz8H3jbSUAfMfmIAQOLbEnbufFaq+uNfQm2Hnjo
         Awy/hVQ+Hr1mI5u1rBuLfUpOhHyrZpEUtm9/20NsgqTxIYdGY18SNdt6wUTJineESRKA
         fMce7jgF+D9Lte1eGfAhV19hAbCrfnI67C/XLUINvgWkup6CrPMh/L588tOE+O1pkzkU
         9IL2ddgkg/PqhfRebAncS+RUWyMxOy7rckzOmTaHyeAloHsRbJDue611PCq2quqtSaIK
         1YNCE61XRL1fdZm6J6euKjOFjrtknNmuAJd0h+tu1Vs0sHvXjTCGsCPa5XWHcNDQgyTc
         sZnQ==
X-Gm-Message-State: AOAM531hs9mKvLs+Ug3GLW5ghlEHZ/c54gXkQsF7jqHAWDwZINhMd6j+
        bV464hXctlJmg3f0hG14qIm8pxmNILMOKelv
X-Google-Smtp-Source: ABdhPJwJLswrPA/dEHn9WngV+DPfXX92bZvOd6QeRYtc5iny1je55P/WAJmGscSzDwdDSkLUfTlsug==
X-Received: by 2002:a05:6512:3092:b0:473:e56f:2906 with SMTP id z18-20020a056512309200b00473e56f2906mr2314368lfd.327.1652945586162;
        Thu, 19 May 2022 00:33:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w10-20020ac254aa000000b0047255d21117sm187406lfk.70.2022.05.19.00.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:33:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] soc: qcom: cmd-db: replace strncpy() with strscpy_pad()
Date:   Thu, 19 May 2022 09:33:00 +0200
Message-Id: <20220519073301.7072-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The use of strncpy() is considered deprecated for NUL-terminated
strings[1].  Replace strncpy() with strscpy_pad(), to keep existing
pad-behavior of strncpy.  This fixes W=1 warning:

  drivers/soc/qcom/cmd-db.c: In function ‘cmd_db_get_header.part.0’:
  drivers/soc/qcom/cmd-db.c:151:9: warning: ‘strncpy’ specified bound 8 equals destination size [-Wstringop-truncation]
    151 |         strncpy(query, id, sizeof(query));

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

---

Changes since v1:
1. Split series per subsystem.
2. Add tag.
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

