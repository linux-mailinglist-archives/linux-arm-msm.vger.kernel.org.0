Return-Path: <linux-arm-msm+bounces-107744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLqaGwbrBmqVowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:44:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFB254CABF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F74D319A749
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71504279F0;
	Fri, 15 May 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfd/GpvW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B78426EB4;
	Fri, 15 May 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835681; cv=none; b=Su7+Wg/qU7WBqAK7J6HFBG0E+Ws8JDa1KcbLw2DWvVsTsr0tJpyvaLgjqkdcdeWgwk/2rmkkw9Ys78UUBtEB5gxpAxR+tqmqaP0UPqJI2q4wobHc3M2dztS96P41yzQOGq5/56DyEAWw+PH+aya6hixrMSqLypcLgwuK77Uk0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835681; c=relaxed/simple;
	bh=uYZMiXCBR3BdyL5Jy/jTXI7IBsurNWhLiwzdfCe386U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us4me0ZYOyIMD7TPsOpOn/HLFmSXEK37KfQjzbnr80YFPM20NwvO5fq/bKP3RFgrPSPmzmOsfKs8C5/HD9o/Uolb/UTLhFVoq8H/Pf9CcBy840630D6d0iYwSL0BbrCdAN5LNhymlBM7UARaYQ/i92bFFX6QMvO1A3TQp3yPG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfd/GpvW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CEAC2BCB0;
	Fri, 15 May 2026 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778835681;
	bh=uYZMiXCBR3BdyL5Jy/jTXI7IBsurNWhLiwzdfCe386U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfd/GpvWAnht6oAtIJlQk4jfIE3r3b6cO7Vyk1g7QovzY1u8gz+2oWYQsWA0YQrp/
	 MHMp2X9fqePOULtfk76XFRPvMCj+p8Q0hq/DECzw9H6HWYhrasAmjpx8+uHF1DuHlO
	 WMWF6PveCwv3rDGxX3PD4farysrCv718gW3DnCBkWIfuQX4/iLiFM5HaXlAmLFuJkc
	 Dpd3rZKQK+rzuX7Sh8j1KFSAm4p4wiCJATeXfyGOSbre4PAAjz56H3peoVDBze0knp
	 nMSt0QxuPR6kdL9ihQIoZO4Mp3QacBUzwtPCU8INHotSo8nLFy64X/x/Xonq74CVXL
	 ooLp2XQrxr3vw==
Date: Fri, 15 May 2026 11:01:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Cc: Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document the Hawi
 Temperature Sensor
Message-ID: <20260515-complex-thoughtful-civet-89c06a@quoll>
References: <20260512-dtbinding-hawi-v1-1-96149d06cccf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-dtbinding-hawi-v1-1-96149d06cccf@oss.qualcomm.com>
X-Rspamd-Queue-Id: DFFB254CABF
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
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107744-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:43:36PM +0530, Dipa Ramesh Mantre wrote:
> Document the Temperature Sensor (TSENS) on the Qualcomm Hawi SoC.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


