Return-Path: <linux-arm-msm+bounces-108252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIUgCM5MC2o7FQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:30:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95023571A04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79F11301BA5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77AE380FFE;
	Mon, 18 May 2026 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2YNnay5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A12367D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125451; cv=none; b=QaAcPKiern/xxD4YRb7Je+bUMp6gGJmods9CTb/XW9EXhMOTVrgzyt2C/gBxEl1IOZFV8btVkpl7eHKjzTS4+t8bjEQ3ay6sdFrz9Gb7p/flv9w+OthVzy4MsZeE+hvuve7mDk1EDuDpj0Or/sWIm4FRgcVDIiNTTx7OWPXjYJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125451; c=relaxed/simple;
	bh=xxm5uRHiBjFOoidP1IRVOoUHiKnUXvtH8p3F1Td9iKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEKYGFgWg3r95RqEZl5AtHmcqmhyNEuZSKt6/3l0QxZODcLWO64PfVDdBDZfazLlANyhA3E22KihlICIHNKjBS175PDYU/T0iiV2zaYfAtsbFu0nTg11+UNH2gs8koAAYALHvVEwQ4YKmcL4orPu9faW3mpVZrzy7IMVy/AHZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2YNnay5; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c80170db7d6so1077598a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779125450; x=1779730250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY2Amf5TmkwuaOKL8bqWWAMF2lfr2aUkj6b4cqTGIP4=;
        b=W2YNnay5FMp3/jscE+x+wYdtw5GrOpaARjNKeTm1gOHUvfZ+C2+hYjKPOk2NFEnGl+
         HuiLMfXk2cirg54XTGMUjJpGBgafnHNioItY2afLIdqFWCBOHsggb4drsufsPJPse8T1
         zrk9K5QI9Thrs5nAopgcB7wc1WYGIG+rcYjHUnxXt10sS/N3/PV/hdIAt1ntQr4heBXb
         e/t6S7rJKWu5xt1xaXqqOWxOiqs2nqLs2fTdFuqgNY59y0Y+UDYTomvRUaDKK/ub2C7T
         q80zQNuQdAmIqaFe3ZArWMqR18BwhcPh7rBetO+JFaOm3KtxNa9utlQyncrkvYbuILzH
         d4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779125450; x=1779730250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kY2Amf5TmkwuaOKL8bqWWAMF2lfr2aUkj6b4cqTGIP4=;
        b=AZzxNWLoMc2V2ql62x46zHrn1fsBgwicJt6e5aT0bAUiJWbAFBs5ogw/m0kqf5T79D
         vhxXZrBizjWk9zoSNjDGo9TxLlUHAjvHd0PfqL2+zTFhh5LzYyab2W2ttse1VE4tMrZ6
         ou5BER0jnDVTpLuAA3r3q1pYTvUQQl/UjT4twIiWT8+UcZ/ysdofq2stkHGWlgelwFeh
         oeJq3KWyPVi0cZoBeetzNrZ1t2+PVZDH6Pf5MTePOOJ53l5gyP89NSX4GecjZuxhKfUt
         VTXA3PfXLg/eND0tFUQig56IgXsklGzDQz0ECl2X/yuWOZUg+bAhHKvhm+vYgWCkwGp4
         DsWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pBPJvfX2h4DZx5pKSXeRdEgVPKSb3LNtgmAOiRphk+Z08i4ALmkSNnxF4120CRK5CrC6wKuEFeGcNPSl8@vger.kernel.org
X-Gm-Message-State: AOJu0YwHrObPzoIjnvpXhcK3MkQSocNfhrnjxXPhvM1MOccN7/8uXbmE
	ZWiEcX3j5IjHM/odzK/lnV8G/5omnEhXHqvBAeIjB++rlfwA3LLICq+y
X-Gm-Gg: Acq92OE3Jc0ZI0miCOZ8V+A5VtDpNPZMNnIF1NR7ANG7YK8I15lpWWm1MO2W1iuqEYE
	TXc8TABP8WoOcLllarKhqk58zcL4oqTpfTeA+NlI5ASKv8S9kEsc7bJBvszTQ9JOqXRn8Uigzec
	nwisJWHmD970AQhkv4/SMxiap5vBrS4ksqI1GsV14E7sQsgB82hHFAbldzJP1tE9CwSNaodrQWJ
	ciwW7TWOBoMsbaZFDZ1vO+kX+HGeIGMXZMtnMwCNi2KdfR1YDG2iUQT3fco2ES+e0xVMkZI5o3q
	B+gtXEZr47XzQa0+7syRU3GXzkU82XsKi2RtOQFZxgPXHcy3EcIF26IkZg42DlKjom7N8DVfpfl
	ZoY+nG0vZqyNMejbHfgpJxzAZ1TUFKhfdmVAt+BITdKpn51Yd1LsCLTZ9vuK6J9EYfCpLl7p7Kz
	pAK2xZPWvi2pK/Rl9w2cfgVMO24nxbR2uK6kxubGEMrSUnvCdR6MEZZ3XQLdU0
X-Received: by 2002:a05:6a21:e097:b0:39b:ba95:b128 with SMTP id adf61e73a8af0-3b22ecf5a75mr17218091637.50.1779125449986;
        Mon, 18 May 2026 10:30:49 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b5:f305:5cbe:64f9:8c32:7cd8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb116860sm14118696a12.25.2026.05.18.10.30.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 10:30:49 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Mon, 18 May 2026 23:00:36 +0530
Message-ID: <20260518173039.20592-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518110435.16262-1-blfizzyy@gmail.com>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108252-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 95023571A04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial support for the Vicharak Axon Mini, a QCS6490-based
single-board computer.

This series adds the Vicharak vendor prefix, documents the board
compatible, and adds the initial board DTS.

Tested:
- debug UART
- eMMC
- UFS
- SDIO WLAN
- USB 2.0 host
- PCIe

Changes in v2:
- Drop unused Type-C VBUS regulator.
- Drop invalid camera thermal zone.
- Drop incorrect PM8350C thermal alarm override.
- Fix PCIe1 3.3 V regulator name.
- Drop redundant EUD disable override.
- Keep ICE disabled due to fatal SError during qcom_ice_create().
- Fix pinctrl property ordering.
- Sort top-level label references.
- Add blank lines before status properties.

Ajit Singh (3):
  dt-bindings: vendor-prefixes: Add prefix for Vicharak
  dt-bindings: arm: qcom: Add Vicharak Axon Mini
  arm64: dts: qcom: Add Vicharak Axon Mini

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1055 +++++++++++++++++
 4 files changed, 1059 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

-- 
2.50.1 (Apple Git-155)


