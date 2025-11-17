Return-Path: <linux-arm-msm+bounces-82123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25825C64951
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754953A447C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F4922A1D5;
	Mon, 17 Nov 2025 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSa2HpyV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeqhF66E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492DA17B50F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388553; cv=none; b=AUUVY4R9SFy1/DjVsInRl7sAV7RcfEoFLsdoTOtrSkRWgyMubr2bhOla2W6ldCxPQqB3mmLQxUFewHxdR5fv3sD1riJX3br6L4TubCq2mEzNPGQ/RV/2hLN6UN0Vx8fB8PC/Y8ZmaF6lumooBgUkEfe3RLSb9UxhpDAa4gIv+TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388553; c=relaxed/simple;
	bh=iWP9KkEiIxGDhZLl3mYX9omLsm9axPKeKxjvh8gmgc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ls+QIJprcvz66nP/wuEVQl/bvS6eQv2mvxs6BlwJdrcqggrfHFYd+/hXaiYnw+yY+FIynFz5oi9WQfrCHGCxjPf/QeD3bhKh2V9MTIaRQ0m2Ska8o4ZfHOG0tFKm3TmTrTP1c6HR11VnaYkBGuJwitCtKzvjyU/p0absR0kzfyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSa2HpyV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeqhF66E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBIZol2582077
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=; b=fSa2HpyVbEXyR5hs
	AUWWxsv+gPGVSCo4FW/z8Q0Z5Eimecl3OR0XXpW8dsYFPKyHvu/+W/bsFJ7R2wYE
	yE7xU5SMzPHOY0ife6MRwRqvPrVeVVPYpEs5B8mpA3Kac4OdYqdG1WF8Mgy+dx22
	L09YKmI5RpAtS6q1ugXdSg7b9+kWjbSjeYMNeD7NsLRlGqq/Q5+4JmbqR5uyI92d
	2yb0J8hx6WDz47JuY8WXKiAUexjO09H9IeKnAaLM7SDtBFAwhRIhtwAikacAmms6
	kAu6pjtK6ERfamox+wbyXsNm5l9ITldnyUb4NfOCBpKEMskvjfonOlezx7BqZtov
	zKuykg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afssfa13k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:09:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-559a4539437so292329e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388550; x=1763993350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=;
        b=LeqhF66EG5kEq+bT1OssWrRq2VKyoEKMh1SEuEsleQ/4GLgK9Vl7dGImj+qkjQ5kDU
         HN/HiTlaQbLC55WADGK3RXMEQ5i9EveVowjwuvjeLXEiwx1shNlJMYBx2AmZDhKxOGsr
         T4HQ2KogCjPUcqz6RhAqJGqJVh/yC+X8Nt0yPs1u/UZvOspxDvdov6iAtnN8ivJwUY+G
         yce9Jbca29ZhvE5xjtyCQX4Wazk3IS6eiVgreoWZr71mDR1fPoy55CiJGqHGv5wrzXA/
         0oCzHB18PPmnC0Dvb+uk+4wHVZc8Nmi1+OQ13ejlQf7bn4vwi+QddAqVoMEuP1yfYLJ5
         h4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388550; x=1763993350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=;
        b=sElLelz536M6l+I3DolTH89EYk1JJRwdcjAXI7JTpLouPYW+aU8AKzPJIw4Bh6NfnR
         4J5QaeZ1dLtQ0ihNY36J5jX9E77z+ZNUEjJT+RFlaXWjTzqKIDtRZCajQn37WSp6GkAI
         Jf9J4WHKvPmW0Tpr4XmKwwcsltHkv40taF7Vv5Ss8VqtPw0Uhv7hQKhbc7y/BPKp9uCU
         c9h5oFEYIjziFCl4XIlg90fHxNFqAxh7WhSfU+B5D/i4nkDFEvOXspS8vCQbr0yXDroZ
         e7cJil5B0QXTVLvxsCbLHfTqLFH+cw3lKbRb7raNKAb64cacdXqkbZV2B3oM5+mbR1dE
         eFrg==
X-Gm-Message-State: AOJu0Ywr/41MOfBh+GzMzfsniqOQGzILQjynmDPuKm709D2nyQArZxwm
	1TpLY+RppE71EeU16G4DxYmsdLV8IynwEkicA7yvHVLTne7g7TIUtXkiGkgj437W30OlU31Lb8l
	OnTzaS1Qy/bFFWCdIHvzvWWJHKTToMpEcO8wPzXQE0ZhxAgkv56G5beZgc/OwYKcc6XRz
X-Gm-Gg: ASbGncsmnvAQC6GmfW1jl8+rS3W0TLTGjhrmMeGv/kegXAO/8ALg0i8zA1Mz+vp0PWF
	qYAsslz8AcnqJGmEt7XzQPljjL2ZpAxlOfbz15leRU3d3fHniMVmMum0jS94lS4WLPvOhWqVZcP
	dt5uxRTmyqiIHrVeUixDCYmuJGMDnMC3sgLajiNpod8XcfldENlYBiiE/r5a1ov4xlv/2kNpZfX
	sA5u2Shp2qCmmK1qCR4bO8doa/Px2tmm8s0t+BPptDk09Gz29j4x/92kNa/dlNeNq4fymkis4Ou
	mVAacqlaUJ6PyFTD1rEiC4nAzbSKd9HEqgzhjzYOYv0k1hvyHORrxGh+5l1C78v5t8hDa+IBOmW
	hKXALYRUKG52jNNor3mxCH9TVxYjegAJEkIhNWE4X96XQNQEegXoZaEK2
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b1e8e656bmr1323558e0c.0.1763388550460;
        Mon, 17 Nov 2025 06:09:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEn28HG0q377MHRpAVge77qxO8f44ujFbyC1+LqHPUCbNQVUi80/RIfFpD8JZBIKQiQvtEgA==
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b1e8e656bmr1323540e0c.0.1763388549969;
        Mon, 17 Nov 2025 06:09:09 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f961bsm10439343a12.14.2025.11.17.06.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:09:09 -0800 (PST)
Message-ID: <eeda046b-cea1-4c57-86b9-217482568b0f@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:09:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] drm/msm/a8xx: Add support for A8x GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-10-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-10-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ArURcZPOpcAAlA-WcVrZxcLbSgMSkv56
X-Proofpoint-GUID: ArURcZPOpcAAlA-WcVrZxcLbSgMSkv56
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMCBTYWx0ZWRfX6fwCrHPZXLs+
 3gGusGmG5CurA2H1cTc6Qxu30CY7zJqJwjz8tYpR6BIk0rJXXHluOOpHewlbJfa5FiLVP+GyMJx
 UxEJP7BYlL4UGRMKTrn5RV7sH2UNkq79/fzarhiH8St/v0rJJnSBKoHkF/t4tdij/6mPH7FlvA7
 cZPRT8xVvX0wH3EWD9vACmzB0KfToVYvUTbc+1JuY4EODAM136mgE+709jRvV0DynyxGwfVajH4
 g1fG6NosJlwRnwROqRFH2s/sbYtPRm/FP2LcE4JhaD2irTjQ+YcwYwqAd2yWrVs9ENxz7wzkV10
 mz6RfBVJ+kEwltxcP+iQ/BZffvz0oxexQwFigI8br8fESEse0j7X+7E2GnjvIz3vSzCuRtqE6dn
 iwY/fgWH8mFYuJdMCGMy2pcjaX1wCA==
X-Authority-Analysis: v=2.4 cv=IrkTsb/g c=1 sm=1 tr=0 ts=691b2c87 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N-Earc09p0J-wu5tJXsA:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170120

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> A8x GMU configuration are very similar to A7x. Unfortunately, there are
> minor shuffling in the register offsets in the GMU CX register region.
> Apart from that, there is a new HFI message support to pass table like
> data. This patch adds support for  perf table using this new HFI
> message.
> 
> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> to simplify handling of MxG to MxA fallback along with the additional
> calculations for the new dependency vote.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

