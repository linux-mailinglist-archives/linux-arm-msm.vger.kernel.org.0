Return-Path: <linux-arm-msm+bounces-82037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DEBC626A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B3E584E0642
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1845D24167F;
	Mon, 17 Nov 2025 05:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsy/mbjj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMmxB+qO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914732F5B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763357810; cv=none; b=UM/2M5cdXvhx1yoSOGtjFfYSLwuUvgoNUbW6nBDn9gR/xk5v7IooEGqVMzKRXbCH9WjSKJZX/+z7oNW3mKvPAXdS5fzdxE3k6rt9xwnrOLE3njpjAZTD+tos3zKX+1Y/R4FVZB318+kk9vT45dcVUcsuBPptdM26yND4OpKgCLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763357810; c=relaxed/simple;
	bh=6cYa/F1AJ7SfGa2agSMS+Ony+EmE7NoQL01K2TCIJ4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmL3qVuOiMGEIVmEufDPvjX46gOCAez60NRaRQJwTX1NTwhp9wz3gGKR3JPyhoMRigO9q+HtG0+uluKnVPmwDqHzLzrgToo39jy6U98F2Dd/fFx4oYfw+KnnN4q5xdFjluljIiakR9FiwkIJg8nQql+HwCrxVURDiY4yROztEvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsy/mbjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMmxB+qO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nmQg2686097
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mXdl0jN8pfbf4b4QgywubsZIm/6LqcIO5GONFIxeVf0=; b=jsy/mbjjP+u0E8Nl
	TJDPo+sqB6/NcrFbjTJW4o9OwQCOfkA8WwozFZxUGqDWmH/ad837kf52NTO6JOeI
	FXXpB8GiP66T92x1GkI691qOIoWGY+d39uaEP4xekhfz0yBj1pjRBu/wqxfl7muS
	78gBAhRs723xBdfBGvlrO/idoM/bZgH3G3kpnOe3j1YInMZAR/529nCCGmTHk4cG
	OJ4N9nFJBV+k7tDmXsOBdc+5ZFsaIBZBBez1oWVijqcao/g1ptDPjX49jB72kDcf
	7VMIAFMKKad4FtSPC5sF8tkJYuXV+NXdRzNNBnNyBvUcEO6H1vHVoWujpM0qTFTo
	mfcYOg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejt5behv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:36:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7bf5cdef41dso1179751b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763357807; x=1763962607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXdl0jN8pfbf4b4QgywubsZIm/6LqcIO5GONFIxeVf0=;
        b=cMmxB+qOELOZ5k91tGxHThheOABoKduOjFtZ9hNtAfC57KVP65Dd9a6udLPWv0fzCH
         4Q5HRkbzT/R8Jeeqc6K2qP96EqO9uT3nVG4vILTCUskayob1wave4rnWz2z1BRmvVrqQ
         GianDY3KHiihuf85VgWdkTzqHB4SVKLgU8pI2aVWIraTvsrMPTVDlKZ5/1s1cXTUpeVr
         JIRUf/eHwmRim3okCqIR+aLCFBEXiOaJR6qkyEB8YcdjzQo3zngt5EPNbVHu1IXmrNFb
         0sCqFx6+6sRYZUYvwznZntEFeUFY4+O70gDyGJ7TRQ/laFd/7+wEZ9HdVSI71vL+S+A1
         FrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763357807; x=1763962607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXdl0jN8pfbf4b4QgywubsZIm/6LqcIO5GONFIxeVf0=;
        b=lILsUpMVr5hn9FBJsEir7vUkKWe+b6De/OU56Gv93LahKx0OLUvnbAZbEwyI1ikNFV
         qBZ6quubM7W1V/5hqmfERClSKQ1W2yk73QivnctCriIc9gMqnrVmBPiwKqUKbDCaS9Vw
         M//xY/Uri780S2LLpkVQRZHKcBVbobc/zNiyg31Fnn8dxwq7C1JlL4vy3BXU5Hj6x8xb
         TyNqbbnQcFg/ltoQWEsLjMtrKY5sD8qkVhpURgpNfitQdTt/RFHsyx0K8mepAp0eQXkk
         5Uk4KlRpBcnkX69bcCCVCClnY2LYG/P4eCqodUxFTOgLVzqzNdTWDNF6ddBdTkW3Ktnk
         mMqQ==
X-Gm-Message-State: AOJu0Yzw8wr2lVpuFbV4nGnwPi/zYc/u6Y7q4d12mMEIz8gCLKA8ArYV
	Q7y4pxTUCewN3HKc+feOiG+WOdAIEK+5eZ0f/JykT7OI1hCeHITvp0IcnwO9v2KFj3p9gfiDRyw
	+Ah6VMFC1fJ/5HguwMvYNk0Iiczc6B9cnAZEKen3miZfj3FB6CKJmeTjkLdDoi8r5egtI
X-Gm-Gg: ASbGncvUogL/f7VHdZAzvKHnVG1rW+JO2DxSH/NhFOddbqtAP9NReAUP1wX18HGlpJP
	bGgkVFnv6NoFw+4HmACpk5nmNlSuRvqsi3REMVhrm5bfmxDmFYSXebESF9uFjwywrqtz5k20O/l
	S+/MRxv/CynsSJAyaGheBU1VnMgqkXqLdXa+PQdaZAAKA6HyBZulSIpLDNxzZIDFIlaOOGNBxtL
	UOpy6YqFVXKDHaYx1CV8M7AlbK4BtJ/QNIKGFP/5YT19Hy/rQIdZvpgyrRE3pwnB6OZjdz8ZulZ
	5f6FPwqG8CoP+UNx7W23fM0Po0eVeoqw+RSaZGunepYJ77/ezHkRL1pZZUOPjnHORy9PmvsDgQB
	o8qoz2NDxTZ9vpu90vFQNSS4B0pBwAZ/vEEelWyNfc7zj8BAeIQwcj4JyqGBKz1Q=
X-Received: by 2002:a05:6a21:9994:b0:35d:d477:a7d6 with SMTP id adf61e73a8af0-35dd477ac53mr6614904637.13.1763357807083;
        Sun, 16 Nov 2025 21:36:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF1tN1XzMSXB/nPnMId8DMIGw+Lv6MXfcOkHqT4SE1jddGONdK5QNeYcSLwMHKLFAhlZ6tnQ==
X-Received: by 2002:a05:6a21:9994:b0:35d:d477:a7d6 with SMTP id adf61e73a8af0-35dd477ac53mr6614881637.13.1763357806590;
        Sun, 16 Nov 2025 21:36:46 -0800 (PST)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9251c9a50sm11657433b3a.27.2025.11.16.21.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 21:36:46 -0800 (PST)
Message-ID: <e1d27829-da3b-466d-9734-927780174160@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:36:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-add-coresight-nodes-for-sc7280-v2-1-c67fa3890c2a@oss.qualcomm.com>
 <e80e3937-3e82-4769-a2cf-26fc5b3ccfa9@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <e80e3937-3e82-4769-a2cf-26fc5b3ccfa9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqmfC3dc c=1 sm=1 tr=0 ts=691ab46f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GcdsnbNUYbwPMujkRKMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: AzX8zMkZPCGfrVbGXiO874yt2IwreIWA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA0NSBTYWx0ZWRfX7aAWRb330ciV
 xfSVXHZaJoA4HdQLQl/RE6nyy8cx0oFAaH90JI6a/nwzd+Om1arA6ngEW1dx6f5CfKDjU8AXpNA
 /5lMI+pAEYkWxK6hg0gKl2HfMjKRqgywdZ5ZWXgXqu9PkGMBPumWnmTl0a2GddQeJLZzlzwPDCP
 Aj++ZPRR4zuY1CthG4VO4z4HKN4I/0rBqpR6f09XjSRll3t9IIF7ptIYuTVsdk9qa3xCUXUefy9
 EDf/RvR+p6GDOVISNm4PCkOGM26vw7vaOYPV/y4o8TnwTLQ7bwracIyxxb3Cul/kS+dtO23wOQB
 NnGCxlhRFt1jjM3yvVfTEiSpttjsq/dcqN0eqiUpm+ykzZnqeBU/uiJIHxFCloppuWi/9zwg0+b
 6t7qO74TODcIh4qhCbQbYoPCpKY8dQ==
X-Proofpoint-GUID: AzX8zMkZPCGfrVbGXiO874yt2IwreIWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170045



On 11/4/2025 7:55 PM, Konrad Dybcio wrote:
> On 11/4/25 6:48 AM, Jie Gan wrote:
>> Add TPDM, TPDA, CTI and funnel coresight devices for AOSS and QDSS
>> blocks.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


Gentle reminder, do we have a chance to apply this patch?

Thanks,
Jie

