Return-Path: <linux-arm-msm+bounces-101837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MwyO0YT0mmVTAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 09:46:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6761239DB12
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 09:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DF6A300652F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 07:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBD43559D6;
	Sun,  5 Apr 2026 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVmFh9g3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC133A9FC;
	Sun,  5 Apr 2026 07:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775375172; cv=none; b=C83TPNDZpEr/C7m0C3tFFKo+wVsvRn3PSoLh4bE5xrIVtICWnW2nxpsnHQDo/58r8/3KqntsHxkCbPY+ky6L+1xGinSmUFFVO9/phpjSUhx6NwTplXKva70IfRWa++PM6eLuujB8kxWUteQljg64Q9P70K5Sbg0zp/gLqzn9zJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775375172; c=relaxed/simple;
	bh=7F2UHzJ9MfV6kZMBivIb8HWv6uMy39kAuKZGCnsmTqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQTpNVV+2bmU+1LI8bn11sJwrjOTLiHCxDORiHJT/FRW9tDtuvYfmYwOKjDCXdg9+Pv2LleAznhsnyzOgZyYe/pEP/7v6VH/plOjBE2ecEkO5TwVn/zf2s5Wg1X03ERDfwGqPFC2yTt1i1nZhDbQw0yeAbJ/a10y20cKlHfcvJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVmFh9g3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E775C116C6;
	Sun,  5 Apr 2026 07:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775375171;
	bh=7F2UHzJ9MfV6kZMBivIb8HWv6uMy39kAuKZGCnsmTqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVmFh9g3M/F8SFD6gowpw8f681mXuf08h9uSRlBnYizjJCka6i1Y/c+GHg4uTDSB5
	 qL31yRdpcEmGhsZqL59p9VdjxSHoJDts49WahKy+nB/ml0/i0Do9JG5OTVCKQ2u2Bp
	 KMrZectxvCrNChZq6o3yr7eV58dIiE1tgHZtlsjRmsHMgHxRxQRlUHhq7oAF94sVwO
	 sFPWYvvpCRtZV3ngZsfMSkJrusyF81Qc1AbwqpEax9m0B8r9ZKemoQKl0RPdojnQOd
	 pja8B4GDn1BVMnT8GQsxdfW7pK8I9+SxqGiueFy3msMKXBPmL6ZI5sn+ba2OZ6eGlL
	 ucRcv/hEAIWCA==
Date: Sun, 5 Apr 2026 09:46:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Richard Cochran <richardcochran@gmail.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: clock: qcom: Add Nord Global Clock
 Controller
Message-ID: <20260405-resilient-ultra-tapir-7fbdc0@quoll>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-3-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-3-018af14979fd@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6761239DB12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:10:51PM +0200, Bartosz Golaszewski wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add device tree bindings for the global clock controller on Qualcomm
> Nord platform. The global clock controller on Nord SoC is divided into
> multiple clock controllers (GCC,SE_GCC,NE_GCC and NW_GCC). Add each of
> the bindings to define the clock controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,nord-gcc.yaml   |  58 ++++++++
>  .../devicetree/bindings/clock/qcom,nord-negcc.yaml |  60 +++++++++
>  .../devicetree/bindings/clock/qcom,nord-nwgcc.yaml |  55 ++++++++
>  include/dt-bindings/clock/qcom,nord-gcc.h          | 147 +++++++++++++++++++++
>  include/dt-bindings/clock/qcom,nord-negcc.h        | 124 +++++++++++++++++
>  include/dt-bindings/clock/qcom,nord-nwgcc.h        |  69 ++++++++++
>  include/dt-bindings/clock/qcom,nord-segcc.h        |  98 ++++++++++++++
>  7 files changed, 611 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


