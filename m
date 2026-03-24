Return-Path: <linux-arm-msm+bounces-99532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCxwGioAwmkjYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:08:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F31B6301896
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5646C30E4399
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF79C38B7B3;
	Tue, 24 Mar 2026 03:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgaLlWDz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC8C38B13B;
	Tue, 24 Mar 2026 03:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321570; cv=none; b=JCEroQH+li9Vt6/O91uH+6U5TohgybRkyfS9TfNNvwQxscp3vCUf24iSShooB8fgEmLoYfZYP1pM4tqDyt1jJWuz6cRtX087tanqZah1BQx75Chtx0uGZjSN2t0kya2Aqky/R4DoYP6FZsaTFJOxnNPLWHU9RTz8btkcZan/bgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321570; c=relaxed/simple;
	bh=TjPjoOX88qJRI81yccCILPXmNWA3/pC6xI7jZ0LXljo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lKYHoCF4mD5aiD0ybGiJIKwVimnYuKOQk1pAIdFMQZ1Nc9OTk5CjK2mnia0cJTDuhHZh4CLKZD6Hg9bPY/QJ/xm7nZWrAABkVgKqCsJ54hbxPtEeyhb1/Hqv74oKSZepDSERqkdcWFZyfLUVRn73gfzIUwo+8xYMVwVenhs+NAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgaLlWDz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDC6C2BCB5;
	Tue, 24 Mar 2026 03:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321569;
	bh=TjPjoOX88qJRI81yccCILPXmNWA3/pC6xI7jZ0LXljo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EgaLlWDzRTheUHyY71EN9F/E9irrRmV1DpTLP5z6T9gxmTigHXRW2QVNYd141RKMw
	 iApW4S9+42B/FY04x5qV8jgmMyNp595iIiWrddQ3W8faoJ8UgK3kiM/+qjA97m21Yd
	 A6XwfnlEen8jWI1zQc4+BP/qNZphX6XvVq6f17i9kKsIDw25fVzCVqFR+LXtjyiygW
	 m7NhnjtSG1oiFJG6NqqiLo9zi4VKsyu5ccxq9R0KtFKRJOKO82Nklfc4gErJEByMiH
	 gNDbU4w9TX1LLzJhAN9sfW2oSJ7WMpp7O/kJvIheZRu+K6brU8NPYzFag46qKfX62h
	 WGbtIeiQmzFKg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa/purwa: Flatten usb controller nodes
Date: Mon, 23 Mar 2026 22:05:53 -0500
Message-ID: <177432155630.28714.18053233967413890890.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323103119.1801139-1-krishna.kurapati@oss.qualcomm.com>
References: <20260323103119.1801139-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99532-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F31B6301896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 16:01:19 +0530, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> Tested this patch on CRD platform. For testing purpose, modified dr_mode
> property and added usb-role-switch property to the 3 super speed capable
> DRD controllers and valdiated both host and device mode. Also validated
> host mode on the multiport controller.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa/purwa: Flatten usb controller nodes
      commit: ab826cc75a90c5524522f5c015b9a18ae8df86a6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

