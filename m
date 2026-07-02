Return-Path: <linux-arm-msm+bounces-115831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NhEjCKEDRmp3HwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:22:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BAF6F3C2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:22:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=COvCyahG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115831-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115831-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC46830C553A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6127E384CE5;
	Thu,  2 Jul 2026 06:16:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248AD37E2EC
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 06:16:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972969; cv=none; b=HwasIr3IYBqdmiorlTZjt9NaILI6+MLGRQScz+Z9ezxb4zxbO7y4ahocQC2GhyJ0AsuQqg3EnPCMfhhDunmlx3RWBt4rx/hSYnOIrXeilkLIYmy/Ry0dfKiRi3UKdQN6YmRGxKzZu5aIoBEcp0f5/b5x3JkfChUnkojn46QUV4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972969; c=relaxed/simple;
	bh=tPzODcf1BwslfWndQavFqn5oqaGNxoe9hMu4eVzOQ2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmbvQTI2yF5FXeKICq3esY5ykSnEAs5ymD7Ls58B4PY6gwn43Cwj4kTYDltm4LFXQrGkRXhAAnyqJyL5c0B84daD+++t0vQBxB83DEXMaLYATui6HQScQVMEO4H7K7g8c7SOXXsDMvZ2M1u1NUSGyIj/7e4TEzW+4umEiUhJJGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COvCyahG; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c821a50615so10239805ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 23:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782972967; x=1783577767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqD7w5zDiKR2ICjS7cVkhir7NR6XfZKcMKDb3tO2AjI=;
        b=COvCyahGrIBA+KDCRB7RZbgaTinSoWBYrtGYwDh7OxjL2u9LJhMLUuyI7n1fp6EWeZ
         4bkSJAO+R1FTJ6jcD/d5duPOrjJVK8+tdXbc1g9nYJ/8LYv7O/B3NBrRlLayUSw5Y6vq
         5tBJ+dMSzGkKLggeEXxapXGDBPk/x2iuNzJQ3BLDPLUMBdM0r7s/p4+IqbbTZYzH1Ajx
         2aIZgac51T7q6lLJiamgOm4dz1bCxNEuaT50Izj4KetKUGpH3s4gVdgNNT8VZqscbvaQ
         GHmDXi2+s/T+z+LMUyrkUwK7ldEcW2kahp3g0WUZ+yONMhvWIomEsXwQpJ73hRwuSrnt
         iaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972967; x=1783577767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqD7w5zDiKR2ICjS7cVkhir7NR6XfZKcMKDb3tO2AjI=;
        b=WPKtp5Ka+ycLTnCcm/xsniHK5KkAGtTxswHNwkTbO9rKpQ+kz8ePqyKC1VbONyHPE/
         /z1v8d/0kIjq3WAtZWVPwXIlMxHURf84K246WeDMOcBoHfHBZ5qZBmroys5kZHj8GdLR
         DYdUpGE3IfW+QiZO32ZDJwjux1ldfy7t+6iKY73KWBhovHvsrK3VCJA0siz9iFf/r/XZ
         dZvUi5N/nqGK6Gg2uvpz3GTHLQeczbcM/Tf1h5qCBESnLR7B6QBJh3KIj+39BeFPH7fy
         s+GQXrrUbZj2f+yf6rG5x2T2fWh0gjHk/2QBinDg87vd0KPzVcmY6E8SZZ1IUkxDvsRJ
         5Esw==
X-Gm-Message-State: AOJu0YwBqDtOWUfR82UNVrZQfaXLOH66hKO1PmUUfgDkO/VoJjPfxDoU
	I4tyjc8eixHjsUgotWq0aVp480larOOW/+jOT3OeRCZkafZX+ERCR0V3
X-Gm-Gg: AfdE7clp4d0AZjk0BEL6z49o/3cfwSSRYS5TTqGkeo1nCl1/C6DwRrYEcIakkf9nQfO
	vdkImMjtXC05PoAiCeKwrZk//DpZTIWBD4/z/gLxDwpVHDrEaNjmbb7GfAYUGGa+zhxVtW8EDPR
	2bSPsf54WfZyY18+qigO9+zVBFbw0WqaJXJLUHgBpeCZN/zmkL5Yl6pzUlAQw/DuJH7qdC9IwFc
	KJAE2IMWVqVAP0MbZf/T/F+5e7MEpNOuFGXe6B8J9PnerjjzNzGQQK6YVwx0DWtArpY8VdDUrO7
	PPNQHAA71NzJB1vqn7lp1RlRO1jsnZ9fIls/X+Tdy+BGVO2EC7TgtMSo2bUpxUjOjhf0n1iewOG
	z2PR/+oKrEoaNEuhfEWjFPz2aHrCukAZeqJcYnlDdx2tyw5uXFQh0hQibk0p2RZsWCc3z0tgIbB
	uZBQ==
X-Received: by 2002:a17:902:d4c8:b0:2c9:bd3b:34f with SMTP id d9443c01a7336-2ca911f344fmr40112295ad.35.1782972967138;
        Wed, 01 Jul 2026 23:16:07 -0700 (PDT)
Received: from ada ([223.119.20.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa052d5sm8316025ad.78.2026.07.01.23.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:16:06 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Thu,  2 Jul 2026 14:31:55 +0800
Message-ID: <20260702063156.35169-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702063156.35169-1-kaipeng94@gmail.com>
References: <20260702063156.35169-1-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115831-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:kaipeng94@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kaipeng94@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kaipeng94@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5BAF6F3C2A

Add compatible values for the Acer Swift Go Pro AI (SFA14-11),
using "acer,sfa14-11".

The laptop is based on the Snapdragon X Elite (X1E78100) SoC.

Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..6b997d615bad 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1142,6 +1142,7 @@ properties:
 
       - items:
           - enum:
+              - acer,sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0


