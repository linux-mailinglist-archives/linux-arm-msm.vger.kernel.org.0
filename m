Return-Path: <linux-arm-msm+bounces-77406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B49EBDEC65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F13434E507B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A138223DEF;
	Wed, 15 Oct 2025 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYOpVt6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47DB223DC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535200; cv=none; b=N3MrxOxkM0FDQrDotG5FovJOE7o2UGMBeyifMqTCq3IAa95D4guTbfra+nbOu8MRjTnxMAIDlv0jJjvpC0Mwz0rs0s1hA8hbU6o09e1z/AniED9ioEsH8E54JD1TcMcBBzuL5zfhKRdjfz/fSiR7jQozzoLCHTcGyg8PFRcrJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535200; c=relaxed/simple;
	bh=+le6pQnpYIqyDX1Vhk9z2PgAhYcQ3IwXzX0Pr+ydPoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ks582bY6xRPluj7LZIFpwUJzDCN3MjbzQ6jTEz0TtixSPTMxxWLEAVPpFchASK+UIGUHhlCj0d1+8vjy10qI20U1n1R7pWfNWVtMuhmkLsa1xmH16B/vu78viR5OeJDP+bHoxM6/gpPl4BEwfwmiokRh2L4bGHGrjY0OZvo114A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYOpVt6x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAgnBH009308
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AYsgOVBA7Z39yU4sRJaVGAv+
	du8177HkKLbBm/7CRRU=; b=kYOpVt6x7ZrOFlbBHQ7rq5QqkzFg9vxir8jxA/3j
	dfVRZe3HyGY9c+8AMXWKl749dfFUo09RFWkSow3UBoebWZMqNT+2UVfoJzfkvg4H
	gGME8YL1ShXwQ6xoYazFHE8WB03Gk+JlyqGPEasX7Qr7QqTEZb326bb9A0XIDtEU
	IQ75x3RzFKA9KwEnrq07lX/DW6DtSOVzQ5FgiZ22/bACCRFzBTzSnHx/eDE0ztcx
	hbpZCfx1Pnjg4YyionXHxTawWcqdASk8edNuJ+64zaRU6Lnob+p0PXIOgRCfCTYL
	3iiKBT71tH8fflUuve+f1a5GCG47IO+P7CBy/3Wq8U1Ajw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c4fkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:33:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88ec911196aso123037085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535197; x=1761139997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYsgOVBA7Z39yU4sRJaVGAv+du8177HkKLbBm/7CRRU=;
        b=vu1sm6oKEnVzggvASzYoTwMufRHLkMEWTzYqXutqSNcmGpIqrcm92rgvkDfhvFYJo6
         oEyjjeehGVC9usoS0E4nu/qQSCLsYyG6fwIrJW3qUn052wraBk9bOzOixCrADaEx4n9P
         +nlTE78LeKmTUn3UaLbG+13PjU7S34HJTzdCcQywKaX4IiK6sVwTR+1wpOadyKNfCa/c
         tTqJpisX4Mmd/dohxI/Yt7GvhfXV1n13EtTRivyPU+j2XV24wGmu1f7kVgt4Jds/RNZF
         fgd9/rTEwhDFiLbS8Luwsohaz4OMs0oEY0Tgk/48sXysevggV4259k1Bi6UMlNWTlZwW
         VdDw==
X-Forwarded-Encrypted: i=1; AJvYcCVGfcxXhDFX9Bgkm/1erp1qZrgaLDTCmrCiWpQVPbZCN/9faqKtHUb9wLoqk4zRwz57+rMzZ0dTFucvbEwq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy62mCNTNLJ6UTcMS1wjCGbN2Ci3CCpV1AweiyI+vIWW8E+8ONA
	F10aqf9ygSwq/G/X3JkwyHY5frB2UIGgw9GJ6EybOF4TW/d+4ZBqXn0A8Cjz6iI5dVyHoGuTsxg
	yPOsaNPLQh/Hh1ZXW7ezw0ddPQgFYo29HrhjVyxxjdBJNPuWvKgsOjDK6NjLdtekAhBel
X-Gm-Gg: ASbGnctCANXwe0Miq9qEgChjbqwTLcI1T5HZUuGiPJQ5RyKhlG9qINm/kf4ApgZB7Fh
	bgOVuh3pNRZe3JzZaVJr2LeSddPtiN1ZYUv3THNpJ/u/opOORdlVll4qxSg+asKz05cAkDjDeYE
	Sy/9b0ajfK8THkSQh2rFB2+BGRGxuwNLO8KUlb8eZzORNSXUhrrMdJJrMCmR1lVIeLUD31iBWl0
	pTPkSngPGrEPx0i5EMTW5waXfhw6iYILVoX4fAclPr/L8m/6LtHJt6PcNJugHrmBc9j3L+YnyDr
	cyGX8u3P56pIM/QrNayqnPnu7a035EjeI4zXAOeyu7ulRD92nURtyI6Z2985IaB1HrNEv682Led
	EpIIZy+Q7E/4ZeeVjtWFWK874XJyQAS0G+e+VtPqlymQPk6S6xtEb
X-Received: by 2002:a05:620a:a51c:b0:883:8f41:95d3 with SMTP id af79cd13be357-8838f419a66mr3240540385a.76.1760535196672;
        Wed, 15 Oct 2025 06:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNhZXXtF4s4gCOlTvurv+JfitR5jS6lu2tOYKVCcP5qacETjxNcMJzQs0EpP3eSrAc22cHlQ==
X-Received: by 2002:a05:620a:a51c:b0:883:8f41:95d3 with SMTP id af79cd13be357-8838f419a66mr3240535885a.76.1760535196129;
        Wed, 15 Oct 2025 06:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea11ed5sm47346521fa.35.2025.10.15.06.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:33:15 -0700 (PDT)
Date: Wed, 15 Oct 2025 16:33:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
Message-ID: <bngdsqmcxtlolmwr4it3wy7rldikzffgwwuyj443dc3v3ilaju@eiveujsf4up4>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
 <8828946b-3979-4e7b-a11c-740d8a6253ce@oss.qualcomm.com>
 <235cf6b7-e758-4d16-b5a1-182cc869b2e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <235cf6b7-e758-4d16-b5a1-182cc869b2e4@oss.qualcomm.com>
X-Proofpoint-GUID: 3ZJOEFp0m-yeloWBb0OiqBdZwbWfGsr_
X-Proofpoint-ORIG-GUID: 3ZJOEFp0m-yeloWBb0OiqBdZwbWfGsr_
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68efa29e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=tzzdwlp8NxVFzfzF-0wA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX/tNib9u/t/pg
 OV0nNiTCPeBCLWJflSOi07c+bHSm2Z3afxgWESQr0b3bEpMXF6NQbwn0GWGlsAxtGg2YNGy97S5
 53M5alxTfsM2e7nzrbPQmwvxIHWr0GaG/zW3iTGI8g758bwOQ0o9cgliLhv8aAviD7mpxNE3j1H
 uwUPywdiKXuTq76CSLAt30bQXnof+UoffeJ2oFEQOyE1OpBb33EXKr+PrcoNpApghAVIDmEpy9X
 ZF1B50avvMswmougW3/NIM+ZrLJAnEqU4tFJCzgJPWa2AvzOiYx/lIm6HUG1uBFoFSD11jVn6xy
 OOhTEaiAVjtAj5W3LgMNsqIuO5UR3hzwJwsnFawW8AQEJicd32hLl7QQ4Anfd7YD0mUEWRc+G9j
 Li4TC7PJo4AePYrhnE7FgSlNILsfEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On Wed, Oct 15, 2025 at 03:58:31PM +0530, Jyothi Kumar Seerapu wrote:
> 
> 
> On 9/25/2025 3:48 PM, Konrad Dybcio wrote:
> > On 9/25/25 8:32 AM, Pankaj Patil wrote:
> > > From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > > 
> > > Add device tree support for QUPv3 serial engine protocols on Glymur.
> > > Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
> > > support of GPI DMA engines.
> > > 
> > > Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > > ---
> > 
> > [...]
> > 
> > > +		gpi_dma2: dma-controller@800000 {
> > > +			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
> > > +			reg = <0 0x00800000 0 0x60000>;
> > > +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
> > > +			dma-channels = <16>;
> > > +			dma-channel-mask = <0x3f>;
> > > +			#dma-cells = <3>;
> > > +			iommus = <&apps_smmu 0xd76 0x0>;
> > > +			status = "ok";
> > 
> > this is implied by default, drop
> 
> Hi Konard,
> 
> Do you mean we should remove the status property for all QUPs and GPI_DMAs
> from the common device tree (SOC) and enable them only in the board-specific
> device tree files?

Could you please check how it is done for all other platforms?


-- 
With best wishes
Dmitry

