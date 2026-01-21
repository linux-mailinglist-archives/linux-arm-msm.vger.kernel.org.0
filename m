Return-Path: <linux-arm-msm+bounces-90026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHUnDlnbcGnCaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:57:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2C85806C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8DF926AAC36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF89249550C;
	Wed, 21 Jan 2026 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WC59cq54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A413495511
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002010; cv=none; b=rsEqc7YFFAQkmQ7fWZbMJVs4IHM+aq//rVKWe7IU7uZljYIIY8VH+HsJ6INP6yQk++/tLzy6TpsfuBUJn1ooojldoHD/2q/zod735Kv79OLx3rRHgiQcP5r1Q/uSbSvguaaE1YuTKTzvtEnHadkvUDNWOZuDyUwUwBvrSP9rRw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002010; c=relaxed/simple;
	bh=RZ6L5kG6KnttCqZHYH2jeIzUhBdGGcKDyqVGSs/BMTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=laxBFfg/6HRVa6rjUnnWd4AkCGTNrlPAT2tnWtqrJAfaGGlF83qoDUWj/7KNhDKaVBN38EIBwsGJRvzqS+epOx7b8BmvIoHNi3Qsj+bvJUpFNptm9RHr2R1Ctgbxjx0WfN9TuKINcYxb+mq7VSsBE2NdHfPSuFZ68fkwLw9JvK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC59cq54; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a1388cdac3so45509175ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 05:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769002008; x=1769606808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpR/stwl1z8brk4SsorW5KRgaoHVnvVVxmk1S9SRSNY=;
        b=WC59cq54wcnmyqyUiRehjHQiraMhZkPI/UE3zRz24yPozhrJB1wgQRVufedXMG5uYZ
         U/M6VS1ZEA4JWP0e4wQDizNrKBmp61VXMiJvUCFL6P/NyRVXfjkhUEIVtcAAeR3OqbeM
         QjJwn5k17G0rT2RIG4gtEfEyx/U3cEcAEiEd07JUtmoE3FGCy+UrlCUinEaHTi1LEdNn
         51vKzeMdgQKMCy2k9DB0tWN3zU3EvACiHaslPt6GGd4lSjUvSp6o0e4LdiyONmoJ3lgh
         GoJBtGZs3ANCKYNjWuvv/0QzCA0+yjxrCbfggE5Tio6gBjD/BJMIwm4U0vCRpQsBAEL4
         NWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002008; x=1769606808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RpR/stwl1z8brk4SsorW5KRgaoHVnvVVxmk1S9SRSNY=;
        b=Tg0eyvPuHvy9hzls2lZVSGcNDvXHupiENALhJH2LCShIOdTeCzevtceMCnYdn8k4Ac
         myvHAl6qVjZ+3I2rtCGRQDdpP/gvAOz70VNdfFSPnlxP6kHZtbnbgqSlqbyVQVfZgwdL
         ioPiGaGh9Lu1AppqLIb6jZaQE5j4WH12V0eOT8xYcnPtTqZZk9Zgzt50qUO+XrjYmPls
         v7hwLqgh/U1UjLBG93XaxhL6AidwXb6Cle6Qiw84JoqtLjHGv11RM6JCb3pLKQz66csj
         3bgc6sj24fBy2qn/uYX+a0dfr3ZSJWYcR/LFu4mfBpNzgvuVyhWgZHfhZ6RMB8cBW8dW
         nslA==
X-Gm-Message-State: AOJu0YwxLY7cGpffRCubbhUWYf9uWvaQkiunYlFa07j/EiCSZN8l72KA
	dP5YZoSXVqioxV6kih4BGx90cOCBoB+aG8NF8A6ROG5ECtRYH/d63SGT
X-Gm-Gg: AZuq6aK4McOy95pvafJL3XPHlGi2n2YCptBtfG+ifHRniXZ++VgO6uJiuvxPg5wdn0L
	TKi0WLr6kD/Vrk97J0P8d4s57saXHEfLc9aJzzcKoadjkXOisjfkcTqfvOd3tIcf9ZNV+lqDZhJ
	5dUBt7gjUi2Hwv8zlHTmDQ0BZoUAkEJ5DMGQ0EFhGHXx37FP6iHcekifjdZf01EMY0S+Rqf9aVU
	sZ6ZOAZxtZqJc8TDksm6d9rETaMlWfJTAh1iuzbgxzwpQgNEUPXLTGU5YIR/SHFdSEl/zaFkUZu
	Qetoz5Kx8fstMqEz6UYGdWSCUqzZKov6/+9Hydyt6VTgyyeyxJYCYRRww47i7HUGdi1K77YMCQ5
	Ng0/xHEJNRKPuThm0wg7cNLr4+7HH0AFTXNOYbAQv4oHBdeqrkMJletP4ZaBqMixrdTouX4dsV9
	+8vYSWHCZu4ZHGDKOkP/SlUuiivp0=
X-Received: by 2002:a17:903:124f:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a717518f89mr159861135ad.20.1769002007797;
        Wed, 21 Jan 2026 05:26:47 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:47 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 21 Jan 2026 13:26:21 +0000
Subject: [PATCH v2 5/5] arm64: dts: qcom: pm6125: Enable RTC by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xiaomi-ginkgo-features-v2-5-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=641;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=RZ6L5kG6KnttCqZHYH2jeIzUhBdGGcKDyqVGSs/BMTw=;
 b=wFm7x5dv3jz+UuxY5G5CpNmEH9BbjfI4Zjwnm6k3n8KphNLpwjvIIzZ7Lk0ztv6aj/S9qSat/
 4+X96ondt8GBu7bJ4cTswfiMFbtpW3LTkeF0VUrpJ4NjgB+zjkgj/u/
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-90026-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,0.0.23.112:email,c000:email]
X-Rspamd-Queue-Id: DD2C85806C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

sm6125 soc uses this for real time clock.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm6125.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm6125.dtsi b/arch/arm64/boot/dts/qcom/pm6125.dtsi
index d0db28336..cb067adb7 100644
--- a/arch/arm64/boot/dts/qcom/pm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6125.dtsi
@@ -138,7 +138,6 @@ pm6125_rtc: rtc@6000 {
 			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
-			status = "disabled";
 		};
 
 		pm6125_gpios: gpio@c000 {

-- 
2.52.0


