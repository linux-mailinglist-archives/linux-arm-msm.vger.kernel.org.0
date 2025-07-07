Return-Path: <linux-arm-msm+bounces-63895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE5AFAE84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 10:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7C8A4A0A11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7880528C867;
	Mon,  7 Jul 2025 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hjvh7/Q7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05FB28BA9B
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876429; cv=none; b=iFKmxXqNOpkfM6entlK8Kp1u4pNSOmkBXUET78D5udSMWI0vRLCWrku8MDX2O/Z+KQWQ7hyL79XF4ytUk9zV9jVWbctl5vfKiVFZOk6P2cFM/X6Hnuoc0QlG5awKULc9nQXMs8Qksnlu8zt29Q8rKyd7/csQzkPGF45wDB+9UpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876429; c=relaxed/simple;
	bh=YWK5Aly/RFu5zRYWfVMwRUbS9ghHtEzKFrvo7RaTKkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zes0rUof36V/UvWxFfTkPpU2KB3UvH4abtAd4TWcC40iFqIQg2jWCbRPM0Z8VkaGWrsbzl/DnO9jSeBoVDqMJ+/B4tNSdNiwonCdpI+6/fwFnoMFnO5pcNgSFO2muSLEywrEayDa17zc5MjzDB0UWyqNCYIw26lyscE5CjlQBdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hjvh7/Q7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566NeH0j022232
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 08:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4EMkoNbmivFQaZ38vGT0oUjiHc0kOLYnITvaWfz0JI=; b=Hjvh7/Q7eIK2cXzd
	iEpH0RXyeo2qPJ6R/Whb1vxgmucC8U0LEwI6sICWiYnDX/rvBRBOobOluIPAiYLx
	DVr8kqBJw/GIjXhhsCAZCjMstYsDqWfXbW0/B7NQ0i1iaA9hM1DC3uT5nUEk/j+I
	+6XAl+W1phlk9oN97CAl0q2v+U1Pc0B2SeOl+hHiyxWRdjyIzRFARi139yoPCN28
	gKtseI/xa88u+3tEEXBTZBQjzMZpJT9xhKE7iMSjuYbfi2S1we+zmoYvYtlgojIv
	oAWm0NO3uS9k9oBFF4QFMGQMuVFbBbE3tL9OcFH63QBmuTpc2O06FVdi8VLG7dB0
	zbSQOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmkg1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 08:20:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facde431b2so10972686d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 01:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876426; x=1752481226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4EMkoNbmivFQaZ38vGT0oUjiHc0kOLYnITvaWfz0JI=;
        b=XlfZ6I4axmYUWAlQObeghmxnmIfNFdozYd5n3e8IKi1TlZ6R4APb0LZ/9nbGWgHTcF
         +Wqz1I8Fn2mMf30Hng1Z9MlZgwVMq5zstAwZsPActT06zAJzz+Ym1VXRkXWH1L+6SAGh
         Oa95onLpVwuLWMC20Wrzgv8KGwfXzdTh1ZsYGoDlzoBshSP7ZQqBgn2wD49SqcuTLnS8
         8XQQdvhhNfAMARNVs2n+ldv1uioGeJ6eYmJvea/x9MANDW4COuKuWl0rzNPwI7G4AJbj
         ybAJW4GI0mLR5zVUHA9FCqYnM6G5ehnHARia2lapYuDPyAdDjaMT18EfNvNYmmTYMh1t
         DDEg==
X-Gm-Message-State: AOJu0YxyRW2I5fwngbf75SRPVs/V1LIlDm2B6iXbJzJbcxgAEitR+VMl
	MPUoW17H49EEDKpJvOzJDPsi3i+SNtXROuhFPlyShWGuC+/MkJivy40B8vQUAazL4H1E+oQnaod
	o4v2zSn521+v1VPdw0Llcqr4UI+jLqBUC3p7hSSWgL6JwNIxOVg6XOGe/9nD+7YUdFNZi
X-Gm-Gg: ASbGncvlOA01k6Rb6yD/ViZK2aYBfZi2My1+Iv+Zst9m+BWYXfuU7/5G73ZleN8uDbH
	pORDb2Py3GO89Vhp95MyezBFa171oHYKGmx+ht0KOVfgjwmeaxswBESrCq3CRWJLwksUnUOCZiB
	a7QMIc4694p7Se3D+hkeyAvv/qkoQdAjymhhQmL7hHUW+yL64GxSnAhnic4ydI4PuNli4CQd8Ba
	ZEE04hEn4TitPbNHF0IgbkXvCqZzHQWaaaNnonG7o4yEOJ2R2YRP3tIuQijcHmSmv5HYg7zyuJG
	7213mghCObkh04xv0QZEi7eXCn964kDBeyIjtKWbuk2vs6zBNI6TYG6Z6v/jt5+6vapRrbMnu2h
	57mc=
X-Received: by 2002:ac8:7d84:0:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a99760e68fmr67128731cf.2.1751876425661;
        Mon, 07 Jul 2025 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPGxVHMXi+GqI4wQKS4e4w813HXxLKWhB28EavSoGs1CWC9w2RB9JctfqOOsv4gyMoFzYKXw==
X-Received: by 2002:ac8:7d84:0:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a99760e68fmr67128551cf.2.1751876425100;
        Mon, 07 Jul 2025 01:20:25 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e7c2sm665160066b.148.2025.07.07.01.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 01:20:24 -0700 (PDT)
Message-ID: <6f3af18f-6c39-4d48-ac87-abbdc905b896@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:20:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686b834a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5JVmSJ65WXatj3hz380A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: nJ8OnPfYqCvMhC8EMHYkJKapJynkvXXz
X-Proofpoint-ORIG-GUID: nJ8OnPfYqCvMhC8EMHYkJKapJynkvXXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NyBTYWx0ZWRfXztAJkWSWuw/h
 +9Kh6+dwSuHTZ+Y3pPSbAKpv0d8ypLJgVeByVEbI1npyTwS4A60o0MhuMH1jYhu78nK2I9OgqV9
 Rb0Jt09nL32Zn1y99h+79jsEj5J/tveXhj6SL76P/zYtAxO7s1VZ+qq6yWV59GFkYK133+xamKL
 09l1VhjbulxEpiuol+HjfRXMUMtMIjqcuJSyG3+dQvfSwT9Y6te6ZTndszdPwyFToU2juS0xBTv
 YMYU2BUwgozYyR/wgBmF99vIwqiOBhyu8bDJl9Dz+hPrk7M352xt/8di7d9IrV7sbYAAEmkVexP
 B50CP7oeolx7l4MZ7eDtjFvxcwZGqxB8OBNQC0x9Bmlhfs5EfjpeCkQ3Wvz2iviBD8yZP+9W/OH
 Z6eYILxNKLXfvIdJup4Q2Mg4iMJp1hF/DYnivVKTcY0SvJt41AFm8C4vsQh5b2SQKfVNzrZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=733 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070047

On 7/6/25 1:01 PM, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

