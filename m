Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD776EB335
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 22:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbjDUU6A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 16:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbjDUU5x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 16:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8767E1FE4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 13:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682110627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O0Mtszdjlm4MgVhkShoWxFcn7UkV33phtqGTpiHGGr4=;
        b=F7q+120Z2AOzr1aP8thEuh4DUPkEs6jk7Xe1Ad5u87+Vs9Zanu089OfwOxHHi7ooxvXda8
        ubbF4HhB9S/XIx6FNbLcxrxHKIMBzZLNq1g4UntN47h5FdNh9zKAnzWsJXwwMYfkvFCnsc
        BQx5l8Aw6jScyjEN4a1croF/sY5X4eg=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-hYXjDH4dNZSGclQgTJO6xA-1; Fri, 21 Apr 2023 16:57:06 -0400
X-MC-Unique: hYXjDH4dNZSGclQgTJO6xA-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-552f2f940edso33700137b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 13:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682110626; x=1684702626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0Mtszdjlm4MgVhkShoWxFcn7UkV33phtqGTpiHGGr4=;
        b=dGxg4V9NJldA2kG2+yyuTWcK+6bqjhlwTH09ofK2+lmfSAMtFQQA6wu6fUVHA54dUF
         KAnNbfooHENYNzGj2RHWn0Ur/+cF0cXfo3yefZFQNynl9lOTXZgFK3caXqE7Qs/ipEOl
         X3YdbbqYdIFrVrvKWJGdlT3lDpiqQ1Fyhu+La1pE810R7YyIF2yG7q1I/Pw2oCWvXpeN
         fBTbNU6OM7nuWjHbo4VNyHFwWZBRaxqLyhDJJnHg6NoDvhku9wC9mI2EPKmhnQNYOhPl
         QjKJB8wS5Lxh0dP0THKUGwygBYNlUpAutk89UXvXlFDfzOJ4jERcGHlp50B/dy3sTu2t
         T5qw==
X-Gm-Message-State: AAQBX9efO1EvaTyCX0U73r0bQhTp1dDGvKcjGhum5qSqTWRNGTQiXqvz
        6/58tARElRLH+tMgukBW+JylujQDhSlPA6F2ggD31cD9kVc7hLcsYwtarPPgBy37EG1B4UPzCnB
        5CCkIXd+ZJDCfut+7zPsBPk/2Cg==
X-Received: by 2002:a81:6c44:0:b0:556:1182:958a with SMTP id h65-20020a816c44000000b005561182958amr2790570ywc.24.1682110625953;
        Fri, 21 Apr 2023 13:57:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQDiTLclCcBihczFE91vxXgq6wBX1hK5ylVIS+7QncrEBEYfPYI8ILhGObrfq57VG337mb4w==
X-Received: by 2002:a81:6c44:0:b0:556:1182:958a with SMTP id h65-20020a816c44000000b005561182958amr2790554ywc.24.1682110625659;
        Fri, 21 Apr 2023 13:57:05 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id x67-20020a0dd546000000b0054c0be459dbsm1179999ywd.39.2023.04.21.13.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 13:57:05 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: sa8155p-adp: Remove unneeded rgmii_phy information
Date:   Fri, 21 Apr 2023 15:55:11 -0500
Message-Id: <20230421205512.339850-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421205512.339850-1-ahalaney@redhat.com>
References: <20230421205512.339850-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using interrupts-extended already indicates what the interrupt-parent
is, so drop the explicit interrupt-parent.

The comment about this being the phy-intr is not helpful either, since
this is the only interrupt in the phy node.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v2:
    * Collect tags
Changes since v1:
    * New patch (Konrad)

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index ac52a8dfeba1..b65e0203d783 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -361,8 +361,7 @@ rgmii_phy: phy@7 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0x7>;
 
-			interrupt-parent = <&tlmm>;
-			interrupts-extended = <&tlmm 124 IRQ_TYPE_EDGE_FALLING>; /* phy intr */
+			interrupts-extended = <&tlmm 124 IRQ_TYPE_EDGE_FALLING>;
 			device_type = "ethernet-phy";
 		};
 	};
-- 
2.40.0

