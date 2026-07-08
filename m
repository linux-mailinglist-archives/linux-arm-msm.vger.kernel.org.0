Return-Path: <linux-arm-msm+bounces-117734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q5TZHOpsTmr7MQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:29:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A272809B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:29:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="cloZf7/H";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117734-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117734-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 942FC317F9C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DFA42DA2F;
	Wed,  8 Jul 2026 14:57:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC273F12C9;
	Wed,  8 Jul 2026 14:57:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522666; cv=none; b=ZwE06bM5b0eCKzmfAD9eYyaX7eWroe+903IVHUczmM245KUiAon5Csvq9FPcr9AjhjVbbkxgdU+e5Xd7aLx7/JrXHEknyTzY+DedqEraB67RECW4LRzJdSbVo/31VtC/SnQA0kv2eF4erX+lKStkSJktlNHGmE/OzVMc5kUVNoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522666; c=relaxed/simple;
	bh=kU4xSznuFl8uM+V/D740o0dwPvvezhGu5J/RYfPw6EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V5QYv5r21rA/KncY15SmxDr1Uy485oFQso1EJ6WhBVDFL4Yb0Zorm6wAxbOH77avnD4oFQ1hWvnhrgA+9smMlWAS7XjNmcfsmwhsz9XlJmyI3FdssozPoSDDSlISf537h6x0iwmK8QiZFxrL6DBavNnTYa1rQgd8eQmtTGc0BEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cloZf7/H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD43C1F00ADB;
	Wed,  8 Jul 2026 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522665;
	bh=8ch4yZqPCBcSimke4UhZ/cKB24eMRKtvV+Ug9A6IshU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cloZf7/H3zxW0nNpvL+VD5qbqwPCIP53w8HydPYGRqe/0zb1Fe3Jk1YZL3XnhCEsx
	 C3Dl5cmtK55Kt8ZBuF9wk5UUtfZlI0WWuQ0u15iakHk+4n6cwcUi8W1CeefIxhZ5Gr
	 VC9dWfVlLKZXld72QYQUaaXnzrByXTiirA/ntgNRCfiSSdJfJRtXP9xf5d+4AF8vtg
	 hLji6D0luCssMWofC12YUArhEPMib14A7kPVN3JWsVOu7eo5dhXF5CL1Dcyart99Nw
	 TPhUQ0teY6Z08ORW/9Pm4FKVRsdTstBdLn8yKo4RJDu6dtDxsNuD2nQyKe2XnChwhJ
	 08bYz2fMY4/fg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: sc8280xp: fix and improve pinctrl
Date: Wed,  8 Jul 2026 09:56:46 -0500
Message-ID: <178352261645.2235436.7506953794540668934.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629065905.15651-1-mitltlatltl@gmail.com>
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117734-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E73A272809B


On Mon, 29 Jun 2026 14:59:02 +0800, Pengyu Luo wrote:
> Add camera mclk pinctrl definitions to sc8280xp.dtsi and drop local
> and duplicated definitions, as this is common for sc8280xp based
> devices. Since the correct drive-strength is 6, fix it too.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
      commit: 06f07e693cc33d5d9695652f679c6321a751020e
[2/3] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
      commit: 6e2f2454640b21db48d1f1bc8a068a8862d6cf1f
[3/3] arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl
      commit: fbe4faae9869fcb03884c078187f985db693298c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

