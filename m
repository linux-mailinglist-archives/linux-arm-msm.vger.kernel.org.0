Return-Path: <linux-arm-msm+bounces-109150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONUCIlaGD2p0NAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 00:25:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E611A5AC56A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 00:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73576302794A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 22:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2FA3603EF;
	Thu, 21 May 2026 22:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asNcoZ+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1414228CB0;
	Thu, 21 May 2026 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779402312; cv=none; b=dtVaMH/ppa71AvTG/O/voBaB6d3jMfwZzBKwFsBlX61rFs7w07CcMmShykjGF7dXUVQVQrdeEhztaUEF7yg48GTceyYqFzxseGtjR3PFCNA+QgjfAwErFGnWAPNlto24b6s0UvQ6YbW/YjSga5vTac7Qn4Mt71sI4jFvw73xvYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779402312; c=relaxed/simple;
	bh=OagIR4q6jOjejHScBDBB6UPRiGrYYxtTkxayr0a0C9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEFAKdKWoQdbc1PFPIyAmLMvcAlz6G30QxA/ypQE7G+y4SH0SU+Zf+4P3gtE55UYgvOVTtSlgS8pISkPfeAHY4wX+1LnK2SCgKpePdm67vnIF6BybE8OnTTHkAFpKv8ijKfgMoK/A4dNZC5GMygdJEBIPOGnraMZZVpIuuk8wVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asNcoZ+J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9861F000E9;
	Thu, 21 May 2026 22:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779402311;
	bh=b6HB01vIC+8NeoGhvRfdEE2LMcPv7EBAdjG6wl3PWPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=asNcoZ+JK/AgECAgP8ymLf83+FkAauXFYxxYmaNNBNtn0fxjVqFyMK4VXst6sX2oX
	 oWf1+G2uX1KvzdPYY1ayyKFK+cDLbIS8hpCW/UjLeDeT7yWWFwc24Cx/JNjzQw3bTX
	 E/CckjkcUrzSnUWwRZEJhHRXxlC49OjB+r3Rha/J9vaRcKCsd++rJuc7NN9txu1qxA
	 qC7N2O2tITWpTORDaQBMQZFuv5oyWsfgzxWclEjTjX3mT/h9yLkocWl4FEboDYwPax
	 ePz9eHkmSxMQ+/5CjlgA2+7hLHnlc2WUAqLEjjGnclt8EakYn9pJQcPKQt+BrnqU4A
	 dnrlROXNQun8w==
Date: Thu, 21 May 2026 17:25:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com, quic_vproddut@quicinc.com, 
	quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Configure DP endpoints for
 2-lane operation
Message-ID: <ag-F105poL3olmmI@baldur>
References: <20260521120058.2966709-1-saurabh.anand@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521120058.2966709-1-saurabh.anand@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109150-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fde000:email,0.0.0.1:email]
X-Rspamd-Queue-Id: E611A5AC56A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 05:30:58PM +0530, Saurabh Anand wrote:
> Add explicit data-lanes to the MDSS DP output endpoints to enable

As described in
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
this is where you describe the problem that you're solving.

If you had done that, we wouldn't need to guess what you're up to.

Thanks,
Bjorn

> display port in 2 lanes configuration and disable the mode-switch
> property from the USB QMP PHY node.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 72c7dc6e4f09..d6b3c5bfebd5 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -2445,7 +2445,6 @@ usb_0_qmpphy: phy@fd5000 {
>  			#clock-cells = <1>;
>  			#phy-cells = <1>;
>  
> -			mode-switch;
>  			orientation-switch;
>  
>  			status = "disabled";
> @@ -2517,7 +2516,6 @@ usb_1_qmpphy: phy@fde000 {
>  			#clock-cells = <1>;
>  			#phy-cells = <1>;
>  
> -			mode-switch;
>  			orientation-switch;
>  
>  			status = "disabled";
> @@ -4550,6 +4548,7 @@ port@1 {
>  						reg = <1>;
>  
>  						mdss_dp0_out: endpoint {
> +							data-lanes = <0 1>;
>  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>  						};
>  					};
> @@ -4641,6 +4640,7 @@ port@1 {
>  						reg = <1>;
>  
>  						mdss_dp1_out: endpoint {
> +							data-lanes = <0 1>;
>  							remote-endpoint = <&usb_1_qmpphy_dp_in>;
>  						};
>  					};
> -- 
> 2.34.1
> 

