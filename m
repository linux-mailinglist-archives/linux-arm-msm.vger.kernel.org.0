Return-Path: <linux-arm-msm+bounces-9060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F28798429A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 17:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE705288D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 16:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CE312C553;
	Tue, 30 Jan 2024 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwIoWSVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E2C1292DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632727; cv=none; b=kyEhUHCP9jdyGB99zem36CzysqjxCUm2lK1K4fYJE46vlchUZEpnLjKS8iikci9EBlzsJ3oZd7xgDF3I1LnnPMTJR/dNM7GgbQVZ2lCJJbGKW4Ozf5SZjbi34R2bF7eK9AA6qdVL19ddM5sMX+uZKmH6Hk4xUPkVg+ZERtPiNoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632727; c=relaxed/simple;
	bh=f6I51MDLQiOqeJhfgmaztAzDHCND04cZOAhmoNK2kAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmlhNpo3TtrS08BgvBhqg8+QpD6At+wTy/JUSNVn/SBMP4W+X0gOyF/JwEj7+1unjfOLJe/uhJzonD5daVqc4IOJjoEs8Xki3JjS2oL2qdwDq/HhRxMCeyKplQpfZRnj6y2BvmD932WgCBRz7XUZKr2L4ofCH6BDztjwWJtSh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xwIoWSVR; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d057b6ddfdso12968671fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706632723; x=1707237523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sf6cX1kNwC+ZyH+vJIqU22NKTlhKvVMieai2ykB+P1c=;
        b=xwIoWSVR1PHDjeUd0RVbshXGFjxJkeCNfU48Lxdn7sHw8S3bRNGHsT6qS7jqc80ToS
         uf8fzUs/4xXsz8dh7QiJQT4txjXvWDMUUJW6lcbM1Adhx7MTwUCPKKgm8Fx4P3VUaFsD
         zVgpnTcblO5m0/jabo6ol/tdx+6fhVRr3peI7lxYdD2J7ccmwv5URCcUOhy/NVamefZN
         D3A+ODeXGaNeh+E9qAXW3PPVEaF6460AmC6Lk0d9tYVv0Ef00r+aEqmaEuiIhGT1WZ5F
         v+SzGUNBwba82aYbuCx1Jst46xVSDLNfOh/sIBrf9kaExVWIF6puZImgU5IAHwnTjI6d
         ElBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706632723; x=1707237523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf6cX1kNwC+ZyH+vJIqU22NKTlhKvVMieai2ykB+P1c=;
        b=mIyp/iGSeNmmancVD0rgtHbxgVAmF4XVfgW30TB9IhqabLhYsb/syLfbf+sPWqEsQY
         oCb3kG6Dql0XNa0aHT1eq+IWVZZWAINPqEe9x5/HOEd9B3DWWDUr2ZcLYMH5KqtOcqfM
         +Rm3AVJt4Ok0CBniTGeNfyjivLnFqRCDWH2D9p8ASNWVTmmX5ABRIbi7AsT6WOgHMU7R
         EkFeHEibLB4tJkONI/N/rod6fGeL21uk5L1FS4IrMD6B/2sItjucyL6icy6ok4KqDV59
         Dz1QIj/fEXmBNVZdiDU0pHfGp+3UHY0nQCj5jPDpa2CNVtngoZEWb7ilvXTSBlF/3KFz
         dSYw==
X-Gm-Message-State: AOJu0Yy6eoGMVbr94E+WdR0cVkJA1hk0KWKUyc636KDpUw0JqjScArLq
	/0Slrn/TLrUZNf9ylJXlYdpKnKnVG7gLg/t6jz8DRKWfRuoW91os01TFq8+3MJk=
X-Google-Smtp-Source: AGHT+IGL7MOYOgKKeouag0S4EDPx+mRu3y6AV3aycea0KqrniBsk79ojRA8e357wUj+RsWbwyzeeWg==
X-Received: by 2002:a2e:8e73:0:b0:2cd:9503:f91 with SMTP id t19-20020a2e8e73000000b002cd95030f91mr5481005ljk.15.1706632722898;
        Tue, 30 Jan 2024 08:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUNhW/hrthqpie8kW0dbHKqPY6B82R4tTMoLB2y1WsE5JPMqK3mmTWPxOOP9355w9KJ/I0gGpYEjmmo00xhswTF9vt+uxB/nI1ZP3aqTDeD/fxkpqBuSRnUh4OqvUkMX7paQSkoR32TcHZDi5U4aRdeBEyIg6z1EI2WXVldCMtvR69Md9t8o4knnfZV0nFy2zWjzW7NdIEw7nOGDj5RFXG6M+ujn34sjJiAwxlCO61ufAaabkJ3d6MKCH6wJBRD0N1EB3C76uzoglzeU4+cf8GirwjD7mlNHGp8o52jL7oFjJ/so7mvPKdvfvRZMg5GUco9He/E5cidXxnuufth8PySPzcrYGCAYYT9N+3mGaxNJKDywBxzIJqZXVmrzlake2VW6QF72TNLnDtLXf3i5QQnPTayz0fsdED2QvNe59zaB1JygvE1gR1rok16ynxApeokd6RtBFa14JyM/4tzBxtBJ3trtsUGvw02WHnDGDHz6ysAOzRPVpn5TWPEtZ2/J1NM5Xx7DpE=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y8-20020a2e9788000000b002d05e8bd84fsm219639lji.31.2024.01.30.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:38:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 18:38:40 +0200
Subject: [PATCH RFC 4/4] arm64: dts: qcom: qrb4210-rb1: add firmware-name
 qualifier to WiFi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-firmware-path-v1-4-826b93202964@linaro.org>
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
In-Reply-To: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=f6I51MDLQiOqeJhfgmaztAzDHCND04cZOAhmoNK2kAw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+pONf7+oBu7cj5b/Px+y3syj15dV21DWHCZgmzclrfb7
 Finhrl3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAifIvY/0cEubKXi9/gm8od
 sbbh3FFrGea938T3d+1ivO7RyMwh8bPo589T/4PXan+/n8vCa5zdprtqp9d2r/iK2s0NrhkCs7x
 +3/kn4cMit86+8ZCEx3GFwDMTGUw78tzP5zHWOBtt6hOMSLl0Ji2jVN5N7FfbNNvnH1mvBNzu/M
 rFqfZ5Hv/jjexzJdSdus86LSwO6NolO/vlhltBc4xFLzF27JfiyNnJf9x8ifmD7Pi+U/mZZx6nx
 QUGfgjI+/aMa/+N6OuSHwNa2dReN8o6z3dI3CzrWNPBIH1hxcNr096s8uxYaFLxmOtsau6aZT9v
 XGA7YPOnxVvhn5Jnx3xdy0jOm/uvmIWWdxz1VQm5y2AKAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add firmware-name property to the WiFi device tree node to specify
board-specific lookup directory.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 7c19f874fa71..cf1d8d6f1546 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -632,6 +632,7 @@ &wifi {
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l23a_3p3>;
 	qcom,ath10k-calibration-variant = "Thundercomm_RB2";
+	firmware-name = "qrb4210";
 
 	status = "okay";
 };

-- 
2.39.2


