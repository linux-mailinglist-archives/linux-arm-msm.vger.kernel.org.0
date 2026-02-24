Return-Path: <linux-arm-msm+bounces-93881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id I9BPMT8pnWmWNAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:29:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E49F181A30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2A50304A17E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2732773C3;
	Tue, 24 Feb 2026 04:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAgFQkFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A1C1607A4;
	Tue, 24 Feb 2026 04:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907387; cv=none; b=cth1ke63VDt0onphEzBqfGEdOKZy4roYqDGLtWSdEVhmYgget1vzzIUQCwqVsSaMQvq6MdXDCIjEaTEBWeAo6bE/TJmtogS2B9LjTaYhnRuvdfLzyJ3lTv6M3zEjpDuQIP/GFBOTgMKUSw+WaV5Bl50bFpdLDsQ46cof9yCspww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907387; c=relaxed/simple;
	bh=DidjP24S6tEWJh7grDSSmVBtE837q5pzEFhp3MVEMRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0tgBaU4cvPqW+jGqIVD2QHRMXnwAv+GINfLJ1QR3nh3uWRHPbmCGiPRLubwWTsxfFuSB1lCbeN0oRdM8JcUT6veEEJMPUQixLrDZIDaB8z4FB+1qhqntLV0f8xpKQns/y03ahBYdKNMKHagPDRq/mdCPAAtRop/Ku8KQ+zpVjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAgFQkFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519DFC116D0;
	Tue, 24 Feb 2026 04:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771907387;
	bh=DidjP24S6tEWJh7grDSSmVBtE837q5pzEFhp3MVEMRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAgFQkFxjr5L2ZMP72xV+BG3WUyhEP+JiT+Osz03NCcKRvHRtnSbRC0nUZ6Lutzg2
	 A+IdByJ+U3Dmt1hCdWSblJwPoXVEApDqMGHCZYiOlonhQzYyvlAeLYMqfLbzzlsEEh
	 pAYYwP6/PIqyl6/lOdK7O5t1zCsqb+XQQomgwk9TbaQWKzcrFtuAb/ihV3p6kquwi1
	 RyiNVDIj9fwReuMYFVWViXTH1FLf0iefA6+nfOvnkjCuCCul+j0uOiCH+I42vWd05U
	 2+h9YHMcFBWhwazofE405Ik/HMdFCVPmfR/qcxSsGDr1HaiugOzqVZlExBpheTckNi
	 U2A2sf6qMzdmA==
Date: Mon, 23 Feb 2026 22:29:44 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	richardcochran@gmail.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com, 
	monish.chunara@oss.qualcomm.com, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
Message-ID: <w6pfpkgu2xypyl3xw7upxo4gkbkagmmh4mr7ky2itdmusah5xt@gh44xrzgmrtg>
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
 <a7777e5d-f9be-43c5-9f3f-4d84e16f6e89@kernel.org>
 <jncbztn4xohzns734i4o2hsherdshjgxqtiglh7zf2oz7nkujs@an24wf3txymy>
 <87e3de23-cee9-4789-87ca-e85826af7760@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e3de23-cee9-4789-87ca-e85826af7760@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93881-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E49F181A30
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:36:56PM +0100, Krzysztof Kozlowski wrote:
> On 23/02/2026 16:12, Bjorn Andersson wrote:
> > On Mon, Feb 23, 2026 at 02:12:05PM +0100, Krzysztof Kozlowski wrote:
> >> On 22/02/2026 18:35, Umang Chheda wrote:
> >>> The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
> >>> board designed to be stacked on top of Monaco EVK.
> >>>
> >>> It has following peripherals :
> >>>
> >>> - 4x Type A USB ports in host mode.
> >>> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
> >>>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
> >>>    - 2nd DSP connects M.2 B-key connector for connecting cellular
> >>>      modems.
> >>>    - 3rd DSP with support for Dual Ethernet ports.
> >>> - EEPROM.
> >>> - LVDS Display.
> >>> - 2*mini DP.
> >>>
> >>> Add support for following peripherals :
> >>> - TC9563 PCIe Switch.
> >>> - EEPROM.
> >>>
> >>> Written with inputs from :
> >>>     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
> >>>     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
> >>>
> >>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
> >>>  .../dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 184 ++++++++++++++++++
> >>>  2 files changed, 188 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >>> index f80b5d9cf1e8..9d298e7e8a90 100644
> >>> --- a/arch/arm64/boot/dts/qcom/Makefile
> >>> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >>> @@ -45,6 +45,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> >>> +
> >>> +monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
> >>> +
> >>> +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> >>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> >>> new file mode 100644
> >>> index 000000000000..f0572647200c
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> >>> @@ -0,0 +1,184 @@
> >>> +// SPDX-License-Identifier: BSD-3-Clause
> >>> +/*
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +/plugin/;
> >>> +
> >>> +#include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +&{/} {
> >>> +	model = "Qualcomm Technologies, Inc. Monaco-EVK IFP Mezzanine";
> >>> +
> >>> +	vreg_0p9: regulator-vreg-0p9 {
> >>
> >> Please use name for all fixed regulators which matches current format
> >> recommendation: 'regulator-[0-9]v[0-9]'
> >>
> >> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> >>
> >> Duplicating regulator name (regulator-reg(ulator)) is pointless.
> >>
> > 
> > "pointless" is a strong word IMO.
> 
> Pointless meaning it has no point, because the "vreg" is just redundant.
> It gives no new information.
> 

I do agree with it being redundant, but it has provided clear direction
for dts authors of how to construct the node name (take name from
schematics, adopt DT naming rules, prefix it with "regulator-").

> 
> > 
> > The recommendation that has been communicated is to based label, name
> > and regulator-name of the schematics, but prefix the node name with
> > regulator- to achieve sensible sort order.
> > 
> > 
> > In fact naming these regulator-0v9, regulator-1v8, and regulator-3v3
> > make the name useless. We further have plenty of designs where there are
> > multiple regulator-1v8 and regulator-3v3.
> 
> The regulator-name is to match schematics. Node name should follow DT
> spec expectations to show the purpose of the node.
> 

And "purpose" here means "it's a regulator providing 0.9V"?

> > 
> > I guess the preferred name, per the binding, is to not have multiple
> > 3.3V regulators in your design?
> 
> I don't see what you are proving here. The "vreg" middle name addon is
> not differentiating multiple 3.3V regulators.
> It changes nothing in the problem of this duplication.
> 

I agree on the "vreg" part being redundant, but you're telling us that
all fixed regulators should be named "regulator-[0-9]v[0-9]".

Are you saying that "regulator-edp-3p3", "regulator-misc-3p3", and
"regulator-nvme" (examples from x1-crd.dtsi), should all be named
"regulator-3v3"? Or is your feedback limited to those regulators that
are trivially named in the schematics?

Regards,
Bjorn


> > 
> >>> +		compatible = "regulator-fixed";
> >>> +		regulator-name = "VREG_0P9";
> >>> +
> >>> +		regulator-min-microvolt = <900000>;
> >>> +		regulator-max-microvolt = <900000>;
> >>> +		regulator-always-on;
> >>> +		regulator-boot-on;
> >>> +
> >>> +		vin-supply = <&vreg_3p3>;
> >>> +	};

