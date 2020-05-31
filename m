Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184481E9969
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbgEaR3A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbgEaR2V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:21 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D86C061A0E;
        Sun, 31 May 2020 10:28:19 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id r15so9090098wmh.5;
        Sun, 31 May 2020 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p4A8aBj+ydqEYGpDzESaFp4wwr7TFlYPgSDxtAzGmNg=;
        b=PR00PZntrzH3T0Z4HnefBytfvizG2khY/yMJ81sWN0BH+mS8kge9eKUj8G6tVUIkwc
         GVr7NJU+sW9rmGlC2MAg+ar8Zp6Uba6cuiA2CtlhHjXU7/bpx0Asx1stQOP9PnmlH01b
         R+I8/iM7FIL9DCQAHJrsHt2POB+VbLXrJplltpMoZxO6cxDq6mOz/7GNBuO0q62DRPNR
         RANWelZusF6KnfHWWHLFhtOqxBbMBfkyH8QI0iWPUf3i1sYhQUl2AnLwqvCwS8c7afwf
         WfsQKqBlbI0AM8o0IIm9aalHBWB+YMGg+sEpLTmAQ2wxAlD6ZZ6j/290Trs0Hyfn7gXc
         X3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p4A8aBj+ydqEYGpDzESaFp4wwr7TFlYPgSDxtAzGmNg=;
        b=YQr/2ZVkAz38g+saXzF6bcBDbOxBJ71HKFqipNNnrz6vvzzxUHwga1T+X8xF5/CjxP
         PbElS1ToBiNFL3enYCaRXZRAx2WYkvqBTOVn0Bva84UohRxbOD5ZA0PaDDmKEzien3fd
         x+XU/PR5r/4DJ+YHuz/Grrk9Aqa9ltRWpj0jhQgcU3ZfWXFfhUvLckR0JkJFSbO8Hr4X
         u0fmbsxPg19fTpATXkSE+zTiJzEZOH5tGl7lZkMhVg9lsrEYLFbd5R2+3h0NSvW5Y5B2
         2CqFu9dMd8CETHJlBG12ersTJ50+tUGhHgfWVNV2TWTXDJHMtK6q365PiuVX3eDHxSgD
         ZSzQ==
X-Gm-Message-State: AOAM530PF68J60z5y/0Lnhioz24rM/dsEbW536GmJCBa7FZbizkjHqHZ
        T/Ll9JhLB0EfdXMoSAkeR4E=
X-Google-Smtp-Source: ABdhPJzGjVJ0onmFs2HfjjgF2OxW+u5zV7Xt5+jVcya6fxE9qmcXvt+yNkOaL89I7mQz1jQojtV4JQ==
X-Received: by 2002:a1c:6583:: with SMTP id z125mr18158972wmb.102.1590946098299;
        Sun, 31 May 2020 10:28:18 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:17 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/14] Documentation: Document msm8992 qcom_scm compatible
Date:   Sun, 31 May 2020 19:27:55 +0200
Message-Id: <20200531172804.256335-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 354b448fc0c3..fd7e1aff9cdc 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -15,6 +15,7 @@ Required properties:
  * "qcom,scm-msm8916"
  * "qcom,scm-msm8960"
  * "qcom,scm-msm8974"
+ * "qcom,scm-msm8992"
  * "qcom,scm-msm8996"
  * "qcom,scm-msm8998"
  * "qcom,scm-sc7180"
-- 
2.26.2

