Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462F9472295
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 09:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233048AbhLMI1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 03:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbhLMI1T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 03:27:19 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FCBC0698C4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 00:27:17 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id y12so48580106eda.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 00:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=taFnq99zQAi88G74QKTyCZlH6WvgNqJiCDDQ9L4lFX4=;
        b=HzaB8tg68t34rQqDwLi/Z0nDC1TwlNT64YkiMFS6334hVjCHxGZQ+hNJhL3DCP+Xvz
         dMNw7ZlpvZHmZ8ofZkC/pAedq748nbWyEXfThYMGp5/+8T77Cx3ON6i5PKn6R/bdTzZL
         HWDxL/cLbG7mFeMf2SqRWEG/VOoZHZjlIIhLVghuyExJhBcwjNfFIiVg8+0c5GTiFtpE
         Tp1QnU81DfUys/j4zxEKG1TZGYVTmjbcMAPwziGrXa3C1SkZvPrNyVVlcnUv7GR8hCac
         olqo7kllB2KNEtA5glyULFG9dpa7eRsvB+r5EvgwK87G7PnsGp9dReo4nCoHeOJy+9ei
         qt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=taFnq99zQAi88G74QKTyCZlH6WvgNqJiCDDQ9L4lFX4=;
        b=pLskmkDOPsslwybRxnUHOqjVDLQWa8LBXWbDXn/2torplB+8k8tOXF4bh9ZjGe65bT
         PdmHP4xKY2eXUTDR4lTL7nwZZKJ6Wf1BN/4/pYiF9H4EiTStIm38PF6fqZCzL80VYY/8
         cDSUP7WmraCEJMQLW0QagiS5pjm3yssIMFDlUde5DFA4PDuWwDuEjoWp/U9Ghe02yZfC
         rIxv58u/W3QPb0sjbp3YPADLE/ZWrgY7JVOp0Ku75LTG62jrQITry5smZTJ+1BIVP/Jf
         Fh37CnQcalg8ZGXuGx+bEYM5qrutrDTjEAUwNk7omXMNI+y1L2C6WjLgKWsVFYImmBfN
         4Nog==
X-Gm-Message-State: AOAM5330LdPkcV8WRFRLZEvEbYNy6DecK61APkTreFDWv7D/mPIQeKsG
        1MX+tMta0UgtXBhtcZXYWDbCLF337heqpfWc/kA=
X-Google-Smtp-Source: ABdhPJyn/Tqd/Phv4lVk2MwK9UiR50FkW82/th2caR0i+Xc//17eqt7fQmEBRZ33ysREXZYTWqwk0Q==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr63090815edj.87.1639384035701;
        Mon, 13 Dec 2021 00:27:15 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id b11sm6062432ede.62.2021.12.13.00.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:27:15 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] dt-bindings: thermal: tsens: Add SM6350 compatible
Date:   Mon, 13 Dec 2021 09:26:06 +0100
Message-Id: <20211213082614.22651-6-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree compatible for tsens on SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index d3b9e9b600a2..6d48c5ff6bda 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,sc8180x-tsens
               - qcom,sdm630-tsens
               - qcom,sdm845-tsens
+              - qcom,sm6350-tsens
               - qcom,sm8150-tsens
               - qcom,sm8250-tsens
               - qcom,sm8350-tsens
-- 
2.34.1

