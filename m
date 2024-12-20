Return-Path: <linux-arm-msm+bounces-42962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA69F9012
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0279C1891053
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2271C4A09;
	Fri, 20 Dec 2024 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxWqrbI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6241C1AC7
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689828; cv=none; b=mZZzay08NHNy9SaZWA2s0xULlfhfZfDnpBRpYUNZWAXk4hXduDNcHDA+35a7QCciZp4biiTLFPD5CyfOxgBXwqCfjBMhGcMv4LEFx7aDch8M9d7Z/4t1AlKo9vUzlYhK8sIQLxNkANbatzdosQeLSIM4KpM/eJ2Gl3S9aIGTUuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689828; c=relaxed/simple;
	bh=dpyekRfEEuYHq+Q2cMWXC6HhUthVTFXuEzDEP9ulU2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReZhEjD0AURME8uZwtAjrT6t42ejvAV7MMjpnqHhK2bVRhCuZ3UDKlLME96avQ0wPTrQbkNVk0YxQqTmlfjPuf5W3cUwjJRhyaixs78wWE9dceYMqGcVwoZpWikVCjz2W/tK24eS04WtJl6TMD+wnE6jarPviDHsK+9i4P6BHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxWqrbI2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7LhOv029450
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/mWcyc9PSpD3cCH/0Ahpmf2yDEfveb9OVwcHH2HhT0=; b=DxWqrbI20UOSakCn
	Nsv0liTSK1fHfnSQdkXO1fd7bBjvImRv3tnZQKohnMScfBYEKNfPbfYdQ1z5u4ar
	8kyNdx/Q+NRq6+UgbbokFafkHSydyTqcHxk5feA9rDrZMDCwKwa8IPXLRyevws62
	EHjz8ZL0lgTsztsBs1pAYoeFXjcjAR7Eg1mgH9jgTl4XgonV6VDdVG39NxqBUccR
	rFXuiPp5bzqWleKm8f2UzY0oxfxz+BSbJOXgw2nM3zUsgOWj4JA5Moo5IzvvSrXB
	hA43RP6wGmNE7Nwsgzc3JaMIQMrHkO9DFFFQF3tLFYDfgJNCIsUgQ/Ckp7xbR9hs
	9LYGvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44fggp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:17:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679af4d6b7so4558101cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734689824; x=1735294624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/mWcyc9PSpD3cCH/0Ahpmf2yDEfveb9OVwcHH2HhT0=;
        b=YpUjbPIi2xerGYl/L8bvYRD7kf0JlCEZNhJr0tzVrT2sEok0W44t5weagpQ98GzBtj
         m8AzcHo4kBjkuUCSAKU1lIhb8lkO2fzmK2exs2Dnc2M/IQn+JMmBvBpZ1KrJWMhhpTIv
         6GbK3pzClY3Q5VpGEfvpSRJzKG9HK3NBsCLiMwgWQ4kxqGGoiOcBhW65sRvfGe9VtzOJ
         7DfYMHOAKvv2in111UOq/89zJAvgta9qe80BzmZxAKV//8l8rXez5x6KnZafY0sc3zt+
         0TRSjW2oB9yqOqD8Yk95lcS2pBxWOQQys3F8Q4zIDd4LAxg7I7Pd9OgrmjUwsVPmsrgj
         52gg==
X-Forwarded-Encrypted: i=1; AJvYcCX0X3EW/tU23QvmkJaV+6Uww0QZg1g0VeqONNSZJY7a7ELXpKeWNZ2rbJhXRSM+YvqfbPiGtL0TsawBaNr0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe+UVVFyxyMRCQkv9H1cMgNWR584E69yY8SCLzLwq7fylQ2ZJT
	ik+l4yhaOCucMygxKxRrB0dP+7X76z55YB5y61/vr4mby4BWLb1Qw4OEC4+csIk9ac/MJ1Zccxu
	GxFUcIgaDJUp3Pw+YNGQ1yldYVvzURw+6g5MnGKcnMFrleMSbwB9tFmydYzIAgNjM
X-Gm-Gg: ASbGncvg3uCI82vsH4EH4y/KIS2SREKD5Ij0TmYQNVPAhOarkQ3+xFCo11HRNup7tX4
	7lRfSUGDM5GbdGAOwls8jmRmpJCIqBFPw4F27TzcZ+imuU9ckv6V2kS3EOKMve/ZFW/DyMErQ9n
	AFWrzCFKl1smWTRr2etNxrI5WLgpmpb4Qnz5CXLCIrSIKW6lpRMHL8YISoJq5sYQ5dQ1a6gyZn7
	024Cw92TZWazHWT/Ml1fFnYPow8qrtF2LXjPJc9a/6QUFryCbtT18Pbcbp11mOA1hFaw7S3Qmox
	CM8zPaAxufHXyoqXs8FDPU2SYS5hDP4mHTQ=
X-Received: by 2002:a05:622a:14d3:b0:46a:312a:54d3 with SMTP id d75a77b69052e-46a4a8cbf47mr14269631cf.4.1734689824255;
        Fri, 20 Dec 2024 02:17:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTTu/4H6/KMrUaTlWO8zj44laXUXuji5sXvxSpCA42Sd1+lO0jgLoRuunnQ5f1OzfWmVhKew==
X-Received: by 2002:a05:622a:14d3:b0:46a:312a:54d3 with SMTP id d75a77b69052e-46a4a8cbf47mr14269401cf.4.1734689823951;
        Fri, 20 Dec 2024 02:17:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4922sm158207866b.113.2024.12.20.02.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:17:03 -0800 (PST)
Message-ID: <525056b2-09b6-45ef-ae38-718af8d6b76d@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 11:17:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: qcs8300: enable pcie0 for
 qcs8300 platform
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org,
        manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
        bhelgaas@google.com, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_qianyu@quicinc.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20241220055239.2744024-1-quic_ziyuzhan@quicinc.com>
 <20241220055239.2744024-7-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220055239.2744024-7-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e1f5ssps9C3kCKEQDpk331yuyvvn6CIF
X-Proofpoint-ORIG-GUID: e1f5ssps9C3kCKEQDpk331yuyvvn6CIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=691 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200085

On 20.12.2024 6:52 AM, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe0, board related gpios,
> PMIC regulators, etc.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

