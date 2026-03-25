Return-Path: <linux-arm-msm+bounces-99766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF22Gqo2w2mwpAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:13:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC40E31E39A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBF5430576F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 01:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3079241690;
	Wed, 25 Mar 2026 01:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jI1trMgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD62236FA;
	Wed, 25 Mar 2026 01:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774401189; cv=none; b=SwwXhM95jpxGUatkN/kUi17/AgfEAaHo19XM+LxsWCt7/oKXZyY3gCeOogAEuoQkf+TCOFzspkMqWJIPZQ5AbOUCjf5whDqHAObrpvkZoBvs1CZCwA2JH63krtHcWHcOS4BSJyPaekNGd3Qk9dzGuZgRJT4DJjaAy/dY6rlgJI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774401189; c=relaxed/simple;
	bh=of7j7dc8wBx3MwuceFaBS33/f6F0eJ9Uypg72wKmx04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4FdvZKkNsJjE5Hba9haqLMQTuWU1RgSRVJsAheTs9OZKcF8sMnaFrhjNYUVgF/iVxjxtC3lveSSVn9kKyzsA8RI7THmgGhfv5T5eymdzNcM68ek5ud3lAbjw6yONAq4FOGCPw7JsmVHl5XlbaSpvD0ST3sIMsOoCRg5VIKxMqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI1trMgN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7708C19424;
	Wed, 25 Mar 2026 01:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774401189;
	bh=of7j7dc8wBx3MwuceFaBS33/f6F0eJ9Uypg72wKmx04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jI1trMgNz/GAQtqG72c86A5hG1TwN27fZpX7QZDh+IebqUvae7Jm3rarWhp8q/cw3
	 Vss7OUbmLb+Ap1vzz7wjoujI/oaMc68qzTvKuyoNo3O8p2sKdesRkb2QCmWPSNg4b0
	 jvfonZb+lM73/UN0eYJh+9UGe3AbSNFK1ry2G/XfdVrCF/QeBMaDQY7ovPVplYdZIe
	 hNh82PYKBPMWHjJBIrx/WBTertI+2BD07I+BksZL4Q5ngY6EeVpoX/b7IYdKZ3Q/4U
	 J1v++jK/jQlzKo7CcIphdORWh3sMJCpCuqKVuaF7XkPRqh71+Hhe8H43Wss82p8ck4
	 wM8arljCN0iWg==
Date: Tue, 24 Mar 2026 20:13:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM6375
Message-ID: <177440118746.2364991.10059944810340634689.robh@kernel.org>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
 <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-3-3bcd37c0a5b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-3-3bcd37c0a5b5@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99766-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: DC40E31E39A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 09:54:14 +0100, Krzysztof Kozlowski wrote:
> The qcom,sm6375-dwc3 is already documented in top level part, but it
> misses specific constraints for clocks and interrupts.
> 
> Closes: https://sashiko.dev/#/patchset/20260319092348.35237-2-krzysztof.kozlowski%40oss.qualcomm.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I wanted to add Reported-by tag, but checkpatch does not like non-email
> address:
> ERROR: Unrecognized email address: 'sashiko.dev'
> 
> Changes in v2:
> 1. New patch
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


