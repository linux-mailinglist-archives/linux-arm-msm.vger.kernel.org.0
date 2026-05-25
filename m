Return-Path: <linux-arm-msm+bounces-109552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LQ8Ok3iE2qzGwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:46:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 515295C607F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F1B430037E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 05:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FE8356761;
	Mon, 25 May 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu6OLv+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE14355F47;
	Mon, 25 May 2026 05:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688009; cv=none; b=stBriC27IQx65iu25agGUxl7nODLQqXP34cHrESNcqezwQQnjs5WiTABb/fsTfXGl+svk9XTnQycNV8nSK8poN/BvmrIuyLocqwpDGNKORG4ESkUoT0ne2LoxMCiUvz4e2gy2cmiQJEqLaPrYgW7N05N0Z04tdn0sB7NaAatz6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688009; c=relaxed/simple;
	bh=3PpBNUsDbZNj+6hlL9eba/O6McJQzwqXiwpvFq2/8IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNwYmoBATFnUfCf0HaFbiUdwoKajs7QtJlXH2ymT5vLoaiPNT5nxcAkjqlCPbzuXS3FR7JQLjvqDylouqvmLlc31VeIh2JWF5FtCBQ6kfb5Hqi8cSG1kF6VmJ5VS2H2vf4vJvJreYS3eOERXO/dEncSQlKlomWDJHVENySUtxpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu6OLv+8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AD51F000E9;
	Mon, 25 May 2026 05:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779688006;
	bh=JkVT8PPeFnVcIjuoKyaVdPejNPYb2vnPqywFEHXMJtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nu6OLv+8aazcSA8Zvq34JcZuM+NrYWH9yFtQJkQVQ0/XLHPPEuCngmdamLzA6Iy2B
	 IwEeEoaa/EWYAXM9AuaXw0sULPq3OA4lM66HoIOJSvnp5l9kx/5C0mkF/erW/HOTQe
	 ieSMSCJ1AHvtkVqJShBtLoC0KjTyUWjfAkFy8arvaYJHwQgPDAeOuvKV6GhNkg6Zmy
	 GpkpFDhx0Td6k65o36JDSjimX1Snv9qlx5fJCHHJLhyzwVYfbgDwTTxyiL9jsOEqPC
	 aLmF5K6myf2VrpcYGsb5GTDCYHzumgb4IcBQrN6zylkuCoNshUPo9W0CFs2K1fOBMf
	 MxhDyvyby+dHw==
Date: Mon, 25 May 2026 11:16:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, bvanassche@acm.org, 
	andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, 
	luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Hawi UFS PHY compatible
Message-ID: <msok3ij2dd72wu7c25iip5d4j5hzz6b6xtmb3p5eizpyonkom7@hiajdjg6z5dx>
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
 <20260522172716.820490-2-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522172716.820490-2-palash.kambar@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109552-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 515295C607F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 10:57:14PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Document QMP UFS PHY compatible for Hawi SoC.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index 9616c736b6d4..b75015f3ea70 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -37,6 +37,7 @@ properties:
>                - qcom,kaanapali-qmp-ufs-phy
>            - const: qcom,sm8750-qmp-ufs-phy
>        - enum:
> +          - qcom,hawi-qmp-ufs-phy
>            - qcom,milos-qmp-ufs-phy
>            - qcom,msm8996-qmp-ufs-phy
>            - qcom,msm8998-qmp-ufs-phy
> @@ -107,6 +108,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,hawi-qmp-ufs-phy
>                - qcom,milos-qmp-ufs-phy
>                - qcom,msm8998-qmp-ufs-phy
>                - qcom,sa8775p-qmp-ufs-phy
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

