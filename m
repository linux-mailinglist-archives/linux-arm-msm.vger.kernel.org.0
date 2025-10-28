Return-Path: <linux-arm-msm+bounces-79137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B683C13CB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 972C842374C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B048835B124;
	Tue, 28 Oct 2025 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VRz8I+Ws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76F713B284
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643453; cv=none; b=dveqcqsDmqg+L/wQo6gD3rGUIs4+aB9UbFtAM8Srev8HEjLdGMe7C0MtoifaZ9F5V/FPGwyHHGN4rD636cxK9u27zfDuTvpmvwMaITf/CX9kjoDtAfnhLybRKKbJ88bxZDwLKduF63VWoIcTp01cdJuCGHvfAeKZsLmEAE6DdV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643453; c=relaxed/simple;
	bh=s3V4ysK9VBeEHsI6usIIzKqsRASnw3Y4wlawsulPdaw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=VWNaF5ORnTHUOom+6RFVj3Ach0m8M8lA2DwThk565UggyRueDJCKDe39cjLLGSizi9cUwE/uVAoysCbVYk+sDR1IxQmk2Idn5cEjxEAYD9G16u59nDGBulTb68mJXjn17GccAZtRjL+tD7pCLwSrsiNk9LUAi5oFM4stZhHSm2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VRz8I+Ws; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so10821829a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761643450; x=1762248250; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tCQxocYdhckVFualS/ORMJEwcZ+WPRq+V/HGiNgJY4=;
        b=VRz8I+WsT4jSb+oysOLBJe2kthiqvrD5JrWgXb5iCnH0jMnSKE4nSzqmgJoPZfJ4cs
         LLIAofzbTCnyVP7bzYZd/rUtSGiJmlKjqJGJYc16/HHSDMngNctKXWQr5xnwCfO38Nyj
         u2KpzwdfOiCu6hcHOJJ/b9enkYuX9UY5zKFTsw8B9XONRblihNEyWs+FatwVT5yR68qq
         Nvn2mWbFEhBeUuqsTB45ub7c9J6oAc93ABa8UkiTO50Z7FRBSRhYmBTWySfRKMOYe+mG
         FRB0jG+VepfqS3o4LjyTYhULfvuNH5h3VDpNROhJIT8lw9urLEG1gR1ac0utQOYJECbl
         sjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643450; x=1762248250;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tCQxocYdhckVFualS/ORMJEwcZ+WPRq+V/HGiNgJY4=;
        b=qivLDvqDXmmILh050FXXRuRvqlgrmNHBjy0+GB8kwWNp4uUlWBKiX+7V2AYmME7k73
         IvFKDumXHohFryL+wk3tjOSkfB+TbV0OmIUuEegWVctgFK/+HURCnLyyiWpoJGCZlksl
         AMRy2P2acuycNZfSeAlNT3Cf1XxEr8QYIx8blkJvnMBYeykzABwlm1tokUfF19jdTLEt
         gSu6pvi3C2iKkTOIc2H9Kyf6BNYQXn3zf/nXsc0OUez8hOb7iGiFt5KGVYoixqEMhq58
         i9gbsSwQNOiXEWBMSaN17l5vRX9+vTM38ZgRGGVxvm5Wrchh5aCUVV/6KpX7ACCPlMty
         wsQA==
X-Forwarded-Encrypted: i=1; AJvYcCXQD+ZBrbrtjZyDZ7a1YMOihlcosQPc/ivSPVA0G8dmtDrnYGWcws4mpT2Sx73e/MhKk9WsYrqu2SczBjV5@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSLOqyGO7Hs9KgDVqgAKC9oU3hl8+Gg3CecCp7tNVOF6pPiZf
	pl5euXg2g9vkQXjILHssNmB4b8kpv4szGCag8UGk98tP+2WnTxN01FOrJsfxx+mpgzk=
X-Gm-Gg: ASbGncsGi3krahoMSfk1zpx84nzTrqMO2//P/T2hWt55Hu2Fq7HZ/wb9tvf1FPNCCWP
	O/BXZXOFGSTOuw81jM3LMlKYcwh/WJtUKWgUuh0sK2ThJBHGdVVaCKbX2NPQUJpc9VPqqiI4H16
	6Atd75NwCyv330mRG4NkeyRvUa2fB5GH6U4khM+nDBBMaxN+wr8RsXLrQSgWyQRPQl+aH1KQJW4
	BQ4QcacGKelko83YzkCFWbOMQYSDhY4tlXINDEelIQAC8USREzzhoz2eCyt18AhkipAM2O2F/FM
	QLmKERcbLg8ezF3BNnaojK4XXGKueePCuB0diVkb+XapsTHpa1T+358Z8IeSfAHjnZzOhTsAnU5
	PBjYG/1cYu43PVyc8A4zKfd2SrnklnrWUOsqbRHLhZ9hNzK8P+IxzY+YnUUz8NWVt8cfDe8/Tol
	n+vEvaMx10oFmAppuEe1JA2QOUSf+6E4ksbApWKpFYHYuJpWVfYEt02DAvof/jucMvEe+h6N43a
	ipXIJMUHnW9Cxe9oac+Q84OqWQ=
X-Google-Smtp-Source: AGHT+IGfDUGtMbK3LaipFusfcvhLMXyePNby/HE4OT8IWmTabw5qM3H/CNIe1K6Q4Ny3QldX+OWr2g==
X-Received: by 2002:a05:6402:847:b0:63e:1e6a:5a88 with SMTP id 4fb4d7f45d1cf-63ed849e9f1mr2513657a12.24.1761643450214;
        Tue, 28 Oct 2025 02:24:10 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef82865sm8450241a12.9.2025.10.28.02.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 10:24:07 +0100
Message-Id: <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, "Robert Foss" <rfoss@kernel.org>,
 "Todor Tomov" <todor.too@gmail.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
 <20251028-defiant-visionary-rottweiler-f97cda@kuoka>
In-Reply-To: <20251028-defiant-visionary-rottweiler-f97cda@kuoka>

Hi Krzysztof,

On Tue Oct 28, 2025 at 9:54 AM CET, Krzysztof Kozlowski wrote:
> On Fri, Oct 24, 2025 at 02:23:59PM +0200, Luca Weiss wrote:
>  +
>> +  clock-names:
>> +    items:
>> +      - const: cam_ahb_clk
>> +      - const: cam_axi
>> +      - const: soc_ahb
>> +      - const: camnoc_axi
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: slow_ahb_src
>> +      - const: vfe0_axi
>> +      - const: vfe0
>> +      - const: vfe0_cphy_rx
>> +      - const: vfe0_csid
>> +      - const: vfe1_axi
>> +      - const: vfe1
>> +      - const: vfe1_cphy_rx
>> +      - const: vfe1_csid
>> +      - const: vfe2_axi
>> +      - const: vfe2
>> +      - const: vfe2_cphy_rx
>> +      - const: vfe2_csid
>> +      - const: vfe_lite
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +
>> +  interrupts:
>> +    maxItems: 12
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite
>> +
>> +  interconnects:
>> +    maxItems: 4
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cam_ahb
>> +      - const: cam_hf_0_mnoc
>> +      - const: cam_sf_0_mnoc
>> +      - const: cam_sf_icp_mnoc
>
> Please share the list with the previous generation of this device. Which
> one was used here as "previous"? For example x1e has quite different
> names - nothing with "cam". No "cam" in qcs8300, either.

sm8250 is the big sibling for sm6350, so it's matching the names from
there upstream. These exact names are also used downstream for
"qcom,msm-bus,name".

I don't think there's anything preventing removing the cam_ prefix though.

>
>
>> +
>> +  iommus:
>> +    maxItems: 4
>
> I was told iommus might differ. Are you sure all of them represent the
> same (e.g. not specific iommus for specific purposes)?

I don't really know.

These 4 iommus are labelled 'msm_cam_smmu_ife' downstream. There's still
more iommus for more hardware blocks: jpeg, icp, cpas_cdm and lrme.

Maybe someone from Qualcomm/Linaro can explain this further if
necessary?

>
>> +
>> +  power-domains:
>> +    items:
>> +      - description: IFE0 GDSC - Image Front End, Global Distributed Sw=
itch Controller.
>> +      - description: IFE1 GDSC - Image Front End, Global Distributed Sw=
itch Controller.
>> +      - description: IFE2 GDSC - Image Front End, Global Distributed Sw=
itch Controller.
>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distribut=
ed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: ife0
>> +      - const: ife1
>> +      - const: ife2
>> +      - const: top
>
> Uh, not your fault, but who came with this list in previous generations?
> Instead of simple and obvious "top+ifeX" which allows growing/shrinking,
> someone put "top" at the end which means this cannot follow same order
> as X1E for example... Heh, it follows at least sm8550.

Shall we put top as first power-domain? I don't think it's an issue to
change the order.

>
>
>> +
>> +  vdda-0.9-supply:
>
> There are no dots in property names. Are you sure these are called
> VDDA_0.9 in the device datasheet (not schematics)? Please look at other
> bindings how this is being named, depending whether this is PHY or PLL
> supply (or only PHY).

The following power supplies are mentioned:

* VDD_CAMSS_PLL_0P9 - Camera SS PLL 0.9 V circuits
    (not referenced in downstream kernel, connected to vreg_s5a in
    schematics)
* VDD_A_CSI_x_0P9 - MIPI CSIx 0.9 V circuits
    With pad names VDD_A_CSI_0_0P9 to VDD_A_CSI_3_0P9
* VDD_A_CSI_x_1P25 - MIPI CSIx 1.25 V circuits
    With pad names VDD_A_CSI_0_1P25 to VDD_A_CSI_3_1P25

Regards
Luca

>
>
>> +    description:
>> +      Phandle to a 0.9V regulator supply to a PHY.
>> +
>> +  vdda-1.25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to a PHY.
>
> Best regards,
> Krzysztof


