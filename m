Return-Path: <linux-arm-msm+bounces-33575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F3599515B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BAD1B29D8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C701DFE2E;
	Tue,  8 Oct 2024 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBUarpO2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB61DFDB3
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396389; cv=none; b=Lvms7YR5SCiYFFHFKfiQvtkM7cKaX+KYuL3jiMTV6oBkB721PCXMm5NotjXqqHqJLz92jYcx91EBis2gtkI2bQgMJLoKUA26GEViji2a7pEM6Bctpis1W3IxY/xGh5wekBKyYqUDPPaiv/YJWYY2EuX6nKItkvfNxevbwHR5RnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396389; c=relaxed/simple;
	bh=jbN6Xob5YJFb0MxA9IvVkAB2WqTY7IjHlPTtNsNyFV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvcYGYXT7RMJHX5N44gdfBFlb8OVkOo04wFAS6l9tMqxDqWW3/jnGGQQ+d4HB/MXXicYrhL1+Bx4W2v7E7o39ip6qtbGkUs2Y6W7werWxjuk46X0V/V5F+T8yAumVtew2bgOf6rbVDIKAzrJcV8ud0AjSrMzNsCXkXHTrgPuusk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EBUarpO2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9944c4d5d4so345892966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396386; x=1729001186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NflfzsECyCfaJvqWC3uEW8VerFUatJHPUS26i/9U2CU=;
        b=EBUarpO2YR3VXowUhhd4h9xCnur/K7WCMT9L5rA7PWvab3PgZAD3LaIYXMmdHcqE+7
         0FPO8O1SkHPq4cGr+53KOl3fJsizrUu060GFCjMdUPeRrH1cAqVhT4Wvgp1hVgrJkl1Y
         xNeCenN49wtGpfF3Rkt9PqHGXlkQY+YRAHmWo2gtl0MxPrJi+cla46mj0sUntDLx6YxM
         zxhPTsL1iXUE2LqS0BOvdib8udZBC4OAb5tIzFqKxkPT1BIXmLLJNGoonOzw4YlDHlWa
         yecPu5ET/6VXRjbccVQAoF9f84uBWKPi3NOE4+blMRFAMxBnU+V9PXXBItn4fkVqC/SL
         JTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396386; x=1729001186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NflfzsECyCfaJvqWC3uEW8VerFUatJHPUS26i/9U2CU=;
        b=Mf9h3nc3Av8S9/DCFnaAvBwQdZi1t0mBFEK326nAGzOaFtZYyHgAxI87kxIgQisXp1
         mQzSXGTvk8IiW/fbQYLRjKH/ZG5DuYnvaIhe8URMigTihzqnUIu6KbUIruehgJEwxjjr
         MkRmtjxvSNDGPfZ2aP5AVo0pRdStxGcVdHjk8/2far2z316x4gDJGlHfiNZ7ZaDZ89SD
         AfF7YcJ44ojkWZwt95aqA8QKqQycD25RFvXC17uWYV4K4EOTWZsmeq4Vr4JvWgZvDHWU
         XijHGoFM2qkjLFhUqyUHTvZVZOjc1NN/WvKbtmXuhQKqBqYJiGiKQim/boOkDX/QU4Xg
         kWrA==
X-Forwarded-Encrypted: i=1; AJvYcCWdB6+NpsvCKXJsGxV4zO3mpNqFqd/zlqo6/OIMiexVRkxoweV+8eTXCd49EoAXDGKbOqGkatF9Gj8X08KY@vger.kernel.org
X-Gm-Message-State: AOJu0YwLrXPLbd9zGG1cnZSTDHk3vI8JXzKZF8PWrnLoaeU1L+xtDe9g
	K1CkT6ONdsgiEDCZFw7wyS28AAydLIVXQOVvGUnDpEdB4NMlHmoIK3dzfdRgtzA=
X-Google-Smtp-Source: AGHT+IE+0DAkXXos4GnYBRjs/P0JSyfBjz5jp0PZnBLxlFgUf8/Ko8GHIgcDAweYj6NHkpsX8OEU9Q==
X-Received: by 2002:a17:906:7303:b0:a99:b0:b97d with SMTP id a640c23a62f3a-a991c02fe6cmr1617204266b.50.1728396385644;
        Tue, 08 Oct 2024 07:06:25 -0700 (PDT)
Received: from [127.0.1.1] ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994f50fcd4sm320714266b.171.2024.10.08.07.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 07:06:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 08 Oct 2024 17:05:57 +0300
Subject: [PATCH 3/4] arm64: dts: qcom: x1e80100: Describe TLMM pins for
 SDC2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-x1e80100-qcp-sdhc-v1-3-dfef4c92ae31@linaro.org>
References: <20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org>
In-Reply-To: <20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=jbN6Xob5YJFb0MxA9IvVkAB2WqTY7IjHlPTtNsNyFV0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnBTxYQTKHwucGS/OGdimtbGnaPUMArcmMQ7JX8
 rcqbhODueWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZwU8WAAKCRAbX0TJAJUV
 Vg8lEACPG35Z6Zn05gn/sIL8J0/b4S8uZWJy4WKvZ5by0ZPSwE6ODc49CczU6elO/z0lx7JQea9
 p8z4uUKz3GdFN3JWGphlKd2OoRp+cv9jW35gp71zZGN91ZHHdVPWWYK7YBjm6hRRxL9f2NJfJMG
 I2209FL/LMW1XI/WZiJyJggbLkySLWK3XLwHCdl6iecIO+w4sPsUK3RdZ3isAUWwOx/tlxy3vIc
 SCSF9Q5h216Q0NCNf8rwvOhQ9m6CWASPsxwF/ebC57786WzeUx4JrHKMme2Mw/4grm9o84rlYCr
 Zpk+PWfniEtkDYJBrKEyniTRCpS4mzFVpy4+4bJvhjzjju1XfIMLTE+ycD182fSs/j3Zgilr4XU
 1t2ryHVynColYGBRx+JVM5JcZwFSN7oOlNq5ObUmUyI3+XdjrX6H+33xwv4S5j8MeGtyFUN6eLT
 FnmiGSZmqtDQqMKaV3KaEvmPGzBxY5qbo966fAUhoJH+zQQlOHr3YFlZGFWf2lQol7y0+N/QfwP
 u+awWSiSuoLG5dgJzMpzJlPqQczf4OIQkpIjWt3O9Cf4GJBmDUzqR20njeKRb6C9+K64Lim29NU
 0jT3uTlz30KW0Zv7NWbngBHLukHpxFnJL0C0lEkazYt+I4eoCk1Y8rMyP5wmNgsr9aw7tXhp8qC
 BIZ/Sj+Ko5+R7/Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Describe the SDC2 default and sleep state pins configuration
in TLMM. Do this in SoC dtsi file since they will be shared
across multiple boards.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index b835fd87b977ae81f687c4ea15f6f2f89e02e9b1..f9f5da60244cdda7499883dd593b809c4274510a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5740,6 +5740,46 @@ rx-pins {
 					bias-disable;
 				};
 			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
 		};
 
 		apps_smmu: iommu@15000000 {

-- 
2.34.1


