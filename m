Return-Path: <linux-arm-msm+bounces-97359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB/dOlvKs2kqawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:27:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D565D27FA04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9C8D301C69E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B257369982;
	Fri, 13 Mar 2026 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeH+uLzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B7D21883E;
	Fri, 13 Mar 2026 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390422; cv=none; b=AGu4jDcIqVT2kta8TSZcaolVqMhKhzl8E2QSM+GP9/a855zr6ex73bCkOMTBEJNuhqJFSikmYohFep7xKryyYCvFhxP2wODlztr4/ps8O21AhBi6Kj6NMKIOVdaqp16LTOj9ySgEuw7zAZkYx3RrJP/XdeIsXMVsWGczqDb2Fx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390422; c=relaxed/simple;
	bh=FJRvkKMeRW8TkvF5iU6no52/ZJP4uFpoVJrM9BQeens=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LphQp7a5/N69Tn++CIJ/MGnXZgJ9q7LXmaoGC03gAUkGrlVa8EPn3FWkhhTRLJsYxLXLWlHqjrJ1UBCHYQRijhjQ00HeLk6xhbLwTYH4DXqIzKQc8QdaVcK973CiZfI58KZSfqNFPr2ycVLRec/d4n90S5CL952KAUMoYfTV3ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeH+uLzP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D428C19421;
	Fri, 13 Mar 2026 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773390421;
	bh=FJRvkKMeRW8TkvF5iU6no52/ZJP4uFpoVJrM9BQeens=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BeH+uLzP5I/U6YD7P0Xs2KnDXw1jHbM2t2kbnTBnEIF8X7TkJKrmGKMEB2o1kAtPj
	 xdL++uGAlT3OZAO50b+m8T5H8BCPFkfxgaNWoW1T9Bw4z7BNbgdY4dtn+rXjS3Y34P
	 Ws5HjdW05pEVTLmqdC6cEizN/dowWlVY2WTEU0f1/vV6GF6z+rIYgnRJUNX8e4HHU7
	 bzsGm2mDP37/YxtLmwldomcyC7SiVCRMLURIWwow/BQd1OFVy1zdsyMsQsy4Uda8tK
	 SBXeU0F9rpPGtW7KeykGk0WPDsLqK5p/YkfkHl8NSbbrE9/QBp4vqq6CS8wPtlvV1q
	 3GIY/I/Ko7m+w==
Date: Fri, 13 Mar 2026 09:26:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: firmware: qcom,scm: document Eliza SCM
 Firmware Interface
Message-ID: <20260313-sweet-valiant-flounder-f5c1fb@quoll>
References: <20260311-eliza-bindings-scm-v2-1-b2d2e69068e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-eliza-bindings-scm-v2-1-b2d2e69068e3@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97359-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,msgid.link:url]
X-Rspamd-Queue-Id: D565D27FA04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:43:02AM +0200, Abel Vesa wrote:
> Document the SCM Firmware Interface on the Eliza SoC.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Added the compatible to the if-clause for interrupts being present,
>   just like on sm8750, even though the schema is way too relaxed and
>   doesn't mark them as required. No idea if it should be or not.
>   Anyway, now it is in line with sm8750, milos and so on.
> - Link to v1: https://patch.msgid.link/20260223-eliza-bindings-scm-v1-1-c88643112dd4@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


