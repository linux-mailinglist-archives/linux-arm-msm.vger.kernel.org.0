Return-Path: <linux-arm-msm+bounces-116124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PoJeCZz3RmoagAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:43:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A5E6FD716
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:43:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aQrFmYBl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116124-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116124-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA1AD3084EC8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 23:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38D23DBD64;
	Thu,  2 Jul 2026 23:40:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28F3DA7DF;
	Thu,  2 Jul 2026 23:40:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035656; cv=none; b=nqkbq5AXnGa1lamp30qTIuIs//t5gNoCRF6GsivdqZzV+RcrXDrhLvPAxa4NdbS6Q8R7Nz2rPmhC0o9Naf1byEXprFCaxaqKd/IQFsu5iCOi/kVTT/n9fYKYVc31N+2S/3NSF0KQ3C4nSwIKIBLa7S1hLcHv9pxsIL/YKXE+Mgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035656; c=relaxed/simple;
	bh=pztJ19jlPAtgWGVSEFTUUCgRsq8sTNZBrS1quCHAwes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VBj8uDhxcmQAHu+M00RgpEIJfs++KJ/WFq1mYS173zV1MG2REMCeQiX9bzQtEQEs2irKyXMGxFGBOv/Luklcvb7hGLXyYR85qz/kidVnoJx9qkzKpNgReoqtduW9RDPXIK+2GBbf7uscvFymruq33LgGigEo7RiX3Abb1jikrQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQrFmYBl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F2B1F000E9;
	Thu,  2 Jul 2026 23:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035655;
	bh=RUQ0Y731V6yPs3oo3sgrZrZpdbfQpaEpVQMyLp14hbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aQrFmYBl6p1YJQHL25Pxpkye+hSUkfBP9j+LOCNwScWcf8BHUxN/vtleO9po069Kv
	 xtxMuFg5uULPfHzE3cNRT9Y8yPyUQu+/EZRtE388FIYUjhiJLCKmitEquvMCnhOTj1
	 8+B1JuofItv3ScQFEz7qAwDKJSZ+d+f0JHAb8ISTFfiQ93f1TYuY330IQJyzIXMWKo
	 RLywdcET5JySuRBvExIiSKfU8BXrMBq6fADhsYQAaJbzEH4KpcQm2CBcpxIN+zlVmQ
	 RMd18tRIOPsf9Xgg5KoMPqVGHbz3yqwhc8lDn5LWEwugUxrv5SU0Xc0w8FzKh+BZ1r
	 9iADfMiy7eacw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: add audio PD remote heap region
Date: Thu,  2 Jul 2026 18:40:29 -0500
Message-ID: <178303563659.359079.2513826567660107542.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
References: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116124-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82A5E6FD716


On Sat, 18 Apr 2026 11:38:15 +0530, Ekansh Gupta wrote:
> Reference the reserved memory region for audio PD dynamic loading
> and remote heap requirements. Add the required VMID list for memory
> ownership transfers.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa: add audio PD remote heap region
      commit: 30ae66afcacf1a240ed4b9ec0b71d3316f3d3842

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

