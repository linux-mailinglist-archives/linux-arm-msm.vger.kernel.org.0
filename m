Return-Path: <linux-arm-msm+bounces-56118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F34AA0B5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7720467840
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF242C2AB3;
	Tue, 29 Apr 2025 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aanI6jYB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253A2C258C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929090; cv=none; b=OSuar08XXbzJogFjszLgL2FC34ZIMymC7QLXi7RijiMPS7NeiG+adIoQ5AJr3IzXLwF//RVltm9okrxapjwgKx+ETU2WWUlp55n0pcXKRSkue7/BT4WobRPzlzRpurmIcriLMmBbQk82sAw9B0fvdu2wJ9BOycCnlMIGVG87DyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929090; c=relaxed/simple;
	bh=rEgtSqyYGjLOGamhHSrB0660Ic+9Hk1A+1wd/gOqKu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwbVUoeAoHgQg9qZb2d/III8p/okGppEeE8WMhglO1tleoiAZfslTXaXHhf5bGok9+JDsGzKHMg12ElVsFxApM7gFTJ3ltaSUgT3TvOB8Aev00yaUJ8RZatEBF5C99CFNIKDSB2YdeoPa1L/ttV3obKLoPo00b6+BlIa0EgwkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aanI6jYB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TASchs012447
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e34M8RUkxHX3ws0JPzoX/H5U
	B4Agn3FBLku0jSx4igY=; b=aanI6jYBt8EC9S2b9Rmv4trvbYfnQ8IKgLNvo4ss
	VTNzVOm3WsusRPVDLai/TsjZUbJPZSIAc0lF/d9DRQ6U0pfUWjkWpXw7eyc+lQOs
	A5qg91RLSrvVw77sVsDLMnJjtRDoYMHFPWT2CrsCE5/13hA0o92PhkULEuz9zCs0
	O7TNforikqZe7ogjdpnqzXodDrU6Sbp9NeestSmyOm3FpaJiTUNR/cr5v3CJ5/Fd
	rj0Xup6IgHNSj3b2z3rhbUSo9vF4zeYF/dUtmkgLCRmx5YTN+VXTQp073CDdXHzy
	GdUJFVc+wlop4zVdMu3wVssBKCa7eX3W32i0SYGMiWDqFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn3bqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:18:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c791987cf6so1221985785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 05:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929082; x=1746533882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e34M8RUkxHX3ws0JPzoX/H5UB4Agn3FBLku0jSx4igY=;
        b=X8QTPJzP/cLIrH/y4HdA4O8Hzl7CkB9HJthWEqVwtcNdT/X4jxxLd5UenL6psrxBd+
         J5WwG0qrqnH9lmdLXTwMUWVTY5ZdkDtx2HUS4G2p6iFd0Vx7xKKWBWkN7lUaF9v97IyD
         saqVUVhk8Us+pfykzigyeAzACwgsyNwP2aJPHSJ6wOhUq6LW6YOO1yPZ5iqSAGii+6uw
         9CTvwIFzJWlkSVXKgnZxc5flJcELG2axXTCetfChhemtwd6i6aGB4lZ3VnUvvch8Qwu8
         WpVknkHVLx1NvhC1n+lAeyj4XcAayTStYGvBQHFgGe1Vh56KOMDxXI6zO+dKF5e26ny8
         Hzug==
X-Forwarded-Encrypted: i=1; AJvYcCUyTD+MdGeuSrqpdF7dbAYcKo2CkoxuRaF8BV1cu51eZGRR8W5uKdlItLdksDWOmKSjZ7Yt4BUvqJqEVoOd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj82D8xXuB0kFllAMSgm3UeV5nnktRvzzEgXcKelANxUK0RTIs
	L9jZL35iYfvb0WAGniuVtkiF6CHtp9qTXrUdhJnX5RlwvnL1f+tF8N44Qdyw+I9e0fo/20OEbCv
	ICxtaybHmVlJQDMd0IiiZ7nhFSXYSIvDsoVFKNfAxYlB8DbnQPVwv3AVqWL5bSO9H
X-Gm-Gg: ASbGncv7Xj8FqwBh4DPE1zWaFM8TlQR4Lr0dIKe0ouDE93HeDgyohaXoWleleF4aDW0
	Yd6S+nLYHdMs6L0whiispAa4IqkUZBo5sFobfoOra8bapjuIpJ19xtSn6AilEmc6HsacIdulLe1
	/mqBK8WRf8ldDnweqY1AUEtHCMYV/fwUy0Bq35IZVQ3AMeY4dmuCMdKifIXQsh/NhZwh/3PZ5eb
	Tro+3j4ihf/c8Wr59PxXMRGGpVCrTA/WQgV61h9vUyjfCUeeq138uDdAU7WnG53qWN0hgF5nbRe
	YH0h1HDg1qHW80BsoH6gWXiaFoIl07ORxOjLhoCANTvvPrKb53aYOB6P3czmMEsJv8nahiUnQKs
	=
X-Received: by 2002:a05:620a:439f:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7cabdd88f8dmr580838885a.23.1745929082259;
        Tue, 29 Apr 2025 05:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuKRgwJxnGPEi9AE9oxOgdj1eQEXEoG3oreJuhRujKZK92EugDebdPi02MSh4UZF+o36uxLQ==
X-Received: by 2002:a05:620a:439f:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7cabdd88f8dmr580835285a.23.1745929081954;
        Tue, 29 Apr 2025 05:18:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31a0127be7dsm15268801fa.106.2025.04.29.05.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:18:01 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:17:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
Message-ID: <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
 <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Hhw0dF19CFSh-2klKLvxkc4OmvnIuJE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MSBTYWx0ZWRfXxjBq9fTtk+yV LGfIZmF/L3iFCMBHi+9EGaKnExdyXEe56s14g10wdHOkPEFRKJNtxhKXTPi+ioLAlo03G1cS0Tp 4k0lvAF1lcUfzx3nWbweDADRnkS4jrY7aIT5shQvyQvY4KoGj3CE5LKn6plRcuhuPkdLt3tlnph
 bjOBb/czx+O5MElhg9sx81S81L72L+jJgGNiz8ZVWbkbje0o8VruuJnm1AR1PPjaOD05bzcMwLs hVpbH9la6/PxcysUq9LdikdeLWxE9pCsio9CQ4ls7jQ4vATPd2GLRXSV5Jc3YcaGk9vFavFo8Cz uz13mYjR83pSkI3+1uaymf7bcixRvHoYcPzWQcTgyV2BVOYdn3hHrSQi/IN3OGjhn3E9j+mMMkU
 v3IG0gcsaO+aU5yWErrGVZA/e2+v+ggG8USbpYr8E/MgVE+qC3BR7nZo5FqT3gmbnPw6r0h/
X-Proofpoint-GUID: Hhw0dF19CFSh-2klKLvxkc4OmvnIuJE8
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6810c37f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=AUxwy3R0h1HAuY9YvekA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=619 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290091

On Mon, Apr 28, 2025 at 11:19:32PM +0200, Konrad Dybcio wrote:
> On 4/28/25 12:44 PM, Akhil P Oommen wrote:
> > On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
> >> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
> >>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>
> >>> Add gpu and gmu nodes for qcs8300 chipset.
> >>>
> >>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +		gmu: gmu@3d6a000 {
> >>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
> >>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> >>
> >> size = 0x26000 so that it doesn't leak into GPU_CC
> > 
> > We dump GPUCC regs into snapshot!
> 
> Right, that's bad.. the dt heuristics are such that each region
> is mapped by a single device that it belongs to, with some rare
> exceptions..

It has been like this for most (all?) GMU / GPUCC generations.

> 
> Instead, the moderately dirty way would be to expose gpucc as
> syscon & pass it to the GPU device, or the clean way would be
> to implement an API within the clock framework that would dump
> the relevant registers
> 
> Konrad

-- 
With best wishes
Dmitry

