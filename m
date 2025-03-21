Return-Path: <linux-arm-msm+bounces-52200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37376A6BCA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D259918980E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484B013C695;
	Fri, 21 Mar 2025 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onTNuDhC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C171612FF69
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566266; cv=none; b=RRPMPxNr9UvPug21o4pF+nfo3p4aiQqH24kr/+FA4PKUkl/Z5RQ5JPxASfYDNanhn73iHFtYI9SplKke3xZLC7AuWhpM4JrdGA4e3ukGcvqV+jcw6R4pqm1RbySdo7ACPuAvBEsED+1XaSzDi1V/ey8KQTaafTXga133BimyY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566266; c=relaxed/simple;
	bh=yJomqzVYF7rE9qNwzqjDuJ7IjnKiei1NhFJrdHeLxHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm9MSoiuAE+eMcf56wFiAWFw9E71LoXicBJgJpySqLEv1ZtxA0CpOr8W6K2u7DmyTZQwOjd3nJ997O3FkUteFq1wTPRskIks0qT1EWTt7S82M/+VG4V3iiS7qFMw7V/Sd9NOk0Ip7m4UzS0AM0W9vBbT/P0teQhzM+gwPM7SodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onTNuDhC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATACl022087
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=enO7l0H3hE0QmwcHT71cY/s3
	vWok3ap99CzatKJPkdU=; b=onTNuDhCNCTfXSrPOBUcLvp3f5OeALfpEsuhqHW9
	RCv52LkJ7SN2KAleenq0acOkU/xJgABrrAcTcYmL1A/0ZTF2KUurtJCKAZW5eVdM
	0YMevWr3UTANvyorpyF+QXyOX0iim7CzFO1M73VaDIQ7rL7jz3YMovWVpuK4H0nC
	ZV1yZU5fizpEfF5OgZUo8wtW7i5GOOWqAEt1LRqApZnduWNL/70Zs+5Yqt9OwAE6
	KdR8TJ/whDUmPRDaqt7Zz4qG6NO0h0cH5dVmBUMto9EDn7kMAuHbm1Y4xca2Bexz
	wxfWeKUra2VuxsoY4LnJWphMnIpWAoEDJc4xxwK4Ijn6YA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wpgwva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:11:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8a04e1f91so50896836d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566263; x=1743171063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enO7l0H3hE0QmwcHT71cY/s3vWok3ap99CzatKJPkdU=;
        b=MZ0KiDBvE2145Y/zTu9AGw4D5XsL0nNFZedd/h+GvUlhPH8nIMyFmW6TXeZU+R0WWj
         fq6r3U7OF907Xy6hvIStQr0BgzOmcIL+u5OyTv/kuaJHSCXlkSU8YktAoIXvnjTRh18L
         MsVL30XdtJ4TqjJj3DRE1i/Jo0DDjP7cSrGnl5s11GBt6eTag8/ZDos5HS5h2X4E8o/5
         sPTvlmLxMipuYsUw+97R9eHdFWV/+mV87+kxmYhJB8ywhEMz7Yz+sia3qFh1B+bMP+DO
         h3+J98NLZg9Cm1blbXuDyzZHHsO+Tpu7n4h/4d5A3lPslOnAuOyWlzMBUIyf9GfiYdKm
         huCg==
X-Forwarded-Encrypted: i=1; AJvYcCXXF1Zdk4vuQ4rw8b72p4G3/xD113UW5uXfaooU37J2omV7WWoJJLKfxaACqkmVP4c7brt31dQFxj1so8yA@vger.kernel.org
X-Gm-Message-State: AOJu0Yziw1aBiiirdwB6DjM1GRfB9Ki/E7J5YGTRC6NdutgMxUBTfPQ8
	8yzhooFnEoQRdnw1zhcsIVRQWPc5Mlc6xraUB+/Vv2ch6h8kt/nBmXYar2H2z0EZSPIsv6siDMn
	BzbdO8ddNPS9laTNg5Q8AiDKyStaG0yL4qb4ZNhzHj+NiJvChcyTJhEM+POWuqNRv
X-Gm-Gg: ASbGncuX1hkp+YIKHD0x/7QAXvT/cRoAeLX9Mi9hVTWSISIx/vVoxBdxnuMal9wmP2v
	xzSCAPuISKou11BC4gMkhLxrom4/oHl3QNdIPhcwVRHKW9Uy4MCpdr9Oiiio1GLLR9Ps0mB4olE
	dk2lUORpPzd6ehBpW6LV/JxJAm/vf7J7l/uaPb4lctGNF+DtItkHM179uVRgTJKyfR2xJunMrNT
	M0JcpK28YFWKF1LBUySzddhRQTRZ2FZBkpLF5e68qjRjcSUPIgNDzqn4j+RV2WhMxxEGfU7Pk6t
	3yTpW7r+8yye/pxkn02+x3aP9V5JNtplNSe/p5zZdF68R74YjR34dLaPUFVJ9y34hJg1xYI+hRW
	9Rrk=
X-Received: by 2002:a05:6214:248e:b0:6e6:6c18:3ab7 with SMTP id 6a1803df08f44-6eb3f323055mr49262546d6.27.1742566262840;
        Fri, 21 Mar 2025 07:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeivZrTcegaXr9Av/yzGkp+WEb5kB2nx0cZWW158gssFezgkz/WGmpsLNHyxLHrjlqxKgOeg==
X-Received: by 2002:a05:6214:248e:b0:6e6:6c18:3ab7 with SMTP id 6a1803df08f44-6eb3f323055mr49260706d6.27.1742566260223;
        Fri, 21 Mar 2025 07:11:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65037bfsm191161e87.183.2025.03.21.07.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:10:58 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:10:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        20250317100029.881286-2-quic_varada@quicinc.com,
        Sricharan R <quic_srichara@quicinc.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: ipq5018: Add PCIe related nodes
Message-ID: <6szijrbeubobgkiccxvs2povplcedacnofpqtlsnz2se24yjcs@3g2nry5nk7dc>
References: <20250321-ipq5018-pcie-v6-0-b7d659a76205@outlook.com>
 <20250321-ipq5018-pcie-v6-5-b7d659a76205@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-ipq5018-pcie-v6-5-b7d659a76205@outlook.com>
X-Proofpoint-ORIG-GUID: InN0GKevoqdQjkGQgruSjSa7u9wNXtzT
X-Proofpoint-GUID: InN0GKevoqdQjkGQgruSjSa7u9wNXtzT
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dd7377 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=IwAU_dWaxX3plY3JidMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=341 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210103

On Fri, Mar 21, 2025 at 04:14:43PM +0400, George Moussalem via B4 Relay wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add phy and controller nodes for a 2-lane Gen2 and
> a 1-lane Gen2 PCIe bus. IPQ5018 has 8 MSI SPI interrupts and
> one global interrupt.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 234 +++++++++++++++++++++++++++++++++-
>  1 file changed, 232 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

