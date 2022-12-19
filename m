Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECC0651202
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 19:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbiLSSc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 13:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbiLSScN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 13:32:13 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C06140A8
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:31:28 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id 17so9925492pll.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znASgBClq0rwhBOl4/Fw1c5T/s1foKbyxf4XPqRiKDI=;
        b=ZcH4+Fj7XdRiM5/WNqZ4MSezhDedo6LtSkFK/MVe1KCI2fYu1lmKLZYRnPdzEXrbaw
         IKBmfIwSJgqonEBBQ/oVHF0lnRKw3hPkffybL01gl+f5T4eF2EaTlv6wWovnduWoEDFo
         pHebHcqk46zQtuWhJom59c2X3EkLupK+qh4Wh3pUX5/dSfKr9X2A/LeNTU8NdbsxQyPm
         kL4HjU79zRaUfq2L47qEJA4/SElSccv8nFI8MkjLrZxNfXtfYmmyHea5G217gUtvWtNU
         9+h3ARHlC9Zgi/j8/sM91gT455506xFLZ68SITuaRPaYYjiJshwOJOLe8z2oFAhu5FMK
         XpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znASgBClq0rwhBOl4/Fw1c5T/s1foKbyxf4XPqRiKDI=;
        b=tPRJScAkBsP1uC+fEjsjhWA1Eqv5RNd/8yxnuCktkPeaBZT7AOUAw0e87Q5COzfOZ/
         yVYUC7ON+y4Rb2y5qgw/rUnHQJrJaAupK9YDqBioOuHKIr4uinCAQotQZ0GLfXY9t1f7
         M4b1pge1alVNXaWRZ+GPMliCS6jkqVBp2tW4LmLNXJauddxauKW/s9ArFmgG/7/Lf9OE
         omaV6Dz3LMoTBJMXs+gCFVRqH/DbLsRBadEw/mA0nOnr5k+5Hmc+4WAYbAP2I+cWWYxo
         uQTLkwL61qp44um02LOPkZZapy0P1CUayLTcFp63hQfisCKWXjDFMf60vdm9vwU0ZRib
         /4Rw==
X-Gm-Message-State: AFqh2krlZM5dmO99syTJGMa+eOBLIC6ZvxlMYICAF9b+qYYkJ9zbbaAB
        OGesPj2O+jguvl8KTXuMK6dY
X-Google-Smtp-Source: AMrXdXtqsUgo7FWaAMNH+5312ZU8Op04PM/Mc9HwDsUnlhNsQzBakGF+NpJR8S2x9DH7ZyYN+JqU5w==
X-Received: by 2002:a17:902:e845:b0:188:fc0c:b736 with SMTP id t5-20020a170902e84500b00188fc0cb736mr15763512plg.67.1671474688106;
        Mon, 19 Dec 2022 10:31:28 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b00186e34524e3sm7480979plh.136.2022.12.19.10.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 10:31:27 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 11/15] arm64: dts: qcom: sm6350: Fix the base addresses of LLCC banks
Date:   Mon, 19 Dec 2022 23:59:54 +0530
Message-Id: <20221219182958.476231-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
References: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

On SM6350, there is only one LLCC bank available. So let's just pass that
as "llcc0_base".

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 43324bf291c3..c7701f5e4af6 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1174,7 +1174,7 @@ dc_noc: interconnect@9160000 {
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm6350-llcc";
 			reg = <0 0x09200000 0 0x50000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg-names = "llcc0_base", "llcc_broadcast_base";
 		};
 
 		gem_noc: interconnect@9680000 {
-- 
2.25.1

