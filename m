Return-Path: <linux-arm-msm+bounces-83562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0861DC8DBB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E70FF4E336F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F3F2750FE;
	Thu, 27 Nov 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO7G+UGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmOEXMaT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A74D30F7EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238939; cv=none; b=HTJrr/nowRyGcTz/EfuBOT/uq+aI/5INnrTiZ/4KoIdx1dkjdQ2//EZI8YzC/AGOeM24OTtu3jtWQGoi9z7NZwY8on1SS9Zw0bd7I3fmqOPth0Mwoih4yK/q+KkVOWc+amG9djCWub+x0rnoSg1wnjK/KnST+6xeLfEQ3GrsaKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238939; c=relaxed/simple;
	bh=EzZcKz34puk0lf+z2fBkN/21KveoFk/UhBjwLqxGJQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5eGA6BScMuqX7t+gEiJoqV1/CfTDwO+Gym2vfWqtVR6yL6qL7+tfA3vvTEJPcP8xWqjUyS3sGZ1yFpp8/Tvb4hm5u72h7TgrgYxPBdwV/afFdx+y78hbP3fEKLMrfMAJgvptkun2rmQImsoZH9exyOfxQiGhKzkr+MQHd1aO74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO7G+UGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmOEXMaT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR8DWfd3448424
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Izgit49DNjllAi6oPH9XyHM39nEnA5/CQE/IZlGSxU=; b=RO7G+UGOq7sknBHA
	S6tIVvGMiNKwTz5yHe1betV/jWH8WY8fri06a6LETs4YBZtcvSJTzSRTgKNtvK3/
	/EexDJeN5jwkTG5Aedqf+6UxVBicrrCrFyKISAnur2CT5tzfY/hWEGD8eLVNJghS
	VLIUs/r9WDjDoEzz/5zmSf8HJr46JZCmwg+MnZ7xPXPxpLxvRU30TmGvZpTQZQyh
	3uwiVhoBGbyiln3hkpKBx3PykK3cHADW9/PJRAuhf2wGctaUwZdiaIpjVCfE4GWD
	dUBIyoZJtCGoQRkVv8Sa9ljTWF2kupLczME7YubGZOmIjf1MorZdSr/Q4zT3ty5k
	ZZgRnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vhak0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:22:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee409f1880so1150211cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 02:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764238936; x=1764843736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Izgit49DNjllAi6oPH9XyHM39nEnA5/CQE/IZlGSxU=;
        b=bmOEXMaT2g1OPtUZ9hggy01LcG07QmGiCDYeqrflQE4/RVq++71UP2V3RPUqpc16++
         iWkt6NwF9RctBJcBr90+oTHXKS2rykN6PWch2pYExYIFd1WsQDAJ0v+4WC1rQrLK9g/w
         1e74PNKqjyt4YuCTPp434orRajB8xMJ9mhIgFrshrxLtBuJOUWM6RboPxyKxvBw+pO6r
         Lj6fC9yOB9Mb+AsSyRt8cn75r82HlqsF49KcvEW5MxuWauJPeK0Q9aX0aVqJ46iNIYRE
         wavc+BTxZioYO1wlFNv96CRuroLe621i5L/hOSFLQAeegkchSk5x31s6vDqeNQYb3xPj
         R9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238936; x=1764843736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Izgit49DNjllAi6oPH9XyHM39nEnA5/CQE/IZlGSxU=;
        b=JQG+Qriyh1GWGKGhD7sUnlMBhf6xBoC91UPwY2xhcw6yar7+ixRJChjXjQStWYsuSr
         WV65/0ZPTvlrerBjgrR105lnM976SCY/iTjzyjw7BwsgrbSzL3u4OY8fE7KjCgrB6Vow
         K2HKSyRUDEOZKn1g3SQgvecxk2x3aud1YeR/8w1fnoXnUZk8BxCi4jpGj9Pae2VZH31m
         n2FNkandx6rQTpPlVnusHIql4keKseH3YiKl5zn0aLuEKm2dJW+tgRS47gGcK1ShQk7a
         FNLXoYwCLMdGzopBavvIEuKfBRdq7Ia/mfmdaEsLdetITrkOmB2TRYr64ojvTikCCV0B
         CzKA==
X-Gm-Message-State: AOJu0Yw6ZXaoMDbPR6MY2C6UFOcx+xOHiKHK+wvP1UG2LG/M822AWCQk
	zs69jW3e8BtWRF+PzGn27CS9QVzN2df7PbBjJCZGLem1FAv1Ckar3XkvtpPnpA9UdugPQ/gftvi
	dFAv62I66cCZPDwomrfkuH1kML79TZUmSlG+pSIdVhbd9c2AUSlPJW2XAtkFAEqPo4cj4
X-Gm-Gg: ASbGncstxv7V0frzj/kJMjxzv5Jw9byVlz3iKwoOJrUlPc0ToZSTqqb0NYa1Qkf6XLq
	V8drDpq6UqtV1ti5v3qUGdlkL6Kggxx89ENmncEAL+QxPqnIRfwu7z13vN72dnNHDmP/qeWOciM
	bGU0ZYW4HQ1wPn9piR+hZVLpBVc8QvDUpY8A0vKageZYT5VrpnuqPhKmW2utVqR8KED8KCV548R
	V2d+p6uAI7rzrxY9V4J0ONQxjt2Sjrnp18Yz3eMjA2vrqe9WkKssm4Ct7JNpLcxav00lfU9ZnAj
	wpnH6pAC/IrLga65Eex376w1dOd1Z2LUUo70ZpPLhSkvRNs4HLG/Vf75iTQN3AxDgr+bwCzDXps
	tcEsSv0DLkHPp2oZlFuRoNC+LHAo4Ak3Xgth+DoQF5NdWgPjK7lppNv42wcjyQX1n0J4=
X-Received: by 2002:a05:622a:511:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee5886636dmr231859181cf.5.1764238935766;
        Thu, 27 Nov 2025 02:22:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqUc0ogtoHKBCaZjWaF2tK/VCEBVLqOY0zxIutky9DgwOKFAZGrdI/Xrev9xz3VoYkwpdCjA==
X-Received: by 2002:a05:622a:511:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee5886636dmr231858881cf.5.1764238935174;
        Thu, 27 Nov 2025 02:22:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm130958466b.7.2025.11.27.02.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:22:14 -0800 (PST)
Message-ID: <80c26f33-aaee-44f2-ab7f-767467423396@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 11:22:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soc: qcom: llcc-qcom: Add support for Glymur
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251125-glymur_llcc_enablement-v2-0-75a10be51d74@oss.qualcomm.com>
 <20251125-glymur_llcc_enablement-v2-3-75a10be51d74@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-glymur_llcc_enablement-v2-3-75a10be51d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3NSBTYWx0ZWRfX9zyiCKDIgw5s
 589jsEP7miVo1bm4GFsroasW1h9M/6p9cAynfZB9Zoccp9JItWj6Tkgb6+Z+7A6qUFN69s1MwVE
 EJa2E+QrPn0uvz/diKxQBtHvnPOO0GmsVp6TGII65ZXLDyHIoUeVXUbVraj5/RkECIygWpvSmDp
 6LQJPKlWwBtbMOGHCurLeClLf1vHgMarepZMK2xE82GED6fc7gxtCU2h9BBpoTIz7XRM7Z16Tfw
 JME8ScQdi2Wg+Trfq+VsKeeXq6u46hYB+vdezldKs04wtVB+Pb7P1Nl8z2qe1Rhop25W4H71a8d
 /Ymzi3rqMbBQQUnGm9pLqOJgnQHtjcnihR1kuPu37jyxbV6FLcpTwfwT8p2OjoifH/RBQrLRRW2
 7JGK79dsaTr+fnyzOqaP9vLL4o8YFQ==
X-Proofpoint-ORIG-GUID: qR6Nj986i1Sf5wZLJ0f5ylUuCPuAzU3W
X-Proofpoint-GUID: qR6Nj986i1Sf5wZLJ0f5ylUuCPuAzU3W
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69282658 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LSTLbLsVR9BkKCPKAs8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270075

On 11/25/25 10:16 AM, Pankaj Patil wrote:
> Add system cache table(SCT) and configs for Glymur SoC
> Updated the list of usecase id's to enable additional clients for Glymur
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

What happened to my tag? :(

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

