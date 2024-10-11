Return-Path: <linux-arm-msm+bounces-34178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14A99AF45
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 01:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51FA02838E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 23:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3AF1E7643;
	Fri, 11 Oct 2024 23:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="cYm8Lpge"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016EF1E202D
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 23:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728688827; cv=none; b=W/cAXggNLT+6fsFosodTIZDo25oGjnqOdcdZRT3+bRaEfgh3WOUsU27OJ8xzONGiIrIqXohQI2EP4kvtzYXpC4ZL+KsvSewU4RvglFjA+lFcxIBbX+KIPfIZdiGqFgJ4BylaMd0sYkEarGNF5wwyZU39JnJex12ao44eHTl1de0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728688827; c=relaxed/simple;
	bh=seom4uCMX8ojzm6Z3txLhCRgIagC4wOlyNgA6lYM/NI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyHlof4na9n5IvWMl9MOR8VjZpxaR6+pZSAtaw5A/0BYbefkjJoQaNhY45UtSpxKY86SP3tevKm51t3fPdZaB1HGRaKmeJagGaH+gV7oqdjIbNGXFCWkmMbP0gO/yWJmdFLDar4VE8QdmbD7Jz3ym5/n9IT4N7fOLlnbYI8LTD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=cYm8Lpge; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b110709ebeso155436485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 16:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728688824; x=1729293624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNQj9mklc4l6H4BuWdWir9/o85V9oVFW514rZ2mNMmM=;
        b=cYm8LpgeqdBSDmlVuuD8VORxiZL/lWpVyQ1wnpL/s08XOqD0Awv7Kk8V8D7xkEAANU
         Q6CSyIq/KrbSGyP0ggK48Ba0wB9cdUs1cfEDHWIsY2oJR3TCuyMyMyjazPPoUWLi20iE
         27rkGFG/p7edAjdaoYlgmP9qY+SIocZ2JQZjpfVwrYn4zI9SvxJigYMS9skenD2L3dnp
         GrxJNjvLY6LmiETBxzSo9H5iHALCljU8SOhuOtvctqOJeRaYfskDUvuE+4TPJR5bj/r0
         1Sye016mQ5SSrrBvifiEnu390c8OMV/rpVW881qtoLRGZxRzMS0p4ut7Nbp8YkL4cahE
         uTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728688824; x=1729293624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNQj9mklc4l6H4BuWdWir9/o85V9oVFW514rZ2mNMmM=;
        b=LcOQaWlEvE7G5Z8yf41CZrl9qp6/k9oW5oovV9q9eUxwXXRTCleZV/u9twT0HpEtyv
         bGHMDO62PBCqGqn36aSPgIerkROj52Uwpl90EQzauWVY6YfRd+wATChAAdaE7NgMk5A/
         1oMS440/GmSh/YtqOdeLmKtpjJt0HngooERbYhFdMHAxFDDemQAn1HWJ1wgrhkCEYJJB
         4NnSJFYGG9DKn97+EtkPES2GgL7s8tTJIvC0QEn0abiCtFK0kAcGYh6X2Zioq4K20g4F
         42fbLdDZY9bMsOW6WZTaoO4UkjUXfukXrMtcMx4lkTJEnBDjGOqrI+F9ZwWS6DdTk5am
         A+Bg==
X-Gm-Message-State: AOJu0YzUstWG5Wl+XS9qGd2IBkRYn58njir10IwXpok+VVr50ZKRaUAB
	A+kfnhp8AYPS1W3ShyAMsgKrQuIMLq0OoaT4So0InM4gopVrhPykjY8zH+3iTSkgh5nxOjYSTRP
	ES1M=
X-Google-Smtp-Source: AGHT+IGcrSoPOBKvbLBtsjhkFspHjqr/dhe1nXcQ7/0vfufLIC9r3UFaacGLWaiPOnaDehUqUByn1g==
X-Received: by 2002:a05:620a:29c4:b0:7af:cb6b:b510 with SMTP id af79cd13be357-7b11a35f816mr625444085a.13.1728688823823;
        Fri, 11 Oct 2024 16:20:23 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b11c0a8902sm89949785a.31.2024.10.11.16.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 16:20:23 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports
Date: Fri, 11 Oct 2024 19:16:23 -0400
Message-ID: <20241011231624.30628-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241011231624.30628-1-jonathan@marek.ca>
References: <20241011231624.30628-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2 USB-C ports on x1e78100-t14s are OTG-capable, remove the dr_mode
override to enable OTG.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index f05523cb51cd4..6343f34b978ad 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -1152,10 +1152,6 @@ &usb_1_ss0 {
 	status = "okay";
 };
 
-&usb_1_ss0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_ss0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 };
@@ -1184,10 +1180,6 @@ &usb_1_ss1 {
 	status = "okay";
 };
 
-&usb_1_ss1_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_ss1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss1_hs_in>;
 };
-- 
2.45.1


