Return-Path: <linux-arm-msm+bounces-117339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Mv2NMIHTWpstwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:05:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 439EC71C512
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nNpiS+1d;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117339-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117339-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EBCE300E149
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FBB4229B0;
	Tue,  7 Jul 2026 13:59:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A7F3F7A8C;
	Tue,  7 Jul 2026 13:58:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432740; cv=none; b=iJHgI8RYVE/ap/Yfea/vzV6hWO+Byw3e4PZCvWbP7UBeWRF0eiSp+zzK3JBgDIVGIb6mUsA1ZXGVocVmS0jBNjToyqZEXYCBHsvKN6jhM5YuKnlNg1Lkz/ylughTcSLbb/TUt3o4WQMvo23rf1ifBKZ26DX8o6mWofUvWp7bHCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432740; c=relaxed/simple;
	bh=NZCEngLTWsZ+TXaW6jF9FMyVJxaddTCAY7oFCkqId/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k8rTeZXy/uyRCBRp0mFVcSgT7K1x3fgfQvWkhAQJ0SqlA2RBGxZptczMaNK4AC7Ihox1toP/v20rw4TE5jcPc9fO5lFdlZ0xt4RWPD0FKNTneleZYN7JZ7vX4ZFdXIKNaupve1IzGn1mw1Nc+T6FDXwv2jdJVb2AafKCxmf6lOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNpiS+1d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487E21F000E9;
	Tue,  7 Jul 2026 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783432739;
	bh=ZM3ysQE0T98txfx0FZctBpN8zPmp9t396+2XL3tlSyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nNpiS+1dRpffEb4hmrYsXa0bm2dwjtdBSmZIx8h1cfRQwWF9rp+XjEtikEMJsbuFh
	 1anKY/7eT6ae3zx0RUOVCVLP1q57MnwIx3WFjdt8Ep0dSVIVhEkIq0tw1L25U1vUJ0
	 itLRzDv9jUL8H0WsAUSRPXJL8NIPpoXd6+Bc2iEpo7supSdzveSodMtPPf4cRa9kJD
	 ThvpuHVLLMz+1vHcPghgykkzcEPBO8FZQX8U32xl+rkhnAS9MMEf2iRjPJCER6hmAS
	 DLMBO7XVTKES8QF39YfBP3YFfwhdxlGumtbRUNrqdmUCme741zMpmZskBj1mGzIGtd
	 mPcD2BmAA7ETQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com, 
 kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] regulator: qcom_usb_vbus: add pm4125
 VBUS regulator support
Message-Id: <178337731408.411051.8794219210214073166.b4-ty@b4>
Date: Mon, 06 Jul 2026 23:35:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NZCEngLTWsZ+TXaW6jF9FMyVJxaddTCAY7oFCkqId/c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTQYfNXR1Xj0Yu06mDyNmsIz7bncwKp1hTYbEW
 J9bV8QoFi2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak0GHwAKCRAk1otyXVSH
 0M6IB/4sRw9SSc+Buh8nMdoC+b+GFmkiBFRwby5AKErHSGHqz7Lt/YNyRdJiJI1GqTVN2aRA7AD
 bHawrPYsN6OgG2QmYcVZmMTnSMUv6vuDl1tjvtbvDxPJc6uw/ofJc/OwqjB8+tZ2u+l+6/JnFIa
 0jZFZhbC2yQVUYxpgU/ukrNlAytwKO1/KgupO60vumDcXBLeQvtCsQSX0tCloF8ZNpdOEyvP4/x
 Oa5q9IDnmcysA9wn/rF4NgIIZZgGjE1gnMvWNmqVPzHIrXZFzCBiuawho9cLkv+mcybUDoZiGhL
 1cojbdcI+F8w69Dv8vlYEempBx5BZh6vzNyYO1vsnyTRUOUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:rakesh.kota@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com,oss.qualcomm.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117339-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 439EC71C512

On Mon, 06 Jul 2026 18:01:04 +0530, Rakesh Kota wrote:
> regulator: qcom_usb_vbus: add pm4125 VBUS regulator support
> 
> Add support for PM4125 USB VBUS regulator. Unlike PM8150B which uses
> a current-limit selector, PM4125 uses a 2-bit VBOOST voltage selector
> supporting 4.25 V, 4.5 V, 4.75 V and 5.0 V output.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/4] dt-bindings: regulator: qcom,usb-vbus-regulator: add qcom,pm4125-vbus-reg
      https://git.kernel.org/broonie/sound/c/a58d2e5e1c04
[2/4] regulator: qcom_usb_vbus: add register abstraction and PM8150B support
      https://git.kernel.org/broonie/sound/c/56cb4a0e8e71
[3/4] regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg
      https://git.kernel.org/broonie/sound/c/d37664f99ef9

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


