Return-Path: <linux-arm-msm+bounces-53550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17666A80EF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 16:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72A534E27E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 14:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975182153D1;
	Tue,  8 Apr 2025 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="n8OrfJSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8344E1F582C
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 14:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123988; cv=none; b=NhGkP+idcHBqx680cb3/Aok27G6rkUeN56RxjhNqwzChf/WaUu+ljB101WsTiwaKK9RNe36uJ3FbvKm6oT6p6lXL8VJ9oxg0+hIo/DaznRbQSfi3hAbtvwgW1ka2Sf5d/t8pe3RvJ6TAbiK8NegtIAPEyuYr80jczSnMWfF5+Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123988; c=relaxed/simple;
	bh=XudfhlyxDLPOOX1wFwR7UqPkqsd0ooX/kIqejaHNx6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvYdhf2IMKmL2nok/+sSUlBm/Gr8HL4EhO2je7cGOjwFl7acXwcGnN2RgZUJloSu6vh/19yB476g9HNnaz1A8CEG7BCNRXMzm9AwRtQoKvf4fKTb6twHweAyyYiaGTj9yLspExylk3XwZZzsFrOij/CAI9VpCqbCkgVI0Hjto3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=n8OrfJSB; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 19B033FB6A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744123978;
	bh=Cd2ekFBWQxwJj+PkZGNMgt7dWUs7CI9H/DRk609O5jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=n8OrfJSBzxUf2SLYt6TSQVqls0+xP5Y8zkbyAooEj1ttNSI8prB7tUO3Vi+ljGGVu
	 zuMrio7eAFTxil9/avoYsnArjwSzfRH3rflZHKg9Dv1wBAN0YwweYLn2Qf393g+12Z
	 /NGNFf+nZc8KXANf0SYQ8otnJFWr+fsJQHLDjxZGAHgzemSGdwq7SKWJ4txYUHCH17
	 dmoAlVt73PuJGDTHGe1E7bYp5WirlC8m+X/9MZzgijl97w+45NjPqiBsWPr9LpbHsk
	 tpFHotHAOhh5tmc4NeoJCA9EaDYh8oGVv6UhV+RRL5asr76rx3lXZOri/F/4tK1GSr
	 45sHAY/kUx7Ww==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e6caac1488so6107719a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 07:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123975; x=1744728775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cd2ekFBWQxwJj+PkZGNMgt7dWUs7CI9H/DRk609O5jc=;
        b=rI1Gy9IIAiN78ZpUAGGOeCGRk2b9KJx2nhrLKSfBm/f0GNEHaGo2E3bSQP3XoA0dB9
         BPShIDTamP7B3dFgnwuTVlljLZniVeRFsHuvAB8aAei2tt6d3QMwKaeIvdhu8Cx5yUZ+
         3BRoYeTdPnqgcN8AzT8nZYWXU0ZOAPcR20cHu8kvPoX+tjqAswf+fdBNNkSawhdnHTG4
         2GuvIVdGb60Yoe68gZU0ctOq7qVMaopamb06x32b/CFR96UCatFS4VrM+rniiEUbMOCb
         mtRHtiu4+hIRYQtwfovTfLzwO1v1iF+gBqXbCEqtoT1uu3dgZ9zdtI2k1yvvKj6oXk0x
         hQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAG3JmIW6XWhVR6Xe3ecn0+74IyN3PSq1O6o82l7tUEtWQKCVYxqI/rthoGLxZMZbHa5dP/mqkjeGT78sp@vger.kernel.org
X-Gm-Message-State: AOJu0YzL4+ceSwTOUUuMdiNyB2BNV/4I/89JjoxbKjdBZAHjNUn9FApD
	Ovj5tCVJBmM4wQVDx0/B/2bz0oH928dpngb/Zs1+wzwejSNFXxChKDPCVXG+5tXuftCn2B93qGa
	Fp0aanOKw++NeSuDns3otzXfcKBF2HICv7JkHLwxGT7FV2sOxK9CNi6Rr8h8W/R6PdkM+jWmIr8
	wtI5LC9tdEcCg=
X-Gm-Gg: ASbGncunYj8VsZ4qGda6ODSV9jsgVLhUMe6enCSN9oIwpRmWsUWs5gsNwXNo3XK1mK5
	dffPyyUo2KURc71G8PJp9esYQ0kXi2V4gxQNkj769S3Ih3q6CO3Py/rh5lLjgTTtN/OcAht7aU5
	IuwjHF4LCA2CpiFb9ZN6AjzZXkvIvxWyc+SjSOL5IXpF81BpaAtj9EsonaY73Vbv+MQnlZRuPok
	Zfnj9uwIrqjuEALZbYw5Im4GLozG6fhqsrtt6dWPUlsC5SCh/arME9kC6/0UXfBbTIGfusQtfub
	i5BhvOTy7dnlwtugmBZRNX5nvthnCf+s1w/zd/Y9zrhhE2vMxU0DHCDKwplE
X-Received: by 2002:a05:6402:518b:b0:5e7:87cd:2479 with SMTP id 4fb4d7f45d1cf-5f1e4188c3fmr3261266a12.8.1744123975710;
        Tue, 08 Apr 2025 07:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJSPbTa1xrNkR3RkKbcBh/Wslpw7BLBT5lNd28/P/EXGJtdBLm56SHFhruqKigf0mxABLrkA==
X-Received: by 2002:a05:6402:518b:b0:5e7:87cd:2479 with SMTP id 4fb4d7f45d1cf-5f1e4188c3fmr3261241a12.8.1744123975334;
        Tue, 08 Apr 2025 07:52:55 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087eedf61sm8050455a12.32.2025.04.08.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:52:55 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v2 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label and pull out the model
Date: Tue,  8 Apr 2025 16:52:49 +0200
Message-ID: <20250408145252.581060-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408145252.581060-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
 <20250408145252.581060-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a label to the sound node and pull out the model name to make it
explicit and easier to override it from other nodes.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 03bbebff4576..06a53b3e8cb9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -166,9 +166,8 @@ linux,cma {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,x1e80100-sndcard";
-		model = "X1E80100-HP-OMNIBOOK-X14";
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA WSA_SPK2 OUT",
 				"IN1_HPHL", "HPHL_OUT",
@@ -1555,3 +1554,7 @@ &usb_mp_qmpphy0 {
 
 	status = "okay";
 };
+
+&sound {
+	model = "X1E80100-HP-OMNIBOOK-X14";
+};
-- 
2.43.0


