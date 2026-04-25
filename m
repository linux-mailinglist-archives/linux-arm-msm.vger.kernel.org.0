Return-Path: <linux-arm-msm+bounces-104510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM2IMeqX7GkQaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:31:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AC465E9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9753E300DE2B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 10:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B957D3947AA;
	Sat, 25 Apr 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpHfHfvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A0F394492;
	Sat, 25 Apr 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777113063; cv=none; b=Eai8VBASlBj/O7PQ5Uj0dPIsXqUpUSLBP1QBRNDk+Fbt5nD7QWRNQNCIV5VjGjdEJGRKDgfeAZbag5TdfG2Y6xtNOwMeodvCxUeEn0B1zaxh4BU0Ftjm1cWwUGCYt0DDO3BDX0vK/uTF30jGtpVtqt73HMapzu25fRNEKxKrEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777113063; c=relaxed/simple;
	bh=3bUHD2YRRtUg0cgqA7r55OGxjlDxRc+QgJkJJZZyiCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHxzpg4itXgK8I/uCBUGvyyE+AxSg+s5d/IC3dmr4VZhzMbQLShcWYDiPiloI/shglw4Ya09MUm6WrFS27NMt+C/HEf6f2rNjU+4Zbl7mg/xXAPlH/eGGlY2kvalJE/d/w9WUJsv3O/UZvDuW4JfwyHcj7EaGRDEIZABdIYGwAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpHfHfvg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B44C2BCB0;
	Sat, 25 Apr 2026 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777113063;
	bh=3bUHD2YRRtUg0cgqA7r55OGxjlDxRc+QgJkJJZZyiCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IpHfHfvgAo51SnLX4WHrNu2umSPY43TiJoZMP5jLlmZYcah1HjCNJQK4ncGHB2Dif
	 QncX2f1nDfcTrgsget9L+w/VmjfZu2qgz1qFxpbVKWy3ktV3kFWf9v8WCY1zM6cvwJ
	 ZdDsVDtB+6CcqYQlQOyRoyOWm8BN6EhhWOmWj/xe6ARL0BLpCx/sR3oQoBx+jfA65V
	 Q4ALOf0CeaOGO5L+iPlAGTrgYxdI0z5T3e4heg8neDlJtSF3kDHuppyoO9X0L2rkmZ
	 WtM/gb85mkqpgADUg9WPteb/kTitNV43EkgNvfu7ctdj4aw9ATa849ZX5hqIzNY2Y4
	 eos6ZgyJKVNsQ==
Date: Sat, 25 Apr 2026 12:31:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	robh@kernel.org, neil.armstrong@linaro.org, gregkh@linuxfoundation.org, 
	dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, 
	wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Hawi
Message-ID: <20260425-unique-powerful-zebra-cf5d42@quoll>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
 <20260425070002.348733-3-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260425070002.348733-3-ronak.raheja@oss.qualcomm.com>
X-Rspamd-Queue-Id: 376AC465E9A
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104510-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]

On Sat, Apr 25, 2026 at 12:00:00AM -0700, Ronak Raheja wrote:
> Document the M31 eUSB2 PHY for Hawi which handles the USB2 path. Use
> fallback to indicate the compatibility of the M31 eUSB2 PHY on the Hawi
> with that on the SM8750.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


