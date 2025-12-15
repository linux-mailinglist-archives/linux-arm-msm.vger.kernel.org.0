Return-Path: <linux-arm-msm+bounces-85290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C798CC01E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 23:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0A8F301E147
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 22:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB207314D10;
	Mon, 15 Dec 2025 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJ6qlYrF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1zJJDDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627092F2619
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 22:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765837201; cv=none; b=t8IyqlI0bmVem2rn+jda8WipLZYaIOqOvsEFA0JNBtCtkFOwecmSpUMVJ+SWenOr6RpN957pk/BmXVXnekZve+ikPWw/31ypRqJ09M89LhyRbKRRWn4o32EyrXg4yXzs/BIKeHoayoLJprNXA/CTzpVkrCAQTeHCY/c82pc5Xko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765837201; c=relaxed/simple;
	bh=ragwkO+8YLt4YZ5khq5BOCb0R+g526/QnG+GD6YmibA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiSg8liPYHErfemE/4F4Q1Hb4WLVQUl/yAeeTkE2/DdCmq64xz+q7QZVkSxtHJiPy0Co2sVHZymfRhBxy1d+n5yamXgI5q7DRniPdakYg1qDzKdPup5QyIIUTiqYNsyif0vggfDQYDVoJUDQX0zL9qaKepQyda//8zh9LqqRKNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJ6qlYrF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1zJJDDb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFGOeOM1389366
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 22:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihsSrburBQzQCLrZeOr5x5sV998XLhEapswC945EWi0=; b=aJ6qlYrF5F+kxK37
	4jpZ/4sK2OqRkNLuabGgGSRqYmLMtSiSMXR+uz6eFyYAb+5UX/T7pcXjI4pBz+k8
	2ihWtK2mL6CLIW+SjbIzd2Ck1JsUaJQnFtnmwYK0v5s+ksL9kflEWHlSI4o2atcV
	PYOqdCgO/eVyF65pcrcYNHpMb2EcEIUHR/pqL7LHLm36rI1rv5uLidB4ZpE2ZMnY
	6MqwrFAed2E3b4cf/jQjh9wRwMgRHQhVtqqcHU9cLcpRb3pTpBJ3STQojVmUjAM0
	eOnM5omyBFfPcSTiR2x1LtCGNEFGcJgn9HMhBKETIAial05+v/sW7HNoQB4OGu9r
	LwnhCg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2nu1h1d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 22:19:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso43233655ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 14:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765837198; x=1766441998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihsSrburBQzQCLrZeOr5x5sV998XLhEapswC945EWi0=;
        b=Y1zJJDDbscQdctbYKLvjAw/tM2lZvMQiw6mlLXddpL8iOrKSZ68M36fd6JiLj24w9T
         xJqOrUVhAzuYM5th3LYRl/1qzvLeZRiQwDi54XkBcWeB6z12Utjv1Ui5d+KURrPRj158
         7hitKPcV7aMVY07OZRSKurUirWAnwIRdrLk/fXTSWASOGJ+XGWVd20vOTe+BCae0tsio
         deF24RHfz/JmsBYWWQYy30v9iUhLN+EourvCoG5SkaPfoHFHpvnb1fRy6tfVGPHQNbHC
         vrr7HfUjHvoJsSot2QwfNENK+25Kc1/V/Riugwiv59GTajYjrNwnfV+TciMdKNl4sJZD
         iZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765837198; x=1766441998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihsSrburBQzQCLrZeOr5x5sV998XLhEapswC945EWi0=;
        b=nKMZouBRdVLU0qpfFwjuQBU5o9axk45jNtQHZxM/3KFTTp9o3Yaw52L+/Kd5Xvbc9g
         wG+Mw8PQ5bvIXScUa2yRpkWMQlj4qxV3iHxS8ukOZmhJr+k2qG1Ykdwh6lpPhZUHsq/4
         YpQBNo4G7dQ/+frGAdwkZnKkGIpFo/2nWyS/vTGLYjwgFgzWwZjUTxgSkfADkFE7oKwM
         LqQppDkGmurDHfYkT7aD4t0Y0yDLr3kndJCIWj8gogdFjcYodrO+vC6x147ExIydrDmq
         HQrMGJiwH7iM30x6V9ayXHgN3EYtQEql68/iGuIHZZNQaJsM0c0sfUF0S0DQWuxnank3
         A6kA==
X-Forwarded-Encrypted: i=1; AJvYcCVz5y5RwDBINvfHbrPc+DwIo82ZrGggZyC4j5PGOexMJ8ov5qmu3gD7iO6Ugz0O6LPmVG+ADJFMKBOIWlhn@vger.kernel.org
X-Gm-Message-State: AOJu0YxE+9SdZqLxPMXieCMWvIfTLcCLuvfUCYryZHFCEV2lp0mRiblH
	t2PakCKMj25fBRHvfacUOy1xQ9MjkMFWZqO+JGdngMajVrkvn2448F5LMdBnOrZ81pK7BijELoO
	9SD+qXK8g4Pn2XN3zTRQwhGn4M0aBRMYjXnmvkwBwdyXSYdZzMbZ3AkKYayvkxAeZ3K55
X-Gm-Gg: AY/fxX7GuS+HDs/QNVsmyxC/pM+y2ApHkW7aH7foRLXK70k/GWEvIbAyddZAul19Itm
	xLsXKS6ANDHrkc8nrSWLg6gI3/ldysVHwj3hQYriAg46iO8I4VEJhDMh0qtNK77PW6M4hzUbZc4
	2a2zTNg0b/uB7tMnRgSAdxsv1VrR2dmAHzRBDMFgWNSt+fRYXKuI2Jl3qdNbpXiDJndKIX774JQ
	YIOd4Jiwx3MjvH+mlTJgJLyhqxcCt4H8+0T+t/HbTaNXQnjOuVgmq95W3zP+D06tm9Iq2Le01uj
	Bvak9G2PPp+dFbhZzGyOmtJE7DK0exTtAs23iLbZcfg9KZHFjADjxMYMustsgpkoKnzVyMUaP1Y
	zg5hA5QYUlvGwtDUuUgzPFLx+SUXb4h90zR66AnzS3mEZHu0Zss0dy99j8rD/QaR0zTFmkA==
X-Received: by 2002:a05:7022:248f:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-11f354760ebmr9481072c88.7.1765837197652;
        Mon, 15 Dec 2025 14:19:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNdW/Y+tjK5Z/LanDaZsTUxNDNJ9VP0kfwVTCegek0t8BJzH+p43HEhdFaZEWPXUXemJd4YQ==
X-Received: by 2002:a05:7022:248f:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-11f354760ebmr9481035c88.7.1765837196927;
        Mon, 15 Dec 2025 14:19:56 -0800 (PST)
Received: from [10.46.163.175] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffac2sm49034782c88.11.2025.12.15.14.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 14:19:56 -0800 (PST)
Message-ID: <b904647e-050f-4283-a24d-71181480dc7a@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 14:19:53 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: cristian.marussi@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        mike.tipton@oss.qualcomm.com
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
 <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
 <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>
 <DEVFS1MAP8J6.2263USIPE4Y74@linaro.org>
 <20251211-wandering-magnificent-yak-5fb19e@sudeepholla>
 <DEVGFVA8N0N9.13ZJADVNM9PHO@linaro.org>
Content-Language: en-US
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
In-Reply-To: <DEVGFVA8N0N9.13ZJADVNM9PHO@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wzN3CvrgdNoHDUlb0lBTPaiYa3piIg_K
X-Proofpoint-GUID: wzN3CvrgdNoHDUlb0lBTPaiYa3piIg_K
X-Authority-Analysis: v=2.4 cv=AOuEbwt4 c=1 sm=1 tr=0 ts=6940898f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=k9gND7Zxdg9d3DGUrpYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE5MiBTYWx0ZWRfX87ZcSu8h8vPb
 4OvxdZdfz/jvHahuHOC8hQCecOw+d7Y3Ro1iJ05TOfC/5GtQJispgg0MOAHnFyBO4Zh6Y3G4LUz
 IWHupK51Iz3eLL4yrqvGzrtBHDQ5oQebExDFJPNyRcnJczjobeKQaVdzFstxOt/X1eirAaTCsD/
 /RCEqgRwyqTeL0AiFbmUNYLl8kr0KxysdIX0kIZJbhh18SFdp5nJ54CZLSCDznk6aGLnwlMqmeK
 sqGpSLixV3pnU1Dz9gUzEbMUL72e+HLV8ZGaToBz02n1RiWHsL68R9i+uHRyCMudVBH2jkCdvOw
 N/W5iPU8w7kUYmTYu7S/kMWyTSeR7SuXW4hokn9+hD+/LgMzM1HmZlv9t1tHHPCH2VDZdmuL1jU
 spLz2npdex7ejFqSTT+RWIpzzsBS1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150192

On 12/11/2025 6:25 AM, Alexey Klimov wrote:
> On Thu Dec 11, 2025 at 2:07 PM GMT, Sudeep Holla wrote:
> 
> [..]
> 
>>>> Ah good point on confusing commit message. I just assumed it is limitation
>>>> of the implementation. I can update the log when applying. It is not spec
>>>> or protocol limitation for sure.
>>>>
>>>> How about this ?
>>>>
>>>>   | firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
>>>>   |
>>>>   | Some platforms expose more than 32 operating performance points (OPPs)
>>>>   | per performance domain via the SCMI performance protocol, but the
>>>>   | driver currently limits the number of OPPs it can handle to 32 via
>>>>   | MAX_OPPS.
>>>>   |
>>>>   | Bump MAX_OPPS to 64 so that these platforms can register all their
>>>>   | performance levels. This is an internal limit in the driver only and
>>>>   | does not affect the SCMI protocol ABI.
>>>>   |
>>>>   | 64 is chosen as the next power of two above the existing limit.
>>>
>>> Yeah, that sounds better :)
>>>
>> Thanks!
>>
>>> I also thought that this was a driver limitation, not the protocol/spec one
>>> as stated in the original patch.
>>>
>>> I don't mind updating the commit message like this (but I am not the author
>>> of the original patch).
>>>
>> Vivek, are you happy with the above edited commit message ?

Yes, I’m good with the suggested commit message. Thanks for clarifying!

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> 
> FWIW, with updated commit message feel free to use:
> 
> Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
> 
> Best regards,
> Alexey


