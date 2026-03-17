Return-Path: <linux-arm-msm+bounces-98085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFZnLc4DuWmEnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:33:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F3E2A4DB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C631230039AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88B43914E4;
	Tue, 17 Mar 2026 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YntWHKC9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CE938CFE9;
	Tue, 17 Mar 2026 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732803; cv=none; b=C2Hy/BrCcyJMnUEeyrdUf4zoyAf+DR5NBGMT5pxNCQGAXiZNWbHa8e0GWR3lR4Co2C9lqXz73xZoAtGv9i7EC8Cy3h8b/aiA9yEgKtPxlaUJw6Nuxt+qPLGWiakkIGT8lhGtjbWYEPgeqyeX1T75GeX7/O+kdRlxSw94dinruhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732803; c=relaxed/simple;
	bh=8El/q3asOTy7/Qcfil/zw5ZpPLTBRydyo+p6YdyFo20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0h+zi5lhMFBHZDEjucQkBl5WkuhxyimFSelD8tO5AWSdyGMMpYu5iu1FSlVyiPKbsTprRw3bpNjXNX2VQkotNURTmyatDI8oQ49tblTiW8W4+YyN1UEQREh3q2PNXe0p4DpduhFYPIMCoiv+onkYMU3OI7/0h7TTv0KdfQn67A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YntWHKC9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71C1C4CEF7;
	Tue, 17 Mar 2026 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773732803;
	bh=8El/q3asOTy7/Qcfil/zw5ZpPLTBRydyo+p6YdyFo20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YntWHKC9SzxYXZi3l96kv7Xj+ax6mK6zu+wW+ZmH6Y5bgRFe2wHSwx+LnhEGMw2nm
	 BY1dd9Vbq4EkphSTHXKg9b5E8Ffkm7Lya2tjdK9ha0v4d+Tvt6raIakNYITDevr5+g
	 jBdsnLQPWZX7DX6WjIFmFZcTuFqYaOe8SIqPAhwRG7ITWZTqSE6JjQsjoSyJ7mQd8f
	 SbDMKxb2+cPETC4HvULeoRA0pVMtNYKdETX8ybGXVcW1vY2Tss542VQux3ERgTU1Ce
	 Jeo5/VghxnL/Rfsdp4ygoTChrQFR3Fko5FvNZ/9M790sty1fl1Dlfz12TlMBMRVJCX
	 H8BKWb18EamEw==
Date: Tue, 17 Mar 2026 13:03:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: purwa-iot-evk: Enable UFS
Message-ID: <sh5vzyw5lxafgjm5kbihirzsqt2dzc7tqdee3sydd37qykclpc@vimbya6opzc5>
References: <20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260317071311.1696361-2-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317071311.1696361-2-pradeep.pragallapati@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98085-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 60F3E2A4DB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 12:43:11PM +0530, Pradeep P V K wrote:
> Enable UFS for purwa-iot-evk board.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index fe539b1f4567..e9cf56a415ac 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> @@ -1497,6 +1497,24 @@ &uart21 {
>  	status = "okay";
>  };
>  
> +&ufs_mem_phy {

Nodes should be sorted alphabetically.

- Mani

> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l2i_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};
> +
>  &usb_1_ss0_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>  };
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

