Return-Path: <linux-arm-msm+bounces-15897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 354FC8935F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 23:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7565282017
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 21:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B845148834;
	Sun, 31 Mar 2024 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kpkz7zYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420501487F9
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 21:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711919449; cv=none; b=Ej1au/Wx8FjPKEmwV52t/bRSFgpE1dBErq4KPDLyS23pI8cWRjVJe8qK9SqHxBXwI36XgPMJus7eoCT7Fepj84aCbEUoocGM31qpUrG7SLYO5Xmm3c0kClcsWPq4Fsy2a+KQ4+9LwNRelOxUQZdA1H8GBouDeYLR/iXCECOsRUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711919449; c=relaxed/simple;
	bh=dcd535qx8Msn/2joEysg6oy8R8v/M5uKoR2/EcmwORs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQd/kWSERNZZbOnEumnlqmXKOQcRJQF5pZJe30ecd+lBvbyTyyGWc1QgF7X5SRsy1eDT6BkPb65Kdr9mQhde3bQY7nXSOwQhbMBKpjMqjFIRaOFfjKLusUMO2IwNp88OdQQKFKS3K0ibtMMQLkwRsdMBX3w58jRPQAnFW7GHNNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kpkz7zYt; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513e6777af4so5776730e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 14:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711919445; x=1712524245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv40XznBi1vAVfYC8yDgaimDwP+pONYwDVmAMHNv9eo=;
        b=kpkz7zYtjDFDkH0gtwG16IIjfMOSkbx2FH1GyShJfd8jWCaPqpX99WxRKoszBS9AII
         Heebvuzz6QbUYN2TOwZdhAhmb2HCQWQWtA9cmA9QzHVNPgqeF91+bJ1c6KdEdcPFG6RO
         GZBfHDj3VYxMYd8NY1Vo7nm8kozjkHvOafNCjP45Vz9RtLOmkk+8g1cmqWLbEiaTqwH2
         6Ae0irQGSFrswmd53GBGVN2OsTPXou3/sJaTUPzEhAKrT3WRN6CMP8Ijhb8I/h2okWAY
         ebEoN6CLDNp/EjNoiz5CMx9gUves68AtmvoQz/zIFi9+a0NBVHG7EuXpupx0FcZFw9g5
         Te7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711919445; x=1712524245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tv40XznBi1vAVfYC8yDgaimDwP+pONYwDVmAMHNv9eo=;
        b=RKIX44mODKmMYPVp7RMwhCHQkg29f0a+xJIibZMcB+yCIrCh9deiUQWxiiibE/JFX+
         4wB3+uf/uDJBqKhi+7NW87HIjx81XBelVRmwcSG7smRERSbkTy1K1yZifoU3bpIBZgos
         zLZ4zTgpGUEDyrnYmALV8HvRFMQS6zs9JQyXOSaw2oazpvdXmOncQ82bmL0wGIrI4HWx
         mhB1epoE4KlsUXRAxgxc54/TMZA93Dp8V4OS9mnpfxmj6mFEOVoNbDhUOxqZ80kH7Ouz
         ZxINjXawcs2NlA8n1ic9rKSLPMQRc8vvuwfJvBxgl1spFrzOxq+957BXHEAvnQprjcEH
         rJ4Q==
X-Gm-Message-State: AOJu0YxZaNoSXDISWRthVQug1amZslUPZm8jcgRMmVArsNDuMI5RLuOM
	lTujW1hk5HEW7gk/LgZyzFYNx1eFgeLRLJt6ilJy1t1IyZt9ZDJwW5YC/NlJeyQ=
X-Google-Smtp-Source: AGHT+IFEA6uS3gqEQZKPe7rHhz7PcpsOExfg+q36ngAJUhw0UQI9/RUO1kh75TNk4okzdxKG3QkPEg==
X-Received: by 2002:ac2:4579:0:b0:515:a665:94ba with SMTP id k25-20020ac24579000000b00515a66594bamr6365939lfm.19.1711919445254;
        Sun, 31 Mar 2024 14:10:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i1-20020a0565123e0100b00515cd1d5c99sm1033553lfv.85.2024.03.31.14.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 14:10:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 00:10:44 +0300
Subject: [PATCH 3/3] arm64: dts: msm8996: add fastrpc nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-msm8996-remoteproc-v1-3-f02ab47fc728@linaro.org>
References: <20240401-msm8996-remoteproc-v1-0-f02ab47fc728@linaro.org>
In-Reply-To: <20240401-msm8996-remoteproc-v1-0-f02ab47fc728@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=R83XHWqBdDfp1V5QidoEvj366WRCJE4TWSgKYBFj4mM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCdFSEpANkDeJuHAzZi0bHTkDFQFhz6m7XPlqp
 MbDtLV7cG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnRUgAKCRCLPIo+Aiko
 1UMhB/wNkIWNf90ULFC2acFs7yEMVOGV9Svch/GGuBeq7iQ0n1d7babLHSycAhEHoa9Tk8vIRtE
 2Jj02nsc2UsLQF4tkHFyn889T6jmJeWQ2QUCPBlxLYT4ApkOVE2Kr6a2enFNVEl90s29PghkDpZ
 NuMTZv0RZk2WCMfueAxfBrsNC+R7uYjx7vx2DvE/4qh5dJjrUuVImvE/wR0blLbJHZyoHaOITpo
 ol4Hz1CxKQxQKpBer3KS77gwkT4U5cRPugmxSrPyNsUmgc1VxuVr/HQqGzvodXNBNlUepntLcut
 ae0TqG9K9c5NFIdpclWru0xHcEEqz9nXBNZYS3CvvZ6yx4B+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

The ADSP provides fastrpc/compute capabilities. Enable support for the
fastrpc on this DSP.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 7ae499fa7d91..cf7ab01f3af6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3545,6 +3545,63 @@ q6routing: routing {
 						};
 					};
 				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,smd-channels = "fastrpcsmd-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&lpass_q6_smmu 8>;
+					};
+
+					cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&lpass_q6_smmu 9>;
+					};
+
+					cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&lpass_q6_smmu 10>;
+					};
+
+					cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&lpass_q6_smmu 11>;
+					};
+
+					cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&lpass_q6_smmu 12>;
+					};
+
+					cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&lpass_q6_smmu 5>;
+					};
+
+					cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&lpass_q6_smmu 6>;
+					};
+
+					cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&lpass_q6_smmu 7>;
+					};
+				};
 			};
 		};
 

-- 
2.39.2


