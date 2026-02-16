Return-Path: <linux-arm-msm+bounces-92895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBAbOV3Tkmm6ygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:20:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6F71417CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12AF03002E4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6C22989BC;
	Mon, 16 Feb 2026 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPX3C6tK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555462475E3;
	Mon, 16 Feb 2026 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230041; cv=none; b=k4qK7MnO3vViKrj1VDshD0hcREUEl2AWJ31XXRvGtfSlSRyf2tiBpSnUk+fawwmNErq/cSGbTKB+gytxVi+Aox2l+dvd5oUWQ0Yf4m0uPQiNf3QX9uh9iMLdxfrBy4nYzBEXA+rHOMWgFHY0lDjt4CtWnF1mpYPPMiF9wobBJTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230041; c=relaxed/simple;
	bh=PMzp/FOnba2760nShKInNwyy7x93fS/lLvddNbsfwus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Id2iJ/zdH1JLyabHLPf/9VOkhbahcf01ILJrQqE0Bs4yWlmclSmADTOWJWmA8bfr7VEnUqeNc9ExGnd3yHWiafcrR3JnZ36HzwXzar5BeNbDVS+uebBm9KFQw9aBPnaQCgJAjMwGn8MbsvWamhAAalGbHXtLO5q3KDgxahVvJEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPX3C6tK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEC1C116C6;
	Mon, 16 Feb 2026 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771230040;
	bh=PMzp/FOnba2760nShKInNwyy7x93fS/lLvddNbsfwus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPX3C6tKXkaQUC5MoArURTewyLAqcdiudV+SrWFZDMY2pVVnE6kFG++UmskL5I9es
	 HfW/fhNrRa8ZD0+vFGuOYzDwZ/ZYcA9c8cjXx5IKt2KtPkOCBWvXKCAU+y4KGRrIxf
	 WZ4AZt3utJGB1CTXwAoYA917/ra/645qN8a3rm6j/ZUy/L0d51XxL0lwhqjts5iZdp
	 XQSBmHK6CeS3U84X7kFHt4OzgXhRyExhLSl/KeNalQEQTrifbZxbJwUF5VKMYbSCp7
	 WzaVAzQD83ZbJvBZ5V2wIBgL86mMnQEknI5k50zyqdtnoXxZQ3lBZXYiX+WaE7wACj
	 b5pzLwe+8tgpg==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vrtqO-000000004Z1-2GG0;
	Mon, 16 Feb 2026 09:20:36 +0100
Date: Mon, 16 Feb 2026 09:20:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] firmware: qcom: uefisecapp: Annotate acquiring locks
 for sparse
Message-ID: <aZLTVNrADn_zL0NN@hovoldconsulting.com>
References: <20260215110548.34152-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260215110548.34152-5-krzysztof.kozlowski@oss.qualcomm.com>
 <aZLOo3tMAWhXhdkR@hovoldconsulting.com>
 <dfb72ee5-0576-4b9d-b109-e763273cf39f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfb72ee5-0576-4b9d-b109-e763273cf39f@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92895-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 7D6F71417CB
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 09:14:13AM +0100, Krzysztof Kozlowski wrote:
> On 16/02/2026 09:00, Johan Hovold wrote:
> > On Sun, Feb 15, 2026 at 12:05:50PM +0100, Krzysztof Kozlowski wrote:
> >> qcuefi_acquire() and qcuefi_release() end with mutex locked or unlocked
> >> respectively, so annotate them so the lock usage will be tracked by
> >> sparse.

> > The mutex implementation does not use sparse annotation so this actually
> > introduces sparse warnings (unless something changed very recently).
> > 
> > See 
> > 	
> > 	https://lore.kernel.org/all/ZJ11H8btBhvCx9gD@hovoldconsulting.com/
> > 
> > for what his looks like for the code in question.
> 
> I checked with sparse and there were no warnings. More importantly,
> mutex uses __acquires, so this apparently changed:
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mutex.h#n214

Thanks for checking. This is apparently about to change for v7.0-rc1:

	370f0a345a70 ("locking/mutex: Support Clang's context analysis")

Johan

