Return-Path: <linux-arm-msm+bounces-100644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHjXBFaOyWm1zAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 22:40:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83D35408F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 22:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85BE2302297A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2252238228B;
	Sun, 29 Mar 2026 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oy2OYisF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57242475CB
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774816684; cv=none; b=K7zpNR/c3Uel8nmhnbJ2LLsiXFOgHww50AIIw8Mmi9rftJH731vO78MhNN7paeRgk9Tan0p3OgNV1tIyd8jwafWhswiSGfCHsAGj2onEtZaYR82i/fVYUH/7KhaTMhU8PjV94jUmJ2sO5LEQ0d+MeTGU6JrLWyXrLg4YPAWxGLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774816684; c=relaxed/simple;
	bh=CpHGf1fptuxgjZbCL86R16p8US9srsbzMQGuHkCRttY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xl1qYbkquWyCAGl/vsGzlO/8oPBXTIUxwOgaMzyJ5yWUcZBRdlu5nAZCJUrlGrC3zNexqX+JEV6nk+PovblAc8CjtWrmTXsgv0LOKK1MaUwsQbAk04m4SLlX/nqnlAFwFkcBA+/EZwV+KqnJmJtFUAmYrYCwCySmtRvFAK4MRQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oy2OYisF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so46762185e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 13:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774816681; x=1775421481; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+abQnCQaf1lWa+0MOlZOTTSG2J4Odnxh1HBL2deYlZE=;
        b=oy2OYisFgkc5YveaEfYb8RPBOECHicx95C3gGYR0rHu19n6FvyekTPYM3ULnBwVNK7
         haaRqbww7KzvT0B5MbsLCf7MF0H8ec9g4ttqBZ11uLqcYBacMzgRK1Dog4py5rqFBTd2
         6nR1uvb3nAtyWoYF8sjEkmDGw70RIw9qfyGWI6EyxRIvCp9WJenOUMF9PsKcWZyns29d
         uQaiKdrFtgj2QcmK2lGngz9AkiBE71xFZji56l89DvUpM0uuKxJRrDpe51E5wXgFvcQb
         iOY7IYio2C0BlK965BzHnZYMUelkvFIXrT6eNClH9Pl61oxrVvxQ3zMgDygxg6UvC8gP
         hdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774816681; x=1775421481;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+abQnCQaf1lWa+0MOlZOTTSG2J4Odnxh1HBL2deYlZE=;
        b=Z6sKSsWfsgKG54wgPydNgP2nMUY6NiRtW67Am5VFyeAAcqS3gko8uPEJr5l9PGjr/A
         tTYc/LzBxl9mg9Y9L5NeHGUzxnxI1KU0KePYj3jdos7xm0bJlyjaWFe+bvyA8ghTic9W
         YqejPrHAAY7EqyfupOicT6y2gQyw0C3expvey5Oh525BFHbhbLmXPGezn/6GVsyk9Q4x
         Y6SfeCdHaj28KBkknYA1cDYCshZgMvuvucUU+Cxkznq06rhzhygVe/tYdphPKFBZaxVY
         Tj3tiEOlIJtiTGw6c13kWa3BEQlUhM17sAmnHh8DpHJ3k+VYCEiEJcH7dJnXZU9Z3KXX
         1dIQ==
X-Gm-Message-State: AOJu0YzKkPkvLeEe6yjwrNmDIVWbNg/sjYNwfd4nZSyqBlZ68owVH7DG
	B+AJoNTLSyT5U6aPU2x8zKlagWNgSA9wLC+n6gU8J2ELExU1Lw0QA59g
X-Gm-Gg: ATEYQzxARO65ZfVRC1FWoq3RdBMaxzJu/nhqbu6LBLltRUJE9+B7vGQhcglRKxDs/4E
	bnbqESNIcrkWXh8aqLe+PgbEMo44R+dlQPby9ZmxFiPwmYmC99RcTyUcd6QqlH7WdM5EnTVyOzo
	a7GXrc4EOmc/k+61FnP6PkxEi/6mjQv0OKP7g9lrG8lR7F4YZjc839Zn99F4DWiAJ3k8tMJs+CQ
	zzO/3Z584OwfKNy7E/aT3XN0Z0z/s/AWI6BqfWUBlXt3iG8ZeGR4JLs5GzJ2iT6TyDAypSKJn0X
	d3A2JLVJZbRohLPXZiTJPq8eP4O/0CKxrgoKgnSros5y4qdVi2VfYA4cZkYf8eePITp9u64C6Q+
	MQR6kcTsVh1p6ZdakloqME+B3gU+EtmJlajNsnv/dYWWLIHwRIy0Jj7lH6emuQcxtMGsE28+07+
	EDvBWRf3Oh8dMOwzcRuqTC9A==
X-Received: by 2002:a05:600c:5304:b0:485:f1d1:8f3d with SMTP id 5b1f17b1804b1-48727d67a43mr171196555e9.6.1774816680834;
        Sun, 29 Mar 2026 13:38:00 -0700 (PDT)
Received: from [127.0.0.1] ([2a00:f502:160:9323:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487306996cbsm118974465e9.13.2026.03.29.13.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 13:38:00 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 30 Mar 2026 02:37:57 +0300
Subject: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add regulators for
 ambient light and proximity sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdukbDqnr2I84ChYo0DaYYyEd
 3fq8Tv8/wLGKmxwrBZQforJOBTUmwrStRl6RmmLwZEL5N0O30QZ08OHEAMq9/O9yaMaxq72sd3
 u6UAJSj0pd/L6nU/nv22+3Djl7w7W9QNQfGD9ewAAAA==
X-Change-ID: 20260325-z00t-cm36686-regulators-8f138d47090c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.1
X-Spamd-Result: default: False [3.34 / 15.00];
	DATE_IN_FUTURE(4.00)[2];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	TAGGED_FROM(0.00)[bounces-100644-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.60:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C83D35408F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VCNL4000 includes support for regulators. Add regulators listed in the
downstream device tree so they can be powered in during initialization.
VLED supply is missing downstream, so it will be powered on by a dummy.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light
and proximity sensor.

This patch series describes regulators needed for the ambient light and
proximity sensor.

In the patch series which added the ambient light and proximity sensor
for this device, regulators were missing, as they were not yet supported
by the sensor's device tree binding. Missing regulators for the ambient
light and proximity sensor resulted in it not powering on when a
regulator supplied only the ambient light and proximity sensor. In Asus
ZenFone 2 Laser case, the regulators were shared with the panel and
magnetometer, so it was not affected by this bug. However, for the sake
of completeness of the binding, we add the neccessary regulators anyway.

The mainline binding for the sensor also includes vled-supply, however,
in downstream, it is missing, and we have no datasheet for the device,
so for now, we'll have it being supplied by a dummy.
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 1a340fa92755..90e966242720 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -154,6 +154,9 @@ light-sensor@60 {
 		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
 		proximity-near-level = <30>;
 
+		vdd-supply = <&pm8916_l8>;
+		vio-supply = <&pm8916_l6>;
+
 		pinctrl-0 = <&light_int_default>;
 		pinctrl-names = "default";
 	};

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260325-z00t-cm36686-regulators-8f138d47090c

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


