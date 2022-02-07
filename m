Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA114AC911
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Feb 2022 20:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbiBGTCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Feb 2022 14:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237962AbiBGS6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Feb 2022 13:58:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89903C0401E4
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Feb 2022 10:58:30 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id i34so28842751lfv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Feb 2022 10:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zN5qVhMXDmfd9ze7N6KYypaBmSnSMGRHWVYJBUbt0Fs=;
        b=IWr4AlZQx5VFs6t4FDnOW2eeW8c7pFK8KHaR1xtBOk1//ZldLCNNtm3t5rdP6B0LqP
         CnViBpQnI4gpipP6s0j94bA7oTGyVUg6Fsogxig7Su8pMRRlyyzvsDaa+c3MN3GC9JS4
         4AiRWNq0hXcykYFDbkaZUfuxM//eVmgnId+yfNIzrt6Sjh6bDAU8avuGrT5QvRqoaJvY
         x2iYV0W225o+N7LP3JJYo5+hYc0Rf032z0BStxNWLoI6PpUj69RLoLlcstv7yh9jE4ZE
         8Crr5eIkIRju8GbmSlzTmg4KFAlxZfg2SiFCLAqdvsTd0IZahEnw+PF7tr6QZ2pc2ey0
         7tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zN5qVhMXDmfd9ze7N6KYypaBmSnSMGRHWVYJBUbt0Fs=;
        b=64QqTHYXonXoN0cuM8lA4CRSiEspDiivhvzDuFir4gbxkbESAx/bzDJSfAGxtutz9E
         X2xrVjnUCTQ0qt4WwAQ/MSdUN+NHx8ii53ECEmeXLKnepJb/zK8Gqvluk4Z2uFSuiAgN
         PD56563lBeQGtTeJTmOkT+Z6NwhgFspQZGWlE4RJ7EdtnKfCCvVW40TzpiUuiR3HXq5J
         FhDaAvkn5hgveHvbzQ2ekZNp2dvWsRAxNU+ey8mZ4RQNJ4oh6vgcwWG+S/zfdd1hNlYA
         phVzWMO90kBkLLttAaIA9/j6TEZ6L9ekMihdizQkN2PFyTvGMobZrQhQe5SXge3MbkZD
         Vo4g==
X-Gm-Message-State: AOAM530gc6bOTIVuEwhIGCd3t13ssohvBvB4YgA3aosXYGyUQy+QIfaG
        XcevaAvDjTdVCI3lLeQs6nIVZw==
X-Google-Smtp-Source: ABdhPJzmEegeXsttXRDan5LZ+7Vo55qdSB1sSrtL6aE83GumiObdYLqb+O98qCnGrWw079yFbRlkGg==
X-Received: by 2002:ac2:530c:: with SMTP id c12mr594430lfh.122.1644260308964;
        Mon, 07 Feb 2022 10:58:28 -0800 (PST)
Received: from Lenovo330 ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id k10sm1599061lfo.187.2022.02.07.10.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 10:58:28 -0800 (PST)
Received: from localhost (Lenovo330 [local])
        by Lenovo330 (OpenSMTPD) with ESMTPA id 2e966975;
        Mon, 7 Feb 2022 18:58:26 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2 1/2] dt-bindings: clock: Add support for the MSM8226 mmcc
Date:   Mon,  7 Feb 2022 19:54:10 +0100
Message-Id: <20220207185411.19118-2-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207185411.19118-1-bartosz.dudziak@snejp.pl>
References: <20220207185411.19118-1-bartosz.dudziak@snejp.pl>
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

Document the multimedia clock controller found on MSM8226.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 68fdc3d498..4b79e89fd1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,mmcc-apq8064
       - qcom,mmcc-apq8084
+      - qcom,mmcc-msm8226
       - qcom,mmcc-msm8660
       - qcom,mmcc-msm8960
       - qcom,mmcc-msm8974
-- 
2.25.1

