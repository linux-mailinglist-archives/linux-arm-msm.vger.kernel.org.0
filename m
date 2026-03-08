Return-Path: <linux-arm-msm+bounces-96085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI9RLkbfrWnM8gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 21:42:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC12322D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 21:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C570D30053CE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 20:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB49B34F47E;
	Sun,  8 Mar 2026 20:42:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [82.197.176.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AC134EF0C;
	Sun,  8 Mar 2026 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.197.176.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773002542; cv=none; b=XQyur0LmAFvxiqoFsIp4nOF/xQewIVxlpiKBxR5EQkGyJGFgCJKvI56r3RcB/T3rRkmzuvHYq6mBOoxVgaBsn0dRYYmezM7GhXH692pCD2GD+BA8CPwpRL44ioEoJ3ka4gfKUb6iiaRGbSQ/82n2Tf0SD3yjyLS+zAkq5sGOS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773002542; c=relaxed/simple;
	bh=RJdNSVRwVWjEPmbijb1kSBEoGiqy6Hr/w/oZ9+SAvAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWyD1CTyqm9v8Aou6df42Bu8EGqtg2ux5G3DVOkgKUA+TFtAoY5o8gQfr50ds4IQHRN46W8/nz/kI4nBbD2cVhKc8pS7myZp6YvVtTfz45CzUe92mNn0JXgkXz6W8xPFitYqcjklpgy4bs1/s3tZAFBAabqXen7bJMgmt4GU9a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=82.197.176.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 60f50c10;
	Sun, 8 Mar 2026 21:35:36 +0100 (CET)
Date: Sun, 8 Mar 2026 21:35:36 +0100
From: Marcus Glocker <marcus@nazgul.ch>
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, Daniel Gomez <d@kruces.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add UFS node
Message-ID: <pzujcjjo4izwjrmk2n26htdi2ye5eljagi5qcp3ac52y2fksxr@xvi4cj7b26tw>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <g5vlxrttgvfqkktlkhu4uzhtvnp3qtjcbr7l2uztapzqwhrsem@wg574xldh5ar>
 <cd9d5a7c-ec0b-4f0a-bac2-f747799bf295@kernel.org>
 <l5vwputpefdkweti56em37i5asrd3vb7pxhwlzir7webfuk3fl@afcqm3faq2gt>
 <D5I1G5K85QLC.FP6NF7M20KXQ@kruces.com>
 <f5676c71-9e15-4733-aacc-2d194e2567fd@quicinc.com>
 <srqwbf4teujrcvovxglsibvhtq6wpv2ojclf4joc6hwvszhbir@2gxtczxhqlc7>
 <c9304705-41f3-4b4d-97c2-acb0451b3fca@cern.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9304705-41f3-4b4d-97c2-acb0451b3fca@cern.ch>
X-Rspamd-Queue-Id: 1DDC12322D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-96085-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[nazgul.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.27.41.32:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcus@nazgul.ch,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.742];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d84000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,1d87000:email,1d90000:email]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 05:01:14PM +0100, Maxim Storetvedt wrote:

> 
> On 1/3/25 00:17, Marcus Glocker wrote:
> > On Thu, Jan 02, 2025 at 01:38:10PM GMT, Wesley Cheng wrote:
> > 
> >>
> >> On 11/9/2024 3:31 PM, Daniel Gomez wrote:
> >>> On Fri Aug 30, 2024 at 7:25 PM CEST, Marcus Glocker wrote:
> >>>> On Fri, Aug 30, 2024 at 02:05:48AM +0200, Konrad Dybcio wrote:
> >>>>
> >>>>> On 17.08.2024 10:38 PM, Marcus Glocker wrote:
> >>>>>> Add the UFS Host Controller node.  This was basically copied from the
> >>>>>> arch/arm64/boot/dts/qcom/sc7180.dtsi file.
> >>>>>>
> >>>>>> Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
> >>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>>> ---
> >>>>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 72 ++++++++++++++++++++++++++
> >>>>>>  1 file changed, 72 insertions(+)
> >>>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi 
> >>>>>> b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>>>>> index 7bca5fcd7d52..9f01b3ff3737 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>>>>> @@ -2878,6 +2878,78 @@ mmss_noc: interconnect@1780000 {
> >>>>>>  			#interconnect-cells = <2>;
> >>>>>>  		};
> >>>>>>
> >>>>>> +		ufs_mem_hc: ufs@1d84000 {
> >>>>>> +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
> >>>>>> +				     "jedec,ufs-2.0";
> >>>>>> +			reg = <0 0x01d84000 0 0x3000>;
> >>>>>> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> >>>>>> +			phys = <&ufs_mem_phy>;
> >>>>>> +			phy-names = "ufsphy";
> >>>>>> +			lanes-per-direction = <1>;
> >>>>>> +			#reset-cells = <1>;
> >>>>>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> >>>>>> +			reset-names = "rst";
> >>>>>> +
> >>>>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> >>>>>> +
> >>>>>> +			iommus = <&apps_smmu 0xa0 0x0>;
> >>>>> Looks like this should be 0x1a0 maybe
> >>>>>> +
> >>>>>> +			clock-names = "core_clk",
> >>>>>> +				      "bus_aggr_clk",
> >>>>>> +				      "iface_clk",
> >>>>>> +				      "core_clk_unipro",
> >>>>>> +				      "ref_clk",
> >>>>>> +				      "tx_lane0_sync_clk",
> >>>>>> +				      "rx_lane0_sync_clk";
> >>>>>> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> >>>>>> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> >>>>>> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> >>>>>> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> >>>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
> >>>>>> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> >>>>>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
> >>>>> You also want
> >>>>>
> >>>>> <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>
> >>>>>
> >>>>>> +			freq-table-hz = <50000000 200000000>,
> >>>>> 25000000 300000000
> >>>>>
> >>>>>> +					<0 0>,
> >>>>>> +					<0 0>,
> >>>>>> +					<37500000 150000000>,
> >>>>> 75000000 300000000
> >>>>>
> >>>>>> +					<0 0>,
> >>>>>> +					<0 0>,
> >>>>>> +					<0 0>;
> >>>>>> +
> >>>>>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> >>>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >>>>>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> >>>>>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> >>>>>> +			interconnect-names = "ufs-ddr", "cpu-ufs";
> >>>>>> +
> >>>>>> +			qcom,ice = <&ice>;
> >>>>>> +
> >>>>>> +			status = "disabled";
> >>>>>> +		};
> >>>>>> +
> >>>>>> +		ufs_mem_phy: phy@1d87000 {
> >>>>>> +			compatible = "qcom,x1e80100-qmp-ufs-phy";
> >>>>>> +			reg = <0 0x01d87000 0 0x1000>;
> >>>>> most definitely should be 0x01d80000 with a size of 0x2000
> >>>>>
> >>>>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> >>>>>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> >>>>>> +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
> >>>>>> +			clock-names = "ref",
> >>>>>> +				      "ref_aux",
> >>>>>> +				      "qref";
> >>>>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> >>>>>> +			resets = <&ufs_mem_hc 0>;
> >>>>>> +			reset-names = "ufsphy";
> >>>>>> +			#phy-cells = <0>;
> >>>>>> +			status = "disabled";
> >>>>>> +		};
> >>>>>> +
> >>>>>> +		ice: crypto@1d90000 {
> >>>>>> +			compatible = "qcom,x1e80100-inline-crypto-engine",
> >>>>>> +				     "qcom,inline-crypto-engine";
> >>>>>> +			reg = <0 0x01d90000 0 0x8000>;
> >>>>> 0x1d88000
> >>>>>
> >>>>>
> >>>>> All this combined means you probably wrote your init sequence into some
> >>>>> free(?) register space and the one left over from the bootloader was
> >>>>> good enough :P
> >>>>>
> >>>>> Konrad
> >>>> I have not done anything special in our sub-system to boot this DTB.
> >>>> Changing the values as suggested by you also doesn't make any difference
> >>>> to me.
> >>>>
> >>>> Anyway, I think I'll give up at this point, since this process is
> >>>> getting too time consuming for me.  We'll go ahead with out downstream
> >>>> patches, which works for us so far.
> >>
> >>
> >> Hi Marcus,
> >>
> >>
> >> Do you mind if I take over this series??? I started working on getting at least the UFS and USB portions of the DT file to work on my Samsung Galaxy book4 with your patches, along with some required modifications.?? If you're OK, I'll keep you as the author for the main DT file, and submit my changes on top.
> >>
> >>
> >> Thanks
> >>
> >> Wesley Cheng
> > 
> > Hi Wesley,
> > 
> > Perfectly fine for me.  I'm glad if there is progress.
> > 
> > Thanks and Regards,
> > Marcus
> > 
> 
> Hi Marcus, Wesley,
> 
> We've continued to iterate on this device over at its thread on
> Launchpad, and been able to get a fairly usable system up and running on
> Linux for both the 14" and 16" SKUs. I'd be happy to update the series
> with the changes.
> 
> Cheers,
> -Max

Hi Max,

Good to read!  Sure, I would welcome to see your changes.  If you also
could send me your full DTS to my e-mail address, I could also test it
with OpenBSD.

Thanks,
Marcus

