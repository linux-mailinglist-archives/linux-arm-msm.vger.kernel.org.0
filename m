Return-Path: <linux-arm-msm+bounces-79779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBFFC22FFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52C7E188EF43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 02:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A5E27AC54;
	Fri, 31 Oct 2025 02:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cz5Qr348";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNDWd8GM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8CB27990D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877709; cv=none; b=H3wCfc1enyM65NTmHRsWQEm1nh3pz/xx2PpTPl0c1fobLXnG2oKce3XWM3b6BeggZ7T8ocArdMcn+1JV0cP2adSwm+YDLmiJoVD2cLVkPZ2tU3Y48ozVqf2FeK9onohJR37RqDuSUNZw/O0FT4HF+SZUh3DvJIdi/oW9Dk78QPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877709; c=relaxed/simple;
	bh=CuaF5L1tdB/qYWKKmujtScry62s93iL0NahmOm5Dl5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqKJqEjKQ+BDsC26Z4KvX5Dvwfnhl3TCG+ohLBqO43JIl2TRhHOzXd9lnDyp5B2l63duPio/bFiIzvKZVdEHgLNG/Dof8dhnbSc+tc8K2YhjUOxHqdz1vWEXrriubm2pzGxBgcPJ7mDQ48H41Ezgnep0x54lEJsMq4CM/pwYNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cz5Qr348; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNDWd8GM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UIOX9A3117240
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mygVM9j4kzb1+d6IfzSVkBIT
	dt7PzesZDBTeq/ZmytY=; b=Cz5Qr348CmuqAsqhgi/Yegi14vGxTJGQcvS7IfQB
	Hd4kOOTNW6ElOOv1F4iWmToN76k+trMWwZ50pJnHLaw5909zjN3C+jogxU6arsCd
	L7wvpsSd+InjEHyZpfWpxK6gq2rIAcqesLngWjxW14beSU0Dt4oTbiQ8K4luXrc+
	YdBbacjKqk5zBbHMm7IiYTmrSZ6KiCRyMUSG9rBCY/sIbw2xBl+6hZoyFRwmR7pX
	sgl/zkiVtiPi2ayh+vQm8ogPhtDqKYfRAKyly5Rilj8W1jYmALd5o/21I3DdYpYi
	OgScHBHjzTWfUzPFQcZg+6fALLJe+xEqDreHnMBRjb0JgA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45frjjy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:28:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8a4ef35cc93so465069185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 19:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761877706; x=1762482506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mygVM9j4kzb1+d6IfzSVkBITdt7PzesZDBTeq/ZmytY=;
        b=MNDWd8GMFoED5IHqz4UoUmrb0CraXyfW1GTEU47Xah3W2RrfN6zi1gC9wJxEvVzRU2
         II+SPUoeWirzeyCRgzPA9OI8FPaIEhvV7C2RTuIHRyXPz9YDo+3i32D3h0jx24DlTTmb
         u/OOGDUvwgGfZuz4KVdSPM6bLaM1LMi/eya4k+yHNBgAs2eFXHb5yijGi+dqbLFZkrit
         9xvoFAA/fW5uoMiNbddGBNJZvrq0GKGlevRwkURxtdOWas07HoaGeqi1xfBcZfAUAtfx
         mJpbW3nhG3zn6LDLEh2K06wD4bACMGZa2xtDHvkO5yGvoif7EBxwWKk+n+msQZCwRdLY
         QG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761877706; x=1762482506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mygVM9j4kzb1+d6IfzSVkBITdt7PzesZDBTeq/ZmytY=;
        b=YR9c76d3/z+pe31C4245691gn/UYksxgaDMDG7ZYZ3AtDQuA9qfS2xqJ3bc0diUj0z
         gUlJoP+E9bXUhlngU5/OOJQK8FSwWxvkxgGx344K/SNjIrH+re6ixlEyKXm1lU9d2fDb
         XlIUBSRn5oH87uOQcyt36c684L4M5zZAgnkyOLl2X74arRH9ALNpM2wlbHG1zCdkOWfu
         LiMFocbdZfWkAi7sZEnNOinRhZcO+Lcw2K6skSoigimOmQ4bA/dd1ltXH63kEuBhZyMl
         EST7VoJRhv2q6Z7yegehPTaYIvMUxD9YPgC78V9xLQ9iziP/nyO5Ra8uBmF/G+hVymBM
         wnyg==
X-Forwarded-Encrypted: i=1; AJvYcCXgIW9nhb79aQayGwqvlWnf5LnlsVHKVWclChZMk1V0uS0+zGn8POA/LR/dZXz21MsUXwq0nGXnpBCfkyui@vger.kernel.org
X-Gm-Message-State: AOJu0YxhJr/JkSQI4Ft9Wc9TSceS2wclVTIfV+jkkAcdYA7cd8Sthoro
	MZ+fSRt1OtPx6XwRNiHZRtrlNZ/6XbYrB9j4tgWky/nmb8r9bsqDau7aK7DzpqNlaO7g87kjBz4
	S0SqYL0UFVd4kjGBk8T6k0yuTp0KkuCUm31Onj35hsIScGP93CMDQzQ7WmQB9pgPX9TcY
X-Gm-Gg: ASbGncvhsb2bRQZzOGVsupEU3Cosmi1p+hItzsmTbVjE7F2u3QpC0CKtRfxLoYW0BwM
	yC4zUdKHgbLOYEeFmKIFbPyF09JXdtSTy99s/H+YQ8NlQLzrqTsXiBVkVSusVwXD/9Pxi7+t5p1
	XL/Ph2zeukp5k7Q+m5kECslSU2KTT9KeFoyFWfSeu839I4EHAxg4zoOuG48HwM9giUYlaR1HAsy
	46EYdFebMsC+fN6v1BzkSCce1Ui01isUb+TwRzi68Ne0Vofy1pfjs4fNKVxwQUVyPjSiYcAFAPm
	8pGtjxWxPMdYzFTYTi1iC+BKrNHmrCDIS6KLMIUVSsAKBKzRBWXa1cY/kG7iq69LFCgeninJ9Vb
	9+hsJTz0xFarDwz7DQbNeB/PAdFe1Od8z0yV5evjaCdE1ff3Z3uUcvRNToC8k
X-Received: by 2002:a05:620a:28cc:b0:89a:2f9b:10d3 with SMTP id af79cd13be357-8ab98eba5a6mr237555185a.30.1761877705637;
        Thu, 30 Oct 2025 19:28:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr+5kD+JtS6mIytCdLqJ68RKUbehYh6oGlHnqbAxbfTUJ3LV9xtxz77D0wjhEnj/7Q+aRjjQ==
X-Received: by 2002:a05:620a:28cc:b0:89a:2f9b:10d3 with SMTP id af79cd13be357-8ab98eba5a6mr237551785a.30.1761877705158;
        Thu, 30 Oct 2025 19:28:25 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac0106e063sm25886285a.26.2025.10.30.19.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 19:28:24 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:28:12 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aQQevC/Jd76rTNSU@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
 <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
 <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
 <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
 <4e444fd3-b079-4e0c-9449-1c119e1d710a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e444fd3-b079-4e0c-9449-1c119e1d710a@kernel.org>
X-Authority-Analysis: v=2.4 cv=KupAGGWN c=1 sm=1 tr=0 ts=69041eca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=wiB8FAKGFwBon0ndxVIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: PN6SYs736zUE2MFQtiJsKeCyjBIlCoNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyMCBTYWx0ZWRfX//E1+QRP/XHG
 FJoGC3+A/u/M+Z940fW9FqNPhDjpOLdsNYGVWdhrHqnemumpqrib6Z+3W9KfppFN8/bILvgjocG
 D6NmWTWoaz2tnkRbyf6XACSgj8Y1+f4wgLdvXtwMI20+qZPxtjhGXO2oqLW2FSTmE5Hi3QEm3m7
 eFCePOPAaj2AIK+a9Mplg5/DhjhLWE3fL0W6SSkVMEPmR8HOb6yrbASSK9DTOkbsoAxkJPvXSrF
 zs6r+GVA9nHi5gBUFgO0WG2QdZ3pCtwi1WdcbRA8lCyMlJ0iqxB9Oq0UZcYhmAXr0JtGaC7RiJ+
 fvn6e1En496Ld+eEHwMzhw67++yyf5YlIEAtXYRBBYWd228QQIHkmzrDAfqkwELBaqgb3dFZTjG
 e/bvt5Dlrx7P6okhTDxmb155vzC2Fg==
X-Proofpoint-GUID: PN6SYs736zUE2MFQtiJsKeCyjBIlCoNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310020

On Thu, Oct 30, 2025 at 11:43:49AM +0100, Krzysztof Kozlowski wrote:
> On 30/10/2025 08:07, yuanjiey wrote:
> > On Thu, Oct 30, 2025 at 06:37:40AM +0100, Krzysztof Kozlowski wrote:
> >> On 30/10/2025 03:33, yuanjiey wrote:
> >>> On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 29/10/2025 03:37, yuanjiey wrote:
> >>>>> On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> >>>>>> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> >>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>>>
> >>>>>>> Build the NT37801 DSI panel driver as module.
> >>>>>>>
> >>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>>
> >>>>>> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> >>>>>> provided certificate of origin, then you provide certificate of origin
> >>>>>> and send it to list?
> >>>>>>
> >>>>>> Please correct.
> >>>>>
> >>>>> All the display patches were jointly developed by Yongxing and me.
> >>>>> So every patch 
> >>>>
> >>>>
> >>>> So two people were working on this absolutely trivial defconfig change?
> >>>> I have troubles believing this.
> >>> I want to say these patches I am first author and yongxing give me support, so
> >>> I think yongxing is second author.
> >>>
> >>> I want to express my gratitude for Yongxing's support in every patch, so I included
> >>> both our names in the sign-off for each one.
> >>>
> >>> However, if my intention causes any trouble for maintainer, I can remove Yongxing's
> >>> sign-off from this patch.
> >>
> >>
> >> Please read submitting patches to understand what Signed-off-by means.
> >> Otherwise I have doubts we can accept your patches - you simply do not
> >> understand what you are certifying.
> > Thanks for your tips, and I learn some tips from submitting patches: 
> > https://elixir.bootlin.com/linux/v6.18-rc3/source/Documentation/process/submitting-patches.rst#L524
> > 
> > I thinks below sign should be true, if you also think it true, I will use it in next patches.
> > 
> >  Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> How does co-developing match what you wrote "give me support"?
OK, I will fix sign, will keep sign below in next patch:

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Thanks,
Yuanjie
 
> >  Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >  Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> 
> 
> Best regards,
> Krzysztof

