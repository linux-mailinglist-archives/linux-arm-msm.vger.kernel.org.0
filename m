Return-Path: <linux-arm-msm+bounces-93716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKKiI5BunGmcGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:13:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6AF178934
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A938304D1CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC43364EBC;
	Mon, 23 Feb 2026 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz9cun3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269CA35CB9B;
	Mon, 23 Feb 2026 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859568; cv=none; b=PSC3hamqI2mRBdm8B15kbRQ2CJNoJPBkXyJoBSC6r1f/9yVBX5iqhdNhuG1SNHfApppNLEKrVqY7Vxsoj8rR/si4cQbcb43AkX9rEvkDuGgiqaPSNpnpBoCxHHz2vwznB3xLLiVZ2E8v/6amhoXj/aicsznYQkUfB3OrJLn8i1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859568; c=relaxed/simple;
	bh=j4BEkBbEinmh14zJz8TAvVlb07thNijCZtGD0pVrp9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+Vm2JX6y8B5+tzs67pyyDP6ur0rnA5XieNiMXGQrabdx0m4kLfSrqzcTCebEAoiF17ddbafeVP14bM1r7PJABZCUPgmj+hS7KcOmAwIkFZU4iygC+QVZ7BR8/d42GcMDXHP3t2konYiuSSkfvLoekFSQlp6vXISCQdl01YJAPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz9cun3+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA3EC116C6;
	Mon, 23 Feb 2026 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771859567;
	bh=j4BEkBbEinmh14zJz8TAvVlb07thNijCZtGD0pVrp9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bz9cun3+cUw54Ol1Dz7caq+ZlF37jAVxKT9Kvevz/vpjSWX3L+cMd1hLBHG4izKlP
	 18GrgZNIucHHKURQlplOgBID7SPhPJxvDXUrlnbLQnOUDFtoAe+Sbqk1+RRDYJWVFj
	 lmipEHq87VGFbO6KP0mZtIvFdTU8fRt2IJH3qDSGI+YVd6nzMjMYhK3nhz5CprOzSq
	 5bafVvCHW0C1Zqmv4hlCmbUAyrT5U2LsquVsls0W7mGVU5pIQRuiOzcHs2DxqjO6ko
	 HKuevoK6uLBuGaJK5ATPhecOUrXUf4Vi/u1Km61wsXkcFn63QVfYzKYFlU2deyEf8w
	 Estsy0loDLA0g==
Date: Mon, 23 Feb 2026 09:12:44 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	richardcochran@gmail.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com, 
	monish.chunara@oss.qualcomm.com, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
Message-ID: <jncbztn4xohzns734i4o2hsherdshjgxqtiglh7zf2oz7nkujs@an24wf3txymy>
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
 <a7777e5d-f9be-43c5-9f3f-4d84e16f6e89@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7777e5d-f9be-43c5-9f3f-4d84e16f6e89@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93716-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D6AF178934
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 02:12:05PM +0100, Krzysztof Kozlowski wrote:
> On 22/02/2026 18:35, Umang Chheda wrote:
> > The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
> > board designed to be stacked on top of Monaco EVK.
> > 
> > It has following peripherals :
> > 
> > - 4x Type A USB ports in host mode.
> > - TC9563 PCIe switch, which has following three downstream ports (DSP) :
> >    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
> >    - 2nd DSP connects M.2 B-key connector for connecting cellular
> >      modems.
> >    - 3rd DSP with support for Dual Ethernet ports.
> > - EEPROM.
> > - LVDS Display.
> > - 2*mini DP.
> > 
> > Add support for following peripherals :
> > - TC9563 PCIe Switch.
> > - EEPROM.
> > 
> > Written with inputs from :
> >     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
> >     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
> > 
> > Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   4 +
> >  .../dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 184 ++++++++++++++++++
> >  2 files changed, 188 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index f80b5d9cf1e8..9d298e7e8a90 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -45,6 +45,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> > +
> > +monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
> > +
> > +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> > new file mode 100644
> > index 000000000000..f0572647200c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> > @@ -0,0 +1,184 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +&{/} {
> > +	model = "Qualcomm Technologies, Inc. Monaco-EVK IFP Mezzanine";
> > +
> > +	vreg_0p9: regulator-vreg-0p9 {
> 
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]v[0-9]'
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> 
> Duplicating regulator name (regulator-reg(ulator)) is pointless.
> 

"pointless" is a strong word IMO.

The recommendation that has been communicated is to based label, name
and regulator-name of the schematics, but prefix the node name with
regulator- to achieve sensible sort order.


In fact naming these regulator-0v9, regulator-1v8, and regulator-3v3
make the name useless. We further have plenty of designs where there are
multiple regulator-1v8 and regulator-3v3.

I guess the preferred name, per the binding, is to not have multiple
3.3V regulators in your design?

> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VREG_0P9";
> > +
> > +		regulator-min-microvolt = <900000>;
> > +		regulator-max-microvolt = <900000>;
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +
> > +		vin-supply = <&vreg_3p3>;
> > +	};
> > +
> > +	vreg_1p8: regulator-vreg-1p8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VREG_1P8";
> > +
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +
> > +		vin-supply = <&vreg_4p2>;
> > +	};
> > +
> > +	vreg_3p3: regulator-vreg-3p3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VREG_3P3";
> > +
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +
> > +		vin-supply = <&vreg_4p2>;
> > +	};
> > +
> > +	vreg_4p2: regulator-vreg-4p2 {
> 
> Unused node (other dummies don't really count).
> 

I'm pretty sure this is a direct result of previous review feedback
requiring these to be added. I do agree that they don't add any value
in a system were we don't control the entire power grid anyways.


So I presume what you're saying is that we should at most declare one
level of non-controlled fixed regulators?

Regards,
Bjorn

> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VREG_4P2";
> > +
> > +		regulator-min-microvolt = <4200000>;
> > +		regulator-max-microvolt = <4200000>;
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +
> > +		vin-supply = <&vreg_sys_pwr>;
> > +	};
> > +
> > +	vreg_sys_pwr: regulator-vreg-sys-pwr {
> 
> What is the point of this regulator? It is not used by anything (another
> dummy is not considered an user).
> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VREG_SYS_PWR";
> > +
> > +		regulator-min-microvolt = <24000000>;
> > +		regulator-max-microvolt = <24000000>;
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +	};
> > +};
> > +
> 
> 
> Best regards,
> Krzysztof

