Return-Path: <linux-arm-msm+bounces-43870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C09A008EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5671918802A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D6F1F9A95;
	Fri,  3 Jan 2025 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouC7XvjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6431CD1E4
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 11:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735905178; cv=none; b=TieTTqgWr0gI8ZVeQja+ZvdD/uzwXSR3IHWMyAuTsqwzm+uTWf8UW6L0dD50xBPwhEaDnkM38t3SFEgkadYFKxH/BgBqGfUD+ah9GpmTwchQ/At3+jZmrLlA1o3DRpgdl3sIL0gMncNJfLZOCW5wvUfC3KdljztBRrPkCptfLDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735905178; c=relaxed/simple;
	bh=rbJsVbXEh90aDI4/VQcvR5wn9IsJb7NcvJun31JjhbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pq/fAFYPBBVf3YpxJcR+qE0m5FlPc1uVhPI7m16jEFEAtVaVI1aQZEghX65sqzR9o1/LExOkcRbplDQwxPJOwbXqEk5sZfE8FBacfAlBvHDG41f+EgOwc9NoYOpQqiM9x99rLL2d+ry4aaqcO5cuuQ1lYHk3czqIraP4Dy9r0JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouC7XvjU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50394ZHf006572
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 11:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JY1U5XqD6amvSasmh+RJE2X/VJp+Hek5uY57Le5Rqfo=; b=ouC7XvjUcQgxa9tX
	Fh6t6Ubz4cyXa3SD6XTtiFPUPU/ykhr1/96ilxQvwcIsB+ISCT77XMugLxF/cnrT
	uFRPJrflmuP07ZghAM3gJjWzH4r6VUAjwCKvTv1hLYob/igrFIMhHx5kmQh1wazk
	YEqQ1Yw13JRHtoiEoEQFa3u36iSI9YCExYXFXo+qu6BgpF31b8FxEzEA2zoVgugg
	8VSfw6RHZUH/HY2Dq6VdK1Gu95atJO5x6Y/WcdaHPE+ca6BktV+5sJJHBNKneaaE
	gwtiOyKKvlVicsPS2/oJ34m8LxKA2F3sM7I0Myu5tPbSACACU/WxPJHgiSFqL6ws
	CfEVoA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wxsea4dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 11:52:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f499dd80so30113085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 03:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735905175; x=1736509975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JY1U5XqD6amvSasmh+RJE2X/VJp+Hek5uY57Le5Rqfo=;
        b=qqRUgIt3P8jvT2m19EnTovB3TK15fGu2AO+qX7nUf7C7ekhsM85OkXMWrXto3ZjZ8j
         CfCuff34DyLf9D29UDSAxjX30/XHtHFAcfk0f8jGHFaVU1BwEs2MAfQCoPwVarTNZTMN
         GfjdJh4obMy+TDjzspz+l+VM8X+c2Ps2kjVo22cjEK6UubNeVo5nzZbi0moezahRG0IH
         n5tsehk93xhEh8ywwiBmhb4T/TmytNKSt/3Pas2+KLCC/TA2+xgciviAFBWwQwE3Y5x0
         CeG1pZQbI0IC7/C8lcFwwbnx7H0qoHLOC0UHquwknNm7BP0FiURBrB70hwvChi7WlSsJ
         zrTw==
X-Forwarded-Encrypted: i=1; AJvYcCUI1CIDuNPs9oBuGBqQQlKpLz9TuuNjxDPodJZ3nzxfwZ0skQ19xgkn3StYLaLchqu/Xmp59P4UzNC5BUnQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy60CNveNk1b/ZWC+RoQUtB7csoTVyuEQE8i37lZMyHHptH+p8m
	6j9vGuxhOUnGbu7omBEUofeZPcUcvYX0jMduTXFxfis/LN6oR9h3QipXCBnv/XoWrPsC5Z9mHwb
	3O9BWzTcWi6CwBDDaH3E2HAlHms6g/9RSZHE5DBEpQaAr3AQygusq6rpWssV3wVIA
X-Gm-Gg: ASbGnct8FcdbbYIKyCovOb2Nd9fK157RB3sWGGdIVFeowIQsz0Nhv04bOGARQUHquN1
	Y++1tOh8J8B8rBNZBprpHkzpPBOw1eot7hlxEl0EXI+NmwuUFVrqgM/0By/8mTIkz6oWOEB6C2C
	Viz7CWF4YEwpB3Zz+Oq87CAqnVxt1rW7I6lba7TMsaXrarMpda0kRbURYdkxzvbEE0Lj/GF6bBz
	lejH/x8hOM2dek3BNrTvKBXPxcjwHbgSfzSC7mWTtLHDUDZmTbeGZJoMl67fufhhTxZpFjKk9MC
	NtyR1woHWdeicGNJkGs8DUJDV41I9nYfz6o=
X-Received: by 2002:a05:620a:191b:b0:7b6:6bff:d141 with SMTP id af79cd13be357-7b9ba7f78b7mr2808803185a.13.1735905175084;
        Fri, 03 Jan 2025 03:52:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJxHWimw7JCy6lQWt8UYiPckHWd9mdaCkz+/USHq5Wt/D5nsSkZiCeWrJulSwvC6oBVP66ug==
X-Received: by 2002:a05:620a:191b:b0:7b6:6bff:d141 with SMTP id af79cd13be357-7b9ba7f78b7mr2808801785a.13.1735905174765;
        Fri, 03 Jan 2025 03:52:54 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895372sm1874946666b.58.2025.01.03.03.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:52:54 -0800 (PST)
Message-ID: <9eba9b8d-8851-46d2-bb5e-ae14d5da63d0@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 12:52:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU
 Frequency
To: Chukun Pan <amadeus@jmu.edu.cn>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cb90fd75-60de-4df7-bef1-e5c832601a75@oss.qualcomm.com>
 <20250103030005.30784-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103030005.30784-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 31GQiBRMELHwQPnMpxiqUcHMlsa0iiLC
X-Proofpoint-GUID: 31GQiBRMELHwQPnMpxiqUcHMlsa0iiLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=915 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030104

On 3.01.2025 4:00 AM, Chukun Pan wrote:
> Hi,
>> Could you try to boot the BSP software and read out the related
>> registers to determine the real CPU frequency?
>>
>> Or perhaps, if there's a cpufreq driver (I don't know), check syfs
> 
> 1. The CPU frequency on OEM firmware is 1.2GHz.
> 2. The CPU frequency on the BSP kernel is 1.2GHz.
> 
> Related commit on the BSP kernel:
> https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/7336e62905941d8137176b911410d1cea25d6336

Ok, thank you for providing this

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

