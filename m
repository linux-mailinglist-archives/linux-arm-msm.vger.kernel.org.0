Return-Path: <linux-arm-msm+bounces-101351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPoqBkgZzWnOaAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:10:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3137AF91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35EB3301A306
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 13:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898F638C2DF;
	Wed,  1 Apr 2026 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDq6FwOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FD4348883;
	Wed,  1 Apr 2026 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049025; cv=none; b=R8u2LipnJyH+N1XsXTmM5wQ72jzqItQ64wDiGikOZPZkcGIOEBggG9AbGpj1W5mN+3cF4S/DCxjV+BRAeVNcgj7pkSxFWxbo5NutMyb8sOugwqEUMOq6eY5oOBZav43+8VyUxYepyFk2u5LpiWZiQXXh6ZAHZmLgZI8z2BZ6MtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049025; c=relaxed/simple;
	bh=vLiBS5Uw3iuwKIpYa72ivsyYGQcntQs+xCU93VpVqYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwlMT0Sl3ahnIoMNfP8qR8FhI5+bP93i0CjfKvcOOubEO/5Wz3VCPaE8DPkVw3Sp8nInW4skXCIcrZ3H8FFh9oVbpjggFxc9gyQAQImfEZiOETxaorc7gFbclYqZCi50I0Age+Y7ekdGzLIdGzKIBFxZe94eVcAvh/eh4Yd5tRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDq6FwOg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEEFC4CEF7;
	Wed,  1 Apr 2026 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775049025;
	bh=vLiBS5Uw3iuwKIpYa72ivsyYGQcntQs+xCU93VpVqYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kDq6FwOgFS+Kbr8iLp9i5r0qu1GEVJMso/YTxhvo44lyWavq28NEYv2ZPF0ONh+VS
	 CYAElTyJKIvNz/uBGqSlxTPjK+H2YEO5eMoWSVkmYaYQHpu3agAsQ7c3wUy58clvN8
	 2g1PQkkEp0e7VliYF3wrphrDE2i/oUNsXkDxo+h1Ro9o6hQzXD+5o1/jwjLTABiR+s
	 FFmNFrb5x44lKUz034/fAAa3hGYnTx6uQkjgfdffDpQYIDdBwaLOF5NPpThS4AaLWk
	 YlRJp6iY5ZS4E/gkupTccavvk/pr/0qjENvX4S+QxM2ftjbrCb2t+/eCWQyT0zxem6
	 Ij0aC1pNs+azQ==
Date: Wed, 1 Apr 2026 18:40:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Hawi
 Platform
Message-ID: <7guwvnqtq6oqeeqcs7s5nsscra5r2nzujjyecbftpijbb7pp2g@rfverjuxzf4g>
References: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-101351-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: BDF3137AF91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:21:26PM +0530, Mukesh Ojha wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> Hawi Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 7c4d6170491d..7dbc3ac6c5c9 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -25,6 +25,7 @@ properties:
>      items:
>        - enum:
>            - qcom,glymur-ipcc
> +          - qcom,hawi-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
> -- 
> 2.53.0
> 

-- 
மணிவண்ணன் சதாசிவம்

