Return-Path: <linux-arm-msm+bounces-105295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN0FGlkB82lswgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:14:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7BF49E78D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06689306DA4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9F939D6E6;
	Thu, 30 Apr 2026 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VODbNhUh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FEA39E175
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533061; cv=none; b=ICwCKhlDx6eJEVblnGLHmFi7rTCkpUrCtsQFvCP8MuNFXTr8/l+oFnKjfz+MPXdOOFZcZ4Xx62MqKqf8lbJS0FP9zi7fb2t6C0nZqOg1qZSqb5qw8Y/AhF1NOL+fXC1r02YnqoomF17nTvDLNkJCVPV9DYF6ZIuO4ar4MBYONXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533061; c=relaxed/simple;
	bh=oZ3hYpOlyjlAu2278aiFXESG6oi7YvWn82sNwQdQAP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kCzeiHUU6dvi0yaaLNQQpiP4t76St0cP52skk5fv168WVK9wZVUKeqvKSN8wJHkVM6ZWhJbJdNtJ+KRWrTmwlsWAwyBdw5f+tb2JbopVdcVYNPTUn4hh//kkJSpBG2ZYl3ErywOVVvKoFR3bYYC4VYjTnKjLHsmU4hPOwcw22uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VODbNhUh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso4063645e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 00:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533056; x=1778137856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPu3RWNcjFZI9rac4rwEI7c1s2vJiCf0eXVgZgLzeeA=;
        b=VODbNhUhZ3JRsSFXqxR7ajYR/J/ppN7xF7APpx5guY84on6LaYIh1pci9w5cQngOp6
         bxnIFW13x0Stikv9uS1WL6Vs9uv/VxA2slTW1AMSMAQ5mL/lnjtr2NaBAWrwFTzgjgWH
         iXrV8ucn2kll8/rqCFCJc9i42MqR6ZO04+5pi0VbI0qCRP0JhbfWFqPpQry00eDYwD2q
         MmeEIKI/gqwgsK1qHhVx9sI7nO23cBUdlfWRRQbmIhaTswQQzHau/TB5/Q6WfWPbJIt1
         4bElSMrQlQc+Zxwu0qz4Pn5XycXfPxI7TytISZYO3y/eyeuduFsu1cVRL8Ueth/iBEwD
         2u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533056; x=1778137856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPu3RWNcjFZI9rac4rwEI7c1s2vJiCf0eXVgZgLzeeA=;
        b=VKPhJdQBe1g21sVCG02jLhZgFRIlGBmRyeP67U8HHv42Bqtyoun40Wr+ANZXN6e4Wq
         ibO6kDR71mxwwnLAn6Z1oDBIP8mqhM0pqJczk3oZF0jy7TnE8HxaGQevntkjCahDTYG0
         VR6h7BKcF/ufU/dAr+BqOKk72fkvp0lvuZx8um8NOUW1lg8hOeDw6A+FEFXScmkM8bWT
         uxAIegJb/qfxlILp8XG2tLJhNeJTgyM7VT9sxMGZ5EOTLPPXriLUw1fPF18fRCclg2KS
         hO3dFx6otC/oH+eVhUydk3eQPdFopKsWG/f5bVZ1k57oQV3wvrIRWntLt/eDgGkIjoj2
         uyxw==
X-Forwarded-Encrypted: i=1; AFNElJ/2WHL5tcNXORW/qqMET2pTPswuojeNweEWL9JlI8o+sUeZpJ4eWa80zO6i2Jp/MCW3OTZ+I0MbmoLKgnwK@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLwmUwZrBV8bMUh0sFjPr7Y/9wPxQM1TJJLqz9q8iLLs1jKxC
	T80AGT+HDJWuE2JpYz/BE85/oZiBfZuHlL74YLuVNWELK8zOP4UbeMIQJ7g1LpeR1co=
X-Gm-Gg: AeBDieuq9yxr+u9faTY1puE3FyfykSd183mfZ6RvxCuhYlv3LfptgmeGNe9iMWhVb8s
	4e/ZczHx6uHaoonERCWisQFP5AWiXkrznmFjO1tvnLLyL42ey8+38VO1JgFTBKGkKfu8lhWlfoT
	qmeoGzSBvXcISXp/80sae70pAb/X04VuvgnBCJ8zSniDgXOhyOyOoPuQ1yK0IufA1dqJCMaqnm0
	3XyEK2kWl6gvooh9ku+ML0EW+tghqcPGi0q9sAIM+nc5mn7DQUTRW7uqqsGeQuvf9q9h/ovLLdZ
	hdRbAwZWKxPTnubtXFFlt7nToOO5RUoujWbhh7Ays0uwUt11inKmh6h2aoE2haIWOlItJeB1SfE
	4bf11u4dBJ13iYo3ZVV0zAy0Z+tINre0QmtkUIScOtMoq2LsC6j4kb6uDZp0bqXR3fJK+ECl+wa
	2f8SkvirgEFZh2dXV9qSR4JW0aVl7yhxGdQNackowFZuLBRD0Rw/PX6eRSFEoGsNdmqnk0ONqVu
	dMKa39U
X-Received: by 2002:a05:600c:350d:b0:48a:57e1:d8cc with SMTP id 5b1f17b1804b1-48a83e7055bmr29150115e9.9.1777533056652;
        Thu, 30 Apr 2026 00:10:56 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:45 +0200
Subject: [PATCH v2 5/5] arm64: defconfig: Enable LPASS LPI pin controller
 for SM6350
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-5-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=846;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=oZ3hYpOlyjlAu2278aiFXESG6oi7YvWn82sNwQdQAP0=;
 b=xad101UiCBqCR5XMnrmHZ5A0H2inv58PbwoxwJ1BifMHEpwZu2cxxBPrjyFkP/o232KkdMkh+
 gT2JdEqzJLVAiZh+7LpXoduaGVjaxXpacZlUQg0vxWrATb8YTEv2vJ6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: DC7BF49E78D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105295-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Build the LPASS LPI pin controller driver for SM6350 as module, which is
required for audio functionality on boards such as the Fairphone 4.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..6b0be01af7a1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -705,6 +705,7 @@ CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
+CONFIG_PINCTRL_SM6350_LPASS_LPI=m
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m
 CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m

-- 
2.54.0


