Return-Path: <linux-arm-msm+bounces-99764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO9+ISM2w2mwpAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:10:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2976A31E365
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 001D43004926
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 01:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CDA23F26A;
	Wed, 25 Mar 2026 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iw96E/Hj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941B522CBE6;
	Wed, 25 Mar 2026 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774401039; cv=none; b=F5p81ogtH/H5Hv7/u6lfTVKLI1WUl0PSzYKny7oA8SwWMsiWqxdj6I3HBxpPVBTnzqBo0RLg54rC5jcoJbRR1WISCvlURCR//izVgeoGZuuhV+hXWwRxv8teOgDgXbxjZFwEqdFobqgIW+0xCFwDEz5B5bErGX83vE+a+FxTl5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774401039; c=relaxed/simple;
	bh=kIFaPUL2W4C9t+swNBDiTxD1iAn9lL735yvPVMl/zcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qM/9SOkZo8GWy0fajVRz5oJFN4pkzQ9l0m2O/8zQJ4JQxjFJfQ4rEFMxecSVBEIGEH90HDioZMRahkGc8bsTn3e05jJLn5rFF9A2lAo8ZNssHAqTwXzBoVWDLK5UmxzMnBiavQ3EGc0Sn6vbqTo1HpkB5sfNW0I5tlL7OtPqcIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw96E/Hj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17105C19424;
	Wed, 25 Mar 2026 01:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774401039;
	bh=kIFaPUL2W4C9t+swNBDiTxD1iAn9lL735yvPVMl/zcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iw96E/HjwuIpWbV8J6YMuMqJmAOzueMqq6HKdHTn/hn93srZPnYeBkEhY9tj2D4z4
	 +J4br9uK9x90gYm9vhRdRrD2BeuDOQNDqX4n0xTynTUh60YlGBVAJE3EyqCyR5sQN8
	 2apgWj/6WewOBpzO3Rd9bAP+fnPUrKANi7/0tpZk6T9wwy35ne15CbnKhq4qY9LXll
	 7apyvc4A5hnH9Cfq8By+WsguR8ejPn2vPTiyLIqJu5o/03bpxQ7y1F0/1YoDW5Cg6m
	 dpsSB3K/2LZ2OdqBY4iA2YtwSLwB/KlUDLICrO0TAMY2AdrhJlBmAYFf9R0KlJVL4/
	 FrkwkdKOLHMww==
Date: Tue, 24 Mar 2026 20:10:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: qcom,snps-dwc3: Drop stale
 child node comment
Message-ID: <177440103771.2336307.8857944528551424812.robh@kernel.org>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
 <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-1-3bcd37c0a5b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-1-3bcd37c0a5b5@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99764-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2976A31E365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 09:54:12 +0100, Krzysztof Kozlowski wrote:
> After moving the binding to style with combined wrapper+device (so one
> node) there is no child node required.  Drop the stale comment about it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. None
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


