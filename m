Return-Path: <linux-arm-msm+bounces-109168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEpnH4XzD2qXRwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:11:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C0F5AF650
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4922A305E187
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F8628DC4;
	Fri, 22 May 2026 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IM0YKZhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239F363083
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430057; cv=none; b=ItNLon66v2362fvx/Lza/guD44PXx7+nz+GIqwG6t0WL7uCwQYlxCI5HoeTBrjuaFz9GldWxlkuQKWv4FcXYCJta0SUa1skrsJtiTjuvCjEJa6jh7ZoFzSawwWSyDTb02IkXOYHnFw62+dlGwXD7tJ77EXFIngqQogeCQ6fQjdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430057; c=relaxed/simple;
	bh=/I7WuYR6MH/DwUP9up6B//pZnATesBLUuziLXAJIHF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbpzU6Mtq8ULHiSoo+6w3fScpzcQhDQ1xwWQ+DQXXqNwZPL3Pvo83JKlN01Dx79kaXyT/Fc2BAQ2E1UrV92UBMcahKHPFriMEzqs6lqP5nxXPH43dt8GMvMIFPiseYnTl3/xAwkJvsfYbP92b6gvlzJSbtF4lvUKaQbTo8sWTOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IM0YKZhM; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-369576666d5so3258618a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430055; x=1780034855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GxXWPb5b7IE1WF73BuquobJeXJY1I1vTx7dwyLAryI=;
        b=IM0YKZhMO0xiZohYIxkgz5yMTixAWoG867iyXV30gkhhoakHUocUI98v9zKMWHUEUG
         CkSPn9OoCrag5WW0+gA2ley4knveFGmOwcU9o69C0nt+m/oA3zUiW8TVx1kzPFkycRfn
         PgU9hBDNI8i9QtpaVE1nUzCgQl2+Zf2XwovuJmrcgVHIw0My3jXl5sLIXLfAW+y2XaPR
         TysIS2UCWBXReFA1Q8WEw+Yg5Vlrk5WCr+Ua+Dbk7M7/YPKjq551ahDclH5IM2VZbQPd
         gn5qUjvszCjOX+myMMDN/05rVzRrFjrZ8T/GvWJAfUZFuwkwd2QZIPvwWBmvsz04KKvs
         i3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430055; x=1780034855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GxXWPb5b7IE1WF73BuquobJeXJY1I1vTx7dwyLAryI=;
        b=nilx3x3GUhW9yZmsOU2sbyDGK8wmiv5wusAmOm/KwuHPWUOlfZHRGX07W7qHa9Il6v
         ACJ0nyGiG4wUF04W2geD9JFW8jZMOVDqMnapvCPN9++y89hButJMkm9Fl5D1oTz8osuN
         vhAt1Q/PaK+rWONrq7ZZj0ovVr+26PNoEm8OR1gx4jaAo/IDfzdJS1ZE2pNujKDnTDvV
         zbYvxcWlVP5Xg5oyrZ1V80410DEm8bc4IuvOYBKIRGgNbEy81YRv1Cx+bgfwzyaN5fQz
         b6Cnowwow2Zs7qq59OL5NSBByTCEh7MnPKZnkNj9r/CvIxThy15AiApFcL93aw9MW7tG
         e7SQ==
X-Gm-Message-State: AOJu0Yz4s3sDYxxfcjB0SZHUiE5HakVn9ARs7352V9MrKmXT6FJ1mQcc
	jHkXoqZEEMx0VgCimy+kVjxsttryuGWsBFQICf9jSW7fTWTnujTJGTkQs4KMLRZH7WA=
X-Gm-Gg: Acq92OE23e7h/GkN/+p8/OUDZa+4tCYCB+dAh6i/6KOFkSsYP9p1UQsSHBQw2EZ3CF3
	wAzW38zefmUrGE8bQw+yCEaabbsyRtklwoILydeyU3ESrf5PfmLbHUGkOuc74HCHPUt5QTh26Y1
	0iW5dia7zUy1tQus9HL/Y05kDViSsXU20rNr1iJ/kMGjWYUer7aj/Fz1+m/M0QYy39B+vRhRVVz
	3U/Cm36/hQpTpOHLiSglnSt2h6T65cO9YTAVX9oZYiu4onN5gfHrCleRUtI//lo/j3LBueev76c
	ZJ7WH5eZyV+mb/7hVC/c3gctAb2tRoneSpf5+784wWHVzAwxSI/cqS+W5vY99g3Ow+jbyClJZVv
	zYdsA4hTsiSWSjnZNazRVXNod10gOyri6qufFuprz+Vh1NhOuDXbQPLI3RKt0q1kTdr6c5f1ezm
	dpvOejFLL1DrvRpc0alP0bkVZAAz3GDpjyi6lkqVBUj9aEE57GfZ4G7rTTWeo/6J+3DA==
X-Received: by 2002:a17:90b:270e:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36a67697a77mr2327977a91.23.1779430055466;
        Thu, 21 May 2026 23:07:35 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:35 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 4/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Add regulator supplies and disable EUD
Date: Fri, 22 May 2026 18:06:43 +1200
Message-ID: <20260522060645.4399-5-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109168-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E2C0F5AF650
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing regulator supplies for qfprom and the PCIe controllers.
The qfprom node requires vcc-supply for correct eFuse reading. The
PCIe controllers require vdda and vddpe-3v3 supplies for the PHY and
connector power rails.

Disable the Embedded USB Debugger (EUD) as it conflicts with normal
USB operation on this board.

Tested on Radxa Dragon Q6A (QCS6490)

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b03..4003837ad 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -1093,3 +1093,23 @@ &sdc2_data {
 	bias-pull-up;
 	drive-strength = <10>;
 };
+
+/* Provide required regulator supplies for qfprom and PCIe controllers */
+&qfprom {
+	vcc-supply = <&vreg_l1c_1p8>;
+};
+
+&pcie0 {
+	vdda-supply = <&vreg_l1c_1p8>;
+	vddpe-3v3-supply = <&vreg_bob_3p296>;
+};
+
+&pcie1 {
+	vdda-supply = <&vreg_l1c_1p8>;
+	vddpe-3v3-supply = <&vreg_bob_3p296>;
+};
+
+/* Disable EUD as it conflicts with USB operation */
+&eud {
+	status = "disabled";
+};
-- 
2.53.0


