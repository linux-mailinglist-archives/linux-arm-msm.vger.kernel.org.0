Return-Path: <linux-arm-msm+bounces-79741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58194C21A5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDB61427443
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43602EA151;
	Thu, 30 Oct 2025 18:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6mN25O1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2eJrcxv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342DF23B607
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847279; cv=none; b=S2zNox9RnC2YxssVRuan2RfhJh7KKa6yUi2rptrwuy8zRVvKtxE1O0kLqdYHpmIgAcsXyqJKDu10cjS41EQ6LH5pT0iRWVEwkLMdkZneTfIJrKkZA1qbsvtvWv711P54begPro9Ip+Sb6orsJesl6C4WBs084ve4XQ5k3UwHdcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847279; c=relaxed/simple;
	bh=Rn9bRqhzSNXcchPQcrH4b0rYlXJqIKlgZkSe44lo8DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c636rRDtLuEF/BwKI3wBSGl+m8jQzua4sCBP++TLxKqMGoWIkzjOKYJM+IBjqoJ6Yb4u93qSzGbRvVApRJkI/p2omzV1CS9h6ULz2FdSEBiccA66R6dyfLsuX2TZcaaQKg1owxq70hOD9gPPSGMbjt0SdNA5n1SB3SVMN66PEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6mN25O1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2eJrcxv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFHEv5102638
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cXV5bK5NXAnWN8bRl9mITOxX
	zPOm4995onAokhRKwyM=; b=m6mN25O19Y4bcqLCtKcVEF0B/y1gxRwia7ULE0fq
	qYPXfgHrA1nctu1RYAFFx5yrQNs1wM304UEcfyB0cZLP7H1HBTTBecQ+afqCWy0F
	CQPWRKpivCGuX5490S5PjipEM8H0yzqLUns/rYD0f7igFBfUecFUlq/7VbE3cgr9
	VvTC82IB7llKV6mX+EyUnXbBeMajf9O9sc8MzYq7O8ok7IL+OXOAVyZtbqOE6LO1
	cu3ybhDOR8s2uacfCdPvKSB1OKP2E+q1gYKmNt7EOvTFwjwwSv5yM/0PB/e4NHRR
	6ziRF0kQ3Ebah6qHgtIv3ap2ryn8BrZDSLVP0q9lqUqpYw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdgfuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:01:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e899262975so37713481cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761847276; x=1762452076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cXV5bK5NXAnWN8bRl9mITOxXzPOm4995onAokhRKwyM=;
        b=T2eJrcxvQ2jCjsvgNYu6X+ahrj8rQJyUaPv9xbPNiLf1q52G1BJtJdCVODW17aTeZ6
         wBJYx4hXVhTQZX4wWDvjaQUGsOEbu7mYFiMA10KMOmgBYf35PBQ+ZDNNrLTZFSjX4PRR
         2cHzKiJ7S8nhrqDan5dF/NAvcIyFdRJwkvhW+WbSpsG8+raQdGHC9vRFFy4ReEBLua2c
         578lnicML3BMWgSdXNtGM9V5fIQ6a3NVs/0ndLzCuLGUh3C8bz8vjWXW4vQKO9N+AH29
         IPUrv9WN5pgYISU+eLVus8zT445hWGkF48yikYRU7LAjXeR1H+TlPZ6n/V3qb97rX0ey
         n5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847276; x=1762452076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXV5bK5NXAnWN8bRl9mITOxXzPOm4995onAokhRKwyM=;
        b=wNSwxmEUYyg+F1O81bYS/nn6wy6JZd8usEHw1h5fgAnmbb5LKp05WXB8U3W5zr2sMM
         bhp62HhtfS6qE6PVPiD9fNanXX8FNjVqc/kI5pUzs8R5ci8H70HE9ttcqpqt5NL2b6tq
         +LkLM+RAClyCMZfQvifW8IBUosE4lFcS5etTqx7xMrHkTMbkM+TKCsgKMgwKsZvmJhwR
         pGKUg7M71QDtpsf5jnlgXtHkJgsXqVVl4bfpKiG34eC/KrLE3rr3IMvuj+ouk9IwWBry
         dmILk5pn/89r4ypyBwTh/YOBiBFwc1Op5+S6m7D18VPOBlsMbDAYMkgexJdKsjXFgm3J
         VAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzl/cghXIeA69rEck2E7laJRkFbGXHTJU3wnXAYXVf4Dm9XN4BoFqnWurUnw+9FX2wMQZf2p3jz7c93jM7@vger.kernel.org
X-Gm-Message-State: AOJu0YzPyUidzlAYzW/Spy2BXnk4HuMtUETNAd9C3j/UCpq9x6sqGvsm
	3t1CJhbfz5DtT0qhZWqCpfB82up27iwHj2vwxdl6StE3ROSl08f36EfM4iipDUsEa83Y7PJqFtL
	COCrWUgpDLVPnsx2oiAk0NiAZiy6n3NRpVzlNufBtPg+T8lemCKUQzmjXVbiez9oEOCjl
X-Gm-Gg: ASbGncvLE6I56KrWo73+ACViiSt25r27h8UKLz0h0dnrRiursFODAHz1yUxzumkZhf7
	dvyJSENefdtfA8YuV3xJHzlw0B+VxwEgVvhRw5dXorkChLw0uqJtT+RbNivbQlKsHVoQji2S/3W
	cn60shbTm3Olko15+NmifWdi+25Qjt9bPoq65v6l8T6Lae7U8HMfbkyrHgdtkaJiHvDquNOcQNo
	s29r3zEkNZWpurn5eWqjMWId7EVUmnW0hyGUMxcEehzrox/d+epfYKes4NybJ2BD1K0zJnLLFfa
	Rvn/bzw7S8rRSGIkoAMHNhGt+xqL4eX9D9s6rf+pRtCMJduP4NUqJcc8enTEpjx0VQfysVBWaF3
	A6hHUKm0NqQ7G00MQO0L0m+KYbpacaGSetDTKbwz9jI+5oDi0mvmLrVrAjhrFmPXkWj+mPzgIpo
	2PmytosO/HSV0G
X-Received: by 2002:a05:622a:40f:b0:4e8:a269:ceab with SMTP id d75a77b69052e-4ed30d4ecfamr6635601cf.5.1761847275190;
        Thu, 30 Oct 2025 11:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBsOQjcOvRjMP4pTZJOPkX1Iw2AZufQNpkNP01OrVkZ+/BT71YfbXhtRUq9boF7rgtxSZZrQ==
X-Received: by 2002:a05:622a:40f:b0:4e8:a269:ceab with SMTP id d75a77b69052e-4ed30d4ecfamr6634351cf.5.1761847274420;
        Thu, 30 Oct 2025 11:01:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1614e1edsm3259121fa.22.2025.10.30.11.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:01:13 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:01:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <mlhohop2uifsdo3qxxzmuxbkjo735hdw6xcosvkmsx4eskfufz@5otklefey5k7>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
 <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0OCBTYWx0ZWRfXy0AbfzMGNzaP
 OXe1nLObLaM0o/bt3fwEPQwe/J/iNbt7mFOSd7tgc5hlZxRNAuYx8KoRZsNDULpytgrqC1f6Czj
 piYxi+srgKahYKhyAPPNUKJA9EPjVvFapxhLFHizLxtsWqOeEC1HQOUstjVoRRLKfwkpSuaoFlC
 yBFLO4BQwGp/yMTero9B2yJsEGdaes5Ycw8hIcs+HNBmAu62zKSZRAfSPZ7Zt2Wc1sSZ0KTAuRN
 ewhuy5XEePlSlGRRQUYU4gNy6meSgFtg123mtu2WkorylIcznu/8D6cCL3lSC+14L/eDjZAIHvP
 Js7IbaH/Jv8dkv8qZ7nAXz+xvFtdAqjXzJJlQITM1uDBpspz/uXLcga3iS2KR5ImwUUB8OxZyuF
 u+Cjtkjj4wERw9xCyQjubacSBJebVw==
X-Proofpoint-GUID: xC7CUfxqRDAy_f8m7RlH_pr9-JIzRX36
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6903a7ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dW72lhU0GKDYo0j8srIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: xC7CUfxqRDAy_f8m7RlH_pr9-JIzRX36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300148

On Wed, Oct 29, 2025 at 11:19:36AM +0800, yuanjiey wrote:
> On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> > > On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> > > >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > > >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > > >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >>>>>
> > > >>>>> Add DSI PHY support for the Kaanapali platform.
> > > >>>>>
> > > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >>>>> ---
> > > >>>
> > > >>> [...]
> > > >>>
> > > >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> > > >>>>
> > > >>>> These two addresses are very strange. Would you care to explain? Other
> > > >>>> than that there is no difference from SM8750 entry.
> > > >>>
> > > >>> They're correct.
> > > >>> Although they correspond to DSI_0 and DSI_2..
> > > >>>
> > > >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > > >>> new features. Please provide some more context and how that impacts
> > > >>> the hw description.
> > > >>
> > > >> Thanks for your reminder.
> > > >>
> > > >> Correct here:
> > > >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> > > >>
> > > >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> > > >> just some register address change.
> > > > 
> > > > Addition of DSI2 is a meaningful change, which needs to be handled both
> > > > in the core and in the DSI / DSI PHY drivers.
> > > 
> > > DSI2 was introduced in 8750 already, but it was done without any
> > > fanfare..
> > > 
> > > I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> > > and an output to DSI0_PHY (same thing on kaanapali - meaning this
> > > patch is potentially wrong and should ref DSI1_PHY instead?)
> > 
> Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
> addition of DSI2\DSI2_PHY compared to SM8650.
> 
> look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},

I see DSI0, DSI1, DSI2, but DSI0_PHY and DSI1_PHY.

-- 
With best wishes
Dmitry

