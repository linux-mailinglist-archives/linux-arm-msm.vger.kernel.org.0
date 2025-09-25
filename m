Return-Path: <linux-arm-msm+bounces-75118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3966B9F792
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 088BF1C20FEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7DF221DB3;
	Thu, 25 Sep 2025 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRLaDrjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C32219302
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758806073; cv=none; b=Awx2TN1r7lvpV4WgA0qb0MVGyY7QiAoW29IdIiQRoexiLxiCvyuj20ztIVV9/nxvNFbckorcLcmHH28Sy7dGPlLH8C/Yqx0CKXqRpFp2aRR4BRxzxpdtK+WdiDDlFC6GdY+ZZO3AD3YB3yKU0YB+Ngv1Fo62qE4PkJmAsEAl2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758806073; c=relaxed/simple;
	bh=qd0Cjf6DpZnMSxDxHyzRu9KmReNI+tBRlR7JETes0Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXheUCEdvdzgS0geDQq6ZXh0mpwGQUwTq8fSKOo3HOP3indAqxpPzliXyI8T76A9QTfbX5u7Aexc4vDh6MOIFu+aXgMCkifc1hRZLeTSBnyrdiNmrER1vAFxpO0GAdOKIDUgKkvh5La9s5Ljkxl/ldsM7nVw59w2kfmJNoPQMl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRLaDrjL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P8vget025518
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HFxENkPzd7eD3hqpOwyV5+Tx
	OdegPT/L5L5px2aO4O8=; b=hRLaDrjL7CdcVCoJziZzCZOlYGd/Kibh9Pwkky8W
	RkkU4ABTOxqg3FhHQoMe60PZJan68qp6vD2sZJrCRwK6R1xxSe23HxAjHSCKdNqc
	zTEdIasWgXz1StDSLrNy53gtr6LjZTA9DP4YffVQ+lFyJeIpExLTIsjZm2KeHkET
	DjdkyPFFmAgdP8R3R2C0WfBf4fBrdGMTJKnWWtxh2d8diTGcKmx5K1+b3WkbfcwD
	kPs1WsEggqkCv6L/yZ1ZpiDaTKIsm8zMZPTmxI0M/ktLgKUJ8LupyKvDyqUqgkUD
	Mxb0ZCTXCcX+RN922bTmrHye2Z81wK8LQ5B0/3J8BmqADA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf0gum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:14:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d9ec6e592bso19605771cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758806069; x=1759410869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFxENkPzd7eD3hqpOwyV5+TxOdegPT/L5L5px2aO4O8=;
        b=o+pgAqqYlWHEYMNcWt+lXB3GmJm4Bf3P6C+pozQTCMZ2TZulqcRdC82kNh0EuruM6q
         hUhur0I+Pbf9rtH77MdypXM2UfiBGTpgf2W/qdidQYGKM9zzs3xTrVUBsnVOF7quNFlQ
         13Mp+ZWREy5Zf4/6sAZDmIKlsXY1Ko/K6sRVkc3A1hGi+sLqmoSNhjfv3hUiotwJzPFC
         kVygt2axi8Ddi0Sfw6ZGBu6GCuW2BIlXmW88Eu7tjTLOaAhkx4pRko4nTfrg8bnz/jTZ
         Ryhiw7m4Nw6ra2ptQc4bn4Fy2oCPnTka5Cy9/FUN5DqAX/ZYEXJCGkWqfWvOF1ahV2UU
         MLOA==
X-Forwarded-Encrypted: i=1; AJvYcCWeXeVUnDb7XydyIQN8vogM25rXKlumYP5BIJgFXTle8mxoQRjrS6TLcefLigcEV+V+CT/xFgkwoDg8Jm40@vger.kernel.org
X-Gm-Message-State: AOJu0Yx25x4Yd4PoXRk86kbo2IS4yXapL+s3+BPtZWGOf6u8vx5XQyGX
	iy53ssqmkqkaEpyx8NwsGw4xECaPDDG2A2eL+oXXCdPPGdCO/TlLpYnB9ReADHfaDeh7SfcXxpT
	Pno5ObPuRjF/bT7d5WHrNmCSJG09Q26suzTegBGNgQ9hzAV4IrD013gShejaoGGHO/VF/
X-Gm-Gg: ASbGncuK/hhV5QEvfmrIcU4z6qKnS3k9KInNBC5ru5AApH6dg8rUx1A612bGH/VhokS
	5Pt0byrruuzRF5iJSeeST217FW8Jt+gVwDg9Y38xPrxypRozBxJeDPP7c6OCbsdMwe1VOxO/a67
	9ncvPLEuLnKqg3b+66s6hVcDVpAXYibbTOvlJHsfCMSgnZ+tpRia+81/ZLnw57b+JIQ/SYU7BtW
	jzKXYXPUI1ftkXxM25BZeJfGGDipDXKnZSkbNkreaFQzMUHoS/rvETpKoZy2QPaF7QnUChP3xMS
	CJVX1HeO+nSRrfEHPJfA2UQphIm6Fmd4HDmypy+/iYI7hpEpVrSQ9BaMv+MiWWco/uLjiIleOua
	btNjVxH5SnDAAMjUO7WUWv5IaqgQ5A93R0YSUcB98bkL8iPKLBnAO
X-Received: by 2002:a05:622a:5a1a:b0:4b7:a71f:5819 with SMTP id d75a77b69052e-4da4b42d158mr48039041cf.38.1758806069075;
        Thu, 25 Sep 2025 06:14:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH40hIwk3dMT4mQWI4cn8s5ckhmJOi18aT/m48IkBIFn4CkHZaMCvCWcYGmSE74pe3NyzfafA==
X-Received: by 2002:a05:622a:5a1a:b0:4b7:a71f:5819 with SMTP id d75a77b69052e-4da4b42d158mr48037111cf.38.1758806067540;
        Thu, 25 Sep 2025 06:14:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313cde476sm768603e87.48.2025.09.25.06.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:14:26 -0700 (PDT)
Date: Thu, 25 Sep 2025 16:14:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 14/24] arm64: dts: qcom: Update the pmh0110.dtsi for
 Glymur
Message-ID: <lcbcjpoazpwbltedkiqlw4l3aomwvi3qsfwvmwghb6uf5wvnme@kh7qdpunfuwr>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-14-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdQH2jXcEY6ZpkmixvUt26SqdzYgDAiJ3RHMG7xkPyi_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPdQH2jXcEY6ZpkmixvUt26SqdzYgDAiJ3RHMG7xkPyi_A@mail.gmail.com>
X-Proofpoint-GUID: 4jLC27htt6nPj6vdGDxRGhnQdrGXYNVU
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d54036 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CbpXSumtfHVU6JjQo5gA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX+2sM7qTaeBys
 Bm6jCaKxYGGpKWh7fhIUQL1WUAg2w9jGBonz+Ai4/i3aLgEEgjkSQ5LKaXWp8DKbZ1Pq6+AMFF/
 vlaKBp7EI5Bx5FoipnDgEoP59tvriPVhlW5BenpevyCcnYWnCZvw7V9SgbSK+QS/VtROrsWSSia
 HEM0ID/+XUu326rT9yKjCktEWwP02Jw2KPMHyOjaXFaiYXIeCx6K774w7yrVae4EVxUHJvNqD+P
 EsNqSMNxZ7vX/my2oeJpE0dXdgUW0paXZNdkubsfyWpo/qgVfBPR+PHu7FfXpuo9QsR3n15yqCI
 mqFbpXIOpzrAW3Y5DRBC5npn2AfUIRAyR9XPjdFB1UDZlqxWi1Es+kyYE627i6p3oWiXm1kE3zg
 atIoiKcm
X-Proofpoint-ORIG-GUID: 4jLC27htt6nPj6vdGDxRGhnQdrGXYNVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Thu, Sep 25, 2025 at 05:08:54PM +0900, Krzysztof Kozlowski wrote:
> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
> >
> > From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >
> > Add multiple instance of PMH0110 DT node, one for each assigned
> > SID for this PMIC on the spmi_bus0 and spmi_bus1 on the Glymur
> > CRD.
> >
> > Take care to avoid compilation issue with the existing nodes by
> > gaurding each PMH0110 nodes with `#ifdef` for its corresponding
> > SID macro. So that only the nodes which have the their SID macro
> > defined are the only ones picked for compilation.
> >
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/pmh0110.dtsi | 66 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 65 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pmh0110.dtsi b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
> > index b99c33cba8860f1852231db33a127646c08c1e23..4a5c66e5c9fbc35cedb67601f4568844dc41fbea 100644
> > --- a/arch/arm64/boot/dts/qcom/pmh0110.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
> > @@ -7,6 +7,8 @@
> >  #include <dt-bindings/spmi/spmi.h>
> >
> >  &spmi_bus0 {
> > +
> > +#ifdef PMH0110_D_E0_SID
> 
> NAK
> 
> I already explained on IRC in great details why.

A short summary or a link to a channel / date would be nice in order to
include other people into the discussion.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

