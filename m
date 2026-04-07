Return-Path: <linux-arm-msm+bounces-102217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHpHMf9R1Wkf4wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:50:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D283B30D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B23A30147B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 18:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F52C32D0D8;
	Tue,  7 Apr 2026 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hR9g0tys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9FD31195C;
	Tue,  7 Apr 2026 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587833; cv=none; b=oXP5hIBKo2iJnNTFP74mKeOdnt96pAe5/unxoLIZyUN06dbYpex0S8WTiuAknYp/x9kB+vcjbcG5EYTjGA2BgGCYCnVO/cn4F5I2Fd3A/SxzBX6FtJDBgy56+5kx1fVQOpwbAu6sOQVXmNdl2P01MO32iknu4LFqbVHYaOtUTW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587833; c=relaxed/simple;
	bh=yQA5fa5ucIyHZi0Eh5Vd4u+bbgAL5Uf+Hq1BLkbf/XY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jal5aryC5ghbp6bcz6wLEnCQfER5WEUvRji7WxdCQgWBStg79fGJ9o85FHBM7W01WWTThyskJJzaPAr3FEl705MSZwscZhP/k0AjEeDUmMkC6yA4BGMm1eImiLsd9MXKDuzIMBq6wzK0MJrFSdrlthSGmIlo8QJZLICABkNviWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hR9g0tys; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C716EC116C6;
	Tue,  7 Apr 2026 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775587833;
	bh=yQA5fa5ucIyHZi0Eh5Vd4u+bbgAL5Uf+Hq1BLkbf/XY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hR9g0tys4JW1Avcw7W4vr11rTT2QjT4mDul6kZBlZ4N4pNEhze8wF1O5XBXf2fzCz
	 PFgy8xt1nVdbdhQKtz2LGufaV0jR4Z66dgJweL9crNiObs80yE8RsklP8UkrrQ0KJl
	 qLZnW+RIxoVZXaTHTYw5QmPMAuE7bWCruA6Oz6aQAyZ//DhYnVx8D5xGezAhxUbQ0K
	 ZegNQyY+4Szd30MsTgPtK3uNghZlMiydKacsEv7d9PdsfemPg+4pFqcpHbeoi9IH1e
	 JJNwwNmWNwtwUH0CaM6G0r9IaJQ5zA683Ya0PoSurICUMvY7b2JOM3d/JnrL0W32sz
	 krg+Y7TLHivXQ==
Date: Tue, 7 Apr 2026 13:50:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Document the Eliza
 Always-On Subsystem side channel
Message-ID: <177558783034.3382316.476939946438982959.robh@kernel.org>
References: <20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102217-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49D283B30D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 14:46:53 +0200, Abel Vesa wrote:
> Document the Always-On Subsystem (AOSS) side channel found on the Qualcomm
> Eliza SoC. It is used for communication with other clients, like
> remoteprocs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


