Return-Path: <linux-arm-msm+bounces-79326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A51C1828C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 04:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F296E1C60C85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672372DC780;
	Wed, 29 Oct 2025 03:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbjZI9NM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bC/VxZsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD7029BDA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 03:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761707992; cv=none; b=fm83YRJCOooMRw5aNGaJhyIUbWgHrjnqzIHYgCHLaQaQzwF6hJN8v6fgxd0FaKzuOiXQvLZbLOU666iIGOZCb8T9Dj+lGL0xAzK/0E22klbJ6m8G6bdsB820IiM+BL8H8isfOj1UMDdv8lZdmtqqw9Uc/i3/3cDgBHESAc2We/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761707992; c=relaxed/simple;
	bh=TDBNjpHbqgscAOvy2+GugorvShf4pjjc9+ahVVZmdE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+AR+rnRXbgTkN38biTspLvvT/2QQW9/GQPPeWnp+Ol8t1BRxEvPixsMzbDFiw+41rKGsA+1rvtwqPmde8hAgqhTalHP70ucwlFb96MhS1bfDLfeNAZIWRnGTk+hR4QC55clsA1wOHVbA/4VA+WVWYtzpkAdhIg5pmuh1LKOlec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbjZI9NM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bC/VxZsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlHQw2615908
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 03:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tfuOdHYPuBbRAFi2S3af3q0y
	P5GTo3VvO9e3ehC0+QY=; b=XbjZI9NMTCuvP0ON7ljI95ue2bFZ+B/HKFusXoAu
	qEkt+u/kwHbY8Nxkjzf2PRQWD1DuCUHonMVw5yzIiNiZmhfXP4vdbOAhjk1YiMIG
	zNTDt2EbSh50D7j1fYqcSFrRq98ideoANTkSqSxFp/e3b7oLxSNmJRvJoybnpeP3
	pCviYwjRMLsogwg3RyK2Z76CnbIfWBKVjjMGrg65qXMQ3taif6HPBANHFNWHdaYR
	Lte9dBJUcmzMsOr4ZVRduSwJ5/qxgCc7ppEgZvLXcyOs/NvaPjSStmiVG+lSsaAH
	SaAVA+G4HDXUtIRRgn2eN0Uu81mc0iArsSZc3/5EEFP1oQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0h03a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 03:19:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8a65ae81248so659515185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 20:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761707989; x=1762312789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tfuOdHYPuBbRAFi2S3af3q0yP5GTo3VvO9e3ehC0+QY=;
        b=bC/VxZsUz+d+GRYO7j1qiOT3HJ6mfuGS9bv2mtirPz68IuDjwNSO/lyyMi1QcZgQ8p
         EHvErgfmnsut0Hy7eLFDLoW7J3mV2k0e/g4rBR9IGxevs1kJC1Klh89+LANCb/DXb4zj
         HNLn/0oCu5NHg2kHRME3UrJgv0h4kKXBvA2fK25z0yJrXYHXZgFeDcUvo7NWXVe3i2dU
         XYRB4Ge/Y1nijjyTkrrLyn2GVRJEarXQeYEsY0BvHd94YyAmQbk8tThbgNFhZG4aY+hu
         OANVBpo8DI+CvuDiV4tc+lP0Op1uvhqdhHJYTz9ZDf5i1YgcMz1SxtMIDomcIRAQ1c+L
         tj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761707989; x=1762312789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfuOdHYPuBbRAFi2S3af3q0yP5GTo3VvO9e3ehC0+QY=;
        b=Nrzg/izxg/xBYwI3drZSMcnMMUzTNwU6yi0bMSqDx3dLI/JZIL1OXq5y1dXTTDLF4s
         RY4CktbKL3KIhLjjor7MatQDTuivLvK3CaYT6xSiDxluJh2A9UYwqmKHz1peJZ47LJ2W
         pH8gHib1LpNPcFyuIo0LR7FvrgaCz5gjZ5vYyJVul6y2KeR2p417H0F6W/e334+4AQml
         3IM3iEUo/rfyWGHUnEcThgvZ8PzYDf4o6RpEUIMy8200uOCRW/zK67o0a/0YauKob9Ml
         bjj0Ijag9AyEYLjlPCX4zHuGXZzt6ZSGTSJ4m63atKAC+AqvaahgL7TfezeKLoG2kBon
         H/4g==
X-Forwarded-Encrypted: i=1; AJvYcCWA1aEGZoXXpeBx+ru68VE80rwHwQInLIqzue18VCTJz2EQypsuQcqNc4OiCMmW3PHNnDTBuAbI8zmcm3TS@vger.kernel.org
X-Gm-Message-State: AOJu0YysIUcTbsp4BD3gTxo581QHkBdFbF+0brbq/RAikpzI5r75BUi6
	/t88gJY8ytjpePOK8ZSqmd3Qx0+b3Kb8voxFnSQ6XqH5jKr4EjpAZ2/Xk5UMd4SyIutSL+j6xUA
	TDtLvftAaXkFhCA7wYyJOYoBnzaAwTSVcXCXEL379Bwf8eoFTu6O573x6M3d5RnshWE++
X-Gm-Gg: ASbGncsVFg5XLH612muuyGw5d3ANrhYLdsaBj52xYmLXxKScv9gtJKNKGWWWBEefda6
	jrxUNShunHea7WddW/zhOvx4dyIHY68xMkJ8UmMKcc4+EAG9j/lmSvkWnQkM/6gkB2UfPatr8gY
	ClwbiYCOPj1gT8S3vm7RnrBDOvQ3uR3fnrPF4uhtWPm3H4J6I3hAO2k0V06muVmRT8CAP8m6doE
	WthqliIomJYakQPQQPIOgY5iKwBBN/Vn/maNTNtkt20R1OLKpMh/7iWziSnHXU2E6KkDvwYDfUo
	c3evf2dT9wz/7woCMpzZigPJruSRbXWuyR5zXY7EbWLYFLCLb5TYc99Tf9wMjounOVIdpx+Dtad
	uXuKFOFm8yEASrDeJUX16HgclhmgZxqmWL1iFGx0sWA/lkNISTbL6/9+PAW+ocjwk
X-Received: by 2002:a05:620a:c47:b0:8a6:999f:df02 with SMTP id af79cd13be357-8a8ea5951e0mr221842585a.0.1761707988880;
        Tue, 28 Oct 2025 20:19:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPR1bnU91lCiITa3K23J2bvukY1QCUyEKr+SagA9SP4DVjvaGRLpGPgwIenuTxiRjw0NjoWg==
X-Received: by 2002:a05:620a:c47:b0:8a6:999f:df02 with SMTP id af79cd13be357-8a8ea5951e0mr221839085a.0.1761707988386;
        Tue, 28 Oct 2025 20:19:48 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f243142b5sm979056185a.8.2025.10.28.20.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 20:19:47 -0700 (PDT)
Date: Wed, 29 Oct 2025 11:19:36 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=690187d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dRtYTIcgi1dzbadgoRkA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: V6OhiWmZZuuLZ8Wc4L4T8-iDOSgJaGWK
X-Proofpoint-ORIG-GUID: V6OhiWmZZuuLZ8Wc4L4T8-iDOSgJaGWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyNCBTYWx0ZWRfX+auF2bXeryJn
 DENO8Dn43160tCTC4bAAbsbVBz9ti+Y/gMuSQLOXtPuyTCSpwOb/XO5CGio2881+emrErhojhCO
 EoTS1bqLdlj/mtEY3h1z29u81XRAXrvHDkbo1FL4Ijg34szpQGBJScfKdyz9CtZRQz4KlP/zF0U
 PoXV7rYhim1EkrYPp7jcoSZ44yd7hnT+rOnWYCsY8k8NGJzyNrDPb5u6ZYEDPx92X2nyZYFm7V3
 x7KjTzojxnLrKnRDRu22MOGw/gc6nZFtMW7pMsqgtCZgJlpXs5r2+aqzOZMP1rQCbI5qrdZlMKe
 HsD2NItdn2XMvrGUYWU1aXuKqcgg9SaUIauAcOCOWiU93Xqzq4Ur6TZenUzXNKM9yxyNTHcyGwa
 NdZbqf2aF3l9C8ymmKh27k96PGzDFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290024

On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
> On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> > On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> > >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>
> > >>>>> Add DSI PHY support for the Kaanapali platform.
> > >>>>>
> > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>> ---
> > >>>
> > >>> [...]
> > >>>
> > >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> > >>>>
> > >>>> These two addresses are very strange. Would you care to explain? Other
> > >>>> than that there is no difference from SM8750 entry.
> > >>>
> > >>> They're correct.
> > >>> Although they correspond to DSI_0 and DSI_2..
> > >>>
> > >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > >>> new features. Please provide some more context and how that impacts
> > >>> the hw description.
> > >>
> > >> Thanks for your reminder.
> > >>
> > >> Correct here:
> > >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> > >>
> > >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> > >> just some register address change.
> > > 
> > > Addition of DSI2 is a meaningful change, which needs to be handled both
> > > in the core and in the DSI / DSI PHY drivers.
> > 
> > DSI2 was introduced in 8750 already, but it was done without any
> > fanfare..
> > 
> > I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> > and an output to DSI0_PHY (same thing on kaanapali - meaning this
> > patch is potentially wrong and should ref DSI1_PHY instead?)
> 
Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
addition of DSI2\DSI2_PHY compared to SM8650.

look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},

Do you thinks this fix is OK?

Thanks,
Yuanjie

> Most likely.


> 
> -- 
> With best wishes
> Dmitry

