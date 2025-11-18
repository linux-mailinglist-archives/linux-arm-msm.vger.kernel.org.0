Return-Path: <linux-arm-msm+bounces-82246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5866AC68BC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEF7B4E9AA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FF13370F0;
	Tue, 18 Nov 2025 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSqQmsbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9dbAbGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF88335BC6
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460663; cv=none; b=E/UoK2IzXxvvhsRGT6mVRnRTHiXdMyVh8BS3iMT5aTl/aX8ZT61Wq46GxOwBDI7uJxlbakxltKkl2MaSEb1r86NvAmgAvCdzIl34hcLeCVeUU98g1BXVy76W9F2qgU/R3pNnR+/mQwl7hAQ6J47rl4UxNhJl4NVOp4nRWmzJkzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460663; c=relaxed/simple;
	bh=164cUtNwQ/6MAlPBIz8BZE8izUZJcebmqVBJfuQrG0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DX7RstA8G7gvTEBfUPH+pS2zBDkDdMud+Ij6wNr96b9E1VO2w3yhIrKBM54swLA6OukNm9hpDudJi8602sfqlfZApaBnumMdfcLM6ln4XhKlKEskUdcI7b2dOgTCLo+Xl2eQ/D7s5KyqpS8bgF5Z4XcOPxD0+yDB5xJY+XI/amQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSqQmsbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9dbAbGS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6E2Xi4108048
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=; b=LSqQmsbILJ6n/45d
	G0PmH/9BOI69YrXMtodKs6YirqaoZ8Gg0l3TzZVzCW7VyWa9cwY9blv3gIih+Tpd
	daIM8z7QH2SlY9PJCt1Kl8GFtG5O5pLqGeAUiVAPLzYtKCW3v8kzgWsnIqc2bIED
	NYzMp/HVm1/uekJyJkPS1pNYPLG776nJpT+r1VUy5RzKUvV9/yuf9JrRqYtq6Fse
	5LhZmd1l6aox+BCReTwv5pDOKpRNiWl5kmfQQm07HbY9W81nWZ1ry1rAorUlGAsL
	BIN3oXSErPUb5nMlS6gLTiESr/eMSv1o6RoGFrd3wo8Gww25hRjum2wbT5VLslk2
	p8xjVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hpbp6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:10:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edace8bc76so15012701cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460658; x=1764065458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=;
        b=W9dbAbGSTyMMpBaSrSiwFGOilTisNqx5MB8bK9wsqrvJWfiv/YYtnhbZfLN5XnpzBn
         MRzhCxPyY2v0gI2MRGO/5tXJnrSbMATrKXqMUPMW9UQGda+LbqbgDRJBFyZ/9K9BgQHk
         JtJtywC0MYVmVnAZ7spqhlyJUxh0m5hU6B+U2MmuLbPYVviLs9ANsZBCFG2Hv1ak2tmr
         dtqOHSqMTgKrER+nkNIa9jTpw+TiotV+8WEqbRee1RVLEqNPRO45u5/NKPQmdFWG+hS2
         RdghgjhZqA/m2lhybP3OmJn1HYieTY9pT61FsYio4Hnq0n1k94Dtny+VSj34QyadCNV/
         QVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460658; x=1764065458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=;
        b=uxAjz1Zo/oru98PXDagqqtAZFtPcYaSc3TRb3l/sMHmGBJeCBXiJl+42tLvH/hiG23
         bd+dNi978c6lvSpmdmWWLm/EKuEAIrqPwfzv/mDLRfoL4Pbo6GjA8MYEIzabw4bjTadd
         sXbpKbk0nywBoeQ+j1AsGSYiUCY3KTWE4AJkdYYwckVc7BuzAWc+qYM9idaG8MOe3J4E
         wP12ksS5efgS7OO75CT7qQjJy+9/h8MQooo7j2NV0v/QrgnkohVF3B/lli+i572NOdxi
         P+Gd701e9IutjJIMQ/sLwiVQ04Qx5oarXwXPkfjOuhS9ImCDMk7afHkA0HvM12nUGdK2
         AbyA==
X-Gm-Message-State: AOJu0Yw6jBgM27ypgVZBi0IOp4O+cHhPQyv12LeuhaZ1LeoNInITwjGC
	8t70v3jgOxX3F0ABNzjoi+UgaLI082rc6WO73zHBA3OxiSsE/0hIaE8Z0cPkcYE+tlfmJAdQ7ho
	9XOcyjugCf18lrFvtrbuweO6GzcDXVkWj0+hNaQ78AEON65lFjh1IBdVOaIA9rCI86w6a
X-Gm-Gg: ASbGncux6XyiaD8dA9Bxmr7OT+2/yLiTAEVVSLOs72O8PxKDbhEWk9LYlIVXnfVFbwq
	eUaoV/SX7Bs8cvfggw9qpoNjwHhm3rAjBrjwtdznGI3b+4RWzhUHPDdi3Mb+Q9ZDLxFIjJT/PF6
	it6Or4GVnINTi9BOTvbNXlmzl/DuU0InhXX0Yyjq+3wvrVMvOwnu+vwqoQx23JlfvPJ5VPLG+ww
	l+919OsD933UStWmSC9DiUpUyyufYLPnrGoJaQfSXF6FqbCcLZGjlKAg8Zx4FXjZF/gRVBMytww
	oOvDfp0/tNpyG0wIJI+0OLWx7vXa68hCNI6sD/Kwhsl9lzbCMOq86+BGxn5T5LQsEC7e7dtcnWX
	kzAGt2taPWY4O/45TV68U0uaNUkRBoUFAp6eEqNzfBPCpVu1GfgAiF2AabkxwtrD3X4k=
X-Received: by 2002:a05:622a:20c:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ee3182237fmr20160201cf.10.1763460658042;
        Tue, 18 Nov 2025 02:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz4Ftkem+yYtF3nOBOFFpkdhV6ZE7GbZunxdHTdiyocnrRN9QBCgvxmaVDrzMTewaoOz9MgQ==
X-Received: by 2002:a05:622a:20c:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ee3182237fmr20159971cf.10.1763460657671;
        Tue, 18 Nov 2025 02:10:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-644f13ff4d4sm2997956a12.12.2025.11.18.02.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:10:57 -0800 (PST)
Message-ID: <1c438a94-fc9d-4322-918c-b6ec1a4cc5a0@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:10:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
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
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RGZebKYMZyjwkIoC3KvTkvxtbf0NPlqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MSBTYWx0ZWRfX8Tno4k2lUw7V
 gHOunU/Ugv+5+vXHGC0uZEa+AYWkI8/lVOn4p6uG7BN3wLPgAFkwo2ZhyO9fXK5Cu/6a1KTOtBk
 yuown1npy9aeLCtBDmi4KtMV+eRX1r4DPMTsGVUsFdR5qBgf5FzifxDVSM+C+GdSKjTpNsABReu
 R/w1KUSVDxPAUpdrfb0d/tkCTl+avmx/Bc7kQJJeKrGMb6jfoA6+laIoDPzO9HGG/5huu6Zosg7
 aHBMl68hPGI2pFkeygr9DH2T5hFuHobwUv5soZITFA3RSowokPHaZ0ul1fih0LPGmFsuxgCjbPM
 L8m6cMZfvLlHFQkMMMauyNqOL3XOZIV9IT1uxk8eMaH9GiY0gXcckkMCdAluQJ7x8Jjvn6pStX1
 sLfFdj1KsZN6tTxdRyOgDcqdRHmB+w==
X-Proofpoint-ORIG-GUID: RGZebKYMZyjwkIoC3KvTkvxtbf0NPlqM
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691c4632 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GtNZTxoBlHEkV55hDasA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180081

On 11/18/25 9:50 AM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

