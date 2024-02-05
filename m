Return-Path: <linux-arm-msm+bounces-9781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94E8496FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 10:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF718288854
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 09:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80211134AC;
	Mon,  5 Feb 2024 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EED3qQBk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B840D12B99
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707126707; cv=none; b=H1QjHHCi+ISII/zf9cn5m2DgvRDKRwdkUNszjzaeacXEaLbkx+DdaEio5zB/bX1kvdYlMVu75HFtxsm9ZPbqcB+f207z0+6M46yg6OJM2Vaw35kp26rGm007nNmRTsatnNh1NAHEvfp65ZcMAa3SAn0oGl7w64zPeWMX9aLTiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707126707; c=relaxed/simple;
	bh=9bGVx9AV/PBRbHF4o3RcG6Ql1qXpfJutE075Jdi21Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptr9+tekCxA7nxlN6eREdrQ9eb8Ull8N9EEHG/PXE0N5VqCB6j58ygYbuAyu9lUckQYvZULmRQBvKTmHzNOPCenm0SUpF2JvB1Vf0DH22NHPyA38vwgj5bMZpdFhhF8GmWdPuBxWgYIquoCBVRGtyceJgsAx6dkw0ZI0qkdpllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EED3qQBk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33b29b5eab5so1209698f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 01:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1707126704; x=1707731504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHaHZotC246BZzqrce6ngZLliQyoyTygfMXxTOkSCN4=;
        b=EED3qQBkFDhjaHlZjm2D8ZJXfBRWMBpBUqdsxX6CV5ZjiS9lYZxhIo8vKxNR9E8fC7
         kNBcpUIFBPOtWD2oQpXb5vslUNFlNYbGVxuOJ7wIC7bsBqjWvOGyz5KZhRWjoVuV1jHL
         Ku+BNXDmmSJGTM6ygD4v2JNen0Npts04anQCptktkyn0i0n5uYIerfXruo1mSFFkv8hM
         rpwIVhoAccTQaxTaat+YWYIwDF61dh4AjukNzfpM9lDm+oMD975eocFsZiyhj4CxAG4V
         Ri9dxG+HfOAiWOP6w0mVnVnyMvv7xGSaM73cgQ8/44fWp/HzMZyap6NeYXzajdNUV6sY
         42Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707126704; x=1707731504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHaHZotC246BZzqrce6ngZLliQyoyTygfMXxTOkSCN4=;
        b=Y1tGPzfgkrLJKyTjx4+k3I95SwyFOt802Y3zoHpz+HTvOuVr4dpHzpsmaQH8vGgDC5
         GsfDzTydQoOYsfRBcNxm7KZYiQ5K8UGWYzNvhZYl0eIO44naNeceAd8L1aGOG7Ht9OGP
         vFFTsjayv+d9stuH0jqqV8TSnVNVmnr96mExuea9pSkA6g1SUfCoNCW5Sd9Exj1iO2Xw
         gRBGwTfUNpSOOy4hn6IlX88zLKC6YbseG/OUp7OgIRtEkCXNCEMvl2i4u1HuqMM037su
         1/q5WZdM5EBaLMS+Z2AoYGAwRzuLL+KWG5IzhmWlWdUyzf4dD+Uyxeu9iIX4twFgRRsj
         zWYA==
X-Gm-Message-State: AOJu0Yz2vrVarS6gU+iOAFo9KvGx2jOJoKGA9iYBYXUgdmW2pkMw8xH3
	4jicuyPTd+QJB/eVKSTOobPal66UpsJB42t2NABWr1hR19Xoa+4ZQJkidaMo125vg7ilKI9hJm3
	3bhQ=
X-Google-Smtp-Source: AGHT+IFpI9sY4oNvXm/hdgb7/0YwVV+MxYnIVZtcbqsvQB5pF8WoUoY/Brppzfu2fxPpfKuSpgl+5Q==
X-Received: by 2002:adf:db47:0:b0:33b:216d:70bc with SMTP id f7-20020adfdb47000000b0033b216d70bcmr5276935wrj.42.1707126704029;
        Mon, 05 Feb 2024 01:51:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVaac0Yl5gzH95FpnSRi+ll8mWpP8bKka43VgBuw3wvCBJzVlRN9fABjAwClnEvSy1kia1G3FnFbuvR4IrCMXCyukl4q/JobVe3RsQhmZHErU1JVspINy4F9DpPuYdjdpmymzC3hvG3Ontwa+nmPpYkKd/KtMsvV9gnjVQZ9mHh6zVTQ2WkDWbIY2B9NQrgIIarj5XMnDD9JsAF5PSkd0k7IDEsPv9t9nQCYcDFr4TpnoMyjf7w0Nb6eqqwEZBruRiYzZBiVZ+XBSFiLsvA+CaWaB5/DzYrTyGvSnEfyaYKCSFdU7oJNEhMa7hVr3QB7bdH7cvk1syvqGHtdCWidMddBC1qnQYyMsHXGrqWilY1bfxVYQv6EQhwQuWTYkDcdRHqDBgJVmItRztKlTClUKALsv2Jz+zu7mbU9ir/21hOnTkIgbQyvuCnNsS8ru3ls+akLwiJNTNa3Ct7ofkhq3uGQ6eDTQ0iQutUwPeuj3srXbtS0EulMjWW8MtZRbnWMGd4qAum7EtjXxeT34VeCOCMiUW+
Received: from otso.luca.vpn.lucaweiss.eu ([2a02:a03f:6aef:6800:2f37:ce90:b91c:e85a])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d400c000000b0033b3c2e73e2sm2278283wrp.113.2024.02.05.01.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:51:43 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 05 Feb 2024 10:51:39 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: pmi632: Add PBS client and use in
 LPG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-pmi632-ppg-v1-2-e236c95a2099@fairphone.com>
References: <20240205-pmi632-ppg-v1-0-e236c95a2099@fairphone.com>
In-Reply-To: <20240205-pmi632-ppg-v1-0-e236c95a2099@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

With SDAM + PBS the LPG driver can configure the LED pattern in
hardware.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index 4eb79e0ce40a..d2bb49a619d7 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -127,6 +127,11 @@ pmi632_adc_tm: adc-tm@3500 {
 			status = "disabled";
 		};
 
+		pmi632_pbs_client3: pbs@7400 {
+			compatible = "qcom,pmi632-pbs", "qcom,pbs";
+			reg = <0x7400>;
+		};
+
 		pmi632_sdam_7: nvram@b600 {
 			compatible = "qcom,spmi-sdam";
 			reg = <0xb600>;
@@ -155,6 +160,10 @@ pmic@3 {
 		pmi632_lpg: pwm {
 			compatible = "qcom,pmi632-lpg";
 
+			nvmem = <&pmi632_sdam_7>;
+			nvmem-names = "lpg_chan_sdam";
+			qcom,pbs = <&pmi632_pbs_client3>;
+
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#pwm-cells = <2>;

-- 
2.43.0


