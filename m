Return-Path: <linux-arm-msm+bounces-53975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A51A85899
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FE834E2F98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0616B2989A6;
	Fri, 11 Apr 2025 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxOlhV7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F4290BCB
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365483; cv=none; b=kKGkzHwITERJnsGUEPJZ+DhYSkDFaxJ6hgGl4fsm3x75y7+sKkfG8ddN5L8G3ILep28JYmQhZnKCR2EKtgMDil5CuV71EVZFlWbGuFeC4jLe89LZ18n/1uwYZBy7XsfUwXfDElYvK/3c/IBaIH8Kw/NsJxq6Kz2xape3L/AwJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365483; c=relaxed/simple;
	bh=zsVOdD84X8pt+vFPxaVoFyBPCoT4S8sULlbK26J4FGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvLiRaq/q1BzsFraK27JG/s1vGzvKrbHqHh6R53UT+4qycDPijeIsuCyUE04jG0rCrdH6EI6rgueiwyLdBUluop9cmY0B/grUQLF2CmLinNHh8QE4ihcm0VCIGLb5D+vIOfnaiJptGLnQ1dklUadN53fQX/oee2iJumFW3ZjJS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxOlhV7v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4s3xa018348
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k+idOG9XotOwye43x+aZtsKS
	o5apYGkMFeSNzvPXUCA=; b=hxOlhV7v6VeJG+N0YGvU0gjoBJF6Yn4aA71CxGUC
	GYcp9uaTYZ8g29UzU0rmK5BJD5j+vDiWoU2KJQ46ld+4CGyz7s+SZabxzo5R3wSi
	Ybv/BUA3LcQp9THEOZFRn3n3IPkjSHa5cSAkHy76P+LvG6kcHQGxPXU2Pgq8SdsP
	jczEm4Ovqw4/QP6hK6qoqFkgUWoahjNO4yrGpR8RoiQc9caWBFo6aQ+weEa4JQ/8
	W52HPqmzJp4os2as8dyTd1cMESCp51Z0MYBw4Gzw88QkuzRzj6Psk1EZFXXB8k4S
	bMvgexwmkHI3S9tQw2ot1G8+Dnv3u5Wvj+/WusbdwCXL1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtba3uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:58:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30364fc706fso1599818a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 02:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744365480; x=1744970280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+idOG9XotOwye43x+aZtsKSo5apYGkMFeSNzvPXUCA=;
        b=CIkUDSd+hpsuMh9eTBbk7RejOSJ351N9j3Z3r9a7bkVuxlk2a+mHt0tuTVQjT7OfL5
         u0DfUMyXcGevxbpQZ9zWbbtBw2vHNjaE7KSYz6tLK/yW1Ro5N24JYj7FhWucbSS6Bqam
         aoEz/jWkJs0YhfMeMTLDrEam+qMuYA7ck4yeiM30xrDtPsFJ2Jgh0op41/CyY5oFfbzj
         SwblY8Q5pSTLFPFOlfDcQCVGbuJNILv1+AfzhfR7bacArwA0x1z+8Vis7M1kne6o4xCy
         N/X150KifhVIPjoiAe61Iimd1ZQKy+zJDb9cSl07FE+kLpiNLhsEzuaiTVpc7H7KBUHV
         sfKA==
X-Forwarded-Encrypted: i=1; AJvYcCXNmYeF0arVxneDyzqLOKstv4VuRfMfEUDWEmXSI4mtnlz0P7OdxR2qgdC0KO++NsPYcOtIb7g/jDpXlJnS@vger.kernel.org
X-Gm-Message-State: AOJu0YwWYLlbGs8HXvPEXq8i+j1R1M+1Myj9vKzo8SfCtDoI4FCx+uoj
	sQu0mmI/oJCwW9eLG1AWnr0rhxxxlF14HJZ314hqg0h1Bi9j29w9z9ErZskurelC+92UuTz4nrw
	k/8Sq6qjcAkYECw9oGqGtWWvwyILQxbbc5V0X1D35BTCXy5EUWOzkFqN0PMZBd+Ppb4sSHFy4ZC
	Nl3/8JLDzOFO5DE07CU8zwEybIsvm3lRlLUKT33+0=
X-Gm-Gg: ASbGnctzgQ2GyznTEmtnjBvCiU3gzNd5lAAbUqxfPOuQbFRj4ec7fDNzQDHRErFBOfq
	VFhyEM4gcuGZG3KQqXprr4D/Z+A2zjtu/Bmm+/8yPyC8Z1wQJiwAgV/6ObRdTEG8SBGwM
X-Received: by 2002:a17:90b:6ce:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-30823670b3dmr4001690a91.12.1744365480543;
        Fri, 11 Apr 2025 02:58:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI1n5Z8D5yvjCWkAaXY4/KGC/DQqzFnZDGgKLa+mNp2DTPuSUov3tYEUj2t2409SXNjrimJVcrKkNOiyzN9oY=
X-Received: by 2002:a17:90b:6ce:b0:2fe:b470:dde4 with SMTP id
 98e67ed59e1d1-30823670b3dmr4001658a91.12.1744365480147; Fri, 11 Apr 2025
 02:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com> <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
In-Reply-To: <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:57:48 +0300
X-Gm-Features: ATxdqUEgh6uca37YjS4OleFpbDuXY0MPOwXUGWqzyIIRj2finACospEgxJL2mn0
Message-ID: <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: tydRpkq6VOQmtlh7CzlqDT3CgByCxQ2B
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f8e7a9 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=aDpUdPclnTHmp7_NnesA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: tydRpkq6VOQmtlh7CzlqDT3CgByCxQ2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=820 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110061

On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> > On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> >> On 09/04/2025 17:47, Konrad Dybcio wrote:
> >>> SMEM allows the OS to retrieve information about the DDR memory.
> >>> Among that information, is a semi-magic value called 'HBB', or Highest
> >>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>
> >>> This series introduces an API to retrieve that value, uses it in the
> >>> aforementioned programming sequences and exposes available DDR
> >>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>> information can be exposed in the future, as needed.
> >>
> >> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> >>
> >> - SM6115, SM6350, SM6375 (13 vs 14)
>
> SM6350 has INFO_V3
> SM6375 has INFO_V3_WITH_14_FREQS

I'm not completely sure what you mean here. I pointed out that these
platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
a6xx_gpu.c.
In some cases (a610/SM6115 and a619/SM6350) that was intentional to
fix screen corruption issues. I don't remember if it was the case for
QCM2290 or not.

>
> >> - SC8180X (15 vs 16)
>
> So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
> the HBB value.. Need to add some more sanity checks there.
>
> Maybe I can think up some fallback logic based on the DDR type reported.
>
> >> - QCM2290 (14 vs 15)
>
> I don't have one on hand, could you please give it a go on your RB1?
> I would assume both it and SM6115 also provide v3 though..
>
> Konrad



-- 
With best wishes
Dmitry

