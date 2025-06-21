Return-Path: <linux-arm-msm+bounces-61931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5DAE28AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 12:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 847E87AD948
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 10:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF261F4CB6;
	Sat, 21 Jun 2025 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Xq3d6fnV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6136043AA8;
	Sat, 21 Jun 2025 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750503199; cv=none; b=jbL5nRpGAsvTd63J+4iDTzNcGGByxZGaMqrzzRi2ewUV1JLA1nfirtfwHoWcAjVXOhUu4lv7agyhngt9De3YaNASyvAMWbPFGhoRYErRdfdci0PMhOWmQ9EyvKAvIoVa35kNnrMIrQXqX6qNByGSm3AD4HrXgglgnFrrjYDhoVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750503199; c=relaxed/simple;
	bh=TaqHqEq0sVoaK0u6hYM/O1a8KRSF0E2deOVrPjmCSvY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=NLpUMLfPL+J+MkdkefTjyE0vBLN21yU0hpr1WI8C+wobQuQyZsl+fOxlJHiDXiBxETttlSCVlAYEtOwsegQGIJT7nWf9NsfzDyTqVNwthISsLu5t1V6oqGo719isADGkJaGe5AM+5KuzEx0wkjXymI7no3XEf4d3fZ7wO61Dq34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Xq3d6fnV; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750503193; bh=TaqHqEq0sVoaK0u6hYM/O1a8KRSF0E2deOVrPjmCSvY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=Xq3d6fnVCXHXmcp5kD/CeElYhIpm/ClZjYEaklr84hil6/6RNrtYKrf/fdejGbybw
	 cU3RsKwYK8ebi/pRtIWIMDKM6h4i1ZPOqqG4C+e2t4MdqQcixyFrJMiZ1pkRijQX6k
	 i49EL1mI36HuOeBMd1p2Cb6mPBTxx2+aQh5AS6QU=
Date: Sat, 21 Jun 2025 12:53:11 +0200
From: Luca Weiss <luca@lucaweiss.eu>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 cristian_ci <cristian_ci@protonmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "konradybcio@kernel.org" <konradybcio@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>,
 "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/3=5D_arm64=3A_dts=3A_qcom=3A_msm89?=
 =?US-ASCII?Q?53=3A_Add_device_tree_for_Billion_Capture+?=
In-Reply-To: <f83cc435-7736-4003-b5b2-a84e2fe725c6@oss.qualcomm.com>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com> <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com> <d4564d4b-9510-47f8-9930-65d3c4e90e6c@lucaweiss.eu> <bWiyUA5cF4NjzEaUwhpDvfeqs0hEizZKFKxQpsfj6htES5mPGO2Yf2AHZQcUEyR4x7Zx9kVvwenpc2djbCN148IbjtgLh7Gq_1HXicp8kms=@protonmail.com> <ff29229c-5458-4500-9b11-8044a461cd36@lucaweiss.eu> <f83cc435-7736-4003-b5b2-a84e2fe725c6@oss.qualcomm.com>
Message-ID: <0DC5CC32-231A-4802-9A69-7BCBB21066E1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Konrad Dybcio <konrad=2Edybcio@oss=2Equalcomm=2Ecom> schreef op 21 juni 20=
25 12:11:00 CEST:
>On 6/21/25 11:27 AM, Luca Weiss wrote:
>> On 21-06-2025 9:07 a=2Em=2E, cristian_ci wrote:
>>> On Saturday, June 21st, 2025 at 00:20, Luca Weiss <luca@lucaweiss=2Eeu=
> wrote:
>>>
>>>>> +
>>>>> + reserved-memory {
>>>>> + qseecom@0 {
>>>>
>>>>
>>>> qseecom@84a00000 ?
>>>>
>>>>> + reg =3D <0x00 0x84a00000 0x00 0x1900000>;
>>>>> + no-map;
>>>>> + };
>>>
>>> Looking at downstream devicetree, every reserved-memory nodes with "re=
moved-dma-pool" compatible has unit address 0=2E OTOH, kernel documentation=
 [1] says:
>>> "=C2=A0 Following the generic-names recommended practice, node names s=
hould
>>> =C2=A0=C2=A0 reflect the purpose of the node (ie=2E "framebuffer" or "=
dma-pool")=2E
>>> =C2=A0=C2=A0 Unit address (@<address>) should be appended to the name =
if the node
>>> =C2=A0=C2=A0 is a static allocation=2E"
>>>
>>> In my case, downstream devicetree shows:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 other_ext_region@0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "removed-dma-pool";
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no-=
map;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x00 0x84a00000 0x00 0x1e00000>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>
>>> which will be 'qseecom' reserved-memory node in mainline devicetree=2E
>>>
>>> OTOH, 'qseecom' node in downstream devicetree also shows:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qseecom@84a00000 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "qcom,qseecom";
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x84a00000 0x1900000>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =2E=2E=2E
>>>
>>> If you confirm what you suggest, 'qseecom' reserved-memory node will l=
ook like the following:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qseecom_mem: qseecom@84a000=
00 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x0 0x84a00000 0x0 0x1900000>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no-=
map;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>
>>> [1] https://www=2Ekernel=2Eorg/doc/Documentation/devicetree/bindings/r=
eserved-memory/reserved-memory=2Eyaml
>>=20
>> The name (qseecom@84a00000) mostly does not matter at runtime, it's jus=
t a nice label we give it=2E The reg is the important bit that gets used in=
 reserved-memory=2E
>>=20
>> But actually re-checking, I don't think your reserved-memory works righ=
t now, msm8953=2Edtsi has
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0soc: soc@0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
>>=20
>> which means that you should only have one value for address, and one fo=
r size, so "reg =3D <0x84a00000 0x1900000>;"=2E This is different to most o=
ther Qualcomm arm64 SoCs=2E
>
>reserved-memory {
>                #address-cells =3D <2>;
>                #size-cells =3D <2>;
>                ranges;

Huh, why this mix'n'match in this SoC=2E=2E=2E Fun

Then Cristian, disregard my email please :)

>
>
>Konrad

