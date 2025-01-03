Return-Path: <linux-arm-msm+bounces-43869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19340A008DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 863987A1D8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3101EE7C1;
	Fri,  3 Jan 2025 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3pswhuf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7791F9ECC
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904813; cv=none; b=bhe2Lc+nIxxgrpOoCJPn6j52KyLyg0p9DxpClL0XqnmC6nR6oZm/0tFTEGS+tMh7qkaDJLpIqOLvu4HiQGlyeuBnwDeRNUBJSEZmPOUPlpduyYE+V+cmeug1IqkGUevT+FYjrkag3iqUwNvae/iO5Cu6fzYFerx48sVdEkoe7Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904813; c=relaxed/simple;
	bh=qsxVMo5JWpz5OGrYTHQct2hIenf6onh7s3UZU9UwjmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=du4KpuL8y9Z6meljQQtEw+3m7N71PhyszQZtPq0urXbiBukJeZrip6BljsnZIv8F2JdALFsE7JwJKJJ/Yr3c5+JorXZbXJGgfuliaUtAjYpnwcPTQLivTFeVSrFFBK3d1K4hmszEIHdJ/yRIfQY/6qgJSLKAT+X5bZWJRMJhLZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3pswhuf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50395Oq9013228
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 11:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PAEhP8UE05fQxF97K1IDja7FJ7MMGL08102ZSAbOrK0=; b=d3pswhufyWF1Vye2
	RWwkZ6nRF5wy+RQJPXzbHzzyFSNiiswil78wp04O3Zq03UpvBW+KxfjuyVRkQV+T
	U+gwqZQA8vtUnSP/kr/KiGCciPF1ePN741ls767Je6FstVzdOPv6TvYxf05o3BbB
	vQEr93V6z78SyW6GfnTtpfGq+ucyGpdNDz++vHwmQT7pxkPTYx4yXmkw2ScM6Jzg
	owIUS0i834ujScZEw4ZMuXSnQo3aHjVUvdwka4P8+yBhrsZrInPWrflBiFkEeByx
	SNlRRKt+tlPPAZcPSkHsRPHtU6b+0zsInn3uhVmEQPpi3Vsn9OESnvIxyrXCkS7l
	lX7ZrQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xcxp8atv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 11:46:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8824c96cdso42147126d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 03:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735904810; x=1736509610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAEhP8UE05fQxF97K1IDja7FJ7MMGL08102ZSAbOrK0=;
        b=LzAh6atM+5UqVa+F4MSPhDA0hReoyeVUE4J3uzhZH1BEsiFf3v1J51Nn0TfMscFuFS
         1xsbbU/HklEGGIcupL//2ltOpjwcNCe23fVNCKvkrtngYMbGGRITVHZC2P0L8/Rk4m3D
         khgfKsxgY7yLpAQVHFc3VlLmwmLboq0pMTjh5C8aG582QP7gNdBUGqfGDcBZknh2kLWb
         0Kxe/kM+9NpktGxWC8YbhrLGL7LCr7i7dvDW+fIhUEcSqthF7ItYbOhfC/IAy2aPb7Sq
         cNKLk2FNawyk1a1Jerc8AIZcuOvrhtzINwbcCqcwHesOK2eXnmSsxuS6/LbSwA2twtH8
         yzFg==
X-Forwarded-Encrypted: i=1; AJvYcCUEUTtgg3r9n+4dp6iVFX5TIbDF8hDApZDUaxivJD6d0aCBvEvMku3b2fViqPHJ7jgJzhpCODl3/nU2bHvz@vger.kernel.org
X-Gm-Message-State: AOJu0YzSQO3oLFeI4qESEdh0jZlwRu7eFeFVeRv1QHwoEdwLaZF1YNnX
	uZe2KHscpA2E/IRpeOl9W83b9C9FxW7+wYMRyO8ba1jhHn2VXOAV837NiHIh+SMNOCjvMzkDwVC
	K8Sk2wDvOUZUROIIJYA6b5SLsGC5qNoqjgGWkCnOi6XLceaY0GIWK0sVh+oFZN91F
X-Gm-Gg: ASbGncsmJd//1t+WUvsnwE/G6+WYspqX5/1mzRvqow1w/vQ9CzNHRKS6kA1cBDu6s58
	ngcfoNe2HUZt2p6Wt+T6eowM2WcvnSm9mU8vJWmGsURKkIrIOfIUxsFWUbqQeZekHQYzevo558c
	MKW9Zab4OlCFc2UxeP3zWSNP2aJYpPEASbDGGgdPYdIlzEVx30pXqCX02TqIjF8yjgrhWOtUJ/J
	xmqLDS2/QV9+4WtF3DJyeITclM4e8X1QaazVi4WI0yUhgMEqex75uto/g7o3Y5KeW8r90CwzKce
	oW6IPjlG/6Tv/S+BWPC4GgrbzQw7Jkt7tLM=
X-Received: by 2002:a05:620a:8005:b0:7b6:5e36:224c with SMTP id af79cd13be357-7b9ba716af5mr2740043985a.3.1735904809790;
        Fri, 03 Jan 2025 03:46:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGkgkHEXHgJB97KC6g8ncpRmzgUuiK1vzhINpo+hNCP8WWHql0hysgKibRKEugtw9zKaBQ9w==
X-Received: by 2002:a05:620a:8005:b0:7b6:5e36:224c with SMTP id af79cd13be357-7b9ba716af5mr2740043085a.3.1735904809398;
        Fri, 03 Jan 2025 03:46:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaef76c461asm1301650866b.125.2025.01.03.03.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:46:48 -0800 (PST)
Message-ID: <848ff34e-6d8e-4e53-b4e0-5e534836c67d@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 12:46:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Prefix
 regulator-fixed label
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
 <20250103-fp5-cam-eeprom-v1-4-88dee1b36f8e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-4-88dee1b36f8e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fv0RRZuvHFrSsE64HyihnIEUu73WZnMy
X-Proofpoint-GUID: Fv0RRZuvHFrSsE64HyihnIEUu73WZnMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=966 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030104

On 3.01.2025 12:12 PM, Luca Weiss wrote:
> Add the common vreg_ prefix to the labels of the regulator-fixed. Also
> make sure the nodes are sorted alphabetically.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

