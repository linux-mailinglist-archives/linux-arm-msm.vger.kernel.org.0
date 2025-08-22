Return-Path: <linux-arm-msm+bounces-70333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D1DB3140A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A4561D22BEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853C02F4A12;
	Fri, 22 Aug 2025 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OCJkmWcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A20D2F3612
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855575; cv=none; b=XJkPv2URfV1cFeNtN6hFOKZ/D1renDXkF+pgm+mYxgOs6b2M2fUCugU/kxISPRgbFBfxf26vzqBo3HLIQ00NJ7iKJpOFUXJebM+ZT7t1+5eyD/HdLCxC4t0DOk0ZFeu9Js+ENaYZsP1MvG2v7Iz1smzyEFHdcIKV5irmEjg1D+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855575; c=relaxed/simple;
	bh=sucDWngkcc57lEpuqUyMvN5D5nggCib4i3lqmpo2kAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JzrOX/TqmJgXNKCiTn/VvOyd9HtaS6twN3tv3OpY45GI0QoZGpQMbjYPZm9girWodcEDa4HGE9Nyq5LDfRWJBqxEzv5xGtqmG/XH0yDPehEBn2WAtnipnX+jd6jdokmeWoHsxo5v3TQ06QP9EGug4QoueQhrrOC/nhAF7tB8ggY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OCJkmWcp; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso1593377f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855570; x=1756460370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CdhuTg7uI5AhWYYHaCMZroPXcVIf1dIpA0xTfE6eKw=;
        b=OCJkmWcpWNt8xqqaxLonlH7LmAGXgJeBISG+md8EF/T2aZo6/DHtYljd1DVXJwlSaS
         cb/afgfzhxGsn36t5TRqvvKAvxhgbjkICdq3jycTHq5XVm2t0ado8mn5NmpWJwzZ8Zh4
         n2oU/120KzoYOONulTpDa7ONU6ill9sR2s4ZacZQPU1/tjieEVpqOBYm9svciE36H3x/
         zInAmXKt+jzY6qK99XkEfmpnUD3MIGpIU2IxvxR6msEO4vJKfRnPSesFHfx1jSNOdgrm
         O6AFKvhHxf1h6gYTXqUPU8CzQElYhlI1smQJMPTdXAyTz8rtdXz5xtYjGrSVAI1p5JyZ
         ZGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855570; x=1756460370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CdhuTg7uI5AhWYYHaCMZroPXcVIf1dIpA0xTfE6eKw=;
        b=hQrUY1Fl3vXm1aQ2quemzmgrjHbPe5ZQJhyJKvPsQive6eTEPHPLV+L6Ihm+yIEgVp
         AH14m4dGMuGQyYpZnXaup5YRpxFRjbePJahv+JpumC4u9TEQkA2aNBvcFMRkEbqiXRN7
         W/Gxd1IfxLEGpKi2qlODn8TLfp0Wvz01ev7DAVBn19zsMGQYbCfmHJqlHj96achmoRNc
         g5ybwstZkUPr+lqgkE4nWQiy73ufKKBQg2Be32cTJBeL7OBxubAMG1r+/NyMb/O6V+hK
         33KxtKbFkYxetDuUKeCX6g0vR4bw6YlHo7qEgMKdRjWZ0IY/e8rL4tfQ9qVEFuSqt+QM
         K4Aw==
X-Gm-Message-State: AOJu0YxPSZHqmbo+qozsUt4VO8++k2PIovfcoRWW2A6NjwX+0wU/ItMt
	6kgZ9YO7WOKQIgSFOLohp6kT05ksQgt/tEFnhS2a8T28vUapcK1903QJLNjIjH/hkHXRBQ2EfAM
	VADzjg7w=
X-Gm-Gg: ASbGncuztBqIEmdEqzv8qiqjHHlaLMu1DW84WFuC7RSu6wvjFH439490feDG4v70693
	aIJp4zqvu95TUNuDP5hKsaC5XkH+hknxP2g4yc9qZBJfQ4sXXMZQ1FXXFwvNGH3rjY9sjNBj17L
	JL85xJ997v57vLEGjDa8RHzX5VbcJDzNPzBGBexpQN5tHSk+NAg5yWq5o+bTtAcNq6MqsAcYWqO
	ZuMpIYIRXQjUMk/eyvamDSmhH+VSKV9PbG2BY3wfopRSG1JGZmdbYLQBvTrqROCsbugCymYle0j
	T1tjDZ/AgyKOXg0OYAwj7xOtZwq0iDQyFK/4TUPWspX7ilHWZzGmAyoSCloHxENijV6x8JJc7Ny
	QTYinuCDnnD0h5lWxiFBR4j9LdfnFCiQfa6cUjjQafTw=
X-Google-Smtp-Source: AGHT+IHJ2VaBIzdyibne8vxxSkxVrugdClFsD/VrfwDeBGxeuV5iToOjgPr1P4JAkzlzCNYIwQygzA==
X-Received: by 2002:a05:6000:4013:b0:3b8:ffd2:22ca with SMTP id ffacd0b85a97d-3c5dc540642mr1647058f8f.40.1755855569686;
        Fri, 22 Aug 2025 02:39:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:24 +0200
Subject: [PATCH v2 12/16] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-12-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sucDWngkcc57lEpuqUyMvN5D5nggCib4i3lqmpo2kAM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrG+LVpddQuq2YhHvZzDua+lPbbR8J/KlSnmNdp
 f8WAwXmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6xgAKCRB33NvayMhJ0XxiD/
 9OT8KqBJwiJswl8/KojhEJI+iUqv9U5AXZam0Op9nryRSrD+So4nduIolU9yWkd55RcpdRbbwcPYL7
 /dVkL/4D4b8gzWha1RZ1vAUX96OgRgnw9zJ+dntWpRmlNJ9PryrxglpRbWVJpL2q+CL+Y2TcqqrOH5
 qYccihWrQf2kYeMRrmVGiEhbGA6suED1r5KbZVeaLjplQq626RYNvasK2hcVGIPdgoGc5isbZP7y82
 qnSi2CbyoNKPJRKbX1q1/xhavwRdiqOt2g1g75B1ozFgBkolwYdnTSMP8OqpARu2EKwxpsXprFXdW9
 DV3lqz8XbwvY5j0oGMS4Nc/YU/1lwnEjvoxrd8O2zYV4fwQZFkGXi2bE7j5gFd5WSaf+/6JYL3VXsK
 RxdB/iZd3su3nH5Ono0oXuUNdpfSl4HzNVZDKxP1/Dj89QXpQ9afvaTDy6dVqyeEbL7dt6IVbDY8Pc
 7Ao/yw1WEPJsMEWq6xX4bNzz6Se9pfiBGlz3hyofp/LebUoHQVDSh1SkCXpBRclwttlAia0fw8Fk9y
 RAfXCHtY6iDe+m2kswg4s4VJyP04lPLNtl5TGg3FlGvQsxEj4pzchQz1HNrXRdwKzOPBVMHCdlL7/x
 M43ZqohfHe4ecgzvIry85jEcLAHDZSacP1kCjiu1EkM+Na5CAeHsbjtl2Cpg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 71becfc5e6f649299b05b0b93cf74b81dea9fa57..4374692d6da9030462a577279263dceeacb3ce7a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1061,7 +1061,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -1070,7 +1070,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -1079,7 +1079,7 @@ &mdss_dp2 {
 };
 
 &mdss_dp2_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1


