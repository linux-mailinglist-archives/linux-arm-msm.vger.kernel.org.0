Return-Path: <linux-arm-msm+bounces-104536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APZNFokJ7WkEegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:35:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B25544675D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9591305775F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3763A3612D5;
	Sat, 25 Apr 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNA77ZAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DBE26ED41
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141899; cv=none; b=Ys7Gd5snP2OSvri5SmOuOnlthLHym8JJ0Oc7v+daR3f9YITqzM+C9zd3mxTXGbyy9weg1+8g+suKHXcaY7EgQU+G7Z1iYwOwHg1DuikdWMvcIckECrwiTd2WtuTlj8hE9oTwmfUWEJ60oSuZSAHgZ1yj70dQKRB/PhbJJrPH53o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141899; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGhPgaRHz7sz+vQFo9ftLIr2Qbot6FTICGoBzEQYIfARzOS6awptd3vS09cTa7RCwbZmDYAF4l3gsjeEUjPQMxVmvnKTTceE6qPkRIGV46rnm8xOOjP0ZmODlgB5G0UHXvwIV++Yc2ORCgR3S23KHe9WPWb3g7Q1fjYMvo/lBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNA77ZAB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so111095085e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141887; x=1777746687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=qNA77ZABmGYyRinjOc2E4dORhLQmY33aZnQOhmikiOiuDjqubnKYUfmAU7b/19OiIP
         S3glB21ABZKlXBMRBYnIY6UemA3/jE1+Fy9Ms7W5EyDT2pRenc0AhL7mq/5COej9L3cE
         JH0kPDAkTBcbd1hJf3vbbpAJBzHZ2PEvew4eJEndafZas+hDWrWw0r4eegfW4DBC+Lxp
         XhN5MmNxP2qdKaut6Yiw24ntcITRuCTpyVLUW5MmeYBQrvHDAoZkumnOIN/W/ZrZRmZU
         gh1NknLEmgzHq+okCHe/3t4nXa2KdF/CI230WbX/hgYK/yYIe+5Tkvx8LC5O2o+6rAhr
         DNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141887; x=1777746687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=KJpY8gMLBphwLtaFSJJpVCjd5CmizoQYE+nWtpMxJpDKy5kDgm6jHg0CEhYsqvDnKZ
         kuhumwVIvYPcbTdhQaS6m27uIByZ/iW4B2ztgiJBO/mMrARLK5fqZQ/41WiXLOagIgyN
         6lwMh1tUdGDLH4HurKp1OiGjEYOXc144g5LvwWydB/z+m5Dl/7AQfCti30kYYiIGEVy1
         GWBLwmrgWVYMtFh6a9MjhQw/pasiz0dAu08RVyK0q90IiziO0eIv3JjwdLq8HGt0nIQj
         QIuzIcVK0olIqwla1tJhOIoA3jFUkc9MFOfgvU/lCP0TQeO8vqpFx6mIA+TNDYr8lOnv
         bIhg==
X-Forwarded-Encrypted: i=1; AFNElJ9k0ShWM/uedtzMz/csfGIMmDyBDDgtfYm+/j6BxM4sOfZriZpur/vDEHlDABUpNyi2viqfb8EHyrAl30qR@vger.kernel.org
X-Gm-Message-State: AOJu0YyNfjyK1fg1n+tkXt+/XcgVTI9JzHvZKEs87AGKatJGj48DCzby
	rvwM5PMaZpdGNZEl5QXHuGUSGwXk7K0QsVzAj3SlRVNs+4kHgbB0A/NW
X-Gm-Gg: AeBDieto4mz33GxBLJNOi2+DOvLInKuEoUxihCM88kr4+Whjn5iHOpuf4/t9ykI8BcD
	Ol7tIayXY5P71H4jm0FWRSi6nvO/U01kNoeh+rL0OwwDnSAdnLyOPqkOKXiz2K+zp2YKM1BuHO0
	PGwZ1YJzk0JQL3JrvFE0SQBrOm0e6oF9/vStHqlwIJkkKGqmr5gI6wrZRAhxjCYOb3LbkEOnEIJ
	SWx0auSOrQJa5nakYOjdazz+XcXlK3wGF8WmwR4Wi8AePQKWw7ydbzPIOI0TNehvIJT9x306Nbk
	1PuOw9rrONsJgq2ZYsdhs4C97y+A46dBCJxR1fBoEb2p7XtaIWCzSDINk/7dDU0XQlCou5o5wDc
	FVuIKqyIjXlAc26Q30USrgAAYZKCBaYDw7d9AVlcaAgjWKKO+4IfBDUmNQtkgiP2rcwO4MBkcMl
	crIvmpYChL53fXAcn7LblZDHVsXHAmLM65Uuk=
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488fb771613mr401209905e9.18.1777141887310;
        Sat, 25 Apr 2026 11:31:27 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:27 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:06 +0300
Subject: [PATCH RFC v2 05/11] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-5-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: B25544675D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104536-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
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


