Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A690A4261F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241740AbhJHB1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241321AbhJHB1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:44 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF6EC061787
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:43 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u18so32213871lfd.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N1AtEgs0cni74U+0HJfUmBYJcZUYOvYv6UrqXbEKgM8=;
        b=OYTGVh+9G0muxWDccBLrHPtwBPfucZTxBH4t4eZ9mohV21BXeZ2ZO3gaghlFfAWPmb
         SuHsvOKIuNoVvgV/f/7FgwZbpSIa7FVvRjblsn58Ulvs/D0bfZww3zyFGn60Iw4+lmYf
         B18MYxzprcS3oLeaJHEhsNv0oU8Fn0QAL2l01okbysqhCxI8Kjn1WKSQ0Ku1QfTzh865
         OC6jaFiNl3oyJ5Y+zZlcU/0otipEtjsCzavroELWw1dFC55nWlatMwztBGQsozMXqJDq
         TRG1MMhkeDspJQRDneNgEpRuQl2SQC4ilTMUc9zkqs9Wng/Xk2g5wboTbkzMP9EekvZs
         BbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N1AtEgs0cni74U+0HJfUmBYJcZUYOvYv6UrqXbEKgM8=;
        b=CoODZlCguQu/u+BrMsKas17adqgBgRriPKmcfZW8meQPAVsbI8hN4+yBnXK+FhJqYW
         Wos2t/lQ7KQPHZ0lpblrBdVm0BnxU6oS2vkhjK9JXIK5Ipll72i1wcfWqbYViDGsum/9
         cIPooMLZSBmgO5IQ1cx5xRia74ONT1H8CS4VRXfR8dFNHdpfR1Lex/GUhz5jUhT3BUcY
         AubtYaA/tpXgwfbdb/lwYFRz53ymkufJQZXXn1d+NezjY7gRw18wrV/EOZbNhuAHpQRR
         pZ3rSHRAajBsaOJJOTWh1kI+h4HgSV5M1QPB+c3K7J6cxwJUxQP1AIR657aatXwzXD4L
         fm0Q==
X-Gm-Message-State: AOAM5333TCmWi+fhxuvVSGAfy9i9KWFuweboyBcinG+km7f0eIgpLsY1
        jJJ6k/gzv6d1Z46x+mSnEEyS4g==
X-Google-Smtp-Source: ABdhPJyJIuqxAvjXmvZDZfKOHMAd9yuOmhUqNf+HS/0CpfhKzpcScKzEf+aedI0feSWThIQ5JnfjEw==
X-Received: by 2002:a05:6512:3d91:: with SMTP id k17mr7153008lfv.430.1633656341842;
        Thu, 07 Oct 2021 18:25:41 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 21/25] ARM: dts: qcom-pm8841: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:20 +0300
Message-Id: <20211008012524.481877-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the pmic-mpp is a proper hierarchical IRQ chip, add interrupt
controller properties ('interrupt-controller' and '#interrupt-cells').
The interrupts property is no longer needed so remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8841.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8841.dtsi b/arch/arm/boot/dts/qcom-pm8841.dtsi
index b6066c27732c..2caf71eacb52 100644
--- a/arch/arm/boot/dts/qcom-pm8841.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8841.dtsi
@@ -16,10 +16,8 @@ pm8841_mpps: mpps@a000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8841_mpps 0 0 4>;
-			interrupts = <4 0xa0 0 IRQ_TYPE_NONE>,
-				     <4 0xa1 0 IRQ_TYPE_NONE>,
-				     <4 0xa2 0 IRQ_TYPE_NONE>,
-				     <4 0xa3 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		temp-alarm@2400 {
-- 
2.30.2

