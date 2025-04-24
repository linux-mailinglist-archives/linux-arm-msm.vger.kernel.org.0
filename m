Return-Path: <linux-arm-msm+bounces-55300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAE5A9A797
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B3237AAB95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EF02101AE;
	Thu, 24 Apr 2025 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cP+dLjgU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5CA1A316A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486561; cv=none; b=m6hzWPdMPmisDyvZ2Y4hssK6rzalc74C3LiHeH+NOZaxgeCqbpx5kIW9PYtvPZJO0K/F0W7sxa4tY8tSUZWPVRMaE/UlGoHcMapmSdXV5Pud4V04NNrbyTJz5TeQSHv4sIUGiK091qAbWmWOV4zEb0vUllzP9cn9ADAa1Xti91U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486561; c=relaxed/simple;
	bh=R/YoZhfYwAzInjD5cIcWGnHG1AtlDAzfXNK1U+3MhNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kffqd5cDadbBoJUdCq6hkQmc5lAKpmBhv4Tc+RqAk2HVP0wLKkRkzoxj1y+stNr5P4209l/nXNalrvYN9FgZGO+RT9eZr7LWUbE44GRLmPokXYu0StiZTGSxqT8mrXxSCpoMcUmrLYpEkkBRotnrqoTvowqmjG4weRyx4PvWAq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cP+dLjgU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FHXi000855
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCg0hw6Fh/v9c/WV2xh3oaxZcXn2YXmGyBOPU8Y5hVo=; b=cP+dLjgUiP/a2yAB
	w5/jDrTXuc82pxem4fnFGUJ+29abnQoIyU0ct2zxLfZ0IvLv8FESvVat9v1Tlsew
	fx9Tofl0s4mi3fiBA/Kfas2ik1IuKirfJngL5HueXEMZXJlNJaiOQ4lwMp2fNNQK
	w1wgSVUN7TvgBEiSoBMtNB1FSKm/timtXJRs1le4CDarNBGqBF7LMW9rhBdtSta0
	77c5oIKQ5hG1XWVH5y1nVjhkMsCUhkwhDzlQ3J/MxHHXrizxh4vcCGxazpQlggAy
	BvyhW/9YqQuXflHfH2AYGB9T4XY0ADiS4flyQPB6j37QEirA0vYnmprocG4Oguwy
	JVB3cQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3cxa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:22:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0c1025adbso168215985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486558; x=1746091358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCg0hw6Fh/v9c/WV2xh3oaxZcXn2YXmGyBOPU8Y5hVo=;
        b=jGGC/NbhcA6Se15UVX/nRyJLVgjJqcr//HAcio3KqVAA2faS+tyLzDmeMe1i26ZObJ
         T6i4JoYPSeZBg7XaOq8kWv78cKuDOz4zHxUHQIw13ZWsTbvcud4ciyHjMZIIpdgPO3z6
         7mgHcYMFeqcOa+J3ecjrUl0oVHVzQy91YVxvkh64UaJWsWSR1cwCh6My76XjfNnFL2pD
         XYTBmjOWxKdnfn0PCkxXG4hgmhDDNO/7uRxuUXvt3eqPypxcAI6kLeA0BdqT934Uudgo
         JixwVthpwVPe3vHQ74FYm4ZH6CzxqY1ZlpYHXnOlrOUveS73i1+TbKY6+5DQbHxbH3W5
         H24Q==
X-Forwarded-Encrypted: i=1; AJvYcCWa3SdD75biOO9BwTvhVu08k/nUcBBjHLF/YhL53AMDGFzjxYdY7QgYwySVWNsjVczVBK0DVjXlAIEf/Qvx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvg0xCBbxpLXEzScBnmc7Xctss44AdslmGJrvDrZmbPYAv8n/Y
	32m7MWGPPe1Cq0vUFWFQyv45eZ2dIG9H7Iwn5KVuSWVnwr/kmMUPCgrOSoojTBEOZ651FazdNfj
	XYZsbE2Gu9H0AWT19mS9g4zcvy5b8zMaC6NuXVYJq65i+NCRCvFBRH8X48avcfPbh
X-Gm-Gg: ASbGnctMuOVkfxF5AT+KqzM3MM7jvIENfg5vpgYe/koF9Q3MmV9BEaFMQWmZmf+jn0U
	fgtFTKkJFPD/dEusPrfsJ0D/YDAhTsFq9jRiv3zLRSFynLrzLWvNGc6A4LNlIQPElT8pJfQ1rDH
	IFYm8dZGhCTdDcghYLJdqpb8+W0Lf/iHKoGM+L7fehKfKvx5so7ONPTq5WQcB/R1SN+gNZAzFvV
	v7FjQRO0IH1setMIOQVpFHzljxXocQsplEUVowH97ZB9sphGr48jkRh4YMEImsnkgi+rHLYGX2y
	yTOfrBNahQE8n+unD1/CrFHuHJN2jaRm1qTJY2j8WZuBeGw+DPaSjIRgNUDU8KQosRHazC9irkU
	=
X-Received: by 2002:a05:620a:2684:b0:7c7:b5dc:2e36 with SMTP id af79cd13be357-7c956eadd6cmr281469685a.18.1745486557763;
        Thu, 24 Apr 2025 02:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRGwEqLtjs4iwLRMlGhSV3yKkS//BY7RFdRIp4pTM1pJjHitThMbDcermUB2XoudoXkzxW8A==
X-Received: by 2002:a05:620a:2684:b0:7c7:b5dc:2e36 with SMTP id af79cd13be357-7c956eadd6cmr281467585a.18.1745486557487;
        Thu, 24 Apr 2025 02:22:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8055sm158608e87.234.2025.04.24.02.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:22:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:22:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, bryan.odonoghue@linaro.org,
        rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
Message-ID: <hjaep4muhpl2t5hfajnmvaueq2m24rwbjkfggvhk7otl6naeoi@hqs5ejhp4sef>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com>
 <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
 <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MSBTYWx0ZWRfXz3AspOmJguwo Rstcuaq3FyoT5qObZXRqRuEQz4wpoS/nNBPR1VZOmeC4bdT18z1rnQ6Ub16kvzLZy80+C6es3N5 fuuRgV1Tot/R5+m4DfomIeVHX2ORHU7IyoL7n3ROmJ443Od8zudzNNd3Dz36TcUpBsphNQIlEZX
 AWatH7eBGqSchDT5ieKdKQ+a9koyMPUi6jZtzkzWxEa7i95noH7htJG15yUXvmWnEmMxGXOeu1n euavG8DMuWg0ik3Ks/oiN37Vl/V2ZpRkwbI7vVQ+KxILbELLqn9TUpEeoN6QOF+k2kr2zuGLEaA 4tzaomMmetU4jkSbPBjZy4lkd3v3l9AKU8Ko9lqS8L2AuuPZNW1B/36Zqs346IQgR22XNhWWzuL
 a1urf+gLwlsj8Q+jZDa+EjKEEGwvSf1Od3nHj/mjnrwGzIw9ng517qcmrVzoRPW1mZIb6aQu
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680a02df cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=mjnsDWXEGQxzJec5DR4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dsamICWRm3fGwvOcHNZE56amKME7zjiA
X-Proofpoint-GUID: dsamICWRm3fGwvOcHNZE56amKME7zjiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240061

On Thu, Apr 24, 2025 at 09:53:04AM +0200, Loic Poulain wrote:
> Hi Krzysztof,
> 
> On Thu, Apr 24, 2025 at 9:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Wed, Apr 23, 2025 at 09:20:43AM GMT, Loic Poulain wrote:
> > > +  power-domains:
> > > +    items:
> > > +      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
> > > +
> > > +  vdda-csiphy-1p2-supply:
> > > +    description:
> > > +      Phandle to a 1.2V regulator supply to CSI PHYs.
> > > +
> > > +  vdda-pll-1p8-supply:
> >
> >
> > How are the pins or input supplies called?
> 
> Pins are called:
> - VDD_A_CSI_0_1P2 (for csiphy 0)
> - VDD_A_CSI_1_1P2 (for csiphy 1)
> (both of the above are supplied together without individual control)

Is this a requirement of the SoC or just a typical implementation?

> - VDD_A_CAMSS_PLL_1P8
> 
> >
> > Before sending new version, allow people to actually finish ongoing
> > discussion.
> >
> > Best regards,
> > Krzysztof

-- 
With best wishes
Dmitry

