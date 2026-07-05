Return-Path: <linux-arm-msm+bounces-116530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bIVoJ38lSmoU+wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:35:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3F270997F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:35:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="l/IhxcFI";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116530-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116530-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BA183006791
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 09:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3327A361670;
	Sun,  5 Jul 2026 09:35:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253A824A05D;
	Sun,  5 Jul 2026 09:35:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783244155; cv=none; b=PeoR67S6s8nEzOScqHbyElBySmW8H+ApLZDzS2TQV669lJv6oFHfd401Yzu7d6VkVjbJhKi4b3/mxlvXOJnquq082bhhDP69S8QLN408f+n4PrxSG7AjOOgumZ6t2ovTDjPhZ2oAe9gNvmTDIINn8n0ix285+TJ7C5SeSVEGUx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783244155; c=relaxed/simple;
	bh=o1BJHUBsPXb8Ud96OJ3zZlbU/KK4SIIrjGn5vrio3bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7UyFa8eLxjP/u+wjKH2KLNvak86PsBrVVonBLDKuGoE7eyx5koIliJ90KemlwJ+PBOtXKO1wZdOlxbJhNrYgiyc8oQHoH1PhbsyeOAR1MrHo8uNySjvv0QktI+x5XEVNWn7GfriqxSN3Ctvu4kl7TxU6i7gqRY5oiUzHqrUzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/IhxcFI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30451F000E9;
	Sun,  5 Jul 2026 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783244153;
	bh=ZUAr26t0ojsub7u6Y2sX2AnXHej3bubC6EbR5cuucDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l/IhxcFIZ3ialoR579LXwaYa9cYQ5F0VQNoFru6ywKtuCpZvEWhHTsfYT/z/iA6M4
	 q6ejThERW19SIX533KJfDsWpBv4sZSTHJbcxHTDmqMHmIR1sEUfHT69SgsV3TaLDMz
	 qee91Qq8MJSEH+mANb93JpqR3oHIGuaI0AkyMb33bBIV2zGUdGiJqzF5s85EguIKOp
	 DFnUQ3IsEXS5w59PH9z5ePMnj1B2dyViu0J+6kzhBCwE0IXfALOxB3gWt/+vNA6lnI
	 UMAwg0wdCwyST2RcjlnUM55Pu2UlrsejGPjIj7qyTbkEhnLNikJFAguRCDJ7oEfJiF
	 yhc9a3Drgc6Rw==
Date: Sun, 5 Jul 2026 11:35:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: usb: qcom,snps-dwc3: Add Shikra
 compatible
Message-ID: <20260705-vengeful-axiomatic-goshawk-c4919f@quoll>
References: <20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:robh@kernel.org,m:gregkh@linuxfoundation.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116530-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C3F270997F

On Wed, Jul 01, 2026 at 09:57:45PM +0530, Krishna Kurapati wrote:
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 8201656b41ed..026fc715eebf 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -60,6 +60,7 @@ properties:
>            - qcom,sdx55-dwc3
>            - qcom,sdx65-dwc3
>            - qcom,sdx75-dwc3
> +          - qcom,shikra-dwc3
>            - qcom,sm4250-dwc3
>            - qcom,sm6115-dwc3
>            - qcom,sm6125-dwc3
> @@ -386,6 +387,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,shikra-dwc3
>                - qcom,sm8350-dwc3

Why is xo clock optional? If it is not there, this should be rather in
"if:" block for Kaanapali.

Best regards,
Krzysztof


