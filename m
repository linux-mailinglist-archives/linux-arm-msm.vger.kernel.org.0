Return-Path: <linux-arm-msm+bounces-82260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E6779C68F40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E0A24EF69C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8375B34EEF0;
	Tue, 18 Nov 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEhEYaqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaANwRST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344FB34A794
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463629; cv=none; b=DnMEMtKwsxtWcfmRSDKpR4IEaohU3A6bHmgNrQCYupcqzK0MoIvrU5eSysS/H+6d4gOv89q9kEZQuGURWxiGFRPx6qvb1+x+MaJQwxyROOHa0Jh5zL6q+uYh4zB+LJ9A0W+GT15DsiwmQgfbHMr3cXIVsnHQHQO5sdaSHPWlhnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463629; c=relaxed/simple;
	bh=363cDDG6lIYzCNuljQcRVcSnzKLkMViiSQWxbFO6oHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHCJYSs75VjGYDDkdytmsaeVILsRIEf7WW7OEtCS1IWErGAbZ3tCrU5BSi41QpmSc6SYJRYA24lV8CL3s8ie1DGixx0AMT6FrqsYXtvROZtdXycEaeQ/PKpqUyBRhiGrTDMxpQDJeAcM02lYlbdJb6A0CZO+CBoxOhYdIFjpHFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEhEYaqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaANwRST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6P2c6384616
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTsxQYU0ffTnQEHpFCJpJKdnmsCRGi8U4KpxJlM7LVw=; b=FEhEYaqiPai8DiLR
	PfCwkqNiLyRh1x5sAhATDuedATrIBa590flX7RQRCPiSqUg7LbQyeIFcDCwa6el2
	1BDZp18XUgJvLpzU4se/vVDCWeUFbzh0h7Q0emaTHJgiaJ7uvhO9yelPimAWQT3c
	fIwef8J+JA4AHcOmLvRNM0D+l+puNThMN5e1tlPag7VKkahTE+1Pen8CrPnoXuX0
	9ZWni/e/S2T49t8pPu94+k+pUjv7mjig/l2OANVupLBuzUDVHJPNLvZcHinihqAg
	SLv/7sjzueyoIdUIc4G3v4YM+FUDCktNWlIPbH2e1akIxDA/Wy68kv2MHKj6shoG
	MhyewQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8j74x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 11:00:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88234e4a694so260754316d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763463625; x=1764068425; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gTsxQYU0ffTnQEHpFCJpJKdnmsCRGi8U4KpxJlM7LVw=;
        b=gaANwRSTrzMdWvBbvofPAloygmN69Ak+ke5gVPArQ89K7+JKFOYhFmCxFO4v0dJN1l
         qP6aEbPl7zM3kZCRt9rtM++FzksxhNmcNZsujDjbVm4135y52YAF+tY7iWTFEY8rRltV
         vBJO4KWCDidQBnuEj8RnPlecNSH3x0wwwB3dBIJGl9RLiLGwdkisd01kS5boQseDWXF6
         fBXjtRdRp8Zun6y+iaoDHTbKSxLG/O+hagixc52kuXv5Nkeb3UrxGc9hEWfxq4ld7uqV
         xeYYNnCDDuYqVCXA3mRvlHmTyKRp+IpQxctfraPWLZIGpepkSRa7px+5QP/UJUTCV5vg
         xxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463625; x=1764068425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTsxQYU0ffTnQEHpFCJpJKdnmsCRGi8U4KpxJlM7LVw=;
        b=Qnty5IYKIvwwHGjPBHAnCFHf9i7gueHwFU+8ZRzSF0HJtGEL5vUH02sKpzXPSV6M54
         fi29NFDt5fcVsV9U3X3dfgNpV03lU1wlUzKufnL8RXi1gocfZF/hYQ9pUXnS8xqtCib9
         H66bCR1R0yWMTqbvzezdKZIYCipNYKY+3ilozpabv8liGDCQrMC+TaUr/SEGNjjpyWNC
         Bxn/tv1ZAL40MCqQD/9VfgyQzKMx3J0qHg/OXvdGRhQW93pq7Hgrp1R56rAOzx0l3IIr
         nCUf6l4xbdlLvcxMyX0BPIoulDb9/Crfgu8WSiqnHdz8nDwrvZvoCoHojGSBFdLpEhU1
         XXmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjmedLI9vdaBn8WF6XuYF3k+t5h9pP7ZyyaAQrqFWlb3BPctMkveLGa8Svya7KdqYjKypnloWi5vwtQXXL@vger.kernel.org
X-Gm-Message-State: AOJu0YycSPvagVhQvVOj9DubR5NclaIccv+oNQ58u709MsGl3pCBe85s
	U2mSRRMEOupUh2l53vPmK/x4TzOsyvyRVl8gZsh/GGUB9U6sKlpYTi5CTFg/YQpnLPkVq36LTfj
	fpMb0pQ3MWL1TBK0bAv6dnTl6dm+n0X/hQaok5u6oLYEX00Oae19OpS8ZnNPqcYoe3wYs
X-Gm-Gg: ASbGnctBkTN1Sez42REKhUUB8tRy+qfeu569xfnoRKfw8MnI1w5XoCUnNo1jHIJi9J/
	+5QdZy38YOfzh+xYNAk1FT9zwouj8PtwfnniYlp/aXx/LtcCX19kN0Og5QVyZRwXhSMfpeF8VEx
	HhcpqHYnaCugn5JAf4l/bIVrr2Sfn/+KJwSqlFj/QVwvOMHQ/h0+nZooABRKQDjj7AxikUrpKrK
	Qz5e+5hZiHYNp/zO/bxYJ2DqKEmo9gpnP553mdDKut6zdBlHEX5iPlKlMr0vWaz9lK75HRkaUNr
	K0Ul03XYLc0rvrtqNprSGE61xnVGXMUfe35rqExJEiD6IrhAxCn+B5NonpdOA2ZiGwPoNRhDxTB
	/txKRk/JEDHwP2Qci+1sZEImyrxh/qoAw8Vkgyyvpy9X4zwW180A/ZMagt1VMBpYZmNEH3acsR7
	Prmx1oRp+jJYGO
X-Received: by 2002:a05:6214:c8e:b0:880:9151:2dfe with SMTP id 6a1803df08f44-882926b17e0mr233080166d6.44.1763463624611;
        Tue, 18 Nov 2025 03:00:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHW4KWICCDmbUWd742eG4D3KGOvVg3m0HIRjn7FHnvhSapKLGDNSrWUMAAqfPJwSazupHDJdw==
X-Received: by 2002:a05:6214:c8e:b0:880:9151:2dfe with SMTP id 6a1803df08f44-882926b17e0mr233079526d6.44.1763463624164;
        Tue, 18 Nov 2025 03:00:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595909e6f99sm1915900e87.6.2025.11.18.03.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 03:00:23 -0800 (PST)
Date: Tue, 18 Nov 2025 13:00:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add PCIe3 and PCIe5 regulators
 for HAMAO-IOT-EVK board
Message-ID: <5z5sqc5q547f4tb5selh6xwtiinjrsz5xx7jlvm7nchjhso3q5@ajli73mmj5cl>
References: <20251112090316.936187-1-ziyue.zhang@oss.qualcomm.com>
 <20251112090316.936187-3-ziyue.zhang@oss.qualcomm.com>
 <rakvukrdsb3vpr4k22hgvbr2yc65me32uezwrqgn2573kblirt@7q7pgr3nkvso>
 <12bce4de-9491-4040-991b-529bc916983c@oss.qualcomm.com>
 <f04e005b-c527-4d60-a0bb-4611f9b34655@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f04e005b-c527-4d60-a0bb-4611f9b34655@oss.qualcomm.com>
X-Proofpoint-GUID: 1VGdSfdB61F8pF_vxBJrDNSJc4uMC6lu
X-Proofpoint-ORIG-GUID: 1VGdSfdB61F8pF_vxBJrDNSJc4uMC6lu
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c51c9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Gsnuokm4xmw1NbURbDEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4OCBTYWx0ZWRfX3+aPoXJJtF//
 QikAdBOkM+uuPsUwoDWgFJLnYKMSnV/r6l5Z8OFnXyiBMIupQrDItFvnGIjRZ6/I6lRxna3qdkN
 Dm7jj6NKzCX3Oiqf+0zVlHaGJgjUFqMdJM1rEe/nl3wX27ITnosgifnsNUI77Bf80OEWSPEtbS9
 6kSDppKJBMjOGf67OhketFQlppmzy9SRa8cTezQ+yR4L94JayqeEpB4JvBrrW+lVj6xLyrOQ7q6
 gNtD0E3Py63Eo5jCx90VhKyKiIvvEp6wUBHdOj6+0mRB4JmB05K0byb6a4cnKdSrWN+84mOTYD4
 Zl4az2hsLDvrTIJqgm6JG+fZ4sCgFCQXHvydta5ei9MbGWCtjMM+8D6ZSNYuGzSdumeJe5KWCyO
 XiP9kN/XQKKlWSUzpGfEPLv5auWKRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180088

On Tue, Nov 18, 2025 at 11:23:43AM +0100, Konrad Dybcio wrote:
> On 11/18/25 11:11 AM, Ziyue Zhang wrote:
> > 
> > On 11/13/2025 5:16 AM, Dmitry Baryshkov wrote:
> >> On Wed, Nov 12, 2025 at 05:03:16PM +0800, Ziyue Zhang wrote:
> >>> HAMAO IoT EVK uses PCIe5 to connect an SDX65 module for WWAN functionality
> >>> and PCIe3 to connect a SATA controller. These interfaces require multiple
> >>> voltage rails: PCIe5 needs 3.3V supplied by vreg_wwan, while PCIe3 requires
> >>> 12V, 3.3V, and 3.3V AUX rails, controlled via PMIC GPIOs.
> >>>
> >>> Add the required fixed regulators with related pin configuration, and
> >>> connect them to the PCIe3 and PCIe5 ports to ensure proper power for the
> >>> SDX65 module and SATA controller.
> >>>
> >>> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> >>> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >>> ---
> >>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 83 ++++++++++++++++++++++
> >>>   1 file changed, 83 insertions(+)
> >>>
> >>> +&pmc8380_3_gpios {
> >>> +    pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
> >> What is sde7? Other than that:
> >>
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>
> > Hi Dmitry
> > 
> > I’m not sure what “sde7” refers to specifically. I saw this name in the
> 
> It refers to "SD Express" which was connected to that PCIe host on some
> flavors of the internal boards, and the naming must have stuck..

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

