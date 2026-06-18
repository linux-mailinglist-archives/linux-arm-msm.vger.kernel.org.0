Return-Path: <linux-arm-msm+bounces-113801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FzD2Ef9mNGp2XAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:45:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00B6A2CD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:45:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IEZZsAkR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113801-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113801-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F774303B5AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 21:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD701A2545;
	Thu, 18 Jun 2026 21:45:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964E1367;
	Thu, 18 Jun 2026 21:45:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819131; cv=none; b=nrsXwMN0LB8bNE8oH1l4mv+aB7QWnxDJVsgPhmJV+ZH3T2SwjkTAxlqQhNqml42Rk7ZmjW11UMr2nc3F7ceGyikyK0H456AoHlju04d7LUSKnMWRreg02EnFLc/KBWV5ywxJud29lMlPxtl/ul2SJlemQPMl9QNzqrI7V1CIUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819131; c=relaxed/simple;
	bh=oNQ7Nj5q4VgGEtdWos8dGriV/tmuPTWCWLbyXtQR6aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIgCb/BayXXXUgGgexB2wL5Xsvqj/3umvI/l7LogL6Yy4DGS3Z6AqYEaiexpp3P5CGeXDjqCsS3xEgShkestRoGWGLq7DjwIkViiSeOnIMcbCxEYIv0tOqiqVHgeu04MKP3rpbgzo1vZTGrVtQMMguIwg/Z/cstimhvyB7XMaUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEZZsAkR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548BB1F000E9;
	Thu, 18 Jun 2026 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781819129;
	bh=3PO8eK5t/qadih/zDtj61rkREDX2jCZNqbr0c9h2Wyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IEZZsAkRSixW643QnQb934xnNlYF9WBW3d0fsl0CBP+6IBaR8FicVFvEZPlpi6G25
	 slrs2Ixhgv1ISzJFs1gCNsb3D3a+wEvzUMHFq1X2gMzXj2Xcbxv+YqZLF/k4YQcWJD
	 BMcyCaz1GEBRMyirCDPCWfP0jSTOyKUxTK3z7WcaYqrwinC+JZJVUVEZaljaIFFn4C
	 m3sFNf6SNZmcRrM3PCzHB+qEphHmMaE1ZWBtZD1xcOsOInq4zJL0BPM/nYZUw1Ojmv
	 8Uzob2LrVzHlhyBLzXuAQEgm5UHD2hVKLkihxtcfTPgYg2ze1yYvmRQhKT0iQSPXUV
	 y+cIkIgnoFJMQ==
Message-ID: <02eee0a8-8c0f-4b0c-acc2-05dc436e5a85@kernel.org>
Date: Thu, 18 Jun 2026 22:45:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: qcom: qdsp6: generalize GPR service domain
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mohammad.rafi.shaik@oss.qualcomm.com,
 Pratyush Meduri <mpratyus@qti.qualcomm.com>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
 <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:mpratyus@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113801-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C00B6A2CD5



On 6/9/26 7:40 AM, Ajay Kumar Nandam wrote:
> Use each GPR domain advertised by the qcom APR/GPR layer when building
> APM/PRM packets and add explicit dest_domain parameters to all AudioReach
> alloc helpers.
> Legacy helpers fall back to ADSP while graphs, media-format, and
> shared-memory packets reuse gdev->domain_id for modem targets.
Why?

> 

I dont understand what are you trying to do, commit log itself is not
clear and does explain the problem that you are solving or what exactly

> Co-developed-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
> Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 112 +++++++++++++++++++++---------
>  sound/soc/qcom/qdsp6/audioreach.h |  23 +++---
>  sound/soc/qcom/qdsp6/q6apm.c      |  48 +++++++++----
>  sound/soc/qcom/qdsp6/q6prm.c      |  19 ++---
>  4 files changed, 138 insertions(+), 64 deletions(-)
> 

