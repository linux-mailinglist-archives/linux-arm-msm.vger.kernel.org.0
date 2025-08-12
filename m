Return-Path: <linux-arm-msm+bounces-68765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A105CB22606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD28F1888DA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23A72EBB98;
	Tue, 12 Aug 2025 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZneyDZj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0522EB5C7;
	Tue, 12 Aug 2025 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754998729; cv=none; b=On+Y54CUkpdXoiV9/Jwi4eOO2nlHUHItCFk1bkUvrMhhNk63QwYv8uKjG3STsH1LU9cN1Ntdd8HSTCfNWRVgo3NVphxW/L/4DW4BmJgOs968jtr1C6K3BX1XhR2VXxCN4GiP3bCrPtmE2mbOI84+qIVoMqbim3ZVxm/miIFOCKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754998729; c=relaxed/simple;
	bh=SUMqwwAsdFKrR8rANLxE4W/5RKurQaqBSysIbfpj4gg=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=WqWs73mG6miFYmc4+8Ue5uc5iD2/KraWUCsYgz6RcOiBB1w2J7jNUZQsvZLGUW2ynvOXEq8AqOV/f5AINDXeco0750kUdEp/gCEBvwPJR9fIOnSGSCoXsq+5kR7KI+Lzbi2GxjQci4dJ5Bkw6raiTJKAMigRWQ7zuz7JFVUHb6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZneyDZj2; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=SUMqwwAsdFKrR8rANLxE4W/5RKurQaqBSysIbfpj4gg=;
	b=ZneyDZj2lYjPfyV2c2yW95rYr+HVgR63659pGjG6P9pVaFidxpHqvhS1+MgXeU
	6W22/Tom/uRRfUDchVOrZrbW2STSHyOYNffHpjbKpQeVbRPGQkG8pWSrfgRQTvFo
	NXuo2EETB0cKJ6LTKS2tIafigAdp4Ll2CRad6JXvXYFIQ=
Received: from root (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wA3PtKeJ5to2j7gBQ--.59669S2;
	Tue, 12 Aug 2025 19:38:07 +0800 (CST)
From: <yizhijiao2025@163.com>
To: "'Dmitry Baryshkov'" <dmitry.baryshkov@oss.qualcomm.com>,
	"'Nitin Rawat'" <quic_nitirawa@quicinc.com>
Cc: "'Manivannan Sadhasivam'" <mani@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk@kernel.org>,
	"'Konrad Dybcio'" <konrad.dybcio@oss.qualcomm.com>,
	<vkoul@kernel.org>,
	<kishon@kernel.org>,
	<conor+dt@kernel.org>,
	<bvanassche@acm.org>,
	<andersson@kernel.org>,
	<neil.armstrong@linaro.org>,
	<konradybcio@kernel.org>,
	<krzk+dt@kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com> <20250806154340.20122-3-quic_nitirawa@quicinc.com> <20250808-calm-boa-of-swiftness-a4a7ce@kuoka> <9af71063-0629-4ccc-bc76-3fb588677bf4@oss.qualcomm.com> <292907f3-25d6-40d9-be6e-b6b83e646d73@kernel.org> <5e32be05-0dbd-4d6f-879d-8ce97fb430ba@quicinc.com> <rh3qxu2rijpjswfash3rpmmh6sw47l3b6j5p5upti6zffknasz@cywwm3fypghd> <89ab7e51-f82e-465a-aa22-1ccb8e7a0f6d@quicinc.com> <ljythvl2yfilcnmgdwt2cyyefxmgl54osll5e76qn7njadhgqq@rwrl3dy6ykt3>
In-Reply-To: <ljythvl2yfilcnmgdwt2cyyefxmgl54osll5e76qn7njadhgqq@rwrl3dy6ykt3>
Subject: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D:_=5BPATCH_V1_2/4=5D_arm64:_dts:_q?=
	=?UTF-8?Q?com:_sm8750:_add_max-microamp_fo?=
	=?UTF-8?Q?r_UFS_PHY_and_PLL_supplies?=
Date: Tue, 12 Aug 2025 19:38:06 +0800
Message-ID: <006d01dc0b7d$929184a0$b7b48de0$@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHw68n7M+zVsTQSVPTKb0yDblC+5AHCXxAmAu7qHlMC9bBv8QHbgC77Achl3XUC2ks/ZQMzbyiqAPNFKSKzosSUwA==
Content-Language: zh-cn
X-CM-TRANSID:_____wA3PtKeJ5to2j7gBQ--.59669S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Wr1kKFWkXrWxXFW5Wr4fAFb_yoWxGr4xpF
	W8WFWDCr1kAryfAw4vgw4xCa4Fqw1DAr1avrn8Gw47A390vF1FqFnFyr15uFyDZr1kZ3WY
	vrWjqry2qa4Y9FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jChFxUUUUU=
X-CM-SenderInfo: x1l2xxpmld0jqqsvqiywtou0bp/xtbBgBqnbGibIQmfdgAAsj



-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: =
linux-arm-msm+bounces-68747-yizhijiao2025=3D163.com@vger.kernel.org =
<linux-arm-msm+bounces-68747-yizhijiao2025=3D163.com@vger.kernel.org> =
=E4=BB=A3=E8=A1=A8 Dmitry Baryshkov
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B48=E6=9C=8812=E6=97=A5 =
18:52
=E6=94=B6=E4=BB=B6=E4=BA=BA: Nitin Rawat <quic_nitirawa@quicinc.com>
=E6=8A=84=E9=80=81: Manivannan Sadhasivam <mani@kernel.org>; Krzysztof =
Kozlowski <krzk@kernel.org>; Konrad Dybcio =
<konrad.dybcio@oss.qualcomm.com>; vkoul@kernel.org; kishon@kernel.org; =
conor+dt@kernel.org; bvanassche@acm.org; andersson@kernel.org; =
neil.armstrong@linaro.org; konradybcio@kernel.org; krzk+dt@kernel.org; =
linux-arm-msm@vger.kernel.org; linux-phy@lists.infradead.org; =
linux-kernel@vger.kernel.org; devicetree@vger.kernel.org
=E4=B8=BB=E9=A2=98: Re: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add =
max-microamp for UFS PHY and PLL supplies

On Tue, Aug 12, 2025 at 01:25:02AM +0530, Nitin Rawat wrote:
>=20
>=20
> On 8/9/2025 4:37 PM, Manivannan Sadhasivam wrote:
> > On Fri, Aug 08, 2025 at 08:49:45PM GMT, Nitin Rawat wrote:
> > >=20
> > >=20
> > > On 8/8/2025 3:09 PM, Krzysztof Kozlowski wrote:
> > > > On 08/08/2025 10:58, Konrad Dybcio wrote:
> > > > > On 8/8/25 9:29 AM, Krzysztof Kozlowski wrote:
> > > > > > On Wed, Aug 06, 2025 at 09:13:38PM +0530, Nitin Rawat wrote:
> > > > > > > Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp`=20
> > > > > > > properties to the UFS PHY node in the device tree.
> > > > > > >=20
> > > > > > > These properties define the maximum current (in microamps) =

> > > > > > > expected from the PHY and PLL regulators. This allows the=20
> > > > > > > PHY driver to configure regulator load accurately and=20
> > > > > > > ensure proper regulator mode based on load requirements.
> > > > > >=20
> > > > > > That's not the property of phy, but regulator.
> > > > > >=20
> > > > > > Also reasoning is here incomplete - you just post downstream =

> > > > > > code. :/
> > > > >=20
> > > > > The reason for this change is good, but perhaps not explained=20
> > > > > clearly
> > > > >=20
> > > > > All of these values refer to the maximum current draw that=20
> > > > > needs to be allocated on a shared voltage supply for this=20
> > > > > peripheral (because the
> > > >=20
> > > >=20
> > > > It sounds very different than how much it can be drawn. How much =

> > > > can be drawn is the property of the regulator. The regulator=20
> > > > knows how much current it can support.
> > >=20
> > > Consumers are aware of their dynamic load requirements, which can=20
> > > vary at runtime=E2=80=94this awareness is not reciprocal. The =
power grid=20
> > > is designed based on the collective load requirements of all=20
> > > clients sharing the same power rail.
> > >=20
> > > Since regulators can operate in multiple modes for power=20
> > > optimization, each consumer is expected to vote for its runtime=20
> > > power needs. These votes help the regulator framework maintain the =

> > > regulator in the appropriate mode, ensuring stable and efficient =
operation across all clients.
> > >=20
> > >=20
> > > Stability issues can arise if each consumer does not vote for its=20
> > > own load requirement.
> > > For example, consider a scenario where a single regulator is=20
> > > shared by two consumers.
> > >=20
> > > If the first client requests low-power mode by voting for zero or=20
> > > a minimal load to regulator framework during its driver's LPM=20
> > > sequence, and the second client (e.g., UFS PHY) has not voted for=20
> > > its own load requirement through the regulator framework, the =
regulator may transition to low-power mode.
> > > This can lead to issues for the second client, which expects a=20
> > > higher power state to operate correctly.
> > >=20
> >=20
> > I think we all agree on consumers setting the load for shared=20
> > regulators, but the naming and description of the DT property is =
what causing confusion here.
> > There is no way the consumers can set the *max* current draw for a=20
> > shared regulator. They can only request load as per their=20
> > requirement. But the max current draw is a regulator constraint.
>=20
> To avoid confusion with regulator-level constraints, I'm open to=20
> renaming the property vdda-phy-max-microamp to something more=20
> descriptive, such as vdda-phy-client-peak-load-microamp or=20
> vdda-phy-peak-load-microamp. Along with updating the description, this =

> would better reflect the property's actual intent: to specify the=20
> maximum current a client may draw during peak operation, rather than=20
> implying it defines the regulator=E2=80=99s maximum capability.

Move them into the driver please.

>=20
>=20
> Having said that, I had a follow-up discussion with the PHY designer=20
> to confirm whether this value could vary at the board level. Based on=20
> their response, it's a fixed value for the SoC and does not change=20
> across different boards(atleast for now). Therefore, I can remove from =

> device tree and replaced with hardcoded, per-compatible data in the =
driver.
>=20
> >=20
> > >=20
> > > >=20
> > > >=20
> > > > > supply's capabilities change depending on the maximum=20
> > > > > potential load at any given time, which the regulator driver=20
> > > > > must be aware of)
> > > > >=20
> > > > > This is a property of a regulator *consumer*, i.e. if we had a =

> > > > > chain of LEDs hanging off of this supply, we'd need to specify =

> > > > > NUM_LEDS * MAX_CURR under the "led chain" device, to make sure =

> > > > > that if the aggregated current requirements go over a certain=20
> > > > > threshold (which is unknown to Linux and hidden in RPMh fw),=20
> > > > > the regulator can be reconfigured to allow for a higher=20
> > > > > current draw (likely at some downgrade to efficiency)
> > > >=20
> > > >=20
> > > > The problem is that rationale is downstream. Instead I want to=20
> > > > see some
> > > > reason: e.g. datasheets, spec, type of UFS device (that was the=20
> > > > argument in the driver patch discussion).
> > >=20
> > >=20
> > > The PHY load requirements for consumers such as UFS, USB, PCIe are =

> > > defined by Qualcomm=E2=80=99s PHY IP and are well-documented in =
Qualcomm=E2=80=99s=20
> > > datasheets and power grid documentation. These values can=20
> > > depending on the process or technology node, board design, and =
even the chip foundry used.
> > >=20
> > > As a result, the load values can differ across SoCs or may be even =

> > > board(unlikely though) due to variations in any of these =
parameters.
> > >=20
> >=20
> > Okay. This goes into the commit message and possibly some part of it =

> > to property description also.
>=20
>=20
>=20
>=20
> >=20
> > - Mani
> >=20
>=20

--
With best wishes
Dmitry


