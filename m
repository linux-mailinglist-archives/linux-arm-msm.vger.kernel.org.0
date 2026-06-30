Return-Path: <linux-arm-msm+bounces-115509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GBRuLxTuQ2rdlgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 18:25:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 241DB6E66CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 18:25:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cdzZmh0Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115509-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115509-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AEC2317F5C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377B24779BF;
	Tue, 30 Jun 2026 16:20:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DAE449EAB;
	Tue, 30 Jun 2026 16:20:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836411; cv=none; b=Ye3B9+xpL2qPMY0advDYoivJK0r2DqViTVhjKp2WxmOiHXEuOO5vVxDwgeqofEgU42ZpsUjvvBh3Hwtc1qauFYXwmjtEDTq+eOemCpJcJs3pQwGumhVyAmUowbWWDXTe3wXWv+9QhZGhoM7vgppUB6fJrTbPWgfdUV3kW9LIl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836411; c=relaxed/simple;
	bh=F1R20fkgS9FDrCRbd2sWvfAZ9KG3366EjNWV5FBU0Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXklkHt7JBCi/J3h3w0ajVmVC5NjN2MdygjDrPTiRM1tgEOsECnyi7amy8bnFJb0KW/U8JvouHwNWjLMo32kBnfDoB52DSdLI6MSjJBsC7ih1z3tKWk/xpovgtHZDxVQGriCQ8taAnQMz56NA5iwjO0quZCv7MaSL0qDWX/4q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdzZmh0Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8B51F000E9;
	Tue, 30 Jun 2026 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836409;
	bh=RIKcw/f2bT0GqSnRajEH7CZYQM6HSzTz6ME60t/gtQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdzZmh0ZbzrOs27gRa2si5fjlstmsgb2i/4j3qwr45jTpwtmNsvKbvDO5UwPywlLG
	 lcjXLh8y4BofgKZFLgXPDKHy6QbYmg/9HylXkeL2EBqnwCHWB0TjM/u/fQiQYG7Q5/
	 w9ojReR26j9eCcbWKNWRsO5I87KluFHS+rmvNXSQ8ZbvSjqKzXiEHrkHVYHttjtEpn
	 9LFeF2NFcJ0h2b410nnMbm0BDHrqDNsGSUE2odchTTTGXw17ASayO44kS/P1N4rObG
	 1M9iztZvbdhi90GJHyn6/6Ma2BwDNOQoiidykvw0Z7VQ16i/3jvOg1Cye1Dqaxu1VR
	 c2+Qvq8hqkOsA==
Date: Tue, 30 Jun 2026 11:20:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 02/19] dt-bindings: sram: qcom,imem: Add minidump-sram
 pattern property
Message-ID: <178283640850.3845930.5376012844259706282.robh@kernel.org>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624190830.3131112-3-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115509-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,gurudas.dev,chromium.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:robimarko@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:linux@gurudas.dev,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 241DB6E66CD


On Thu, 25 Jun 2026 00:38:13 +0530, Mukesh Ojha wrote:
> The qcom,imem binding describes a single word in always-on SRAM shared
> between the operating system (OS) and boot firmware. Before DDR is
> initialized on the warm reset following a crash, firmware reads this
> word to decide where to deliver the minidump, and the OS is expected to
> select one of the destinations: either USB upload to a host PC or save
> to on-device storage. If nothing is selected by the OS, USB is the
> default.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sram/qcom,imem.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


