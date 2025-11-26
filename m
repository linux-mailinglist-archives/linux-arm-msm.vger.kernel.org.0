Return-Path: <linux-arm-msm+bounces-83395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3A8C88B38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 476574E2E41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208D931A56C;
	Wed, 26 Nov 2025 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjB1/Yq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bde1bzkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908A731A062
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146653; cv=none; b=NBpEmNjkZDKWvf9dg17x1sbkC842Obnz4G/wgzjveeH/IsqSkSeO2+FC9lh0MIgtBmabE9FjbQN09K5WM3GCCg4lj155V/wBMGAL+oYsk8H1M36eGJJRjmtyBl7YaNg1mEBjngSq6L2syujVFYNtpfvsL5gK3CcEentRMa4VtA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146653; c=relaxed/simple;
	bh=ZEkpmNNweCkT4zn6K6CCkIn77IozJQD08tqxlmAPvoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4odeDvhG623h6UNrHZtAAoqugdqjmFFZl5kmUrw2FwU19PXjCntJ6kaGIWzRMRYYlwqYT3mSPYAMDKMnGYUFb2DrGqF73Fp9oW71MRJAPvtehMqYF5bb0JopwoduDtuRBxXvkNNxjPpH2jVESCujD2oArzVo29Zc434BfpSl9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjB1/Yq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bde1bzkH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ2QBEh3706765
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tNJke/+Vud3sKKcuTIveHILf
	97q3yRMClDgXpm8Rwak=; b=EjB1/Yq7X1yKyWZcfr6hWKBcsIyo5//GU1qHlKYS
	H1/LrQprpSl5mlGDFQ9NVxd3Tbdjrj81OB0GflYHYnfp+pMhHuQgraRWrKo06PmJ
	s/AL0q7Gro6FciHBCIAOEHq/H9vKVjSPjCYYBajlN/VNZPVj+qeMxfJUMrIwqEYI
	tONqSykJwNuO17qEpDLNzhkpqFK9s/IWkAmw7XMkqMU0TdkvbwoereG5Z+cAsMkl
	bAErycITuKFh7YvCqxGbZ7goBndAbWeo7ke3D8aHunoyZQbYqfrpXOxcndUWM8rI
	xg0dYAbUkK5a3jS0HKxGNqZbhOUZypJtJUufjuzFEqk8nA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anduftr9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:44:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-89eb8ee2a79so3111004885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146650; x=1764751450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tNJke/+Vud3sKKcuTIveHILf97q3yRMClDgXpm8Rwak=;
        b=Bde1bzkHNEEds7hTe+Qriti0Uerb1YxP6dk5bFlnHElJuI2JC1WS3WPgcm9GPJD/ZO
         L8aysdpyN4VLWuaE/O0Sfl0BptYqXpAFNTT56TEKxAQdwHeMRcFX6xsG+vY6IMQN8vlX
         Yr+bS/FOY1LvSdXZ795RxtJJZ055e2yrUeZDDgZRSu4jxhMP4U8kWV5CDOo42jw+JusT
         8OcqKFpfcI6pLcCwXy/R7sdLjPjciZKb5oVuxRKjHQZoP/3r1UxbryLnvjbvSkKdTBCM
         D5zf4S0iZt7WAeCc8hgj84AWstapMqghFKB2WFGv5MpU9eOBDUbb/MyGuSOqt27gvL9m
         JqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146650; x=1764751450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNJke/+Vud3sKKcuTIveHILf97q3yRMClDgXpm8Rwak=;
        b=LiUDXC6SHQszsi3wq1NI8wdeAjmMM9hUeD6B/hPJWv5TFOwcD5CL9PR4uqXIPHCCaU
         lzW0/HEQrMW08D6JyruXMfMV4Yi2gT/3qppYksSjBvHzVFh8LEv50Ss7W3333aUh8/QI
         A4U+MyYE00jP/Aayp1bOiulT4mpoUGCSLDc28HZqQLrCyVDQtyYEMfa3r+Tg9w5R/6RH
         YaYIExFNoa/8O7nyHyldQIGtnD93PnwKXtumtXQ927PrsXjyeAVEGoeYUlVsTJ5BW5Z2
         HxlzzYaRWjp8rGwJwb2e/OSxly5Dms2BzJZvNXuQs7KZO4T8NoNAUsFMXN0JbDVjqjJy
         8dYg==
X-Forwarded-Encrypted: i=1; AJvYcCXiCD1VUQaKfUjUW1cAI1xCLjL9S99NfV4ViMCYOI5w3sTQZYmWcIW/1mg0Ri7P+WM9SvAnNZME1U4JttOL@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+ObqbLRS2fWODu486vo4kCzwWOZzQ2fn4m2LQjpLIgNl9p55
	4ivOu2PwS4JRJMTeyky6ncSmUbVJhdXKZ8f+Iijt9Y+uDH8e9FwSsWaKUmXkzX+6zkcdFIrTUt4
	wUYDx4+uv+R16wYxjx7neqkb2XcwbTNOHMoNX+8NetQhDMkBgjYlE+5Odb+2b1cYUMT7y
X-Gm-Gg: ASbGncvNYUnMhDTGsRIyws6ilpsR43taUSBT3FMCEMCO4BgzwzDpmd2rbwZUR7/jUh7
	N7bV3Z2aXdwgjaGzVF5XCrK/Kdpl84QmxEqwFQL4s8w9ZAkm8wl17uC0MW3CTspzb1ufO8+Iqr5
	6fHFwYOJC287f+7kZPiCawCcDu9zQKpV8D93w7VZDEJx1xzgms0oZE0j0cd4WmSwTDhvh3OutNG
	RKjnbCe4rwlAs7uIYI+VB0SWxFwy9HLD6gyo+5zj5bF15R6ROxjPp6Qt5affK5kTyPIqj8RSO47
	wK7Fpjj0nlyJi2w0Fuqd/fc9Nr2w/i03JWuo1zlFDcnnoWU2hkQr7GF7c1NU903ZM2ITTo6nC60
	sVi1X44zfzaTd/nNMNBpkKNLKcSSiWklkIxvtCHogv0YExyKVppMHmpoi+5k9fYAk3LQcwvGgep
	pffoxmqqj2GSO+HMEKjZk4s4Y=
X-Received: by 2002:a05:620a:1a26:b0:8ab:58d3:6030 with SMTP id af79cd13be357-8b33d4a7520mr2283468985a.57.1764146649814;
        Wed, 26 Nov 2025 00:44:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfreOGAEsPmRqrbfxr2mWsnEvi4G1uQMuG1JaWI/3dNaieR4hyxv1CA6T0RtS406icSpfPTg==
X-Received: by 2002:a05:620a:1a26:b0:8ab:58d3:6030 with SMTP id af79cd13be357-8b33d4a7520mr2283466185a.57.1764146649377;
        Wed, 26 Nov 2025 00:44:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db86bb3sm5682381e87.29.2025.11.26.00.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:44:08 -0800 (PST)
Date: Wed, 26 Nov 2025 10:44:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: gcc-sm4450: Update the SDCC RCGs to use
 shared_floor_ops
Message-ID: <6cdfi3fgdiujfj4jkxdpjx7fnzieri4ohefcc6dedofwvqysjv@zktuj6oniboy>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926bdda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dq7s6ZasQgOU5SFiZ44A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MCBTYWx0ZWRfX1/FDfxOqk1AX
 xqpe6qwEU9qZ84WDAIJdKGk/y8JQlcwIUDlQFO236Oz16S6RIrUhGZ/+Hr9Q/VNo/+o8a8S9p8U
 +aoSq5PEd/C2VlcDAlDSTK90PzAYziprL14+o7APzWbLPHrSVnpBn3KDklWJvWAZ9XsxzCwu+Id
 hFl2E3boCZdbnIHskRfZFFR3Q+Z3vCD9nWsaItlRL/X4Uj7wqKC8Zrt82Kkqj2E9MR2IpS2S197
 wIrtofW0foYZbtNFZ7mNo4W5dt53Po9J2xogIOLJNWM/QoGxbpeZSqptXDSRkNEdvKBFPZYB7hn
 uyyFyq8dOFaMNxmfwxeFAXpTThckYzGaFMW8zZroM9zHM3ocF1pULvyOBhy0amJC2cLRB0EaLn5
 QJzqZz/WSEF38HsZSfvIIjz3cgtnJA==
X-Proofpoint-ORIG-GUID: aZ77BX-_95LCqB-Ok4oRiHK5bgEGKDxw
X-Proofpoint-GUID: aZ77BX-_95LCqB-Ok4oRiHK5bgEGKDxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260070

On Wed, Nov 26, 2025 at 09:45:52AM +0530, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: c32c4ef98bac ("clk: qcom: Add GCC driver support for SM4450")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm4450.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

