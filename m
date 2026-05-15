Return-Path: <linux-arm-msm+bounces-107745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEMQHQ/kBmoHowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:14:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BC754C2DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9849D30C8049
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C98D436344;
	Fri, 15 May 2026 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mz8RiG6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F7842EECB;
	Fri, 15 May 2026 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835919; cv=none; b=uGdJ+mBTYoFsL8fobZz3/MCx+l94OEwG6HCC00+gb/RWOqAUq0+Wj2Nznr6GRe+Q20R9jJBjYmnTnZnqAjRETDcg61vf2Zt12lyXb1hR1Cv1qJYpeHIVpzZTLvAY4jwpVCeW8nrIkQ8JOtpUqyNj9XL3WIV0Kxbp5x9ByWMP0yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835919; c=relaxed/simple;
	bh=VhEicRlMGtAxi84+7aRzrOdl65IYWc39h+MlbwpsgyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8WfdEr0mxVDMpFCJvY9d/X0sZMA3LsPttZBduhffAw2BtyxSd9V9AMly80e5cWkY4MTxORuRWxUOfPmD9Nhc90QICueJClsBHRHAz3xjq2o2Rr0H5CUc6Ewk7o7j5gDpClOK1HNNM/4QGM2kyu7BpjHByLiKxqDRyH+1EXr2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mz8RiG6M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3C5C2BCB0;
	Fri, 15 May 2026 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778835919;
	bh=VhEicRlMGtAxi84+7aRzrOdl65IYWc39h+MlbwpsgyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mz8RiG6MWE1K2cXAsl9A3PilAfmaqcx0jggD4GcV7yN04GpzJ2c4AxOUpsUjRJ94D
	 TzSAQc/pXKvrllEa5eUImkeX4zvBHhx1qc16a+27L4NB1roVeh8XOWgzYnC3zsLlv8
	 XuEXp4hnhEDZxGNgA65jSKQ/UoDAoVlb7RqstBfVWgiTWPGgK07zluzIch1on/H54L
	 apa9DMN/qPoD3fAzD9kWU6y1ASZ7u12YDW1ponjbWOQjoLz9iPecNX8t5MNFYZSj7K
	 HrNz5mvqUIxU3ySfenM0sS70AGdiitZZF5p7p3bT3m9DPrtm/haXquFFZngLHY116t
	 mYrYY2pmEAdMA==
Date: Fri, 15 May 2026 11:05:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document the Shikra
 Temperature Sensor
Message-ID: <20260515-vague-squirrel-of-memory-16d170@quoll>
References: <20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com>
X-Rspamd-Queue-Id: E2BC754C2DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107745-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:00:58PM +0530, Gaurav Kohli wrote:
> Document the Temperature Sensor (TSENS) on the Shikra SoC.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


