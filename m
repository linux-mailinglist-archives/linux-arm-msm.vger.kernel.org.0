Return-Path: <linux-arm-msm+bounces-54526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE5A9072E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 17:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4BE8A0495
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 15:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCA2154430;
	Wed, 16 Apr 2025 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLY9uZYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7921A1FC7D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815719; cv=none; b=k6d6HAf3n/QBjlWYJPka+qYA6XjrfGDaj0r9efEQSodNGGl13ixL7+QYz2R39ZdzPu0jsosohzeJI/HMPQmUHGTDszwZ5Es5dHZd1wTHDhogCWM5g9L174/00A8+Try1cgwrVrA3T13O/pbARbf+q/VSqbHhOAFvNBIQIBXyqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815719; c=relaxed/simple;
	bh=75khC+zUxMQHpAuSIar1FGlmT6yt20jE/My1l7urSYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QW9jDEU73OGtaYTX/sNbUOLAQVn6GJGdowCy45AS4V8bist1aJJpZ21bEtjqz4F2rvrpXxJ1jOcWQjqzUibDOqTV5hdEGDXMZQCoQWB/Bfgc3b3xqT1hhKVOxQ3NLx6czVwX33Q04EGCeWjm57J9zh4YJwJzhdjdcuhn7D8g+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLY9uZYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mCt4003419
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/sM7HZs5o8N/X1bsrNjj+lvilwYGw+kvYnGxXH8LTws=; b=PLY9uZYZ+nXGDROO
	VKJP0UIA+3IQIhBCA6RB2l8Eoqf2VLSIcRNf9zmoIuS0Dk5wkvy19iUnh0rfEx1e
	4EfYiChCbQr0iuCnVjR/hJ/XHdeXV1cgUzYbpOkKk7Me1KxiFi5phO8/+a5tq5e3
	IC/wgq5WOPt6d+zVP/Xjub64uFEdb+on09IqpPAuqBkWmBSMEqTYI4mGlv0rSmde
	47cMxAI6BvSX2JZvLjlVN4B5tIbHYVk3FDJ69oURS/7uDWcbGIcd/Vv4s1KDWyge
	UC9mcMnD1rMJ/yE3a1fr41cYJaSuV3TxFOIKSAU5ND8jZfynSUDLQEAGzW3vKkwa
	hhv8zw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rv94ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:01:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f4367446so73975226d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815715; x=1745420515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sM7HZs5o8N/X1bsrNjj+lvilwYGw+kvYnGxXH8LTws=;
        b=T46zck0kAn0tl9bK2x3CUzGFn5j2Yt04SBZ8qMI9zS6DY8fXOeXCH2G7u90Fma7Uar
         fLMHfw6w9LRyhM0ItBI3/+vnmGW/4OZCQ+U3+aXkSAgkv4QGhmrQUK65VIIJY0Oywy+A
         xLnwwUIycwR609YdSDqpwh1Vid+yYCCL3QhOS02ojiQc6AStIcvvBjeIDSb81kfiJNHT
         Ymei7a1o3l+/2J5tuTRcu0+L+TSVtsv6TFADpxtFSqCAHUdTYzIcgLy6CMrJauuEfffY
         lHeLziBpTaq/3ej6VCBvqFJMHRkaTymH5hNxm3OieCl5FNQPO9mzbsGqoTFxNSWTN+p/
         dlvA==
X-Forwarded-Encrypted: i=1; AJvYcCVLJESjgYrPj04kyTcrFR1ACyY1BaJDssYcz+dNSq9hOTLD3TmZurzKURKSEM8q87JxRhJ9sq8+hMEAcYUt@vger.kernel.org
X-Gm-Message-State: AOJu0YyOAb76fjzLMp5IlCYhLaKG5gsUQ5HBvQycXCtJWe3keC5y6sBe
	IvRV+Tp7aeR9CazCYpDR0SN0z/ZdhkC3s1PBWiK4VOT4cy8iLoih9h9WSmRf2t9UNIH33ZFWKEf
	BoZTDvOkMGCyK5kvnH+ZUnHPf69tFs7H6Jk4ph4WfBy7Er70X+GaLa3mPmUg7eEY8cbT5MreFp2
	2XisBJPZmWDUnKR9L94ueNUdDN/BLztWDQ+3yTFoM=
X-Gm-Gg: ASbGncujUoyOFiwEb1AX7CX9iP/AeTRDSaaIXY9y0TcfUgqCJxFM2MpDGPtL4Ajpto4
	LfCClMnlHO4nhXlLznCWn7XP/u2Uit3+302CZi44EsuemZI3UPBot7QZE88eVRe8fBkChj4s=
X-Received: by 2002:a05:6214:dcc:b0:6e8:fe60:fdeb with SMTP id 6a1803df08f44-6f2b2f30a5dmr30086416d6.17.1744815714334;
        Wed, 16 Apr 2025 08:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPdLuzk7/CU2LY/4LSlgvj1YT8WUyMkukjDJEnoQxJhTTig5RTwqFxGtUJv8uNIJqmBOBIoJ15MAW/YRMkMJw=
X-Received: by 2002:a05:6214:dcc:b0:6e8:fe60:fdeb with SMTP id
 6a1803df08f44-6f2b2f30a5dmr30085976d6.17.1744815713893; Wed, 16 Apr 2025
 08:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-6-loic.poulain@oss.qualcomm.com> <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
In-Reply-To: <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 17:01:42 +0200
X-Gm-Features: ATxdqUErmQIrzn62w1Xb5N3d8Ov7Fc_Nkbi4kYygWJeHn7qIiuYSutOBzOQ4cCA
Message-ID: <CAFEp6-0tZQowmDrEsHgU1Ncx6jR2f=Lp259vaj3mefc-9BfUbg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: tatmu3ojxa6EC9PFqU2La1c9b-k9v20a
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=67ffc663 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ncdiEfFe64kH1Y8Ome4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: tatmu3ojxa6EC9PFqU2La1c9b-k9v20a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160123

On Wed, Apr 16, 2025 at 4:46=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/16/25 2:09 PM, Loic Poulain wrote:
> > Add node for the QCM2290 camera subsystem.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 93 +++++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dt=
s/qcom/qcm2290.dtsi
> > index f0746123e594..4b81e721e50c 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -1579,6 +1579,99 @@ adreno_smmu: iommu@59a0000 {
> >                       #iommu-cells =3D <2>;
> >               };
> >
> > +             camss: camss@5c52000 {
>
> @5c6e000
> (first reg entry)

Ah right, I reordered reg to be aligned with other camss drivers.
Should I keep that order (and update node name) or reorder with phy
lower addresses first (PHYs)?

>
> > +                     compatible =3D "qcom,qcm2290-camss";
> > +
> > +                     reg =3D <0 0x5c6e000 0 0x1000>,
> > +                           <0 0x5c75000 0 0x1000>,
> > +                           <0 0x5c52000 0 0x1000>,
> > +                           <0 0x5c53000 0 0x1000>,
> > +                           <0 0x5c6f000 0 0x4000>,
> > +                           <0 0x5c76000 0 0x4000>;
> > +                     reg-names =3D "csid0",
> > +                                 "csid1",
> > +                                 "csiphy0",
> > +                                 "csiphy1",
> > +                                 "vfe0",
> > +                                 "vfe1";
>
> we also have a pair of TPGs at 0x5c6[68]000 - I think it would be good to
> describe them from the get-go

Indeed, will do.

>
> > +
> > +                     interrupts =3D <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>=
,
> > +                                  <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
>
> the two TPGs would have IRQs 309 and 310
>
> [...]
>
> > +                     interconnects =3D <&bimc MASTER_APPSS_PROC RPM_AL=
WAYS_TAG
> > +                                      &config_noc SLAVE_CAMERA_CFG RPM=
_ALWAYS_TAG>,
>
> This one should get a RPM_ACTIVE_TAG instead, on both endpoints

ok, thanks.

