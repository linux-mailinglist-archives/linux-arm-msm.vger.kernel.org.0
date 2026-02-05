Return-Path: <linux-arm-msm+bounces-91898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDPmFSlyhGnI2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:34:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB5EF15A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83981301AAA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 10:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93066339B3B;
	Thu,  5 Feb 2026 10:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTydPk6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6292C859;
	Thu,  5 Feb 2026 10:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287651; cv=none; b=qo2HXhyN7/Dsm/A7AE+Ft56hqOImzRDEKjs3SPh+UZMGmCpAPLPGT/fk9iHoUaaduu14Vtgxjq/oLW4Ous+PMt+77Hq5XeIDqokYOHYEF7FOQowO1NSdVdYDxZvaEFLAM3MnyUyLztiDHJ8PIrV6xvCETQ4c1k2MfnOFhQpahl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287651; c=relaxed/simple;
	bh=cwXSjNmvIUZsjhs6VwwUPithsGWgsk48QoUZLaQvkRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGG1+o/3C7kK/rX9kkFsjdiaEs0j4fmpT2gAmA2pbu7f5a7VrMkSl6MsHUYgVetHV3WjLK7JPST01/EB5SjODcccph5Yq5RybOvALb5QnePgpiJkNjPX5U19K5G2dylLiBaTOP4SICbVkpwJ2gly+odGR52Einl8vgCFXoHycys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTydPk6h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7306EC4CEF7;
	Thu,  5 Feb 2026 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770287651;
	bh=cwXSjNmvIUZsjhs6VwwUPithsGWgsk48QoUZLaQvkRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTydPk6hucGwsRHGQltqdVNVaGhxmvt2Wt8/jeiaiVNsq5tfpi7HDtBAKUjChxoHi
	 IqKz2f7m29g5O6jHW/ZNN82FRasYYi5P90Rx1dheHO5PnUFCnWITGxrrrcCyAwR2nX
	 AxuIhcinKPdoGrlNCVbUmyKe9vVhPi+dLCOQ2RFIFNZwFJrKgnTS3OzuT+Vnih1SX1
	 XeYC2kG8xCRl/C3C2pr80o+nVVajtdfVbSxm9/YdJwclB9Dfvkvb7g59w3FkWhrOP2
	 b629rk5pCNSYStsJ4/3N6+my7J6VD0eIvcGW6A3RbIisX+5YmmGl6P7RoH8YX/qoou
	 4kyH692fHzALw==
Date: Thu, 5 Feb 2026 11:34:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur ADSP
Message-ID: <20260205-succinct-honest-badger-52e1b7@quoll>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129001358.770053-2-sibi.sankar@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91898-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: BCB5EF15A2
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 05:43:54AM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur ADSP PAS which is fully
> compatible with Qualcomm Kaanapali ADSP PAS.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
> 
> Changes in v3:
> - A few variants of the SoC are expected to run Linux at EL1 hence the
>   iommus properties are left optional.
> - Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/
> 
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index b117c82b057b..fb6e0b4f54e8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,x1e80100-cdsp-pas
>        - items:
>            - enum:
> +              - qcom,glymur-adsp-pas
>                - qcom,kaanapali-adsp-pas

There is no such hunk... I think this continues my comments from Sep/Oct
2025 that creating such patches, with multiple dependencies makes more
difficult to review.

I mark it as not applicable, please send when your dependencies hit the
tree so I can review it in proper context.

Best regards,
Krzysztof


