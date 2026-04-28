Return-Path: <linux-arm-msm+bounces-104889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGgGBaJj8GkRSwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:37:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E647EFE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C00E30E836C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFF63D47A0;
	Tue, 28 Apr 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvIfaQGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8BC36404E;
	Tue, 28 Apr 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360999; cv=none; b=hXCOpyu1lKEz2ftr9HEOWuKXBoGTI7mTVbSjnOp1hBpuaUKFiM2rj/8t/D6SUPtibhdHXVH72FouQAAlLyDbVN99gTmbznauFmOBcy6d7fMh+mBeQ2XdckTRa4vr6U/NonDOnsLhBsGtD45l27tXJcv38YIhMZi3cj2iSvj/HA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360999; c=relaxed/simple;
	bh=06XvuxVCVuLInFbGuXibEDUVLLiDHEg+/puBaTGs3Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQ48lN2tl3PfE8D8N5QMQex1+KVz4vJCNN3htU3byvgawe6bv14y2l4LSSy8/XdhPQe0VzFD0ehKgFvaIpKPNixh6ciCdeUowLTTNN0Mt0jAFM9WgDgMeptm+Q+5jszzPAF4n4iL5aNs+CJ+I6jC2y+KISL3GTTdtoZH8TPyb/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvIfaQGv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D675C2BCAF;
	Tue, 28 Apr 2026 07:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777360999;
	bh=06XvuxVCVuLInFbGuXibEDUVLLiDHEg+/puBaTGs3Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvIfaQGvYxvkXhsBQgYuzHqDAUPKUitTHzNRpsor7GRBdZtWZh7bAEkYzJuvc735y
	 kv1PH1rI//au9MfxGA9dcHpDj0iCp69lYlvVzdSUn8dxhAkAAby/8wesqIhv0wxEf2
	 109bjAGbf7zPbL6ezHPanEGyddOMfedoWNOg3vfamezkk1l6gVVo4dGKWmIGNh4Y3i
	 dPd37am4MvP4g0FeGP+YWLvxYqWXeOjV3MuVUlqtUtsVgHMPQRhm2b1rB0h8CsPhov
	 J1t9CNvZZ+rcZypSNHeGC8kbTq+HGqxaLYuvPaqmj0t89gPLPDTs9s0IRoUV0LzCi0
	 nEOSjQ+1GaSJg==
Date: Tue, 28 Apr 2026 09:23:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom: Document SA8797P Ride board
Message-ID: <20260428-ultramarine-bison-of-camouflage-99f8ca@quoll>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260427023455.236410-4-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: AC1E647EFE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104889-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 10:34:54AM +0800, Shawn Guo wrote:
> Add compatible for SA8797P Ride which is an automotive=E2=80=91grade deve=
lopment
> board from Qualcomm.

This is the first usage of sa8797p compatible, I think, so it should
be explained what that is and why using it. I guess the Ride board
cannot have anything else mounted than the automotive SA8797P?

Best regards,
Krzysztof


