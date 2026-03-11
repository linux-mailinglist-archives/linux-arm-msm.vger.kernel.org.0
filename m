Return-Path: <linux-arm-msm+bounces-96903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIkhKigusWkVrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:56:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C0E25FD2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CA4332B1003
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B193BE649;
	Wed, 11 Mar 2026 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYMUODGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE135AC37;
	Wed, 11 Mar 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217986; cv=none; b=Iml4ZiHAD0cCuamtRUP0tj6p0MaSwNxN8jkEvWjo4jQYgNC6Q0Y4MXpKpwPIlAydco/vp1ysSDlFPiJuHTdelhTWNsa8cnhpydL9siBWnb/Bh0XzLQIO/T0B05BuVVK4pWXjDyZjLYhSSgyTjxDIkPTjS9PzjCT0Gu4PwBKbKu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217986; c=relaxed/simple;
	bh=Qo+PJNpHJ9Md7YVDAK1mnfNEfOfjGMzCvy0YD3nVYtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/Lsi2VjEYKrz6Qr/SwFoiF3M0wfIt3XOgcsA7KngJgs+WiM3d80J0dWe7vXH+7atSyQxa+RBlEetyf3IXDERORT4sbsw/VGAZZhnuvt8e1Q2NAiHc3lTLceHvJ45sVj4qvnPMUcQh4UoEYs/q26RzqBDksW4gIHxp+OoZNXM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYMUODGg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA189C2BC86;
	Wed, 11 Mar 2026 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773217986;
	bh=Qo+PJNpHJ9Md7YVDAK1mnfNEfOfjGMzCvy0YD3nVYtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYMUODGgHsE+8SiVUWHGQIG96yOMSBo6lDZtP6oClHLNa3fYFEnAkd71mhxfItj5r
	 /wLogqOLZ506XX9xemlt9SFV9y3b/KykU4qsbELkpuMtcYKKunrHjgqINQYHq3+TEH
	 hFRNXV+FfBL9Lgq/an182cPlFRvWXkWBItDkYFLuZikXKCH0l4mtb1pQKujsu2fYRf
	 ZtAVo36VCysN0qVxuYzNvPOJXgzgAYQxl/qYFBGvTeMUXgf6o/y7Ceaw34YC4qxZMw
	 xvof/CHdzhvHRk2FPLZ/KfACqHN1DgG0r2BtfpdByZJ2wuSvo/ZHwLrH/BFQItCb/3
	 mSGWCpt0tjyEw==
Date: Wed, 11 Mar 2026 09:33:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: ufs: qcom: dt-bindings: Document the Eliza UFS
 controller
Message-ID: <20260311-radical-bold-catfish-d7ccca@quoll>
References: <20260310-eliza-bindings-ufs-v2-1-1fe14fc9009c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-eliza-bindings-ufs-v2-1-1fe14fc9009c@oss.qualcomm.com>
X-Rspamd-Queue-Id: 01C0E25FD2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96903-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:44:42PM +0200, Abel Vesa wrote:
> Document the UFS Controller on the Eliza Platform.
> 
> The IP block version here is 6.0.0, exactly the same as on SM8650.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on next-20260309.
> - Mentioned the IP revision, as Manivannan requested.
> - Link to v1: https://patch.msgid.link/20260223-eliza-bindings-ufs-v1-1-c4059596337f@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> index cea84ab2204f..80550144f932 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> @@ -15,6 +15,7 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - qcom,eliza-ufshc
>            - qcom,kaanapali-ufshc
>            - qcom,sm8650-ufshc
>            - qcom,sm8750-ufshc
> @@ -25,6 +26,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,eliza-ufshc
>            - qcom,kaanapali-ufshc
>            - qcom,sm8650-ufshc
>            - qcom,sm8750-ufshc

You need constraints for minItems: 2 for reg and reg-names. MCQ is
required. The mistake was doone for Kaanapali, but that patch was
applied without review, so it is not a correct example to base on.

Best regards,
Krzysztof


