Return-Path: <linux-arm-msm+bounces-103918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLhqEnlQ52lW6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:24:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB71439755
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45064301C5B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E89B38836A;
	Tue, 21 Apr 2026 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUT0/7aI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6AA2F6596;
	Tue, 21 Apr 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767068; cv=none; b=O2Mhk72unBsTwpLFdSLTz0URnZPjDPKe95KR1eLVkmnJILEsp2KD8kcf3BFCsXmGfF8f0rVhNWQsw+H7WkivQXpGnZcol2NJUHvL+/dvKDK/id0OaWsGzNPr0kFMKsd1614EJ/Puq4nDhofatEtztiurEIRfuM0qGyEyRJLukag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767068; c=relaxed/simple;
	bh=yokX1uwJdP3CzSczCZdKeC14Zi1TdQzjEz8oBavCc2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYiMvQRYPt/+qeCt3F0N4eHZZ+kFA4N+55MZ9Kv+b/4+KMowP8LyYc28nKJAaJO8AS9SpriEzL0OgSG/LTnbsLN+3HtVsvd9fVzj15dHOD/bYq5gJhyHC9tdhqS5AEEBQfLrJY12VDC443U35IHATRIk1gUwAyrDg7DtnqOC+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUT0/7aI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03CFC2BCB0;
	Tue, 21 Apr 2026 10:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776767068;
	bh=yokX1uwJdP3CzSczCZdKeC14Zi1TdQzjEz8oBavCc2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUT0/7aIPggkhv5QFMuw3MZhz3q5Q5+61xj8zbBYgORCmK5pr+f25SsdmqNdKYO6v
	 2jbxwuvo+/+VOQ8nwH2cKGETAKheyFMNyTRKnbmggnZHUKhN1qPI9axPK9hw/g2sbA
	 e13jZ35oAJ/2S8FBIrlxHjk4T31V3Ac6HlrAFdxSUwliCGH8WNnG3HxAgI7tapEHIO
	 /X7UMY2YqAvVeR38gEPNzaxnCPtB/81pX70ATfO4gskZyEu112BbXaK+BDlKm5Srrc
	 D43WH9yC7RHqB/r9bec0R7832XWVnMAEOKNo7vpzkM/raqQV+ifHebfKjOIwFSvcUK
	 TyjMNeSvbQdPQ==
Date: Tue, 21 Apr 2026 12:24:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Document RPMh
 Network-On-Chip for Qualcomm Nord SoC
Message-ID: <20260421-cherry-sponge-of-patience-9fb1ad@quoll>
References: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
 <20260420021351.1239355-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420021351.1239355-2-shengchao.guo@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103918-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5BB71439755
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:13:50AM +0800, Shawn Guo wrote:
> From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> 
> Add RPMh Network-On-Chip interconnect bindings for Qualcomm Nord SoC.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,nord-rpmh.yaml | 131 +++++++++++
>  .../dt-bindings/interconnect/qcom,nord-rpmh.h | 217 ++++++++++++++++++
>  2 files changed, 348 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,nord-rpmh.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,nord-rpmh.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


