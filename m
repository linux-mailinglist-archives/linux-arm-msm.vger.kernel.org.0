Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE2A626AD0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 18:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235056AbiKLR1C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 12:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbiKLR05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 12:26:57 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA9C1838D
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 09:26:56 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s12so11684218edd.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 09:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpMyyZIODCgPeoMAmw2SU7Pu4YfqcKyvkTsTIUX9teE=;
        b=lmn/47c6P676fOOlIoB3uqpnwNwgcVTtCIGDU7W4fNBwMZVPYPlwzuAR7JD5jCjUW2
         N1MHyaFj/IKDc9ikLK8xQqXYX6K8caySNWsCXvoMP3z0l3r6SDG043NS42SsLAnDgf6H
         X6nh2cZo/IiZfUpVi06VA3pJzAUk6AMkCPm7LOSAc1ao9ys699AAaMKZAHkZIDij9VIC
         EKOv+Z3L3aVD6YBMKx8NWxU28+bHGYDnxGAT2ZnTpMMAipN6f+pFoKbAtxQKpYE2vSL3
         PMhJqaqgIxeqG02ZpytICFt3NrpCF8s4CqXmh+q2pHdeIT0ETSvdUdNmEBU1+irex/Sm
         DvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpMyyZIODCgPeoMAmw2SU7Pu4YfqcKyvkTsTIUX9teE=;
        b=GHagLOXxWA1fryUNoKCH8qeh4+LlDcaERM4GCrBkTTzmkQjXATF9GlDpV2eN0D0YHM
         oqArq03vUm14FH7+wsnNXu4FAC3xo94H6z1f/ZWwGPW8/TfcvRWra2cvfJcE7SYieXmn
         SVtJBIsNOnbwCe+yc+IE5eadcTzWvVjDyY9hGOewN/daWx7OjklYDfSK8oMe0RYWXuBh
         unxr8JgNQplIPgWsXaPZY3olNTpZiIqwuI3G826f5mhcMVHFJg388hCdAS/LhvO8vPJK
         bca7vQiM/kr/cp2JqjlqzuZ/anuuV5ZN/gZ5AAbUHYX2oIdPtjn56ZYVBrZk77CFKx7s
         MpCA==
X-Gm-Message-State: ANoB5pmdIzO0JDnDCxdlG7UQVQ2dfSSkqNQsyP71nYIvOOa42b5oGIkQ
        c2xtmolw8l288Bj4g3nI49CJHA==
X-Google-Smtp-Source: AA0mqf73YwQNoLKaD4yrSL+QAEcEIQc+eEZXExtjd9FwDE21VbirDBFp+UG+mjzxOu8PhUsZYEQk2A==
X-Received: by 2002:a05:6402:e8a:b0:463:53c6:56a5 with SMTP id h10-20020a0564020e8a00b0046353c656a5mr5901695eda.223.1668274014755;
        Sat, 12 Nov 2022 09:26:54 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-2302-5600-3861-6a56-0346-9c90.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:3861:6a56:346:9c90])
        by smtp.gmail.com with ESMTPSA id qo9-20020a170907874900b0078c1e174e11sm2099265ejc.136.2022.11.12.09.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 09:26:54 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 1/6] arm64: dts: qcom: sdm845-db845c: Drop redundant address-cells, size-cells declaration
Date:   Sat, 12 Nov 2022 17:26:45 +0000
Message-Id: <20221112172650.127280-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
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

sdm845.dtsi camss already defines the address-cells and size-cells for
camss, no need to replicate in sdm845-db845c.dts.

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 3e7ceb0861eb0..7c88312333c22 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1185,8 +1185,6 @@ &camss {
 	status = "ok";
 
 	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		port@0 {
 			reg = <0>;
 			csiphy0_ep: endpoint {
-- 
2.34.1

