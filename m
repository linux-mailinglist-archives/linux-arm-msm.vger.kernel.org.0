Return-Path: <linux-arm-msm+bounces-92381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC6qDmGVimmuMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:18:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C91163B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 776843034DF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562AC2D1907;
	Tue, 10 Feb 2026 02:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3mFHdyO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200072C3261
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689869; cv=none; b=VWtQUJovgeNwMMSBx7gS0OB3Mgx91wbEWBTMu3C5NpEDiBweZcO9IzyTES0vh8DueF97RFJWmFfSPoZjf1yTfZsjTOZ9XAUiGkHxcwwF4ZWHCDmYkV6Q5/uFcMtQYP7HiWaXvOXFxCp/UfA275p2Cl7tonvlVYFfgu15KtSeRp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689869; c=relaxed/simple;
	bh=q0l/IFdNUOrbgH5VkX+Ntm6uWvWVBaEQ5fVCuOy9WmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILVdL7UDnTQ7ztwdok2/L5HdjDVL6xCmIq2GIBvzs6wnw2DN14vRdnV2eaXy9ga6ba6VazRPWjnOFTQoHWd6CRtqBuI1fSoofRgRhYVugEOShkepeC84LviDXkc9Eyxdf/ucLtWHtUNGdeMtVkO4ya53+QIBdvuQJ7AumShntY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3mFHdyO; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89549b2f538so6516856d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689867; x=1771294667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ0SptXf6V+p9mpcL89pKBpX2aGQtF7sm9wlbyJP5XY=;
        b=f3mFHdyOOTX9l9hFJ/WfUYZmf2ThZDC4Ljjki+eX6iZSNrCj49rd6+dDcWN06X5E16
         xYaIaGr1mDSYxf/iiZPlXuch0+MhFH4C3sMfB8/o9EGn1BT2W/YUldXbaD0fLiQkrKEN
         iki01gm05xo+FmncOA1BAiM9kHtHZDurOCsWmm0CWN/dFDojKBQ4gVE8jk2tx+fqNqvM
         HtkDGoiDr+W4oeL3e5D1eVSehw/q3+A68k1EBR7IQfGoF6TEwLp5JXs92MJv+2enwF1d
         46m86gb3OdWHw34SkqrT2V2AupHx0S2D3ORvuN4MfxSq5B7buNXmMBjtGEj2a9Iofhlw
         ZFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689867; x=1771294667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZ0SptXf6V+p9mpcL89pKBpX2aGQtF7sm9wlbyJP5XY=;
        b=sce2clKKWzl0QOPmt0BqKjg+8p4+/DCmgYzWdpnXe8HdlO3aLjNyC/k7ZmUayUVHwy
         Wd43ZoR7P5vCa6JK6Lu4KPsmathGwvu1TQfXGUbtuWkGEN7xvlq8JkYG7DknyS5L991D
         DHgxMH+o6gh/hUHnd9vetCPSiBl8Bftyj7WKffK0elGYum8NkvAiOHKLO6GOcjy+R9ha
         ILAcl2pNRP/Pj6ZR5tpDoLYXWK1TZGY+mSJ1+1o1pfblBGdpQ6azgHDfGt837ruFvRNu
         6eHywbSIoM3lkga85RHiIVGxBRDqx+2s963OwMwaWvLP3IjRxCcV69DMJOFfwVl7PoAY
         fbjg==
X-Forwarded-Encrypted: i=1; AJvYcCUPyEwi5ORZNOd0Y141hdOv/3lN/quM1pC+end89LA/sGwizjkvLxrX/FZXaYACjatz+I549m/jSZcnBrwy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnla8uPSFPizc1tc4yAPnTwkEgpeidWpep6GzdnASSTsMG+HdD
	8z9NMzdFYbUq2FVw7GSRDE3putiq/tIeeL21C5Kvk8iToIzNK2wFUD0M
X-Gm-Gg: AZuq6aLhoOAXoWIkyEOz3fGOf9Iuhdsf4FSeMgU7dHyn21hkbY19ndjIc3uB+r2Wcax
	eJzu+TPipD9IP/ZDeBGV+5FMzrPHK8+mt+VKVTMAIKCjaNIBnKJezZXIJ6WxW5vZlr9jvmPjl8d
	+eUQNu8GitA00juV+/tW6cuFya8kooNxAkL1biYvcngdumCxQllxvnURiY1T+QKuMxdhYPjx4JV
	/Kh34qEh6wBFW7mrLokYx5HG52gxnmGse2sC86y2+j9pqPhgxLocEX/0MZvcMFocH3TxxjIg2UC
	TmLzmDZcr+t9c9Q+1zCY1ndoFXhuwyNXlD9M8LRFBElpBiljNIfkoJ3e5pi482g3vrg7kWcuf4S
	GzSM+EGM2RiTRGqSNGH+XDft7AH2E3R521DgUqqm10ig1hQm608Vzn8dr1SXkHjNjNeT3obnizw
	Vac+bDWgNCjkQt8LhJlYmXNe4u2W52K3L4iJurT6BEaPvXs5RKN9JJDT+twjJgh7ScUqELKxu5K
	VfaVkqN+PrqWQM=
X-Received: by 2002:a05:6214:e66:b0:895:635:c00e with SMTP id 6a1803df08f44-8953cb80e8fmr203705356d6.45.1770689867064;
        Mon, 09 Feb 2026 18:17:47 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8963ac2ab29sm57519146d6.3.2026.02.09.18.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:17:46 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/3] thermal: qcom-spmi-adc-tm5: Correct the voltage-code scaling for HC
Date: Mon,  9 Feb 2026 21:18:18 -0500
Message-ID: <20260210021819.12673-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021819.12673-1-mailingradian@gmail.com>
References: <20260210021819.12673-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92381-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A41C91163B9
X-Rspamd-Action: no action

When support was added for the HC variant, the full_scale_code_volt
value was copied from the tm5 variant. From the downstream kernel, the
scaling value is 0x70e4 on PMI632 (tm5 variant), but it is 0x4000 on
PM660 and PM8998 (HC variant). Correct the ADC code to voltage
scaling factor for the HC variant.

Fixes: f6c83676c6097 ("thermal/drivers/qcom/spmi-adc-tm5: Add support for HC variant")
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index d7f2e6ca92c2..6ccd02fe0e4c 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -909,7 +909,7 @@ static const struct adc_tm5_data adc_tm5_data_pmic = {
 };
 
 static const struct adc_tm5_data adc_tm_hc_data_pmic = {
-	.full_scale_code_volt = 0x70e4,
+	.full_scale_code_volt = 0x4000,
 	.decimation = (unsigned int []) { 256, 512, 1024 },
 	.hw_settle = (unsigned int []) { 0, 100, 200, 300, 400, 500, 600, 700,
 					 1000, 2000, 4000, 6000, 8000, 10000 },
-- 
2.53.0


