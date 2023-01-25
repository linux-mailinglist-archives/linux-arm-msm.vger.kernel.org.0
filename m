Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F43B67A931
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 04:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbjAYD1j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 22:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbjAYD1f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 22:27:35 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6184253B23
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 19:27:33 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id az20so44269054ejc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 19:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8yI4D19A3zvdlQ4ZT59IRthht8x3VHaXY1Au/V48cMo=;
        b=owOB9nKtZat9CDlmunspe/x7iuJ/t+kdvJgE+dnUI6v4p+OvwYC6foKjQEUqscJ0uQ
         tcbJCOfNZjoyo0ROy8BvdBm4bE1SEjfHsKiREvVnSyzZLLtsw5/z8C7c8eiQLEtUW3yU
         dJ1G/tFBDlq/9wQH+1xgw+O/MVh5nbpO/39JWen5t2pr526/SzNmPF5LOZfYw62oyEvp
         YyXBWjlBnqK9zjEyTjDOSLM5DTHoploi5qAfijFJBbFAeNZd11HyPuxAZw1fTB86886N
         R6CE3BPRIgR9YyNMMKy6BKczfbhRLCrjd1csgsIEnJ2jDW/E+LFoK3Dr/wzadSz9kkWL
         aITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yI4D19A3zvdlQ4ZT59IRthht8x3VHaXY1Au/V48cMo=;
        b=7n0Tx6XD3Ntlh273OwhTc/uIvTS8lGy5uV3icw9NgJ+uno5BjatN8Okm8Ie9e0aCx+
         fP2Q8z5RTytFsKdMz+QKb6NIffaroTJzCHx2HGlC6hduI+kIk9doGcpME4LzMmFoPBTa
         855qFPUUQtR2ekSmvifMZW0yDJ1oJktrN9WEb2WzoYAZryFh0Exhjqi7OvV4GUmnlWHa
         Mex0pYdIKQY62rEfsRt+7knii1jm0xculHDC/bHFHdK7O4gfdY7awKsWyVHCX5F5KxVD
         pp7ONsuvXMLQCSIPq58BvKtWKut5bf0jGffuXGurc+9zGWi/tcjXdEQbQWCMU9XNT+kz
         8RXw==
X-Gm-Message-State: AFqh2kqdnzM9qnxs4mvGPpyVO62UZ2lueywR6rfxs0hggxfFhxUNswoT
        maGwQ62YnYqa8ukU1QWnMsMwkOouB5X48n3O
X-Google-Smtp-Source: AMrXdXuSB69nlC0pNQQ5PAbbM0tMijwhxASuNfjISYwqAvLjMPtT+3XIBb23a8A1sXGXfuBK+k3XiA==
X-Received: by 2002:a17:906:25db:b0:877:6a03:9ad1 with SMTP id n27-20020a17090625db00b008776a039ad1mr21199870ejb.7.1674617251694;
        Tue, 24 Jan 2023 19:27:31 -0800 (PST)
Received: from localhost.localdomain (abyl109.neoplus.adsl.tpnet.pl. [83.9.31.109])
        by smtp.gmail.com with ESMTPSA id if10-20020a170906df4a00b00738795e7d9bsm1742913ejc.2.2023.01.24.19.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 19:27:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/7] RPMPD cleanup + parent PD
Date:   Wed, 25 Jan 2023 04:27:21 +0100
Message-Id: <20230125032728.611640-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series provides a big and necessary cleanup for RPMPD..
Lots of redefined objects were trimmed as well as some stylistic
and maintainability fixes have been made. Also, support for parent
PD is added and put to use on SM6375 where VDDMX should be scaled
together with VDDGX.

Tested on SM6375.

Konrad Dybcio (7):
  soc: qcom: rpmpd: Add parent PD support
  soc: qcom: rpmpd: Expand #defines into structs
  soc: qcom: rpmpd: Hook up VDDMX as parent of SM6375 VDDGX
  soc: qcom: rpmpd: Remove SoC names from RPMPD names
  soc: qcom: rpmpd: Remove useless comments
  soc: qcom: rpmpd: Move all RPMPD definitions up and sort them by name
  soc: qcom: rpmpd: Make bindings assignments consistent

 drivers/soc/qcom/rpmpd.c | 790 ++++++++++++++++++++++++++-------------
 1 file changed, 522 insertions(+), 268 deletions(-)

-- 
2.39.1

