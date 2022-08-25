Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935545A081A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 06:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbiHYEkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 00:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbiHYEjt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 00:39:49 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A32A9E0F1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 21:39:31 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id pm13so10216110pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 21:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ev+//6osdR20vXmjWVObFi6l/lAHjsPO3JFHLib7qgk=;
        b=VbuUYXbO7e5MzGlXMzi2enXFgW1KN4hN/nL+aVWGyDW8ItLK1OiZEOIEqXagAWVRev
         +8+Vj2xgGZ0tHQLU2vVpoBg0s0sMYlF7y9ktoFJgEy1GOd56dS1tQvmSQGBD+Wwz+0mn
         ViPZYRK/fs/n2NhohftHfFvqTA0OZWPDWbmhOviAe1DAM06qoAj02iyB5sIrlR+a12vw
         w1ckz3RwjHhJBjVC1rA6qqf84ZjEVtTP5sS51YW6EPx3juwsW+OCjaWUJShdMwhn0rxI
         H+v6q+XVrIfMCpV2cA9lVzgpzwT+EZKIJTvJvtNgkC3TL2JYsR+cdCG4W1HmgQKClg9f
         7IWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ev+//6osdR20vXmjWVObFi6l/lAHjsPO3JFHLib7qgk=;
        b=qkFV3Hyc7olpeb5WveB31swJZ/HzNAY4+W9tqAh7rAyNYwIK2y0v9ln664sImwjD8G
         MSAhXiCddSRj4LE83T8BxK1WRAYbl69T6fWdZoqZ1khQdCcIk6RQFTQgzK0vwj7djsP/
         rNUZjhhqagqprybbtJsK6qAPaPvJCjHBlaeJMMixPjFF2eg3lvw5c+LJoKtdOB1brxTu
         d6z1nsg61fJ1WxVxoIVZjk/x+Z7IMnpLThZY2LbofyRDTnLJY5h5Obc59SRRqWexMe8V
         5VLUDRvlkbXosK9vF7EUT0g7x1zsVxwD6ZA4zIYrzDhfZFfaQtB4Mu25nL7HYXHWwGiL
         7GMA==
X-Gm-Message-State: ACgBeo2ilSEvwIsEIFl0YBaYmvBp/wIuo9xeC2sSfXKyCTQUDRASFX0n
        eQjoqgw4tYEymMVi8dvpDygkHZegJ/uJ
X-Google-Smtp-Source: AA6agR7uSvrEL9loMv2SaYVbtilMYhslUHMb+lZ4qjEowHtxCfa+nmdlp4yNcRWxe4e/wF7QWpJ5iA==
X-Received: by 2002:a17:90b:1b4a:b0:1f5:5578:6398 with SMTP id nv10-20020a17090b1b4a00b001f555786398mr2609753pjb.122.1661402370341;
        Wed, 24 Aug 2022 21:39:30 -0700 (PDT)
Received: from localhost.localdomain ([117.207.24.28])
        by smtp.gmail.com with ESMTPSA id i11-20020a17090a64cb00b001fa9f86f20csm2294296pjm.49.2022.08.24.21.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 21:39:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, bp@alien8.de, mchehab@kernel.org
Cc:     james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tsoni@quicinc.com,
        quic_saipraka@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 5/5] MAINTAINERS: Add myself as the maintainer for qcom_edac driver
Date:   Thu, 25 Aug 2022 10:08:59 +0530
Message-Id: <20220825043859.30066-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825043859.30066-1-manivannan.sadhasivam@linaro.org>
References: <20220825043859.30066-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current maintainers have left Qualcomm and their email addresses were
bouncing. Since I couldn't get hold of them now, I'm volunteering myself
to maintain this driver.

Acked-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5012ba6ff9..026dd33b106c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7432,8 +7432,7 @@ S:	Maintained
 F:	drivers/edac/pnd2_edac.[ch]
 
 EDAC-QCOM
-M:	Channagoud Kadabi <ckadabi@codeaurora.org>
-M:	Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	linux-edac@vger.kernel.org
 S:	Maintained
-- 
2.25.1

