Return-Path: <linux-arm-msm+bounces-110365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP2OHDLKGmqA8wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:29:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D57B760C7B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E71F302A2C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 11:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A7D3AB26C;
	Sat, 30 May 2026 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Umqe50gl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71737DEA3;
	Sat, 30 May 2026 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140578; cv=none; b=b6UBt7I9Fgoqi0NmvnrCCzpNUcdqeXONl2pIT1y1lyxSXCNalUbxG5swGO/6V6+xJinBEV6y3aQZOr1ZrItzKhtAL/DsaRv4jRJArssvEf2A1VWohRQBmK4yFK9/SjReNPOu3P1Z4yM9m0PiGiDJmhUbPkQwRB8sTC4WKn5LIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140578; c=relaxed/simple;
	bh=NSiFQZ2RKl8SPhFJOxQlnPaZ5YSoOrI1ANKFZ44l0SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWQREpVrl04lBTMQWvg9muBBa4hfut1+dDIvfDlmu/v6TfH654fxRwQnm38eQRTb47D56d0XYDPbbHWGvQdlLdUKNR04w1I+J5ey7LpUNeG58mw4JEyoPQwqsbQJKUlvqEpWyyNUHgazsMaZw9Kpwyk7FOS8JZa3qRfwTexFUqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Umqe50gl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7841F00893;
	Sat, 30 May 2026 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780140577;
	bh=caDctztsD9NEHBzoGl4OZ6lBZyE3vGnaD092WSnN5Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Umqe50glF+LM8qRapejUH9Yj4Q79KaOSMc/fXA/aLkptiM7aK7qvhgKxD/Wk6VDg0
	 nTAkpXxU+JTH3fpvsWWRkTDtuU1o3wbE2aAzl4lXw9/lJ8M0NBxKmZVuaPyPxou19W
	 TdnUl+ND2hO43bsT7D1g40j6WTG90Pf45X/tGD59CUzz1liyvocUg1d4S1fVQUcF5v
	 aHRRD8zQ0/ZdBYwsMmutWYV35E5Q4Sd4C8EUsVbdIwGL2uOtslxD6t0sSOGwdzKcv+
	 YK14P06W4Ae/LzztdnluirUzY3UEl+jifETiBlXJDVlEA4JoG9Od1LGOPv913bgGMY
	 Jdzwl9WdYqHPw==
Date: Sat, 30 May 2026 13:29:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add the definition for the
 USB3 DP PHY reset
Message-ID: <20260530-venomous-ultra-sidewinder-42bccc@quoll>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-1-6d9e7fee2998@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-1-6d9e7fee2998@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110365-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
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
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D57B760C7B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 06:24:44PM +0530, Imran Shaik wrote:
> Provide the GCC USB3 DP PHY reset definition in dt-bindings for the
> Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +

So just squash into the dependency.

Best regards,
Krzysztof


