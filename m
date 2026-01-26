Return-Path: <linux-arm-msm+bounces-90612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DqyBxvSd2mFlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 21:44:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F68D39D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 21:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4342F301FA55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 20:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7FE2D7D2F;
	Mon, 26 Jan 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+S32THw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3322C0F7A;
	Mon, 26 Jan 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769460135; cv=none; b=LXBKqyzv9Bn+u2xQNeprAiDnPTIIhvKToX413duXcgpbTydVkybWtvpbFQTL82HQwNIAQmdKwl/R2mG4P4Xu+WIhF5UNfYLO7PBAL4lJgST8GBmL6m2eT2BmyGMfnd5wqhdZAOg/RXCn3MxPYf2e3xK9mQ+LLvw8jjO/hk+vfXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769460135; c=relaxed/simple;
	bh=MZFDcDmn5ez3UM+L5R3+blzCAyK8dzgDI+KaJfmlEcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkC5uyD8vxa3ycFi2HrfK8aaUO0oo7RXKbKy4yyRclXR44mL/0OjOJAbCQ9KwlyRyLFJcgBXZbhnJbRCOGg8vDWQ8O6frjuHN+Dl4CXrKTK0KsiXlUBbAxHJa7YpruZy8UUvV7qYEWZwweMkIM1y9O4/ycRHToKc4fsnyMAjjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+S32THw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81585C116C6;
	Mon, 26 Jan 2026 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769460135;
	bh=MZFDcDmn5ez3UM+L5R3+blzCAyK8dzgDI+KaJfmlEcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+S32THwd89QNIPqWUuWq2rJmKbWtHMTfqUykLbyrY6Pv/HkSluPIoQkTRpPjf30X
	 ZWWPqOzIKvZcrq8agyYDq7xLguozmht/UfjHVqFHW06quRo+y9BRdSW6RoRlxetuop
	 eUugOKzMWqQNKbTGlzUcoy6fCjMPxbLbKcJkIRh7dI2k4vf3ziBnuFKgAInmnqzNN3
	 /EzojTDAeIUDRqy+7+MSmKlUQKVHzsEFLxluaHNknt8jNzVC80GS9TJRy+NNB+RBjX
	 83LITiqNVKb89yi9CnT5Kua9buCsGz0e5mnLH/ndGKkZJRzaL9oUjQ9klLGUcKDwf0
	 HVpTuZ0VqwieA==
Date: Mon, 26 Jan 2026 14:42:12 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add missing clock-names to GCC
Message-ID: <ispsq6ntw47gf5befoe3kpomhnsszolnxbzqpwzu36dr4jbbow@zepv7cxdbsez>
References: <20260126-topic-talos_dt_warn-v1-1-c452afc647ad@oss.qualcomm.com>
 <tw2lcfppz6lrmnpcfm5yh5j6iln5amedo2fxbyapx5ralclhjl@tyiretqzszcm>
 <5227ff03-3008-48d4-a22b-f9a9b1d9bec4@oss.qualcomm.com>
 <pjambgdh3fh2ypbun5qnmcpwrz2ajbiulcz64g7epegjy2j4eh@a2zkzepj5ro3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pjambgdh3fh2ypbun5qnmcpwrz2ajbiulcz64g7epegjy2j4eh@a2zkzepj5ro3>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90612-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B14F68D39D
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 07:53:44PM +0200, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 02:46:20PM +0100, Konrad Dybcio wrote:
> > On 1/26/26 2:33 PM, Dmitry Baryshkov wrote:
> > > On Mon, Jan 26, 2026 at 10:45:03AM +0100, Konrad Dybcio wrote:
> > >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >>
> > >> The binding for this clock controller requires that clock-names are
> > >> present. They're not really used by the kernel driver, but they're
> > >> marked as required, so someone might have assumed it's done on purpose
> > >> (where in reality we try to stay away from that since index-based
> > >> references are faster, take up less space and are already widely used)
> > >> and referenced it in drivers for another OS.
> > >>
> > >> Hence, do the least painful thing and add the missing entries.
> > > 
> > > One (me included) would assume that the presense of clock-names imples
> > > that the clocks are fetched according to those names and become very
> > > surprised if they are not. As such I'd suggest fixing the bindings instead.
> > 
> > The reason why I chose otherwise is in the commit message
> 
> Should we then change the driver to also start using clock-names?
> 

That's not necessary.

The binding does define that the DeviceTree must contain clock-names,
but it doesn't mandate any implementation to actually consider this
information.

Given that the order of the entries in the "clocks" property is defined
by the binding an implementation can choose to rely on that and ignore
the clock-names.

Regards,
Bjorn

> > Let's try to review bindings better next time
> 
> 
> -- 
> With best wishes
> Dmitry

