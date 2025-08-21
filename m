Return-Path: <linux-arm-msm+bounces-70178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A463B2FB1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E857AA3F21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4084346A1D;
	Thu, 21 Aug 2025 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="keCbdRti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75786345733
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783459; cv=none; b=JdBGrCEHX3WF+Dzje8BXiIbk934y4aAQXuhEWU51+iHvOFN18F9wC1FUZUbKwIB5Uhx9H7GvyLeWcZirDrawwkk5dwc+hHOMUh9BP+rWL6dwzIK04kIwAyLuBg9S/h3hkoFV2V7w9CByCAjW8D2yqIiRu2MQBlFGInM9IH36ixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783459; c=relaxed/simple;
	bh=33V6vO8dY2xO/0hImlUa4h4K6tSixB5izhQ3YWGUhF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PA4JVQQc6q24avz9JpMJ7zYYW/i7x3F/z/zNbiMsLuHmilCZp1gbCfB51AWHRxlvALvyxZyLgVRcU1gcYI2PY2bJh3z3Vq4jIITQ4LzJYXdGkVomLa5h7ESuQeQd2yRFZWr3lFdI+NY/MXndexYexJf+9WZiY4O+iboXh32EHa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=keCbdRti; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso769914f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783455; x=1756388255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FN3M1ELHzNZvl0HLZKgIMT8AvEW6zwa4QCuopr7VTZI=;
        b=keCbdRtiNSgAgT/Q5bNHzXraBNBzHO0WrjwT4rwgxyx6RHe/9Jr1RRkZKpv7ujR4Nh
         dXgm06WRbOcA50CTlhGezYPK7y63gVTGsJprv09nU6hzQiJiTxXRicYev5UnBlDjf5t8
         GAt6HP3oAGl2kW0Qyni7vLfcUvyg4RDYShMOVMioabZdcKFhANvnL2kHIF77Lyj2U946
         8DrY1C2BYRflsOHMPMXIFxesgeeIO342Opxauip3yjze4dqSyg3Mrt9YR63bU36B9OtE
         VgINz37k8DRcAHVU0yJvKLWhPEGNZeHjDD7cZnNH4Jw3wSnlL9B1yca3j7P8IHQes2bp
         Topw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783455; x=1756388255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FN3M1ELHzNZvl0HLZKgIMT8AvEW6zwa4QCuopr7VTZI=;
        b=TdXJV3U9ZulREBkNqEREmKjYikzUp9N+qg5DUW93nU2QukCrol0BX+xBZNsoUKTm2s
         SfRt69J2ZyToUphLewEFNTic6LL9jGAqE4MsMXG0pZayAp9hIWx39fmLEgT0LuG0cf3C
         8+zmcj+4YtNtW/xW1VIVauGJpwDJbS/r82RcB9xjzeMnkzcJAUK73OnaliqTaLXHYORb
         AoyYJ86Kfh1GLlEIyr7GlChJGmXssuKaCg6l+AWn9aiiiOjP7yse3WAxKmCxdUnv6eTI
         f1FCC8ZVBCTfxxQnmbsfLxW24CAaez8mqZLWRs28mF2dH99W94vAJh6hmjDY7h0KyxBy
         CHKA==
X-Gm-Message-State: AOJu0Yx81m6/vVaeY+MASBM5Fr/bjslO3TLpCvkTml1bU5zC5JyQ0JC9
	SAeYmXppPMy3EXLDaIVBgZXhsUgcDoJQZJOYXYiTgqyuYJw/Ko1FN3eSwTqI5b1VdgF08dZ8Jgn
	7EuEterU=
X-Gm-Gg: ASbGnctJ7qJz46gaRndaGQYxhtF02rO6+eGUqJ3vU613XcYmueJDXJ46taf3o0mqgSr
	T6qKVzH2puJok1/uvibmQkkhjHHia6Yz9OohH1Cw0ti5I1IKBYpCk4bSYV3WlcHvAd0ix047saC
	/LxdAmmnU+BdC8IZBWnU8rX0e9Wqu48wasRt+O+w8BC9YEO8UnukGFDemcUZBBpyD4x//Z7sQzu
	tT1xEGm2cVAn//U/zYx3DwsTBcY6F/vajR3ey+lCPz318bhvHIH7RpbUn+p8BoZkB5R9s8GTz+O
	ATGLs+npiwIOD1j+QvShE358Ez1w91gFfFPrBqHwWIGTTc4mJlgxhitoFJkuu9tLZzIPlX26Wxl
	iLnIB/fJzVSfEoZ3MIS8JiU/ED/zEYGFMJW63CNk7mVo=
X-Google-Smtp-Source: AGHT+IEZQjhC7XeqnXNCleJsATeP//d/zJRQS4uFjvJ/BLGBre/bly9A8aoj28lhG4LujxbvPVWfrw==
X-Received: by 2002:a5d:46cf:0:b0:3c5:406d:aebf with SMTP id ffacd0b85a97d-3c5406daf16mr1220179f8f.63.1755783455527;
        Thu, 21 Aug 2025 06:37:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2ab4asm28937605e9.8.2025.08.21.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:37:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:37:23 +0200
Subject: [PATCH 04/14] arm64: dts: qcom: sm8550-hdk: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-4lanes-v1-4-0b1a0d093cd5@linaro.org>
References: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=734;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=33V6vO8dY2xO/0hImlUa4h4K6tSixB5izhQ3YWGUhF4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyEXr1VEslWyONNVDdpF0ska7gFINWifaa1BfQB8
 OYoFLvWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKchFwAKCRB33NvayMhJ0X9wD/
 4342OclvtVQwK6qp+mEQZjxslzW+BxFOiVncFvE8qpeLBQmZPy3HoTVxBoXud+jcRsR9C6c2Cloh9p
 7cTJ8PMD+ICsp0+sapRJnNJtzRkFlx8vLzrueao26mnTNPnKTsbJtM9zeo+aZRERMoKlevHNPtqAyg
 BFVl59DkokTZ/tEMV1e27NVl+ni2jatJ1b/98XxyDJnU4NgGyKxnnqjdr84+ckjXGfCjVlvGB9VNwn
 t4D4KrMNwIF2/AFpGBC/GJ/R2z9FlZFFH7+tlI3/1f+1Vqoxby+A5TrDrR+mzXp+iyCpGkuAlstILs
 R0CdGEgMvB0oOD9bHySDwkzs8Y02M2rBx6RjcVSssYIanZiOGxBM8nCzdU7vGYFuGAERXWlIR+RQZC
 dVSUPXHkWaLpt3s1MbvAeP578cvUT75B5fVm3aCnl+PnzqW+AhZqhoIR+POSQfRKZe7IoH7/Kxik6K
 RjsQPKx0+4ubC9jjj+2QnQK737Q/exHLB/wn6XATms9XzLaqSvtud/tp9wK+TZjI8G3rxzT2uwZ3Kk
 aKQMqpvlcog7GmpuVqV8sszCf8xgGo1vobfPUOFpLjvOsylMk8SZzVEoIqvp8fY4Lp+nzW0rTycUue
 K7PaBVmYP/b2ojt+cRcFBf8FeRgtNfP1kx4KddgeyGgcdmQzpcNWxSscCbbg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 9dfb248f9ab52b354453cf42c09d93bbee99214f..6c2c9514a7396a8b75ebe24585b47571c74ff568 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1003,7 +1003,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 };
 
 &pcie0 {

-- 
2.34.1


