Return-Path: <linux-arm-msm+bounces-100084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGTpHgYMxWma5wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:35:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7BF333781
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F52A30C93E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A123C0638;
	Thu, 26 Mar 2026 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGaYefES"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA883BFE4D;
	Thu, 26 Mar 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520576; cv=none; b=Pe9RyObDkabrCyAEzI+dGghR2H1KSR76qOjKOXjgz1o6u1QQh3bxGveZNEjZijMS4jiJ8krEbZlzfNMr0Qw1eLac5QrizKXM6VX9/QQQOn2Tj8Bm8FbYADUTnYfbKtYadg76mVQExBmFrQQDCsLgoQLPxIvAy1ETlq78sYj8QJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520576; c=relaxed/simple;
	bh=k59cDz5SZZg+FBMjsLYNQPqI2K29HiBjyL8X88iJR2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHJ15zpIAYW7eBTnsh5yRkaa/ETlxFMHERt/qdwvmnJz7C3z+LM7FYT+UIhPrT3UVzIU7INSvrdc4iHD0CkSQ3Mu2TXG5x7txONC5utAAogkr3AKC4VHHpNiX4WG9R4Hp5lbomdO56/5My549gKAHvOiDabCnBLOK4HaWDVReR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGaYefES; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75552C116C6;
	Thu, 26 Mar 2026 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520575;
	bh=k59cDz5SZZg+FBMjsLYNQPqI2K29HiBjyL8X88iJR2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGaYefES69ZvWl5IBV3tBmKpPQ0E0vXDxn6Dy+R14yuwHEkn/zmzYTVMaiXewFt0S
	 n7vvIT79MzkZ9ENuAG6jokoRkT7MMh7qJn+Yw0vD7qnDTI4ZPwdI2mPONbZO7nyzte
	 gQGeBaaNlbGpRyuCOQeC4rud0/428DDbGBZYlPDYGQywqbcqzjo+cqzQFyaDgDOQi7
	 nU/Ib1WTe2TZgGs8YlXBLdUGjfDSO7kkXzs749IMy/NJXKvfyTGxk+G2RKwG3p+eYy
	 j4CjCeXUFk69gFwV7CvR4JVS5/1Ohhd3/3nM1eIB9/HZZkso7B8Cp4MrP4Z281fqUb
	 hrUSV/CxL7HDg==
Date: Thu, 26 Mar 2026 11:22:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Document the Lenovo
 IdeaCentre Mini X
Message-ID: <20260326-fluffy-judicious-degu-3c4daa@quoll>
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-1-768b66aaef30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325-ideacentre-v1-1-768b66aaef30@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100084-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C7BF333781
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 05:34:48PM -0500, Bjorn Andersson wrote:
> The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
> ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
> display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
> headphone jack, WiFi, and Bluetooth.
> 
> Document the compatible for this device.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


