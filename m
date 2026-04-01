Return-Path: <linux-arm-msm+bounces-101257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADCLJjLRzGlFWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:02:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FDB37670D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28DA930D4429
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 07:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDD938E118;
	Wed,  1 Apr 2026 07:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpNjrQjE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E95382F2D;
	Wed,  1 Apr 2026 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029798; cv=none; b=bBTrnGZRNOHsAyNibVUgosclmYMMDoq3sZ3d3x4HsXNcp60w6V3/VNlNyOxUkxtWdtihimsIcW+/FFzcxKGCnhDScvoKe1WOmB2xYsak06ieDufLssFt0aiMf74m01iXa1UncbP0ojV69Sj8qLYpm3D0Jj956SojozKzt69S1uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029798; c=relaxed/simple;
	bh=9WpMSz6+rfJQ1hJYedFWyAfqy9LFA86jHw0pF1Dcblk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZcQLGQOLV/E0yT6KY+3nwEgiF/SK8JAapbNjIDR90MCekPDZDIPmdl4QtQb5ueday351j8PvkbtblybMNxiznQvJrKGng/eL0ZQG6lz+ZlH3SXAQ/3rI/VoxogUM4A68/Cf9nQ+IzFYORUCiwh/dUaA3q+YJaZnfB/80sGhKg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpNjrQjE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C35BC4CEF7;
	Wed,  1 Apr 2026 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775029798;
	bh=9WpMSz6+rfJQ1hJYedFWyAfqy9LFA86jHw0pF1Dcblk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpNjrQjEeahSbzoReGxTBtbXSOT23oSwEkxeCsBbM1z0FWERUA85l3zRlfJSB/K/z
	 wC3xy1v8Vln5JH0bzjQkcrbPCnHHHzRs9+ffGmCbH01vhXW9OudK3DCqFcleHiPij8
	 YDotGOuxB6nAWOVJ3P+44BTUvaf6WBeXxi7H9LH3/eKQxLod7pcfXHsbg87vNpu5yF
	 smEFqahpyQ2L6noWG9ss3HjKxeylbvwB2qtCg7Dmwk2stVqu5cllm5xgy3ulSKj0IY
	 pmfmfM4n5AtC8QWKBuTX8ePJUacjdO2ruYyQVdN0BplsGgu2dEvjjldctrHwQSK+rf
	 mx+CLjVPr9Cpw==
Date: Wed, 1 Apr 2026 09:49:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: qfprom: Add glymur compatible
Message-ID: <20260401-axiomatic-super-eagle-f6aa2b@quoll>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
 <20260331-glymur-qfprom-v1-1-5b4284d23c80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-glymur-qfprom-v1-1-5b4284d23c80@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101257-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49FDB37670D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 07:24:20PM +0530, Pankaj Patil wrote:
> Document compatible string for the QFPROM on Glymur platform.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


