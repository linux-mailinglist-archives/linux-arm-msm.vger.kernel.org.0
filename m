Return-Path: <linux-arm-msm+bounces-52293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A966A6D63D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 09:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E15207A55CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C821325D559;
	Mon, 24 Mar 2025 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="g3nnqUVa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663A25D52A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805306; cv=none; b=nZxOSmmxjQA0df9jm6BNv47H9cEIVvQxYQA84w5BXUu/R342knMobOqRyQMY8BfXJsBU5uOBvEwEz4zoIiW/84JTCIdTpkkgR6NZKYNK/DWYn4CfxmVoUOhA32kDqkUiD8l8sG0YWQeZFeVLUmnBh9v0ciNtBZgryQtRZgYbkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805306; c=relaxed/simple;
	bh=K3YpedOgsq+C31b7tTZPOvr8kmsx7aRuaqrW18HIxhw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RGrB6EbwOIHVTXhYC1XHbtQm4tuBs12q82hYyCBOVH8jQ5IDiy6SHR6qzlmAXChqlPJnbd1paKQfW2olOlBddpA/fENb1KroUDHrKmSUJCWm5pd928PKHchcstYfMGKcG6hpJ0FjyJCAguaFPSGRp4ytBJRQDmbGGBocZ1/8Dkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=g3nnqUVa; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e4d50ed90aso5582055a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 01:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742805302; x=1743410102; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtM2jPewpBB1GtxH9hLs2BIeUeV4rFif5sXTsAELetg=;
        b=g3nnqUVayA+f7NYeLW4hAiJ6sS4fK2KZa2bpyAoDXBkba+jQIKQUUEDXz0ESBMSWcM
         iWza+ATFopkHY5JcRWdt8zXpxCYU1gFaiinP6lHr2xTe+lY37Lb/77hCsBVLsJwx58N9
         TjgxXO95Z+vb0DX1z865cDKAE8MWlhrvSxJmINVv10KIaXQB/fw/B2TDhvC7cc+MuFtj
         MIw9a9YhKpcpLOTGKiC4xodgN3K3AOcvtbGx6WLLbV22kld7Uv5EbyH4zp1dBWOLN15o
         vyaBFZeufh9eZIbOm4TwBctTezPT6Xb099svTmaDB/j7e56g5Uc62cJ76AAIwI0sNnmz
         ZMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805302; x=1743410102;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MtM2jPewpBB1GtxH9hLs2BIeUeV4rFif5sXTsAELetg=;
        b=FH/oqEo+0UruDWvrv6p/3z9L4HincICpPDY7FMoJdh4xIqiUJm2x2v/1vHd/I2WjoK
         iql6PtNRRb4M3vfkC7euxCAdtekvDcTrq0UZAx8NNAfAHh9nQhxtmiWVG48w2x5xI9HR
         0cAFkaqkGeBUvF7SR7A05tz793/dFQyAb3AIMkWgtpsm1IphRLgpcLBzHMSm3vjJAraY
         mrKSzXQeTPMXAkXblpc5idqDepDq9VF7D6xGnPVb+ikwJcudj8n26s2gmJRJO2+u49rD
         pzh7wkKSxiGfmp3C2Cu8QjZ6p8y1Bg44/xxFmIkuwRPFdJkmrghfmBhmbbxGNuRQHkG2
         MSKA==
X-Forwarded-Encrypted: i=1; AJvYcCWaowmBy/aEmRZf/komgD19xCjj35GINFXbw1CPCXGT+OGIsofwndQ6LEK2ggsUismjazAastEqNkX7m16+@vger.kernel.org
X-Gm-Message-State: AOJu0YwsaW85SNDRiOY0S1559pUEZcyKPrwLu/gFdzjR7bzG5yLnxLd4
	NToX2JD1ZkHSP4Bz9VZZsJlDDvENAtH/3HRCjX11sBH5fK/MIcgqwAiD35AlBN0=
X-Gm-Gg: ASbGncvpqq/88/BOw4eoOlHTECMjlOTQkVcewtUsowhsj3rtqeDTKOOYBih1EokQex3
	GtmTsv6Hhwh1sDlR98JYA2/ix2nj8SU5foBDVsE0ET0ZlfviOA5mBKJOwrTT3XHOq3utqZwsUO9
	uYWrP/Gr4/g/lLOz4PKbh5O3c+E9WLz44y5jGWnNZY4kcgfsnPzzC14kQHS4kdLeQkTAuYVtJTu
	gOjrtGckEzK7LHV9HETPP/0OjVKtOZGylyd3FcHSE2PHAvyNJDrz8HduL7GL3gGVFGt7231yEn1
	IBlC3wv6197n3XGUzppbymICMMfnVEjE34LzeH0uIuxldRjX68mR057ErFqs5kC8Omy1sF69XDD
	MtlB9oN03SrNyauedZZU8XuSa
X-Google-Smtp-Source: AGHT+IGB5qcChPuaAQdfX+14ZggTxmYRK+LL7JdV3Pt+9T+i1b9nMe6nfbPAb3Nqpg2BGHGLPaSOUw==
X-Received: by 2002:a17:907:971e:b0:ac2:622f:39c1 with SMTP id a640c23a62f3a-ac3f20f3e88mr932569966b.22.1742805301737;
        Mon, 24 Mar 2025 01:35:01 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd8f37asm645336266b.179.2025.03.24.01.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:35:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2025 09:35:00 +0100
Message-Id: <D8OCX2BM20CX.J365MYKB5ECZ@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Taniya Das" <quic_tdas@quicinc.com>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add video clock
 controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
 <20250321-sm6350-videocc-v1-3-c5ce1f1483ee@fairphone.com>
 <wjq7sxdc5enfu6zhp4d53mpyevzbuwm6qc73kwiu2v3v5p4zkk@mevxbzosjai5>
 <D8M2U2EUF169.MWRPXFYRBXMM@fairphone.com>
 <dbdc13ec-13ca-4d80-8c96-26e5e7b4ab3e@oss.qualcomm.com>
In-Reply-To: <dbdc13ec-13ca-4d80-8c96-26e5e7b4ab3e@oss.qualcomm.com>

On Fri Mar 21, 2025 at 5:23 PM CET, Dmitry Baryshkov wrote:
> On 21/03/2025 18:15, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Fri Mar 21, 2025 at 4:56 PM CET, Dmitry Baryshkov wrote:
>>> On Fri, Mar 21, 2025 at 03:45:01PM +0100, Luca Weiss wrote:
>>>> Add a node for the videocc found on the SM6350 SoC.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>>>   1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dt=
s/qcom/sm6350.dtsi
>>>> index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..ab7118b4f8f8cea56a3957=
e9df67ee1cd74820a6 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>>>   			};
>>>>   		};
>>>>  =20
>>>> +		videocc: clock-controller@aaf0000 {
>>>> +			compatible =3D "qcom,sm6350-videocc";
>>>> +			reg =3D <0 0x0aaf0000 0 0x10000>;
>>>
>>> 0x0, please.
>>=20
>> There's currently 80 cases of 0 and 20 of 0x0 in this file, is 0x0
>> the preferred way nowadays?
>>=20
>> If so, shall I also change 0 to 0x0 for reg in a separate patch?
>
> I'd say, yes, please, if Bjorn / Konrad do not object.

Sure, I'll just send a patch as part of v2, there's no explicit
dependency of the series on it, so it can also just be NACKed and
ignored if so desired.

Regards
Luca

>
>>=20
>> Regards
>> Luca
>>=20
>>>
>>>> +			clocks =3D <&gcc GCC_VIDEO_AHB_CLK>,
>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>>> +				 <&sleep_clk>;
>>>> +			clock-names =3D "iface",
>>>> +				      "bi_tcxo",
>>>> +				      "sleep_clk";
>>>> +			#clock-cells =3D <1>;
>>>> +			#reset-cells =3D <1>;
>>>> +			#power-domain-cells =3D <1>;
>>>> +		};
>>>> +
>>>>   		cci0: cci@ac4a000 {
>>>>   			compatible =3D "qcom,sm6350-cci", "qcom,msm8996-cci";
>>>>   			reg =3D <0 0x0ac4a000 0 0x1000>;
>>>>
>>>> --=20
>>>> 2.49.0
>>>>
>>=20


