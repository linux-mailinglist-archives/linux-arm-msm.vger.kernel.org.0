Return-Path: <linux-arm-msm+bounces-101845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF2hG0IZ0ml/TQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 10:11:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C561939DD22
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 10:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B3F3009521
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 08:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE0936B055;
	Sun,  5 Apr 2026 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQUpowD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE4B1552FD;
	Sun,  5 Apr 2026 08:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775376701; cv=none; b=Wh7+hdL97S/+qwQQB7/1PJuNzqjCd1oV/R0W25VzjC5d/g0rDsTQVnrrUNZP4Ur+UBGA/HXVpg64cOt6E/yukWbSMdSorQKw5lS4EjoPLSQCujnJg4cVio2UhfkCSjzfb0yg5V2a6rG6cP+g6r/6Lvc2c/UitIEQOLM2wvMhlkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775376701; c=relaxed/simple;
	bh=7UfPCEFbats5jsbvRd8xvynokly24e41Cu/Ubsv8wBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mmrn21NxVrCRlHo0LbIwphvWe2CVZQ0Js/UcxsEr+71JPQLaDBo/U53SASOQliLZTepVvunI1jNxdKMT32nAWq6pgA2Jjoi7he46LW2F71vyuTbnQLzONaG5tFIj7h2s/siaS+j4WyitYypiMg1hwyjzI5+Ml2ENnLYXAKZ65m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQUpowD/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8D6C116C6;
	Sun,  5 Apr 2026 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775376701;
	bh=7UfPCEFbats5jsbvRd8xvynokly24e41Cu/Ubsv8wBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQUpowD/y3PS7OIxeQqL89nzC39cTKcsBM5wGHTuUldPvS4cDbQdpnEX5Xn6ZbIGF
	 SSMVKz0inLwyvh09/J8DqvU937JPURuGXF+P5rel7tSi0mCztfnUm/fBKJV7s5xiCp
	 13mWKQH7kdi90AXiuSk5NLguSWlmS3v6xe0MSGwWd2+4P9H84Qe9Jjf6v2Od1ATtJI
	 JB2sT4mlhZoiPI1rMv9UCXev61y3KdVB9/75dbKgN4NrKi5ZH8IS9F6ACsQpexpVDv
	 +Yvm5NN1SbZcLm/D96lDhv4nQANcu7z7GvErPIAhNMwOZ9H0N66vx9YOTm/Iqc34Sd
	 LIH236b9RpPTw==
Date: Sun, 5 Apr 2026 10:11:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: update PCIe port label
 reference
Message-ID: <20260405-screeching-angelic-stoat-2bbb34@quoll>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-2-895f8fc494fc@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404-rb5gen2-dts-v1-2-895f8fc494fc@axon.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101845-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,axon.com:email]
X-Rspamd-Queue-Id: C561939DD22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 10:50:55AM +0100, Joe Sandom wrote:
> Update the pcieport0 reference to pcie0_port0 to match the label
> rename in sm8550.dtsi.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index ee13e6136a8259d28540e718851e094f74ead278..e821b731bdc496c872703723df02ae9b9b0233b5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1012,7 +1012,7 @@ &pcie0 {
>  	status = "okay";
>  };
>  
> -&pcieport0 {
> +&pcie0_port0 {

How does this even build?!?

Best regards,
Krzysztof


