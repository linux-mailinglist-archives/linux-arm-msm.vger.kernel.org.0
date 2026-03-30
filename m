Return-Path: <linux-arm-msm+bounces-100661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH+xHiACymns4AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:54:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B06355669
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C484D3006530
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0B578F3E;
	Mon, 30 Mar 2026 04:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFqDRF8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD87611E;
	Mon, 30 Mar 2026 04:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774846491; cv=none; b=VhPoOVxTuR3Gw+Ar+0nARk+ihrjob2gpRJC1bGztULhue2uaGWSanu9SVRxFStXCelZaz559k19Wwk+pXEDgDyTXjPi+RaovYNjlXzNe+/0ZGrrTwvlSbt6bdM5bposEhJTHkEKJitYIiXzr1grQ4VhMK2ZFG9Rp7JzD+CYflNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774846491; c=relaxed/simple;
	bh=GARBFP/N99oU4cHxmlPE93FsIje68UDytBptCpVarSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIvAe0Wqard5LAbqiokNtWM5hTzFMdFtML7xB58vB8tjZvJbaCIWq1lCKxw9xUL8DUsNitanXuNUt+PURSPWj1aBkOTIoYGKyngGjA1zxHDZTGFccXEMtyHWUChglZFVfT8YAgl2fS29VPN0VhiKuAeGqkcYunMb2c7scHkSrsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFqDRF8T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F211C4CEF7;
	Mon, 30 Mar 2026 04:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774846490;
	bh=GARBFP/N99oU4cHxmlPE93FsIje68UDytBptCpVarSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFqDRF8Tf+moSRAhDLnoa3397jZSQssObvDkNoO+8B/BmL7YZ4VQjoJQ1Qx/zeSm5
	 Lwdo6y8kuqGrS4SHSev/tc12CfC4dj4GEcprCGGTq8q7277WYhnoNSRPco0GD4T2pu
	 msObGEeMF+D0vsp1CENyQlvd5o58/jlHmpk481cwYykmCFQXZNP9fWjr95kSN77+sc
	 Gb0+9mqb+C+rqISMufUQifglT6V7+eym3qoU1qhkCkrpUXmwb1oYQ79vGhOmFi47kf
	 wGGn3hgy6vjy0eY4xOE+xEFkwBD8GcMdydhcP0392vSTxUmthnupTBkOpG6cSRbwne
	 lks5cP5O3n3AA==
Date: Mon, 30 Mar 2026 10:24:44 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
Message-ID: <acoCFMdKRviiMZRp@sumit-xelite>
References: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100661-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E7B06355669
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 13, 2026 at 06:41:59PM +0200, Dmitry Baryshkov wrote:
> On Agatti platform the ADSP provides FastRPC support. Add corresponding
> device node, in order to be able to utilize the DSP offload from the
> Linux side.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add more FastRPC context banks (6, 7)
> - Link to v1: https://lore.kernel.org/r/20260113-agatti-fastrpc-v1-1-e210903ffcb1@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>

This patch causes a critical boot regression on RB1 as per the CI test
report here [1]. I see this change already landed in this merge window.
So, either this commit has to be reverted for v7.0 release or an
appropriate fix is required.

[1] https://github.com/qualcomm-linux/kernel/issues/359

-Sumit

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 7815ece261ea..217d465df846 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -2287,6 +2287,47 @@ q6routing: routing {
>  						};
>  					};
>  				};
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +
> +					qcom,non-secure-domain;
> +
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x1c3 0x0>;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu 0x1c4 0x0>;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x1c5 0x0>;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x1c6 0x0>;
> +					};
> +
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +						iommus = <&apps_smmu 0x1c7 0x0>;
> +					};
> +				};
>  			};
>  		};
>  
> 
> ---
> base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
> change-id: 20260113-agatti-fastrpc-e3fe4bea2b42
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 
> 

