Return-Path: <linux-arm-msm+bounces-92572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCyIFholjGnjiAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 07:43:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A46121A82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 07:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B4F63018596
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 06:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F300B3370E3;
	Wed, 11 Feb 2026 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6UWzHDr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3CE3148A3;
	Wed, 11 Feb 2026 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770792212; cv=none; b=d1HMIniGswqGg2Q5tZigZcQdBGFnVsMNyFZ7WxHdHrIS9dKp6P+v0yPFutQWAG3Vh0iy/B6QADRg59/O6gZlmLpixglheA9Om8xfUdp8v1VXsMGvxYNIoBKjCmS1L+jFQ8Rm6uKjZwGwfFEfVDskkVf+6J83xp1llrEh09avWMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770792212; c=relaxed/simple;
	bh=PvxfgnACJlWHTINBi0YLxkfqVq+/kkMQjHVm0WPXloQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhXGYJqFPZ4TiCxDwp9I+9vj3t4TkUsNANb443g+aOTSrKCGaYKWyY6YviwBHETfee/TQtaUgHXI9wsX7Sdyc42k7FMH3V99GGKoR2aPlz3X9ZfmjwL2DvQRPkAZyVGcne0kA6y7kjx0s7JSS+0701uDZWklwAmYf9xqjBnOkd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6UWzHDr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01FEC16AAE;
	Wed, 11 Feb 2026 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770792212;
	bh=PvxfgnACJlWHTINBi0YLxkfqVq+/kkMQjHVm0WPXloQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6UWzHDrMcTk/ihJ2GTvKMFaoMX+fYXydbk4/I2jmchtxHVMGyVYm0M7jilVw7Ejt
	 AHy1Sv+cGBi2Bo3Y6g2CSFCB15+Fsm8A+xA5hqHRbQWG4EPO9SZ3emEtyurUWMA7/S
	 /nULaQKZ7yHaxpbUrBD2Uz+9dNGzw1i7NihNRDxN2Sb2KG1HuFAvI5ZUtKOWzvN244
	 NJYz5Un8FLy8oh5EWG1AYg0wFcGvZttv+0JBT1BNLWJ/n4UG552Fq8QTrWtIcwq3s/
	 E4Xxw5zrZcjdQhx047Rld9GPCcwebTQcLJIPg37XtdBJFhjTuNfc2X2oI67YUiTOhQ
	 mCLJ0dHe5h3yg==
Date: Wed, 11 Feb 2026 07:43:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alexey.klimov@linaro.org, r.mereu@arduino.cc
Subject: Re: [PATCH 1/4] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for pm4124-codec
Message-ID: <20260211-holistic-precise-gazelle-fea9be@quoll>
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260209142428.214428-2-srinivas.kandagatla@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-92572-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2A46121A82
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 02:24:25PM +0000, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
> Audio codec has TX and RX soundwire slave devices to connect to on-chip
> soundwire master.
> 
> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
> properties in mfd qcom,spmi-pmic schema to complete the audio codec support.
> 

That's v6, not v1.

> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> [Srini: reworked the patch]

Why? The v5 version was what we wanted. Why changing it?

Anyway, same feedback.

Best regards,
Krzysztof


