Return-Path: <linux-arm-msm+bounces-102598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIoUEmup2GkhgggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:40:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE313D3720
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 102C2300AB10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D641C3A1A55;
	Fri, 10 Apr 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DDqneyPw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574AD39E164
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806823; cv=none; b=AhEFddwZLGjZtCi0Ie6ky2o19BFfIXp7cUfR7lBV1NMULqt17SosWVRAPpE/7Jik31TyyK/3pz0snH8qqf6rR8LW4ptvv/HqNFhvZNgZu7JMT/+/IVAuqrmcLLS78tNKywwC2nPvmdxA0gLKYdkzuo97D3EX5sClNI/0DG0x7Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806823; c=relaxed/simple;
	bh=8UVGLM3tCk8JI921O45NinRZAOpPG+OzGI1sC+NEJG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=giarVf8nyHEmt0MI5SUFTb1C+CTTqmcRGRw7y3smQD8mpG51cgjcD4mceutVA43HyWwzwRNJdet5aktjttYgYZHLYIz96d0k2lvacD35STOvybiYYorspeFN20DkQyiVHQ/qvAmpxdhUZ9VsbbU9m+/V/UEpmaxB41f9/VgFikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DDqneyPw; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so2167042a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806821; x=1776411621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdQm+7qKkQGpWz/x294jzIY9WDuqqRzuW6cUPd5hDXQ=;
        b=DDqneyPw+A19EEwKb72/XWhva+QCysn8VkRNUpuyMzvHReEm8wronogJpULCV29X1a
         dQub90M4DlVhSSTYCWDXFl8sGKt7SlSrmhyZ4pOJUsQuVXU/Ez9J0ZzGXYQbTP+pKyqw
         NDyjoasw/qa/aTE3I1xWz9edsqFsxmbk18+/LGuQFZag8L2lF57F0DnTFl0nSrk/GGib
         M68cO33vggQPkkNeOU7D1hBr9VvcGElUvVZnJemYDgC+gIEAHtmifMjkwbp/Xai3TleD
         wkqPC6FjkyN5I1FF4fWvFa4VWrDO1qyHhxC7tTkG9Iia2DEtayXyShOS8IPqU2GhGJsL
         +vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806821; x=1776411621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdQm+7qKkQGpWz/x294jzIY9WDuqqRzuW6cUPd5hDXQ=;
        b=SyRdYrH/ghUWjXYD7hymI2CLoWKWcbko06vSk5X2rQDBBH+UpmLzMQ8k8XTtgcn7BZ
         /TmwhEdamrzJ5p4oI76pUbFRShTsvywQzX+/cHJ4V9mnYxmO8Ff45fuDuwrcwTdoYuvZ
         lyD91fZejvtQEJKha9sAl11ApQgPhsbflLaqoYlKA8DQDTQfr9uLI3UgyJYIDQzE/Q1g
         5fHMSEvtT4JxeF+vI3zKvLomJ/Dp0F0I33CEvLvSvS1gFR9d4ZqGHoEUmxp8935GfcCx
         Iai1UjufC0siYfXWzLT7nB9wXA45T8x0Jm3DAHn4jiOpA4Ce6biqv0Vb6bztMddyibhg
         D7Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUhMPOGhIrc0kbWBbSHm5EeKHeGBBD8DoNhxKz7Qao9rpmw6IKaI1F+r5KWpxQAx8xlnAVaRska2RfpSpCO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw85Lq9sNeQYQEG3H7Ol4AFaDteMNR0eorK85UKq5ZSMo2A0ndN
	Glpq2RCuNVNjVf+8Gy+rR1GDbEYJ6tA/pSUZtr3rbaJTGVU+izaJqHn42KEF5o4X3fY=
X-Gm-Gg: AeBDietaeHW/4JmhXvfKiZzoSUR0q+g9nQjXQ+kFBAGsJqmSGh+zucSPufT4icLlsd3
	hvc6LSBOzKK3ESvL3vz9hLeLJf1gaoUre3evc8QijPhUk/scMUg0nwmpuGLlxgzjoaABBeg4HK2
	YMIfFvDs6iNBfpRPZNJ60ZzHvzlGap0d24DnHXVsIHiLApNuvMbZGn4ZTmJjx9Su/bO80CbWZ36
	q83C6DFcihPj7Nsf/LSOBwB+w+gFcXbkakYBMhYVny7eX834SrKiZYU+J7EYer/4XfM2ywg2791
	jVqohlEl+4y6MF7utS2yVQrF1dAxrnF5PBZjO4NTd8sPTxH7YyqOdDXGervx7GKINMobRxv8Fxo
	de+S4ibhzOzCDAflkCrKS5TwXN22sYPpff/j+yO6omO4wAU9ngtUolEJ9/hSpuHXdudPwBHT/bm
	/yIx8+MgrxKdxBTa+6ddvxq3XvPDE3yE0TPM2R/pmIhUbnhpd5vWisiHmvjbldspmILouQu+a6f
	BuWDg==
X-Received: by 2002:a05:6402:4548:b0:66e:44e:3103 with SMTP id 4fb4d7f45d1cf-6707931e447mr686513a12.9.1775806820681;
        Fri, 10 Apr 2026 00:40:20 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815a1dsm400310a12.22.2026.04.10.00.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:40:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH net-next v2 0/2] IPA v5.2 support
Date: Fri, 10 Apr 2026 09:40:06 +0200
Message-Id: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Nyw6DIBREf8XcdUkQUNRfaVzwuLQ0ES2gMTH+e
 2nrcjJnzhyQMHpMMFQHRNx88nMogd0qME8VHki8LRkYZS0VNSV+UWRrCCPWdZIyrTvFNRR8iej
 8/lPdIWAmAfcM479Jq36hyV/TxUZ8r+UtXwOtEhIzT5PPQyWY67UwLbq6R1lbZqTttbPcNJRLK
 xwKLpSVMJ7nBxOCLQTCAAAA
X-Change-ID: 20260410-ipa-v5-2-df8702bb8a3b
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806819; l=1265;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8UVGLM3tCk8JI921O45NinRZAOpPG+OzGI1sC+NEJG0=;
 b=e568NAGenV1WUAKn4vo+K9IN+7el7pXrpPW+HhtT5w74qciWXF6gyyTjTzbDTHSh8Coul31XR
 KQx+9WomOv1DP0aQNzeQJd4US2vLaTjWPNIWMMudNGMMW4Hb7pwwlDg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102598-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: DDE313D3720
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for IPA v5.2 which can be found in the Milos SoC.

Note: This series has been split up into two, one for net(-next), one
for the qcom dts bits.

Changes in v2:
- Split the series, drop applied IPA fixes, mark as net-next
- Pick up tags
- Link to v1: https://patch.msgid.link/20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com

---
Luca Weiss (2):
      dt-bindings: net: qcom,ipa: add Milos compatible
      net: ipa: add IPA v5.2 configuration data

 .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
 drivers/net/ipa/Makefile                           |   2 +-
 drivers/net/ipa/data/ipa_data-v5.2.c               | 452 +++++++++++++++++++++
 drivers/net/ipa/gsi_reg.c                          |   1 +
 drivers/net/ipa/ipa_data.h                         |   1 +
 drivers/net/ipa/ipa_main.c                         |   4 +
 drivers/net/ipa/ipa_reg.c                          |   1 +
 drivers/net/ipa/ipa_sysfs.c                        |   2 +
 drivers/net/ipa/ipa_version.h                      |   2 +
 9 files changed, 465 insertions(+), 1 deletion(-)
---
base-commit: 42f9b4c6ef19e71d2c7d9bfd3c5037d4fe434ad7
change-id: 20260410-ipa-v5-2-df8702bb8a3b

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


