Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF071269F9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgIOHYu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgIOHYm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:24:42 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D870C06178C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 00:24:41 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t14so1494464pgl.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PoM8dcszi4ABBEkuvRZ20RPA0JshzdDSlrpShM9qdPc=;
        b=QQRnPO9DxxyQF69n+gAvyc5ZVThhlnOSdWwS8Q9nDB2v74a7XMzWD3iwM1BlhU8Xpx
         N+7b7q225OlQDQ2Q+v/5IbSfrS4tzAIvbEpLWRa2BVkYgXHlZKVAhsdzbba7HZJ2EVr7
         7uFjMe61muiKhTdkjeBe01EZxFxKPFBjt657vCgdBHW9ev9m2ckHLpo9Wx2lHAQuylPg
         Qd7lB4e/alOo18mlRIMRZl9fAAQTOXm/l5ddG+zTmR0CLvhvuUuYYJd2/AjRFdQPEDlw
         zN81QDuhpYU073BiLjtRAlOhm5tgztu1U/v6YzmfzXO3N1lxFvD/iPsfI9j2a0bvUPsk
         h0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PoM8dcszi4ABBEkuvRZ20RPA0JshzdDSlrpShM9qdPc=;
        b=DH1vzGbcmJhzo1LL9TjNrYYMsxo/ToiWqa2HjrZ2NoZ0bTGhPlTWlkhalrZMsqhnlC
         +ENZHqyGKBouDYuxteYIW0jkXOPqzIzSCVtmWfTb0jcPgFMYyZMw07Vgrnn8+9yNdII6
         GWQFEbyDCHwjlhqP4a0QxwfMOZmoXqGkf6no+ViE1cuYZiAbAB5rUNcd6ku92NgWkX4h
         prbHfeyPmf94e18Re2niNNvAATDDYIKN80zLrT7yB9MJa/NxyTUN7cj4sxsTNWW6U+Wx
         8KP/1P3Z5YibDK7hFDKeO55NDxJ/5PiR5/cqTDgl0P5U8KfwOvRtwy097uPmH7vSXScZ
         oeXw==
X-Gm-Message-State: AOAM532aFQDQjjks6YvomS48dJ1+02MT3uB1KeubPScxmbmmZdqjdPm8
        2wyd6b3P2a+Kpv207bRtZXFO
X-Google-Smtp-Source: ABdhPJxbviGwmECdlzw7W63+DAmIWNu/LdmyT7qT+q7QnH5RbqsKAv3ZfzzIg5OxnW91hpmdMbLcVg==
X-Received: by 2002:aa7:8816:0:b029:13e:d13d:a10b with SMTP id c22-20020aa788160000b029013ed13da10bmr16313072pfo.39.1600154680676;
        Tue, 15 Sep 2020 00:24:40 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id m24sm10701501pgn.44.2020.09.15.00.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 00:24:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rjw@rjwysocki.net, viresh.kumar@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     amitk@kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        tdas@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: cpufreq: cpufreq-qcom-hw: Document Qcom EPSS compatible
Date:   Tue, 15 Sep 2020 12:54:19 +0530
Message-Id: <20200915072423.18437-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915072423.18437-1-manivannan.sadhasivam@linaro.org>
References: <20200915072423.18437-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The hardware block which carries out CPUFreq operations on SM8250 SoC is
called EPSS. Hence, document the compatible.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Amit Kucheria <amitk@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
index 33856947c561..9299028ee712 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
@@ -8,7 +8,7 @@ Properties:
 - compatible
 	Usage:		required
 	Value type:	<string>
-	Definition:	must be "qcom,cpufreq-hw".
+	Definition:	must be "qcom,cpufreq-hw" or "qcom,cpufreq-epss".
 
 - clocks
 	Usage:		required
-- 
2.17.1

