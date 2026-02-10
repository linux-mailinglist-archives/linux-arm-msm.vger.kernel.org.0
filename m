Return-Path: <linux-arm-msm+bounces-92448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE0pJin6imlBPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:28:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 256BF118DF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B903130470ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C94340D9A;
	Tue, 10 Feb 2026 09:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mt1fHAWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6680D340A76;
	Tue, 10 Feb 2026 09:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715673; cv=none; b=ZWjSslqUpr1nq9Xyrpynrz/XJAcptEgi5V0kVFHKgnwBwWiNEd+PJE9vQeOBTZEk0qO5GwlYPqJ0Ca2YTENo0gjCCcz66N/9Gi051B13YNz7j7QHPxWsYyogzc8eN5vthrR5qSygH2OVO4pbgQ8sBO3ckGk3We35XaUv4+RZEY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715673; c=relaxed/simple;
	bh=lNbTI8ZlsPkcEZL6WlqE0hobRQjbA9GaaEMCZQayn0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDCXdXL5HBtHOB2nF+0dq/xVd0ZOqEtMPCg1h2FEIAn1dNpcYzTWhiuytf9kY3jEt5kdjIoYKKk939AUa/2WAuRrIgE+nR3Z3UX1X9irfU8OgKDwVdwd3ijWTHBN7veLnZQGm3bRFBeT0ClQyw+qyCtknraMUsGtqdSe5L6sLcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mt1fHAWJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FABC116C6;
	Tue, 10 Feb 2026 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770715673;
	bh=lNbTI8ZlsPkcEZL6WlqE0hobRQjbA9GaaEMCZQayn0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mt1fHAWJECLkOYycbjS0PtcpgdgfeQfuxbOUcHjsBNB6nj78C3t0R94AhCokHxSLw
	 +TTreNem/D8AMaoPE+juaLQsl2uQ129a+zpqAwemumQjb0PHbPQuJzIwbAohzH/zDw
	 N8vhasN35iDch9Ujcsk6Q9hhFSa62u5rQCKQbtOIJR0mlcS7qxgB/xnStcesqDHLhB
	 GFNx0y/NjyxPMWFQOta0+fDNZbGT0jiZ8C+lIt8Xbe0GjTqn+I/5TbvpkhO400Fucg
	 ywb/S45OrcwslsXl59XgIEMqo5Eg0+hs2ttKkJl3/T+8LrKP6gSqdwCzVk2xYQA3Ie
	 74+vwe2k4dFBQ==
Date: Tue, 10 Feb 2026 10:27:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: cache: qcom,llcc: Add SDM670 compatible
Message-ID: <20260210-messy-pig-of-sorcery-1f9b6a@quoll>
References: <20260210021957.13357-1-mailingradian@gmail.com>
 <20260210021957.13357-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210021957.13357-2-mailingradian@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92448-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 256BF118DF2
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:19:55PM -0500, Richard Acayan wrote:
> Document the Last Level Cache Controller on SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


