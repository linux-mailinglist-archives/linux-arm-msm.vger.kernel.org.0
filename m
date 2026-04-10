Return-Path: <linux-arm-msm+bounces-102606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMMFD9ey2Gk8hAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:20:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F583D3F83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABB753004602
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52E43AB289;
	Fri, 10 Apr 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Y6jBYKD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09633998
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809031; cv=none; b=exE8F2rOQfd2ZifLY3wjUWbESS0Ecogae7iMHPVAve60RUWQvngYrZ3hLkQQ/kOLozEsCCYcvWkh4WPRq5OPlNEZ+im4p27pTdyAdcXBdND2opdgtr5fjQ+ni3mmI20m+sskvZg3iloA9tmfGikK+9Nii4CdLCnxHfOUdMv5wtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809031; c=relaxed/simple;
	bh=TytkM0XJK6cpZlr6ajNYzfLfb5VWH8YjMrlyP4DuW3Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PRi4e05IrE0/0npTEWzPDHUbvB/cvjSWyt3Bd/fJYOHSYiBQQSSjdgEpTZhEkscoytFMBrDuFLDQ50BLuGQuLz65+xc/cGyawUBiUb73ESc6YYgZsJ6uIUnh8sZymVUAglaXt6IyufWq2pxeRmTmyLDLIJCBBt8q3lGXMq+PrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Y6jBYKD+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67010289b73so2469542a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775809028; x=1776413828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xE/5OZBL7V7EOVLmL+MSBtxCzuDnoarAuDjHIXz3In8=;
        b=Y6jBYKD+fi67WWtqCElyvWE0KedUoCADor53MSj8Pj/41A0kZhL/6ASg+aPT/Nu0T3
         6Jg4DY1oiOraIcdjhrj3VEgGgrQzBDLYX8nF6S1ppQq4JJ/Wtup5KPl+I+xEjgF+BvHO
         Piufh0dV8Lky7KRvaeH1reCQKopOUkzoQx/TFZSDkQWhH+0eGmnqnb1sa21kAtMYL34v
         1E+3ALntsZINHNXUP1S5qClp3A6Vo5SyKPXVQBxjqgtAZWNErw3paFQC+Q2sgE2SH2Rj
         31ETaWv+dIN39miNmsa16t+77Vxv2it4XmKE537NxW+bcdU4sqOgsXzojk5xD9KvjyRI
         J7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809029; x=1776413829;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xE/5OZBL7V7EOVLmL+MSBtxCzuDnoarAuDjHIXz3In8=;
        b=KYFPq3vi3kZOL5eylDIUBu8VRDQJzJn6GjlBFbU7LiJ49v4lNs688JlQh61t+/8f/3
         M6D67YMLpc/tpI715Zq4iunNOKRbhm9cdvs/0hXexejyAaSA2dvCNmPt6+E+p2mSuxQa
         heJzNcuAs+PKxGANzi98ayi+gHjIwZxfQLcDxbTJnx6OI/oLOQQI+d5eDED0juy0jsT6
         6u63BZBQwrg99e/BLZtz6HfjDJ3vZdVHATRlAWkP9nFxuIq6mE6Doau4Sl80WdS6oaGy
         fGuuykVGJBSRntmHhOVmUv8FZqJJgaE19N1I0ZCILKhiPohyFUZ1kM7r6FSW4XmTXMiG
         Kirw==
X-Forwarded-Encrypted: i=1; AJvYcCWdJeH1zOCtmNjGPMxuGFudgTGaehr3nOBJ52uMudpvDIe9MWgix6AAsK6KkeQfFjAsF0QGNVuE9PqlnL2I@vger.kernel.org
X-Gm-Message-State: AOJu0YzW23NrrbevMTCUQk2buVopwPNApypYQ5QjZDvsxhYGxWd+90Rq
	TjF8kqMWDck+Cjss3DgGm46dTLhC0daVKOuhm47G9mFVs7ad8WW6XCHlNwuFpazlm04=
X-Gm-Gg: AeBDietRWh0Myd3enPHMJxjRBrWYzpslqrP1FspeeebD8axMLaBsqDU/TIPYcIPS7pm
	u9KUZuU+m4rUg97+U+gp0T9N/SzgUqadYVy0xV2ZVw5fjLwSSckuBWqYylUa7Xt4q14aCuOkcY9
	XMlW+KPfCP6zs++/7CagA8G7jQI/2JMx1xXa1sP9H860Xkf1EM45g4HZ+4r99VX+6Tj9/eatgoU
	ZKEpDCBzbm7EMxdhHIezqcVxHHHVkWCcheIOLwPODTtA0XEgfZoHAcC148r1RNVlSZVPmxG+ZAp
	cegKahTimC9gnoiIsoj23G6cvgNBykjioOa8tOQ0y37R9ztcse1LWLT8CC1vvevMXELH2F2n0Zw
	dEdPljrlCvqCgpfS+/whipb435YPyKMdOMLnv957uGuqDJwy+HZdn6MAqqqL8X1N4ywT7+fRPHJ
	ctVX2pmKAh8Xyelq0E9omQYfpZzsRi0jVWfRUYqQ6dWjzHjhv2/sEmeisYwdGJFvn3qFTBh7IwZ
	F6IAw==
X-Received: by 2002:a17:907:1ca5:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9d724995a8mr129813766b.6.1775809028467;
        Fri, 10 Apr 2026 01:17:08 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c7c81sm58488466b.43.2026.04.10.01.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:17:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] IPA v5.2 support for Milos and Fairphone (Gen. 6)
Date: Fri, 10 Apr 2026 10:17:00 +0200
Message-Id: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4XM2jHlJcrK/zAsCgwyRlpsC8EQ/
 t3yWLq8ybnn3hksGSYLeTCDoZEta+VDdAqgaqV6EnLtM0QiuohExNjxW1vkXiKlmUilvGZRkoL
 ne0MNT5vrUezZDuWLKrcKDsLQZ/AjbseglJaw0l3HLg8UTQ6PoRusipat0+a7vRvDrfHnyBiiQ
 BHSjRIScR3TvZFs+lYrOns3FMuy/ABUdUSI6QAAAA==
X-Change-ID: 20260403-milos-ipa-e5705aa87245
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775809026; l=1305;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TytkM0XJK6cpZlr6ajNYzfLfb5VWH8YjMrlyP4DuW3Q=;
 b=c5DAttZVXDKXca5dJajEtYxfhBKCO5osIy0dsjRH5EDX0HDtg+W3WNHQMweVWMDf+CCPm8lRE
 4RYcCxofdq5A2gi02Fr4PAu6UUH8kqrcHmSd33ExCsgRxBtI/gTHQQk
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102606-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,msgid.link:url]
X-Rspamd-Queue-Id: 98F583D3F83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for IPA v5.2 which can be found in the Milos SoC. And
finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
starts working.

Depends on:
* IPA v5.2 support
  https://lore.kernel.org/linux-arm-msm/20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com/T/
* Describe IMEM on Milos
  https://lore.kernel.org/linux-arm-msm/20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com/T/

I'd like to have specified these as b4 deps but somehow b4's behaving
quite weird with this series, adding many thousands of
prerequisite-patch-id, so I guess manually will need to be enough.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Split net patches into a separate series
- Pick up tags
- Link to v1: https://patch.msgid.link/20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: milos: Add IPA node
      arm64: dts: qcom: milos-fairphone-fp6: Enable IPA

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts |  9 +++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 44 ++++++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: 0190c2c6dae368aeb9bf59a449ebe23f24bfa059
change-id: 20260403-milos-ipa-e5705aa87245

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


