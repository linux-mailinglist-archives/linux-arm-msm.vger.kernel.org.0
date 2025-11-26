Return-Path: <linux-arm-msm+bounces-83448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C5C898E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 12:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 36D6E4E517E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 11:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F8E324B1A;
	Wed, 26 Nov 2025 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WORbRial";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNMMkg5s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C323246E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157127; cv=none; b=DOxYceRFYS+aQ7cYqN67l8dScAEoMCfLJ+kwF419eb5+13L3b/7+qoAosYCX3ZRBtBJ8AEZhwfT+ah725qZEY8INRV36SHfe2PWWuu4rvy+kHdM48hrg6J1j669fl4f75bOnfA7dbHmrp22VY8bF+no1KmUV0zuXHIwBLYik+7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157127; c=relaxed/simple;
	bh=uetH1gpQCMGCArNEY+4ysespicgo0/ixJStFpGQYZds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNBs3S6cFvNUuC+SD3ycJPpsRgCKqG8rLzRZF/ZJzuhELq3wwCW46aHODIuFe9Bd6rZYX9wO5joLrHtzWR/3QT+axUTBQiT1P7nMSWfRZUliVynXYeTjSbZlaWJJBvizUR1frpfbkkWZ+NWxmjyWJASH1vT3sULz04yLPvc6TVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WORbRial; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNMMkg5s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBXK6P3706875
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 11:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMZ8nP22oqBJZ2lViVsuNFVcop8rQmSYUY6cSSx6MyM=; b=WORbRialXIZdcz8Z
	yz1HjchUH9I43W8/w702FxGXAJLYv6Tn8lK3CjrqRKNGYWlna8xzVSXz/KRP+ORr
	FgohVxnaGiviCgdrdZiXx0dfm2BQLI+UbmK4xuZOryk4bM10x2mrW9yWBnBgL4H3
	k/jeqGH/zyfo/iCbwtsL5EnZW7RAy33xuvNrfhSSlahzd54pvQH9rZRhW/Nggpkp
	fZOI2YWPrkMCqYOVS84m9dWEK4aeIA2CwBgf5n8DUs5Fn9OfNH/TY19SHKaU/fNz
	JQH2IRB9u8u8ZejOWBFtqrN8IjDioxAPtCS4JmMbn0eFe4zrlwvGGXJMfseBZutk
	QWbcGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufu909-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 11:38:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341cd35b0f3so668182a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764157121; x=1764761921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cMZ8nP22oqBJZ2lViVsuNFVcop8rQmSYUY6cSSx6MyM=;
        b=BNMMkg5spKjdpryTsgog2MjjCdJqJPNCw50qOxC+GTpbWHkWK75Fn7fiEsTKgde3GB
         WdvkvcKiRkooeTSyLDuPNrUW9VOh8qYZocSG2bZOPDmU22ASZpRR2VA/uXwz9+PT7Lf3
         FWg9R5ltB1bdJkU3HhLnMmu/JcwkgaSOXmp7OTbP8iPwNG0eLGU+ISveE83kqyqZSd8O
         UKAK6oAOkmbYP2vfaluaN1g9Nc/k0bEwXmErFhgbyqFXD+wYMqvBvERtU3GrKNsP+3g9
         XT/x0NAJcoRni0tn2q8r1mGcyJjRBO/r91LB1Vs+/qKbbjakCeMWtWXLeB48nnuUPqEa
         PH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764157121; x=1764761921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMZ8nP22oqBJZ2lViVsuNFVcop8rQmSYUY6cSSx6MyM=;
        b=u/cxKYdtEDBSpfk8kJnl84n4c6exeeikFsJu+fMxgYpfAsFGQsOl5vuuw48AbhzejT
         Vxyh0CqP9LL63HTa578PN+7UaQNG7yjZddiu9mBw+y3Xto7xJXz8LmwuAWdO2v9cPH4j
         Nmg236DmDWFpjKSntnWghmoTIe77pC5p3lPs7JgUBZabi05YNai1ln/rJEhdcsV40T3R
         OuC0oMrySRQxzD9jIyjjILnHyDnN5MZsgMPJxaNU7sBZqt3kDmdAojKyuTpm+f0eqw9k
         2R/RbcYrMzz/NEeTv0z/yhJY9vpq0RLptEiWNFBK9DeKT0eQgY58m4sUvXhbp+MwIaDb
         RVOw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Tw5Mo1VIMiQB5AzNVAHY3tBOsqRyfJmhaHzqxs45hbaW4iy8+prWPE+p0ooyp5MWYRUkjSwhpC4yDv9z@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3iFyrJ702OJCGiKiMXicWqbJUvEiEko9P+bdggOn5IntVfVR
	qkWM9QWXOWpEBraNtXUhWGQlkrxbdb1PMtAWfT+bcwWGG6vCFaqjDamQtDTJ1hS5v9vVebr3cQ8
	rV+YWTzVPK22tkBXG8Uub9zKWj4lhb3eq6cZnxNU51DlvRwHVGzspece0DfP6swGlN6et
X-Gm-Gg: ASbGncvAgy1aaR0ozNjhmzJ8oO0QigrKi37/x7Cv/4tcyoZ6vEwnIStZLnNPg0m14ll
	wolKybiCROkoLple6Yu4QBvy1WnLAc9i18BrKX3sUdmsUBCJKbgjkGqi8vRoQQ1sCu/UG35BlaB
	SCTSYk445ziAnI5Ng7rWQuu9/RCh055TKL3IqmAycwbNEHIiPGlIHF0GYZLJP9r51M0UvAxDWvA
	eIvxfWkClo5gZgNgnhMOxu35ckBqxMVtZe0tFlnKG1eN/PZQscwmwHE3xUySKk/qe9KLraso1b6
	bxEwlWKIWXAvHkIf5x72wPAceneyIJFnZ2XWNQFZJoW2jpZHmGzonN3BNz6p9NK6ZxJw/a2O/du
	sd8KiWK5qoAbfW5zM9lpGCHgqkSV6M9iK1gGAhe4zonuMVtYF5exZaHLpT2z+plaz0eNf4y93yT
	xdE6w/YwQGyZI9mhXJ458bxr8LQenM
X-Received: by 2002:a17:90b:2d4d:b0:340:9d78:59 with SMTP id 98e67ed59e1d1-3472983a0a1mr22911526a91.3.1764157121324;
        Wed, 26 Nov 2025 03:38:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEBT+pTARfErEXVdl1abES4By5ZJEcqIH74/QYD4cbt7jTWebv+5raGl664Wuvz/agcEfkOw==
X-Received: by 2002:a17:90b:2d4d:b0:340:9d78:59 with SMTP id 98e67ed59e1d1-3472983a0a1mr22911487a91.3.1764157120852;
        Wed, 26 Nov 2025 03:38:40 -0800 (PST)
Received: from [10.190.200.209] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7a6105sm2319202a91.10.2025.11.26.03.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 03:38:40 -0800 (PST)
Message-ID: <7158bde2-bf70-4a2d-b19f-fcc24cc37d28@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:08:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: llcc: Fix usecase id macro alignment
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251125-glymur_llcc_enablement-v2-0-75a10be51d74@oss.qualcomm.com>
 <20251125-glymur_llcc_enablement-v2-2-75a10be51d74@oss.qualcomm.com>
 <20251126-gigantic-dinosaur-of-bloom-aca95f@kuoka>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20251126-gigantic-dinosaur-of-bloom-aca95f@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926e6c2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JLVAI_iM7606iRLUKQwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA5NSBTYWx0ZWRfX2M7MztSjXqaN
 nCDbJdr0cSuXytO90KQb403DCYslpXIcvvK6X1LlztcoXW9SRN7to3GcsLMIfbfd31zURh65ioE
 0dw9FPhQDVn3Ckzg5KuE63hGkkFTwIsJeI+/HhMyflYDUhG83Q5TViLX+NT2w1wSJ8C31Npehfb
 KAkvuv3xoInmj6mITo5fLjbTwoccE7vd/ckq5LFJxoUX1+hFPhI2PHIKLVNtHYoSIRq7zVs+ECl
 /qUjt2wU2mWUKX0kFzhPQwlv8mF37/FRSnwDmcCO/pV3PSaCdJVc9xUgPfgga+69LSuQL407AbI
 boUji1X2uyDPgniOUZH18+GmFa7wTYJogUHguzww94K0yfofJsebIOzN3pAnTVuLFQ9qUG9Y1WX
 DSGI0BTQbAMtWlLoEusiX3ug3OZmRA==
X-Proofpoint-ORIG-GUID: tZyn0rvKjVZawPZKILuyJxhMWXUFqSJO
X-Proofpoint-GUID: tZyn0rvKjVZawPZKILuyJxhMWXUFqSJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260095

On 11/26/2025 2:29 PM, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 02:46:23PM +0530, Pankaj Patil wrote:
>> Aligned macro values for usecase id along the column length
>> -#define LLCC_CAMOFE	 71
>> -#define LLCC_CAMRTIP	 72
>> -#define LLCC_CAMSRTIP	 73
>> -#define LLCC_CAMRTRF	 74
>> -#define LLCC_CAMSRTRF	 75
>> -#define LLCC_VIDEO_APV	 83
>> -#define LLCC_COMPUTE1	 87
>> -#define LLCC_CPUSS_OPP	 88
>> -#define LLCC_CPUSSMPAM	 89
>> -#define LLCC_CAM_IPE_STROV	 92
>> -#define LLCC_CAM_OFE_STROV	 93
>> -#define LLCC_CPUSS_HEU	 94
>> -#define LLCC_MDM_PNG_FIXED	 100
>> +#define LLCC_CPUSS         1
>> +#define LLCC_VIDSC0        2
>> +#define LLCC_VIDSC1        3
>> +#define LLCC_ROTATOR       4
>> +#define LLCC_VOICE         5
> This does not look right - you still have here spaces, so nothing fixed.
>
> I don't think this change is useful. You replaced one poor alignment
> into another poor alignment, so IMO better not to touch this at all.
>
> Best regards,
> Krzysztof
>
Sure, Will drop this patch in next revision


