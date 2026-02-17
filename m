Return-Path: <linux-arm-msm+bounces-93062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKlnBxselGn0/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:51:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A39149564
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ED4B30074BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9B82D8797;
	Tue, 17 Feb 2026 07:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMdo9U/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682D2C3257;
	Tue, 17 Feb 2026 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314710; cv=none; b=ZIQJJ+tc3XstWBCpCyEy+sFhcQ8+x5Dz7fPKvM6i983OEMkSDPtMUURYcizyOVfC6f1K4tBZoIFR89Kt/abzMdpxdcXgGZIXhyfBGx1JTAZ0wvTMNAYBt/tuRgBwLfiGWe3fo86sLOfNvjxuJ9Y7pX2XN+g8visazqDr06SWS0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314710; c=relaxed/simple;
	bh=+62KFVzOzcLbrBzIwrjzp6k1GLrdJRZUAdp/CEJjzGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJFKtKb+3fcvIcYfCxbTHE21+CHpZyy2v+WU/m1KsaJFEnMJtj47CGA7MuwSeQs38CjDGXnnwBHeyzc05+uhSZsWlRNaydKROGuNpC2ZHRa0JE7uvRU7bTZIKxOlvfVfaqQ/8R3kgg3SjR7TlgH8gGwe+AxcaA3IvK1Glj/+s80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMdo9U/6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448C7C4CEF7;
	Tue, 17 Feb 2026 07:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771314709;
	bh=+62KFVzOzcLbrBzIwrjzp6k1GLrdJRZUAdp/CEJjzGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMdo9U/6D5PYFqsu8trJZAPLBpc5ulvOlQ/XaDyIeWebvmqqRAfvjBu9GusvETRTO
	 /EU7Hye2bcqsToT6SDBO8ydEF6QucCxXUIjwRJWVtJWH/qPK5KPvjP+ci0ZBUXLZet
	 6lIHt4ubix30bGggO63BUPYf36xh8d8NYXg1X4V+lsj37l+Riwwjj7eMWM9dwCyf1O
	 1sd+nNX6IQKEwFLD8S1vZY4UCggJMNmsjb8cwCZ+aZZZjEe6KKfMvMLQkkK4jmzCIJ
	 9DjpJdeYrr3GDyGXNU2FOUNyd031lF8vS8ZqRMWyXpszNiJ84jFDi3fhrfFU2aTIK+
	 Li729Fp+2N1Ng==
Date: Tue, 17 Feb 2026 08:51:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, 
	janaki.thota@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: bluetooth: qcom,qcc2072-bt: Split to
 separate schema
Message-ID: <20260217-avocet-of-glorious-romance-8cf9ec@quoll>
References: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
 <20260217054731.3058567-2-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217054731.3058567-2-vivek.sahu@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93062-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: A2A39149564
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:17:30AM +0530, Vivek Sahu wrote:
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split qcom,qcc2072-bt to separate
> bindings, so device schema will be easier to read/maintain and list only
> relevant properties.

Huh? I do not see any split here and I do not see how this commit msg
relates anyhow to what the patch is doing.
> 
> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
> ---
>  .../net/bluetooth/qcom,qcc2072-bt.yaml        | 48 +++++++++++++++++++


Best regards,
Krzysztof


