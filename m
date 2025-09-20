Return-Path: <linux-arm-msm+bounces-74258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136BB8BD0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E543F1C059B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 01:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F6B1F3B8A;
	Sat, 20 Sep 2025 01:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRNBWyEu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE34219A8D
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 01:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758332839; cv=none; b=H391xJ+m9YQWKXblzwsmOpnq9PLunOaCONUrv+KcOoq9biyj1r84M/oqKl+3oZzL2Pu4wXoyrqYacDY7Mvn5WFz782+EcczO8XxpSmN+N9OVHBfZzV7SM/Gln5bEQPlmLLC4F2FaXw33dkaj4g0GG9knidfDck6xRZv4qlbuVxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758332839; c=relaxed/simple;
	bh=vb0BTK2Rk5uuPvvLLg1eCaDr5BF/IiFelvHr+G7OHfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aD7XSWiKAlRXGYvipaJnoB7h+KtcsPIIFb5KEiIAeYPeTNicWMFwbiHulHalesj/POKdXFm5u5VaE3Fbi7lSV+S/ZlKIYp/UOUrb++ZMa2FPgpykejbcUHz1dNmTiZSKEJQ21OTbdaf1sVUBpuq3DoGPWlFKnt1ZsR8Crbb1AsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRNBWyEu; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b553412a19bso147739a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758332837; x=1758937637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDANVNLAXNlGDsrc5CGt536N9WLG4foln19BmJ4pqwQ=;
        b=TRNBWyEuHV+HlY98pe+oZ2vZvYVUN8rkvOagtMUYHWrymYPX53Pza+taS3Hz9mLs8V
         Opsg4XK2uHTEhMoRTYyT7miFc6UOzRbCWIvN5NGWrzOq5NHNNz2DybZ6rR1mOf/J2P/J
         LxRh5My6vAc7U5Bsn5prlv6Sgj5LPsgd5OPdlEkbhZ/yohmd9xUCdN1yG0ON4iEonWJ3
         AYPIbV/2KqF7bsINDRIepqGyeyHrw6WWmVXvDu+s7T4MpkYUM/PiuxZU6XtV/PqGOGj8
         GzAgo3pe9eidoD7v74VgpMwt625sBYtwpXUl/MBuo0USZDVoNJdX/PNG4k8jhSs86Gk0
         FsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332837; x=1758937637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDANVNLAXNlGDsrc5CGt536N9WLG4foln19BmJ4pqwQ=;
        b=wC+5mDYZhVCp8Qrv316cLJ35aAobDj8fcKiXgJMLP5Iz6BPsKfIbjKOj08xaDTVVhr
         MJKjBMxGm8Uzn59cWJE09cuvTmshGso/jczA1J8j1epNtAU1KfJlXGUw5gcKxhhKkKGk
         IDfQlHW0XjTYDPvUS9pjf8OMqIoh/nfQjDtaLVyhqntQdws/Nx2JBUHrXPGgNCwgsnIZ
         DiTVPNFysnjYWfQwTxPPPSS/MMzdGUbp3luPeW8MdS/9XdSiOGVZUTUsXL6/iOaL+/Zw
         9GLpSwCkAtjFazcicVY23DObkbTqg15Mtw1opPECpyYjgms7JPB6Rg/+A2D7Dsgg520M
         w9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWpU8vFRxTrOERS1BV/KY9XbOC7OPBCQt4skPHS8quh/7inBpxIh5vKkEgcH9OkRfdJ94jjOTIlVqVTCYzb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy83JslTE8ugqU3MrqUwIM04GeDHUoTrs4N/Imgo+W2y96pfT2c
	ehwQMl1mJpvOeLMrAuh80H+BLMuQY+W75LAfWmtddQPvqi8g94Eu+8Vx
X-Gm-Gg: ASbGncvd9mKcfC965WUmxZp6abOBao4vxYh0m4zwwGe2rROreaoKUvS82n6FHzRObUe
	edNR7r8VUESRcboDk595CqSsNGRTySxEycCB+Q/Zw8WmrCnr/5BrZa+IdfV4iiIfnpl5j477zDW
	FgHHbrTPAxupnLf3R8Q9/T+1AAyWF1IcE6PXFvJ7OQhuzu1mUdZ/RVErujm8VtYg0hH0nrsRPUj
	kLR8MhW2PGwKIgm3TCbl+sC+YbBtm3MprPetaMpRdhuBCE7o2ukoSHI0tDo+yzyOMW8D4doQNnu
	OOBcemwSobQEOQwDY6H70XVfDoHjsdS9EoTjUbvx9izfdqa7JoOxK5/IjP8KIpZdDFPc7p4K3LY
	JY4ZUcnRXe81PjxftJ0yu
X-Google-Smtp-Source: AGHT+IF8Qv7XXWFPUXzrHtj8oUR7XmANyCLJf1PLQPpKbnLGaW+uYuJ1GuJzs4v8GW8udB3N0U4Iug==
X-Received: by 2002:a17:903:2a8f:b0:271:479d:3de2 with SMTP id d9443c01a7336-271479d4e0emr7643705ad.13.1758332836972;
        Fri, 19 Sep 2025 18:47:16 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033c922sm65709455ad.131.2025.09.19.18.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 18:47:16 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: r0q: enable hardware clocks
Date: Sat, 20 Sep 2025 01:46:36 +0000
Message-ID: <20250920014637.38175-5-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920014637.38175-1-ghatto404@gmail.com>
References: <20250920014637.38175-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the real-time clocks found in R0Q board.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
index c1b0b21c0ec5..c088f1acf6ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -225,6 +225,21 @@ vol_up_n: vol-up-n-state {
 	};
 };
 
+&pmk8350_rtc {
+	nvmem-cells = <&rtc_offset>;
+	nvmem-cell-names = "offset";
+
+	status = "okay";
+};
+
+&pmk8350_sdam_2 {
+	status = "okay";
+
+	rtc_offset: rtc-offset@bc {
+		reg = <0xbc 0x4>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
-- 
2.51.0


