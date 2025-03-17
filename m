Return-Path: <linux-arm-msm+bounces-51623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F259A652A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 15:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66CB0161D78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 14:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8E823770C;
	Mon, 17 Mar 2025 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMzVn8/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC0156236
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742221036; cv=none; b=f6jHFfXEf+yfc3mgreQEtKG3+bTrKDoCtPa3/4+LKa5ftajb0jO8VVQ6sh8jFBdH/n8sXVx3lBSXknVxYj6tsIo/VCHffXUvLsB+7LQ9OPXGVIuEIIrWXKy4xKy/RhYQvi6opMfVgeh3F2UE6W6OkerW5mkWGColPzY8+VdOXiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742221036; c=relaxed/simple;
	bh=ohiCRF2x3tHxLhT7PBC7mSuAfBj8jed4k4b81XgIkyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8aQag2rHuIDe9cH1zty3qqt/JzCvAl3zNb07NKcKYuC3Qm1x+L3FYk8kwXybPE3NGofZHsEsq0eoVM4t4myeyFZDzDjIlc+BrggB+3tgTOt6VLMd+hY9pve/pVxJsWgM5CDhTJz+p3E1F57JXh6l8qDPakTTbqYiquotu9x2qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMzVn8/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA4dhR004477
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 14:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dHzEvf4fI2IHIcn3utQgPXJS
	us3uTGB7Q5bFT3oEIbA=; b=pMzVn8/dEL9s/x5XFfE9jXBqtyi5HZyemHl9NUWr
	juHTFzQGt5HE0e3kzJlVzRQO2azI1oswBzfIzHi7DFf4yosaNfsfIOl/KroMyMwy
	cLzqYY+NA/b/J7nwXoCDegipuKufUZFFfMuipNogFdhKP+dtvX1gootaeZA1EW2c
	pHFUCTrHRXEVdJgs3BLIAjpMvIukiwbc4x/rkS7qmz2SW8DDhLR7cu3GtfVVDfg2
	GeqrVn85ytTToMQDliE0L7xKssuRqbr94phK83xoClgy8W65OHRwSID5N9HRAumb
	LpVwU3y0L+XtzdZXyDEV4lCnnLJMOU7lv3C4YpKa9NttYw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1u8d085-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 14:17:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eb0ee99252so16869176d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 07:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221033; x=1742825833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHzEvf4fI2IHIcn3utQgPXJSus3uTGB7Q5bFT3oEIbA=;
        b=OsgS6Xje2dSaSIUWOzsfEM9n3D9iQwRUTB7zAeFcw0zv05brpkqUlC709SBAEVRH2f
         vZyvW2a3JNlkeMDgXI5cIMMZmctXW5WFmLp8GwnlPish6AXCKI3Y2+kMf7DVvXRs6bFw
         YUf1yNQsJfumUU94k3/8T63foDq/pQG8scDdACxSAQJZoy1GPnu3rDMee9PE492o2l3H
         8Vw7ogkanVrkBDffzXPPnfGBR+TW94eG3m90VlZ2ikmWGFF6vq7YBfcZhHiaa86SJeQh
         HpSIkB7C8h0IEe6mnA8I3yD6WY+RTJADcZULX4AHpbEneFHkv/1miMFfyI55hUFZJNWy
         uv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsQYYjQLHRpnKrEf4f8ApWHDI6+YA6EVVlscUiMc9bmu/4TnyDj0WR5vYhqJJKFMvTFgZM5twhjh1/M3Hk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2nKuIry6ylxZbGxPgdDTA0uoaEL8KvMEs3yH9KQFBlgGCtkE
	U/535zWmXEvRv3lfCZgJWsNEy8T4N3pJ94gTi8Q8HhrVlbfKezH9r/2KyM4Dp81I+Oav13YAGmK
	gD6LBIF2zIcytWJ9icw8TJ4lM9xP8zDfy9LYEv9itbbwJ9GcsC2mepV1bHlTG7qD0
X-Gm-Gg: ASbGncucTFktlhFdjsRdPxqdbnTBbFQvTlSzAWZyfFDBfATndppZoYYGQ4bjX9sZ0zS
	qm5T8ur8VSJb0e8txGpkYHfY8CbTykpZvlVG5kpRSXtF4SbD7upEv/t9Ztbr7OLvPs0EBj1r6CT
	1ylIOYDDj8dQXxqx6hA1ceoXAalBi040+PMZzWl0afZy/cHZD68sHc2L4aw+FuTsxJFk3A5FTfq
	LD7MOvIClpmFyqLjPXEymxhRFwNpEjDwUQ4t0ZDNc8aKGrWmw83aZIuF7fODPOgSoCzIVqWRDk3
	Nk0ZSPo4jFaJqnpaoCJse/HfHrY9zIeouUlEebspU7iiQdqDkDt4XnuNfIxA1ioFHEW2LCG0G5Y
	NVjk=
X-Received: by 2002:a05:620a:1a0b:b0:7c3:cfec:39ed with SMTP id af79cd13be357-7c57c930d34mr1948976885a.58.1742221033287;
        Mon, 17 Mar 2025 07:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSqQBlxeJyM61KMz5SPmsfpFKro5+Daa5VE8BmqtspssWBndACnzyHtiQlOgipSrJ6+Q+MiQ==
X-Received: by 2002:a05:620a:1a0b:b0:7c3:cfec:39ed with SMTP id af79cd13be357-7c57c930d34mr1948973285a.58.1742221032975;
        Mon, 17 Mar 2025 07:17:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da681sm16091911fa.93.2025.03.17.07.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 07:17:11 -0700 (PDT)
Date: Mon, 17 Mar 2025 16:17:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add RPMh sleep stats
Message-ID: <7mpqh3ggkjwrw4amfyycmcy7wwbh445scnmimdu7dcatovrmaq@wu34owyddfc7>
References: <20250317-add_qcom_stats-v1-1-016ae05ac4b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-add_qcom_stats-v1-1-016ae05ac4b0@oss.qualcomm.com>
X-Proofpoint-GUID: 2A9R9NLjxN7UUZ4wqSPlU7js1Q3n-Q7q
X-Authority-Analysis: v=2.4 cv=c42rQQ9l c=1 sm=1 tr=0 ts=67d82eea cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=u0qyRW6OvflAnhphvWgA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 2A9R9NLjxN7UUZ4wqSPlU7js1Q3n-Q7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_05,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=829 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170103

On Mon, Mar 17, 2025 at 06:08:41PM +0530, Maulik Shah wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

