Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263F75AB892
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 20:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbiIBSwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 14:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiIBSwl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 14:52:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C05E1AAF
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662144759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uWCWlSmZFYEaKyKiurVFOsZ2PihsSoTnqTvGm6hbF8A=;
        b=Cy2botX1q7p45KRU662nqF0BXljbYQxlYRCVttsuVAz5VxiEU95c1XF+49vTALbKP68o6w
        N6MFjZXtBPnMt61U+teF6H9midtaicgKBH9WJQtAf5AUt3psgQZIrtF4JmCQKAKDp7zj36
        HUhCAjvZx9YfbUAyfmV1KgOUCs1e2Qs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-HJbytoEzN-Cdh9yb8bud7w-1; Fri, 02 Sep 2022 14:52:37 -0400
X-MC-Unique: HJbytoEzN-Cdh9yb8bud7w-1
Received: by mail-qk1-f199.google.com with SMTP id bk21-20020a05620a1a1500b006be9f844c59so2613762qkb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 11:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uWCWlSmZFYEaKyKiurVFOsZ2PihsSoTnqTvGm6hbF8A=;
        b=lp45OHVgkOQTB0H0IcHzIF0Rtt3cg9onwfRiJoaYkajDpw5YrrPVbMPr7thsqkcWQb
         prkh/9CrN7wPUBRr4zm9HHONPByMrw3k6xuN3tljG+fBW2Cvnk7/cGnQYsIPj26C09wz
         JszJ5anO/x3GtZ2frPfzh6UOszlUfBmyhtSvu5+nefM4FdIDSCnidhtTk8hPN9tMVsfd
         sMGjbWIM7WdTIgka6884UWAVXw1HmrHyUFHfX4jaGBUXF8m60EP0YNLNbEiY9w/J1rgG
         bdUoomYwx3P6oSFyPFjN3nY6iJZeP0VUwijcjBTDYhcaniI7hnI6Fiwm1bE6tBJwsZ24
         DKNg==
X-Gm-Message-State: ACgBeo2ZUdeHGl3Jb1nczie30JPCCjmxx1cQHFRPCQrehp3lXpvLVYo4
        UIAbo1GOX2aKN2qK6BIy53EQ5pOTASIW5wnr6gSGdVn8wrkFECdeuUngmdC55n4lNyAhdMLa4/h
        EAg5CK/YaBU3vS22FSbdknwtXhQ==
X-Received: by 2002:a05:6214:5299:b0:47e:89e9:e27b with SMTP id kj25-20020a056214529900b0047e89e9e27bmr30305782qvb.52.1662144756905;
        Fri, 02 Sep 2022 11:52:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6sQ1Y+//dmjxKBj3ZEaXYuHYln+NL61ZdmgRorPSxsIvkkcjpHQ8qd63mv5wb+6ajlx/wzPA==
X-Received: by 2002:a05:6214:5299:b0:47e:89e9:e27b with SMTP id kj25-20020a056214529900b0047e89e9e27bmr30305759qvb.52.1662144756618;
        Fri, 02 Sep 2022 11:52:36 -0700 (PDT)
Received: from halaneylaptop.redhat.com ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id j4-20020ac874c4000000b0031ef0081d77sm1403168qtr.79.2022.09.02.11.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 11:52:36 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        johan@kernel.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH 3/3] regulator: dt-bindings: qcom,rpmh: Indicate regulator-allow-set-load dependencies
Date:   Fri,  2 Sep 2022 13:51:48 -0500
Message-Id: <20220902185148.635292-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902185148.635292-1-ahalaney@redhat.com>
References: <20220902185148.635292-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For RPMH regulators it doesn't make sense to indicate
regulator-allow-set-load without saying what modes you can switch to,
so be sure to indicate a dependency on regulator-allowed-modes.

With this in place devicetree validation can catch issues like this:

    /mnt/extrassd/git/linux-next/arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pm8350-rpmh-regulators: ldo5: 'regulator-allowed-modes' is a dependency of 'regulator-allow-set-load'
            From schema: /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml

Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 86265b513de3..1cfd9cfd9ba6 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -99,12 +99,16 @@ properties:
     type: object
     $ref: "regulator.yaml#"
     description: BOB regulator node.
+    dependencies:
+      regulator-allow-set-load: ["regulator-allowed-modes"]
 
 patternProperties:
   "^(smps|ldo|lvs)[0-9]+$":
     type: object
     $ref: "regulator.yaml#"
     description: smps/ldo regulator nodes(s).
+    dependencies:
+      regulator-allow-set-load: ["regulator-allowed-modes"]
 
   ".*-supply$":
     description: Input supply phandle(s) for this node
-- 
2.37.2

