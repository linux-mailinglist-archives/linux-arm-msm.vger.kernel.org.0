Return-Path: <linux-arm-msm+bounces-103633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ia0FwQS5WmBeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 19:33:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA74424E3E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 19:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF1BF300B75C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 17:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A8B2DEA6E;
	Sun, 19 Apr 2026 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ2gcg12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95321287257
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776620031; cv=none; b=jS3Cdv+CsLxvX75S7v7UYYxgaHON+Al+9d/4KJyNVTlqDU9VvyrOp8SJ2iMySfY062i+VUGp5eSyrqETJZCEhkXYFoklRDoWzzWhsrm1WFRNfth1+6tkgyiPXrG62XeGuIUjGyRJNZ+BX1tbrN6jTZB704y5wMeH5vlMqJPoe4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776620031; c=relaxed/simple;
	bh=+eXxsG5JJH2rHEDsoO56L1a9AQOL7NpuxldcjvNev9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=roqkviUXQHnMyZ2SWaFJNXb/EX+KQjQuhOjPnt4p51cbV3c6H7Lqd9qpITSmgaWSvgsvQFnDGFjK/7vZH+cWlQ0YhtfE9Y7jTJNldlk/3weHOSVao51ebVAxavfolVK5bsXdwfIp4pCFmdc1+GL8EIue8dqcgIx6yKnqdYTb8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ2gcg12; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82748257f5fso1766914b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776620030; x=1777224830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtHVeBeDpsVTJES5iTqG87kNqD4MTezzYdcdk0SZrh0=;
        b=dQ2gcg12kbiMWEYPEv+BTJkS6Y1ew5QmWqDIjueJWD71AXeqG9kkAHSxxuX9qntb8i
         LEhuEys+JyVRMye+L26+8+LOJAch2gg9Q0k0vbTV0CRIpPBztQMS8YWoy5Gfr19xhc7w
         BjenKA8cz+pMeg9K4c4z51bj3g2mcqrodAj17bWNUUKjUOUL9C0SjbPmsDKet5Wswxun
         AnEeUEn7GTpNbVZKmSYYG8dKmas6/m8UH0IBL0wN82yisBo9Jlh1cHdf3395WxBtoCtv
         6ttIXqal4VzvzpEB3YvkE66kRqWzea2l9vrop/LpxKIKPTwPrdCeqp9NaEGWFzuQxfCl
         Vy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776620030; x=1777224830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xtHVeBeDpsVTJES5iTqG87kNqD4MTezzYdcdk0SZrh0=;
        b=avJds3gI051cxr/t7TYdzXuD59ThqgSKROfP02a7KdNIEUGBdvAfX8GJP2Fgf5LcLd
         +eBWnGA+vEJM/S1V9ii/Zh/i7l3OyzxuANa1lDgXlpMAmEJtgU4PwPbK8GFomg4WWlYH
         nOS9l1kfukMJ9siG2t3MVtKee/ivJsGZ6R4olJPJwGBN8rA2xH3D/dMZX0Sa4aRqkC8U
         JhNMF/9XEYk+pp34kqK6a21AScLw8M3I5ycA+zL8npu4ruRThKmuL+RfbtZb2UCN6zB/
         BVJsNmUOqLKUUJ26R8hkWGjhSY4m8wR3qBWmPEmWg4UARKc9/6NTRdLvdetVvyRFhqyb
         ppSw==
X-Forwarded-Encrypted: i=1; AFNElJ+51/SnkUVoTkNfWwul49ALbcS4ptmnTtTA2bYbVhRdhoDcgIN2Ml3mQZDAcRDQVCJSEuIEkpUnlMbsvCOo@vger.kernel.org
X-Gm-Message-State: AOJu0YzOPKV2LU6vaAu7XxajNQjAOn3MWHqJKvQrufPx7ssmirhSoPKv
	1rhGjE8zPstITo8SYM3xANqHOL4fkjEeC+5AuRbp3buPoc7H7rQmoffL
X-Gm-Gg: AeBDievfxWY6LLVsoEiW9pXKvsLJmvYTvzFRc1PYwu2/21ZOiSoivKV+JHcLqLXZ4iQ
	rPMLiko3iRj6CpNoPRUqJes2oqzUoEQxf6dMBm+RVeaPvUx3Empb84Q+Pul0XyEHrDiLksRq9MG
	GuuR1O2DX4y3xtUKAOmNpFj+Qf+Q4MRKJYryi8WfBfowLuqoc3DdgJwsNAmpSAUIDWLjv6kSzmT
	X9hTJA9Y+fMldbJtoYkXrHbU5czTtlS8sSN9b5pXWpymFUlJ4IWLAAL4UV8qahx4Mvtr9aG7+oT
	BxghD6HHhoPkWBRAAi/ld6jhXc+1t1G8h1XNhZKFRSdb3OzhwYNfkSG/iRdawD0s4ELh7q/nPDg
	Zzda0BnE2XsoK2OPwW+0sRK3SV2CtiwKH/x1/uPnxt7h4uoxDLdijyBorbmdHHCCl1SAchDwFXr
	o6NQzUpgRkLZPuHg==
X-Received: by 2002:a05:6a00:4507:b0:82f:6c51:a246 with SMTP id d2e1a72fcca58-82f8b323284mr8254694b3a.2.1776620029980;
        Sun, 19 Apr 2026 10:33:49 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::6c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm7954833b3a.40.2026.04.19.10.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 10:33:49 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp: gaokun3: correct EC interrupt pin
Date: Mon, 20 Apr 2026 01:32:50 +0800
Message-ID: <20260419173251.1180026-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419173251.1180026-1-mitltlatltl@gmail.com>
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-103633-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.38:email]
X-Rspamd-Queue-Id: BAA74424E3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unlike other sc8280xp platforms, on this platform, in dsdt, gpio 0x2c0
is not mapped to gpio107, it is gpio103, so fix it. I found this until
I did a trigger track, irq is regularly triggerd every several
millisecs. In the past, since here gpio107 was low forever, ec irq
would keep to be triggered and polling the event every several
millisecs.

About how to get the map, please check openbsd driver for it
https://github.com/openbsd/src/blob/master/sys/dev/acpi/qcgpio.c

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..d9d55241336e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -637,7 +637,7 @@ embedded-controller@38 {
 		compatible = "huawei,gaokun3-ec";
 		reg = <0x38>;
 
-		interrupts-extended = <&tlmm 107 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&tlmm 103 IRQ_TYPE_LEVEL_LOW>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.53.0


