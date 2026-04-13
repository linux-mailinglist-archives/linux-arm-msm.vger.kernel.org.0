Return-Path: <linux-arm-msm+bounces-103015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGM4Hmlt3WlNeAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 00:25:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8A53F3D0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 00:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6280302CD0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 22:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B7039B494;
	Mon, 13 Apr 2026 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YU85GmQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0263C3909A2;
	Mon, 13 Apr 2026 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776119143; cv=none; b=QPPHJOx4RB3TsqQwx8KOySjE2XuECNDVQHcjrROABPDMfjQOXZIeMnLCtMPmkxz/CZJQosY5XW7LM+B+a4F7XlrVWYgkvVaQkn/FZC+kw5Q9NmWLHpI5Utz2q0UcZoD/vUM8p7YIJf+66LIn1/FTh1rI8ZcpJ42VAdshJvITLsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776119143; c=relaxed/simple;
	bh=qPxaChfzSVz+uzhSLWRQeUwbcPQeVKJ23FDo/WyT5MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2jvtgQazfsj7rIvuf9xlYsd+alSSl7FkgG7q+YcNWUDUmGj4QLaQ5rEQUKMa+esIa2r5K4JUWSNKwxT7ZNIKEEAS9O/kgKlY0MTrturRHDeNycuK6MRY8QD5ew+t9AMJ2nNe7UiJ/nPVAKSuvGx/YcbCXd9bS9BkXN0RaRNAIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YU85GmQw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59840C2BCAF;
	Mon, 13 Apr 2026 22:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776119142;
	bh=qPxaChfzSVz+uzhSLWRQeUwbcPQeVKJ23FDo/WyT5MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YU85GmQw+yaNCVSUtKQ6P7x713mJkyn58xlCwDeNxHOUNuGB4Z7w809cn00VYrSwA
	 yuG5l0MQESLeSoGeuTekIeI7ZsdgaNUCHolXeifw1jTtdhxNj4atgYLB3HVbe2jq0N
	 eIv6ruoncOSndBprOEnPYAgSefLen4/Q5evdCgv+lW4KninYocuzj1uvh3kRfVLIag
	 jSeUMnyZuKRf25uepGA+QWGEa1WgE5vgR++PFDhT9YmuL5+0v8HTjgVVMQ0SgjkSpN
	 CB1lK2rSzwg5IDGNeOmPJn+3vHgkzDfKuHX66RUPnSC9Js7awSQWPhGyvjI2Msn4fp
	 52YrZqqksiMmQ==
Date: Mon, 13 Apr 2026 17:25:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: qcom,pdc: document the Hawi Power Domain
 Controller
Message-ID: <177611913959.3647505.2231745846728551068.robh@kernel.org>
References: <20260401125004.592925-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401125004.592925-1-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103015-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0F8A53F3D0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 01 Apr 2026 18:20:04 +0530, Mukesh Ojha wrote:
> Document the Power Domain Controller on the Qualcomm Hawi SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


