Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F06A6F7E4B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 09:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbjEEH6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 03:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjEEH54 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 03:57:56 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A251885B
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 00:57:54 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6436dfa15b3so1030686b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683273474; x=1685865474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD6YbDZJJDCG3Q5EdUcKmwfee5oU9TXm3B1yJ9ZVarQ=;
        b=N1TugOu6fhexCXgNCR5Maq3QrUAZ66h96UWDhvmdBaRm7Ua3+mAADc7WA+HKuk2fSq
         IlZdjnIq6SiBa8G33g+2c/DHK47vfAvA8YQQR0eF4eAXaA9lpKf7K6hAIW6swx6EwMvN
         rFvASjyBhqRRb90KTXKESqI0rBcsJ0cvtiGpis7DAQsXxyIgN+2WIJ+i57EnNwbkdCu/
         jPSHyvBxAqdqL3ENIPHEdB/2/EDmzhx5Q0MB+x76S7zh7VogpPs4ziVbPpVbTuZB21jv
         bNVgX/wPL5k86SSIkRn9A0e32BQg1mxc1KFIj+5u5A2RW6pWZDlnqOjOgbxq+oIdwfhZ
         TYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683273474; x=1685865474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GD6YbDZJJDCG3Q5EdUcKmwfee5oU9TXm3B1yJ9ZVarQ=;
        b=Y5T/TUUPQZd2jOhZsZHjRlYOFbUXsrHSnbB4KObaABn0fpdrSItLPKMeIs8IwAovhI
         4eixp8LttwRlXfAQEACDGB0HRllzJyufXCgbqKhJ5M/OnnlRl+x/ibn85Nl/11nI6Frj
         XGWvpBIozyicUxqTvPoSIQYdbZlopdFEXvu/FRHib7y2xR2gFfTBHA/EKWyKzrRAVeGl
         t/hFJTppwwVcaiUodCl1iveibt/hVjd/cRi7pEE76Wf+kvhdKPmQqAqOXgTUfYdKVxdF
         QTOSV3bwL8o1AjAzJty0Yv+MU0yratnqbPx85hIJ1fZLd6rHXZixaUEG5/gGe1C5mHRX
         tT/g==
X-Gm-Message-State: AC+VfDwvmGc5Uq1j6frBPBnFYeJEPrz8XcdRfMFy4JvV3mwhlWwvsuwE
        5i9FGGUAOHgv7HKtxajjwXybHeuXjhrPse1dFns=
X-Google-Smtp-Source: ACHHUZ58rGOnzG8XteNveNsjh99imnsda89PwBgCattqqQeSOK7NDttTHPHxNTkEnvAFf11gZ2caTg==
X-Received: by 2002:a05:6a00:2401:b0:63d:3339:e967 with SMTP id z1-20020a056a00240100b0063d3339e967mr1299592pfh.19.1683273474272;
        Fri, 05 May 2023 00:57:54 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id p17-20020aa78611000000b006242f4a8945sm988873pfn.182.2023.05.05.00.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:57:53 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb4210-rb2: Enable aDSP and cDSP remoteproc nodes
Date:   Fri,  5 May 2023 13:23:54 +0530
Message-Id: <20230505075354.1634547-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230505075354.1634547-1-bhupesh.sharma@linaro.org>
References: <20230505075354.1634547-1-bhupesh.sharma@linaro.org>
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

Enable the aDSP and cDSP remoteproc nodes on Qualcomm QRB4210 RB2 board.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index abea44fd369d..3e8ace0ceebc 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -34,6 +34,18 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/qrb4210-rb2/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qrb4210-rb2/cdsp.mbn";
+
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm6125-regulators";
-- 
2.38.1

