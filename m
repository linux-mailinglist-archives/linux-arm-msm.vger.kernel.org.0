Return-Path: <linux-arm-msm+bounces-97699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLm4KQw5tWl1xwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:31:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C1D28CB43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB7E3302307C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF863352C35;
	Sat, 14 Mar 2026 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChtxVBIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF022E612E;
	Sat, 14 Mar 2026 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773484295; cv=none; b=pU5R6Zc1a6psY9kMJ4VqQOYq00qZc4V3xRHVHS6iIn6y7j5KRx1teKMZ1ZZiyp3Sg4y3ZKdfPWVnfjclYjLzhovxdGD0isIkaZHMOONeZVEZyNVvWYyXl1kNNeTHemgi/oEBvku44Q5K7fWc2LKD+ZIFv8KbcpkbyI8TzO/qAzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773484295; c=relaxed/simple;
	bh=LOpBcPmiz65yQPMabm1soXIP//CFqFfvhd3glcAaVgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2HLnSte9w3itMJUia4QM/BYkY9EX6+EtYhJpA5kNMTLPIrdmGBfl6C3Dk/fiSsnrRFRTICLYy1WNEuLM2gIzEIiBRM01jZwutoyMOIbBCO3OfIULnFktOcLBt/8IhsWrj4tVaVVjTqsk5OFrgvTaaI60sg5GwXH2iZJhMJvqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChtxVBIV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9762C116C6;
	Sat, 14 Mar 2026 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773484295;
	bh=LOpBcPmiz65yQPMabm1soXIP//CFqFfvhd3glcAaVgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ChtxVBIVch0lXbni2cbjSJ4ha5d2BQ8gRjDthjrdzA/MgeqjIGLNz8tDdpuARK54x
	 ehPa4UipzsE8uX2JPJSnFfFxGbLUW1ZJc1lOvrVJmiTUG3rZVaZ23BauQIJaNsl/LN
	 a54uN7UE3fcyxGg3B+Shi/pMglEDGFLPDEp+3pCtNidPsSNuLxH7tQhqBr7myoaMas
	 ithGTHlg/9RwVeu1Jj0MbBIavy0FfclfsTcwhZrDqh9vBSh33BO8/UhI02QhtkQYWo
	 28xKsY09y09k/LwkzLAqGRAayyG7bk6JRAzBQPiyUNM2zEv2yfmF87hYu/W4DWpvZm
	 9rvyzGCLztUtQ==
Date: Sat, 14 Mar 2026 11:31:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aastha.pandey@oss.qualcomm.com, dipa.mantre@oss.qualcomm.com, 
	Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Enable TSENS and thermal
 zones
Message-ID: <20260314-accurate-curassow-of-acumen-c05e67@quoll>
References: <20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com>
 <20260313-sm8750_tsens-v1-2-250fcc3794a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260313-sm8750_tsens-v1-2-250fcc3794a2@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97699-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,quicinc.com:email,c228000:email,0.0.0.14:email]
X-Rspamd-Queue-Id: 21C1D28CB43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:04:18PM +0530, Gaurav Kohli wrote:
> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>=20
> The sm8750 includes four TSENS instances, with a total of 47 thermal
> sensors distributed across various locations on the SoC.
>=20
> The TSENS max/reset threshold is configured to 130=C2=B0C in the hardware.
> Enable all TSENS instances, and define the thermal zones with a hot trip
> at 120=C2=B0C and critical trip at 125=C2=B0C.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 897 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 897 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index f56b1f889b85..db2a97cb228d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +#include <dt-bindings/thermal/thermal.h>
> =20
>  / {
>  	interrupt-parent =3D <&intc>;
> @@ -5457,6 +5458,902 @@ compute-cb@14 {
>  				};
>  			};
>  		};
> +
> +		tsens0: thermal-sensor@c228000 {

Please read carefully DTS coding style before posting patches. Actually,
read also Linux kernel coding style as well.

Best regards,
Krzysztof


