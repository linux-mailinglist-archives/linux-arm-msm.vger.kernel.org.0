Return-Path: <linux-arm-msm+bounces-98498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEitNv6xumlGawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:09:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 431BB2BCABB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D5DD3190267
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16C33E716D;
	Wed, 18 Mar 2026 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaRUdEM0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2203E6391;
	Wed, 18 Mar 2026 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841878; cv=none; b=WhnGqP8OokQHt13sudRVtK3Jq7tcy8cS4e9a/EcdBNXnrzk1PbWX7cYSnT5D3nkZBGBzWLlpHe2G6C5MiVB2ih/HRyppcC+LQfg4NQwAgVM5CIYgedMyFPpgfnJ3aJzJRmljYfe8uwbiBKrV8YK5l/LNi0FHc3XfNbezVaTARcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841878; c=relaxed/simple;
	bh=NgFCyD93QvS9tG8glqI7VKoCbWTimTFIPCfv75Xlqno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/pS8gDD6QTzTt4wbiJoqwkpXyh6r3L94AsszBhlcWwtPwUoeGr8/Yk2rsEZ+IMoNyUjFm6ueAOmG8pPxElsrtOoyz/4Zw59wrTYu649HV5BQ4m+JQEI8yQXIM8dKTcUgts457ZCPxC23C8lgwHxk610TCJrxrGhIhOBVOmDFUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaRUdEM0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A17C19421;
	Wed, 18 Mar 2026 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841878;
	bh=NgFCyD93QvS9tG8glqI7VKoCbWTimTFIPCfv75Xlqno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UaRUdEM0hsIdzbAFTG9bUP+ysTjC87okAfIm54VBqZ37M3gAmNqyTv3+5An7lJEiU
	 W0IV6wSwb37Try7iAAYsic5FZ1Meh/IIi/zk7HzrU5suAbgcxA9Q7MRpx1sNqGD55w
	 yHRM2U4Od1fJWbB24ghxb+BUJf8KbqKXIKVLe7MK3JZMkfFI0vWutT0w9eF3My3k1w
	 8P9c76aAZgFjA/bmGYRtV9Ux8516rO03gLa3xEDRpR2UxaL+EhVS4tm1LlMB3giSzs
	 DmI/zBSzizco+8Egd3UY+7pQeVWTgnMs+S+py697IcrAJ2Ue48jge5vuGh4mWZOdBO
	 VvcItUQY6/V1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximity sensor
Date: Wed, 18 Mar 2026 08:50:29 -0500
Message-ID: <177384182918.14526.1161243063385825907.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
References: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98498-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 431BB2BCABB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Feb 2026 16:43:24 +0200, Erikas Bitovtas wrote:
> This device uses Capella CM36686 as its ambient light and proximity
> sensor. It is fully compatible with Vishay VCNL4040. Downstream device
> tree reports Capella CM36283, but upon probe, a device ID for CM36686 is
> actually found. This commit adds support for Capella CM36686 ambient
> light and proximity sensor.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximity sensor
      commit: 83a06a3afb36818f09d68490d5939e7e56cb96d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

