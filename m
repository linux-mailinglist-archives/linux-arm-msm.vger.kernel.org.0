Return-Path: <linux-arm-msm+bounces-82063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE75C62F8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6F8E3A1BCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BD13203B6;
	Mon, 17 Nov 2025 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="iKOxWvtp";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="etMC2cu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E4320CB8;
	Mon, 17 Nov 2025 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369480; cv=none; b=kt8FeonCjUqhIfY4Rk0SECf2EGXXQEBUJa0Lmdye6GlCvh5HW6PqUfkeEx6oV1z952UxMttji6uE1zHZeK0RWMupTQAQbipauJbeCXPFC+b2bSO8D9qP4ovSaqpuU6ef9cCAM2o7t3pmS2e2SQkEzKrFvQfY+CcGUz16zhFyFYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369480; c=relaxed/simple;
	bh=lS4K1Fmtb4eTNMGZuYrTNAmeKTUJGJJMfMTIlLms4Pg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rA3qTeLyq91VUF1TZMf/ZJipwSeMtv1jqm9D0t/s3awJIJUqGL0KlJn57Q6bNjQy26ADWT5/GRgdW/HmKUPgLShNil7O/q0qqeoO/Ao1FszuCJw1hqHYfW0sN+b6ebYgJV7YTPVasDwUVdrNoYtHagmdw4Hxoi1F1FdJsdr44B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=iKOxWvtp; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=etMC2cu5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1763369465; bh=fCdqfPfS0t2/ZuG+/0nxkcA
	pZDIQ9xBoXBAben50NYE=; b=iKOxWvtpn5wGY0tZgAIORy21jBYEMtO566435ZBvwX2k/sW5lG
	7qMedEbmidCiCsqgqtxEWdrTLAdFFf9ZHrB0014UkmfcDspUn2TxbpzapnSb65imLtLDvDjimzs
	coNVXaphIo61mxEn4cwM8+4dCaFO/7HzmaKu90DWPjRCWxAaeveeyFh5STLKrsSNwHjZAQvG8aL
	niT8aioGWti/jIXJS0KRPqIdhmMbke9yyMp7VQdpGTtTs/P9FGtdQ10xH0K+obBbu0T4VSIc7fU
	YWdynQe/8gB88xzenCYF3Ajk7SSuHn96bImQWaS3ZlI9AhbT5rbrh0VO0qICWrB0fNA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1763369465; bh=fCdqfPfS0t2/ZuG+/0nxkcA
	pZDIQ9xBoXBAben50NYE=; b=etMC2cu5a1Vjm2bd1FaSz1AWMPw7MAEIUlqszFilL/98KULxZv
	/E5wrWEBWsB7Zo5SbEAFIpNKsr0zlKF0mfBg==;
Date: Mon, 17 Nov 2025 09:51:04 +0100
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>
CC: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lanik <daniilt971@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_clk=3A_qcom=3A_gcc=3A_Add_support_?=
 =?US-ASCII?Q?for_Global_Clock_controller_found_on_MSM8940?=
User-Agent: Thunderbird for Android
In-Reply-To: <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org> <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org> <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
Message-ID: <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 17 November 2025 09:03:53 CET, Taniya Das <taniya=2Edas@oss=2Equalcomm=
=2Ecom> wrote:
>
>
>On 11/17/2025 3:05 AM, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
>> =20
>> +static struct clk_branch gcc_ipa_tbu_clk =3D {
>> +	=2Ehalt_reg =3D 0x120a0,
>> +	=2Ehalt_check =3D BRANCH_VOTED,
>> +	=2Eclkr =3D {
>> +		=2Eenable_reg =3D 0x4500c,
>> +		=2Eenable_mask =3D BIT(16),
>> +		=2Ehw=2Einit =3D &(struct clk_init_data){
>> +			=2Ename =3D "gcc_ipa_tbu_clk",
>> +			=2Eops =3D &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>
>Is the TBU clock used on 8940 by a SMMU driver?
As far as I know no MSM8940 is using same smmu driver and bindings like MS=
M8937=2E
>
>>  static struct gdsc venus_gdsc =3D {
>>  	=2Egdscr =3D 0x4c018,
>>  	=2Ecxcs =3D (unsigned int []){ 0x4c024, 0x4c01c },
>> @@ -3764,6 +3798,189 @@ static struct clk_regmap *gcc_msm8937_clocks[] =
=3D {
>>  	[GCC_VFE_TBU_CLK] =3D &gcc_vfe_tbu_clk=2Eclkr,
>>  };
>

