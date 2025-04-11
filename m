Return-Path: <linux-arm-msm+bounces-53984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF5A85A6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 422718C1E49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2525B221274;
	Fri, 11 Apr 2025 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bImzi9je"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E809278E63
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368615; cv=none; b=CAu83mowsvg+HeVO9R3kPO2+GsHdVXgCfM5MsyqAo3FXkxsiVZo6E1imZ7BuAMRVrEpOXoeQKHTRf/WyfnSQ/+EmfXgF3FjQzarGzo+ETKd6BRAA/qP0MTocVIpfcOHAuLefN+M0QdoOgHCLbMWJ8ndlCVnieybZhlRx7agezSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368615; c=relaxed/simple;
	bh=lSCdES3Wegn2px6sBYIOT1QpjTAuEGimv1iDsjuQuXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjaETqW74tic5JfpPINfXFC5mlAvbdWpyD7Jv0VwcCjR4qBcY5M0MZPC54YoFxIH84caB+0DBmIlhpbqY/UZUnGnnVl1VQ6lol2IttSj8iMWSOq0jPYpSJvV0ZVdjlnnzEgONWrSmCH5sefUisW5IS1CqiANS6hCQMvkQUS5ASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bImzi9je; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5i5dw018638
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 10:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C97yfs8Wv2cDcw2jhs5lGZau
	Urf5iXgcz88ISp/clXI=; b=bImzi9jeqU4XRcJUar4+UAKMea3Bcl+eE/FvD+KV
	r7qDUPKpU8A86zZjmCGdb6Xq721PoHlqB3zss95FQmOKxfGBhYvZ1XpJJ0klzNpR
	vKMVi/rmR0YLx1DZpd5YxQ74el+itp8MprAZlQYRptAXXRK78U/bPVRNr78CIcWi
	mUjGnunaZ8FSVgcMzPZzDMmBZ0p2qSyCz4yAspIktlx76ub7mDKeIbprc9EPlh5F
	nYPqM3R0a+zeaRGp0ZdXfo5jqDQEN/vZSJX1RRkFVvpUA36R5ylEM+7saCdlk5sT
	Fqagh7eVBcVXky8k0ZRij7Gq2f3RvJj3S8+PbGezaJTOAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgt9un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 10:50:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e703so321704885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 03:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368611; x=1744973411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C97yfs8Wv2cDcw2jhs5lGZauUrf5iXgcz88ISp/clXI=;
        b=IU3UcoZg81MltySDMIrIZhNBXfaPftgZ1U7JOaNgEuHpvqGctObFQuce6KtFY1M8Ue
         sEagTvtakVwSYEVZyH86bp+4xAUyLI3xU0EbagplGD4lYkRTVIgfs0MkWAVC8sa8fcU5
         UoXefwtlq2OuswI8i9ExA6UXK/jgHwXDGk6phZNLCTQUxeMlDCEl1hlzJmQzX2acuRNC
         xTFvxbw6H6DRpsn0v1dzGuoBsxWMfkNXlMM1m4YWXmhksXPUepaaf+gLevE6wC63qdUU
         6vQMijoxW0mRLzbe5DLJ6LWDPbqZIzw7EUMm5GgpdPMkFi6uOZcoLfQpUHc3+9pX/Zq9
         ODcw==
X-Forwarded-Encrypted: i=1; AJvYcCUPsItrzIAUrOg28cHlM9Eh3pz+Hxa46cYcUC4FQVUVCpQFsB9O06gpTRXyfeXxWYqWjpySwAbM43mIQyp/@vger.kernel.org
X-Gm-Message-State: AOJu0YxOqCBRcRdZEQwic/Wkre5B/XXW94QKsOlX25rE6L7woDuX7oCU
	YEz8nLl94sU07gwcWx/m2FJqZJvG4wFjUpwcgcNB5B/pz5tj8/Cg9nXqjghjrR1U5mXzTiwTA12
	PUkGw1/eUIkSQbICNvVz5qINd99mt78HQvov5XyBCzFLcWoCQB5WLRiOJ0p54Hof0
X-Gm-Gg: ASbGnctVrxthuy+ghqusWuYdLC80ITMIO15IiFPej0lKtqI+qTYP5DxCapAhoArkmsr
	Vs2dItYIcyTBhoRJSEBlaiLXQxfHpHhzeqoQDXkNXjd4V9XayoWFz74R2jATT8pO6/Kt9wjjE0K
	6GEPmg63xJGj2YX4dE08oDIfO7k92dyDCpG8KM2CPE3wx2GJ4gM1HCMQU89yNhDniNKokaoiDF+
	vthwsg6QVHCZKqzQEK7XclYe0vh31SalOShXuqyr/fD+o09jGUhycK/NcXxMCmWKNyr4NJQVmoC
	MHaVLi3YJZVYMwtB0Iwv/g1N+UPLQ2g6fZz84C9yvqhUsfjYHi+IctTT8y+Z5Fdvj/cPw4byUIk
	=
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7c7af118d54mr322641085a.11.1744368611151;
        Fri, 11 Apr 2025 03:50:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwuTv7stLnK+XR3ItFXzEehhs3MrRks/jgeNMsXwGYVinCOPI7c7U5rRfwv5bn3sWzVW7hog==
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7c7af118d54mr322638185a.11.1744368610673;
        Fri, 11 Apr 2025 03:50:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2369c8sm398622e87.59.2025.04.11.03.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:50:09 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:50:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
Message-ID: <sgjporlde6bgcp2mhr3r5c6wj3a3u37s5nlrrokbutsyizixod@7shpt55muqki>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
 <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
 <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f8f3e4 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pm7WE2fj5uaCs4OQ7f8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KvtavyTkeUlR6rYPEMuqEGDlh8PedG-1
X-Proofpoint-GUID: KvtavyTkeUlR6rYPEMuqEGDlh8PedG-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=776 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110068

On Fri, Apr 11, 2025 at 12:03:03PM +0200, Konrad Dybcio wrote:
> On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
> > On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> >>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> >>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
> >>>>> SMEM allows the OS to retrieve information about the DDR memory.
> >>>>> Among that information, is a semi-magic value called 'HBB', or Highest
> >>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>>>
> >>>>> This series introduces an API to retrieve that value, uses it in the
> >>>>> aforementioned programming sequences and exposes available DDR
> >>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>>>> information can be exposed in the future, as needed.
> >>>>
> >>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> >>>>
> >>>> - SM6115, SM6350, SM6375 (13 vs 14)
> >>
> >> SM6350 has INFO_V3
> >> SM6375 has INFO_V3_WITH_14_FREQS
> > 
> > I'm not completely sure what you mean here. I pointed out that these
> > platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
> > a6xx_gpu.c.
> > In some cases (a610/SM6115 and a619/SM6350) that was intentional to
> > fix screen corruption issues. I don't remember if it was the case for
> > QCM2290 or not.
> 
> As I said below, I couldn't get a good answer yet, as the magic value
> is not provided explicitly and I'll hopefully be able to derive it from
> the available data

I see...
Is this data even supposed to be poked into? The foo_WITH_bar types
doesn't sound like a very stable API.

> 
> Konrad
> 
> > 
> >>
> >>>> - SC8180X (15 vs 16)
> >>
> >> So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
> >> the HBB value.. Need to add some more sanity checks there.
> >>
> >> Maybe I can think up some fallback logic based on the DDR type reported.
> >>
> >>>> - QCM2290 (14 vs 15)
> >>
> >> I don't have one on hand, could you please give it a go on your RB1?
> >> I would assume both it and SM6115 also provide v3 though..
> >>
> >> Konrad
> > 
> > 
> > 

-- 
With best wishes
Dmitry

