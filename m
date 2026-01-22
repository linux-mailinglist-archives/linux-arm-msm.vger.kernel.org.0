Return-Path: <linux-arm-msm+bounces-90270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LaxBhWscmkkogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 00:00:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4C6E5B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 00:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F62F3004F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 23:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ABB3BE4AA;
	Thu, 22 Jan 2026 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YevcfVIS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F9B2222C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769122831; cv=none; b=Ff587mouW3uw2Z3eKS5OuaTemBKO3zclx76qaqPhv+uE8DONWdu3YHMPsoO9sjVbCF+7/0yXDyw9Iz/J0Abfa9a0Run2T+ZzK7VtQLl4nm2UUMvS9LhiWf9K0EYRIqVrvFloZecIZULDo0qjw/TQBilXjLQzae7y46++8F/+i80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769122831; c=relaxed/simple;
	bh=YSqBJucQKnr9Jg0HWejro2AmLr3PBKNzmBJfijGhJ4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bo96e+sX4Q3WGsdMYBzgCw/JcUBBnRSByPDKhPTqFND00WkTVelqFWctf3Bz5j742t4yLIExciz2F5/RSwACMsPScTv1k9oB8lnxLR3tLWNAH0U/sghZybsnHXpS2l78+tSmcHzwY6u3kKriFxfCfRhqOMCPOLrdV/q+wDIGA1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YevcfVIS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE9BC19425
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769122829;
	bh=YSqBJucQKnr9Jg0HWejro2AmLr3PBKNzmBJfijGhJ4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YevcfVISq0aJsjaEYe7xPKNKVZ2sAg5TO6Rg+M9+6TwxWc63/AxIPmvYFymtfERY6
	 JT88+UdZ43n9lUDwK4gGS+9/Yf4m9J0qrWOhr5lek+y2DSwDWJJJz/lMeS+780bJr/
	 3GkQVI+YXcnuWwd+dFCDuJlc+4eNVx6W1+WdI/djg8TVF8I0uC7OvXF56PtcKqSDH9
	 MfKTpnQVpdsPrhnSnd4ep70Xt8l1pR3lM1ExYv0SXH2RfLQuJV7L/2w+Juz/a7if/3
	 GjXVEy9kkcZbDJevPjRneVDyXZnk0x5pIvkICvUG63fPsahJSqEO1kAWDeiJ0hp9Aa
	 iGPd2hFIPjRJA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso201599266b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUy5Kby7lw7ZcYdeXfHLr59dnn1L7EZGOuEgVHv0tR9xl8rxjIAQNfBVUBBc71ymm62VZBgTwLf/NgvaPWh@vger.kernel.org
X-Gm-Message-State: AOJu0YxKCkz+pjSQt+e+T3l6dUzYYPnpIML2iINfAMsZj9XsHqeiKgpq
	fQ36dt/F1MrPL55AlJAlINW1EPeAXyrTacTNeQLI9UFLwTYGc3co/cbApYJRRgkugvCq8JumDZJ
	00JRCdbWkjso5CAT1e9JTYxbLEoIaSQ==
X-Received: by 2002:a17:907:3c82:b0:b87:1fb:8386 with SMTP id
 a640c23a62f3a-b885ac301e6mr57590966b.21.1769122828001; Thu, 22 Jan 2026
 15:00:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <176910484203.3007057.6301998080301909826.robh@kernel.org> <5a40a0ab-6c79-41b5-8741-c1bdcdeac617@oss.qualcomm.com>
In-Reply-To: <5a40a0ab-6c79-41b5-8741-c1bdcdeac617@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Jan 2026 17:00:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLuN0ZJx2hJTqGjBHNR-hUWCoDoY-D-VPWFW8JBEMT3sA@mail.gmail.com>
X-Gm-Features: AZwV_Qjyyg_m6zKAeaWbn6MuZ9nJ-_R5loYVrrPIYtGPrzDkNdsm88CAdJGnZHc
Message-ID: <CAL_JsqLuN0ZJx2hJTqGjBHNR-hUWCoDoY-D-VPWFW8JBEMT3sA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90270-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:url,qualcomm.com:email,devicetree.org:url,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,codelinaro.org:url]
X-Rspamd-Queue-Id: 9CD4C6E5B7
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 2:41=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/22/26 7:07 PM, Rob Herring wrote:
> >
> > On Thu, 22 Jan 2026 20:53:57 +0530, Pankaj Patil wrote:
> >> Introduce dt-bindings and initial device tree support for Glymur,
> >> Qualcomm's next-generation compute SoC and it's associated
> >> Compute Reference Device (CRD) platform.
> >>
> >> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablet=
s/snapdragon-x2-elite
> >> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite=
-extreme-and-snapdragon-x2-elite-are-the-
> >>
> >> The base support enables booting to shell with rootfs on NVMe,
> >> demonstrating functionality for PCIe and NVMe subsystems.
> >> DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
> >> TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
> >> thermal management. The platform is capable of booting kernel at EL2
> >> with kvm-unit tests performed on it for sanity.
> >>
> >> Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
> >> SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
> >>
> >> For CPU compatible naming, there is one discussion which is not specif=
ic
> >> to Glymur, Kaanapali and Glymur use the same Oryon cores.
> >> https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@o=
ss.qualcomm.com/
> >> We've kept the "qcom,oryon" compatible
> >>
> >> Features enabled in this patchset:
> >> 1. NVMe storage support
> >> 2. PCIe controller and PCIe PHY
> >> 3. RPMH Regulators
> >> 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
> >> 5. Interrupt controller
> >> 6. TLMM (Top-Level Mode Multiplexer)
> >> 7. QUP Block
> >> 8. Reserved memory regions
> >> 9. PMIC support with regulators
> >> 10. CPU Power Domains
> >> 11. TSENS (Thermal Sensors)
> >> 12. DCVS: CPU DCVS with scmi perf protocol
> >>
> >> Dependencies:
> >>
> >> dt-bindings:
> >> 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e=
79c@oss.qualcomm.com/
> >> 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e=
5@oss.qualcomm.com/
> >> 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@o=
ss.qualcomm.com/
> >> 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.=
qualcomm.com/
> >>
> >> Linux-next based tree with Glymur patches is available at:
> >> https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_g=
lymur_introduction
> >>
> >> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >> ---
> >> Changes in v6:
> >> - Moved pmic thermal zones to their respective pmic dtsi files
> >> - Link to v5: https://lore.kernel.org/r/20260122-upstream_v3_glymur_in=
troduction-v5-0-8ba76c354e9a@oss.qualcomm.com
> >>
> >> Changes in v5:
> >> - Added opp entries for pcie nodes
> >> - Dropped qup-memory interconnect from uart nodes
> >> - Update trip1 type to critical for pmic thermal zones
> >> - Alignment and newline fixes according to comments
> >> - Link to v4: https://lore.kernel.org/r/20260112-upstream_v3_glymur_in=
troduction-v4-0-8a0366210e02@oss.qualcomm.com
> >>
> >> Changes in v4:
> >> - Enabled PCIe SMMU for all 4 PCIe instances
> >> - Updated dispcc required opps level to "rpmhpd_opp_low_svs"
> >> - Updated watchdog compatible
> >> - Renamed gic-its to msi-controller
> >> - Updated GCC clocks property to 43 from 44
> >> - Moved cpu-idle-states to domain-idle-states
> >> - Fixed alignment and zero padding issues according to review comments
> >> - Dropped glymur-pmics.dtsi
> >> - Moved pmic thermal zones from board dts to soc dtsi
> >> - Link to v3: https://lore.kernel.org/r/20251219-upstream_v3_glymur_in=
troduction-v3-0-32271f1f685d@oss.qualcomm.com
> >>
> >> Changes in v3:
> >> - Enabled system-cache-controller
> >> - Squashed all initial features to boot to shell with nvme as storage
> >> - Updated tsens nodes according to comments
> >> - Merged tcsr and tcsrcc node
> >> - Addressed review comments
> >> - Link to v1: https://lore.kernel.org/all/20250925-v3_glymur_introduct=
ion-v1-0-24b601bbecc0@oss.qualcomm.com
> >>
> >> Changes in v2:
> >> - Series was sent erroneously
> >> - Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introductio=
n-v1-0-5413a85117c6@oss.qualcomm.com
> >>
> >> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >>
> >> ---
> >> Pankaj Patil (4):
> >>       dt-bindings: arm: qcom: Document Glymur SoC and board
> >>       arm64: defconfig: Enable Glymur configs for boot to shell
> >>       arm64: dts: qcom: Introduce Glymur base dtsi
> >>       arm64: dts: qcom: glymur: Enable Glymur CRD board support
> >>
> >>  Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
> >>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
> >>  arch/arm64/boot/dts/qcom/glymur-crd.dts         |  601 +++
> >>  arch/arm64/boot/dts/qcom/glymur.dtsi            | 5913 ++++++++++++++=
+++++++++
> >>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi          |  187 +
> >>  arch/arm64/boot/dts/qcom/pmh0101.dtsi           |   68 +
> >>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi    |  144 +
> >>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi    |  144 +
> >>  arch/arm64/boot/dts/qcom/pmk8850.dtsi           |   70 +
> >>  arch/arm64/boot/dts/qcom/smb2370.dtsi           |   45 +
> >>  arch/arm64/configs/defconfig                    |    5 +
> >>  11 files changed, 7183 insertions(+)
> >> ---
> >> base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> >> change-id: 20251007-upstream_v3_glymur_introduction-5a105b54493d
> >> prerequisite-message-id: <20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@o=
ss.qualcomm.com>
> >> prerequisite-patch-id: bd5a4703a5a7fc530418337680cf1e2ea1518f35
> >> prerequisite-message-id: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss=
.qualcomm.com>
> >> prerequisite-patch-id: 6bbaff642cfd1f1386ff0ccd746739b68cdbeb45
> >> prerequisite-patch-id: e30603778b23b7f7586b1c01a362e45af7bd0aa3
> >> prerequisite-message-id: <20260121110828.2267061-1-pankaj.patil@oss.qu=
alcomm.com>
> >> prerequisite-patch-id: 14469fd166b31b251b98bf25e783ab6f57ddd13a
> >>
> >> Best regards,
> >> --
> >> Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >>
> >>
> >>
> >
> >
> > My bot found new DTB warnings on the .dts files added or changed in thi=
s
> > series.
> >
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warning=
s
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to rep=
ly
> > unless the platform maintainer has comments.
> >
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> >
> >   pip3 install dtschema --upgrade
> >
> >
> > This patch series was applied (using b4) to base:
> >  Deps: looking for dependencies matching 4 patch-ids
> >  Deps: Applying prerequisite patch: [PATCH] dt-bindings: mfd: qcom,spmi=
-pmic: Document PMICs present on Glymur
> >  Deps: Applying prerequisite patch: [PATCH v3 1/2] dt-bindings: leds: l=
eds-qcom-lpg: Add support for PMH0101 PWM
> >  Deps: Applying prerequisite patch: [PATCH v3 2/2] dt-bindings: leds: q=
com,spmi-flash-led: Add PMH0101 compatible
> >  Deps: Applying prerequisite patch: [PATCH v2] dt-bindings: dma: qcom,g=
pi: Update max interrupt lines to 16
> >  Base: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b (use --merge-base to ov=
erride)
> >
> > If this is not the correct base, please add 'base-commit' tag
> > (or use b4 which does this automatically)
> >
> >
> > New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/qcom/=
' for 20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualco=
mm.com:
> >
> > arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1bf0000 (qcom,glymur-pcie)=
: compatible:0: 'qcom,pcie-x1e80100' was expected
> >       from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e8=
0100.yaml
>
> +Mani you sent a 'b4 ty' for this months ago, what happened?
>
> https://lore.kernel.org/linux-arm-msm/176189884156.5303.14323602106505981=
794.b4-ty@kernel.org/

It wasn't in 1/16 linux-next, but it is there now.

> The ipcc one should be handled by Rob now:
>
> https://lore.kernel.org/linux-arm-msm/20260116162057.GA1681736-robh@kerne=
l.org/

Actually, Bjorn picked that up instead since there are other mailbox
patches that didn't get picked up.

> And watchdog is perhaps in Guenter's queue
>
> https://lore.kernel.org/linux-arm-msm/de7f0b8a-a355-42c1-ac3c-d0b5de75471=
1@roeck-us.net/

Seems to be hit or miss if wdog bindings are picked up, but again,
this one is in today's next.

Perhaps slow down the pace on this given the 4 listed dependencies and
3 unlisted dependencies.

Rob

