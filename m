Return-Path: <linux-arm-msm+bounces-24446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A447B91A5E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE9028AFC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D2215920E;
	Thu, 27 Jun 2024 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqRg8g0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E105155757
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719489369; cv=none; b=WxkXYrGm720lOGAhsvl3T5HqPtwyAJCwXvM5JEqIbNMEsg+wNKhu73YkVM3UdiyKoP5FrrpuRmvFgh9TRYbpwUNACyBk67eKnmeCDGtJAI2fP5E+0eAi/Vyvy3JD/P7GUbbK9TOv17Vx9mSOI5OH+lRPTwHkN5Q/L3cQ+C0p8dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719489369; c=relaxed/simple;
	bh=fhOsLuyqrBwQUqU3KeH1GRGhl2FQpbGrlcG9u9+rBVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgXdLx+OYGqNKhzSarHHURoeVWfloAQajfVBhVnwOiiyJ0/WSWx2SL8F+d7pS82WB3wt4HS27ks8eWEqceto2Oq6eSe6BRTdOI2nWZEhPhwy3LqAZABJEkiKUqZQkFJ2kAVfdvFVtymXcp53DFAXt8bmrtnaXdp9RBWX+iDj+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqRg8g0P; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e764bb3fbso141218e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489366; x=1720094166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piU6dixVwevEMvMKFVjdM2+dDBv8tkHRGk2Ym1RU0bw=;
        b=DqRg8g0PZjbzU30J8J4pKuH5e8zectryeA2Veej7sfuTtcqtQ+zaLeAwaVq5IukZz2
         7wC2yFD+HhYk2A/1y38DPmrLbPaVo9fH53/SE/a7cTLvobYtn7nG4ce+QfSdJBKaSRtn
         QtiWnQ5k+6H9SCYjKEGCt3LW7HvirEhmi0A4ZVRp0WcnqYF55ngBwUdmYCpdsL1QhyXB
         iKryQ9PKtUhRdblnvFVfP4Eq6Iqn7vnLgwNL5B0XIU9059kfDzjIU7NVlOuaCFYbH3xc
         kyWjrQ8CAQbkt8aymv3IfWRuph0xlurbKxQesEuvulVS9exdQpuPGkR3XjlLIz9kqkNo
         VZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489366; x=1720094166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piU6dixVwevEMvMKFVjdM2+dDBv8tkHRGk2Ym1RU0bw=;
        b=TggS+xVyCrNwJ0OZwJMiEVj5283zxmqx+85iSt8h23cOVP0H7ZB26Iao/PZhpsoBlb
         aY/R/UJUzpJT/hCnW9SwLgIp5fd/dJDkeduz2xh7bfw/Fs0x8GrqGUAt98fztKwz2emZ
         MZX/ru0nzQsoKYJVdpln1Es73xwqUVumdlqkce4qLX5SG79Ra3Hm+15+yaKoCgcgce58
         zp2bCIq0l3ggc2gsTormb8ly7CLSSl0+dmrzDJVI2sPuV7HW/OF47zJBZ1WBhj93G0DT
         CRU1Mu5qlVFUbOZc5a4VAh4MXRGFo0nQS38+Rx5CPWeJeFquTTcUaMbNpFyyeIL9C70v
         iJUg==
X-Gm-Message-State: AOJu0Yy9bBUyCeKnUWIQOUs8nqHQs+8DRFoUq5AOXPY86suaGvSVRN+r
	ezXzQ8jQDkP6lEVTCh/ukfqY4/Yhu6cBr+PX6+xEb2ML4GJA4gvyPbcpD8yn8pY=
X-Google-Smtp-Source: AGHT+IHrpS4FaO+MLa+HNiW45CgkKJteDWyaEAeg1DQpUOW+P5vfLDvcO4u786fvHvXTXhgmUZujUg==
X-Received: by 2002:a05:6512:3091:b0:52c:e54e:f84b with SMTP id 2adb3069b0e04-52ce54ef9fdmr8943991e87.14.1719489366398;
        Thu, 27 Jun 2024 04:56:06 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:56:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 12:55:22 +0100
Subject: [PATCH 6/6] arm64: dts: x1e80100-qcp: fix wsa soundwire port
 mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v1-6-bd8987d2b332@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
In-Reply-To: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=fhOsLuyqrBwQUqU3KeH1GRGhl2FQpbGrlcG9u9+rBVA=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNN8VJANE2p5q7a9tQElvD/J+6BThXZJo1SY
 JISlTpiwtmJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N9nEB/wLOagPz2MWymeyiPZmgmKPaDEpckmNiW48ztjNspLG+XaXC/0zZDNJaNW4yBaoDFolpp6
 fU/t9kex0J1DPRyOltkiJ2CIkbyAyNCYOICpax+aogY+C4eFTrNB9YNNRolqlLY3qJ/P4qpgvSJ
 hyyjJxY/Aqj1TB3p3CWzLzMAmlUY10GMZ87Juje7Rn4TisWat05KCZCrQgY67mQWuraYApVY3Pe
 0qwNcqae067Cc1MKITj6GWJC5OFyjvumStp7sn4Syr6kyYu6MrDSlAaXC+HZd/lmTYj3Z3BWlzZ
 SqI6SNQ/hJC3sveXQrErHVC3Br9w9UBRZM7Bk/qGm1BiD3U1
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Existing way of allocating ports dynamically is linear starting from 1 to
MAX_PORTS. This will not work for x1e80100 as the master ports are
are not mapped in the same order.

Without this fix only one speaker in a pair of speakers will function.

After this fix along with WSA codec changes both the speakers starts
working.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 4edec3212dde..79563ae34890 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -749,6 +749,7 @@ left_spkr: speaker@0,0 {
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Right Speaker */
@@ -760,6 +761,7 @@ right_spkr: speaker@0,1 {
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 

-- 
2.25.1


