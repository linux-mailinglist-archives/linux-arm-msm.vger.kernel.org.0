Return-Path: <linux-arm-msm+bounces-59100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AC0AC13BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1996A40383
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035C81E5B9B;
	Thu, 22 May 2025 18:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDQoB3fz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B4A1DF970
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940035; cv=none; b=VgQDPY49G4pbdVirStoCVCsA5aXPn4/V2a+QZhKzXhwz43K6gphBHrk8zTQrXFV/Um/eRus1bnSHr+z5pSzFRZ4AZ0jvb5Wr9w3Q0KkZgPPZB0jXkovXmEmQbR5Jwdrt8lFZXHCnydDiYU8YIRQbX9QWBmoClABYHztUWUsPyCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940035; c=relaxed/simple;
	bh=eYya6Ysm6706oteolQvgGbReYAwEkBwhBMbUN2oC4ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8z/Poa2aeN2Hn3qeoc3aVVIMgwSTi0mjT7uCqH9BPbTd9YBRpkoeeJMBbXQ9aB1wDjQP3wsS4tDiWsh9Ev1yJcGRXJCEyObm9H5OeZnAMy9L1svn9DgwtyHEdMKDtv2Ci6dWPGZV9Lt43YZ11RxDOQn6KOo1FaxmolhFeSUVzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDQoB3fz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGwOts000896
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=38zWe9upC0kBIerry3BI5xcS
	uLu49jVZpKxNE+7H2Gc=; b=gDQoB3fzYeck8hySEXpuPXHZAMvgvA7riLL1hXWs
	/IPFZOsLRBkF9HGzDOnFOitNGNkq1yG2phnD4IqmUfQATu6X4zu8NmavV9rPSIND
	30B1r4eyrVmtOEDFZK51yrEpzYrov14I2MolkbbwnkgRr9Fvz8aPeWwpZi4+o8NP
	pPs/idv2pRqQU3XUEN9chari3H+/5RM1cHoObLaMM4WbDNYRluqVwJA+G9feSUcQ
	EaL4G32kOKFW+770fK3/M6P4etVho4n/yJCAmdM+YMKG8RmRMY3gBOcWNpUKPG8R
	JmXCzKWg9uNTVyDMBAhRUB70eUdLHd1AKBCJ1EeTTgidWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tnshm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:53:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so1981287185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 11:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940032; x=1748544832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38zWe9upC0kBIerry3BI5xcSuLu49jVZpKxNE+7H2Gc=;
        b=Xoe9XWzHbUdXiNSM1IoZaOuCl8FTAjnYYTI0PAbkaY5tAI25q6hGk7B1IfhE69/V/U
         HfCQRWXQ05yIo1TTvpNo2L6pGZmg/zO07h2hM8kGn4ZrMiLOLWwhikN/wE+1hok6tx6T
         1NGTbcLJiNMa8n3fgS5K4XbJRVWAF4iIKiW1jMKTyOX2ieu1UcNn0nR1uAejdTNoY/pK
         xn7J1FJbQwvMaei3F5yTVc7D+uzRzpR6ofOoohjZ5guZviNNMNzMtGosyZWu+5k6UOEe
         4vmJGdt+RBE4TC/bhkPdicWJt+DfUlqEiKsqzJFiYMsVX5zPsVeVwSU3iXdS77wwKt8e
         y7Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWM8iDY5hmtQLsuMgugA9EyJ2FB1yEhyxpYKvlowd8vXGRzvx2yHMjXfG3YzDPLtj1z3v70M7ukA39Rw0Ol@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVhWrnKcRzft4L1LWLuOiu3sig6FYMAYl4kzCohP8LLWR1PP5
	MKth/K7ie0n4JbqfwgWM5WfFBQDGdHSJ+TBarGx0XwS29FFrHZExzvy0rV6LzWymDAUnzahC8ZG
	FBYPqkugK6vMQtKVmI2/1jDKXBz+YdclondsQBOoTiLFpzmypIfngjGdPll5ArlUCxtjL
X-Gm-Gg: ASbGncvVpiRNtfa6Y9OvpHlI/+i2RPLfvBX1z4VrBaTR2NAb1L7067onqQF8wsigXfo
	HpTQepAmeiXcs9K9yrZEJ/7ut5B2GtiXV87P6dR+q08IRFOHZkummzPHkktw1gKN0MsDvSPw+zI
	J3amVeBIWQyuvvMNOZS8vU1iyRm5jM5zoeHLD8QmOHoWmstawKBfvLly8IrbFnYQVHoRYOSnHCU
	XDNpgaSZfYw23ICabdbfA+2fyisWOEotcr1TYOCQ3Upt+xL+CQA24f1lMdTaN944Ic5+h0ee0CG
	3PrXSDSP6RSp73qceg2tw1i/b6fw029/ryk/LiykT/4DLKAA/HtlYf+4tg+elVqzksw0etw0cEg
	=
X-Received: by 2002:a05:620a:25d4:b0:7c5:562d:ccfa with SMTP id af79cd13be357-7cd47facb7dmr4080953985a.36.1747940032043;
        Thu, 22 May 2025 11:53:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2WfwBOxC54aOuWPMmC2+V1YOrtw5z5DzwfXMuy+nfcNwlEf/jKVEhD0ub9XPNyNJJ11nUSQ==
X-Received: by 2002:a05:620a:25d4:b0:7c5:562d:ccfa with SMTP id af79cd13be357-7cd47facb7dmr4080949185a.36.1747940031641;
        Thu, 22 May 2025 11:53:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f351a6sm3508823e87.88.2025.05.22.11.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:53:50 -0700 (PDT)
Date: Thu, 22 May 2025 21:53:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Message-ID: <uetcrmujwpv5jzaov667z7u267oyn7wqpz2i5etxjk672c47nq@wtddlcqubysi>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
 <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
 <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
 <e2173a8f-db10-4fd3-8bdb-ea5e6664237e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2173a8f-db10-4fd3-8bdb-ea5e6664237e@linaro.org>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f72c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Aotn53-9w846ZEucy3YA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: w5XLt7EKxoktEO2AXMonr_v80DSjSERc
X-Proofpoint-GUID: w5XLt7EKxoktEO2AXMonr_v80DSjSERc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX0NK0rKFxd4Y1
 aWFOVtntSOEp7E2faBdH3iczhra+HaCQZ/EyXuQSx5f/s7AKmd0btj/SZhEjdADhqlezvtNfYL0
 +er4ZCBeM6V96mVHskxz+O5SjR66OXBBOPxNPdavp/1xncUgbs3fXIx2dMIRL1xLnJ4bJBqmRR9
 0kHR+zM2Dey+Isn8RZbkowqaRLK61QHnkEcGvEbeXt0o5cpcfSyq1yCL+18MM/udIN1wX0ksLQp
 Fem9aqJUvApPTYxXrCOG7BPU3thk+e+/YmkVeE2wr5eHRXN01odID5gIOJi4/snY+gzE83gbn5H
 75BLy+AaQs2sbITFeqLsDRUR860lfjX46WC3AA3juTF+tZxi3zAVF+1asGcUT/70tqA2EMdf7rp
 UPdEBA0aNngEK9Jm9Z6hSP0OfgrI0lSMZdQ3ZgiN1cScqy7LKgkfU4Oqp5FZ++oKvY8/tNxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191

On Wed, May 21, 2025 at 02:51:22PM +0200, Neil Armstrong wrote:
> On 20/05/2025 23:29, Dmitry Baryshkov wrote:
> > On Tue, May 20, 2025 at 09:57:38AM +0200, neil.armstrong@linaro.org wrote:
> > > On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > Continue migration to the MDSS-revision based checks and replace
> > > > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> > > >    17 files changed, 6 insertions(+), 57 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > > index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > > @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> > > >    	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> > > >    	/* setup which pp blk will connect to this intf */
> > > > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > > > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> > > 
> > > Why did you drop the version test here ?
> > 
> > bind_pingpong_blk is only available since DPU 5.x, the same set of
> > hardware as the DPU having DPU_CTL_ACTIVE_CFG.
> > 
> 
> I think it deserves a comment in the code or the commit msg.

Ack

-- 
With best wishes
Dmitry

