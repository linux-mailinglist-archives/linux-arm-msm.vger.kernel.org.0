Return-Path: <linux-arm-msm+bounces-19666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308D8C2446
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70D471C20E47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CF216F839;
	Fri, 10 May 2024 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V9zy/C1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30276175570
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342396; cv=none; b=Oybvm+rwppAJuLFgSbK3C7O1YxeUei1Pe5QkFxF76/BLMLv5bjhhvHClhHS52uq2V8aNV+ia0wgd0ICzKhQ8HhwG4KCrI/YlTndF6QI0pKpk9QCOXNKgqsvDoDLKUTB0BhdiCmx/oGJbamzgjC84NbOGnkKW3DNFo7FfOwwoubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342396; c=relaxed/simple;
	bh=hJAnTcSS233J/pq2GGKjdE5Nwm9koJwphvqL++mXdtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3CRjILAJ4PdtXdNrMnTpiBKJB4oQKr0ZGkpNt1n9aA+Jy0IXdJgd46HNcHGHl51jTGCzQyH0a/jeGD9E0Xt1qCqzrBXQq74pGwXhPpLuN4Sc/JW5bcHA6oHzqSMwdVvUD8L5JjbEJXuwIVQBSC7E1YCkMXDtCRymNwvpD08yC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V9zy/C1I; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5a13921661so433596866b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342393; x=1715947193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1cwL1GyWWAwhJFJuq8v2puUXx3BB6mJq5XCosZUEqM=;
        b=V9zy/C1IYcUX9qOH68VoWsGzEsNjvQL6ePfRVP+nxZkIokzaKDcGRc1IbSll9EDba4
         Gk1AtGUd840/cN1klF/ayZcJq+rQQGWuXiqrPKaroSiAyutg47k0NZN6pugfs1Os9NK3
         s1QHWudYXv8iibp7G3E0WVnNaMIIxibAwp5oLQETo1DYyzK1e9JJMaKt0trC0qelifyj
         gWMPJFhoGIjqgRXRXC7CId4NhfXoNs/fquUUev0QwJuDmrRwtoQKEhFGDz9fo86HoAC8
         y5ZW7y1iok0GgEUs9u8VLXFYqy7CDuZcScKMdyV0qj3uWanEevbvrxhlTJyo81XBWIU1
         h9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342393; x=1715947193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1cwL1GyWWAwhJFJuq8v2puUXx3BB6mJq5XCosZUEqM=;
        b=TtQIkH3LZpzvSPRteuLzO6Al8Exa+ysv0ZFs1lwobYcMyCB0fOKFWmS2acRn+NEJMB
         wZJi8iT09Oysf2LOP7xdXUkDjLGVhll8PLJizekFg7zPv+VS/3zfbdtvaSfvCxrL5L5C
         68a03MKut91og96mdeKk5eZQ65Z9FBEkC6Smj6TNJlL5K5SUuAdFU7VEEMNMauymQW2H
         f64UIjbEv2Z8V5Ha27fPcBWalrIjN4DnhHwpDPABZVXyysbSmWJc4fGx6aM4zglNqRGE
         9dyBzuLTV8IK8zuS+8xvBUQmHk9NqNLEAt90LwvWNgwrTB2EGsP9bSJUmhrUcd6PKeL0
         y2uw==
X-Gm-Message-State: AOJu0Yx5j5KIg7Ny5H/y8APZDflKZNQJMA1QfOo2O30a4+186Wg2DqHb
	neVEogGbOQuOUJ+qjVbcto8nsP7Kf1oM3x/ZtivJLlgZyOmLTHVlxqJ/Jgvdb0vlynJzaTKuqyH
	VKFo=
X-Google-Smtp-Source: AGHT+IEAAccpAb7Agm+ODkggJHJYK9cRJa2aPR7diwSj0ZiazeQ/xNJgMicNpeIH/RxpIli8PB83Vg==
X-Received: by 2002:a17:906:b0c:b0:a59:d5f7:a697 with SMTP id a640c23a62f3a-a5a2d54c47fmr152192566b.9.1715342392904;
        Fri, 10 May 2024 04:59:52 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:37 +0200
Subject: [PATCH v2 14/31] arm64: dts: qcom: qcs404-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-14-436ca4218da2@linaro.org>
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
In-Reply-To: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ac451f378056..ba7fe56a75b3 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1600,7 +1600,6 @@ wcss_smp2p_in: slave-kernel {
 	thermal-zones {
 		aoss-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 0>;
 
@@ -1615,7 +1614,6 @@ aoss_alert0: trip-point0 {
 
 		q6-hvx-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 1>;
 
@@ -1630,7 +1628,6 @@ q6_hvx_alert0: trip-point0 {
 
 		lpass-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 2>;
 
@@ -1645,7 +1642,6 @@ lpass_alert0: trip-point0 {
 
 		wlan-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 3>;
 
@@ -1660,7 +1656,6 @@ wlan_alert0: trip-point0 {
 
 		cluster-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 4>;
 
@@ -1694,7 +1689,6 @@ map0 {
 
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 5>;
 
@@ -1728,7 +1722,6 @@ map0 {
 
 		cpu1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 6>;
 
@@ -1762,7 +1755,6 @@ map0 {
 
 		cpu2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 7>;
 
@@ -1796,7 +1788,6 @@ map0 {
 
 		cpu3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 8>;
 
@@ -1830,7 +1821,6 @@ map0 {
 
 		gpu-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 9>;
 

-- 
2.40.1


