Return-Path: <linux-arm-msm+bounces-83932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2335BC95F75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 08:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C3ECC4E059C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 07:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159152877D8;
	Mon,  1 Dec 2025 07:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azL5Vj7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USTpo+fd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D9A849C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764573076; cv=none; b=u5nuIwkDupy74vuPUeUMybPJN78bNVbNRWlFJSWGIa9XvN3/XCJrVj3hqrO2UmKmIWW2fmNykiM4UiFJT7hVIfdSXrVYGyj+htcsK2BFcRy2GJPH6y+wVmgV8bphOd7ED852gMOB+SuCUMY9BtYM4TdN3ylxKBfdqhx+EAGrJLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764573076; c=relaxed/simple;
	bh=rDCBtEEOteUS59qyp/mY/JmrntOONb48x4fj63NKks8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtXmKdrFpNQzrit4H6Zp5NVXo1KbzC20g+qhjelGnlXdgZcM1a/jYrzGCIdUDHqwzFA/gb4tnyQd/SXEuPquzzsOlJlOtHnr8IYM3MAVcThYz2j9EsBgeDUw+8HvdbnhHY7H0Hx3wssWIFw/tMM5gKpbE46+unEc4Zrjp40Q8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azL5Vj7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USTpo+fd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUMR8JP2809492
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 07:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0DBhA4APM7ckJYESvR1SavaCBoSNdbQNFksJ0sPp8o=; b=azL5Vj7U43UiGVNf
	t1u3JKmcukWW5ST7CnSUa/jPDC8Cb7KoKmsXxTMu/Yv2uTULcfdhyWvbpAV8C1QD
	SwTuuakxWZpKI/YFquwbi6KC3ZAphMjBuYD5VpNpFR8L9xHpC3Aus9yvnqcY1Rpd
	yVBVYpeisIUAtNtrloAaPEuakX2byiEfK7V1+ZIQOtxYb+CTrx9szb/0Wx4hhaYZ
	A6PGFc8AMWD/T+aMcPlI8GLdE0JkNUa2ABxO1GUlAFdJyU7e1Xx24lkU6JJ8JqHB
	Z62l2gbGzaTbuhdUW47azvz9RCdEUshZu/jnCVtu4uTG0WBkMevmfbEl3RTbEXHa
	sTuifA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqyw5k625-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 07:11:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f48e81b8so50906785ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 23:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764573072; x=1765177872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0DBhA4APM7ckJYESvR1SavaCBoSNdbQNFksJ0sPp8o=;
        b=USTpo+fd4a512s0TJNbOT6XL3UOGxeDU834GEIjBLtrVl3SlziAjnwbUnknO8xbQvM
         pypv667SQGQpvJptfTZ+7wHLXgSUcwoAmGD79+V7aWku5BxlCbv4+P2cXE3PTOO9Wb2m
         rzWr6aSKeFifOy756+V1lzyAD9LBgw03uXwycJRqztFc8g7Y3C0Pt/HIQplOD9dtYjZt
         KCn/eH5OO/aI6p1vW9qM7DFssWSP+RPhn+wx/X5U1T9qf3o3bJgR1d8kmXDkZOh0ZpNp
         yk20amcoRzi2onX0hbRXFZ7WfAO9ROWvg9OS65B7CgQXyxTF9BLAKK69hvsp9FTeIxks
         5JbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764573072; x=1765177872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0DBhA4APM7ckJYESvR1SavaCBoSNdbQNFksJ0sPp8o=;
        b=j31qD0LHRsKCIFX+otaMdr7aIDa9mkjHUIScMyAYLM7rOe78qZeCAnxoixqvRG+3Bo
         TD00x1Hmwg40W4EJsWjz9tyc9k5oxyVRa2CevJeaZ03e2ha/iVfIMCJe2H2V3OHYE3JX
         CvPbLZLKgqGCz4l3bDUCJGd0IQPjCBYk5NxVF7o6p4xD1gLCV++q+FVmcz6br+DcJT13
         2ej0R65sSgW8zJhvsLbfgaKXiTekc8khm/QBFZNx79XXUTXGSHuQUnHd+xelthCqhy0w
         Yt+UW9EGHYoN1vgQNOs1zXJY3l1cPnSKnLGoq0nzUHNWZDyxIvN8uCtWVGCXJ2ymxHJz
         kSuA==
X-Forwarded-Encrypted: i=1; AJvYcCW0n/Q7eppeDvRm5kO9g/f35BE5jIi7KfYMjtnZg03x67x4WfWXXxjjgiNk70/1OTJDzKBT6+5ndP8kAuPP@vger.kernel.org
X-Gm-Message-State: AOJu0YxXN2KGKEZMIC6nq87aC3IdTdK9JYvZOVeR+jw23tHvSC7rC0WO
	JyCop2BHR994aWMI+1VdunZYIYaLPXklDmUwRK+aojkR33WHGTVXDE7RfWfiqqUqcJAs9d7GDNR
	1hQW7Kxd1Yd2YrtiIs7e99pTa0wQk47As6f8aRMDRffxLfSTf5NRf2F9y86NYpiKauK56
X-Gm-Gg: ASbGncsSFE3WtecVii/x/6LRxODd6xX9nyUBDtCq4OwdN42lyXsHSDKCYMBMsrUX1ON
	uzzQDTlbvzFN6OhUUDyRNbL4FilPEJAHc0rySl6pnjDLFw5dDpDLyMF3XGCF6CUFibr9yYAbZVt
	kCAzwbqNDkBYhtSXMes/GiJTCvsyhkAm53bel5vK3i//XPduswceR2eu8lvcJ5QS8R9Y0E/ewhY
	gyeagkNI32DcR0H03uJMdNStRvJ9mpotbncDgytFICuIdYH2EZbxq6H49N2ScmnmpiQ6InFHbVR
	kCi8p4/Mq2jYLnrHCktM+97WlNChdR+DgbmYhqm15IDpJICsL7zNlnNEkWykuSp5U3zeS+zbzc8
	EkIt8J0hcRiMXh/kgJfoqa2Bl2H2h/IPUDNd8
X-Received: by 2002:a17:903:2450:b0:295:55fc:67a0 with SMTP id d9443c01a7336-29b5e2cdfa5mr480566985ad.2.1764573072297;
        Sun, 30 Nov 2025 23:11:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBSVEe0Tn5+2JsGpiJjdexW6mwmfV3k/mz1v3N39aM0M+1hdMg3shd2xdXreI+rlTDYIWJIQ==
X-Received: by 2002:a17:903:2450:b0:295:55fc:67a0 with SMTP id d9443c01a7336-29b5e2cdfa5mr480566645ad.2.1764573071713;
        Sun, 30 Nov 2025 23:11:11 -0800 (PST)
Received: from [10.218.23.240] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be5095a4821sm11369241a12.29.2025.11.30.23.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 23:11:11 -0800 (PST)
Message-ID: <ec6512a9-83ce-4d1b-86f2-2b0153be6538@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:41:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: q6dsp-lpass-ports: Add support for
 32-bit PCM format
To: Mark Brown <broonie@kernel.org>, Ravi.Hothi.ravi.hothi@oss.qualcomm.com
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
 <20251118100203.2751955-3-ravi.hothi@oss.qualcomm.com>
 <1c35a2ce-628c-48a6-9b04-a66ee1edd04a@sirena.org.uk>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <1c35a2ce-628c-48a6-9b04-a66ee1edd04a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hge-y6dlNsMljtpGDngZGzlCs7SsTN3t
X-Proofpoint-GUID: hge-y6dlNsMljtpGDngZGzlCs7SsTN3t
X-Authority-Analysis: v=2.4 cv=SoKdKfO0 c=1 sm=1 tr=0 ts=692d3f91 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pufVwnNvbYLpBBpy6YEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1NyBTYWx0ZWRfXy5tcCG9w5Rvj
 J0nVbvKL+qKsTbbFKLQoTOpC4QL5glY1AZ0uxWg78uAdQUB/YmUUtYD4bP/xMYyXXvJnphmsa21
 jMou6W1ZzDX0nwQMwR0g0zp8STpiF4kIHi9Idk2h43b0/W5I6wcESuwCySEBbO9wvZCy53t7zZK
 bK56QdPno7kJxyNAmzKJRAHWL+t/e/ZfdJbXEoyuYa8xlJb12NVS1k76neHkpODZY637U7uznUD
 nucsllTEiRPXu7M/93Mp1A9NZjS5FV4feSiipN1QLJ8570/WH74qQ6HYbePEz0vEw1IETCUPb90
 mHZuKp54o0cablHFAE1mYqAhJjL6ITgQFbrL9SVV234HZz2KkGzDI13aJ2WHXXgEjbVCbPqIAKa
 I23lHlGxwOiIEvXWcWGG73JhS42w7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010057



On 11/19/2025 4:34 AM, Mark Brown wrote:
> On Tue, Nov 18, 2025 at 03:32:03PM +0530, Ravi.Hothi.ravi.hothi@oss.qualcomm.com wrote:
>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>
>> Introduce support for 32-bit PCM format (SNDRV_PCM_FMTBIT_S32_LE) in
>> addition to existing 16-bit and 24-bit formats. This allows handling
>> high-resolution audio streams and improves audio quality for supported
>> hardware.
> 
> Same thing here, this is a constraints only update.

Ack,
Will update proper commit Description.

Thanks,
Ravi Hothi

