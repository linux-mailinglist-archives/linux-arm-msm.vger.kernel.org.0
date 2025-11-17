Return-Path: <linux-arm-msm+bounces-82118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0057EC64850
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE6BB3B4CF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD55335BC5;
	Mon, 17 Nov 2025 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFtFuGK1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mb6NoPxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7B332D440
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763387586; cv=none; b=gnZUx2jnr43BFxyE5B6pT7kL4BQOd0m6+TlqTHtGex3JEY8u+vpbuEkjQCAktWVIVL30FwdKo7WOIqsdDg4sTmTmumyYDdbhgShtIHi5UW59sAtiGdrqnvmfmgrJ3QfBqDz3q4aVrncir4WYl44+Ax2ThENqyoCT/YkWGXv+sEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763387586; c=relaxed/simple;
	bh=CksVbEKpF9SAjJut1xXJbBDF9TPaRuhoGlNshSKhwtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWSyYp7mDpNc2zDg8rXAHl0R24ezf8bbCZBqtbDemLxx7VF0mhraLHUORweDr0Jjr+2QIOA+Xu5mtRzV9uoJ7puEZkhkQyobU7a/+cB7TVNCKAjCqmFB2SvGh1alR3fy5UNZ2gCM2FAA1+ZbztFZHmZ5GMVYIBbmllxhb+TZj3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFtFuGK1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mb6NoPxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAKVpS3932982
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=; b=mFtFuGK1MCuVmr12
	f9haVzaVKOz32O1RSgy/Q2GSQLp0IWB6W1rgvDBTRR86RSit5e/+gL7U9Xf4xY8P
	PpvZb8gQE910myLphQRL2OWHai4slaABAa+akYYX6cdEGm0iZinbzoeouP3lFqwB
	FiE7ADx79zOF4EWoLQio/1MMQ/F9Ipft88DUbf8M2q+dpOgrluXfim46yIfXD+Vl
	LGgURcg40mLjKu/qRRbcCHsAuhQRpz/dcSqa8Vl0cBZ6skK2SqI7rHe9TqHvZr9m
	RYZdThUlTtssyPSjrI4YTIolsb6e73tn3hD+UU+sLtYBVCq7O/CxnI8efXt0ataz
	og8aZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1v90jgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:53:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed9122dce9so4641821cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763387583; x=1763992383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=;
        b=Mb6NoPxs08L9v2K+VUDCN84qJVkngLTzG1QS3ua3WkGTzEXgeqf1ZcfYpyv16ychtt
         qs79AnvqQi+rH6IxyQru9HormPPDROBMivVpG9E96E8b9JExVwAHGyxUrZ21wx4WIOFT
         8zbn53uRF2AlTfH7qY9ErqhB84bp+A690rTWlG7WfimDV89d9ahSJ+dZgA/uc87GofE1
         HAIqn8cfsHkCQ/Gt3IxsSgcEu7oKN3X/X0qfpMmyQNp8mddLFMpIzGaWIsv59VQGYGku
         Q8scLIAuhCY2m10T88JxAm7FC2gs1hOFuhOAbinTIh5OcYt8ZlherSPYV8tLGUFxhwoU
         LYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763387583; x=1763992383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=;
        b=EtHc3ySHQlLTZfyUue9NPqpojJX/X843ikjwxjmoiKXlGg1ySXrHeeW4/tA4H6msuZ
         Uuw3rakvSdGqXZPfLDWarv+hivmFoafHOg97ALRgv8p7WwGADdxr44IPfTy9gxYCuY2u
         uv/u5fPjtnj+S53jJEnmLsy4/oBsUlRHei4pX6QXQtWhFPOxKeb6+/w4bbEEjtT4nPXn
         PZ2GCrGvF22LAY8vCskHaAJOJZTpB/dUXGxYEGq+8YylU+xgks+R6QKOEJvklmfKnGqo
         dSJkl3AqDWfSb8xz5k6zZZ0MWbUlJJHbBND4sbnI+grfxZAjlck9FlS7wMuPAyNiEEFu
         A54g==
X-Gm-Message-State: AOJu0YzfFcoo6ECyGS801BIfafBAl1lE57/ZWe93EdWHiWLvGEQg9Bph
	DpfRFnPYkYd4PXPqBqnS984N93RXgw2mvE3VWcuvm+7v8+NlnKIwtrwxTI7iy9Wrhrx4kSscRS8
	QKJrxQbGgWX29BEWkgH1Gh+fcf+MktNMSeW+QE3yKNnZlHq0vLSmtNDQxjU5WXtwZTbwf
X-Gm-Gg: ASbGncs7FyfGIVnE9LVPrOVQ03Qe2vtrV7cXzfuApmnblQGthxr2AdoE21hJaIHxUHF
	bkhIQLl7srQPrUWeRBZCHnUm53Rzh5fb1UR/UEUUzrZMSQVgq7wDg0AyWMWgm/fQVqrgan0nEnS
	z15qVNA2ZUp/w7EMadrmMBtAz53Vl0+/3y2jOJO0n2Ryn6HXC+Y8RbXpgFU+FTLJiwsYFlCdZSv
	wvoWeN/mcCwIhaFOzf9EXnuTAycXcmPWz/C+bEpkmZiWCo6LysxC//mDb0rVBom6uCBqAsKYA5+
	ndAqsstBDUt8x8n2kiscc6XQOzjTqiVw9LiEQalWCRa8YiBctxYExRbAsmXmeylzyAq+9MwkdVA
	SzLx8A/Sqa5qrUnLBqVsg3IHwnVQJjXpxkxERhxHxho7XBSnZGN66j8Oi
X-Received: by 2002:ac8:6f08:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee1063d7d8mr73608921cf.11.1763387583507;
        Mon, 17 Nov 2025 05:53:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFP6/ieJt0wbfNJVaOx0h7m7+0k3hS0h1MhOub3nCOiBuEQbZ7V+KAM8rQUI0q8j+iY7BfrDw==
X-Received: by 2002:ac8:6f08:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee1063d7d8mr73608341cf.11.1763387582843;
        Mon, 17 Nov 2025 05:53:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad43dfsm1089481766b.20.2025.11.17.05.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:53:02 -0800 (PST)
Message-ID: <73c3de56-5c60-492f-8b1a-209b5b06e7e1@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:52:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] drm/msm/a6xx: Fix the gemnoc workaround
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
 <20251114-kaana-gpu-support-v3-2-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-2-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SXEyROtxiMl25I18hBcmgNvAQTwgSHYf
X-Proofpoint-GUID: SXEyROtxiMl25I18hBcmgNvAQTwgSHYf
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=691b28c0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ws8SwQwlQu7ULn3ZA60A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOCBTYWx0ZWRfX/F9GtF82njEq
 SN574bodGSOfQHmLDvUX6aHMUA+Nnk0n5URFJGbOB8g/sCkduyPKUtBg32PL6CzCf2TzgzSyTNt
 h9uroqJ6Jq0cAdxO6+0By1Tae66UenXu40jk7id9AG7BX4HA0sbcWq1pK3PBPWQzwTzrjUWKg9R
 8A7t9r2BFRQssuh6cEQ2ujft+w3ME1VxXzjWq/QPwWYqPfOAWWlfJNMfpYOTOdaHv6+FznSPthp
 7RMN44kM5TdF7Yt0vL33M2+C2NQded8cyzFdkTdu86i0q2rMwmSQk4xSgpeOxLrJVjlsEtDk+++
 V2TgDt1DpotklqnIJxDd70XyHN+lKI7lpdFVy6Xip4ZsLeenH4xhhsjma3cs4RBDrgfgoZ1e3HV
 Z3/AA/APK2eEh//SegAuUpTmCwBB+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170118

On 11/14/25 12:28 AM, Akhil P Oommen wrote:
> Correct the register offset and enable this workaround for all A7x
> and newer GPUs to match the recommendation. Also, downstream does this
> w/a after moving the fence to allow mode. So do the same.
> 
> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

