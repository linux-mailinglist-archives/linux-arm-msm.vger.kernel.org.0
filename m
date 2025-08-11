Return-Path: <linux-arm-msm+bounces-68270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00793B20237
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7FB2189F7E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 08:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4462DAFCF;
	Mon, 11 Aug 2025 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTcq147/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BFB2DAFB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902231; cv=none; b=KshQDwN8Khk/odA4LKcMWUhvjA+o+XJ2fpgKGsmPmCEj6Ee3A2E1oCOKnPB9p/kowACryrBUdgdoZyfNFCtTMd1nlFaMBCrDHQ6YHLypjp5jb2hT/8zK4yoSmlyPp7qPa2qHrcfnngEZy/oUwsLeBEaMEx2pyClxcilN63slVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902231; c=relaxed/simple;
	bh=CPGYrDDgQzIYUKiy0aUthSOA854YrLJiY4efajvuJCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fx/OFYGenGs87nH/3XXR93ExCdfr9JWpEngsxY+u4cWtnXSTPHiUWp9XzCQzWX4OCyzLDUlQ4kTNeieA7bTG5Q7t76/CL9UoCWdn9vphZf0fRisdnoBnFhTymZsHCKKD38R35sdvosHFScIAR6R0bmiRus0VVabMYjZu/BKumCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTcq147/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57AHvZM3013404
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 08:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CORAd2r8QfE5VI6wSh8ExS3y5u32gjUiHVIBXtOTHh0=; b=QTcq147/b9gOi54Z
	MsLQigOnChXxV4MT8/Vp7U3F/gzGF0mARNbqo4TOEvFFpWzEFX/x9tA6Zig0Ah3a
	nZ4q+4G6/5DNTBG2qYY615/5wAQ/2LAKl4+BESCUTzgOEE+QvH6ZgPDKaaUYVUyS
	5GH4s8krsaGl8NdmNIrXbpDNaQCxHvb5mzjWlEwX2SDyBVanR+Pua80YD04ivzlw
	jSllyohKLQmoiF8DOAIXF18iKiMEwU6m3oNcGUvcPqatsrv0GHO32ajVIJMm2epy
	J/QxiHIV8OjJmV25BjxZuaE3UG3CPMjN5jdvM1msmPepTagC7EOQafQnm/vDvLTQ
	mepANw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj43pr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 08:50:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07b805068so8944781cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 01:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902228; x=1755507028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CORAd2r8QfE5VI6wSh8ExS3y5u32gjUiHVIBXtOTHh0=;
        b=G8yD4Xb/Xcf/33INp6EpNdURCEvyJHtR2CBW+YE9AkyGZmsbQlyiaS1o6iwc1uzhCa
         R912Jqk/hbpG2HLeFG01qLUOI6pGcDQxsFY+1+HQnxtuiJ8al1J46eKyLyX8NdLym0Qk
         p8D2wi59/1JpRy1ln45cxWt/Nu6hDgKFRXzLNHM9jP//bPgMOFQVaoZos5sct1HSbQ6i
         64CHZBfat9I//F6CciUcagHU+Y+69rWrjOO0BiCFZmxT+QnchuIKD/DAokUlJPkIehdA
         1/KMuCBAcl4CqmB/UAtBuX89lfRoVjzDmptr3Ft07hq+KKyBpwEZddJcLhZAK/l3lNvU
         5zUA==
X-Forwarded-Encrypted: i=1; AJvYcCVem+HXJpL9N1Hhm8f3xa1NLb3W3fyF81CYie2Z41QnRs/4wOBLLPMVvxL70d1BZLkss0TaTDhOfwnwjfAO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy2Bqm3CalsCuHmrHNa6uHu7ijgUMohNmKEfAK+gkjd8kFPtGs
	uP6NGr5QG34Xpo1WN6bBsdNDOsA+Qvb5hxcFoIvNFnwnDoHrLwvQIbuDLaJfjEF4R5qd/aP9E0C
	YIhGdPPw3B+ESgvULMbgOdIwpPcT5Di24VCUGxWw1a8IZQdtZCXhAlEu1o5Z7l2BTovN0
X-Gm-Gg: ASbGnctSONT0RiFBmrreCnBL4yqbTJsSdk9IAvlfcXOiVRCUNvB/idWltFve1imkc0C
	F778lpJtDz6YHPJQjCPG19Y9SY5/3QxQhx1fwxpTFlHyNVLHH2Ijh/aMJpcfMcP28ggQFhaS5fl
	JDEnJNVQa1FMiv46P9VgZATx5foinWjdDgLCfDyeZD1ZBC2o0nb1LMQpbfJWyvuH4ryHY3B6grR
	LKSQKzcBGbB2bTJ1yeDhTxYhsZSZ1jZbCFnaTXrLqU4Hnrxv6j4Hngt6Ku4YFwvj1fx2iOltV/f
	DGM/8/iyQQeegUq3A5ap8AKGBysJEWhr3f21q6M73O9TVrkrr9dvZfb52a5kp+gEKWD0QtVF4qU
	u8aeOP40pANGZavYnsA==
X-Received: by 2002:a05:622a:1ba1:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0beb027a8mr52893971cf.0.1754902228381;
        Mon, 11 Aug 2025 01:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2gL+G3g1eE6R8szJqv85HPPf+VErr9fLPtt2IIDrlbNUHP7zeIYNUyGibJo//rQDUPs1VWw==
X-Received: by 2002:a05:622a:1ba1:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0beb027a8mr52893851cf.0.1754902227923;
        Mon, 11 Aug 2025 01:50:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e820asm1977227066b.90.2025.08.11.01.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 01:50:27 -0700 (PDT)
Message-ID: <cc24ea01-549d-43df-a3d0-62f60c79d5f6@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 10:50:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] spi: spi-qpic-snand: remove unused 'dev' member of
 struct 'qpic_ecc'
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-qpic-snand-qpic_ecc-cleanup-v1-0-33a6b2bcbc67@gmail.com>
 <20250810-qpic-snand-qpic_ecc-cleanup-v1-1-33a6b2bcbc67@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-qpic-snand-qpic_ecc-cleanup-v1-1-33a6b2bcbc67@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXxd4tsgYi8oPR
 Yss/0P6XgJGrb7zeSHJXRVcevq3bhpLmDjILaGIiFsIJByFTGKn7qT+tjdNTOhv4GWaqVSaM7w4
 ggLJj20GaVzCG5r+E3iPXxyYssb+Hq6YciX+nMz1AZqfwpNuKEACs+Bkzk2HKh0gp5Vmli8n64D
 YHdAa62w3wN0n6APTZIedrsmvVPjdKQwDdkb9NUySIroYiVueQVqw07XRXVakmQGD30hAljwRHF
 +zHHKDQqhiiJFFjaYInG4WRZgSYnanv/Kavg0g6XFbsxFtUM5fRmCkKQkqlrbd07sxwGQSGE9Tz
 K9Ip2X+H/ahndfa9WZ6GWy9Ra1FnKn1mJQLd0XbWsIzsu+M1LDQzr9ZbOrZZe/ivWFEmV3ctU12
 fTsr85uy
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6899aed5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=rbI749AxHwL34t2NiqoA:9 a=QEXdDO2ut3YA:10 a=bDEiuqbIbRIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 85yecpJazdycOT1LkIahvuUI3L_SWDQI
X-Proofpoint-GUID: 85yecpJazdycOT1LkIahvuUI3L_SWDQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

On 8/10/25 4:38 PM, Gabor Juhos wrote:
> The 'dev' member of the 'qpic_ecc' structure is never used in the
> code so remove that.
> 
> No functional changes.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

