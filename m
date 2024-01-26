Return-Path: <linux-arm-msm+bounces-8420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81A883D7E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 11:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB4661C2DF26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146E55A793;
	Fri, 26 Jan 2024 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L3Rb+7AY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B87E5A0FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263240; cv=none; b=bfZT82n067pZgJZcuynscT78bND+SAgao8/GVOv5oeRCm1UkQ74ALqicr327JJUbZ9F61AQwWSjjdFNHryTctVbK5DxejqTQtyyL5gmZUx9kHudXjSsh41LeDjOudhGtlza7xIn3wOFxc2WcN5aUOXI3NTqCj86DYBmaiLr/GBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263240; c=relaxed/simple;
	bh=hGwGcRNAY6z3nEOXAcPO/GTMblUWuls97b52uwcWv44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGRfcqLk1gaJYK5H7MpWXiHsXkKPHWeA4b8Fy8Mlc/ddOERXYSYPYNgF3cDEcQmWPlp5UTYP8Titx3YksmjcA751ndDB3I19ISde9aZDS4QkwE7QSkmk0LDk1zP1RM++9AGfEfp0ROyupaKqiJfMQTBuZh7ILSnDs93NVaFurnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L3Rb+7AY; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so72472266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 02:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706263236; x=1706868036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpWk+gUI1kF8qhFNhkLXzIkhTvjq9VbD2XVbc33Jwiw=;
        b=L3Rb+7AYp6fseBIkpUcMBpYwGDIlM7KgZlw/F+tFHj9xuDcCu97euCi4HKId2rMwOC
         xzr3Z7L3sUbO2pVmt8SONMk/h+zicQyfJbyicjSWQNWfYdhalhEGc0a/3ZaB/Va7Kdkp
         KCDCYXp7y8BacIaF9mQI2ZLJe4BPWxRlJx8HFxLWyCuE2loGfOHskSiuBmJFOqOvCRdk
         jHJDKShwyF5H3v9/O98AfrJOOOqgOxIfYtGsn/xu1jCdvkQLp6z2xxD9bUHc++FIIEAb
         kRiIgJr9XMR8qhbhBOY/qXE1i3B0e2CAyGoqpjHzmPJSFlda9IhvNXqrwWhdw7T8zVU0
         +XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263236; x=1706868036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpWk+gUI1kF8qhFNhkLXzIkhTvjq9VbD2XVbc33Jwiw=;
        b=mS7avKUzxPgO8VXgOA4YJfYkxE2e4/MTd6lcswtTwzKRgRrNLVqJ2zF3GpzcK3nxLg
         PGVlsoRlwAPPdhljwOmcr7CswFi0H+ekIkQqU/8/kfchoq1vYfsyXxclQ0OO5UutMiys
         7k+LPzovwHxcdYtXERUxYBxuKMwloyxFL22Yj7iKMS001sisf+OijbPRaxlpxKeC2j1R
         1Qg1ALOqU0q71tfg4tBDfDjGcWhPY5lTEsrn/uegyXBaQ4ZoDyxZuX4shFOFmZUQ/hqm
         dPfGMF/1MGmbtGEAirdiPem3ctXw4wkQKr9G/96WUxK1tq/tUcajHNduHjWTjOlystZO
         HZKg==
X-Gm-Message-State: AOJu0YzRUpRcMQRf0GE8cku2i1vxdahje+H/cXIYStMysgU7gImuiRJ5
	EUGZZoUeq538m88mvPFRVyRz8XFyucK024jVkQryplwy4EDwHAtdF6ija3fEvEA=
X-Google-Smtp-Source: AGHT+IGgnS007fuhkWbrHOY8Hm5PLg+DpOviLmtfweXOzv1lV1sobHAbMGr6R5wK3iXJ1ewfKwLObg==
X-Received: by 2002:a17:907:1115:b0:a31:29fc:6ef2 with SMTP id qu21-20020a170907111500b00a3129fc6ef2mr992557ejb.41.1706263236319;
        Fri, 26 Jan 2024 02:00:36 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ox27-20020a170907101b00b00a3221b95ce8sm448494ejb.77.2024.01.26.02.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 02:00:35 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 26 Jan 2024 12:00:12 +0200
Subject: [PATCH v5 01/11] arm64: dts: qcom: x1e80100: Add IPCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-x1e80100-dts-missing-nodes-v5-1-3bb716fb2af9@linaro.org>
References: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
In-Reply-To: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=E0uYI6lqGwCrH+pcr7C1xTC5esqpTyDE5ExbYCu6A1E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBls4K1TYBkgTqwXrEbqeXg+Aim5DHszSSJjyvT/
 vI1lD8swOmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbOCtQAKCRAbX0TJAJUV
 VtwWD/9VIqizRIjQQSw+larObbTg/pxfL+o9U624XWEa2/X+wdwFhL7nUWhuZtGJ+wUWQm5nAQL
 7bCiKDtmV4mpNHQWAQHIt7EGd02B4ah9nxi+KmMv3/2kiO6/88LyzCI/e9Y2BZMJ3iSk7t/UmsG
 80db9iB+I5OIo94D8QD7Vb0V67G39bHqpkntfXCJAhMMB0mxASMa2meG8nXtV7sXhMc2RIAbSsG
 UZ9y8UUs5fVdUvfSeKgOfEZxPx29HULmPJSf5mbAYTqVP2OvcSdRZ1H1OV8oH6kN8ToGVr6RAmW
 Lmm7vAT2KZnEy6tRpkGxzrCUYnPPwsuZ6coKYngCQvu9bJtNC71Qwjlv1DZFjUQA3EsXA3y9M3r
 W0t2HIGPhO8Qxqa0zcz7NHW122BodBVG/i1WhxadhfVftHfkqZ6dzJ4bvwhFJcxEIt3Js8ToRQ6
 osvlZ5EzTPvtJMQu14nNDQ6y4gGuaihDmDmUCviB9fNws/fkuLEFPqqsiNu5kbLmu6/RgAQMY6c
 vutSOA+a/M+IS/kCu6dTFiyQs4XcEmr/B0PNhyd12zchDqNg2YuVtY29Cl09bxUy7vPWl3yjmrW
 TbQ8XcktUHfjHBOrsS//1TEKSEqsap/pIAImiJjmn58iwYnxqwv/QisTk02Wepp/yMeFqFK5Bp2
 sedXaybzQHUudSQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Sibi Sankar <quic_sibis@quicinc.com>

Add the IPCC node, used to send and receive IPC signals with
remoteprocs.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 6f75fc342ceb..954f2bd9b1de 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -691,6 +691,17 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		ipcc: mailbox@408000 {
+			compatible = "qcom,x1e80100-ipcc", "qcom,ipcc";
+			reg = <0 0x00408000 0 0x1000>;
+
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			#mbox-cells = <2>;
+		};
+
 		gpi_dma2: dma-controller@800000 {
 			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0 0x00800000 0 0x60000>;

-- 
2.34.1


