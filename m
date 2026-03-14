Return-Path: <linux-arm-msm+bounces-97697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHtBA7wxtWn1xQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:00:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2528C96D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77D1F302F6BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5159F1A9FA7;
	Sat, 14 Mar 2026 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuJ3vzUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7363FF1;
	Sat, 14 Mar 2026 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773482424; cv=none; b=nHvV16/Fvl1dIkFDhVI3844sslnsq1vhZomrWgjknCw0a4SweEnb5h45UuHhgeIgny0PvDWMKKBr1GkbYFFiK45ZNoZzTuXRhMA7seYUqzzxMQdUVhQT6Hwm0hlrG2IMWLilgLDFTffV3CubW9IzTM0ot/Sn0bEMKxhHnNF6R9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773482424; c=relaxed/simple;
	bh=7q6/mh/+hgMSacRtQrKwjiNoZrlr2KIxDe3CIv91HnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAebeIIZCpWC+LsZv7swdipT2b0OFLchYiwxtRAjq+fa+Weu9ENb+ZJxeRhw/e7gjYFSuNn/q7fzE25kTdGKPpyTJWOAP1gi4f767Rh7/SZFX8lXR5GfhFx0cMnZ5VrnpmFxg3nlhrkxuq8V3iQAQi5Hx1R007wuy7nRELz0DBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuJ3vzUz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D95FC116C6;
	Sat, 14 Mar 2026 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773482423;
	bh=7q6/mh/+hgMSacRtQrKwjiNoZrlr2KIxDe3CIv91HnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EuJ3vzUzXhtxJRplj9Ur4p5dtgPDFdidkPRAetjIqw/gHAG+e/TzDoem5L0z531z8
	 qmXqHlB7iY5u8osMVkJkqz0362emawugGbxSm3hCjpZXO+lHO6jKhYhA/fRKN+4xLL
	 aKu6goH+/SAkdZ0cbgC0Td3MwQW5EnIIu0RrcaYk0aOypL5dh18Uhion8/icPw2og7
	 bWfPiB7fWzpuy0z9sWEo1mgI5RjQb2pJhDkdGz8a7UODpYj3yFiOyvf1mvF4OYzAX4
	 PYVI5uKff1cNSX5Kw/rMxwcihaieQeP0ZwAmckQsNr5GDX9icKVILMza3ddV6ENgeb
	 UkaWCMoxSL6cQ==
Date: Sat, 14 Mar 2026 11:00:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Eliza SoC and
 its MTP board
Message-ID: <20260314-petite-spirited-cobra-d6aadb@quoll>
References: <20260313-eliza-base-dt-v2-0-bd91367d860d@oss.qualcomm.com>
 <20260313-eliza-base-dt-v2-1-bd91367d860d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313-eliza-base-dt-v2-1-bd91367d860d@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97697-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73A2528C96D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 03:23:50PM +0200, Abel Vesa wrote:
> Qualcomm Eliza SoC comes with different flavors. There is SM7750 for
> mobiles and then QC7790S/M for IoT. One of the boards that comes with
> Eliza SoC is the MTP.
> 
> So document both the SoC and MTP board compatibles.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


