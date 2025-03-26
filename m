Return-Path: <linux-arm-msm+bounces-52526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44669A717AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 14:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 362153B1959
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 13:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CE11E1DFE;
	Wed, 26 Mar 2025 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XlOUm0Dm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C51AD3E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742996418; cv=none; b=Of+sZKQFjqt5VHpr06lkAE8L8GBliITr2BSUnc244YCMUq9xryWvOJmeZjn6jrY5RQ1u7PAZ26uhiYDXaqXZ3iQcAruKkRnyrI/uki00PEwaqVnAuG9a9aWehFUNp5v0Tw/LcHH495UCmFNEWzN/vEpQejI3ZA3KiI5PPInBlVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742996418; c=relaxed/simple;
	bh=Alploz2qHXP2QnB55j/WuqbM6NUQAf7VYLnv2Wkst8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVzjVWczKOD1ahV4wCAhbqv/MuWhXJTL2niNtD1TYZb4Ew4e/FO/DuLmfErKiFqOX+kCJjc3+WhWDnTAfOrKAhkshD6lY0DluzdIz+qcCb6uEaEo9sGrnMI7XpUIaE2RNItL3bDkiklydKs2Xp6L7/hZ2Yf86nrjd0mmZQV1jxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XlOUm0Dm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q7368r012744
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StU+TACp6Y4jfftOzYa6TTZ65PK38fdexJTR3duIBKY=; b=XlOUm0DmSMPyMhi8
	TEttj1e37hSB/tiQDUuyvZLY71HIpFj+D4tp38ZP0bnW5lwPtnWntoPMpFe4oY5O
	Z7icR6d9ooURfGF0s4HbepC3d22XZaX7AXJlov08b0l7P/1haZdE9oslTJTkQWto
	dJg1fxro/IWJk82FstgiqsqhozsupToZ4IRC6AFYRSIsKpwr/Vxw2uUNnRJgBZdS
	vho7W1coOipqbGkzBhopAXRjBAI717VKDOYchtfgkyj3YDMhVPF5dP7UpE2ZeR6I
	ioduJW7/379b/icbcHUWefpAut9fyYXUHiHlGlLVp7ST0hKBETs38nUdP531+QPZ
	3bS7hQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9jwwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:40:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5560e0893so90669585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 06:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742996415; x=1743601215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StU+TACp6Y4jfftOzYa6TTZ65PK38fdexJTR3duIBKY=;
        b=I3JWcKyfuqD4yhFwoNmjh/RqJXZPbkIiU2+XRMB2vpak3LzFzs/yAP00nTZne3nyAZ
         juyWkE8sVlarskFPJXrT3ZfvwjcCKF/kYKXDnTqwjyyJ5ichUMBzZ33BY/O1n0t5ZnTj
         h8VCQllt2BdgYoJ/p9V4ZhUysNsiwpsJiSiZ5zvChh5U3jIsSbXNVg+TARLb9x05uN/r
         u7rUwh8/2eeFD4v7r6DwkzeWTgmbC96SCxTiZRccK2JfhXntqFmF4rWEXpzb4LbfZWSv
         9JF7WB9NWNFQLcipyDMS0uPJcuRMXvX6cvufi7f0r+dxZWHLBmwRe2cgNbsimee/IaYR
         pQZQ==
X-Gm-Message-State: AOJu0YyrR/sbTl/avrz9m7QIwjm7gMhDFDgKmuaafPsZz3gHPXbmQYmr
	0sTuJIZGnTgVWcqTdU+uU1UZZ9Dt7BCpQuRCxoJpvgxdDkjtBrJ4+w1cKYgJgOA/2io3/j/fqGf
	YwPx4GfFINT1LhvPKW5b5JIHZ/l3TIH+pXvJBC7my0IOwSRppR6fiROE9OA4sU7cW
X-Gm-Gg: ASbGnctJKOkkTzHDfVQVyDYHIlKsK1IgyorTi8Rg7yWG29UG6lagjdr3j/MmrBsNRgg
	WvWGKOmnQQzU+8DzW0uwbLaljjtS/UuhN1mep/ezGkcbGdqrlkfuqjbevOKv24PU9/ZhqAr5UUV
	rxIq86GOipLTwtggkLJsU5UzXVi9NB5DBC4qNVjmnfQBFvyN6vkMrkJNWvAobdh19XGXlJP/aB6
	gNY+kB0nN6DjXPmoN3MNuUq8DRc5zLBUmJeEnGAog1Xq8RfptRAKnZfu9B0ZU3DSoTCwFUvneFf
	yCvxSMfAZmrFKnb1LXxIG9jktjitrMDRYQfyb1X0GVNEyAUKz2yaMkqqUmAo3/wW2YbENA==
X-Received: by 2002:a05:620a:2892:b0:7c0:c2ec:e560 with SMTP id af79cd13be357-7c5ba20856bmr1100077785a.15.1742996415230;
        Wed, 26 Mar 2025 06:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAYkx8eAWznpRjQqrJ2yraETDjmmoOaYzcvO7IwzE8HQKRVSYH/lIsOpvtlZuk6MM5xAhjWw==
X-Received: by 2002:a05:620a:2892:b0:7c0:c2ec:e560 with SMTP id af79cd13be357-7c5ba20856bmr1100076085a.15.1742996414741;
        Wed, 26 Mar 2025 06:40:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb65866sm1043016466b.102.2025.03.26.06.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:40:14 -0700 (PDT)
Message-ID: <a9a3c4e8-f3c0-4eff-8246-c2d0fe684b6f@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 14:40:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8750: Add LLCC node
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
 <20250324-sm8750_llcc_master-v3-4-2afd5c0fdbde@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250324-sm8750_llcc_master-v3-4-2afd5c0fdbde@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4gTRbzXXRyVbheXycpeODg0i2lJnTz6N
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e403c0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=-Mfuk79evvAA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4gTRbzXXRyVbheXycpeODg0i2lJnTz6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_06,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=742 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260083

On 3/24/25 9:29 PM, Melody Olvera wrote:
> Add LLCC node for SM8750 SoC.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

