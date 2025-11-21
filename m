Return-Path: <linux-arm-msm+bounces-82923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA61C7BE62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 23:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8A073A3BFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 22:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC982F616C;
	Fri, 21 Nov 2025 22:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlesCqKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jW7/X+Zj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA02777FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763765064; cv=none; b=qLqkOMWJCbMmHtMAgs+tGbLShgvyDl/U2bEQ3B5J8m4wLM/YREiXE1IbXnEC1AHtoTM1fKQAzGU3ydv61aT7FhaUH69FoOq2fa7t878OTGDhbWDq455CUqA7MW4b/ERgpbfZTjYDxe4pqyxE1HaEq1HCH5wYLoEVO0o0SbKgY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763765064; c=relaxed/simple;
	bh=aXycPub67k3kwMsVNqXjy8Iel7tx7FF2W8SylTdCHnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsrmNUPKq3CCkDnIGnVDXq4rMpLxOtVKiKh/1zY7zMppiP2Ne94B3Ug6c0T4zVwyZVThAPbvg67wd2ip7rwS31qVZ8tn7j1/oPcL4E+HkwJ9LhrP1P9l41838ONoOZdovhxNoBJrYm9XhqmBcIvYnFB5VEXFQEXMCcGPTgwqxIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlesCqKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jW7/X+Zj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALHX3VN3048070
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6h4F3URArhkXYaOyRfPjchow
	oGF/yMvFUeAB/KcBtkI=; b=nlesCqKo5WFSoo2G5ByLOA1Yg8PX70G1iXta/sYS
	9rgN6j+HLEa8EzDuaq3j+scWb32VStQUB5koiZrCOY4qYU52OE8ek+aq7i4Emd09
	gsZvqtRRRUH/nS2A+SZfMZSeMMGP8hn4olwGMC45+4QEgpOijL/qx+k2WliwPT/E
	xups0qP2enlCdNhJw3Tx79nmKJABOILnXMBRxaZnR6kI2E0+2gyVHj0zw/Q6b3av
	q6YvbtoRiKHbyK1piacXVei9XCLR2vEMq2FAhNDLxSvtWgrglLcoP0xYFkK6Uy+k
	/UnTX2k0nlz4MdLpD4N/pGFujsz/97OI/YmuwdEeFmWJEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjt7qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:44:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24b811fb1so687198285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763765062; x=1764369862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6h4F3URArhkXYaOyRfPjchowoGF/yMvFUeAB/KcBtkI=;
        b=jW7/X+ZjII87hlFdsw8NeHrGh2JxbitS5nzIbBFiX6LGsm1G9alp3BKjNigKp+ekbd
         I3BhOE/xZhqLNBpDJ2ls+fcDqSLuUlJuofISM0P2/LJyZFrSXlFFlXGB8PtlA4UmgSEs
         ydyd6XSluT1/GJfOAFpDsr7xLqdU2CEwFkZuvJEYVgV/oinxsppJxEz8ewxnaXPX+5V3
         +A87W+D4JhwNNHihzKsWi197VG+IGN7Pe7Q3d3F4+M/Sn66HVxC2ECqO+9HdWUjbHvuQ
         smmE4y4noslmNWhmOba8T+Ofk+IB62df2FreITSXbZuoz643dctA8UpEyChvcDiDhr7E
         XC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763765062; x=1764369862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h4F3URArhkXYaOyRfPjchowoGF/yMvFUeAB/KcBtkI=;
        b=aI6ezDwAMHBhkesQDhue3ZLgMsvqBd53sp/Ga0qXhQOO1oL9sBBBRs2Ng0SZ1s/pWs
         vmuMCNPlsOT8lRCRKQgSypO5FhWyfUzJkeLy5XWNtfxEDk8P3Z2o4PFKxsl9rGmHUBmy
         J109JXYt4084edckEeD6v6r58a57Zv2zqMyTl7EC21V/3Z/ZhXCK9pk/QbodObME/yC3
         8JJVBVhtKEOQWePRlMW0iE5FQ06e8c5ydAgCjX9ZflMDLj5VAzq6GRCvit7s9/OHzAUL
         w0AJyZTpfasn++RsNwUWeMbh9CfndbUeB9K89C4VVKB2tbufJxsUzc1W9uMJqqtKu5td
         B+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYx/Pvy3rIAv6AmpU2Ir5PuE/guPyu+hzL1IMMb5VZfR8u0m/t2l3IbVaBkgjRrD/+U+9srHsI/wfGDcv+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqr3LUhsmbAo2anB/Rk/dHUexm3ChagCQwTXF29Fla4I8+i3cG
	s/F+yRrq5G3bqcPvr204Pm8rF7s6dnuacseQfEhjCtGuVpNRhOxuGhbtpHNNo26IINebVUwjlcm
	cVrF7h+jeYOS/tuD6OY8ztCRcjLyuiG9tGrP0FEYR0mgNlmuRARU9qhuItG4owzW0aBaz
X-Gm-Gg: ASbGnctVHg3NMM4mezQdKXJyRpVnnS0knxVlp4HlitZx05fQCr9suT0ouPYClYSD4xp
	p02ng1Uz0FsEgbUtuNpPA0Eaciqq4QpM8gYvGkRdmdiC/e79uQXwv2/MmYG3LHq+laqmgP4o9QA
	MNjGjV1nRCpQ1g7fXzBzQNRwFBJfFFFxmqCsqOkb2FeKwc3YQzWimTGpwSBJaKJu06Bn167+X0T
	5cq2j1ubsOsLFsluXHmE2hKZfPb/BFYTkqhP0tRghn8i/2cVfWTK2I8cUdgPDx9Qa4gK9dIxvXA
	IDQKcrlHdvfUx1PRtzltlP1YFjlV1hPo4Yu0SqvOQS2yjOGbP+4+gzZYdJZ8JsHY1Hr2AwSMtXd
	tlbhTmBeiT75rtNtCcGesaV8ZnwcePK2alutLIeV+wqhfWFnOpBHZNpK2IubVUSeE19iydz2zAO
	KkNOyRb87eh0+plGlHzphvIoA=
X-Received: by 2002:a05:620a:199b:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8b32ab88f25mr1002674885a.5.1763765061657;
        Fri, 21 Nov 2025 14:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI3I8lG5zOPGUxBnJD7antL9Am+iuZ9URcxIpbTDxXkvCQsuPHwSAvhtJp00c2A1SPWXrsYQ==
X-Received: by 2002:a05:620a:199b:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8b32ab88f25mr1002670885a.5.1763765061187;
        Fri, 21 Nov 2025 14:44:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5b2bsm1959572e87.67.2025.11.21.14.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 14:44:19 -0800 (PST)
Date: Sat, 22 Nov 2025 00:44:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Message-ID: <afqmoz2fml2kv2z3hhrltxvbpefrcla5aqymesf5u3nkkhexxt@h6uw4wj7dq6r>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-6-9f4d4c87f51d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-6-9f4d4c87f51d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4wHpoVRfo9Vs7ZE50Ss4Vs3qr1r0JxTc
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=6920eb46 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YsWbbbpubv--tx4qmFYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3NCBTYWx0ZWRfX1A0yygoMAPn6
 FuCeVmUHgsWgTUOJ73xdyxnPpj8gukVCGUoMkXCuAUz+pMCfJnqD7EbI2T8Swt5EldQAMptDN4J
 rQb+12maiud+5UPFpTsVqV8EWn0guvBN+jrmiFi9TeuqPmHnAW3rpjxF4XTCw7GUYI+f7U1fsMv
 9ww7uvxEyB+y0SxqT93sdltSqm0SjTAoN8LqYwSr9B7M2rDryZpSVzetxmoOubPi7KbC+VuT6Cu
 DMIHKDtQ9Ok4xgX7w27MewDn4Q/+0083L+aOxfH079v02bXKmTVWO8/IehkSkPSciEYRPXkMLQA
 je3YrWLLfaz6CpzNNXK5HUGOwNqc7pf1jGXTVCNNCVj2y8UFihje/++PTiFKJ9kgxLKf2w3PHTg
 tp5xZFHrhpo9ta+FvspDVOEefvMq/A==
X-Proofpoint-GUID: 4wHpoVRfo9Vs7ZE50Ss4Vs3qr1r0JxTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210174

On Sat, Nov 22, 2025 at 03:22:20AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

