Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75164261BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhJHB13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236351AbhJHB11 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:27 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C28C061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:33 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i24so30955044lfj.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kogEQhss8CRQIVqzZR3ldriy2WlhMwjUUX695mLk53A=;
        b=u/xW+YZM8u0qwKhtsYYmEGHoYpfN2WiGLdRfnfQxGAvmDzsvzr9ESYtWcDelrBtUaN
         D1Gvg472UeaNp0YpneRi0UwWK92xM0pEOd0fvD2ldwbxEH6We4an3UrYYGXZwgOtwz4c
         88QIBcZDRwQht2UrQInbCUT+JE/ovNdgNG8Wi1o4uJvSqITgn7+TsMpMosdPC09A9hoz
         06A8DJGc9uF+t86OcBnqbbb/C1sgc5QPOaYvu5Hip66UZ+OA8Pnka1MyHcSbe16xEF2L
         5h0yAjn2aauRmCctmpXUUWLb+uRD79ZCui/qUygmrkGeXH8r60Ct70ARWHJi5BNuAE7X
         idLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kogEQhss8CRQIVqzZR3ldriy2WlhMwjUUX695mLk53A=;
        b=Sr/9kHHjnSNLc1mGv5/u4F5qSq+faGrxVIRwRld6gbAcOwfIgXXOJdSyUGNjU8IwQ/
         HCnaXFoh1VFWj38j4HK4Z90C/Vh2ky8wHnlidfoYEez5cRcDL+BaLIgAQOiuEPb4mQeu
         o01mNzBUba6GBIKa1V1xJCoinEaqnAga5KUR2g5FLTxKD0Z9fUZ0jY1EWDs16IRr28mC
         jabC/QSAEEdMMFdym8TVrIELo+5Cqnj2liBzqX39ht82yrhqDpe8dVOcilQUDKrkcBsp
         5F5uOQJ3QQXeR2UOxHaHTa00D1NvD4K46GsgmgOqDeHdNJlhV7FVyLFhSzjt6RySXM/6
         J2vQ==
X-Gm-Message-State: AOAM533TpJmpohkHBb8cm3CqKxOcbgpkJgeOGmwwK9tArIyxXVvaxaX+
        lAzRdUM09rmmqiLl8a8p4u+Sdg==
X-Google-Smtp-Source: ABdhPJwdrRtLnoRInKY0r/JOimrzZAywVHIFbXWKG8GFNpu/oIQO1O1R5uf+mxzhHovAafByJFJQWA==
X-Received: by 2002:a19:48d1:: with SMTP id v200mr7743851lfa.47.1633656331415;
        Thu, 07 Oct 2021 18:25:31 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 05/25] ARM: dts: qcom-pm8841: add gpio-ranges to mpps nodes
Date:   Fri,  8 Oct 2021 04:25:04 +0300
Message-Id: <20211008012524.481877-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add gpio-ranges property to mpps device tree nodes, adding the mapping between
pinctrl and GPIO pins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8841.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-pm8841.dtsi b/arch/arm/boot/dts/qcom-pm8841.dtsi
index 2fd59c440903..b6066c27732c 100644
--- a/arch/arm/boot/dts/qcom-pm8841.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8841.dtsi
@@ -15,6 +15,7 @@ pm8841_mpps: mpps@a000 {
 			reg = <0xa000>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pm8841_mpps 0 0 4>;
 			interrupts = <4 0xa0 0 IRQ_TYPE_NONE>,
 				     <4 0xa1 0 IRQ_TYPE_NONE>,
 				     <4 0xa2 0 IRQ_TYPE_NONE>,
-- 
2.30.2

