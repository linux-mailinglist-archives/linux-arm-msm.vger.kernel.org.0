Return-Path: <linux-arm-msm+bounces-34133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BCC99A7A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB4DB1C2557E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE361991A3;
	Fri, 11 Oct 2024 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="KxtzA3RV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022E198827
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660457; cv=none; b=I7y7FO6N3YeeJLBoPjxj/00+/1j1wFinqTGVpYyFb8yO0B/Lt7appNCsb7cZ6zncSQtl5FUpEre8HMg/vaMUqxF/Vlpx47LaOjm/IFVhwcyjj/9HsQYMWN0by1SAZI6yVH6836FnaTV93m9fPejGaDyWtMsdcHUt4ffMbq+gIWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660457; c=relaxed/simple;
	bh=PP45Dg1iGyv3y2H3r24fUF6A1hgqS1Bu5leVBaRAUcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Znko5IkNUa28wTdKXiCladWvMZQVoqsoXySQ6Yb2F7AT5zUSe5MuwP9CeoLOpbnGWdR82qg0oeZlWxaOo8ApxrudGuQmLFtUUaE4epOu6LGcCPjTKF0ASxHyRwvO3KMsEMm45Uvd37czfw/oZLr5XRBfezyf6E5tPekU28vVDso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=KxtzA3RV; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-45f091bf433so17257701cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728660455; x=1729265255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfIq3eRh8OI9mTcVWpkOySISef6TcE4+YhZrQqF6xqI=;
        b=KxtzA3RVMif7UHb+6bjH+A/aOKt5C3ETC/+hTEvr4MDG4ciZkhnTWaHGCBq8lEs4S7
         u5av0gZSodxkt57nb4IyX4jTGncRQLBxNj7iyAC8kKOmNuMtE7CvQqEfcvQJI880sYQU
         vZeiDVKIO+THsGUBzYPi3MwEnI5AT3n3Ovn6W9KGZb5r45pY2n/esU3YpwP+LNU15/vT
         fXifnrB3EvyZ4YnP2+itPRduGLgUXeDNKgsc4IWLDanaIdOXBnT6qV096XTY+rE7+0To
         gG0D7MZz3oIykJ863CukGk1XXQbnbn0JSHfg6XBsDO1LD6ZMQeWq4Bzm99pBpJl8ACHy
         k/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660455; x=1729265255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfIq3eRh8OI9mTcVWpkOySISef6TcE4+YhZrQqF6xqI=;
        b=GVdSna1skWXLhKPBLjLwMwpSYd6nf1PQQo0n4Brgi4PnWp5QTGO9IR90rBOmV4EtWA
         lpl3UqF18Z5WMrRVuMWRSVp85sqx8buIt1icM7izI/HumE6DMGW/QSbxVTD1Tv8RbCqU
         9jLR5YPrLR6VWEqywCj4pr9yLJUcw16d2yppCltXQyl3p7attkMUO0Rvp1b+tiFNn6Kc
         eqasXQCtuwBzR0qUaClB0BmhX9Wx88CO6I2BEW5ISz1u69JNQqTs24ynKKOR01yMvman
         TCMyHgPwKpU93DgQcbcBBAzrvRF0VctpVcS0lHprOr/STgtIx3mRPCeIngcxUAZPLCvo
         qpsA==
X-Gm-Message-State: AOJu0YwGYc82pX8zeZAb9BnKijV6jdwuqY03nOerVDhjykcpDXKtwCsO
	/ZDKhDQ6YvVF8UgsmPlwjQJLKbShCVtB65LF8jSC2sBfd6kBdjGVwyD4tJHiI59XybvJ1X1oIOW
	rLQk=
X-Google-Smtp-Source: AGHT+IGQig3AH+6PsHNsgNhCOMU6nyFyU97psC6t2DSMG/IxFOgutRPzphS2AY3CaiEXqetYDbD+Nw==
X-Received: by 2002:a05:622a:4c8c:b0:458:3154:4d0d with SMTP id d75a77b69052e-4604bc2d776mr43570241cf.37.1728660454899;
        Fri, 11 Oct 2024 08:27:34 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460427d5220sm16344131cf.32.2024.10.11.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:27:34 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/5] arm64: dts: qcom: x1e78100-t14s: add rtc offset to set rtc time
Date: Fri, 11 Oct 2024 11:22:43 -0400
Message-ID: <20241011152244.31267-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241011152244.31267-1-jonathan@marek.ca>
References: <20241011152244.31267-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See commit e67b45582c5e for explanation.

Note: the 0xbc offset is arbitrary, it just needs to not be already in use.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 8cd08c3a93382..f406c3a63d6a1 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -897,6 +897,17 @@ edp_bl_en: edp-bl-en-state {
 	};
 };
 
+&pmk8550_rtc {
+	nvmem-cells = <&rtc_offset>;
+	nvmem-cell-names = "offset";
+};
+
+&pmk8550_sdam_2 {
+	rtc_offset: rtc-offset@bc {
+		reg = <0xbc 0x4>;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
-- 
2.45.1


