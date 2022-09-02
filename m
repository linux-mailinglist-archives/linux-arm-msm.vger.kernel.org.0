Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6200E5AB19B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 15:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237278AbiIBNhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 09:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236125AbiIBNgi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 09:36:38 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2DC7C650E
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 06:15:43 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id w5so2247770wrn.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=x8rXHKjaa2aXeC9M5lYniYfV4sm91ObQv5fbsWzk4kM=;
        b=x+KSvoatjvCNH4M+6+/LAg8H+Y5Z/TDD+EOiSZBQE3efEOM4SWuk4ae8weKO8wGmtU
         qW+jXwUu+4pOZ6+vr2j1LZECKdXxL2X7KfNZPuuC8yj6SVUvOHrI7tngO5U24+LqwFUs
         r8i3LEiWc4C7f98nwb8bkubXmnRtJ3oNzdHjgtIy52h86t28rtWq/MWuGrUWlQDoUIZt
         KWC/p+09E1nGLo2pX8BYgxBVL2WItefRbi000fb8CGdYNw45j1i5UsKAOia9QATVLSqL
         7ZvniOPB7vb6od19FhaN2T44mw1r1tLNBjq85gmA74sGy+WRuSr8z9MpT6noaxJhP5cC
         Wrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=x8rXHKjaa2aXeC9M5lYniYfV4sm91ObQv5fbsWzk4kM=;
        b=eO+Kn4Eb9Cs7o9/ueBItnKJ36w5LImNKRzUhsR/yHG27MSh03tFYXMuPbulfUmQQm6
         YL5Y+454yt65Hl7yH2qr8ygr56qvyQOlHi72zJmHiVnYEyRXvVao5OBKpZz74Kfm72Ss
         9IG3LkrphYKeBa8MS62mV5+LCQfhIHWouiOSAviqw0u3BTQSDLP7OjsO39EOm0NxlQhw
         rMrNb6ro6bE0fGXjiKKUcS99CHC9eTgSNicJagRhYubhw2lR50ISWS1kmJfxa7QDBqNA
         e7b36lSeMACrzKPGqfi97IMvWqCTFxb1ACmI8QzIrsKqmpjG85dZRPXqaDRXJdm1d4k5
         tQ3Q==
X-Gm-Message-State: ACgBeo2BeCB/fG6KIZSoS6XXhK68tZyfjReco24WHG8/cQcMJ5InDiY2
        564tgIqbI6vqH2SveNmFJlg3eg==
X-Google-Smtp-Source: AA6agR7XW15jfSdKq0j+i4a3k4hFdmBdxi+RkDoB/8dFrS8Ns6dDjVB8yGwv/C6S2IVLBU9/2m8cEg==
X-Received: by 2002:a05:6000:1888:b0:222:ca41:dc26 with SMTP id a8-20020a056000188800b00222ca41dc26mr16549410wri.442.1662124480013;
        Fri, 02 Sep 2022 06:14:40 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020a5d43ce000000b002253fd19a6asm1766253wrr.18.2022.09.02.06.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 06:14:39 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorande@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 13/14] misc: fastrpc: Remove unnecessary if braces in fastrpc_internal_invoke
Date:   Fri,  2 Sep 2022 16:13:43 +0300
Message-Id: <20220902131344.3029826-14-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902131344.3029826-1-abel.vesa@linaro.org>
References: <20220902131344.3029826-1-abel.vesa@linaro.org>
MIME-Version: 1.0
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

Remove braces for single statement block in fastrpc_internal_invoke for
remote dsp response check.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 66dc71e20e4f..cd7c6cf269a1 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1182,8 +1182,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 
 	/* Check the response from remote dsp */
 	err = ctx->retval;
-	if (err)
+	if (err) {
 		goto bail;
+	}
 
 	if (ctx->nscalars) {
 		/* make sure that all memory writes by DSP are seen by CPU */
-- 
2.34.1

