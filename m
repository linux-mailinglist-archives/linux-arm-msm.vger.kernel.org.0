Return-Path: <linux-arm-msm+bounces-92515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFQ/Ee0/i2mfRwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:25:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629411BDB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED6143007AEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5880B36998E;
	Tue, 10 Feb 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9+pXcMe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451E1B0439;
	Tue, 10 Feb 2026 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770733545; cv=none; b=cxOTS++mQiuAnIKyEJqL3qkPbQ4xUsVLKPpOtsIk6J4XK9A+jixURVrKsmcJ/5fKWcZ7FkmGKGccamyeM9sRqmk0PhEIMwYAbpTCd09iU9w02A9ymBQmBF6JId+SFpKB5VEfi+CD9Rc4lmE4IUPzvB9eN4f/UnrYLe90JqFzEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770733545; c=relaxed/simple;
	bh=Cc7RlvZMUOBoe8d2fNkeIehCw7o4WXWiUWxWn7FaIPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4HQH6UqMD3EDI+12oMsWy0JZm8rwotxnBvVtqTYCW8Y4bdk9N7nlgKxym/Pt7KvLSt8oPJ2+UGWQ8erKbB0ueMMuwHUJsQRx4K+pqUBcVcZX3r2p1AZKkNgHDD/C8m2ZO5Lb0GBo73tnN8W8pttaF5+hM3OQNSK/x+eEgYk6Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9+pXcMe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926A2C116C6;
	Tue, 10 Feb 2026 14:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770733544;
	bh=Cc7RlvZMUOBoe8d2fNkeIehCw7o4WXWiUWxWn7FaIPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9+pXcMef9hT8SrCWhVkaF5OVJkcTt5gLGxRRfhMIh2nNoNGw+U9Ssbgm1A8JO7jv
	 9ICTTZrWcnFwIXYFrnXmBVQl2kvMRDxejAQBfYU9bKma8l3s/0vJgKvakLFEmQNvE0
	 h5ECApzErZPBpuLz7U7gX4SaVJxK8dxvscWXI/dVN+Ez7COxQv4aAFD/iAdQsLosPJ
	 LQFFo2po6FUh515gmWOpgtSinCHUQjRJOMFllcH5bpji2o+huxpSE74Zmc6Z5Aw8tI
	 SOhrEEtAiXjC+3MbBpVxKEQ0IkwXUKg/+jRjAiPvHPLU8J4nui7mmb+4DcACSz/MOW
	 3HL5O//zYkQhw==
Date: Tue, 10 Feb 2026 08:25:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: crypto: ice: add operating-points-v2
 property for QCOM ICE
Message-ID: <177073354252.2675627.17541447669337134449.robh@kernel.org>
References: <20260123-add-operating-points-v2-property-for-qcom-ice-bindings-v1-1-2155f7aacc28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-add-operating-points-v2-property-for-qcom-ice-bindings-v1-1-2155f7aacc28@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-92515-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8629411BDB1
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 18:18:11 +0530, Abhinaba Rakshit wrote:
> Add support for specifying OPPs for the Qualcomm Inline Crypto Engine
> by allowing the use of the standard "operating-points-v2" property in
> the ICE device node. OPP-tabel is kept as an optional property.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


