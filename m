Return-Path: <linux-arm-msm+bounces-93457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCIlC6UMmGkp/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:26:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 823AD1653FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0648F30221E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 07:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507683314AE;
	Fri, 20 Feb 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8gR9AW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B68132D0F5;
	Fri, 20 Feb 2026 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771572374; cv=none; b=Wz2lnTudF+7JdjwfypFmKwEsfGfZraNGXv7j5SNCS4BFKeRUGkhOFmgCA1dnxTrIRtGM6LmN9OPkBxfsIcjulRqX9UwVjoHmOaad1gKY57HxsL3rtGQfS8Fy6GS1wqiJkgwUmm2w+XgVswmkyt0lnTdaxPX2oS9JkvQcGsHkMDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771572374; c=relaxed/simple;
	bh=5suYW6V3xDOvXSUWsyWJg2Bhw4pRmqhWQtvGO1/hmro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfpE1P3fgylnKcpa6Gj3vZBsDtFCbZeGklWFXyl3eSbmwWFRhB84NNmL6zNqPotC4HrhkVrHZzZC7bApt3xyO+cMv9h5pdTiCOQNYuJ52srmJvkHaPB1FtrwghoX1DdA5cD9aANoB02GixP2w4P6EqTZDdzxQmiEOqiSCX2ILoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8gR9AW/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B15C116C6;
	Fri, 20 Feb 2026 07:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771572373;
	bh=5suYW6V3xDOvXSUWsyWJg2Bhw4pRmqhWQtvGO1/hmro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e8gR9AW/3Amy0glgUZ0pewKbqKuw7lMs3aw6cAVxBlfKjPpFAoO53eb2ZwRffUeAZ
	 x0WA/m2xIrrKv7sC9/hiVaNkfoWubkSkRO2Whysn4mZizYBx5L7lrdohkuKntxXPZD
	 M1J0N4K3G5oHdb3dtsnFTOtBQLJJ6GsAx7MTyrcBeysEgASpTZLSm8/x2TbrBIqH7j
	 aqVn2Iyyujjfia3ys66GH1D65fdWfhJzL0JOq74gGGzExnOJZ20zYiQfDB3ruMZSeB
	 xQeHrw/6Xs90kYrv830MBY/OUVQy+YXtWS5jEspSmirGs/s/3h3OtTCD65WwcDrCVs
	 sGcPsbHZ7/xlw==
Date: Fri, 20 Feb 2026 08:26:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/4] dt-bindings: arm: qcom: Document Glymur SoC and
 board
Message-ID: <20260220-vanilla-octopus-of-experience-ac893a@quoll>
References: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
 <20260219-upstream_v3_glymur_introduction-v8-1-8ce4e489ebb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219-upstream_v3_glymur_introduction-v8-1-8ce4e489ebb6@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-93457-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 823AD1653FE
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 06:53:26PM +0530, Pankaj Patil wrote:
> Document Glymur SoC bindings and Compute Reference Device
> (CRD) board id
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


