Return-Path: <linux-arm-msm+bounces-57972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934AAAB75B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E82EC86120B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C098C28C009;
	Wed, 14 May 2025 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2JzJzOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729D28A71A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250390; cv=none; b=V5hnZVuwjdYjhlhElAutYY7li14dSjdgRSGPkoY+7Q0xJS2GiBpYm8npI2RWa4H9vmNNDSkCNNpJlAesq31IVDfxo7lCZUGoY/CGGGD53jCw+2kX+QbXJuGWYTDhMuGky1PpBMWUbkNF7Vpa6ynt4I0AGvxHBSoI6BUWd6GMD58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250390; c=relaxed/simple;
	bh=sAPWvpCc5paoP1rOvJ7l14yMheBzwGCOB5G1Qf7l0r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGmCA2GGUCEHCqqTe5cI3rRA7hkyTY17WC6OLeVGjBb5K8YDwcbph/aQExuS0hlt67I1IQLOCa3Gg6Pa6dLTn6Ytf8KO8oBpR8mL/Y+C8X5VaUGJbzuTs37/x/KpfLYJwz9Htz9n/+P4D7frzd/LkPkfAq4lIxicu+pxa0U4bVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2JzJzOo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuuj5015913
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NSHyr8CcfGxZ2/FMsoq0HRY8
	55iH+a0Kisr19P6Fk6o=; b=O2JzJzOom8ocJ+7zhyoyrp+ANFuZtweFf1QHwsm9
	s43qAt7RUPh5WzsAYicfRiDv+ScXNLROALmmt1Dky1/hbzKNTavqgljFAaeTepX4
	sicANhLzlDIg4rU2uXDw41AL8ph3feHUOTbuoI3m40yKjeTf39buXBIaEBzJA+QD
	4b82H7fBiGJS2PCswYk5YrjwP6qBsG1jOqSdCxlHI4BKuwbRjfA69jNpSshMkDTf
	sMEAG/mh6lxgS2YbvGUqynmACdz+nyik2Xly9AMpZOhgPMYWDb/zyWh+LZ/9vs+Y
	jcANfVY3pv/ZLdKme+ZxikYazpyTh8S+LSyrPO16Ml06og==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmux4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:19:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so17338085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250387; x=1747855187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSHyr8CcfGxZ2/FMsoq0HRY855iH+a0Kisr19P6Fk6o=;
        b=umg/y6vX4bXTeJWPfEwJMw70AjK3+jEUpWVwVrhOa1Rwobvuf485Jh2spKd4VMV5cB
         puXccC7IoxFNlz5p5ivZpZytIzkhSPSOJCXGApNCbWYk+N6PwX7eAFUM0ZJ7FfkNPM29
         qhShd0kkVRup6HpMLti3dwWpTZRMN7kD4651uWA2B2oGNMuzEI1Skj6U+V6U6v5k6XmK
         QvCekVY3W3y8cmaKCLXw0napG4AAL1fhPsWtZQAcWCbi5vY76JHdn/CKoh+iF5psMeiA
         yocw6tVHP90gNI4XlwrlTV6RCLtQjTSeR/jHTAAqrcaAHJV+eMStdJ9pksrBCypeK5FG
         oLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Xc96YA9bJJxNKA1HPXu2WMfdwaTx17nMMDktuTnsTIEWTHlAiHmu2xFcY+9zMmxI/XeCGJ3+Y6UG9na4@vger.kernel.org
X-Gm-Message-State: AOJu0YyqAkRl8vPWQWUQNWpkdKTQwKzFXW/RLYKBtUgs/8K11frb2KeM
	KPW9B4EEk4xKlBYKXJNNktHBSEA4v1x8BLGviWObDvDozNme9tB41ovPoSwSDKfGQvIK/MiK9ab
	5gkEMDzTKudKr3cGs8DFtFRbHvL+4Nl6vOo/VwFsORAj+SS8NkeU1v2D8aMRLWQBs
X-Gm-Gg: ASbGnct8Jq80U6+uAcATbGTU/T/W5yBs0/T7aL85OMF094X88EK4SXWSG9ivExZYozN
	nU7jl+k3hkI4uhpng1S085Ejhd8IpCDnxMtcFT8kDsJRZaGRbzxGmwvwMlsSpTkc1jsKvHv7pRC
	GCvsjPzxmWc/aArWslEyYPtFpDs2yJK3AprcZIptCbgnQM70FkY1MohAdy1UHOWA3wBoGRICrRb
	oZp90kaa1pYxYXmvFplzvcNbHfOJIHaeYTDP37A4IjHp9KdwG8wJ6MJOY+//5HeAt8/IfkmL/SW
	v6TcW0rBo4IUnX4xTF58SICiGwg3gSgSJdT9z5nR4UldzBYz2ESfP1SGoS04UH5/HFy0s6XBjvo
	=
X-Received: by 2002:a05:620a:2984:b0:7c9:5ebc:f048 with SMTP id af79cd13be357-7cd287eb2ecmr555968085a.20.1747250386788;
        Wed, 14 May 2025 12:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0P5XZzLLpPqaHxvQBlIrU80oFWrGZUfLAHjWlXyT4vEYM7GmFzGqbUiFFJbaA20guyHR/jg==
X-Received: by 2002:a05:620a:2984:b0:7c9:5ebc:f048 with SMTP id af79cd13be357-7cd287eb2ecmr555964185a.20.1747250386223;
        Wed, 14 May 2025 12:19:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c5e977fasm19539111fa.34.2025.05.14.12.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:19:45 -0700 (PDT)
Date: Wed, 14 May 2025 22:19:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 10/15] drm/msm/a6xx: Simplify min_acc_len
 calculation
Message-ID: <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EA3TubMiXc3Wr87nhgJe7lgLGJc4Y7UR
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6824ecd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=d28x5gvVvHF_Cf3YLGcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: EA3TubMiXc3Wr87nhgJe7lgLGJc4Y7UR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NiBTYWx0ZWRfX3hChFxi+BNn0
 OyhvCX6BvS5UYgDxyacnk4nl6+/rE5GRA2T9AxD882y49Oglppntf8aqw5DsCNW0M1E4fQd/O5a
 rgB3RF4QuWEQA/OpuVzM6A7u+sN+86s8d75iwhgbC36kCzEWmcx11N8ZbR4sDtLJKxAAj1VRuHa
 ezNUzYQQNE2++/aL9QkwagR66rkFmNl0+S1GMf/YQ3H70FCVIILWekWOj0VQslY1XOFJ+nTnDg5
 IkrDshR9MtTeTMVLKTKmf1IQv0En3jALlKleed8MpYNLqwqDax2S4oWQfSYxriu7tatqPIoFNIb
 6UvGOZenSWoEaVnMvH2nFop9SPSDpzHdfXepNKFf0THz8y+P3nMDdowCXX6BCUszrTQ+jhTGWjI
 3HvfNg5lo0HDNqCWAn7dLvS86N1wWi3sqgCM7uaqd2ZYI9AkKzieKK9qye/Z+TxeCo52J23K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140176

On Wed, May 14, 2025 at 05:10:30PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's only necessary for some lower end parts.
> Also rename it to min_acc_len_64b to denote that if set, the minimum
> access length is 64 bits, 32b otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416..fdc843c47c075a92ec8305217c355e4ccee876dc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  	if (IS_ERR(gpu->common_ubwc_cfg))
>  		return -EINVAL;
>  
> -	gpu->ubwc_config.min_acc_len = 0;
>  	gpu->ubwc_config.ubwc_swizzle = 0x6;
>  	gpu->ubwc_config.macrotile_mode = 0;
>  	gpu->ubwc_config.highest_bank_bit = 15;

It occurred to me that here (and in some previous patches) you stopped
setting the field, but you didn't drop it from adreno_gpu.ubwc_config.
Would you mind updating the patches in this way?

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
>  	if (adreno_is_a610(gpu)) {
>  		gpu->ubwc_config.highest_bank_bit = 13;
> -		gpu->ubwc_config.min_acc_len = 1;
>  		gpu->ubwc_config.ubwc_swizzle = 0x7;
>  	}
>  

-- 
With best wishes
Dmitry

