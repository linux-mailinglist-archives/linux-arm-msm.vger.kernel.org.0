Return-Path: <linux-arm-msm+bounces-101498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB75Mmg2zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:27:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB5386E75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8D7F316CBD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5916C385527;
	Thu,  2 Apr 2026 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCWYL88R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A093822A7;
	Thu,  2 Apr 2026 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121586; cv=none; b=nvA/aifhU/2PIexZVoh+fv/dzD+i1dLbkrC3IkgorPwKye9E1ltVrwG3i1Pp8abPZ9BvuoVp4idfMfvYEbCc01jIf5y8jzDU/kfLi+nBxVwEnFpynsFdFh1c3PKPYYqWrTUMCpCX9v+nrMKvsUYh1oE2Ir5mh9kGEiH9+F4FIiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121586; c=relaxed/simple;
	bh=fbYwmmTXFhK9gfebZcRGmMsg9zCV1cVyUZuM1KXvMsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udl914R8WDNuOalZb8Ec4ZAUI/Kn74rYKYB7VVvEBKoo3rYRFRQEQeRf3KKgS/js/3xWy3Nc8Dwmf9ChHejo5kk37MlL29J/mWaiTVyuwJ80FpoCIJ7wNisf9IBHL7St8soQb5W9DhTWh+HvZVrKKBkN9gLR8fk3kghfQp7KxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCWYL88R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF8BC116C6;
	Thu,  2 Apr 2026 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775121585;
	bh=fbYwmmTXFhK9gfebZcRGmMsg9zCV1cVyUZuM1KXvMsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCWYL88RcwZ3m7Obfq0ddMm1ricLOzFDeqKr2peX8upPcWgjCCqwG5NDwE/l3yBkF
	 mnKFliDfZqYHLRANFOaOgRIgY4qJjWKN8snbAYGzGQDOVu+Y+VHz06bgyiwTHYwoNJ
	 v6AtG7T53YPOeHYY2uotqrkOgSt13tKOM/f0zwHdFqySuCw2tsyPCq6BPcKJptyMef
	 rcAtoR8C3tNdf3hXRB8V9rc27zPCmVTDyS6p72o8ETwXDnfyvLzfFgWQ39+mzo2w2h
	 /zXoDOtPuhl4riVxGT/kMC4C2PdzA/5pemI18pumbxUELON8r2OOz5sEnTtxPGC9hT
	 XxmQ9/nIqKCSg==
Date: Thu, 2 Apr 2026 11:19:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: cache: qcom,llcc: Document Hawi and
 future SoCs
Message-ID: <20260402-dynamic-axolotl-of-tempest-eeeb7c@quoll>
References: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
 <20260401-external_llcc_changes2set-v1-1-97645ede9f6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-external_llcc_changes2set-v1-1-97645ede9f6a@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101498-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 57EB5386E75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 08:01:34PM -0700, Francisco Munoz Ruiz wrote:
> Add documentation for the Last Level Cache Controller (LLCC) bindings to
> support Hawi and upcoming Qualcomm SoCs where the System Cache Table (SCT)
> is programmed by firmware outside of Linux.
> 
> Introduce a property that specifies the base address of the shared memory
> region from which the driver should read SCT descriptors provided by
> firmware.

Subject - I do not see any future SoCs in the binding. Which future SoCs
are you documenting here?

> 
> Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 29 ++++++++++++++++++----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> index 995d57815781..ca1313de10ca 100644
> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> @@ -11,16 +11,17 @@ maintainers:
>  
>  description: |
>    LLCC (Last Level Cache Controller) provides last level of cache memory in SoC,
> -  that can be shared by multiple clients. Clients here are different cores in the
> -  SoC, the idea is to minimize the local caches at the clients and migrate to
> -  common pool of memory. Cache memory is divided into partitions called slices
> -  which are assigned to clients. Clients can query the slice details, activate
> -  and deactivate them.
> +  that can be shared by multiple clients. Clients here are different cores in
> +  the SoC. The idea is to minimize the local caches at the clients and migrate
> +  to a common pool of memory. Cache memory is divided into partitions called
> +  slices which are assigned to clients. Clients can query the slice details,
> +  activate and deactivate them.

I don't get why you are changing this. I read it and still cannot find
the difference.

Introducing irrelevant changes only obfuscates the work you are doing
here.

Best regards,
Krzysztof


