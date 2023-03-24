Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AADB6C7576
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbjCXCRM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjCXCRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:17:11 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F7A2A6D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:16:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y20so406447lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKKOI+ySVX6z9PtGElQuGXFeumlfZCN24DHBicwvF40=;
        b=kS3f5J/lqjpFjPjZEq1ZTlQLnY5pcHN1gEjdzUDBmI47/u4rah2t5FAkMhWsZvttRy
         Xcq14mRGADErZdkDVQhT5MGMHi8W9CVjQCMTZBBjx/L7/zA+8T7Vb0IcAmR3iF635Zmt
         ied+u+Qwrdq9y2B27HQ54Lf5czLRPAuV0gdNC3eDeSqRercb0kK5qRRzC2v4kQO+owAb
         P+sOJ2y7XSqi+lzJMg63fe9UwV3PoQaUZPcgh3rUyK8Xq5M0KvyC3bZBqRdt4+LhEcAZ
         JefmG79vx/zlWhfcdF16vgH4s1MpVV1P+2vnRYSf1ffETVE41Z2A14zd9Nte8+YgfdnN
         n6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKKOI+ySVX6z9PtGElQuGXFeumlfZCN24DHBicwvF40=;
        b=EVAbkq8yGO3801McQfCVeDeu+aktcsq2pV57Cdj4SlmQ9GerY/ZyQS/l6H2IE4RBs5
         2oy1G9vFoBBgNz/BkppE5IBOQAM94ytoMV6cFzsHao814IDaKBEyx6ThcqcX/c6HThkN
         j74DMKD93Mm+xZRn77+5ZfvbPvGSvGNefOCui+uYVOC9gjIShfIkOOsw9tYle3LKekE0
         56XDrnVzogmXHws0xcZMOSdhSeoZjv1QoNJHY3HRZ0mlgYvt81lLzNDOyJvzn3mRf6dM
         43MqNDIEd7VoNSjdcyA5Vrt2x129JMcNdWkHAqTHgLOR25wshsBArGN2BSB0h41810dN
         CXMw==
X-Gm-Message-State: AAQBX9fdiBfXGtGWeyvir7Kx8c1oIN17xxqoIMzBQ4SdyUavxboQzC0f
        lOo77+4b4fK5LCcqSQycJeRjIQ==
X-Google-Smtp-Source: AKy350Z32V8261ijWy5ZqiGI8XOMUPR/hkkeOmZM6Sg32RirnPjqqXQb0pNFUq+VySidLYxlcwVjYw==
X-Received: by 2002:a05:6512:245:b0:4dd:a5aa:accb with SMTP id b5-20020a056512024500b004dda5aaaccbmr186296lfo.44.1679624213799;
        Thu, 23 Mar 2023 19:16:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g7-20020a19ac07000000b004e846175329sm3148330lfc.202.2023.03.23.19.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:16:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: ipq8074-hk10: enable QMP device, not the PHY node
Date:   Fri, 24 Mar 2023 05:16:51 +0300
Message-Id: <20230324021651.1799969-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324021651.1799969-1-dmitry.baryshkov@linaro.org>
References: <20230324021651.1799969-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct PCIe PHY enablement to refer the QMP device nodes rather than
PHY device nodes. QMP nodes have 'status = "disabled"' property in the
ipq8074.dtsi, while PHY nodes do not correspond to the actual device and
do not have the status property.

Fixes: 1ed34da63a37 ("arm64: dts: qcom: Add board support for HK10")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
index 651a231554e0..1b8379ba87f9 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
@@ -48,11 +48,11 @@ &pcie1 {
 	perst-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
 };
 
-&pcie_phy0 {
+&pcie_qmp0 {
 	status = "okay";
 };
 
-&pcie_phy1 {
+&pcie_qmp1 {
 	status = "okay";
 };
 
-- 
2.30.2

