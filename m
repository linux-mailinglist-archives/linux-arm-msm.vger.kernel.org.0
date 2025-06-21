Return-Path: <linux-arm-msm+bounces-61923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60006AE2863
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 11:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E46E616893C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 09:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FC91F4607;
	Sat, 21 Jun 2025 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtZCrM97"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06D81F3B97
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750499006; cv=none; b=n0WlmVWXCS5r+jswu+iAWxJTfwGFySH+8wCAtX1etBahqc03dja/QiWkniiflKnuvy3PTRGPGTX6EgxnhuziTqm0IyN5oGVsOi3QJEdJjabhZ4H3OHZpWuQXaaG5WOLCXgIkgTS0kPBe1Pn2mzhtsm9lzUbjbxyBXreLxzk//GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750499006; c=relaxed/simple;
	bh=Eq6AbI9svxvdRWlHU6/Z17Y/ciqRWcpbrp8/qVkWxUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZhy4OnwPmPuui9JDOaKAx/C9GUO1j0Qu/EPGHJjWVHr1Uz6yVWV7als2CsZWS7RNFSVaBW7i4+41lXfmLLVaQ7OdcKPDpOLqo1ddhxKzNNboq8jJFsMnNifIIG6/LbkNeaf2PZZFwQspB1YXTmeHQud9B1uutu4WogmBz/6YSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtZCrM97; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L8SK6L001943
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXX/nIm40ydEKyVs3/m/xeCNjeguyIaR8bfex/MG2eI=; b=VtZCrM97WnpWVuV9
	GUoT/kV0zfcfXYFx89VPNApGavL3IXsFCiHN2hUQG/sPjC1nlM1WMXrKNrARyCJI
	12ATt1f17vgzT5sHVIVFrDy7CrTMDYq0fzI0EyVm4X7O/iDrttvAW9Unhst/zewS
	50N1kW7JIYYrvgizDXEUyM1VGSnrU8Hn/Z8d7m8OcNOKfZQYtbP0DDnDQe6vnQkX
	zF7h4OEPCBP9bLvnAkXGpiefOEz/1eO6Pk+v+rEAfqbHvPlC4eX5qwvm2/9WZf1V
	M8yrGEanrNX170NxuYmkJKl/KHhPkP8n2GSdb4CpmiIIUiZdWY7n5hf4UAHVqD0Q
	mDMhDA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ds7s02k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:43:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fd202ecf82so159076d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 02:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750499002; x=1751103802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXX/nIm40ydEKyVs3/m/xeCNjeguyIaR8bfex/MG2eI=;
        b=qqKJCs8gh3poUYWq37OFUlRgRPlsOd5ES0D1f4aa8BG5hDl3X5oczjKqzJBbYgCV23
         EPKYIKUyUt8GkX2QggnpjNReQtPT0+1gjujWpq7xa7fTEF0ZzMn0+vMU0FfSvtqWmyru
         dO2vEESwVNiZgwDhF0oDbmAadoeWiFCfneu6OznHdYKCVlDpSW7fcmcuLVgeSCOzkJfK
         QcKPT8LN/rMycKyh30EHfmy0reE/1Pmztt6Xaa6YllZy6uyS9EeF21mc6sWUVTkeu1hA
         4twXoDaEtFi/I1Mu+HtwySOYCvwRRU6VnCn7VbXrVydkD/SYDFg1UP1rg4OsszIe4dm3
         TllQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH4oiKJ9YecJkCvQ/JAFPKqHhsoLqlKI7tgb+vaBt0w4yjYa88xTopFrbajUokPTUMr90JTRdvcN07I8QW@vger.kernel.org
X-Gm-Message-State: AOJu0YzWNnQs0w+UHkmNI+gGObkE1gTibycPZt0euZhNKY7mQtlIM8Ib
	dzxEniHjEy0Eal2ifxCr9F91BEsUK0m0xsLtTE1MtaWl5lkUmNPT/C9F7WQzACYuYEx1kaUHoEs
	9Mh7uB4lT/huqc4bLLgeF2iePgSNEnsAaWLkKKarCWKyxvAHojGOO4lkhmy5vlhMo5/jf
X-Gm-Gg: ASbGncvyukQgUjQXKmeNwvNsQDCD8OL0Yuq6yILL82DjQOk2i9InIXKIc6oUd9By4na
	EskZC2yESzvcvz/7XjeO52mKnukcr3BZ3j203BzRfd1XUat7dhDc/GekhRqOnuGWtnLtRqryrpG
	pqE+7udrWkAtSYMh9ERIkOABQCmR5y9yQaBHEsfcCQt1EeUJlxCoo6iNg+NHiDezsKT4TGMGQ00
	zTF5+O0cGXJqB1B6Q8a+SzN/ik+8hRhuQ7kJ8LZEabf51ocyqQBM9sFG7ERbbJ0QbaWqWDGJgIE
	jbcJcy+JQJ8IFbGXVRhX4zjDkSQah31zN03jkQMoHMKOS83ZdLVUz2dz39ImELk3toOOT1+Jr7P
	f1oE=
X-Received: by 2002:a05:622a:1aa0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4a77a21e46dmr34837891cf.7.1750499002489;
        Sat, 21 Jun 2025 02:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMs3DMpojvSaLfHoGR2ZZXOth8bQIUjYHkyAWr22xj9mQ0gp5qHJrVSftHuw7FWFnQAMZAww==
X-Received: by 2002:a05:622a:1aa0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4a77a21e46dmr34837741cf.7.1750499001983;
        Sat, 21 Jun 2025 02:43:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e80447sm331198966b.6.2025.06.21.02.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 02:43:21 -0700 (PDT)
Message-ID: <c9caef81-deef-4360-9ddb-a317402495c0@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 11:43:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] thermal: qcom-spmi-temp-alarm: Prepare to support
 additional Temp Alarm subtypes
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
 <20250620001918.4090853-4-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620001918.4090853-4-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o_6YgEjY71Ig7NsL5TgzAPgY04j-I5dg
X-Authority-Analysis: v=2.4 cv=cIPgskeN c=1 sm=1 tr=0 ts=68567ebb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ryWYcZWYGYbgHTkFvRoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: o_6YgEjY71Ig7NsL5TgzAPgY04j-I5dg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1NiBTYWx0ZWRfXyVS3MSl511rw
 O+t0gbQp9IkbzFkHKKMvIIhHroVKPXh3E1Gurg1CY46O9b7r6tMToohEfe5IxyeWmadPRHXGZah
 CqzoxftdtyvEIDsT2+vTeJVsL4gFFWKLZQ8OMoZFGl01X4sA2T+FKP9fCg00k+XFtSDcuolxvTu
 bZy8R1ARPunrf+eRgDbzsSBFCJ6QpVPUEexdHCvpYv9T7fBca75B51lCyiSTu3zf3WucamGrRZl
 ooouMMMDt+/bVQYz1oKmz0qymEZe/kw8gz+80ZklpUeD4qEtkozlExVdKT22P6lmynR/Uz5PqWr
 wK55xcE2bRoztraS3GRZEW8cW1FxaJcJr0T+/Aaqmw8gU71RE5CwXVHoqVYng1sbWg1BsIP3F1D
 DLpibiG6C02t09W0D8m61SdGlgzfvId7hHwoo9EiTRjmD4fhB3T975Hg4A1GzDeeJROHyVnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210056

On 6/20/25 2:19 AM, Anjelique Melendez wrote:
> In preparation to support newer temp alarm subtypes, add the "ops",
> "sync_thresholds" and "configure_trip_temps" references to
> spmi_temp_alarm_data. This will allow for each Temp Alarm subtype to define
> its own thermal_zone_device_ops and properly initialize and configure
> thermal trip temperature.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

