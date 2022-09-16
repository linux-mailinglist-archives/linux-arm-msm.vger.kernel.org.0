Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4B95BB062
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 17:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiIPPlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 11:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiIPPlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 11:41:17 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161DEAB4D5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 08:41:16 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a26so21588280ejc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jjOx+eaOm9REiti8lJSasVk8F5SWyKCCLMEi5kN3twQ=;
        b=Bx+LSNKqX1Y9FLiiS9Rs1xk63Lihp2h+GrZEEeBZwdt+R6v09IiihpSgkJemuwnGOv
         ffgu7b/QOo0GgKgnwUV8uZVhSzuV05mWb0ZFSS3M23YwvAsmGOt2xG2WXKo2XABzJSVo
         Dn5LpfFZQENYc4sFN/cFoPHt2/MWytHd3/hkcEGkFcE2Ti9PbVkJe2XEM2+QCf9Yp6Mk
         oMutSzSgR7CBpVhV/pa4JmEAlEb6hMXG2M58dP0bPDUrnbHF1PLY8cNPQiJ6gtyptpm4
         Fq0RD/Cqz6TC5pify7pQSID6y9pMRGAUqScbeH16gYnUmovrhYWP0047WeESO40IubDg
         svjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jjOx+eaOm9REiti8lJSasVk8F5SWyKCCLMEi5kN3twQ=;
        b=ND8yFmk/BUQ38vOtmxTCzJRO8MRjHooZUvjKXkL5UtCZL2xayp47MuiUx6UiN2yZpe
         4pX17cqvOHBWk3gUot+s4OXiCMClqBPPnFV+P/FYBlNo6oh8YBIzXYUbp1SeUcDTj7HM
         tjyYjUhdPNjEtsUKn7BBeCXC8I+0UMZ0athCpkDMX15DDr59WrTz031rlubbAYrUnAn2
         AEaop3osXrYf6vI9a4o8ZSoWmGIz0HpF7gSHmg6Z83TuZDuMfB14TS72L104TmPvonwH
         fm0MLsFjEMIxwzITlQ8r8tyPpT1CPlbB+v7YwqV0F4Pu9hoo2C2cdTWImY3H9Q+243Wc
         6Y9Q==
X-Gm-Message-State: ACrzQf1kU+Zgha6tigDRF80Ke7D21QgPcbP7FvdNjiMue76R7ulMyuyR
        uScTPn53pxpCryjnMKXSAZS2DQ==
X-Google-Smtp-Source: AMsMyM4xRr3KlbTp9txd0c57bsm+J8VrgkPiNf7c5d19G/TywnHs0sZB5RDvTpDyvCC2324QoDLn8Q==
X-Received: by 2002:a17:907:8a1f:b0:77d:8e2:66bc with SMTP id sc31-20020a1709078a1f00b0077d08e266bcmr4202343ejc.189.1663342874656;
        Fri, 16 Sep 2022 08:41:14 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709062c0a00b0073d638a7a89sm10567707ejh.99.2022.09.16.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 08:41:13 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Himateja Reddy <hmreddy@quicinc.com>,
        Anirudh Raghavendra <araghave@quicinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/9] misc: fastrpc: Rename audio protection domain to root
Date:   Fri, 16 Sep 2022 18:40:54 +0300
Message-Id: <20220916154102.1768088-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916154102.1768088-1-abel.vesa@linaro.org>
References: <20220916154102.1768088-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The AUDIO_PD will be done via static pd, so the proper name here is
actually ROOT_PD.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 80811e852d8f..f80a00e9f508 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -83,7 +83,7 @@
 #define FASTRPC_RMID_INIT_MEM_UNMAP    11
 
 /* Protection Domain(PD) ids */
-#define AUDIO_PD	(0) /* also GUEST_OS PD? */
+#define ROOT_PD		(0)
 #define USER_PD		(1)
 #define SENSORS_PD	(2)
 
@@ -1889,7 +1889,7 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 		err = fastrpc_invoke(fl, argp);
 		break;
 	case FASTRPC_IOCTL_INIT_ATTACH:
-		err = fastrpc_init_attach(fl, AUDIO_PD);
+		err = fastrpc_init_attach(fl, ROOT_PD);
 		break;
 	case FASTRPC_IOCTL_INIT_ATTACH_SNS:
 		err = fastrpc_init_attach(fl, SENSORS_PD);
-- 
2.34.1

