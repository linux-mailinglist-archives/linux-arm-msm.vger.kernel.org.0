Return-Path: <linux-arm-msm+bounces-106505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALtBK7fk/GmGVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 21:15:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5806F4EDCC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 21:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E317F3009889
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 19:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFC2481AA1;
	Thu,  7 May 2026 19:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELiMFNqf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9B547CC65;
	Thu,  7 May 2026 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181211; cv=none; b=FLaVXXnO7cDBse2mTV26Bqp5iw2qk7Z9GJ/ly964910v9CFhzhN7wjda2i8cKNuVcpa2ZJ7ecQPMOOrTe8gSjXKJKNKBQB+3JwEMkOIaYGbKvqaM+bSgzcovEKxKefXpcUXeOtb+eTcCXQtXi61O8jbociYySFQJxcrPOifjLvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181211; c=relaxed/simple;
	bh=4y9RhudWpEqHHtY3XucMq7OeCBeVoOP9PD0gGjA5N0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzBL99M/99ud3dy4zeYTT3Gm06cIFYgHLV6AlqyD0Jrz82IeqlHEoSO9W2CxkgUn5ng3X2aPpJRnnPmt6dXFytH/Yl1D4Q+KbK3sp9dmfqBP4iVRDJ7QkA2nmpEMeTXyX7eMpxLLZO1quc0x6Vaohx1/7gTVcZuEDRLgzW9BSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELiMFNqf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DDAC2BCB2;
	Thu,  7 May 2026 19:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778181209;
	bh=4y9RhudWpEqHHtY3XucMq7OeCBeVoOP9PD0gGjA5N0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELiMFNqfAPy/FzzHpvfHBj2TbmLhOVd2cxsGcREwE7TOR8N7dv2WMriuudBMkMHA4
	 RUTmd26PFYqb0znNmzU8hXWe85Cg6z/8SMsvSkKGeQRYR30h9MQAxfnV3b1pwqN0e6
	 FXzua0kuGe340Z2YfyWU+NATvnemSw0JMr96oGi7KAKgoZOCRvIiE9fDjdBVsQbSpE
	 jMVXAOBeu9DYxpeaih+UwhmOrm9RLO/+0joYy1b41xMkL/selXlvFzJI8zyUVAzhMN
	 y86HXIR5eO7NXoMVHNQnTplhyP0zJOZYs6jl+HYoQyTUwoWB9NACLi2KHs0qdjIWMQ
	 qJi6Q0WDWtWgg==
Date: Thu, 7 May 2026 14:13:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,sdm660: Disallow
 clocks when appropriate
Message-ID: <177818120709.2314237.7569681224064848107.robh@kernel.org>
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5806F4EDCC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106505-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action


On Sun, 03 May 2026 18:16:54 +0200, Krzysztof Kozlowski wrote:
> Only qcom,sdm660-mnoc and qcom,sdm660-a2noc devices from what is covered
> by this binding have clocks.  Others do not, so restrict the schema to
> be more accurate.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,sdm660.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


