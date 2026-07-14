Return-Path: <linux-arm-msm+bounces-119045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DlmKOmk6VmpT1wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:32:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F177552A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:32:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kD1GWa0+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119045-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119045-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C84DC3016DD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDC7466B65;
	Tue, 14 Jul 2026 13:31:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060264657C4;
	Tue, 14 Jul 2026 13:31:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035877; cv=none; b=t/qNb7WhlU+5KUDh6oLNRHUKqoQ4WEwl7wT8vjGKeVIXIhwO8NrMz4pIOpmNG+7QzAgXzOeGAaYk8LtklqqumpDjVdvp27Fa1NmaA0smeat4zrP4e39RtPPowmTmtSq4g86EHf1bJ0cFJCbmfkQ6sqa2Bx3SSkCdfTLzX5Ru99E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035877; c=relaxed/simple;
	bh=LdF+nU+hATjvIGDGTg9m2t2mP+j2nDdQe/luswhgH2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDOXWyo/nFYpbNPxP6KkDKGIqLF1WSW3wqpYBRCvIlmA2B//eaTas+t0+knBBD4qpT4D4xCQJVkHAindP0YJpIolXPhBopQ0QUWa5wPlCWNsYh526UX5vcEg0mqUlGui8MLrh0lFkZzep+zrl6DeS5RFE8cT9vGJjPndxjrKpr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kD1GWa0+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669761F000E9;
	Tue, 14 Jul 2026 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784035875;
	bh=z5ME5/deI8bCwm6fHaOLJ29ggEdhfjTEw1poP7U+uck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kD1GWa0+c0AOQBt3Rz60TsUykToFhDFi9cV+nPCNjGHznfn6yXISclXJ1A5Xgweu5
	 eAHCevXgdHOxWs7IhUocegeTT0BAraioKdKMGWwN2q8vOoLI0TPcIzgRB3NJi6oPAz
	 KhZkQyQ8xD7yTh+wcdWUOCbAZfs3nEAE0PVmMxrSgnudY/VB91d57Lzl2HBRWAjjHe
	 aR3p0Bb164AcsTb3bIVFxq8+0U7zSWgoCPg5SUW85YvonpxLH/cfX1IgCbWZwwoiCQ
	 pJubv3soYftCrxlqVmET95bG1CNqJmstEGs/xXxs47Wq6dFbMQz8SxFVu4iwVn5D/M
	 UeRrQ7Tay1FFg==
Date: Tue, 14 Jul 2026 15:31:07 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and
 Maili MPSS compatible
Message-ID: <azywskdjwlthflnjnmtbb7dfaisvxhqer3capwttbnvjlmjwqy@opkoermevz57>
References: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119045-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,opkoermevz57:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6F177552A8

On Mon, Jul 13, 2026 at 03:02:37PM +0530, Mukesh Ojha wrote:
> Document compatible string for the MPSS Peripheral Authentication
> Service on the Hawi and Maili SoCs. The Hawi and Maili MPSS is
> compatible with the SM8650 MPSS (six interrupts, CX and MSS power
> domains, memory region).
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index faf7b2890de8..0d9fd1598b5b 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -17,6 +17,8 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,hawi-mpss-pas
> +          - qcom,maili-mpss-pas
>            - qcom,sdx75-mpss-pas
>            - qcom,sm8550-adsp-pas
>            - qcom,sm8550-cdsp-pas
> @@ -196,6 +198,8 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,hawi-mpss-pas
> +            - qcom,maili-mpss-pas
>              - qcom,sdx75-mpss-pas
>              - qcom,sm8650-mpss-pas
>      then:
> @@ -246,6 +250,8 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,hawi-mpss-pas
> +            - qcom,maili-mpss-pas
>              - qcom,sdx75-mpss-pas
>              - qcom,sm8550-mpss-pas
>              - qcom,sm8650-mpss-pas
> -- 
> 2.53.0
> 

-- 
மணிவண்ணன் சதாசிவம்

