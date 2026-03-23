Return-Path: <linux-arm-msm+bounces-99298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EYUIShQwWnLSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:37:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD82F4DFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6BBF305B8D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC2A1FFC48;
	Mon, 23 Mar 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRRbZic9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7742C181;
	Mon, 23 Mar 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275687; cv=none; b=SAqJzLQcbZOOI1GI0rXXZNzdGISWmcRkSIyHyKv3GepMWdOY4BYvfqLimGr83X74dRA+/9Z3GxYSXcIcvaqL+Y6zWGReft7I0TsvP2YKosmFwN5nZTGPkkxHBeUt/ajodbJQsvRTlz3XrC7fMhdG0CrLHHAPlnPXPIiB3afgPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275687; c=relaxed/simple;
	bh=a88TESX1Hu0X1wrFY8lw1w3IuOKX7l0HLHK4iS2EV8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2pl/md1szuztR/y/y0BklhZtWOki0J6MEeLNoKkQtMHkfonFr9G7EwFw6TjJASRcksMBCc3/bdIUyBoKObukgI7qiM4Xs6YYKYgpqOCKZy1JIPEK2lybKDR/wyU4LCy1hmLFUWgvAaxDnfrsWnraMqFxSBEGAfBtuTaemSo9FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRRbZic9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154BEC2BCB1;
	Mon, 23 Mar 2026 14:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774275687;
	bh=a88TESX1Hu0X1wrFY8lw1w3IuOKX7l0HLHK4iS2EV8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRRbZic94GyJaGb66tgifIdwogStiZ8rYWMGU7lCpdD+vrYqNyFoflHIYeMf5ethr
	 UU4d6QZsTvS1BUX5AUxaIpBRXMMQ5t/7YaIksh98yFDaY9w783liYvNcA8YLuu+siF
	 SrSfWMYEtgUBpur5AR4KvRxF5IjWGCiOHLwd8WjFLebFI5yNC8KvUOWiEpY34jPOwr
	 uutwhBCL35eAT4aWK93hQk01uiDVP/8dCtiP8hJY1mmJBOCjB5pNpFSyOD2Adek0i1
	 uqrHBdDVAYutp3bVQjZZQuU2RuQrdHScdFzGR8hX4A4wJjT2Gow9L9AOrfG73CY+nH
	 WjcIkog//9Eaw==
Date: Mon, 23 Mar 2026 09:21:22 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add glymur BWMONs
Message-ID: <acFLk7i7FMFBTbQS@baldur>
References: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
 <fcd9de7f-b65f-4a30-a74b-57bdd690422f@oss.qualcomm.com>
 <2d6d813b-b2e7-408c-bf58-86d25859bb40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d6d813b-b2e7-408c-bf58-86d25859bb40@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99298-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2CDD82F4DFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 03, 2026 at 05:52:53PM +0530, Pragnesh Papaniya wrote:
> 
> 
> On 3/2/2026 6:27 PM, Konrad Dybcio wrote:
> > On 3/2/26 12:46 PM, Pragnesh Papaniya wrote:
> >> Add the CPU BWMON nodes for glymur SoCs.
> >>
> >> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/glymur.dtsi | 87 ++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 87 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> index e269cec7942c..fd947b1a17dd 100644
> >> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> @@ -2264,6 +2264,93 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
> >>  			};
> >>  		};
> >>  
> >> +		/* cluster0 */
> >> +		bwmon_cluster0: pmu@100c400 {
> >> +			compatible = "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";
> >> +			reg = <0x0 0x0100c400 0x0 0x600>;
> >> +
> >> +			interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
> >> +
> >> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> >> +
> >> +			operating-points-v2 = <&cpu_bwmon_opp_table>;
> >> +
> >> +			cpu_bwmon_opp_table: opp-table {
> >> +				compatible = "operating-points-v2";
> >> +
> >> +				opp-0 {
> >> +					opp-peak-kBps = <800000>;
> >> +				};
> > 
> > Can these values remain unchanged vs hamoa? Glymur has more memory
> > channels (as reflected in the icc driver) so the values send to rpmh
> > will be a third lower
> > 
> > Similarly, hamoa has roughly the same values as kona, which has half
> > the channels
> > 
> > Konrad
> opp-peak-kBps is proportional to bus_width and is calculated as follows:
>  
> opp-peak-kBps = (Hz * node_bus_width)/ 1000
>  
> All the existing targets do the same, since bcm_aggregate() in 
> bcm-voter.c divides max_peak with buswidth.
> 

So if we make the bus 100x wider, we still have/want/get the same MB/s
throughput?

Regards,
Bjorn

> -Pragnesh

