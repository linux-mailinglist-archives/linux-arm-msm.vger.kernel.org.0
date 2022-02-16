Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15B14B8ABF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 14:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234742AbiBPNuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 08:50:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234732AbiBPNuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 08:50:13 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793FB2AB523
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 05:49:51 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id gb39so4796636ejc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 05:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qImSYxU2i/y/qV71r8EFW+LTWk9ZfhM4KeM2jcTcklQ=;
        b=USB9Cfv3xa7zGVhWDc9Zzp8uWp1kvjlb4YY/qTVb6gFRcd7lYNz1X+WcUefoTPp2aA
         xCArzUygJs0XlFfjMWTzZ24fNA4SFjUssWdeD5FOQP65LgDaVF0V73epaODl58a4SL0P
         yZW1F6zNIJoSLZf/Ib9iXoa+BrOB80KAllcZOUCpShymeF2KuhyM27qDVLJCHqAY2Tqd
         lzWXVcH2/8MaWS5m6erPW7AbbjD4fJA8DHHSqDeMmN2ddD/jN8KOQT7JE+O59rd68dSL
         5s8NCaGBerWHNavx9RK3IxO5Z/fvjh5uQVOvymAFzNognoAe5UzY1y7MqgU6FSTFzMgg
         bzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qImSYxU2i/y/qV71r8EFW+LTWk9ZfhM4KeM2jcTcklQ=;
        b=iD+Xwg6mgLCKB2LWPdHiFKNlZXxZBVvgLuiktMjjJRMKtqE79+5kYc2hxcXVkPxd2B
         yYj+HfzGvnveF4Miy6RtebOe3BGObAK6OmEilMWDgr/B29ZMAeAi7QXwgvP71ZJKXj5N
         7hST0WRoh1mkN37Tfsgf1cg2xLDnpovw4XkS6KWqll0TuEosN4DBuepiMDZxRjjxmvzW
         CbtIflSX7FUnAbaqZOj60k2eNxQYY2rzww1iVQjHl2Xay+/pVt3F6EfRKkLzSaMf1si2
         zvUbKSXEX84HUQS1KhyE2qPgcLpqangkHdEqZ0fQu0yKrSkCYUC6ARaRZzczVDGg2iyW
         g8DA==
X-Gm-Message-State: AOAM532J/I/CSLhI0LV6Oh+c6+7bOW1BfZvyylSSCjvUyggKXOirvrZa
        vnCeT+DhUT1/In3S3UTNsytZtQ==
X-Google-Smtp-Source: ABdhPJxM6GQvnEXRmIMQdUPSDtUdumITcQ19d4GofkdvAd5RY2MgX7o6AeLYbe62J28zFTKWNN4+5Q==
X-Received: by 2002:a17:906:1393:b0:6ce:f3c5:49a5 with SMTP id f19-20020a170906139300b006cef3c549a5mr2404632ejc.123.1645019389927;
        Wed, 16 Feb 2022 05:49:49 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id o20sm1711996edc.84.2022.02.16.05.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 05:49:49 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v7 7/9] arm64: dts: qcom: sdm845-oneplus: enable rradc
Date:   Wed, 16 Feb 2022 13:49:18 +0000
Message-Id: <20220216134920.239989-8-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216134920.239989-1-caleb.connolly@linaro.org>
References: <20220216134920.239989-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the RRADC for the OnePlus 6.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 7f42e5315ecb..e8287cf02511 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -450,6 +450,10 @@ pinconf {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.35.1

