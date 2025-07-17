Return-Path: <linux-arm-msm+bounces-65447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954B3B08B95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 13:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 508D73A3821
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 11:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FEB289E16;
	Thu, 17 Jul 2025 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImT21xl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ABC29AAFD
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752750999; cv=none; b=Nb+XBhDlDlbC4DNxFkZvHzENZRUlOgDQL8nxxIKyGDt7xk4brgbOEIIQ3XjXEIGLW77U1EHq5BZ8oY1VcQ2/F0IQEyS/SB925Tuh7raXTDtx7n+eUVizeSONYnXX3YAkgSqs/Gv/nKGc28u1INOmEfkWasCNIufHWAdJrb+QsGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752750999; c=relaxed/simple;
	bh=IRUe127TymGTKdjcSBkg4PKr2Cb+9jXVulcgUozWB3g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrLG0dxB3e+VXQBmaw5oGhERKVZcYmeOnK26Fj7afHDYpSj5UU41UWw3gMMNWXxHWSeukuSWh4uXgBSUEh0PqEBHg1q/FFV8PTk1lgnchpNCELrYiOpqECN1ZQiH+hyPw6K6H+dNq4HzPPBNMEsekZGy0nvziDDYO9QBdMf65SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImT21xl5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H434Do009576
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IviiJoOMAMhIycQf6n/gwd8j
	l6mb2ERtOrn+nwQU3d8=; b=ImT21xl5J3z2RjTL+w0brBj1bgtU8/SxQB53LPR/
	dCxD3ieMSN2yneOkGbPBeA+st2e/PKPOxAxMaWyU+6qAs2u9xgNm5IS/8iKqvtsu
	UrvDHXjHltRVygdo6WEg18CXtXuTY+XS66hiiqcEpUk0YZv2sCu6KRUA5mMjRpBf
	k63m6hqupVPUZRWZWZQQY0mMUnyRpMtW/no8IUSp/Vzz25VJH/kXHuJdBTlTaVn2
	XevX4RElhdB6GIUAsB+Mb3c1We3CQ2poKxlqglaMoBmo2qfF/gKp5Y7yA+m87XN6
	3L9q9GXE6kCFS5/1ukR34Rr53nI+BTc9pAZIf5XvcqoLJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb7d65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:16:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5f70b93bso13930646d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 04:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752750994; x=1753355794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IviiJoOMAMhIycQf6n/gwd8jl6mb2ERtOrn+nwQU3d8=;
        b=s47xRep8xDUNIM+T1SVdejf97boNU+QuJuuYf5LLkfp4rT/Hi7HXhnI3ruDDocAcSJ
         n5g8bdIKmF3X/eq5egSfk4yiE2dEcrtjEiEydmyXqMX7sUxs7pRmG98aSJdKjYvDqjzK
         96rjR9Ajg5WmtaxwFABG2szHyqtKim4F7YRefEu8ylIVfczIQUh7ruZmsLIP1sOqpMFs
         CFYmq+/ybCORzr1UiPPZNPBue1kjVZTG9ZSR33F8B/mf2nSlDaj0Gno0xcfUz2rKtSQ8
         VZZZtFHX1NDlZ6xXCZHeE0rw5pdzhYNp34+TnBaG2zBps+rumkabFEAJ6pg1Qp0B+ySC
         wFNg==
X-Forwarded-Encrypted: i=1; AJvYcCVOxHa+txDm6LO51TNU+yNVQgNvNahWEP+Ia1e+bYoJSY/BkA8Sczr/cPaag5oI6wGINLcEnYJk0DmZ4XEQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzI1onfmyVXCSxF95bJ1dG/XRlX0vHTVfhckotVuRh3dQYdMjkg
	BS4U8pGR+zOT3oXb5/XqMMxkXNnGX9ib2H4rPH3H7/JoitfmocJrzac09wTsAw7pLb8vj5VWLLK
	yhFf7F/gfjfe/5u8Jv6c56sM+BKY7oREdD/zqGMp0n54B662DwCkxbhNS/HDULtvNuPrh
X-Gm-Gg: ASbGnct1hGh22q2JkNy1Uix9rGsT6IpV69er85iVRC6WOr5m2lJVSDf/RWvaHdebyEK
	ZDBORkzp6ezEFUZvSNWsQ85hH1MmpUd8hCotSBaLC7w9P+BXdxdZegvB1CJxaXGo2wu8igy5lgr
	OtvIayo5no/IQiQi3i5J5ks00uxaCA2m7VFtU2gjkjZ70oNP2+LLrOsBPAwZk+CTNftg0ODdNUA
	Kmsd4zNPeojgajya5f0DmKm9xzBE15BJw8ci9EBbAycZ5D6TFL9IUUB2/fxEfTDCcEPeO2q0wPQ
	CYNQviIxIEWfMF8UUOqj0SDdxutOrw14Kdope8xzVNSpOix2Nxvg20mwxRd+1Fmzhx322LBWqsM
	=
X-Received: by 2002:ad4:5bce:0:b0:704:e120:50da with SMTP id 6a1803df08f44-705073a2d83mr30439926d6.29.1752750993902;
        Thu, 17 Jul 2025 04:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2v1zi0j2L7zsAt4Ih6tCoD4JfALtxxdhEUf9CdOlZ0NqloLBOpqpwEjtfUDhbRRRGRobiQQ==
X-Received: by 2002:ad4:5bce:0:b0:704:e120:50da with SMTP id 6a1803df08f44-705073a2d83mr30439216d6.29.1752750993357;
        Thu, 17 Jul 2025 04:16:33 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm20627262f8f.60.2025.07.17.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 04:16:32 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 17 Jul 2025 13:16:31 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aHjbjw8Z79Xcd/ZJ@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
 <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org>
 <aHiZpnFhhR5O0h97@trex>
 <0bb2867a-393b-46f9-ad6f-1aeee5a3a9d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bb2867a-393b-46f9-ad6f-1aeee5a3a9d4@kernel.org>
X-Proofpoint-GUID: 8-wvA6k_3BSvzo5gmquHHWRf-PrqmvqL
X-Proofpoint-ORIG-GUID: 8-wvA6k_3BSvzo5gmquHHWRf-PrqmvqL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5OSBTYWx0ZWRfX4QmguD1HujIk
 ZfeY6y+A5WyW7Orybv0djb01h5ndmcyD3JSZ8vlbUfuo5TAMRES1FP2PTEi4Qql2Le8eQj+UWYp
 C+eQNKGAACp8WJyuI0sleiM9XI0A769RiDp9K1sGEPU4PKcX6CACUSeKUy3I7m0HTcH9TxS1+lY
 byCC83c0wLS5b4Kqvk1+c7aO2Eg7VPH+g5hDH6YLQjkkwCHgc58kl8L80eMpgjFNA6EFw+ct3Yn
 n+Y5kwsmgx9A7isHpFDEp2WuQyDwjK2QnFKoMnsnCJALuMRNClxtBuIysQpNuQ3/lhMlMyUwqla
 jGDh0XIMS45vrDawHyjAZtPg2CmwNKq7yQzrEuxwnjRdhDNeGhdtRFpDVqMheeVbCvnQp46Eeod
 PYofiY7jGkcP5EgAw1EdKnEhncsy/9wgkx3AEjYPaDXxWNjH4OMzesKDj3N8BZ4OS+fi6CxU
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6878db93 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=cAyxk2cvX3BNt2Rx_zQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170099

On 17/07/25 08:45:17, Krzysztof Kozlowski wrote:
> On 17/07/2025 08:35, Jorge Ramirez wrote:
> > On 17/07/25 00:22:53, Bryan O'Donoghue wrote:
> >> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> >>> Add a schema for the venus video encoder/decoder on the qcm2290.
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> ---
> >>>   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
> >>>   1 file changed, 127 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> >>> new file mode 100644
> >>> index 000000000000..0371f8dd91a3
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> >>> @@ -0,0 +1,127 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> >>> +
> >>> +maintainers:
> >>> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> >>
> >> Shouldn't you be on this list ? If you upstream a file I think you should
> >> list yourself as responsible for its glory or its mess.
> > 
> > happy to do it. The MAINTAINER's file covered all the files named
> 
> This should be the person(s) interested and caring about this hardware,
> which means:
> 1. Subsystem maintainers: no
> 2. Driver maintainers: usually yes
> 3. Author(s) of new hardware support: usually yes

perfect, will do 

> 
> > schemas/media/*venus* so my understanding was that I shouldn't.
> 
> I cannot comment why people decided to go one way or another in other
> code, but it as well could be just incorrect choice thinking only people
> in MAINTAINERS care about hardware.
> 
> ...
> 
> >>> +
> >>> +        memory-region = <&pil_video_mem>;
> >>> +        iommus = <&apps_smmu 0x860 0x0>,
> >>> +                 <&apps_smmu 0x880 0x0>,
> >>> +                 <&apps_smmu 0x861 0x04>,
> >>> +                 <&apps_smmu 0x863 0x0>,
> >>> +                 <&apps_smmu 0x804 0xe0>;
> >>
> >> You're listing five iommus.
> >>
> >> I understand there's some disagreement about whether or not to list all of
> >> the potential use-cases but, TBH I don't think those are good arguments.
> >>
> >> Unless there's some technical prohibition I can't think of listing all five
> >> maxItems:5 .. let's just do that.
> > 
> > since the device tree should describe hardware and not policy, and the
> > driver seems to be able to ignore the unused SIDs I think this is the
> > right thing to do.
> 
> 
> It was never about the driver but about whether you should describe in
> DTS for non-secure world the entries which are secure world. The answer
> in general is that you can and there will be benefits (e.g. sharing DTS
> with secure world implementations).

all right, sounds good then, thanks

