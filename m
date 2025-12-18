Return-Path: <linux-arm-msm+bounces-85629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C1CCA424
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 05:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2DDB30139B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 04:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77A923314B;
	Thu, 18 Dec 2025 04:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fP0onLuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fiyNSqw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D13BBF0
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766032518; cv=none; b=qkt5xHKLCMpF5lmmMBxB3PPQdQzRzWsgX4QDCV6UT6NaBtW7G+2BzF/7PHy6MExkOLuzM/Xw+RdkZcnuruikkAkKW7eItfhBNH6YOZzA8gN0v+WxTguXLqHvXp3fQxI8yQlG3fif4rrnYIiklJ1SyJf03TFzE81PtkfF73rpcJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766032518; c=relaxed/simple;
	bh=kZI9Yqb5V7UC8to6N7NuGwqyy2EAZkvDYUGnpyhkRgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDmxGVumU619XVWF187PmVSp67eUS4ZVenOGpRVT1rX6tI2Hl2IuqvBZTsEfV51qyQMIySASm6ekxSWMn+u5UIw+K/mboHGrXtZ1dqLG57/+KyAOrE+0hn5Ma0aAJ0wxbETvruO8Wba1Fs9kGPqw0gGKR488IkBsv/RkSAVBAW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fP0onLuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fiyNSqw/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Zjak2016412
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVa1CSdrnwECiKgBD92ojEgY2DkloPMzdJdWTxiJgtU=; b=fP0onLuDUJJhXHO1
	x67Bp7ML7Q0JOUdNQrb0XuKSQtJr1QffSzPfIWhHele244MYy7MQJaBgjmAZ9uvp
	T7fM3jOAtC80koxJ387F7iW9aK5wb4oH3r7K4N475Fmb0MtvRvBWfcjMsXy1xF2j
	HOYDUNNRWTzy5jX5OlnIn/lzZxARcWH9e8khZdi6d5Yx4kQ22YS4J+EOorsaC9B5
	GXYoriEStLlvXX4oU1Jkg3GT6ZNqLLwJq6HuHQwDPSO2TALdu0XWL2Ob3gcUNQLP
	2ua6H3FEa4gorob7WhYoWE3KYpJ9XFOoeBzPMiRtH6jJOfpyM2RqDHjjvOV2Suu9
	CfpRyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e32ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:35:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f79d6afso4109095ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 20:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766032516; x=1766637316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVa1CSdrnwECiKgBD92ojEgY2DkloPMzdJdWTxiJgtU=;
        b=fiyNSqw/jNNNhK5KoaTLxYcJ4JPwn5i4WMyvDN8LjNjOWCT3jZdnZYZHFA4tZKi1HV
         cZv/s2oi6DJVvEauTfOpQp+ALzM90oapH3vWu7TSAd33iov075dn+KTFLsnVg5wKRFET
         98MQKzZmFDygF2AgaLi6u3IHIvAcxhYBnLCwOF26OpmBQn/XHl+SxRfu4Zgays9PrnuU
         28EwT59rZ2ExNi2osyy6EzydKaiTTSKptV7/3QzAxsAGL5by9xG3XnA4VAFV5N1FI97w
         YB3BkC3I1uD0a/FMZFCiCr3/dNiyp6lGllH5lMV0Zu5n0mnHh335++RTw1q1Kf6NCnd5
         Fhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766032516; x=1766637316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVa1CSdrnwECiKgBD92ojEgY2DkloPMzdJdWTxiJgtU=;
        b=fLIzLE28aX4po4u7zCmkAqP2MROnGlwV8HvBStsbzM2oWq1Z2brO8hoIRYpEolRe8h
         cN/BZOH5z9qGMyE4/oV/iIymCLMHzsa6y754fFFcbswYt/m+bo8tEKiy10EvTZ2UCJsq
         Cn/L1IcbRumXxAmq7HXa/MJjriKaWmansZHPk8y1ZAaZOly7dLsc4et1msYTNfigCpPT
         LYVR5i1vNQmLq1tGdxSXEt9jF/M3r+N2wc7U/OEqYy6a96z6aiwlg3xvQiuxBV0MrP1J
         FM9Gc08hgQvWTLSBFE9CXUrRfg1lcsj+IFTE4isWeiMtXZ0SO75GsyAjr6eJD+Ky+jqu
         BS9g==
X-Forwarded-Encrypted: i=1; AJvYcCUjEdQwWQR/5vyfC4sxAZLA+PEgDgeiLBeDCoG8ReRgPprSLybF2yQ7VHu9q3y7PQcWaZj6sX2CVE5UqaP4@vger.kernel.org
X-Gm-Message-State: AOJu0YzmsVuvZvCRQGgsxG1yCoeIrcuHhFUNt88OWRp9s2VtUl5kJ/Sr
	fjcI+z38vbBqNxGJg6+bhP/PgaYEJcjgNuglJRgl/ERh3bwy74btqWZj4acTMzOZmsesQlY4xbC
	dKCq7TSzSy3Z6IfcTivZKM6GSfTmYAOlLjZysODTmfbbiQP6GrFHWhFxZzYG3SvHKGp+vsTEdE4
	SE
X-Gm-Gg: AY/fxX5L9lerdvOzfcLG1CNSvCDvGalyrgfjKEI36yb6jK6gGx7ssHnh3xAt+PE4sm4
	UkgFtr2hUSNa12FbK+ncv+c9xwbna/ZdUtDJvMgvzuMRvvzOBJUfvtH8vsZnnQnH32zV72CcDUY
	8RyATpPj9o++eGNniWgfuaKg5LulahEVSqRMO2N9Lcs7+V3ydCCElqehUDqYZcETZfytDhp3Nmq
	E5X8254xRwD/X8aM6/lXJ/2zpcZ8iKSc5Ul7dfh4nkTWakZLqJRihbPbMyuZgDG5q6NL7iRy7VA
	8YBW+YBtYDDTty4pLcHK7s3sZPQmkgArXP4gtGcXFHPfJpwX1w7vqohszrQHHIMoSGbpGIPvxyM
	/6A24vJy4yvkyCCJk78zdpLrP2opefXsDhLS18H70H5c=
X-Received: by 2002:a17:903:40c6:b0:2a2:d2e8:9f2d with SMTP id d9443c01a7336-2a2d2e8a11cmr13751135ad.48.1766032515646;
        Wed, 17 Dec 2025 20:35:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6J0UYF6kZQkNF6SA4RhFE8JUQmyNr2k3/pxnoOz/h5y6RtFTBnbE17xkiJ5Fq7mS2UUPf8w==
X-Received: by 2002:a17:903:40c6:b0:2a2:d2e8:9f2d with SMTP id d9443c01a7336-2a2d2e8a11cmr13750765ad.48.1766032515036;
        Wed, 17 Dec 2025 20:35:15 -0800 (PST)
Received: from [192.168.29.102] ([49.37.131.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d0ba4918sm9379565ad.44.2025.12.17.20.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 20:35:14 -0800 (PST)
Message-ID: <775169af-7e03-41b8-a451-e5332e1ef2fc@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 10:05:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qmp-usb: Set regulator load before enabling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Chenyuan Yang
 <chenyuan0y@gmail.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250905101243.14815-1-faisal.hassan@oss.qualcomm.com>
 <vda7dcqqfudhoiwbe45irfab62vbn45crfsc7smenskebuteon@rcutjxrfbwrm>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <vda7dcqqfudhoiwbe45irfab62vbn45crfsc7smenskebuteon@rcutjxrfbwrm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAzNCBTYWx0ZWRfX5t2u44CFWa+c
 iV49SA1ECSpENeh76Q1l8l760keiAef1O2PcFHmDJKPfQ1RxRDIZeoycbePxeYQ6aAi6TmUzt2w
 KCDh6u9oYFSIPIKumPXKlboLWihYKxjVjH2L10awwfgQH/Bx5qWyhv0lLm09EpsAE5gyqycsBVv
 ba7Ym+V9Do5lNtrdAbsrvTPmvHVWNug34840VnVQdrIwuesbVGG8E38H0Y6oMDP1zkcoSuYBFUI
 G+0gj89z6i12zbw3MGy78FByXfGK9dQOOGaUq+I8njwcQqUGYsKjZX2QHsq7WMxeWabux/3h2xZ
 7gesRwPfBgtFdrkdbno4F422tQguUBFDkwX/GcHqgq5CPtwQMhIyXN68HeID56EUx/EhmOPi4Sc
 ZNv6o/BNEvpwCujI8JV3SguzQ6mHxg==
X-Proofpoint-GUID: x9byfSMRlLbfuDwHfaOzoQJxx0bWNT1Z
X-Proofpoint-ORIG-GUID: x9byfSMRlLbfuDwHfaOzoQJxx0bWNT1Z
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69438484 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=+Guiguxn7m6EIRRCmRy/sg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TciNa_F-WsWcV98tV7cA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180034



On 9/5/2025 7:16 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 03:42:43PM +0530, Faisal Hassan wrote:
>> Set the regulator load before enabling the regulators to ensure stable
>> operation and proper power management on platforms where regulators are
>> shared between the QMP USB PHY and other IP blocks.
>>
>> Introduce a regulator data structure with explicit enable load values and
>> use the regulator framework's `init_load_uA` field along with
>> `devm_regulator_bulk_get_const()` to ensure that `regulator_set_load()` is
>> applied automatically before the first enable, providing consistent power
>> management behavior across platforms.
>>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 27 ++++++-------------------
>>  1 file changed, 6 insertions(+), 21 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

Hi Vinod,

Gentle ping on this.

Is this ready to be applied, or do you need anything else from me?

Thanks,
Faisal

