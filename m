Return-Path: <linux-arm-msm+bounces-20833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 707CC8D2643
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AE82B28F82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 20:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0B01802D4;
	Tue, 28 May 2024 20:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JV7oX54l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579B17F398
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 20:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929026; cv=none; b=eZlmPoxdbaQzfY6/wk9StU5nUySKQbG9H4Pb7uHGHbiNWUjqzOz0m4nGzJMGpJ+VGbNIQE4e9QQ/CkSdbEhWiN5Si++zhdexnDi3jbN2vsTED4RmQmrPDlQusskUBK7czbiqBl8UyD+id/DNWqu2NhAJNx3CIwWqOUdiBQfbxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929026; c=relaxed/simple;
	bh=rRrgn9wRVOiElWPDaUjrdPE8GcJ80QnHEQvUPT4yYv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svv3Xrq17y5SFYS4x+EO+adczltr41yYE5JJG1Z7riA33/H8s30sp7G9HQi0LV6gROjmcEMlwOkpIvS396Sf/lP3g5illTgOr6L9Ocox85vdxg/m/iDWcjC2+MGXskuXeUFv2Y8fUQ3g2/sk02iv6I/d2r9w68YWwnljynbWUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JV7oX54l; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so13568551fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929023; x=1717533823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X52tPGcJvxkBvOLIf8hl45B+JUSUGh3EW6f1yVnQtag=;
        b=JV7oX54lfTDDeX/QFYuoMLpeGRpO/g0Xt+kUD8Xjx+x5QlNmXxmbtzA/8bBP8Bybvh
         mZd0/ZZLVZKYc/ZV9q0bcLx/MwwwTBHRKaHRtBfpGtJTDxjpS55sZHW+F4AwzgNFwoME
         a0O1PLgAFijdidQaqpvfcZCxo8VHmVSYAyLMD0jsgrQosYtpmByMIfLZoc6TcYhTJwgk
         oNGwbpyaqD/GCmw4ntR2k4or3z/xTLGLZA/eteCufJEZI+UAKMYupV+SH2K7cyQuQMXs
         Fhevf+wZZ8EJHATtobjdwZzcUjiNsP2qovio5IZsfG7f4cSdks2HUlv7n6H4aPER5Xzo
         OtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929023; x=1717533823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X52tPGcJvxkBvOLIf8hl45B+JUSUGh3EW6f1yVnQtag=;
        b=ZjVNSl9hScHohEF6fIvTQJZfPc6ZRUs9d2tPYB5vPKvBgxwp1ZjsXPGNvoyQEy0WO/
         DUi9eEO13sQuJhADFWXZ12Sal4WhSa9Vgwv4KhJ4mCYO0igTiWO0l4PsKgnACaE9diie
         g785FQuUrCvXkrvcNWpRiECgkuvxVaKGiSz6AqJSWLGDPGyvFdZAhPsC/omH8Q29SY+Y
         EOEZKjs4g+VA4T9hY0LgAmzOYufCDDTRF31mN/F0ftPvLtNizLJOmpPmUsXjFAlvX0pM
         KnmsAYF3VHGiIYf+O5n0YryusYc8rJ7xr8OsHO7gZpL2f5+9wBMC+jMHYWv0PwIyO4rT
         yE+w==
X-Gm-Message-State: AOJu0YyEaniQBwdtVcp8/PwPUh/RycUwlxy0sDOwTt9UkRiJyFW6lxXb
	3nq4J2eklGDQPJ7WL52FNDwZ7AAntKgQ+GJ3lMBWynUxwRSwy0qGBnl4sDAMlE4=
X-Google-Smtp-Source: AGHT+IFbe7p+EQIzfqeq4PnVAxbgwkiu5PKPhypWn5tjT3BDKPkFXa8mSbXVwmAVy/Oaom36iOg8qg==
X-Received: by 2002:a05:6512:314e:b0:523:8a14:9149 with SMTP id 2adb3069b0e04-529645e312dmr7316650e87.21.1716929023660;
        Tue, 28 May 2024 13:43:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:43:28 +0300
Subject: [PATCH 10/10] arm64: dts: qcom: ipq8074: fix GCC node name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-qcom-gdscs-v1-10-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
In-Reply-To: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rRrgn9wRVOiElWPDaUjrdPE8GcJ80QnHEQvUPT4yYv8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH2KRsWKznmCO9vE6RpVa9F28gHt5jZW2nn/
 CMHYqvZmUqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9gAKCRCLPIo+Aiko
 1aMZB/9tb42U5p+S9rDmbixA82N1gxWgZqdAzkzsHKOfMFWqAAZJsotTgQbXdtIPfZt3Q2yQRIM
 PZ/DvL0YdHIaeSTCPx/SbMsoCrRhyw6YxO7liHOhxm0Erm1/UGrolq0wIm8vIy49ihWjGzw9jLG
 0edH58DmLi2AmBpE1K3+py9Qnj4dtTvCPknKDanjMFS9ZB3UPdiGXMIdPPdgUqQqQBPAhqP/3oy
 xTndqqBNmGSMddfCMGhp+4gmtr383Cammm5ocoJEiv153l0dWCJzj+6JAVBcNvYLqJe4/FPgqkX
 aWfGGlXh0SOp2uHS+fsHgy9AnUMlqDq1ZVGfbiB7s25ystlt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Device nodes should have generic names. Use 'clock-controller@' as a GCC
node name instead of a non-generic 'gcc@'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 5d42de829e75..27cf8d50f254 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -363,7 +363,7 @@ qpic_pins: qpic-state {
 			};
 		};
 
-		gcc: gcc@1800000 {
+		gcc: clock-controller@1800000 {
 			compatible = "qcom,gcc-ipq8074";
 			reg = <0x01800000 0x80000>;
 			clocks = <&xo>,

-- 
2.39.2


