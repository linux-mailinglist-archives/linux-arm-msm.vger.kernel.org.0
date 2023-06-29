Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C1F742F36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 23:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjF2VBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 17:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjF2VBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 17:01:07 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB2830EC
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 14:01:05 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso14936315e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 14:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688072463; x=1690664463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjHhF2rrsZNLShU/mSU0cZTHMuU3jpyC2KnZR0yY3DA=;
        b=pPO6mhmQouergRaAyRprTFR0yKk3fI4V8QD3oYV+T7A9qnjaYvRpsvIKIBVEYHrDKA
         C9B/SyLxol9j2S3JXh2p8pstnyEUiI9r6lJ63/ZQ/Cev0vhHCzElvrmhBgIMx5u8+OYR
         dvsNG6q/K33VYRxF97bTB2niOWHFS8dePTaA2vu6s46l4DcrTvYHeoIKQ6QZvkwPX2lZ
         GhZITxe7FEZht6zgbMZzRY8hVmFd2v2wluamy8J5tmVvwx696nHKQMMxZzARll8ToGTo
         gGNh9i3v8wfXi8OuVpu3SY1fxjLMHZ+Z5gsHom8WKgbjfNbaBjycz3XakHQS3ltYNkFr
         0z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688072463; x=1690664463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjHhF2rrsZNLShU/mSU0cZTHMuU3jpyC2KnZR0yY3DA=;
        b=hq21yvrV1VOongVnzzPvn1y3Lg4nIdqcB6lT4VsYEhIDaHFznLAAvyUwue0bJBh4xG
         OLHOtii+EWinZ/QapJcgQqHg42zQGioBDJVEpQsiGbpWH6ZeuH27hJaKmzTP63l68hKJ
         EptwU5uMkWamJdHlt6JUJ/icKd7Wf4SD29OpNAmiy8fjUQ727taSMqMdvrXZAMx7JEm0
         OxMI/7bRQeoihO8ntaKoe74VaW68PJi4lZx8ZB9ieo3wuDzQxB6m/QEHTugrN3Zv9YiI
         W9zUb9WYSdVxcTDk5OD9vpxnmvRHnVbrMbussO4/iIUiVxZxKyFYNAHFua1jdUoZci2J
         FNog==
X-Gm-Message-State: AC+VfDzBufeRv4UGolRBEFkW1EyzOCPMZtYNAR4tNSa0C3CsPVU046k4
        uS5FoaiA5nsHlSxX3nNv1/EL3w==
X-Google-Smtp-Source: ACHHUZ5qV4hXWMeESfmnswW5f7tPeqyfZeqh3oZCxb/LLSC7PYWLzHRVV0uQ/wfg21ucQHEaYlTqEQ==
X-Received: by 2002:a7b:c392:0:b0:3fa:8519:d323 with SMTP id s18-20020a7bc392000000b003fa8519d323mr455869wmj.5.1688072463707;
        Thu, 29 Jun 2023 14:01:03 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b00313e4d02be8sm15745722wrs.55.2023.06.29.14.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 14:01:03 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Thu, 29 Jun 2023 22:00:54 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: c630: add debug uart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-c630-uart-and-1p2-reg-v2-2-496b581935c1@linaro.org>
References: <20230627-c630-uart-and-1p2-reg-v2-0-496b581935c1@linaro.org>
In-Reply-To: <20230627-c630-uart-and-1p2-reg-v2-0-496b581935c1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=lxcaNLhwHIb1Kd7dpGNsFfI0jp3FCFDVL+rVEqBfZ+o=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBknfEMbjz8QrivAmZHC6iPNemCLEsRKJzvcacAF
 lEWfsJU1imJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZJ3xDAAKCRAFgzErGV9k
 totkD/46W0wYE1Jowpo/a1h6eTH7zYFNlp3hT7k2EoGKxbpORTrHcTFyCCjO9m8bRHmGV38wi4n
 OHSZtQQNdMyEeb0lE1wkxHGPuMWqvCjmu32vsk0sahBKwWCp/46sFpNFETZG3KDVr5eQmCHownu
 1rjPHdIG0DsFBQ29x8O8GLcWX7zSc3KzpNITRy+yoGBhDoOEwM8Y7zTgJFWV1+0LZJfr9xaFy75
 P66KFQddkRVLKDNOENTcdbKvyoDna3Cr0LvrfNQ/Em8h/fONjzz3m5ghslFzOfKCVHFPvKb/C3u
 m7ORvAzrd5NcbDRPbSZTLU3RAJLNwWQcT10gaGxayT1BG/U3v6xKYKTNa6WtknU+WlyV81vjHaf
 n3f5szH7gk9887McbCaAldxnkZuSbTela/qyl8TKyza65zg8lTMz+Xn3vr9FxEkMuS4QD/loWJk
 ULHyn06IpcIsxI5npdZe9r0QzrxrSIv4yawe4+0dmzN9BykY8wMT6zSz/RqWQQFOPWD0jnvVQYh
 LKGJ2MzUlnya9khgQ7VbuyLQ3xdMeqOoTepEMJxtI9d4M64jOrdP2h6Pl5Wy/DIq8ZjH1ZsgZ8T
 sPSnXNf5oQY0J/DC2im01YXUzrv58cbTS/gqIyQojKXlAsmTCmLf8zbKZ5bbzsXylHDU7x9B6MP
 fJ6dBEbryGh4TEg==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The c630 exposes its debug UART via a connector on the PCB, enable it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 86030771d685..141457ddad6b 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -33,6 +33,7 @@ / {
 	chassis-type = "convertible";
 
 	aliases {
+		serial0 = &uart9;
 		hsuart0 = &uart6;
 	};
 
@@ -706,6 +707,10 @@ bluetooth {
 	};
 };
 
+&uart9 {
+	status = "okay";
+};
+
 &ufs_mem_hc {
 	status = "okay";
 

-- 
2.41.0

