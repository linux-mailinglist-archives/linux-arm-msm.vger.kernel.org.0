Return-Path: <linux-arm-msm+bounces-75602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 748ABBAD32C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 16:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A04A7A01DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 14:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187BA3081A1;
	Tue, 30 Sep 2025 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="phDXBWH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1158306B10
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 14:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242763; cv=none; b=CsnNLoSPih+7s5AsA6jm/l/bqjjrr93y9bKpO+XKERtNnIdFbe/bSAanMJjA0sGzSoiFHXjoVQrwgHh+3efJK8lZMrmNJeoDtrWgaUK9kcgZEg5SeKYJwoqTjfR7k6SnlIJFtl61OUxWXShjfZuuaybn+a67zgol3hcRI4PsG4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242763; c=relaxed/simple;
	bh=feC/R68VglV9TZu4Nvs7G0duXY4qW44dqlbaCoFX760=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqYYJKkz/1LtmQLqUQ6H6HP/gG1q1PlQkPXsvEvkxSW0yYS1fJBcM4P/L6/dF6y/jAcXy5v6lf3sY0kx42rahXXQopMAFGPEOji3PNtsMIoHxgSq6PohMlc3dxXpZughyKZZHV8SbWAz01dklFI4BadTtaE2hiPxeJ/v8SgZWAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=phDXBWH7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3e44f22f15so410231666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242759; x=1759847559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1loSnqQxcluwc+xgRCVoTNWJKsc4VIrA6pvLqnr/gM=;
        b=phDXBWH7bR1dE9u7Mn9oozefEu2SZKtu0Oh2kNgnS0llSf8qNgB+Vsj/GREkP8iRZR
         QPgLnfYKNmMHc3aaLfCTObMtuDZfRkJqO22A/pmJ5A4vcIKZy78rwwa8NmKdvrZyB+h8
         ejpQB7CCT2tOxx/Hpj5Hgk8JBzfgM1lQaQtkQyn2pvOaqaFo7wiP/dAjs0AKudx7R/TE
         M+tlTWSr377Sfy+SacFXbuTYh8HfdsBPZVNGTqMw3PTW+AJ1lTFcZwBbjN/TqP5EXKIA
         zQHKkEs8rDGz75C4lAJp/M9D0G1u2Xkxyoz57QZJKGY2AXKbLyohP6hmCatCH3EY5zVA
         r/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242759; x=1759847559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1loSnqQxcluwc+xgRCVoTNWJKsc4VIrA6pvLqnr/gM=;
        b=cvPUvLz3WR9FfRAtez6MxDRWr1kCC7sQJmwN2CL86NvvpxT17Ziahfbw+aVHPWk5hw
         jmWIr4JCifOqtZpSJ04RWiMd3FZZYovV8D3ZKehnvpgLzVc/ZhcPTTzMO1MqLwzCd1b/
         aBTksIvSxgtR0NR7hV27z0IQeujdeqauQK8FYCPIw9oq1E4sh2ZMV97IawRZqEp8f6GL
         1Axw5Akkn0HzqZ6+iDOtfjy37Z+lJWqNIH0X2A/wgKDMBNXfQ6zQsySvtdIyRbp+ITgT
         a5fWyOEZ6YoSOsdZVAxzOIPYqxPmnOzgj9Lp1UY3LKsmaXA7J9Qz84+VgdT8p7lHtHTz
         SxMg==
X-Forwarded-Encrypted: i=1; AJvYcCXvRvDID/G+7UXAXvRU2WCRjKFlc/597dIcaRmxeySO6GU/x5/8xKUbK5dt2PvLwFjQ+DT+oLzBNWPa07NO@vger.kernel.org
X-Gm-Message-State: AOJu0YxZGUtpp1zRJGU6ZPta1tKmqNisVT38v9vZNGXyd8+tKfcwcAX6
	HONmZ9yufe9uqa0Vs0EFU7QNHGoiMzai4kkwnC1SCHH+8aqYpx85202vNCTLxTW/Wco=
X-Gm-Gg: ASbGnctBolgQxMZeIS0Tf5ZlTCSm7Ig9wvRrdcZPS/YFjJdY9UGxUiRCMIBPRCyXYbZ
	lNmdtnpA7oYEOPmzucaXOF7hh1DKivo/8krOFGS9wrfNeiQ5zQx0/StZc038u/puooApz8yP3JB
	ZjlUGT9jHf9bIQ1+AcMr28yvt2H2VElsfZc4LlKngBVw8JvuBQoycDHs85TxsglzdccD8r5gjSg
	BcF9rK1yOZcPtnm3THASs3JqaAV7JL/kWO6GxfHrhZ5y89q+BcDWS/O19nGeONddKQrzp+3+Me5
	p1fasOQPRXFy0JG0p4YlTne3xLebq8rPYzkGwEDQhYg9yfzaLRLDJT1ZsJ2KKD1COyr0urc2kcB
	5L3b+Nu8mDxYIRjv22rCKGKLMUbteCaRNwLapxqOydZOcQ5wQYSrXbeRXF+08+6SDOpUA5dB6BU
	yhSO1Pj0AZJSJKUE64og==
X-Google-Smtp-Source: AGHT+IEOuIPYt67EBrcFp1mbmXrPmXz8HmqA/6GOaYFUuT7MdE59lwUX8pXH8JAbJY4iOrx/f02phQ==
X-Received: by 2002:a17:907:d8f:b0:b3d:30d8:b885 with SMTP id a640c23a62f3a-b3d30e807e5mr988200366b.9.1759242759200;
        Tue, 30 Sep 2025 07:32:39 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:38 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 16:32:24 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: qcm6490-shift-otter: Enable venus
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-otter-further-bringup-v1-6-7fe66f653900@fairphone.com>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
In-Reply-To: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=887;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LSZDqnF8eZZ0YN5ymjZn52HAvKq4JeCAtEqFnPO+yIU=;
 b=T9HjfdM/hf8lvFA8aaNIljFgr/OXK6z7IUWukKa106HmG0hVjrhebnd+Ohi8ezrUz1r/FYTuI
 02o6AxFWchfCQrsUuOLtCvOelyJsPm8O8t8rIfMmzJmEsjLUaEss3t0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

Enable the venus node so that the video encoder/decoder will start
working.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index b4c69dc50ed0f0b3cb45341a01c89210bd261993..98c1ad4c21118831f079c83f4fe66ea30c141fac 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -995,6 +995,12 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&venus {
+	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
+
+	status = "okay";
+};
+
 &wifi {
 	qcom,calibration-variant = "SHIFTphone_8";
 

-- 
2.51.0


