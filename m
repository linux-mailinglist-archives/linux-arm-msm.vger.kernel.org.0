Return-Path: <linux-arm-msm+bounces-81506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEDDC55924
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 04:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C8633AA5DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 03:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD2B1E868;
	Thu, 13 Nov 2025 03:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2ibn0Ny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOmkQ8rQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A14199949
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763005150; cv=none; b=dZrlAf9w3eDWaT7M3uCHSKzIKOuz9CPUuOi3ObRe9G8nuwLisqQfAsWvdnYLfsXvS2WiAfVhrs7GLMeyBMA+y8hmAko7Fk7CFqq3eo54fRPV3DNzl3GKijhykjgEgKxzvW2JUM+tOHiUeQ0gBV82JwhGdXeclQJRQvOHSNSrjYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763005150; c=relaxed/simple;
	bh=6M1vecMqKiWdmjUo6/b6CpU1SEobhoEpqL15kBJf/kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsqDSO3RyjiZuJUuTuw9q4IkOPeyuSdYQQjWAck4lnEcVQ6E9dJsZ72krIK5PRaAqq5ojYmD4M+WBhigOB1NjYNd7JvFPblsTJnSjEQGNUa6KOshWEpw+fb1gnW/F2POeUY6UDrnRT51mLjA4RVTf9Lu44NnNEgT3IkXnMK6Y7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2ibn0Ny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOmkQ8rQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11WCV2993654
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V6gfFLOMNYMkWUfdwrHHvmuf
	2M4FWVMTiIkqm7l+1fA=; b=E2ibn0NyZbA3Ts+3iEG8rYsonyqGqBzb7Ro76wZb
	zZI6L5WNFI2zNwHFMTt1D3mIn9JJkfiezHMBwBbUCufUcQ52HHeuYSd1IGIbgy0/
	i15vALVjKL7pBHbSItp4nT4HPtQPzOTuiTWmS2Hahj0/nmRjhSWHhrTIs6FDus2Q
	zUTOp36uw5ratHgr1ZWk47v6meB2RtMc4I6Cr2gKtG160X3rO12oU16zHLyahNMu
	gut8iqAP7KRZaFGftoPYKn9K58Li8a5M9ARctTc6gEhu6JIYX4PR2UfxXw21WY1y
	WnAKCz9A95GPo7BfBo3BIX+rps6T1yMgr1Y9Bf3lr0zBzw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jgm38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:39:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-882380beb27so12412856d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 19:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763005141; x=1763609941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V6gfFLOMNYMkWUfdwrHHvmuf2M4FWVMTiIkqm7l+1fA=;
        b=HOmkQ8rQWodIG34Mmyo9sk6oA74Vkw5c1ZiaX7yQAXIjmPJoV5nOy9v7FBVu3AhM0d
         vxwWAjHotMHdOQTw4jJxI4ABtx672ua9ZG3cdYkQLZJmlBpeKXrP2d+iNv+pPr8K7dqk
         EV9E00oxXnstwNd+oqJI3DWty1ij3cw8VFIX1mWjBQpI/rXqfjT+faDyxxiK0bCbG9LC
         ABjPkOrvhvQWN06yviiogcPjVA49RGogv7T8C0idLkW31jsVsOqiSl0Ep0uSXROPWaTa
         rzYgXSxu5ibuRZWMjk2fzJ38WUsNFmqEKrAIVxnETwqYc6Aip77aQc1uaqqkAAsQQYMI
         prng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763005141; x=1763609941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6gfFLOMNYMkWUfdwrHHvmuf2M4FWVMTiIkqm7l+1fA=;
        b=ghor1TB6lMaLZffGja7+VXmzvG0T3YhxefDkUkICOeKs96U1cu40tROPzKzqW5y1xs
         bkrouM6X4WdNwYy1WAQWlXJ9FqK/n9hznGwSJkZyjRWyTpGwHEhziE5XEDtSY8K6jj8N
         XhbHNhCIj9cHiR7QaGF5jXtWE28IDAKrJxYhG1XmjxSbQMRf/JiaiYEExqu9gf2FHI/f
         3v1rc700OyXpsCmXhqXV6juX2U57s8XDqWtsDliQz4nLRf/o381fb9+43/LoyCcfTzyE
         wLFNMthn8OfR8C3QfU1k8W18j6e3I6y1qPkFQhwBd6oev16Ijw1Af+dxzyxfyG5uGfI0
         Ahmw==
X-Forwarded-Encrypted: i=1; AJvYcCVt9qSTjArnO4wL4einVkPbyMSbz87EvmnI8EvJ+PFKM+Va3vZE11emCLFgtzbMlOuGHs4QSEO37Yi6SBnA@vger.kernel.org
X-Gm-Message-State: AOJu0YyHHb770TsH7Bi2RuDEOt9ZLkU49AhTPiK65Ajxm/CkKiY51uwd
	HWL0wj07y9DsfvuDAhk+ms8Zwxo7NDGez5kP6QDCbu7MfGu9xl7Ve8lv8ii9rvqrRvGyDlOS5dN
	LPzJKOXAYH2dygUX6XKN8YEbs1Y0o/Z6WJAuWm1AQM3vB/jo9T4QX9qc20I5qbqj9l14h
X-Gm-Gg: ASbGncu+w8xdx3PS16nvtvlVVZh3TQ3dJE6Ie+/3+Bc/A0G5t3yNRLraJx9OiRenKFN
	9W+seQGOX5Lmr/LddtCQzLkztM9/RfwwSgR5nOjWgBpV19B8rxmhe6c0R03jhh0JTSJjFRZCaQJ
	ocWOWP+2Vs9B1IOZf198pWbT5VVgKxuoRe7/EhgY2KKN0yzHJDbJpAs6BFfMjz5g0/TYkt1YEsp
	b4/rId+eH0kWgBcwMUENNA2CI8vLdt1aj6y5Lc4jOwZq/1rO0P7mq2li5YONTrr8Xo2j8tJjAEl
	7TQlzVPU84NQoHIJQH6n8R4568vG6TGkQbXDO9Mev76ExZAuz9h96qmwRv654mH/l2GNOvUCSKT
	jlUEUGRdMymN09vtkf43wLfFUHeZ7wU9+lLH9053/Ny903E9Es+kmKQugeNDxGZVkmyw6amadLi
	S0x80M2+YLctcr
X-Received: by 2002:ad4:5ca6:0:b0:880:541c:8243 with SMTP id 6a1803df08f44-882718ce64cmr59684536d6.1.1763005140599;
        Wed, 12 Nov 2025 19:39:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLs3C0c93KWlGhuQL2zqwisxhLVaS3eXXtyZ+U1XHiyIF0ajQExCpK2eFHj8X6rYEd79M4mA==
X-Received: by 2002:ad4:5ca6:0:b0:880:541c:8243 with SMTP id 6a1803df08f44-882718ce64cmr59684426d6.1.1763005140130;
        Wed, 12 Nov 2025 19:39:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804057b0sm118302e87.85.2025.11.12.19.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 19:38:58 -0800 (PST)
Date: Thu, 13 Nov 2025 05:38:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to
 catalogue
Message-ID: <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMiBTYWx0ZWRfX+he/krqk1pSM
 7hPyD4i7duY2E83HthvSpwJnpg6170A+SG9bPg8XlRheKOAco4Zsz6sBqQJ/kBMlWzpLWs0fuFl
 d5EoRNI3JzGVq0L8l09BAKled/1CCVhS9+j89uBzXMLw3tHDeBiK1JS7MQDQUUGitHpcJLoV+7D
 XPLrWsqUFg1uTsHClS31Yies/z6c+vSWQ2Ba8O1P93qclI0dxAMnWtuP4iox+j0D0az6z7lMubT
 dOF2i6eZavDkowrIGq9DN7SfPElvnZoCC/SbxdAcRDckzPL88Y/ro5J/ek8m32kHCqBqwy7vwkr
 45Niq6JvsuE+Ifq6mJ7Asn+dgMuQpdNsOZI5fwJRk+7yUo1gKy8VRJ8WQZ+YCsmUP0bl9FTSb/c
 KiZiAVUvuvL7qvSn2/tBZFWVIKTD8Q==
X-Proofpoint-GUID: fExqluMGxcuhsA3BS_JnAqApcvvGcWrF
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=691552d5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CJ44idKeuHZi8Vt8iyEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: fExqluMGxcuhsA3BS_JnAqApcvvGcWrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130022

On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
> > On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> >> In A6x family (which is a pretty big one), there are separate
> >> adreno_func definitions for each sub-generations. To streamline the
> >> identification of the correct struct for a gpu, move it to the
> >> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> > 
> > [...]
> > 
> > 
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> index 44df6410bce1..9007a0e82a59 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
> > 
> > Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
> 
> Could you point me to the holi's devicetree? Currently I see only a610
> (sm6115) and a702 (qcm2290) uses gmu_wrapper.

I don't think upstream was ported to SM4350. SM6375 should need the same
hook, but I don't know why Konrad didn't enable GPU on that platform.

> 
> In the driver, adreno_is_a619_holi() checks for both 619 rev id and the
> gmu_wrapper.
> 
> -Akhil
> 
> > instead
> > 
> > Konrad

-- 
With best wishes
Dmitry

