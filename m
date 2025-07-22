Return-Path: <linux-arm-msm+bounces-66063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCF2B0D91A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5D3A1891CEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4192728AAE6;
	Tue, 22 Jul 2025 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6AtnTB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E40A2E3B0F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186368; cv=none; b=uhfg5r5l222An5OgXPRPSSSzdkOAdcNgCvwrUjLSFm8PBQ7BJK+36tWJmYrS4yUgMzOAFxQNBm/Jd/fuvfl3zdQmABgRiJm2rwTEho17RDwt4PDpD4TrF044uADiXEU4M8iQpqfha5Qfg+ozRmeUji+KRvIYfXX1/dYcrZ1XWrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186368; c=relaxed/simple;
	bh=B4m9Mr8J4dZJVVQHMVzz3OmaAMEJntzY7NDkzmQmosI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpYJg1w69T2/5F1h2/9OfGBHS+of+H37Eta6M/l8E5YKz/nQDUFm1uRXebsEz6EfZp+0tEErfuw7w64I6m2oJotBzdjb6k3BtwYgjxFBnDIOvCwT5HVchrS9wlYspI8slPwbxh5Lwje0/e/9wCq4f4ZGziibRRspUnDD2Sh+UKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6AtnTB7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8mSZv012594
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6+tf+sdWldSOxWYqZA0c0epF
	R91HvWPAn6xpjPzhVvg=; b=k6AtnTB7FPEFcfn2Jia4GoFrAoMHN/V+fIZLWxj7
	yUz8sEiJlf615Sswg5M275/6zDbkKJ3xhSxeXMl0bmVxwimCEGJG9rd691/0tTgh
	1s3M1DbwA1dRPzk6Djx/kAcmEfI4mZwZHtm0p2BcNpKMDj5lzJESDSB7k9HmwhSv
	C8ss8Fz6mzb8lyQXmFacTSCLM80agtIguKwJNYrSB8V+mD4hrY3mFIiX6BjEcQvo
	7UE7wvIra+vG6obKA52woaTNr4ohfiBKqTmx6pPC7R7FBu5UsWX3ZwSdh83Ti8Mj
	EnLWc3Nt/OE9xfFAmL0IWv5XVVHYtewv1nrQcqd7Ud7g5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6kmjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:12:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e36e20d700so340168985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186346; x=1753791146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+tf+sdWldSOxWYqZA0c0epFR91HvWPAn6xpjPzhVvg=;
        b=uv4k6cnSjl4JOokvdgAR+9+1TldlXM/h80JJUEvxryYyK3iPtI+LFYuQc9N2BUxrYL
         +5XY458L3ajkNVdN8RNhTSDjZpmUl1tSeNWWw/FHI6/x5fzMZJlcX+vE10dahGHidJTj
         knhliqGw92qclE9fE0bvLW1Ie+jaEd3zwt4sNMrLCoYMGDYiZJFEWEl5251GVOUhDknE
         1YhNmlsc3f6pT6DoApdZ/7TuWWBoKHxaaOyGnlQlIkDPlBJPMXGdOwuREjsz52UWVWDh
         2EwcLuWIPjCxG7x6eezWcQNdTQ/CCKpZnIYmBF3mJ0Z8uUvVaE33h+mCRa7QCNr4r58u
         Vu1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIMlLpPJkrOCHV2JP3im3l7f7OOM+2cdp5YIusg73b2gInZoe9Emg1wZ2tbI80+/mFG65FYvQL14/7qG5K@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyw99RQ4FubU5V0xQW24HRGDuSj2oR3iI2GuoPvdwwmH6gFty4
	bBh3rPLu6pCzCVz8rAA8moSoQJdfK2ToKbkZNgN2WjP5DN4WuvGGTOe+2RaezlTOkDXMi5aSW9N
	2JBjHU1/K4uHHidDuAGQ418iC6OR003eEAVkf3JvpqwsLgfzcj83RR5ZZLFGmSaHr2RRz
X-Gm-Gg: ASbGnct45kBPMs8wEQVrpbSH7an4FdvIXkEApABAdQkWKlBR9b3YoM/IaXBWIt+k+Lz
	aiRWG9SY3L2TA3UKqboB5XkQmpOnzc1nqRyv5Qjw68qlup2d6dGl5fsYcMLDXSk+MbLB3S2kz7Z
	Mw6LoH15IGkWabf5ABTvom1gQGnTgzxq8tk8+CZQ//3aO6ua6/wpsilz9/b9L9NT+f8bSWuVN76
	G/Fo6Dc0RnUk24T07GaEEtcvgcfxJqaxI2LB2BC8G78xBf99gp+IrEZYAfdyPz6MUGGJipHc8Ps
	iVz1e0owvNTq3gOz6jXSXZ9/0pXO3+8JzlG7Xa3DSX/XavHFgn4adJUV+8X5i6l3UHxCyyseAgY
	3U8CP88fBN9f427i/VQFO8PumNhVZrShBcT/deVL0pfgopbdrp0us
X-Received: by 2002:a05:620a:aa19:b0:7e6:233a:fe35 with SMTP id af79cd13be357-7e6233b03bemr194467585a.20.1753186345662;
        Tue, 22 Jul 2025 05:12:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFg+8xKK+4rYS+5ET7ggPMSWDiREKrW1QGrmrNmf1IbigBBhD1bQdpTYbR0xEOTU3AyAhC7g==
X-Received: by 2002:a05:620a:aa19:b0:7e6:233a:fe35 with SMTP id af79cd13be357-7e6233b03bemr194463285a.20.1753186345110;
        Tue, 22 Jul 2025 05:12:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a4c1d1a6bsm140209e87.102.2025.07.22.05.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:12:24 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:12:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: ipq5018: Add crypto nodes
Message-ID: <ssxqdorq6f2rmgxmnu3g6h7ceyzfg5golymfiqks4pxvhdeips@o26ha4ydkwrv>
References: <20250721-ipq5018-crypto-v3-1-b9cd9b0ef147@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-ipq5018-crypto-v3-1-b9cd9b0ef147@outlook.com>
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f803d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=UBJjrWuA7Xe-G2Q3MxoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: aQBxLi0tDKJMN0hRLKBr82j6bzwU1LT_
X-Proofpoint-GUID: aQBxLi0tDKJMN0hRLKBr82j6bzwU1LT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEwMCBTYWx0ZWRfXwVBlyVpgUD/R
 fJe4IJuRpR5AKb9cqQXBlO3yC89tXHWyocD8xhOdfcxpJ3gQMaDkbCu6sajzbGTydGeDWfZFE+1
 gX/Dt29AkwUk9UzLx6hMY9V/ZJrufXEh+YpkiNi1mhYXzv3GcwMur1LN5NJcQ55thFfxax+zssM
 S36QWfRnF7a2Ybm3XhLAsOHwy/TIQ+bLkLk8cWgCPFWlDr9XfZZwPXgA8EvO5aI8hCIlm5bElJt
 tT117O1QDYaDxsVfhsodLDFPTxo423opraaBY0hoToBeLtXegBeoutmTwMpH+gqUAI4uP3SSlgc
 lJJE+WEBNW9MZoWhuuoQzAiYbL/z29Fvr1N4UgielaPmT7B1XyM2gj3MztPbH5ti8PU5qW2uzi7
 Yng4Fy9YUmvOtXSNGFqoU+erk5Z7NtOwyKsVCowolo0Ababj781WMun6Oa0T5H88bQCMD5tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=923 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220100

On Mon, Jul 21, 2025 at 10:23:15AM +0400, George Moussalem wrote:
> IPQ5018 uses Qualcomm QCE crypto engine v5.1 which is already supported.
> So let's add the dts nodes for its DMA v1.7.4 and QCE itself.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> Changes in v3:
> - Rebased on tip of master for patch to cleanly apply, no other changes.
> - Link to v2: https://lore.kernel.org/r/20250524-ipq5018-crypto-v2-1-faa26aedc4cf@outlook.com
> 
> Changes in v2:
> - As per Konrad's comment, the BAM DMA controller is v1.7.4, so updated
>   the dma controller node accordingly.
> - Link to v1: https://lore.kernel.org/r/20250523-ipq5018-crypto-v1-1-0818047d8a18@outlook.com
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

