Return-Path: <linux-arm-msm+bounces-118819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EYuPCA8BVWr5igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:15:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51F74CE3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:15:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KhwZtfdG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118819-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118819-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66AD932289C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EA03876A4;
	Mon, 13 Jul 2026 15:07:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6AA375ADE;
	Mon, 13 Jul 2026 15:06:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955220; cv=none; b=rsqI4OlM6O3OCDgYPABxVlR++qDwkpeJuMCrdVs6Fr8Ifpv7IFFc9G1bHhD7FYiXDT5kttObYr/8gWV6vEXYGXPudcvMC9SPkkeylK0B5zPsdTJmQIfmUHOF+Pcz/pOg9eTw/YPjPn6ELZNgeSgmUdaWF6+9/weS6iUG3YEq+bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955220; c=relaxed/simple;
	bh=TdudvA5Q+h7Noq3Lc5D0+IandJlVT1flU12QON23Bm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QcNAJ3N/24SUJ8PpOXbFufZehbi4wHAJ9m5usgglNaRQoixBKsbkt3Np1W1zPqa8uFk4N0r+eBA6y2yaN8m0V1igF7ZaQNpl6XJtq3z/PON/tcFGqmqB9KBQhtV87lf7cG/Hql4HaMW8V8q6CwKzkOMQhx3/KDKjgxVZeTZU0yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhwZtfdG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE611F00ADE;
	Mon, 13 Jul 2026 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783955219;
	bh=txoaIEfKGWc95K/XrhOPLeITofq9U+ORZqox2hXU9iY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KhwZtfdGtezmE6FE/SQKOdAe3qBlmWwN9uv3DkFBIHPl+pQ1uC+ea8mCubE9gZW1r
	 2T8Nti90ovSG4NHuxZWNJo+8Goah2v9Yk+qZSN7x2pazUorwdS1ldX69yaNxFwacym
	 SmB4PZ7s9uxfyJGH4E6IUiGnjF0yQy97+ufOwLNmrEhjVUZY24bQ1YH2vFomqu811U
	 wPjWj4HeSYc3Fevd350uLTUafVyZhIpAn8nIYArRyimS0ekrUPPic41ZZve9JX6/ma
	 C2mGt3Xc2EpuBBIUlD3yajg2dWIofiCrWGz48gIh1TAb0biSEKRqF4RyJIeqfRdX8W
	 qcIYjelmYDmyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable PMIC Glink nodes on Kaanapali
Date: Mon, 13 Jul 2026 10:06:52 -0500
Message-ID: <178395521266.422064.7409768624225091838.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
References: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118819-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF51F74CE3F


On Tue, 07 Jul 2026 10:37:16 +0530, Krishna Kurapati wrote:
> This series enables PMIC Glink nodes on Kaanapali MTP and QRD platforms
> for providing role-switch notifications to usb controller.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink node
      commit: d0ada7b78e74becf8e7fe6fae8392f1731b52896
[2/2] arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink node
      commit: 987ba6986860a07a45e8d79436866b4aa92be8ec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

