Return-Path: <linux-arm-msm+bounces-91805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AJACYtCg2kPkQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:58:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00AE6153
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 515F03023DD4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 12:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30743E9F61;
	Wed,  4 Feb 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8jj6crw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83D1D90DD;
	Wed,  4 Feb 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209698; cv=none; b=LlbKmWBq2YLd6icWgsEFDqMOTKXyKhGzKjBsyHY5K58E7mxCI4mI2ZhlK5hhL6KJnc5Nu3g+xOOR4G8uJQ038IGQ4LXZfl8mnJSvg238oioZqg3Um6u5D6bp8RnTRBzdMCpyHkEcXv3M1cLY3/Ew3LV9V7omuM6q01qVWTjrVhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209698; c=relaxed/simple;
	bh=WWXZilhuIZ4W1G7CG9064J8Au/ejWhEaC4vpDgWlCZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO0VZg7PiAxFhpxmKIC0d3MAgF8obj1IeWEuR/qRxERnUSleraAixJMy9n3TRg4j4YKSYQg5aBR3Dt22I8FY/06Ayf6SoU0KTHESDYl1mTBBbXziWG8nwpBvZamAx0IDdC/Qm1iJHhPhN3DXs8Gid5Sp/BLc3b9iJrrKA2YYXLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8jj6crw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C20C16AAE;
	Wed,  4 Feb 2026 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770209698;
	bh=WWXZilhuIZ4W1G7CG9064J8Au/ejWhEaC4vpDgWlCZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8jj6crwd9OL0K4WxAePdRYN/0AD1Oebvx9DHbQ7GBf3e4n08T3xBvkgtuUslJGYD
	 gTSnC841cSM6Nr+wQzmT4dqN1CZRVFiWwByOyjfZJ88x0lexj4vbWWjKdm/an4HRYR
	 VNXQEkWQN6FlNuB1qOfCpf/LV4YQtqOyH9+tL2XtLpl6yzPqtKzVnpDANQzELjzEN5
	 ww/cZ3Bo/wA7F4DdCOYWyWZ8xnCKZc58i+Fx0SuB8ROB6ICCaZBHt/NqeV0MIvKv00
	 ovrG90fDaJV5TuEc4QxxNkaTFXawqxDFWfAC5+dc2Vtdjxa+HhYSQ56AWCN8UKuZ2Y
	 0MFAZirWblooA==
Date: Wed, 4 Feb 2026 18:24:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Message-ID: <v5yuwkfoegmtccn4qrbs2mj2uj2qxnwmix67whxmujtggdheo6@bk4vv54z6izj>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
 <aXtM9vE9y73vnVeA@hu-qianyu-lv.qualcomm.com>
 <6d2b92d0-55bb-4ce0-ad5e-316210a3d2c5@oss.qualcomm.com>
 <aYA0RBA9FjNmP8Ui@hu-qianyu-lv.qualcomm.com>
 <fe6f4de9-eb9c-45e9-a9c1-d780cc2f721c@oss.qualcomm.com>
 <aYB6pS4EQVP4w0O9@hu-qianyu-lv.qualcomm.com>
 <7a79bcc2-42d5-4a4a-ab7a-ab02b2605cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a79bcc2-42d5-4a4a-ab7a-ab02b2605cfa@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91805-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.12.53.0:email,0.0.0.0:email,c426000:email,codelinaro.org:url,c400000:email,qualcomm.com:url,a00000:email,ee00:email]
X-Rspamd-Queue-Id: 8D00AE6153
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:50:26AM +0100, Konrad Dybcio wrote:
> On 2/2/26 11:21 AM, Qiang Yu wrote:
> > On Mon, Feb 02, 2026 at 10:49:10AM +0100, Konrad Dybcio wrote:
> >> On 2/2/26 6:21 AM, Qiang Yu wrote:
> >>> On Thu, Jan 29, 2026 at 01:07:08PM +0100, Konrad Dybcio wrote:
> >>>> On 1/29/26 1:05 PM, Qiang Yu wrote:
> >>>>> On Wed, Jan 28, 2026 at 07:21:04PM -0600, Bjorn Andersson wrote:
> >>>>>> On Thu, Jan 22, 2026 at 08:53:57PM +0530, Pankaj Patil wrote:
> >>>>>>> Introduce dt-bindings and initial device tree support for Glymur,
> >>>>>>> Qualcomm's next-generation compute SoC and it's associated
> >>>>>>> Compute Reference Device (CRD) platform.
> >>>>>>>
> >>>>>>> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> >>>>>>> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> >>>>>>>
> >>>>>>> The base support enables booting to shell with rootfs on NVMe,
> >>>>>>> demonstrating functionality for PCIe and NVMe subsystems.
> >>>>>>> DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
> >>>>>>> TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
> >>>>>>> thermal management. The platform is capable of booting kernel at EL2
> >>>>>>> with kvm-unit tests performed on it for sanity.
> >>>>>>>
> >>>>>>> Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
> >>>>>>> SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
> >>>>>>>
> >>>>>>> For CPU compatible naming, there is one discussion which is not specific
> >>>>>>> to Glymur, Kaanapali and Glymur use the same Oryon cores.
> >>>>>>> https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
> >>>>>>> We've kept the "qcom,oryon" compatible
> >>>>>>>
> >>>>>>> Features enabled in this patchset:
> >>>>>>> 1. NVMe storage support
> >>>>>>> 2. PCIe controller and PCIe PHY
> >>>>>>> 3. RPMH Regulators
> >>>>>>> 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
> >>>>>>> 5. Interrupt controller
> >>>>>>> 6. TLMM (Top-Level Mode Multiplexer)
> >>>>>>> 7. QUP Block
> >>>>>>> 8. Reserved memory regions
> >>>>>>> 9. PMIC support with regulators
> >>>>>>> 10. CPU Power Domains
> >>>>>>> 11. TSENS (Thermal Sensors)
> >>>>>>> 12. DCVS: CPU DCVS with scmi perf protocol
> >>>>>>>
> >>>>>>> Dependencies:
> >>>>>>>
> >>>>>>> dt-bindings:
> >>>>>>> 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
> >>>>>>> 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
> >>>>>>> 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
> >>>>>>> 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/
> >>>>>>>
> >>>>>>> Linux-next based tree with Glymur patches is available at:
> >>>>>>> https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_glymur_introduction
> >>>>>>>
> >>>>>>
> >>>>>> FWIW, I applied these patches onto next-20260128 to see if things has
> >>>>>> improved since Rob's report and I get:
> >>>>>>
> >>>>>> $ make qcom/glymur-crd.dtb CHECK_DTBS=1
> >>>>>>   DTC [C] arch/arm64/boot/dts/qcom/glymur-crd.dtb
> >>>>>> qcom/glymur-crd.dtb: dma-controller@800000 (qcom,glymur-gpi-dma): interrupts: [[0, 588, 4], [0, 589, 4], [0, 590, 4], [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0, 596, 4], [0, 597, 4], [0, 598, 4], [0, 599, 4], [2, 129, 4], [2, 130, 4], [2, 131, 4], [2, 132, 4]] is too long
> >>>>>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> >>>>>> qcom/glymur-crd.dtb: dma-controller@a00000 (qcom,glymur-gpi-dma): interrupts: [[0, 279, 4], [0, 280, 4], [0, 281, 4], [0, 282, 4], [0, 283, 4], [0, 284, 4], [0, 293, 4], [0, 294, 4], [0, 295, 4], [0, 296, 4], [0, 297, 4], [0, 298, 4], [2, 124, 4], [2, 125, 4], [2, 126, 4], [2, 127, 4]] is too long
> >>>>>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> >>>>>> qcom/glymur-crd.dtb: dma-controller@b00000 (qcom,glymur-gpi-dma): interrupts: [[2, 76, 4], [2, 77, 4], [2, 78, 4], [2, 79, 4], [2, 80, 4], [2, 81, 4], [2, 82, 4], [2, 83, 4], [2, 84, 4], [2, 85, 4], [2, 86, 4], [2, 87, 4], [2, 88, 4], [2, 89, 4], [2, 90, 4], [2, 91, 4]] is too long
> >>>>>>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> >>>>>> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): led-controller@ee00:compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
> >>>>>>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> >>>>>> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): pwm:compatible: 'oneOf' conditional failed, one must be fixed:
> >>>>>>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
> >>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
> >>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
> >>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
> >>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
> >>>>>>         'qcom,pm8150l-lpg' was expected
> >>>>>>         'qcom,pm8916-pwm' was expected
> >>>>>>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> >>>>>> qcom/glymur-crd.dtb: led-controller@ee00 (qcom,pmh0101-flash-led): compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
> >>>>>>         from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
> >>>>>> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/led-controller@ee00: failed to match any schema with compatible: ['qcom,pmh0101-flash-led', 'qcom,spmi-flash-led']
> >>>>>> qcom/glymur-crd.dtb: pwm (qcom,pmh0101-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
> >>>>>>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
> >>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
> >>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
> >>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
> >>>>>>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
> >>>>>>         'qcom,pm8150l-lpg' was expected
> >>>>>>         'qcom,pm8916-pwm' was expected
> >>>>>>         from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
> >>>>>> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/pwm: failed to match any schema with compatible: ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm']
> >>>>>>
> >>>>>> So, we're still missing a few dependencies.
> >>>>>>
> >>>>>>
> >>>>>> Booting the system I get a ton of errors from PCIe in the kernel log:
> >>>>>>
> >>>>>> debugfs: 'opp:5000000' already exists in 'soc@0-1c00000.pci'
> >>>>>>
> >>>>>> # dmesg | grep -E 'debugfs: .+ already exists' |wc -l
> >>>>>> 508
> >>>>>>
> >>>>>> The system does eventually boot, and I was happy to see that we do end
> >>>>>> up finding the PCIe devices after all.
> >>>>>>
> >>>>> I enabled dynamic debug logs and observed that each PCIe platform device
> >>>>> probe was deferred approximately 10 times. The probe deferrals resulted in
> >>>>> additional OPP debugfs warnings being printed.
> >>>>>
> >>>>> The PCIe platform device probe was deferred because the PHY driver was not
> >>>>> ready - either because the PHY driver was not yet loaded, or because the
> >>>>> PHY driver's own probe was also deferred due to its dependency (e.g.,
> >>>>> 1fd5000.clock-controller) not being ready. This is normal behavior,
> >>>>> correct? I also observed that other driver probes were deferred.
> >>>>>
> >>>>> But I'm not sure why there are more than 300 times probe deferrals on
> >>>>> your setup.
> >>>>
> >>>> I think Bjorn is trying to say that the driver is wrong, because it
> >>>> effectively seems to call devm_pm_opp_of_add_table repeatedly
> >>>>
> >>> Okay, to avoid PCIe driver probe deferrals and the resulting increased OPP
> >>> debugfs warnings caused by these deferrals, we plan to move the PHY
> >>> properties back from the root port node to the controller device tree
> >>> node.
> >>
> >> Would (roughly) this solve your problems without messing with the DT?
> > 
> > This change cannot fix the OPP warning. The warning occurs because the OPP
> > subsystem creates debugfs nodes using "op-hz" as the name, which is not
> > unique for PCIe OPP tables. Mani posted a patch to fix this issue:
> > https://lore.kernel.org/all/20260130071940.6949-1-manivannan.sadhasivam@oss.qualcomm.com/
> > 
> > Our goal is to prevent probe deferrals from occurring in our driver.
> 
> Right, I would assume that was previously aided by devlink taking
> into account 'phys', but since they're no longer part of the PCIe
> device node directly, that logic fails.
> 
> Still, modifying the DT to fit Linux behavior generally indicated that
> Linux is not super good at doing that particular thing.. In this
> instance I think we should extend drivers/of/property.c to maybe check
> for supplier dependencies under subnodes of nodes that have
> device_type="pci"?
> 

Yes, that's exactly how I think it should be fixed. I'm wiring a patch now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

