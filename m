Return-Path: <linux-arm-msm+bounces-38832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B829D5EDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130731F2392D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 12:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497561DE4C2;
	Fri, 22 Nov 2024 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGK7fAGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2AF22075
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278925; cv=none; b=afruUK80rWEilN0tMQdQ/UWA5mTxU1yoMZFbgGOpMXHZqDOGHk4YKuRnzflbbdGStgN0AhVuWCmf/TqjSHaEk+jlr1/Ve+e2iQAW5Azv4x/o+RXzgTh3n+Qrt7vBbqbJb1IUs249rRKVqA43ZYfmydTbcdyugS3eBk1dk8OkDyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278925; c=relaxed/simple;
	bh=/bSeenWD6NQdC1PBVIiMjftf/dqROH/FvwdD2Hsyblo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PC0guNach6AyTLIkQc4nhPf7Xyq2p8Rdw61iK/tVVQ9ik2FS5d5XO8h/CBX3oO+g1o5VI3cBxM6Av6E+CSHhc+f4TbN0cvonXmQ73fSHed7UUR76T1jHga6yhl3PHua1F5nv9RZ6s5r9uqdklZ9Z8t3oQ7PN+Y9M3SQh+IVDfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGK7fAGG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM9Gu9T004141
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmBijtaeUIMD2Q4qws8xURzuS2h9kjPL7kzv3y/aSvM=; b=LGK7fAGGXMuDsXuu
	PbvILGJVBbxKQFy2xuPDyoq2o0SCdnKnqo9tJx8L0n096n4Vf+UzS9STZFTuvGyE
	DRdmf27hQeWcu5k4XIiIPG6VfiSACX20A3lYTINN2O8ud1ej5LPZIzt5kfixGS34
	VJonUSFLZL6rlV+lmEpEKXr9VdZNyHGhdJ/HTcnjt0xcSUdVFKDYJUZfmpjlR8dZ
	rdLUPo9tSREuHMxzMKRcZtYEs30bG9tSU4mMicXvq45zkB7RiCBScJXRzNu14fBp
	qZHrJj5tx8YonBIZ/zAmDLid7fs+hSYZpyLAzNDRWjZmVr7FKMBVvr9qFOCBT5cb
	e0ahUQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3fayk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:35:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d40a926b91so5235866d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 04:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732278921; x=1732883721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmBijtaeUIMD2Q4qws8xURzuS2h9kjPL7kzv3y/aSvM=;
        b=LG+g3vrhWuckt/QAG5Q98PeqMmfSbvG4ZcA9/TWCzHeOovhb/+lb5diVJ5tCyEQOsO
         nLmMrfQ9lFNH9A5KEa21T3yZMYbjrOYoJo0wU1YSQPQPRdbG2sPTt+45YD2ihugR+WKM
         am6o0qFN2mqbH8QnqGRDFnv+B72x+lgSos5nTgrzCkMVFETnptQeto+m0muaaLEi7Pad
         lMiIqb1BuqNUKXMYbrr/XoOGKYoWc+nnvZE+CQ4hT7ghPAHzT2Y8UXYuNW/voo3RrLq0
         s51Wm1/9QUA5o5h+u2o1Tf7aPsyaJ9i94DMxABFskHiEUFtrSI+uYrZz2DkkA9RugA9y
         MQMA==
X-Forwarded-Encrypted: i=1; AJvYcCVUkgF04UTw0LRTSolIvN2TX5xRFX83fDp8DYtYycu6vU9rZCh/UQ87ryUVJ7aKgn6Gp/0292617ztnqhVO@vger.kernel.org
X-Gm-Message-State: AOJu0YzvWc5cBOAYVFlUpWUuX/BG/TXu2yg5/gbxWeJony3Lus7ZWJNU
	30QqdlzLhIg+VRcsusQu9KpZd4cNu7/UTIOgqVNYSV5KVktgAnhBTznxwSPEwFD1gtbgkN4bBjZ
	07j0ZB7KRAahorxD6E7kGYZ+kZdrerFL1QVz4V/Dyf0Yut4aXXBMeNuA8+3F0v1yy
X-Gm-Gg: ASbGncsTz8H46J4p5JyZ0Ce55e4xHvhPFA6Z01vUaIdD2ZPePLCXHGUU4kuI9fh8sx8
	2Iykg/zXVj39ap9OmTpf1EHbmaV273Mh43PIyk6K8CpTD9y2TmMy0uIS/lkzHtbnIWybTmQJTTS
	tWNLirtnEcdRY8qWHjWnaP08AWVvwAh4kFTysx1Hgg4WZYtEbVk7EW6+f3aHhnQFzeypIp6zfwi
	pOLqjjATilKFMXFEIn8NFamxei4VRS3LKruG+TMArR28llwXgIzHm5ITL82zVsXpf9bB4PPr6kt
	TFjx+poT4dgr9W0NCiVqUS/N8rbGtMg=
X-Received: by 2002:a05:620a:6283:b0:7b0:6e8:9508 with SMTP id af79cd13be357-7b5144ad110mr161956685a.5.1732278921657;
        Fri, 22 Nov 2024 04:35:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8uIE6oiCtMgsiJkE35Zoovx430qO4c5U0D4F91/nuFLw5NZvdNcCQH20F0lI4XhKW9QuIIQ==
X-Received: by 2002:a05:620a:6283:b0:7b0:6e8:9508 with SMTP id af79cd13be357-7b5144ad110mr161953985a.5.1732278921290;
        Fri, 22 Nov 2024 04:35:21 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d02062428fsm754087a12.40.2024.11.22.04.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:35:20 -0800 (PST)
Message-ID: <bf27f92a-5fc6-4b09-8653-4ac3ef438d4f@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 13:35:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] thermal/drivers/tsens: Add TSENS enable and
 calibration support for V2
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        srinivas.kandagatla@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, amitk@kernel.org, thara.gopinath@gmail.com,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241115103957.1157495-1-quic_mmanikan@quicinc.com>
 <20241115103957.1157495-4-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241115103957.1157495-4-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ecah570J3BJ-gvNbIf08kE8GRuwPzXEi
X-Proofpoint-ORIG-GUID: ecah570J3BJ-gvNbIf08kE8GRuwPzXEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411220106

On 15.11.2024 11:39 AM, Manikanta Mylavarapu wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> SoCs without RPM need to enable sensors and calibrate them from the kernel.
> The IPQ5332 and IPQ5424 use the tsens v2.3.3 IP and do not have RPM.
> Therefore, add a new calibration function for V2, as the tsens.c calib
> function only supports V1. Also add new feature_config, ops and data for
> IPQ5332, IPQ5424.
> 
> Although the TSENS IP supports 16 sensors, not all are used. The hw_id
> is used to enable the relevant sensors.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

[...]

> +{
> +	u32 shift = V2_SHIFT_DEFAULT;
> +	u32 slope = V2_SLOPE_DEFAULT, czero = V2_CZERO_DEFAULT, val;

Please don't mix initialized and uninitialized variables in the same line,
I think it would be the cleanest if you initialized the ones you want on
separate lines and then declared val separately as well (and preferably
in reverse-Christmas-tree order)

[...]

> +	}
> +
> +	val =	FIELD_PREP(CONVERSION_SHIFT_MASK, shift) |

tab->space after '='

[...]

> +	/* Select temperature format, unit is deci-Celsius */
> +	regmap_field_write(priv->rf[CODE_OR_TEMP], RSEULT_FORMAT_TEMP);

"result"?

Konrad

