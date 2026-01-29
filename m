Return-Path: <linux-arm-msm+bounces-91198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP6EATeMe2mlFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:35:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 626BAB23F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 17:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B916D308F6D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AAF34BA57;
	Thu, 29 Jan 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiqyRolb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC7B34BA33;
	Thu, 29 Jan 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769704197; cv=none; b=Eg9aPqySTosl3g7CHlflQjwbuuftXSCh/+D7F0vghlUZvwifPfD4RDhkIy3AYBkiA8MxTgQkenvCfd3C1hwyGgJ4TLMQKehhX1ZCfG0F1wKaCr7n0evJ0jwefiVnVPeUwlGzAcvRJ4DWe7EmLJIsjuM0lf7ZBFJjc4Y3g70sBgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769704197; c=relaxed/simple;
	bh=w+b1eyqOVuenXsxWOZ8rr34r3zPIG7l4lRoln8E8ZBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBdiYebmgY3WK3w8KoRbwfvgJfiWR/eT2V56O+vUdtP9ewwW9ywD1yiY20FZxZzCMevF9b+wCUr1eGaPdfh5EPLKR5g66Hd7s5k04ULJPDtTfq+kPbq4vyNqMEIykG3u1Ck4gUuaANTf2cvsYyR6yH1amaGhwjrpsUZjnmI6VjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiqyRolb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6852C116D0;
	Thu, 29 Jan 2026 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769704197;
	bh=w+b1eyqOVuenXsxWOZ8rr34r3zPIG7l4lRoln8E8ZBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiqyRolbkheYqA35Gwx/FhbLe3f/B++P6SaaA1cRKT/TwOyTcwG/M+2E1TdssYwEc
	 qUZSgmHwYSMaE19c2bpkMSSqmw1sDLKldLuNjcvkTJzq9bn2y/761lrSy4s2MyQewx
	 3N2iKBWCjpMGo/0mJWy7RNWBwmf++Ft6MQvyI41NnfmsWSZY/vgGVDbshcpOf0wr4V
	 9CBaN670t82YI2IixY1mFwraz1mXUP+yGj2ufrWvqahT/oVrh9RHxHQIc4HB2otgae
	 haXL0FOBswtoMBh19ruWML7+GHKbXqbuUDT9CaXaetLAyqSgb9dOITvaDpZIn1Xkd4
	 gajP3AKDanCIQ==
Date: Thu, 29 Jan 2026 21:59:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Message-ID: <r7eqretatbwdz73gapdaoxgdqurvkvkxj6ml7vqtykt6fgopvi@htsi3kkbk6ut>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91198-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:url,a00000:email,c426000:email,ee00:email,b00000:email,0.0.0.1:email,codelinaro.org:url,devicetree.org:url,c400000:email,0.12.53.0:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 626BAB23F6
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 07:21:04PM -0600, Bjorn Andersson wrote:
> On Thu, Jan 22, 2026 at 08:53:57PM +0530, Pankaj Patil wrote:
> > Introduce dt-bindings and initial device tree support for Glymur,
> > Qualcomm's next-generation compute SoC and it's associated
> > Compute Reference Device (CRD) platform.
> > 
> > https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> > https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> > 
> > The base support enables booting to shell with rootfs on NVMe,
> > demonstrating functionality for PCIe and NVMe subsystems.
> > DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
> > TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
> > thermal management. The platform is capable of booting kernel at EL2
> > with kvm-unit tests performed on it for sanity.
> > 
> > Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
> > SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
> > 
> > For CPU compatible naming, there is one discussion which is not specific
> > to Glymur, Kaanapali and Glymur use the same Oryon cores.
> > https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
> > We've kept the "qcom,oryon" compatible
> > 
> > Features enabled in this patchset:
> > 1. NVMe storage support
> > 2. PCIe controller and PCIe PHY
> > 3. RPMH Regulators
> > 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
> > 5. Interrupt controller
> > 6. TLMM (Top-Level Mode Multiplexer)
> > 7. QUP Block
> > 8. Reserved memory regions
> > 9. PMIC support with regulators
> > 10. CPU Power Domains
> > 11. TSENS (Thermal Sensors)
> > 12. DCVS: CPU DCVS with scmi perf protocol
> > 
> > Dependencies:
> > 
> > dt-bindings:
> > 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
> > 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
> > 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
> > 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/
> > 
> > Linux-next based tree with Glymur patches is available at:
> > https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_glymur_introduction
> > 
> 
> FWIW, I applied these patches onto next-20260128 to see if things has
> improved since Rob's report and I get:
> 
> $ make qcom/glymur-crd.dtb CHECK_DTBS=1
>   DTC [C] arch/arm64/boot/dts/qcom/glymur-crd.dtb
> qcom/glymur-crd.dtb: dma-controller@800000 (qcom,glymur-gpi-dma): interrupts: [[0, 588, 4], [0, 589, 4], [0, 590, 4], [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0, 596, 4], [0, 597, 4], [0, 598, 4], [0, 599, 4], [2, 129, 4], [2, 130, 4], [2, 131, 4], [2, 132, 4]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> qcom/glymur-crd.dtb: dma-controller@a00000 (qcom,glymur-gpi-dma): interrupts: [[0, 279, 4], [0, 280, 4], [0, 281, 4], [0, 282, 4], [0, 283, 4], [0, 284, 4], [0, 293, 4], [0, 294, 4], [0, 295, 4], [0, 296, 4], [0, 297, 4], [0, 298, 4], [2, 124, 4], [2, 125, 4], [2, 126, 4], [2, 127, 4]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> qcom/glymur-crd.dtb: dma-controller@b00000 (qcom,glymur-gpi-dma): interrupts: [[2, 76, 4], [2, 77, 4], [2, 78, 4], [2, 79, 4], [2, 80, 4], [2, 81, 4], [2, 82, 4], [2, 83, 4], [2, 84, 4], [2, 85, 4], [2, 86, 4], [2, 87, 4], [2, 88, 4], [2, 89, 4], [2, 90, 4], [2, 91, 4]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): led-controller@ee00:compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): pwm:compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>         'qcom,pm8150l-lpg' was expected
>         'qcom,pm8916-pwm' was expected
>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> qcom/glymur-crd.dtb: led-controller@ee00 (qcom,pmh0101-flash-led): compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>         from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/led-controller@ee00: failed to match any schema with compatible: ['qcom,pmh0101-flash-led', 'qcom,spmi-flash-led']
> qcom/glymur-crd.dtb: pwm (qcom,pmh0101-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>         'qcom,pm8150l-lpg' was expected
>         'qcom,pm8916-pwm' was expected
>         from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/pwm: failed to match any schema with compatible: ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm']
> 
> So, we're still missing a few dependencies.
> 
> 
> Booting the system I get a ton of errors from PCIe in the kernel log:
> 
> debugfs: 'opp:5000000' already exists in 'soc@0-1c00000.pci'
> 
> # dmesg | grep -E 'debugfs: .+ already exists' |wc -l
> 508
> 

That's worse. Looks like these are coming from the OPP core. We are debugging it
internally.

> The system does eventually boot, and I was happy to see that we do end
> up finding the PCIe devices after all.
> 

That's good. These errors shouldn't be a blocker for merging this series. But we
will resolve it asap.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

