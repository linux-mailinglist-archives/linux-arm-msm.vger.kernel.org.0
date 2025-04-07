Return-Path: <linux-arm-msm+bounces-53342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF2A7D853
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 10:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 656F03AC6F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 08:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F34E228CBC;
	Mon,  7 Apr 2025 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eskuvMgP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338A2288CB
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015431; cv=none; b=ovoP26IU/cqpwjCjzfvAJ6+RXYJECx0HpaVyJQESHW8F8my8SLBNhUyPXYI4/xpv5Y2zEETpreE3R6WORDmK1qiNLjJVNml5ThhmHlLtMkGnwoj4usfZyiQE7FWIG/Bo8berCZqthE4eHayi7/net1WbDt7u1NH7btdpua0eYAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015431; c=relaxed/simple;
	bh=keeF2gzO1BG5TWSeisN2mF/28JltLtP+6/MPGcZqXK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXTLsDw63p9ryD0J7x0cyLI4xH1uU/wlzudk9taqKPIxPURAcxT8T2OE3cmfRQeusNgwwbt/lWrqZKL1H3RvyHms1T5YUu0XV0F2lDMFBOfDNakiSoEBjGqlTuS1DhQ+/8vuooqyCp3yvgzYrbUD2GUhIHMlLIQzYg1PWhns4d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eskuvMgP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dk8g022325
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Apr 2025 08:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3LBZTe8by3wdJUm3j4TfqVrMn6/WCYmbjyVJqI9BVQI=; b=eskuvMgPTq/478q1
	aQrcm1nxa4BmpCqiMspO3aan+oaX57dgYk8O3sZaJSJ/GfvuXof7lncClX/UqrLE
	i7LggPpgmUzsg+cILKjgk6TbgDvXNEzqD/K+hVjjnSxD3LcIZhrta09w6OG/yL7h
	FeEUUwtyrQepSTHAyZd/zD5ItJVRoPKQ/mpqNnW4nMS6jcr1g+0DFZaOv9hLsSoh
	3ViF+iGeWObcIeLR5UJEio7DAHMcJfAUak/5EUgJABMyzlIkwnvvAu+IairodlNd
	QoYecjWf9Mq1DTw07kU/jroJLWRBOVk/hVnhnJWFUIdWKRB9o8lnV4PD7ZeTzxU2
	FSzYag==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrbkxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 08:43:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeeaf707b0so2985526d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 01:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015427; x=1744620227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LBZTe8by3wdJUm3j4TfqVrMn6/WCYmbjyVJqI9BVQI=;
        b=ZekLZZb92B5AW56P5FpHbuFkEZnoIwp6Loahj/sPmNChSMGLGOAa8lO2gboN9Spey3
         kpTH5h4bHTU99wqJpznL3F1+1Eh0TGItpRCK9S5l7jv3gybGeewqDNnIHbOMMv2sSlF3
         kY+nMPip5ugzcGgflC4D6xvVIsnEVMA2bKV/XD+4AqOH2+dH9W4AMt+ydUep0QCBUKTj
         bAJEuQgqYRIvzbfZQH9c7nwX4Be/pHdoKDljw1Tna3MuUZq1vgKfMemi+1bdjzFZUnt8
         mjWcDqLOvVqoX2n2+4wSVIhAAEa2qWIWkSb9bKJJ8W/yTsLKpYoFpGJfIuJOG4B7r+ts
         tVbw==
X-Forwarded-Encrypted: i=1; AJvYcCWyGDMXSvIXflNqAwVwXQg6gCLeZfoWPSZ0fK8fvSJBvHCBbK28aEj8VUHZ9/IiHXaBd8yM7iI6WylnWBAq@vger.kernel.org
X-Gm-Message-State: AOJu0YwGeLlp29dqSzXh7SdAK2uIB0f4HNE3Bxjrkjwqcd19Hczf1nBV
	kQaMy3E9HP9Enz7w5tavbYJrjX0bHyXi9UTEwaoKl9lDDS7C511FxZwYuj/WZe5P1Vc/avKvxu5
	PCJuKPMuwxD0ZWyNHFjT98wtNSJkezuyniFeUN0NyNu8W9BcTwS9UyXbiFgOEmfEW
X-Gm-Gg: ASbGncvV+jz0pNIz74cS7TGGxZlvjOgmorFRVfb6IJlyNXy9sT1ZkoeUWsMyUJYa823
	p4C8Fy/y3g8/8pKvrmTs1sLDU0L16vvVfcUqGPXMIAjCxjJCkoGvd/Jytvf8huOatB3KwMEtIBC
	55p90Irjp/xhSvkhnDDC5epQd7oxJ7PtwVqP7tkT+uVX1JHvUQaDCcuHQPFyNzRQBUPkm7Q4FH1
	GRH/pw2gViThy2RSydDTxefUOmfcv9xbZ8eBTsSByQ/9ZHXsDmcYqJhWDwmVEV53XeN6Ifq958Y
	sJUQZIkYpCwVvrjw0S/lwh0S7aYtGvoy7kWUM3tSJO+hO7HJ1hKnWC3fKLQaOMtifT02TA==
X-Received: by 2002:a05:6214:e8e:b0:6e4:29f8:1e9e with SMTP id 6a1803df08f44-6f00214d08fmr68496706d6.0.1744015427741;
        Mon, 07 Apr 2025 01:43:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFebGzNDRB0fY7+hPc7f12BLxECnTU/bMrpcOZJhMDdfXfqIZ/Ci0T8pDYTDUbni8F9lrsXA==
X-Received: by 2002:a05:6214:e8e:b0:6e4:29f8:1e9e with SMTP id 6a1803df08f44-6f00214d08fmr68496546d6.0.1744015427351;
        Mon, 07 Apr 2025 01:43:47 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f34dsm701813966b.87.2025.04.07.01.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:43:46 -0700 (PDT)
Message-ID: <9eb0b21c-6830-4636-8a92-e174e34d779a@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:43:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/3] soc: qcom: ice: make qcom_ice_program_key() take
 struct blk_crypto_key
To: Eric Biggers <ebiggers@kernel.org>, linux-scsi@vger.kernel.org
Cc: linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fscrypt@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Axboe <axboe@kernel.dk>, Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250404231533.174419-1-ebiggers@kernel.org>
 <20250404231533.174419-2-ebiggers@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250404231533.174419-2-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iBVtxbiTf1rrDmFe0Ihou-b1aJrbWS1G
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f39044 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=frSOPK2eQqz-eahEfmcA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iBVtxbiTf1rrDmFe0Ihou-b1aJrbWS1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070062

On 4/5/25 1:15 AM, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> qcom_ice_program_key() currently accepts the key as an array of bytes,
> algorithm ID, key size enum, and data unit size.  However both callers
> have a struct blk_crypto_key which contains all that information.  Thus
> they both have similar code that converts the blk_crypto_key into the
> form that qcom_ice_program_key() wants.  Once wrapped key support is
> added, the key type would need to be added to the arguments too.
> 
> Therefore, this patch changes qcom_ice_program_key() to take in all this
> information as a struct blk_crypto_key directly.  The calling code is
> updated accordingly.  This ends up being much simpler, and it makes the
> key type be passed down automatically once wrapped key support is added.
> 
> Based on a patch by Gaurav Kashyap <quic_gaurkash@quicinc.com> that
> replaced the byte array argument only.  This patch makes the
> blk_crypto_key replace other arguments like the algorithm ID too,
> ensuring that there remains only one source of truth.
> 
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sm8650
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

