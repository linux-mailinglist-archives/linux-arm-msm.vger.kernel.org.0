Return-Path: <linux-arm-msm+bounces-99767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEz7N/g2w2mwpAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:14:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62131E3D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 383C33024A4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 01:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5145F245031;
	Wed, 25 Mar 2026 01:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpmPf7Yn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34A2405EB;
	Wed, 25 Mar 2026 01:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774401266; cv=none; b=eqWbAMG0mDud9aFkCt8b4vBoJHJyBVPhHNhVdXLSDu+K43vwl6JFbX3GYtaEhjFwK3BIEv6kywl/SF0avKD2/MpVlCF/8VWB3swCjZn95iquixvINyXv31/aeWlOJOKGcHcTtaixKqdcxQx9axEIj41kelT4x2dULCDozwkMaSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774401266; c=relaxed/simple;
	bh=S8BI2P330ZjwwGF6z/VgxwX2qbSHNF7Mte0IZ8JvwiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdL5yUwrNxQxLXjWlfSJyD9UMnuGEtDBgfSVBEMh9AQqZlp/k6k2JubL1JohzJBrwdxj0PLJBt4FR7tRwW+hco6d5kMt3o3XdUllfKlBfqoULCUFeLhi2Cm6AFetnjzCdON3N1EtjZ+HhmHG5u4PorDCi8NAtYrYUJ9slyZmpkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpmPf7Yn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8F2C19424;
	Wed, 25 Mar 2026 01:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774401266;
	bh=S8BI2P330ZjwwGF6z/VgxwX2qbSHNF7Mte0IZ8JvwiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpmPf7YnNALIGvzsLqB2gTg3qUrDbh5OZ8fthLj9Vx88CGuNULGmuOaghLdBTTSV7
	 3HAv57U/G/hKQVhOdWpcLxdKQ4PwP3+B9MLMRFkoZc9u/xZkQmHtg3Z23E8vkUXxPR
	 DyrzF3Bd4x6AQpTf7Z+nN8I6B86BL9wFh2y+aOGtIhdNM6KCxE98mZ+okjxWzt7lqp
	 5xAcRcFFoh6mbVpytbQ4yqIuo2+jYKH83BBElrG7YOIAc7oXu941/TpI2kEkiReXnN
	 rjgPaodqopSTj0V9ZvPvWTylPEzWO3o8MAL2SakDP7KokR3dS5sxQKpakTzPvyyEMj
	 HaIU3TpKuAJBA==
Date: Tue, 24 Mar 2026 20:14:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for IPQ5424 and IPQ9574
Message-ID: <177440126411.2378369.11749772867918660874.robh@kernel.org>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
 <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-5-3bcd37c0a5b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-5-3bcd37c0a5b5@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99767-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B62131E3D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 09:54:16 +0100, Krzysztof Kozlowski wrote:
> The qcom,ipq5424-dwc3 and qcom,ipq9574-dwc3 are already documented in
> top level part, but they miss specific constraints for clocks (IPQ5424)
> and interrupts (both).
> 
> Closes: https://sashiko.dev/#/patchset/20260319092348.35237-2-krzysztof.kozlowski%40oss.qualcomm.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml     | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


