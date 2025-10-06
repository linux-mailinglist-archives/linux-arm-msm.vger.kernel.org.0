Return-Path: <linux-arm-msm+bounces-76041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 57804BBDA89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CE8D134A2B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B066C223DF6;
	Mon,  6 Oct 2025 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcJpPpZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E5A1CF96
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745908; cv=none; b=ECBztLYebOus5KdHvaLcmpi2aXXakj5F1ZM2q+2r5RL7JXR81O2jbogwku8Dv1MCUgFuZ6pw6955XmTnjVJxkzmMuL33DAGJbfS4keGgeCdkza32JBKZ5vFTA6hi16l+DQ943ofpu/zEln1T5LyoGs137GOHgzgS89NbZT/+w6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745908; c=relaxed/simple;
	bh=d5eXb6lvQ5BPtJftMmRRWMO4aqAPpK77UXRhYmq5vMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaZNo4NM8ukfAdOjBHAsbqcjzEJZpYi0t8VSnUu9C1/vYB2NpGV9HtVoV9GvpRgOfjgjAPMWFzsEqP+mBVshTNOPnyK32DPMaPT/exCktKLwMkvyPWUb3lcmTUjbX7NczVK4joySy7ZkHxEi8G1yP2jrSDJKEAOf2x8r7t8BTtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcJpPpZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NSPGI026163
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uc2L32NXK+EBn6a//9GP8zev
	u7t9yB9CW2ziKFOncAI=; b=gcJpPpZVx4uypTLvEeRIYt+J1rRlmon3vAFUzj0b
	LxLbnV1fL8kwFq+rNvpLwaWDarugpkFOUk48hbNtXAJ6jZIFj1SfvcPbaVBUHc3N
	nA5dOCG+Oaop/VblIf3/yY7AOBBLA+c3mw4SZc58LhBOJFtvK9KzllT12UKFXZAB
	ex97qbOlapSvHMz0AVb63ZVR06HRtAIGAyR27uWc8ZHWRAfzzE1nRRUSp/BFTM6H
	ldIygwnAb2LWrr2Ox6RK659fQCcT1f6moRzMbzOi5jXIQo/rBZlPk47i6OmLViDV
	62YMpba1SK8HfWCSyYiHh8+s/oHrhirnXz6Y30C7XTbmEw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfjpqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:18:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e002f413e4so45410741cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745905; x=1760350705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc2L32NXK+EBn6a//9GP8zevu7t9yB9CW2ziKFOncAI=;
        b=hA/5q642oi0FWzfJK1ZRPlhaVcuqMIKGhHgoCBD0pxB/tLB1TXi4si27xpVv2HyfMs
         a4eRwEetjMed8wcIfy+wZTQ9z2or5vBtuNl85tddhLDHF2vk8yE7nRVYM79d2M98qiMg
         QsTpPnZwrR84JfXAjCcBKo/hQFQ+kVJN5udQMwYRJV6+lxfHz+dkBOmQ1sCKVxldAQl3
         kt4owturlNgKpQYpQ88E6ypd62uCyVVYuCAWPci9BRisdhnLhJZBdd5nr5k95xWERsw3
         wZDxJu2en7gjkVv2p8G4wif4WKEQHeyFvobIJA9NzKsTaU25gJrla8U+6XnA77+sNexw
         9bfw==
X-Forwarded-Encrypted: i=1; AJvYcCV4jF2E//3oDUcF8p3/QW0/zKdSouMiFLDvpOzGDT8R48F4lh1EXYqqgNYIKetrBu+8Cqhnpg0C1AGBemfe@vger.kernel.org
X-Gm-Message-State: AOJu0YzkkRgj69A/Os2LluPWFr+mqb5HJUhxlTCuupqbgT1mfkbANbZl
	CwbOA2F3pw2AySQZzfztNX8K2hZi4xAa8LLhzXZJ30wbRXZL7IuTXalKsFtCd9hUCM2FEtvj6Ai
	vFG30rh+M31TfUXlAYo62RGaMDxMGUHzgtQRWA4hBUPaRxLFkdJCoW63siNSGitQU1JYx
X-Gm-Gg: ASbGncvofYZkCTWdWHLMR1O77WGiCWW3hPjzTJHfc1aFwp7BhuH72ksRmPyaGs8yDyh
	9bLjj4IwB9OTVptqN7qqj8PmVr0TdFUJNHPscJLY5OfSXQGNNd772pOG5KqUVhkQ1Hjv990sotP
	GzmQb2pdrlzhfZeExfQ2LJB/gcMKpywA9hlqCMwL/il3V09YttdjjPu2WDQn2EOD3+8AM7l0pa9
	JsmA+HGe9g9LIiC2ccE5AqbF1scdJL3EDc9A8t3Nwa+SiPQ0rkt7hb+A0NeNXcYVqgGqz1IuXMp
	Pv9O3DjqolXlWW7w6um1nCEK3e4Mx13nD2VYx2c2MA9amml7C65iNo2p/lRS4TM03GwFZZ620Lo
	lt1pdrrQ0Is3yXsoCiOdTC+Gy5/04QznzO5Ql8fLBFhUyCDEUEvDt5AdKbQ==
X-Received: by 2002:a05:622a:411b:b0:4b3:17dd:7766 with SMTP id d75a77b69052e-4e576ad9e6bmr121033241cf.43.1759745905007;
        Mon, 06 Oct 2025 03:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6fc+qZuQi2Tm0xx+Z8hR3Cr0NBSA31twPpqJapGf0AGVIk4uQ93BuC9exPMrDmlUuhcoDAw==
X-Received: by 2002:a05:622a:411b:b0:4b3:17dd:7766 with SMTP id d75a77b69052e-4e576ad9e6bmr121033041cf.43.1759745904408;
        Mon, 06 Oct 2025 03:18:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113fdc0sm4912578e87.54.2025.10.06.03.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:18:23 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Message-ID: <blrugv2y4hvgcswbnyk3s6cpv3pfuyyxduoulxqnf24qnykosy@ra265lwayjix>
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <OyMR2y907eHs6rnnO6bzy52LY_t8KXKscM-nTPu48x3NCYFU4mza-uz0HqnQlYqPg2JtDB8AhCtGAa26Cbq4PA==@protonmail.internalid>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <27e36fdb-3107-4e7b-b402-fd72ea5c4d61@kernel.org>
 <mL8al4KIcE6PTrBxdJa_2UyBCdazqiqrW-cNH0h4hU0lxL9e1BBoPQwqSqafI_KMAHfhK014iRoKVkQmrds0dw==@protonmail.internalid>
 <5e7f20ee-7960-4a1b-bbf2-b5f5330e1527@linaro.org>
 <d603c0d3-4dd5-4ea0-8a31-47e6dd03ffd7@kernel.org>
 <66d3b851-5b29-ca88-53de-a4126c2b5366@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66d3b851-5b29-ca88-53de-a4126c2b5366@oss.qualcomm.com>
X-Proofpoint-GUID: X4KjEZeutupdo8oYor2oqMscO-xMPnKl
X-Proofpoint-ORIG-GUID: X4KjEZeutupdo8oYor2oqMscO-xMPnKl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX+a9LiSRu0gq8
 7XlXrg0rUO5T+XryZZxZ7HJy8UoErpU8igiRcHM36iCxdmHQFYyySKVoINFvi6L1JhCEzcPNpav
 /myDeu5XnJA8k3d1xuFcoPlxCnie6FQ0Ss63iGYmOquAzsOFvdaQGEfIkoNpQnOTBdbWJt8cxGr
 goeVYuCZS0tzEiWvxnF1koMCyryQLhyfYdibITg+/NiA74uU4myQZ/3LsqdKPCh/MifQZt37CxQ
 BJxi4M9n+af33Bu7/UMbYYf5o+M4IReU+kTzeqDCj3X18QjkybxrFBvV1L2RTdYNPjW7fiQMV3e
 XbGORP0jSBYLFjGTeUC3vF/OgG+ZyUJ1ysvUg0/FNaHttOmKa5ECfXKKWtY53drfA4dMcPaweby
 kBAeWtzypGiudeDpCS0Pdlr2p7BWvA==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e39772 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Pcl2lPME8pu7ACZwHE0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135

On Mon, Oct 06, 2025 at 11:51:19AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 10/1/2025 8:34 PM, Bryan O'Donoghue wrote:
> > On 01/10/2025 09:36, Neil Armstrong wrote:
> >> On 9/24/25 15:28, Bryan O'Donoghue wrote:
> >>> On 19/09/2025 16:47, Dikshita Agarwal wrote:
> >>>> Introduce handling for the QC08C format in the decoder.
> >>>> Update format checks and configuration to enable decoding of QC08C
> >>>> streams.
> >>>
> >>> Since QC08C is a Qualcomm specific pixel format, you should detail in
> >>> your commit log exactly what the packing/ordering of pixels is.
> >>>
> >>> In other words tell the reader more about QC08C.
> >>
> >> This has been upstreamed 3y ago for venus, which is the same as iris:
> >> https://lore.kernel.org/all/20220117155559.234026-1-stanimir.varbanov@linaro.org/
> >>
> >> No need to re-explain it for iris, the format is the same.
> >>
> >> Neil
> > Yeah no, at a minimum the explanation of NV12 + UBWC should appear in the
> > commit log for this format.
> 
> Please see [1] in case it was missed

Just mentioning that QC08C is NV12 with UBWC compression wouldn't harm
and it would make everybody's life easier.

> 
> [1]:
> https://lore.kernel.org/linux-media/10bb819d-105b-5471-b3a6-774fce134eb6@oss.qualcomm.com/
> 
> Thanks,
> Dikshita
> > 
> > thx
> > ---
> > bod

-- 
With best wishes
Dmitry

