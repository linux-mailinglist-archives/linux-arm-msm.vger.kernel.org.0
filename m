Return-Path: <linux-arm-msm+bounces-106444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKxhGy2k/GljSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:39:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A74EA574
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02AD330936D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A326407573;
	Thu,  7 May 2026 14:35:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0429B3FBEA9;
	Thu,  7 May 2026 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164502; cv=none; b=WzEUeELOFtw68sKhCxk3r7Se2LzweRgIGanFzzqjRuNYroF3xkmGDY7Lgxinq1c67CCnhUYcQjt5NSEjECkn5gCvnfi+UDtbEvhqtWX5y7au37L+1YBe8QUBNkE7HWZLL7sWyShZfbXVnTHbsZqWCJNLIQf5ArdV6y7+d8G2LNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164502; c=relaxed/simple;
	bh=YROrnMg2bKktWLZ3bjRpm8t3ad8V3uxMUXCrSB4fZhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPXUPOMJOi6+1xDMPREbh4jSOVbBSjNcYZ2tJpAStJ1tySqntdEjhFGsfaOehBSOXHPqkGe/Xvd0LUn8ZL9FG0Ig6LvUBz9HkFkeEP5eaGhkIXzHd7Y7jsMUMQsbJ/TJ6D0zx7oqwBoZoiOEuQwcCk/nYhtA7Dr0pToR1qhsh0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz20t1778164481tfbc926b2
X-QQ-Originating-IP: qSERE/Y9LOPRkwnsxFw/cu72Z09KzjhPUpCX/MwFdXc=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:34:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10568736851606768545
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:34:35 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp: drop unused
 polling-delay-passive properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-sc8280xp-thermal-zones-v1-1-33d4395b1be9@radxa.com>
References: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
In-Reply-To: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061; i=sophon@radxa.com;
 h=from:subject:message-id; bh=YROrnMg2bKktWLZ3bjRpm8t3ad8V3uxMUXCrSB4fZhI=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/Fv3dpaB/p8GtKNhz+a3gnK6KTXnaV5TaXtbvWOL48
 OnZ8zofOkpZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAEzkvzTDLyaWJfFdd6SN3klV
 /l+WtJxj/vGeVW9UTrN8KGN8eDGs/hAjw64LCtdyONNnai8IvhaRYbD33afzKhf25l8sFb+6KmR
 LIhMA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NwIS3Zdzte8wsgAkhJefnElUi0Nwx2gsciig4nv0K61ygcW/E1xzhmQ/
	b7QrRGA6LJxFvoW1wEfs9LTc5zcjfgz9iyB0XtTga10D9HXHJJSJe3AfQl4wOgiQxBFrx6c
	3lfokJs3ypdXj1g5SYdD/lPm3uKN2NUDblUbX+YChJdtoeQb0JD0t9PYPfX93oRH0170Lcb
	bX8XxsT1X1ZXftxNH+Lcdc2I3+LWuTSpaLdQFoDKeRFys3fnR4kcikJKlXmtgBz0S4kDVp5
	pDRN6YDyvBBk0/9BNaku1PxQ/F6VDumKFuBUgSv/mR5jCMkImH2brArqfNiox1LmswdM1fd
	epf16x9GizvMlzHNIAte8++nLvvG6d1zfR91NDUHHVb/IpYBzG5jsOoIZsr8xM9RD1KZsxY
	Gqnn97by+6YCLEcdOp16ShJKKrBAIyd4h+RYU8gNqAoRtADSccKFyLt5Xob/kQa0OkygHC5
	oAbm4p6aIqrgu7WOvwY+h4MnngLEBVYEip9XgFbiPhWNqnmOEfkBzLjMt2o87vIt3XUfbr5
	vYyURrfLLW9EKssvrEyV17y/PBXFEz59qoc2CXKgpA0wyIZ7xQugH2Hmh4H+WWrsgFRjELF
	eFLSC1ncnpo13WFVig0lNEhkOlNHwpqhMhpV/SLPTDr30iDjqJRqLA/qV1SH08GVbNxcAO8
	fJx217w4VW7dnlvsHoq8spf45ZBi18mvQG2W5uEBmJeaMrYbrQp91jrAaLWoCNUTgB1k7+c
	3N6xTjtCTuUdF98CbH0OQAkg9dyyyzuKQ2kCSiJNGMpPOunRsphzOsgHL99P5J4L0gubaA/
	bpil5xqxaipCNvOrmbbWJCHLOqA8AIwqwTkzowng0gJnzHlQU0PzEPptJkazmGZmIlsWN7Y
	mbGrPx/T3Ypy1M9/fRZ7yjbPH+y++e4GIWz/SFcnXBbaLsew4MKElFQ5KGMqLHKwusxx6f0
	k8e/s/UuH4DyUqPmuBqzAx1CQ7k6RHawFnxgjRat62XhECRYxxMx+yP8dKVAW+1uiKn46qj
	t9abf+ZMZ6xFetFAKoQerBBttZztE=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: DA5A74EA574
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-106444-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Remove the unused polling-delay-passive properties from thermal nodes
without a passive trip point.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..af9b3f8a0817 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -6871,8 +6871,6 @@ sound: sound {
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -6885,8 +6883,6 @@ cpu-crit {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -6899,8 +6895,6 @@ cpu-crit {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -6913,8 +6907,6 @@ cpu-crit {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -6927,8 +6919,6 @@ cpu-crit {
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -6941,8 +6931,6 @@ cpu-crit {
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -6955,8 +6943,6 @@ cpu-crit {
 		};
 
 		cpu6-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -6969,8 +6955,6 @@ cpu-crit {
 		};
 
 		cpu7-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -6983,8 +6967,6 @@ cpu-crit {
 		};
 
 		cluster0-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -7024,8 +7006,6 @@ trip-point1 {
 		};
 
 		mem-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens1 15>;
 
 			trips {

-- 
2.54.0


