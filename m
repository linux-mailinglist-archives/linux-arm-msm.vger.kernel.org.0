Return-Path: <linux-arm-msm+bounces-108550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GCVIjaBDGpPigUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:26:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0D5816C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCC05318BBDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8CA403E9F;
	Tue, 19 May 2026 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhYHepEj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F34403E80
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203634; cv=none; b=T0F9rPXyqNB6cNrSzCwxivOWr81C3Hhiva6X3kWcv0EJCAt9arRYFgqXJMF72IsyyJMmA0WrFmqfa+ikD/Py2JUD2mw6NAz3OEx4MDNgxnY4N9J+UuBZr/+h57t9cK7P4teOSP0vdCmlUFCMe3srYfZeRbFNGxdDq74TYD78bQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203634; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDW6EmdCaR0y8913rjaStJr6PwF+daVZQ+Gw0BVE/Oo0WoS57VPanIhiP4GyKaCJmO0L73aqYvhgUKO7cpjCtleq4JpUhtdCY0W2yc+zlHM0PdbWrgq3BvFl0FWaYcMcZSmZEZfL6zm0YaATYKgK04jhuJTw+ZkhGNDeOuSvKXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhYHepEj; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso6203996a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203630; x=1779808430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=DhYHepEjAME9HAypfjQdpTCctWhHMNRjAyhpQU1/0WqNsdXG1d5RwaQIA1heOPwwKt
         PgPxdbNmNlFSyFHvMcSF1o2AkXlFVk0YBJuVP/NGqJwce6E3EleGXRgTa3fYDI/stXIn
         28raa0ZhmPTnH8VTljkRhB7UEKe6Y61zgCoJQafdV56XGf+O6WBZixBbnH0uYNjIYiAF
         hJ80rffLRn+/Ir4yJ8E1q+hJOEYUOmyB1cHnrUOW5O270QqEOlVg2+yQZfIXL7NtO63d
         J8nUhG7EOioS8NbA1ElWfgloqYzVvrNnq8rsRPlg+8jCHLD4jUYhUUt8YbuqQOJYaqTK
         M8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203630; x=1779808430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=FxmAH1o4lItT89+9L+/O+zEa3hNiifxnyb7fhU8H1Q7seMWhvK1xl6vKs99NG2/CJ3
         NQZCzGdx4dczhbK2O85MS5H88ZTh5azAYGh429x/fjy/QE+CYR4/d4VhU6zFN0S+Jg70
         oA0vUtLzm0sXZpJwYahnegsbltZtYHJXAG2E5la43THs44BiS6HLQZgbo7ZzjTG6mYHt
         S8DezH7aYxi0ezfumwvag746dCHw1SjykdBEsK4jbO4M85rqqLfw56bHWpP9KCxLfKGA
         tsKnsY2kj19Qa86ovLedbRdb/EktjMZBROEj3wTnks17AVzQJl6lVLnuPy71GW7XYZal
         Krrg==
X-Forwarded-Encrypted: i=1; AFNElJ88zZMzPVvex9hxW05ZfOdX0Mtjn1AthsEstl6wQZjJyjozUDHig6+R8tfEF99KWpXq/JTqT5ML/xb/ZJXR@vger.kernel.org
X-Gm-Message-State: AOJu0YxKaM6bj2GyJOMW7rykdWjytTQJx0ept+LDbmlnNyYXQTvzjP/E
	K3GDm+PPcDf9zEsIN8NbXtAn+2USCaMsk/Acz6wumWx5INb3PgDOtjUR
X-Gm-Gg: Acq92OFeOZySP/DEfWwEYYDf4JyFnxfvnJBOXwB5zbdszyufzvF43ehierfsTXMYk0B
	k2b/GbR3/kjs/Wx0EBQlZ2AQbzcgxX0I6fCoONZdtJS+3VHnOE/fTqT6x3yt87RzQOjY9dfPy4u
	qhvVnRjwFLCM/hakwZeyugzAY4RzZPB27+IJIkCZ8mzZrP5+zxv1+7A46uQ6xcxZPmeMK+uphBS
	lONHGCsZB56hsxovEeQ6LOgHrBXN7POW3c+898jCM6fH14SYcOWa4lyLlDgS3duGnZ15F34TdqQ
	YdEOXIQNykanh3PYY4SJjbOm9utsLofcNJNqPjuTWzkf5XD4Zh3w6NATiBVVicnrK3u35FKY8AX
	guE8crWAGBAY3AjU/inN37GLUpUgLxPAUbOwQkrjo5fhdXaNny57CxeiTb7pghSQtGFLyXaEmX7
	RgUxEZ6u6Qm5bJaW8SCiHx1hZ1l4C9lwAX8bNC
X-Received: by 2002:a05:6402:e04:b0:670:ef2a:217e with SMTP id 4fb4d7f45d1cf-683baa391aemr10613028a12.0.1779203630340;
        Tue, 19 May 2026 08:13:50 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:49 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:53 +0300
Subject: [PATCH v8 8/9] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-8-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108550-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DBF0D5816C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0


