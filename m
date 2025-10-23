Return-Path: <linux-arm-msm+bounces-78609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F0C01C4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 16:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B51FE3B0EFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C7132D0FC;
	Thu, 23 Oct 2025 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aL/NA2Lc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5BF327786
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229414; cv=none; b=AgTtil8igDFBn60OAXrXQ+RIkDVMvixXiEQaiQtbXaRIOGevFrBU8qS+p6uJPD4j7Kp+kccPAkMX4DkvHKzvI4sKfkixn3qKkdf4JRs3yie018/2hahsLV6lMakbK5N1Ti4RrMWSSqyoCDlx3dya9vp15jFPVJ0H+JlHHjuEvpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229414; c=relaxed/simple;
	bh=F1cgo+7/vye/dP1rUI0JQIx0PF45Y1SGew0xi6mK2BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIotGgpP4psydviKsinKYxtYPfEokJUK4zfvAuGw+0x4/0e94qHjCBt02tMuNdKhWpZkAll4BRbWT1gRwEfQlGYIfZKyZxwRU2Oq9DdXcYmJK1xhTURJqz3CXgCuW3e6ZZctsLz7dMW2u1Y1Fr0MGnt0evlJ01CBjrOOSePsgK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aL/NA2Lc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6vh2d029699
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FA91y8KBUO4yhV25FdwhubQyZiPrjcasBtAmZwi3V70=; b=aL/NA2Lc3/ljPfoP
	lLeXT+Py0a/r3/HbBV0VMnS3CLMvLjonmjRYWDLf0Vcd9U2UOYPUkXS5K6xMEGms
	sN42I1lvQ8X8Xx48WqprCCKRSm9USeVu2q4j/klqQDCCMTvN41DW87NSb/9Zw23B
	OjL9Md02aUJSI81b4AAp01FSI4UYyqnCm2gmMe9ZnoTGvdLy4TBZTGfFvvdpZYx4
	/cSqn76H1KYT1apWVmu3AWhZgEIokfUlsbhXU1Yjgbn3mYp1lbUyFoW6PGWd3Qk/
	fqFGdX6JRZVmkW3RverCKRy98guzrzmN1dxGvMaUhr+x7RhzLDOHBMOnQY4RdCQ/
	DPxpbg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge8pan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:23:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so13250891cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761229410; x=1761834210;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FA91y8KBUO4yhV25FdwhubQyZiPrjcasBtAmZwi3V70=;
        b=EegVzuJ74f0hgitNJXqViXDOceL7r3YBukc6FuxbnI6Jfd0DqwaT9IfCksr1zS0VUJ
         AC00YV0/O5wewS40A15+3S0Nn8zGO1heTVEsAYhXCgiFQ7tLODcYV/kyEEO3cn0u5dl4
         teiP1KmevOFySyq1Qjgnmf2cx0GHLwLku/md+8oBhXS7vBLds0L1W3wTovYxz4dsLbd3
         /nyJjLs9vLwcmiq3FEg13LuMZGCB5CJR+K08N5GIlpnclaNibo1aZe8C5Lb61IvudD2y
         XqFKUBzAIZJpHeCF3RUnWWHNCMkheq7j1OVTS+Nm9ILYM7IV4j9QjHfmUtvlWZ+qKZjU
         PPpA==
X-Forwarded-Encrypted: i=1; AJvYcCUyyIgsYpjP3vigHOTJfYQGgr3TVvZlCH7TT5iwCfQIcQDe4qvEi7KrBq3AHS3XrZsiLya1dSMU109NVJKk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Q5vgIw+dTMqRYBrvoHcu1FE+vyAyy6mk1VtE4rc2vTT8JXmk
	3FWS+JXrtvoCbJ2J2DzLHqcaXj46KRfuFfqQfqmM3l6WthSRhSsCCK4EpRyMFLmSjCXbCsORDgK
	86K1ogspcOiPvBNKMwoVM5FBnaSdRXe5i1NeegA+PVQhal/JJxqxpEvBsb2EKYX5OD+Du
X-Gm-Gg: ASbGncuD2Krf8goC6vaTQhPqWhEkUd8APtpSe+iqXAc0Dv7xN0rXaC7k5V1nURYsCzk
	y+lf0P3rqDaBjZuYNTkpXtw4I2NU5xxLmK3sO1+FsigTkNni69J6HisNxi3ZSgcXJY+bT7x4ap7
	ScTxHxxEyoyi7Ro78ax1Vp5aAz2yoxlNtdUq/MKNI2Mlpm8955fHgKA7c6CoAenWIeKg3TkZrHJ
	QgxgPIieXGCRivkbBrDI/SXRKrbtI0YXskML41xPOCAoS90UCtqM2aIpRHKY7GQHCVwYvS9wU9L
	61fJ0EkVEZ+2JKrELg0NzPd3LRG5LSJ7bOMMajcRKmToY3B0SGdsCagt/q/ZvUOhj0/qui36Pfa
	0I4yx/xz7wkBuYCLX92jR7cexK+tyQ2ZL3IPPD3u20zzoVqZPFUtM/RO/SHTIiTvOkOyw4363Er
	ZqHHqgessHb7Qw
X-Received: by 2002:ac8:5ccc:0:b0:4e8:a416:95e5 with SMTP id d75a77b69052e-4e8a4169b8bmr317127731cf.69.1761229409621;
        Thu, 23 Oct 2025 07:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiz4qw3pTudhYYiN2tAR6mmdOeBX2RP+NnhmDODFeqeER7hF+zhUWWqTSs258QYXdg5Oy39Q==
X-Received: by 2002:ac8:5ccc:0:b0:4e8:a416:95e5 with SMTP id d75a77b69052e-4e8a4169b8bmr317126921cf.69.1761229409023;
        Thu, 23 Oct 2025 07:23:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4cd12e9sm770286e87.32.2025.10.23.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:23:27 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:23:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
Message-ID: <4q7rtc7kdfpy7pyqa4eztjcgpraonxlx2hxcrez46msqthjtmt@f43oyk2imi5c>
References: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
 <20251019-qcom-sdm660-cdsp-adsp-dts-v1-1-9ab5f2865a6e@mainlining.org>
 <5hbc24lihvau7s2opzcxxgxkzugmbqmdtqwy23m45j4po23lnh@jyjlbgfjaddw>
 <f8daddfd-e0ec-4acd-afc5-cf0969aebb9f@mainlining.org>
 <0ca0bdfe-b228-49be-9ef7-71482d372e0f@mainlining.org>
 <141450a6-4578-4823-b516-d180eaf3ccc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <141450a6-4578-4823-b516-d180eaf3ccc7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX+pBI5jblLeml
 5Lho55JPqIFFq7Xop6RGeA4rsaKJkPxmxdYW2hrlbtSqyAIdOxUGjuhp8+eI3p+qxjuO3sItAh1
 g4udn7E5VL3MdEzHZiuHkMbeBd+gYXCQ9Tnv5cRMY/KwyvJMNWJZvmX+MboHuxsZyKDAZdmLBwk
 Zk9MgDlB8GU0E+1rSkkn9LYwom1uEPIpguKcDDvsP6OqUTBsQc3Eq7VYwOUMhsQ/MrLvPwcDAmn
 EZ4FOV2y+WiScHtd16bdTupqeMBlSklYeCQeHGDpr6PgKgwxdzkgYi/3jBKVDqUQaqTRifenVOn
 rRbKhPzcNUMPM3x8CPocrN3E+1BZOyZajZOssa07OqGUut9TfoOviWbtD3EFxLTSzSeU3FrE5HN
 341IUpuUfrdTENZ7rbOnZkWkuuSkdQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fa3a62 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8
 a=hfPBaJTrTtnCdmrs9_IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: DXW98PJATBUnfRtmr8NT-GF52vvfW94t
X-Proofpoint-ORIG-GUID: DXW98PJATBUnfRtmr8NT-GF52vvfW94t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On Wed, Oct 22, 2025 at 07:17:51PM +0200, Konrad Dybcio wrote:
> On 10/20/25 5:42 PM, Nickolay Goppen wrote:
> > 
> > 20.10.2025 18:27, Nickolay Goppen пишет:
> >>
> >> 20.10.2025 16:14, Dmitry Baryshkov пишет:
> >>> On Sun, Oct 19, 2025 at 07:27:06PM +0300, Nickolay Goppen wrote:
> >>>> In order to enable CDSP support for SDM660 SoC:
> >>>>   * add shared memory p2p nodes for CDSP
> >>>>   * add CDSP-specific smmu node
> >>>>   * add CDSP peripheral image loader node
> >>>>
> >>>> Memory region for CDSP in SDM660 occupies the same spot as
> >>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
> >>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
> >>>> cdsp_region, which is also larger in size.
> >>>>
> >>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
> >>>> related nodes and add buffer_mem back.
> >>>>
> >>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> >>>> ---
> >>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi |   2 +-
> >>>>   arch/arm64/boot/dts/qcom/sdm636.dtsi |  14 ++++
> >>>>   arch/arm64/boot/dts/qcom/sdm660.dtsi | 152 +++++++++++++++++++++++++++++++++++
> >>>>   3 files changed, 167 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> >>>> index 8b1a45a4e56e..a6a1933229b9 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> >>>> @@ -563,7 +563,7 @@ modem_smp2p_in: slave-kernel {
> >>>>           };
> >>>>       };
> >>>>   -    soc@0 {
> >>>> +    soc: soc@0 {
> >>>>           #address-cells = <1>;
> >>>>           #size-cells = <1>;
> >>>>           ranges = <0 0 0 0xffffffff>;
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
> >>>> index ae15d81fa3f9..41e4e97f7747 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
> >>>> @@ -16,6 +16,20 @@
> >>>>    * be addressed when the aforementioned
> >>>>    * peripherals will be enabled upstream.
> >>>>    */
> >>>> +/delete-node/ &cdsp_pil;
> >>>> +/delete-node/ &cdsp_smmu;
> >>>> +/delete-node/ &cdsp_region;
> >>>> +
> >>>> +/ {
> >>>> +    /delete-node/ smp2p-cdsp;
> >>>> +
> >>>> +    reserved-memory {
> >>>> +        buffer_mem: tzbuffer@94a00000 {
> >>>> +            reg = <0x00 0x94a00000 0x00 0x100000>;
> >>>> +            no-map;
> >>>> +        };
> >>>> +    };
> >>>> +};
> >>> This probably means that we need to invert things and make SDM636
> >>> inherit SDM630 and SDM660 inherit SDM636. Would you mind doing that as a
> >>> part of this patchset?
> >> I'd mind
> > Konrad decided to do the split this way for some reason initially
> 
> This isn't a very good argument, but I think keeping it as-is is a
> good idea in this case, as opening sdm660.dtsi I see a need for some
> more cleanup work on this platform.. which I don't think anyone
> is willing to do short term, this is less invasive

Okay. It just felt weird to readd the node that we remove in the
previous #include.

-- 
With best wishes
Dmitry

