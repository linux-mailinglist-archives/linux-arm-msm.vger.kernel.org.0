Return-Path: <linux-arm-msm+bounces-97698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIXKHus4tWl1xwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:31:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F028CB32
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 330673038169
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8AE352F88;
	Sat, 14 Mar 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1YESq99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CD125BEF8;
	Sat, 14 Mar 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773484242; cv=none; b=maWZql+rjYaaAh9hqmpBPwvMrpPj3+SBKQyI9OoAvEoc8IA4NLAUlhqDFtBzFXxgOpKKoH80rKVP//CYBems2ndwV9R0mrv+GPq+0vKe93Wd/fbpdDlRnz2cQkN1gIHhxawsPZgY9sQpJ6esxyue1SDoDj8qLRLHVueVakJ3Fgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773484242; c=relaxed/simple;
	bh=wFxpXjjyJQOtt4KFE7MmeMVIi7dVOR3dB2IUYazCsLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoMHiuIX3Ru93DtAvZ7a5nNz2VaogN6Um07LjviFCxZthSNbatkd5ZJvyTwzWV+JGSbKZwtZGlhmpAOIH2zU8tXKFQGLub9RHP/4+rXf1cygBTNk/K7awxAGgJQNZIEWvZ6iO0ndhfunc3gMLOKVbkTsZFzFelc9NoLT9mGBYok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1YESq99; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0A9C116C6;
	Sat, 14 Mar 2026 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773484242;
	bh=wFxpXjjyJQOtt4KFE7MmeMVIi7dVOR3dB2IUYazCsLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1YESq99qNrXTv/i03Mk6JLQKb0c9Cim+DhaKEkJcM8238vCZTsKMv8njLovSw/Mb
	 vrpSkzluDGQTXRf7LRkRSC8n41iqHcr69Jr6Wy2qXOoha7QWNIHoS5oyM06TobQ/7q
	 0iwNvcg7SN+z1e4Ul10nMwZKMI0iZkigjMuscK33UGmYCFIN84mEiW2kxZFTLsu9Qd
	 ACfFR9BjPrlEsm+WEWkpGJaS2I89olbRocsVhXoFY6sP9VuRGt8mH8lhXbPRQd02RJ
	 iDR8AweGL9kGsCV2kqiNNTTuqhIpB9qx+IoJYdhTchsn2+DelfCzEsexYx4K2bU39/
	 Ln8aHcJ1rrxeA==
Date: Sat, 14 Mar 2026 11:30:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aastha.pandey@oss.qualcomm.com, dipa.mantre@oss.qualcomm.com, 
	Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: qcom-tsens: Document the
 SM8750 Temperature Sensor
Message-ID: <20260314-macho-solid-tortoise-408b0f@quoll>
References: <20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com>
 <20260313-sm8750_tsens-v1-1-250fcc3794a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313-sm8750_tsens-v1-1-250fcc3794a2@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97698-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,quicinc.com:email]
X-Rspamd-Queue-Id: 1D7F028CB32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:04:17PM +0530, Gaurav Kohli wrote:
> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> 
> Document the Temperature Sensor (TSENS) on the SM8750 SoC.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


