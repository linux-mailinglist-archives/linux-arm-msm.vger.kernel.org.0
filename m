Return-Path: <linux-arm-msm+bounces-117076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Enr0NEBWTGpBjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:28:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A175C71694B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:28:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=L6K7iOU+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117076-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117076-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BC3E303B5A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882003101CE;
	Tue,  7 Jul 2026 01:27:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3D2FF641;
	Tue,  7 Jul 2026 01:27:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387670; cv=none; b=NyGSwACsC0rMjvPj1rK7Y9qs4HzEgNidCXGr7yatHzBIImxkivbVcCh8isAmcSe5yxzw045Trw0TRNAGQLkyuIEGc+fWAZM3HH9RX1YfGMlNKSkyQGPkBBtC5MAH71hqWkGJqWCFVj0BpHiVQDOKCTNn0QVB7FRrio26cdI8iwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387670; c=relaxed/simple;
	bh=i7pElux8kMgJ691AzOk6XcVWOuP/VBpzB8kkf8WgiRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ak6rOywTGaeFJERP7PrUQHf+u+Miy3YceFb9Z6XYvoyxLWf+q94YRZHOJ5hrc4r+y4Nogy82TJlkoLFHUygZdF0xLWfEAH5uBujS7aQA6eBjMX/UZhJZUvovvwi4dhyXxiTu/ZwluCdnd6KFSCNW3Nnbx3AQm1EBlZdTcIeBT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6K7iOU+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDEB1F00A3E;
	Tue,  7 Jul 2026 01:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387668;
	bh=Q4LVM9h/WtQjbuOWh/h5v02glcUtAFjbVlXhuGiDsYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L6K7iOU+nxFhZWS78U1E9IMJBCpkx3+u6e5dfYJbFC5S+skZYbtvvHU7hr8IKXhnj
	 BLS8CK/nNm2CHxf7edRs85PMVXoS2+QBLXZZEWFfZB8RD2K4ij9XBVfio7/6mqXwLd
	 UpOJm7F4lXyswVNCPfkSvszYvXDcCK1QzdK03NZrsX5ID1Ypc4gytwZ/hEs8ja+m9Y
	 ZmOMFM50ios7YmlePFGWzB5gGULgUSiMbyg9R7CLmHfsLKun4YYKP9CdUx+AWQNcIn
	 pn0hr0ij+7IQNW85ywN1WNxIJQf6sxhM1qB0w+oaVGjSQBsW8H/8b8omZADbtFeVry
	 B+FydU96MkSWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	Xin Xu <xxsemail@qq.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
Date: Mon,  6 Jul 2026 20:27:30 -0500
Message-ID: <178338764541.1558388.5000950428871202565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_D4AB219A942591742C3A6DA4DFB0EBA49505@qq.com>
References: <tencent_D4AB219A942591742C3A6DA4DFB0EBA49505@qq.com>
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:konradybcio@kernel.org,m:xxsemail@qq.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,qq.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117076-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A175C71694B


On Thu, 25 Jun 2026 19:50:48 +0800, Xin Xu wrote:
> Add the pm8008 PMIC node on i2c15 with seven LDOs,
> using GPIO84 as interrupt and GPIO76 as reset.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add ov8856 front camera
      commit: e221d444dc0bb4b0f244038b7655419498643667

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

