Return-Path: <linux-arm-msm+bounces-76093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D82FBBE8C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 17:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E2CA4E2B68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 15:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A2E283FDF;
	Mon,  6 Oct 2025 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bibJvolT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571202D8DB1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759765802; cv=none; b=UFBsdRffpnt2MJx4Mqlk9rcq93NbSMwHXoJdXKGPqvlI0AiM+tc7g2o2utWax1dAo2To4EbWxVC+BTeTRvLQ5wrFy9Lx2FDvoAktktBBVgb4BrohNJovcwGUxrTz3k/2fMcRIXtiWW8uNNB3urxhnPjEXwPjGrfyYLej1fB5VqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759765802; c=relaxed/simple;
	bh=W3PMT+hwZQ6aWg/sisolkXdcpO27FcPguWJfzNMoLuU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=K1+DZ5m19wG1MuGBkhnmi+6yifbgOGO6lR7P003sWVkfJCHzWeNsHBrpVNrO0DUakWVpP8jvnKPhX93xxVrF1Ygm3c7aK8pa+w266Fq7U3TVHGQ260ku+V9fi2wpnPeHMkXDiLLVR2rk1Kv2u2reJ4JUlb5GkT48biDzU5zfT8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bibJvolT; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f1f29a551so6404425b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 08:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765800; x=1760370600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aBmtSE528Py14xtzoWyp+hmgQ/aJvwHpZdOMZKJdoak=;
        b=bibJvolTrTu9+1p3keFG5lKoehhluFuAGAw0GSjuywIGF6RbHSL11Df4XsvM96ywhe
         qQ/VXPsCsLQje60f0d6Ma4u2S05mytMsaSStlOmK/HVcZgr1YdtPoWWeoLaEK5F6Cb4Z
         CPhQOPTfO6tnBojusQxLfUjpZZBqgBi5fu4x89SV5bDaqkLH0jy3NYiYeqA0MFUgLnje
         SZNRbWjRALq4qecf3R5qcKjos0MW5uCL8xSkr3S1I0cRql097i+2tXlX4Lser5W+mxqH
         RIKfMOlGbF2Yb/bVoCOyVK06C8aDueRt/tHO476gyq1Mp71wBbJRKye/LXxqGdSNNfsg
         GPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765800; x=1760370600;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBmtSE528Py14xtzoWyp+hmgQ/aJvwHpZdOMZKJdoak=;
        b=NEooMbmwrk4l6UQ+wHZIBX8GsfkMXF+7C8xPJYh4Cg2uESYWMm6lNWpVgVFNnbVeLJ
         1gFnZ/MRFnP+p1h5U7n3BKEPXwFDbu9Xuf6ij2w1hcNW9KCTazp7rVIqm+SoFQMHP3ek
         e/roskh4Sp6GLjdcVsKYi8TgcfzMd01YSIZl4Svik9p/aJsQYp5HkoTqHq9eC8OONymd
         CQoLpdWrddWPDzERx/WiJqK/mKMcGfF5wWAlxbZ9QDctszhnploOvfoYSWT+k1cKRmBI
         J1ZsLzM6WMPtxcZlwt/8LY4T7W6ArWS1I1+1pUFBX6cY65IGHpUcaBJHkmK1Lfwm6rb3
         xDcw==
X-Forwarded-Encrypted: i=1; AJvYcCW8K48J9iAICtdo8UI7bCc40m6SgFH0tW/NqQoa2YaciKicPoBENLOrtxEh7vFluHf6UIF+dcmt5y0r051i@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp6sot9vwK010essLi85q5RDyBRJsQL3c3eAZ63gpQtdVm17oP
	GNelYcfnf1AH8ZPFo7X3gk4Xg2DPJmll1b9spGg463rspalLRLAQyyHt
X-Gm-Gg: ASbGnct2KhCN5GgTokWSqCqWT9cuj88AzlWXmgZX586zQgbf683QckQrroR66BGw0pF
	ROv2URVn67lTQ41KsrOVRqfiyROTjTIlodd5CYOVkYgJgaw6LtepOEIjBhfARZ4SFhs4cWLDnDb
	OPZ1bwc/8lEAWF7Rs46LTPUoBpldNTz+wvPGTxx9LArAaR21FH/4ksousYVOZv6VGXXC3okyQEw
	GSeCRi1hWwLyGY4NNUFuGAJB8gil9eWwXLopnFAfd3iy+7Ku99Z5HwnWzbwFJg/S9bcR9CrwXP2
	uvIszbBtfxwZX/d1n2jAYBzM3LdyVFTnYE4mpEgWxrMhgHUAULAT3n9ChHy7uuw3t6tXBVm82+V
	KnMhA5hN5O0yxMKNg8aCazl+qGgpninFQgsgSZyP//io08Tzd7yUlHr6Wt9gPqoRSmpaF
X-Google-Smtp-Source: AGHT+IGWCHtuMHA7m1kQjEv0z+l6rbbms0Kog1pe29YFHLTZBAPJ2rs/rWtsmuM8c24eMOHMFoatnw==
X-Received: by 2002:a05:6a20:3d8f:b0:24c:1f78:1803 with SMTP id adf61e73a8af0-32b62093c5amr16080333637.38.1759765800563;
        Mon, 06 Oct 2025 08:50:00 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:18:932:c1e3:aaa3:c804:f5ef:49e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13088496b3a.37.2025.10.06.08.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:50:00 -0700 (PDT)
Date: Mon, 06 Oct 2025 12:49:55 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: r0q: enable ufs storage
User-Agent: Thunderbird for Android
In-Reply-To: <7875ad35-366d-4480-979f-426f5760aa2a@oss.qualcomm.com>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-6-ghatto404@gmail.com> <f032db60-d625-4814-a5c9-0610618b7351@oss.qualcomm.com> <97CA26D8-2CB5-4F90-A4C8-BCD81C688F35@gmail.com> <7875ad35-366d-4480-979f-426f5760aa2a@oss.qualcomm.com>
Message-ID: <289A60D2-9184-4DAC-BE41-D202F02361B5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 6, 2025 9:08:54 AM GMT-03:00, Konrad Dybcio <konrad=2Edybcio@os=
s=2Equalcomm=2Ecom> wrote:
>On 9/25/25 11:37 PM, Eric Gon=C3=A7alves wrote:
>>=20
>>=20
>> On September 25, 2025 10:07:31 AM GMT-03:00, Konrad Dybcio <konrad=2Edy=
bcio@oss=2Equalcomm=2Ecom> wrote:
>>> On 9/20/25 3:46 AM, Eric Gon=C3=A7alves wrote:
>>>> Enable UFS internal storage of the Samsung Galaxy S22=2E
>>>>
>>>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>>>> ---
>>>>  =2E=2E=2E/boot/dts/qcom/sm8450-samsung-r0q=2Edts      | 39 +++++++++=
++++++++++
>>>>  1 file changed, 39 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts b/arch=
/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>>>> index c088f1acf6ea=2E=2E0a55ce952f93 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>>>> @@ -146,6 +146,24 @@ vreg_l5b_0p88: ldo5 {
>>>>  			regulator-max-microvolt =3D <888000>;
>>>>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>>>>  		};
>>>> +
>>>> +		vreg_l6b_1p2: ldo6 {
>>>> +			regulator-min-microvolt =3D <1200000>;
>>>> +			regulator-max-microvolt =3D <1200000>;
>>>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>>>> +		};
>>>> +
>>>> +		vreg_l7b_2p5: ldo7 {
>>>> +			regulator-min-microvolt =3D <2504000>;
>>>> +			regulator-max-microvolt =3D <2504000>;
>>>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>>>> +		};
>>>> +
>>>> +		vreg_l9b_1p2: ldo9 {
>>>> +			regulator-min-microvolt =3D <1200000>;
>>>> +			regulator-max-microvolt =3D <1200000>;
>>>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>>>> +		};
>>>>  	};
>>>> =20
>>>>  	regulators-1 {
>>>> @@ -370,6 +388,27 @@ tsp_int_sleep: tsp_int_sleep_state {
>>>>  	};
>>>>  };
>>>> =20
>>>> +&ufs_mem_hc {
>>>> +	reset-gpios =3D <&tlmm 210 GPIO_ACTIVE_LOW>;
>>>> +
>>>> +	vcc-supply =3D <&vreg_l7b_2p5>;
>>>> +	vcc-max-microamp =3D <1100000>;
>>>
>>> because you set this, you should also set regulator-allow-set-mode and
>>> regulator-allowed-modes
>>>
>>> Konrad
>> Why is that necessary?
>
>Because that is then translated into the mode selection, based on
>the aggregated usage
>
>That said, you may also choose to omit this if you want to run all
>regulators at high-power mode (less efficient at idle), which forcefully
>ensures you're not hitting any current limits=20
Will do, thanks
>
>Konrad

