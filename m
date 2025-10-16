Return-Path: <linux-arm-msm+bounces-77583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E86BE3845
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2AC64F4DC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 12:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79FF334388;
	Thu, 16 Oct 2025 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1j8sX15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A43533437E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619327; cv=none; b=g6sbA3Dk6tQAedPvx94fxrlxlxbW2koG5Ho/LgX6joWmK8dCSCAXqRciP5DmfH1J1Wn+Mttq450ixJtqTKKwhyqOuViu/fByRy2W7yMeEpJ7SjnJ6vxkG6o/FTvToUptw9hpYxLOn2RVioApjyy1FnXHKuSR01dezxNctPRNBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619327; c=relaxed/simple;
	bh=clsrzR5Vf5s8LPOIJDRYghGThBzL1fUXD8xnKPLwPis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCHpOCFKWaESGZO8eVl6KDF4GW8Slb5PCKiZUS8k1mxMlXe9E5eH+A5JJeAe2lVu3spuH/Fj1+QTNnwA6TZpCdRR3C7DMoA2cQKbNwN46tnDeE7lLhzxIOnP2cMFylny1+yDp8rGYUeKtkmJxfhwjFOJCB8nny3ZgSWWPa5DOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M1j8sX15; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G80LFh002648
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 12:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3vY8/z/UqrVuq0K34arFvPC60E1Tg8WRiYrpR7jbwY=; b=M1j8sX15hr3KLCUV
	pZ/etIUDdMnsnc7bg4qjM345R/QghA8M4JC8/dMj3M71ZGyexF/2uklHL3KU6Iql
	QjmzLakdvN4LnzwxDlsFMgz1qmG4Ice6yYnIHZHwHwionGeKXbiU8Y+OISGzM000
	C6emcbGdG9UbplaE38WcdtSUUBkG0iUAUsADNn80qorfuCceDx6CEHL4pC6yi3Oh
	0rfI7oR1lLRzCysII7JP6I6fYT4s9tVIS3PKKeKmHKOkN2oWkCRxja8vMetLX0ju
	o+HUCFYU/qV8s36Vvr9m4EnvaFKuth69QYI3rlRW/UzTVSepUiGVwHTaHckRtL8N
	TA9qFw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd98dbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 12:55:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c08308d26so25941236d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 05:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760619324; x=1761224124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3vY8/z/UqrVuq0K34arFvPC60E1Tg8WRiYrpR7jbwY=;
        b=qkPxVJk5bhY61a03kt8gsk/EoKdR1IXZ8ttpv6F6wJCpKFcpvSEs2w+2PPKFeZXzSU
         +2whrcvwmNYvKASq3wrDFJaXgtq6PENtAC9rCpNs/g2ZDOXGu37akHePf/FfPfWs2zeg
         igQyEL2pKjVlNSRM+krgCD6NiUr2xqC5SsuQslNN88RizlkZVo9QXlvq8td/SuM6O7Mw
         uIIsPU/AbQkduRhk1L7ME8PjkGPz0R8y26+904BjC2vtmOa2qqYmQTVExqJZEIcNx6Bq
         dT2BW3lYJ9CPvOAzUW0hhjGeOGXjewUKgD1ZebzYz4PfxfrzMytbA2TAn22S076vemql
         ux+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUzo629t4sZ8EcOQ5lwY3KEnUsmXbsherBYo3hsLc0LhfisNfMXUTb3Z+KhCdqajCZYv7Ad8ojiZnyo1GC@vger.kernel.org
X-Gm-Message-State: AOJu0YyXebj2NR+tPb9zt1gkAK4gDv7fi/kfztO8iuvLPhuPW8f1YlQJ
	nahTiX1wsWzqoHsP/AJCghmzmrnbCWjwkrNY9UG2ce0tBSpQICm1h5FnfNk3UL+I/IrdxGZvtMf
	ss8sT2xO8SbTfJcFS53hqIJCgN2gDY5KKUr0ueVxdb00qIbIOEhRoB16ZWlYaHJDa5KGy
X-Gm-Gg: ASbGnct+ACzXYGyQl6pmL2PUTnHnisn9Gk0B72pFBEc2z1SIidYneT5C8Ux4gfB47un
	FDrp/5Oh8LomHl/aqCVqNeihR2wW3DU1xPmwg5p9XMeCjwPWNQWl2MXL7sJj+ixfTb0tPki0BrC
	cjNlTLeujox/egn3lAchupEZAHj6sVwGh5DfNaynp0AhPCUmmiXTCVN2bnmZRvyFGklgJOtfQEG
	ypHAhPtzujAM+P/euGj2xQkp0CWqOk7zFtQcp45YvQbkjN2fz6/9SAOMrsd38sThaMh0JgaShoy
	swKBIUgdHgH0Wh6NXRLWjphJQQ5IoOa5QHAwY0Vweo7r7g8e7XQmJQzy5iwo4HLzznQ8Gp6vwyX
	aS1dBHlym3KLF+GxBB0ARwDQqlxpdfvaq3ySdXBkxQke79qDRuvwXdEy0YiZfhXc=
X-Received: by 2002:a05:6214:e6e:b0:792:51e1:b85d with SMTP id 6a1803df08f44-87c20579555mr105406d6.27.1760619323957;
        Thu, 16 Oct 2025 05:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCINHqSjdqPrtWSzz1lwFMNKgk5OolR0NkDAfI6x6QPEI6lX9MNTVCACPvGDsRcS/LfopbfA==
X-Received: by 2002:a05:6214:e6e:b0:792:51e1:b85d with SMTP id 6a1803df08f44-87c20579555mr104996d6.27.1760619323420;
        Thu, 16 Oct 2025 05:55:23 -0700 (PDT)
Received: from [10.111.161.126] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0120cc36sm39651696d6.2.2025.10.16.05.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:55:22 -0700 (PDT)
Message-ID: <1377934a-fb68-4c16-8f7e-ec9610883d93@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 20:55:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: qcom: camss: Add support for TPG common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
 <20250925-camss_tpg-v4-1-d2eb099902c8@oss.qualcomm.com>
 <0b7e71eb-1143-412e-a76e-b6f146cb60ed@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <0b7e71eb-1143-412e-a76e-b6f146cb60ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LVjS-cTQyiv0PFHxs8QlxweANq4uGoXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX334n9O/cMGi2
 q24BQNI67a37XCxgb+pkU1it3IpTnGtO9tF78HIo/94Wnr36RZ40yk7eL3Ea85wt5kOHaJly+Ue
 tI2DsN6INcXtciB5WWGk3S81xtgCP8FrX0aJtFElprQH0fFAiq5TUrfHezCe3zey1HSZCoq9vpb
 Ad3UdKaYE7cE3xV/UhVTji5HovRpmAsEIVGhO9ChQXmAojLvX79fpbytbkyEP4LI/q/CTow958Q
 deYkk6TnmQQnA1DACdwaxD1l1/OZIvOAhmfJfb5ucsRjoyfLV85ZiEKinRWbvJNH3M3lfWs7xNV
 EEk8+Aguv+xNrSFBgheldQvM8PMCSCH7WNWGQVGSlh0u+DUYNa7LJ4w6iWgNzfFC557rIyINyNB
 KYnkRWs6Nb5gZmcamx5IEw+QPPl90A==
X-Proofpoint-GUID: LVjS-cTQyiv0PFHxs8QlxweANq4uGoXi
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f0eb3d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7DvS_owX7E3HmoQsnjUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 10/7/2025 6:44 PM, Konrad Dybcio wrote:
> On 9/25/25 2:31 AM, Wenmeng Liu wrote:
>> Add support for TPG common, unlike CSID TPG, this TPG can
> 
> Is "TPG common" the actual name of the IP?
> 
> Konrad

No, it's just a description of the TPG universal code. The updated 
description will be included in the next version.

Thanks,
Wenmeng

