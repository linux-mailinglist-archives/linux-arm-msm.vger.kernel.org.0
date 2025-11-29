Return-Path: <linux-arm-msm+bounces-83882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C5CC94893
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 23:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE4B04E0665
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 22:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBCE26C3B6;
	Sat, 29 Nov 2025 22:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3Ipb06M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APITAn7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C43D21322F
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 22:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764454972; cv=none; b=QSYuyFPlEbu12CE2wb7Np326/CQ26eCADrL7LhBdVoiW7TA9dZ85UVrFtoWewwWYlUAMLaO41f+EG7QQwwl5rLWhC6hgfbl5JTFRCiBz3t11OOxb/Q+HMy9lwz5Vt70aNv10uJed4Oz7NAo8Yaso3+oDneeIaZAbltkAFqlB3Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764454972; c=relaxed/simple;
	bh=BE4iF1qYdTW8dcx+Cn1INn01yGU14vjy2WHpax2KPYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qs7nKHwrqI3k75WYH9PF4hy+fDnv9v4o5XNPmDiCXFBnnKM49LDOurJucXcJj0F1/ugpdiiVSNRvWYkCfL/w3qZHaHIqSVe0jHLxlut9kB0gTov0zhSzFO+AMbDWF5O4pAQNy2C/Lu+3cuq1OFNNA1FOieNv/eNA7vMm72Lswm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3Ipb06M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APITAn7v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATK2Rme3761482
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 22:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wjwQhzHT9BVqC2zA4PkwVgYC
	rw7KRmitIItefR9bGTM=; b=m3Ipb06MA1W5TOZuy4IH1Pbr4XtBhbiRBd3Pw2+f
	7fKrlQiFVfdRBI3qwOjUmPZu5i+WoJeOmzHn4afE0IafTB+eBGbxRVjB+lzpSjqP
	fAqqxXjnPHEwcC0T0AJksTScSBd7taVMa7Fa4WjrZz7JtMbjnbz1d/uMpcVPKZSd
	7BOUjdlXPCcBBVUXqX+61T15cz4Qty8ySBmwZ9MJ9qldJuQi+lZE43pg+p6co86u
	FgZBqCxhJq+eF0inR9fvs9S3qGkLtDHX3h0QvnmNphR3OswL3oFgMxJN2TtHkXV/
	91E5CoEz6b0AoJTPb0aFQZXS56c3f51y3qblSCr0MbSlgQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqskf198n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 22:22:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso7729960a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764454969; x=1765059769; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wjwQhzHT9BVqC2zA4PkwVgYCrw7KRmitIItefR9bGTM=;
        b=APITAn7vh6UsrWyj5KMU02XsSL5nw1RFPkWFyFdyHoUyUEgWruFq07t3mWPlA9z16s
         MYc252wXFLu5Pco9iD3pm1AMWXa2K3GKGzknIvRPQU2ijRdXKtOK1n0EpkotcuygRZ5j
         R5KsTI30DXRJgD8KW/Vjv31bjpVZsa0hlhLFIhd9PWCyjD80tTNWCCGWSWvVyOKuQjMf
         Mr9saRsuJMliEJ7pWQJMZBMt18XcYx1yVmZ/MBEO5+cmvvN6MhbHRukvxSfFZMacsj0O
         La6xAXGkNOlj2XMvFRID+yiL2xaV0YXc4kyyUl3wcYfQKV5Nb2V3t8+4TJPZMECiMjZ8
         GoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764454969; x=1765059769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjwQhzHT9BVqC2zA4PkwVgYCrw7KRmitIItefR9bGTM=;
        b=Ud6bw6t9vHQBEXb7TSRw1e0FCwqp8hdQAQZAdrnR2n0ponSBFqYkb+dL2N9NVkzFF5
         LkaxyApg68NqN5Iz/xdH3pdt35o6wpbIImqZq5NxhLgdkXiV185/lLA/YI4m0rIuTjnz
         sg+VEDFWnXJTgAXaU/A5OEFLMr/yravR3PxhYLajJwoMjRpuybETjLeiuuXuBpXZP5gd
         hugFM5363KNv+NvIij5TzZps/p3AGbnFO0+J1gIMgEwXfMtsYeAU0d0lmMO79EQ2N2Lb
         M3VVzOEuJ5rm32I4Yelj/OVa0zsVUrOhqTqGSWuBJF2ab9wN27GADyvcuIlW4DXOGAXo
         rsLg==
X-Forwarded-Encrypted: i=1; AJvYcCV2HgmTDRw1+T4YNjLGzEuMuFy90mEYWv9XF9MZmRWE7zNAbkGKfn2oQgK99X03TSOtVMQh/sCSBoYF6kPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxE9XJ1fuSHytlWa7qL6bebH7OlgWogCRVzbu5Dam6WtuF7esia
	Z/ExecsWVXyRb+goPoY7BLOrNpMzbV5DbCLP5fKeQAyMtCYOwya0+KiptNST7xwDC3ZJ/SXbwZC
	4j0ndM9WHDXcMQFn7R4/eVg3S34Ht9LKZETFBYTpuhxi05hwPIPkvTrgEuHHE1236lDk6DDXHvG
	MUpV6nY9cJeNZ3rVsfY3DyUcJD3UBgQzCitbwXc8B/EFg=
X-Gm-Gg: ASbGncseM+KrbTF4POhmPPDok0Sfdzqucb6K4iL4KTgzptVZ6Gk5OkZnTcwTy7ABLbI
	3l7cvhH3EMLJeJDxHd3rO2N4bQssURLjoHMm3aTCOjeJymxCuC/CDaiJVuWm714mCgkXD3pSBqM
	oyrvALC1CRRfj9V8oLSqK/1s+EhwUP4quJ8sM0FJn+zJcxAOP85TBStPeq6cXvvdcakg==
X-Received: by 2002:a17:90b:1802:b0:338:3789:2e7b with SMTP id 98e67ed59e1d1-3475ebe8350mr18298534a91.13.1764454969062;
        Sat, 29 Nov 2025 14:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAfJJiKsqxeMifoaqRLpI88E1sfmB8UrYGYLg8GAPopV5FYeDzqFmW0/WwkQLCfn+7ugJUSYOqrKvAQwwcELU=
X-Received: by 2002:a17:90b:1802:b0:338:3789:2e7b with SMTP id
 98e67ed59e1d1-3475ebe8350mr18298520a91.13.1764454968602; Sat, 29 Nov 2025
 14:22:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126-slpi-v1-0-c101d08beaf2@gmail.com> <20251126-slpi-v1-1-c101d08beaf2@gmail.com>
 <jxlq4fbtl5rkiyyaivoelynw5hjpb3xtg4klcyocyzbs6ncpqa@rhqcwbehisjv>
 <2c7fc579-6d46-4821-9059-4ccce589ffdb@ixit.cz> <hw63nhhm4n5fngmrhy2pktztxq32ix4n2be5dycowglekee2rm@js3jyst2i5oz>
 <58e62b16-2056-470f-a868-1b958949c411@ixit.cz>
In-Reply-To: <58e62b16-2056-470f-a868-1b958949c411@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 00:22:33 +0200
X-Gm-Features: AWmQ_bkGfUo3owmNnmBkWC7NZ8BctNgfDdy_d7ejM7ruh6dnStGPqfNnfxjYRwk
Message-ID: <CAO9ioeW9=TPde4P=AOcQANvPv90K-9MkcRRgb7HNwe8KiOpFjQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
To: David Heidelberg <david@ixit.cz>
Cc: longnoserob@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=X7Nf6WTe c=1 sm=1 tr=0 ts=692b7239 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=P38NquS9la7hg7DsUToA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: tC3q1B9v6EpP8ybQOCNkDAcoCYpTZMZn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDE4NSBTYWx0ZWRfX/urmXZu4MX+d
 fTeCtUiFxP5yS/oyTd0tLgYEzWX1zJG/wCGxRFB5vVdryqHfyc1zbQXAWf/cmlJ7XMe6Jc6DCke
 QxNkvVZZazj8xrMicAdOhH53dky4FYenpcN1TgaZUNV0xo1HekobKhyM1y5GyOH6P+D1JhmgAqB
 TRLaF2Ke9NP2fFTSgQKXFneKa+MKmUKhjeGlukSa1cJ9LBNJEv8iDovWv4Wv4uVdD6IOpgMKJ7P
 fy0+yJwpHHOMjXcfcnUSwu/xdz0iJ0wxKVRl+uKClyEsPFGn67HvPcgnV9ZxpcopRFY6TGyrWBE
 CttnD0FQZmBWBqC1KusVJlefhJpPHhO7x1QD6Boy89GLKJbgQHpRE5JDlLmTAIpW2Qgj3tMSnZj
 n2YwLdMzDsKpuBO8pUADND9XTDSbVQ==
X-Proofpoint-ORIG-GUID: tC3q1B9v6EpP8ybQOCNkDAcoCYpTZMZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290185

On Sat, 29 Nov 2025 at 14:08, David Heidelberg <david@ixit.cz> wrote:
>
> On 29/11/2025 02:15, Dmitry Baryshkov wrote:
> > On Wed, Nov 26, 2025 at 03:59:48PM +0100, David Heidelberg wrote:
> >> On 26/11/2025 15:41, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 26, 2025 at 09:08:35PM +0900, Robert Eckelmann via B4 Relay wrote:
> >>>> From: Robert Eckelmann <longnoserob@gmail.com>
> >>>>
> >>>> Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> >>>>
> >>>> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> >>>> Signed-off-by: David Heidelberg <david@ixit.cz>
> >>>> ---
> >>>>    arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 7 +++++++
> >>>>    1 file changed, 7 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> >>>> index 785006a15e97..0fb1d7e724c4 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> >>>> @@ -425,6 +425,12 @@ &sdhc_2 {
> >>>>            cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
> >>>>    };
> >>>> +&slpi_pas {
> >>>> +  firmware-name = "qcom/sdm845/beryllium/slpi.mbn";
> >>>
> >>> qcom/sdm845/Xiaomi/beryllium/slpi.mbn
> >>
> >> Could be this change done for all the firmware files at once but later?
> >>
> >> Currently all the firmwares using this legacy path.
> >
> > I'd rather see the patch fixing firmware paths first and then the patch
> > adding SLPI with the correct path from the day 0 (I feel sorry for
> > causing pain to PmOS maintainers). Of course both patches can come as a
> > part of the same series.
>
> Would it make sense as a follow up, I would changed "the whole sdm845"
> to the new paths, so distros maintainers can update paths everywhere
> with 6.19?

I think so.

>
> David
>
> >
> >>
> >> David
> >>
> >> [...]
> >
>
> --
> David Heidelberg
>


-- 
With best wishes
Dmitry

