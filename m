Return-Path: <linux-arm-msm+bounces-24463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7216091A714
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6F8D1F27965
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED53B181CE2;
	Thu, 27 Jun 2024 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTPSaGQm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CD217BB11
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493047; cv=none; b=jCrSPFW3JF+ny9XY9degnLThGhfGe8U3iigPSg2yVJkRy18tH7LNQ4NldjB3LMqorNxaafzIytCt1vTLUQBfk4v0vTN5OXR78FhQSX+y7SoqAUfX6/GjJRpdQybAWpMpd7T4hcxdm2swpsWQAFgjA9OT5PiMgMWrGxvA2S+whgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493047; c=relaxed/simple;
	bh=PnZ4A6lE1NKKtqh+tk7FmZuOCHNuJgNobgQ12ZeKfEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UO2azuXMPG/thBWXp4kBJEc9vh0PMoYTA/iQ6MgFf0thabsmX3WxccQp16gBTszD4vX9gKbyxEEIfNRHs0e20EH0W4fgVfKhg3qlExIrAvXGGLa1nMDtQhe6DL+RjhOsM9Wpz4SAwfD1Ixyzb6noaydpiAhLOIfzmgTkdUGLDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTPSaGQm; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so8324968e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719493044; x=1720097844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oH6y1W05QvkpADQypriHH+zyjk8fNo4r5NhWJ1Z3yZY=;
        b=eTPSaGQmxvqTwKGi8mIJtuhqwDzEz6WEc1UDsZw5Tj2IcNIZwK16cKXT/CHvb0oET9
         ZbeZ9GX6TwGbP2baitW1yVcaD9BHr1vVxYYvg1TqyCRrWfnE6hw0/Onho2Fo0+XaU4TR
         4I9MWNxpBHKAzL2rtxvJIRMbfE9fa0k0U52MiVvRiOlY/VlLYz4kBs8LS+e1aq0oI1aW
         G9PBEm76jOlg2PNolT07p7A96jHPQC23ZjhsQI+/R3V4LLHLK1RAQFzTXb9HUfriFmkT
         H3XoAxl7jhTlq0Tifv+FRSdqDjVHf7nLnO5XLz6x6lWS2cra184BYHiUvLj9pfg2Hgch
         CNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719493044; x=1720097844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oH6y1W05QvkpADQypriHH+zyjk8fNo4r5NhWJ1Z3yZY=;
        b=cJqCvx6NEwdem/YP4av6sxzJcqKxCkGFZA10RxdwFggmd1tbHxkrRiQiKdsY3WmZiZ
         gNTS+hyPKsA1Bbc6ZBQ5YqHvBFTNxqm6kEDMyWx8UkR0rXSy/V0WpkvY7nkgsnpfHkra
         Yx9bf7htcVYRPMNlnFY7fH31UWNZSNIp7ROFNnb7G80nqKf1+A8xEDEoE5bbDmGjcvho
         NrAKMevGKx8GVJWSDmJezdY6LGH9ElRAIHDCGperHNK+TJqZibE9JwdqUvNaOG+M/r01
         M5+6p8ahKPdTK40w4twCA8wVyISuusMjuC2dS4yG6WdGHMxFkJM2c/V8VvMgN/P1IEyD
         Muyg==
X-Gm-Message-State: AOJu0YxyLiXKTV9bcfU2b5vRIKoaXYDmm622XVFOyouP1SZEqHrVjPeq
	5vFrjWsOZ/r9dKTAI7yaXuu73OYJCx56sAu8WTWkFAVt3J5HPD1i5SBqeTaPzYM=
X-Google-Smtp-Source: AGHT+IF3PqgfFJ4Rk+ejoDF5sCo4WkTC3CbhAPa4rp/+ID8u32Ssut7uZHSxndMoNFg1vE4SM3zz/A==
X-Received: by 2002:ac2:495c:0:b0:52c:90ba:9705 with SMTP id 2adb3069b0e04-52ce0641504mr10638278e87.49.1719493043912;
        Thu, 27 Jun 2024 05:57:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357fcecsm1800752f8f.26.2024.06.27.05.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:57:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Jun 2024 14:57:15 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sm8650-mtp: add port mapping to
 speakers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-topic-sm8650-upstream-was-port-mapping-v1-2-4700bcc2489a@linaro.org>
References: <20240627-topic-sm8650-upstream-was-port-mapping-v1-0-4700bcc2489a@linaro.org>
In-Reply-To: <20240627-topic-sm8650-upstream-was-port-mapping-v1-0-4700bcc2489a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PnZ4A6lE1NKKtqh+tk7FmZuOCHNuJgNobgQ12ZeKfEk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmfWGwAJ3VImKrhPTc13jb7J4P5V+GE63AMtN5bWP6
 MhzwVIKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZn1hsAAKCRB33NvayMhJ0U+vD/
 9Gi99bNIcYBb/+M2VlI3rWygIsrFr4TY1LvogiDM4ABvxTyXPwaSf4aTofk/7FTDb6gBzHSbzrC6js
 His35GVV0piuTglit3dIGnegHMzMlaEBfY3gTPW8TPHcMas+HpzrNXQEZXQ3KK0zXC4DsJipzRmobw
 m8bc0yFTbBnI2kgAF8sHqwDNr9ECqmaMdLy1HehwyqE79k/TutxhzHOdlGQ5jReZ7QYdgpI/8i0/Ie
 yhOtVca0aH2FCcuCVeo/aYHJ/4q4K4grQQ2gS0Lyq1YzyNEAV/s7YloOa55kRktMNBJCf5vyZrSn6M
 L8pwAf+38NG93g9sYcZ0vdxnykv9Mi0x7YRABEcPduN7/sSGpe3n6EcNg3ONzw3Nm3XoNcQ6VgL/dl
 1y3O6OAI7lMvtsiPF8696O9TWMujcMBU31pq5OJrd5S1IKA45yX1a4sUhp1tMm2zvYvMXFSZ6SBU6z
 DCSnsJlgcDQSAmWLk/DPnLN1RzIFJkRP/c5cnP5QfA4avP7TCCemb+aRf8IO6kP5PhUHrvD5mhiT44
 HjL93PVRX0UszfiveiWX2PPkEtPiA5AR7gciZY9Tx42EOe/gNpTg//9nb+0h5EZuN3pyBlDjhlH+wn
 Qkn2QpI+7Sp0ORHFmqIw0DzpauDlFc1Uizj9S+FeoRBHrac0xKqG95MeRMkw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add appropriate mappings of Soundwire ports of WSA8845 speaker
to correctly map the Speaker ports to the WSA macro ports.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index fa6c3b397f2d..c63822f5b127 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -751,6 +751,16 @@ left_spkr: speaker@0,0 {
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l3c_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1 (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2 (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3 (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Speaker Right */
@@ -764,6 +774,16 @@ right_spkr: speaker@0,1 {
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l3c_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4 (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5 (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6 (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 

-- 
2.34.1


