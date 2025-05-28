Return-Path: <linux-arm-msm+bounces-59680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63BAC6800
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 13:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65E701BC508F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D47E2459D8;
	Wed, 28 May 2025 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWTS5g1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A530F5A79B
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430207; cv=none; b=ewwwtxY/Qr/OLj4A3GLX4CcMlvWjRO3FjZMFGr5BA0drMXxjdGfK70Y1QkZgpUmn+byvHDGqH0/DjwuSA83EK8lqk2CuHvJ8rbp7zWfdrIrocvAOhihf99Rr0SBwkmoJTeyJrlQwOhPw0iizl3sMpAXkMshpiKYRudC62UE+PXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430207; c=relaxed/simple;
	bh=7AD6vqWhqJX0O2x4ThO5Pg+jVQYeZPQYDx4U83BlAh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDe1zQBmndFtCJZ8MngiMUXlergMiAlLn7vzyEczsaZW656hfm/GPlvqEWZGGuTbN7TpK51KjtTUAfW5siATgm24EiD/WwZg2lNMAJGVFfT5OLlmULfY/vRp/Ennw/yZLqAp1UobMoaEXwMiWDjqdcAMhR27cRXSwMtfaJeHxPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWTS5g1/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9lCVv013860
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O3hxnjE8R2mMI7zZXd74HKiJ
	V55TvIlcyaFBEmbsVko=; b=SWTS5g1/WnnFFprrY0D8j3/H98v3Bi3eAeo5qIm9
	6Y3h/VGX8lhbOTgrePAIp6Wej6ZqKB/y7eIe9FWJPnwuCme3sMLi0po/JRuNe/FQ
	cVLAzkIT+0yHrrL/l2T4IxXm/fTrR2rhcycH/2/lRVy6G905zvOka3zGCQkQTGx8
	vVF6mFAZPrk6K1/2QTCgLd/7W0t8uxaqOhEkcsum53vfy5Q2SttoRKnWHkVqxBjH
	xGqFNw9yh9tJr3dBD1aylKAuaB8NiHvgm6L/kM80umsQdltFco7pRkuZZE4PKZ0/
	Vd5S1wHIAUvzY0E3rFiKYFKdd3BOAjWYRzMvLMJGrJ5HzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691cfs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:03:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c793d573b2so787461485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 04:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430203; x=1749035003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3hxnjE8R2mMI7zZXd74HKiJV55TvIlcyaFBEmbsVko=;
        b=vYao18eMD7jfWH4nx+ryjjLxzFRuHBoqx09sXttkihynKcr1mBP55wKQdQ35v0BgFF
         HKtBIY7eWkxZJ7SJ7nB9xihe+Q2umN9lyWUS1Jjb2XQL67AT04GuedEIBaOsIXk3eZpZ
         R7YytlNfXv+Jw5cRnqm9OorvGSmjNak/GRCTPfdZPbIyKsVJPPb2KdlVNMXNeQLP8IZZ
         suynUW2WR88SP0owyNXZg3QE2HS+xroGV4ixdXId7g5rpsvFcK+YE6Oy2j91buBz98DH
         i+IMjfSwyMum0mDSRF8LnibeDMgcbxD73FS45pijAUn4G2ARDRLG77Nhvzpc1e3gwWd3
         U+FA==
X-Forwarded-Encrypted: i=1; AJvYcCXMeYo2EaHshgW5/vz/xSB/oU32Qddk7nXjBxb7N/xlk5+acaM7q+xjEw+kUTy18oT9ndQq2O4iI6iocgmS@vger.kernel.org
X-Gm-Message-State: AOJu0YxedoiYto33UYBeXLLfEZSHlidLz2521XB/ZeYBrl0osoeg3+Lz
	I+9gTsgPthUuJsUXp/nQXoSA3WK7uGtsiRRh7g/sYBeQGqs6QN0WrjvIaNRBM1D2DerhSdRiyw+
	v34gS6hxE3gnXU2ct205l0J1AGXbugH4bVQcolqXK/KkJVGIpzvE9SOOQk4RlUN6sgJB9
X-Gm-Gg: ASbGnctWvWxsWiqDIiHY+Yl8ZmoCmkWRMTz07xduB+zP3SM6FFwHMlTw5DISEVrrkMU
	50TpmCgedkM1hPmgH4gPkedUgszfYtzBOtDOWfZLpiC6/CuXE7G7KCtnDkLmY5OXcxCrDqFIrO9
	Hw02gx2/jegL1zZHEDT8oPP4DjoEvFs7o6W7TVDWvgQuCRfUJMIqn7coq6vX1I4qXfzqNVhALGi
	8RDPwgJbVcHwCoWLg7UxIwiDpNpW2STT+UqJ3WZiDfQn45lc1jBztA301TXLPO9rdzflC6Fy3ay
	vY0QXeZQEQlSqLx7MJY/3z3jcd2716yXPg9y/28B3UNb46qjrdBleIHeLH2sQGdVmuGjdbUVuCs
	=
X-Received: by 2002:a05:620a:2987:b0:7ca:f65c:2032 with SMTP id af79cd13be357-7ceecb6fb2fmr2461803385a.5.1748430203394;
        Wed, 28 May 2025 04:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvMnEOEZ4WQNoRontgIBRNZol/vl733lzBBoIgKYQnnSwGg5aPaK0yeBDFlXxZZsjumy13Hw==
X-Received: by 2002:a05:620a:2987:b0:7ca:f65c:2032 with SMTP id af79cd13be357-7ceecb6fb2fmr2461799285a.5.1748430202950;
        Wed, 28 May 2025 04:03:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a997sm234879e87.142.2025.05.28.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:03:22 -0700 (PDT)
Date: Wed, 28 May 2025 14:03:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Message-ID: <y6ciwgsseaasx7ob5ygihysrt77pnfsttsrbtijhakawfe6w6r@x6mzgmi4bwgc>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
 <20250528-ddr_stats_-v4-3-b4b7dae072dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-ddr_stats_-v4-3-b4b7dae072dc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6836ed7c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=fX9Ow7R_rwjDEiK7aGMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4xccQpPlb8P0CX58WXwaEzMTdfrkSoRv
X-Proofpoint-ORIG-GUID: 4xccQpPlb8P0CX58WXwaEzMTdfrkSoRv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NiBTYWx0ZWRfX5PwglHoM2DMC
 lpfWcpPj1/QU6JqGmsadM3hOpJGHte3BOPiQEUdlfOvrhUjI9TVaUvjpovKV+XSXtmuzg24OQ/h
 DBLSk2e+42N85j/e21++WG4U9Pjj+JmWeUgb6G5m8ymo623Ju4dUWq/6WMDq/PPLEwwrgHDSWlw
 5yWvZ/FelhFY5lmUn0OSegnR4aPATk7/oPC6LpYBzE+9qsDfM4p/t/xHLWh4TbgwiqWkLNLRDZM
 SmSuMgPh0rQ4uSIGmOkU9tQaGmg7BMMXSLjvSaDqU/NtjWvatw5TD9CA4oOURzeVDgTvNkivxDE
 gKnbLcruoAvHT9mcDsCcMe64DVjg+DPYxyOxBiC64TGL6iyRT4auQfZIA5P3CLh/BeuW8+U4OeK
 a47LYYfrhF2H57LHNstiUsXF8JvUpvn2I5N9CFulArIm2nKWbw2UE2GPZ0iaeRPqov0VtwCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=693 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280096

On Wed, May 28, 2025 at 02:51:33PM +0530, Maulik Shah wrote:
> Add QMP handle which is used to send QMP command to always on processor
> to populate DDR stats. Add QMP handle for SM8450/SM8550/SM8650/SM8750.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
>  4 files changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

