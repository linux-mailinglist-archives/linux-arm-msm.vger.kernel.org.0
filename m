Return-Path: <linux-arm-msm+bounces-94722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GdtFwYnpGmMYwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:46:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B971CF6A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78D5A300D61D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85ED52E7F32;
	Sun,  1 Mar 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0Yawvhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6279023B62B;
	Sun,  1 Mar 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772365571; cv=none; b=SPXYjSGo7D2cT8Tg95NjfhJOF7/wlMuZJsJL2/0WEFRQqV41TfgDSg5aD17DEfGf2ZdbIpiIcxYWfFBNPoVn1OtNcLTPqnwAI/ySAYEzNeGnrRSel9PRwP/zSKBnRDiySV4R+oCMc2I1IDztoubg+u9pLlkNp6S4JOJQCn4uUJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772365571; c=relaxed/simple;
	bh=+XZKJXFT4PEKoofH3TKDD6zGgMTeWZwTquLp4VBrWbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0xpDL8eqpd7rd3Jag7dhPZmk5E8RQaSByNYqv6Cu6SCWwqeygHjqeuhoawK5kL9wmQu+UJwnZOamHYnifv6hAcorivAtpVGTzeqPLGL8sMwma0Xi8uc02fuakMGdSrrhG0j3qe+SEATZSwmQKzTPdcZEgYVGmVDuOqEX5ULbbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0Yawvhh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D5DC116C6;
	Sun,  1 Mar 2026 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772365571;
	bh=+XZKJXFT4PEKoofH3TKDD6zGgMTeWZwTquLp4VBrWbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0YawvhhHdZRa3u3l7Yure9yI5WqDmbLax8BIorPxc/Yo9Xn1DL1+EO9BRkBxViNp
	 62FsfPSum4XOdn6qLCXfXMGgqLSwEB9WQ8PcW6S+gWhTWpUMDXvBVcYBMgDVGk9rJs
	 lj5Jfs/ofxvEanfhRGCBe8yRNvh7BzO3tvrFptsj9xsODhjvO1jiGUR9iTcqe69BRH
	 SyzTNKFIgci4XVXsvJfRwJaJU4w3VzbbQ5MLGXMxEcKcBCugrjt7X6Sfa2XfXv5C8m
	 2ei7Rg39tR5B4rwssTXOumlakYJazMNHnJYDQwQxIag+sijjXA0u+nNYvuPgifLDcZ
	 R0Jj1uvWBYWAQ==
Date: Sun, 1 Mar 2026 12:46:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>, 
	White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display: msm: Document DSI
 controller and DSI PHY on SC8280XP
Message-ID: <20260301-calculating-glistening-bird-ed0ef2@quoll>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
 <20260228141715.35307-4-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228141715.35307-4-mitltlatltl@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94722-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B9B971CF6A9
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:17:14PM +0800, Pengyu Luo wrote:
> Document DSI controller and DSI phy on SC8280XP platform.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../display/msm/qcom,sc8280xp-mdss.yaml       | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


