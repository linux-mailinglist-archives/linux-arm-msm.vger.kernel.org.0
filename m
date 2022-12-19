Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFB065127C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 20:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbiLSTNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 14:13:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiLSTM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 14:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD22111156
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671477123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BJqVZEBbP7jwnL0etvHXrEIDyNJtoqDdiV434BPoorg=;
        b=VRtSX8GZE9bMivpViEEZZnVjQPsKPDBEiTyeNZGr26Y91hDaZQ1Z5PnM121l82zAYwPfeD
        1eDSXMP+Y/+GTs7Q7vlEVpC3PD9ISc2gcZo+uIsCIpuwVchrj0P/0CN69alJjaa/0CirmR
        QLioUAFIlpQpHHzjwpo/peZX+AZ5KAw=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-3ycFpgZFOkq-uHGdXoRfrA-1; Mon, 19 Dec 2022 14:12:02 -0500
X-MC-Unique: 3ycFpgZFOkq-uHGdXoRfrA-1
Received: by mail-ua1-f71.google.com with SMTP id 31-20020a9f23a2000000b00419ac00068aso4101319uao.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJqVZEBbP7jwnL0etvHXrEIDyNJtoqDdiV434BPoorg=;
        b=OOxOg3dYiSnqfUFa7KDN489ehPYKp63WNKm0hIr9N8hIQfFvnaUoefE2ORLNc/6vOt
         SMYEL3YwR+cfhwE4dRWwMIEd7kCxF5u1COoCGYRs8fyYsy/n7BoU473FL4jnrvE8bQ3+
         kmXPp2Sc3m2xFr5xzawNUA3kIwjosjOlG0y3hpHqd+W/iSEQqFcOwlqDyEwIvxxsRFb2
         tCgG9JBmI/srb1jYMI+txdL7rumJeJ25vhGl40CasCrka/zeGZGMZWvm4BxzccpXolHJ
         NIOBO2wbkdPpawmhZ0Be1qB/5oJ1NwEXPGqidbeVKYxoJHcqcCVXy7DyD1nwPqENbW/L
         rOtw==
X-Gm-Message-State: ANoB5pk8DntjVPlxCnSG0YFkAySLETagH+51aQUgH7KvFKT8mV/wcOun
        Z/623akHbWnRx/GNfbVL6XC7VDBQEVVj7HkkxE0YjfmsWjgSxYm4k3Z1ed8MLt40DVI6foMzy+b
        dMYk78ScpTb/GxaYObNn3SD2JFw==
X-Received: by 2002:a05:6122:2215:b0:3bb:d05d:3374 with SMTP id bb21-20020a056122221500b003bbd05d3374mr27069819vkb.9.1671477121962;
        Mon, 19 Dec 2022 11:12:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf69HLE1HpwlVluNAhUqb3pB4S8wNQG4LIRjPh/c6/Hw4fDiIOztxZZKsF1NaxP4UOZ6kx3kKg==
X-Received: by 2002:a05:6122:2215:b0:3bb:d05d:3374 with SMTP id bb21-20020a056122221500b003bbd05d3374mr27069799vkb.9.1671477121713;
        Mon, 19 Dec 2022 11:12:01 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id c25-20020a05620a269900b006fc447eebe5sm7614948qkp.27.2022.12.19.11.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 11:12:01 -0800 (PST)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>,
        Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v4 1/4] arm64: dts: qcom: rename pm8450a dtsi to sa8540p-pmics
Date:   Mon, 19 Dec 2022 14:09:58 -0500
Message-Id: <20221219191000.2570545-2-echanude@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219191000.2570545-1-echanude@redhat.com>
References: <20221219191000.2570545-1-echanude@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

pm8450a.dtsi was introduced for the descriptions of pmics used on
sa8540p based boards. Rename the dtsi to make this relationship
explicit.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi} | 0
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm64/boot/dts/qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi} (100%)

diff --git a/arch/arm64/boot/dts/qcom/pm8450a.dtsi b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/pm8450a.dtsi
rename to arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 6c547f1b13dc..77d499702ea8 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sa8540p.dtsi"
-#include "pm8450a.dtsi"
+#include "sa8540p-pmics.dtsi"
 
 / {
 	model = "Qualcomm SA8540P Ride";
-- 
2.38.1

