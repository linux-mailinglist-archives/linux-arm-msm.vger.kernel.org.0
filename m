Return-Path: <linux-arm-msm+bounces-42056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7E49F0FE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88136283A76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3979A1F0E52;
	Fri, 13 Dec 2024 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MlP8CtLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D45D1EBA16
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101691; cv=none; b=p1QntaIHgIvo/GEr5E4kEmoQLXnhCP4heWvPMDNtsXxlfSnC3tS8JRXhshJrFhhQLen6IwNKm6iYJKv7ewfl3l3y2oByOxzwgR0cTdULEzDo7aehZix7G54k9o32OWeLLafeXrpYHgBynWoyLl11GaNK1x7zzVeJWuBWmn+rM3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101691; c=relaxed/simple;
	bh=UK71z6Xe6iJmG0GnvhsaMDwXXg8E1s2xSUCFK8MyLNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JcZePOL9/mFj1UdL59y0cUW2/cKkTY3XB4l6RYG9Sbu5zu36qXI6g8zRAs0S4Slz968qxZAAwyN8U2/9Vcf09WFbWExgh8nW6E92bXRJgawDCcR2CHKjzcZG9SzGJdPDpEoe6Eu0mB+ABnDZ3GsFugDieDkmQu9lEt7SE073rWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MlP8CtLR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385db79aafbso129947f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101687; x=1734706487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I81EiEiwUdI+JIWSbaapGslXqN2HtX0DJTw/OUdFpoM=;
        b=MlP8CtLRzg3Og9btCOX3K96Xfd9nNWqGTExCqB34iJol1LUbGbH5NJBWuIf6qR3Iso
         M39NRYS45nrBrSSSNt+43oDUu9yHA/GTYIQkUcwr8db62w0MC/aMpnDyXSYnpvnIt7aj
         7UtkjLBo4AbKVCf6DPZvetsR8ioyp9AxVNBQno/CRtH8A8WPJDvGaOgs3qw8Q+HdpwxU
         5DZ9OT1D3WvoNCwxi/zJQ35/kul69FczmtVE4yoxF3owpToCYMA+dmZLSbFDOgopb5q4
         74m4Uo8T16h/zh2kBzReTg8P3natD5Sv9YPpILljuJvq4cXm1qz6eU/uAZGczmhWUJUT
         1Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101687; x=1734706487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I81EiEiwUdI+JIWSbaapGslXqN2HtX0DJTw/OUdFpoM=;
        b=oj4HSxZZTLRlEQuCyG+3euwnLv3Gt+IjJS7rRMcdUoeABA+Xgvq9ZwH5+NjpFZT2wl
         IlxSAkTDJI41zlhbhmJGdxSmNn2kULSyydw6ASzrZAPgQdawiYB4rOaPMvwNnYXVxLLf
         chvv2i1Pe45a5BDoRHp7FjN2+JKKZuAjrFIa2OK/tIJh6UY7fU5pvAFr9/XVzXPQvUX+
         omsnv2RLAd01A7z2FpUP65tOoKs9wvYy8AKyJqpCZR5eE6y/JSdDQMtqGZ7YmljdwrXG
         pCOAHTrZuWZZBYp/EoJiVCTMtMsfbba5GidpInAOI/7NEsGVRNr6/IMcnbUvc5dhH74Z
         /Pog==
X-Gm-Message-State: AOJu0YwvpBKj+TKgIUXTopNy9bhRWN+5XxdY+RSSoGM/reD4xgq/2/NR
	86HvLqst2FCkOCBLmBTUsTmpDV4V2LI+GbBOMQ4wqn3I2zcxapurCSfrn0jB8/k=
X-Gm-Gg: ASbGncuiv2FHozsuXcZE9okaTJyVG4Ew5ZiB6tQQnRRD+bzaRdVQmU/TSvzBizAmt8j
	VUSUkZxAhKrjieI94pIl8natWzRSzZqMbvNY/V0C1kUpU38wrjeK+FpNbjrbuS/sZYQTA/cj0b4
	WvLZ7ob4RUbqAaoJuR1jZCMg2g69urgAqRGzkfnLfrPITzlSV9QQlEAxRmhpunJ04tNSvQNOeTx
	QRM8K2PCFiQCPGsWJwZgeJRuYsxx8D3nl6fuYuDI8GoBbyGKp1ozk8bDoQU0fZrZLiUXpZu
X-Google-Smtp-Source: AGHT+IEEHHoUXGbnpQGUV1OV2GokFRJgSyCRTjdcnX79EABD/ITgqhj1YbV738EKzBIHk5cyMQIleg==
X-Received: by 2002:a05:6000:2a8:b0:374:ca43:ac00 with SMTP id ffacd0b85a97d-38880ad8faemr787385f8f.4.1734101687203;
        Fri, 13 Dec 2024 06:54:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436256b42c8sm51547305e9.29.2024.12.13.06.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:54:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 13 Dec 2024 15:54:04 +0100
Subject: [PATCH v3 15/23] arm64: dts: qcom: sm6350: Fix ADSP memory length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-dts-qcom-cdsp-mpss-base-address-v3-15-2e0036fccd8d@linaro.org>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UK71z6Xe6iJmG0GnvhsaMDwXXg8E1s2xSUCFK8MyLNw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnXEqUBxoRUUdOsuuIM0IAxCJ5A8GNndaJGwGjj
 WZ3w9Id51SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1xKlAAKCRDBN2bmhouD
 1+fmEACEfyU90CHXWxMzUbsVHgS//ZZ7LO/QJravery2rwm4aYviDQAldj8JgOxDFUIwl/O9mgh
 QPrWOvXzT3hS74FBRFUVEmjfLCzEL8CI+tddfwYRFDQgmLSX4ihdFM2O1EBe8N8BKqTaX1rscxC
 GZvZV0E3essHM++Baoaj07Xb6RwLc6+ydbIOegC1bK1lu7/bnyyrI/Gf91noZGngj6vgmltSLUH
 d7Xf6KNt/fiIhApeirXGkpEYc9MwJu/XwmWXevLqTHx0Q9At4q50qGSV4D0w5CjnBnk+DXu8nW1
 9QqGzHGxwvUSkibrjATiaQyiRhPzNgZBwJtlJVlu05Ts0vE8hD7TyvjdlyQLQ2gY1uyrP26QvQm
 qbmSv9uS+8eBmbvMiF8cMVFC5XadWYTc1QcxrvwAM3SavQ2NEwctNqmkO4WR/yKLqzpow6iFZBH
 kwy3D3+CyFg6LQ2m3Gd0z7hMlYQ0n6O4vyLD5LHnbU0SnbN0yn01DyXPG/M0ubcT7mD2RYrF/Oi
 Uc179c5OwLjA7CnKeTrZuMADlvfuIb/qvyS7WWjWVUR8qHprYcyo/twdzYVa4O1DuQwInjkMR+W
 oIo7S/g+JnWbKrpq1cgkf6ahzjZytRQJO3JV2O7K0b+IaJPg07dZ5Bill3F0DmEJmFFK7bT8JcD
 hTuB4GySEFCOklQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in ADSP (Peripheral Authentication Service) remoteproc
node should point to the QDSP PUB address space (QDSP6...SS_PUB) which
has a length of 0x10000.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
Cc: stable@vger.kernel.org
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8d697280249fefcc62ab0848e949b5509deb32a6..3df506c2745ea27f956ef7d7a4b5fbaf6285c428 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1283,7 +1283,7 @@ tcsr_mutex: hwlock@1f40000 {
 
 		adsp: remoteproc@3000000 {
 			compatible = "qcom,sm6350-adsp-pas";
-			reg = <0 0x03000000 0 0x100>;
+			reg = <0x0 0x03000000 0x0 0x10000>;
 
 			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


