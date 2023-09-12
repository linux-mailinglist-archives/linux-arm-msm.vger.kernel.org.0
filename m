Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 049F379D2A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 15:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbjILNsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 09:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234874AbjILNsl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 09:48:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1885110D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:48:37 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso91637691fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694526515; x=1695131315; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwJmObPcsD50LIqTPhJmLbLl8WWuDdVPEjUtTz2cJ/U=;
        b=cfXDOcF0H5KVVEJOfj92jxv4jOOcnPcPYkHUdtoWAdTL87PWI7J+BU1M9mIFcCRu8I
         btghSJh4fGzOKRZvBSQ4E+rGY0c0HEsKCiHoiTLJ3fX7fHRisKi90X9chog/RL6FEi6n
         fMTtJlfQCaAKHrX6N8h9M8LcaFUaHj+rrx+LeFdaVPU/piBKv7fJxH35KvNCYlASje2v
         wRBQRSrITMKWJwr0WvxF+EMSLRbxCs13xUv1cwxshMglvcNynhEfcc7YapR9w+WHy5Lu
         wECui/yERZsqsOzTXLYszrzVnI3IgYI4KCEzR9zRulJBLhKapL6WHk9jmlT9yNdZzYR2
         HrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526515; x=1695131315;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwJmObPcsD50LIqTPhJmLbLl8WWuDdVPEjUtTz2cJ/U=;
        b=S3tGQwF9R3B6Ujoij+/U7Zboh+3cuuWnv8TnfaqSyblgmhZOuG3/BvQ2G1jzmqYCPq
         x1/Yy+WSd+IzJ1IrvJbZhJmAPrtloYMN+itOTYPqdrA28Qlr+S4uKsfJiqiejTbcSnyG
         oIwnh0aXeFMjdPs4NleVPyt14YDXyz77cu21VQX7zSshfbxtap9UUMGsgL01VWy5Y7uY
         Mp91EspqGb5LOU5c2CxgzmalU7ITqN6YZccV2SxBhgcUC0RaBmJ2gN6zsdX16LBRRp1n
         Vuxi3fTtkA38VLA0VRTERn7+mWdP8H+ehknWqWPQqwpM9IsGhbMgSKrDKVn/tfl1HnJ9
         wg7Q==
X-Gm-Message-State: AOJu0YwkOpSLTxytlfAQGtHhfUKGraQ8u1LJCKp9r47Fq2R2lr6Z0CKK
        EtEeGFv7lG4RWe/5Eqg9onvWbg==
X-Google-Smtp-Source: AGHT+IHIIk6GYfLjQ7a3jIfV6ls4ywsm2n160dNtAmOlTu+t8trDmWfpIyXDSn2FbrsSeX6uA9NzYw==
X-Received: by 2002:a2e:7010:0:b0:2bc:d376:1bb5 with SMTP id l16-20020a2e7010000000b002bcd3761bb5mr10102644ljc.19.1694526515313;
        Tue, 12 Sep 2023 06:48:35 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id f20-20020a170906825400b0099bc2d1429csm6895178ejx.72.2023.09.12.06.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:48:34 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:48:31 +0200
Subject: [PATCH] arm64: dts: qcom: sm8250-edo: Set UART alias and
 stdout-path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230912-topic-edoconsole-v1-1-b392ea67e539@linaro.org>
X-B4-Tracking: v=1; b=H4sIAC5sAGUC/x2NQQrDMAzAvlJ8XqBJ6SH7ytjBdZ3VEJwSb6NQ+
 veZHSUQOsG4CxvchxM6f8WkqUO8DUAb6ouDrM6QxjSNOabwbrtQ4LVRU2uVQ4lTngl5LhnBswW
 Nw9JRafNQP7W63DsXOf6fx/O6fhediU93AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694526513; l=1055;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eIpio4od8Jh95jYfK299qD9hOrK4tv6sbBOrChytBbE=;
 b=xp5ZeUvUwGrJC/vKkEPY43/ECBM4XkUvGCi4bbf+MCvTJX7Or0KK1LClBpsVRQvCqfAYIkpjD
 ULwB4JnTq+SC7Z0dLrMZuvufasVmg0e431Z/ZNvyAD63C44VdmZgDJd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GENI UART driver requires one specifies a numeric alias. Do so and
set the stdout-path to route the console to the debug uart in the microSD
slot by default.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index ecdc20bc10f5..e07d0311ecb5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -18,7 +18,12 @@ / {
 	qcom,msm-id = <356 0x20001>; /* SM8250 v2.1 */
 	qcom,board-id = <0x10008 0>;
 
+	aliases {
+		serial0 = &uart12;
+	};
+
 	chosen {
+		stdout-path = "serial0:115200n8";
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;

---
base-commit: 3c13c772fc233a10342c8e1605ff0855dfdf0c89
change-id: 20230912-topic-edoconsole-f1395cae5f9a

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

