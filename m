Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C1D1EC373
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 22:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgFBUIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 16:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgFBUIm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 16:08:42 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667A9C08C5C0;
        Tue,  2 Jun 2020 13:08:41 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c71so4117132wmd.5;
        Tue, 02 Jun 2020 13:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y+jeG0ZqrVfo+FYQhNDp8MJBv+24WC+dS4BIyM6NDKs=;
        b=XeGLUQDpIvVZAOhGXpLXoZ05/8oUpeyco6yuo7H62Woq7W0xuRq/vW8rR7DVUd5vyK
         XRT+q0lM/SslslRba+wUrENsCNIc/bbU/bWGc6H/5fqWNY1sK8neHeAu42wFglmugOCb
         E7Cazu1TF7B5nKz67/cIbG3dc+g12izo+T2DNCw9FkXPAPmK3bdIR+nZqZbklxnHLKbZ
         bAjse3nKUsi9EJzAQwrwrF5JWpK21x6utpsLFDkNjAPaxX2P2tIKpsUhtKZxH66RSWuW
         q/fKOpPqXPXsPhhtnWCoRgVG+f1FsZm/otqRWlVC73rJkapyqnSCc0wHolaPMAGjBzn5
         B+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y+jeG0ZqrVfo+FYQhNDp8MJBv+24WC+dS4BIyM6NDKs=;
        b=HKKZjTzvXOpRmjamRB0OpiHYH1etoZtLNWHIUfF5jcfTF0reuUIFspUx2w9CydcAiQ
         sMLllnX0qZ6oC1ysEoWPbN2KM5WwN2Wlo7AsUUHnKZDQduYB435F7tpL5nuqZEoDSAV4
         3n6tYvFWmmshXnKV0ZrZSHGKmuOFw642tAYkk6nZoj++UDHySn9dYN3Ip9WRQ9lZ+22U
         iDQU61h4f385KO7mutYGXa2c/SC8vHtjPK7Rp5QwmAoQmNcUZewawSeHmCiLLXDANWaS
         MPjN5dSvo1KX+CAHxaXSOrUFg9m7rU4tkn3JOoHV4hH/6PcuU1Puxh861MH+WBvZdxuc
         VgqQ==
X-Gm-Message-State: AOAM531rfqkOyxhklZlUsEfKQSuGbBGsKKj3o67GVkuhgWsn4jI/EjFK
        Y7HKtTd5Q+PL7F7nQ2ccFiE=
X-Google-Smtp-Source: ABdhPJwYnaOip6Sui7beKMmyEvg77hj+NaVMFX+2mWUkUmTT6nLerN0vv4KB6p1wrJ29FZ26pve46Q==
X-Received: by 2002:a05:600c:2201:: with SMTP id z1mr5480279wml.70.1591128520179;
        Tue, 02 Jun 2020 13:08:40 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id c140sm1164317wmd.18.2020.06.02.13.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 13:08:39 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] Documentation: Document an existing qcom,rpm-msm8996 compatible
Date:   Tue,  2 Jun 2020 22:08:36 +0200
Message-Id: <20200602200837.321712-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This compatible has been included in the driver for
some time, but it has been overlooked in documentation.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
index 25541a475ead..4b916d67064a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
@@ -24,6 +24,7 @@ resources.
 		    "qcom,rpm-msm8974"
 		    "qcom,rpm-msm8976"
 		    "qcom,rpm-msm8994"
+		    "qcom,rpm-msm8996"
 		    "qcom,rpm-msm8998"
 		    "qcom,rpm-sdm660"
 		    "qcom,rpm-qcs404"
-- 
2.26.2

