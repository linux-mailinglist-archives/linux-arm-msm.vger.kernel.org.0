Return-Path: <linux-arm-msm+bounces-60558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A86AD16F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 04:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 881B53A80A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 02:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9382459C9;
	Mon,  9 Jun 2025 02:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4sPMCxa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76402459D7
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 02:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749436780; cv=none; b=aa0uHqig7MAf6IyGHqmzg9lA6EAD8FMG12J8JEQQ7IcZiFgZ6QQrqA3ZLeICEX9imYJ9WSqYoF2VmkqaGOtVnsLHUN7TNDUiiLPmRertDsuMuZ5MIol+lG+SVOZNLkDZfYDrTpmrCv4a343RK6ctrSHEIKcRfLLWTuk0Z5Qdy+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749436780; c=relaxed/simple;
	bh=W1QQ8EhK3mzfRDvT+gNkm/YvjT2L1IbpLRckPRMZEXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCZCSKSsINMVhmQBbErDvO3bC4+oFRl6R0z79TVcYlrQbvvmuIfEYqqp0ysgkt+8ZAL+71CvOP4wZnCRyU9KqYZDkprmb/pG8FSZFKFYeWvlbHhOUdx25cyW7jZj2jHt2sAp3vCnSZF84t4+5rJRdLWJAGgU3McSyVOe1Qr+7Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4sPMCxa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558N7GbB007532
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 02:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79gimwLuIKakCRJhBaQFPvGydcA6kRtFQU9q5zp1ZW4=; b=n4sPMCxaDd1XQG3N
	00EpkiMhQYDs92W2FfGRxakPOUnqHvpy8ShPNNIEl5Un0KEbFCyqhGOf355rSw8n
	DQCVSF1Kkp8CqsVdqK/JuR7LZfMgVsNKKWotAfWH8XyyO1Lq73JES3S7qUdl4KPw
	X1GK62kk5thB9v77x2y5YTOjXOWjVigLF1A5+8ZMArKvvouz4sZJNlfW7t4IxFW3
	KK4xDc7pCgRXw2WjiFnFMwL5SX5UgXeFH0A74olRglRRuhotek0jLczGrYh0lbpB
	YCTitK12bXdKBKQqMiucPgzTqNJ0xDJOtf/8OrIhwSeN6ynONb5Jhj4wFkzK0xEs
	WNDhcQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcc7t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 02:39:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f6b829cfso26045465ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 19:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749436777; x=1750041577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79gimwLuIKakCRJhBaQFPvGydcA6kRtFQU9q5zp1ZW4=;
        b=bKLGueg0XTVEAoXgcUj4yEHcK8arDKzCzEBGsy0vYbcx8FEgD92I7bw5dPfbjhP2ce
         kwxsFhF6O0q3dyUiLGvBwdk1x/9g4LlDrb6C9cfuBm5rXJgcMc6dnWr+PKb7hMn9km2O
         zgE8mJClhj8pmszyTpG0vpADb2941JfR6VA/Q64WlqnSgnAEBdHCE337lWCAohtpbyN7
         8aWIW4nfS92zH+paH4f8RMKtVcJ5fccxUyQDd0smLyZ493wPVrlm+xf0lPAuCS2ggGul
         bcOIdR2uASHKxq3egWRW68fEz3x7IKn3nX4L/vztInkCKgSv4xryifG5qD5jnSg89nP5
         nCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHgWNLqf25pf3b+50eNlJlZnpZMpeQ5/DkI3BsqDVV0kbQraoiuTPNZ+bNULODZ8bMgU73SioxQCyJ7Kf3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+L00M+IS22RUMm2jCJTcw+vu1T/Onx0/BZ78/7p42TSoGSRm2
	D0/sDvYkg5GE38gR9rv3L6tacZxmbDMSQTtldGLt98z3FVuYccV/nGfwrBvnfEW8aHVwpyUNU/x
	PT28lS/VJTgVl7D1pOQ3xee0gpt1856nnAOycaSDloT0uoFQZSzNZt5zErZ0SvkkYlV77
X-Gm-Gg: ASbGnctWe2sQCYFGFzZ8/y1aU0StwBQY7pgZo7iHWir7WZGgb1+BmIpf9jo6/afHkNy
	XBRmRSobM5r9qHlp++JQbJfySJf1/ntMqRcMhofyJUyRdoz3r8DDduakClsNwFE1rjsWPuldazr
	AGPZ2gWbJFgxEOe/0DQFs2dGhkHByCH9eMQeuSV5wcD8c4cB0cZO2AoyOhnUgzLZhNz3781ArBu
	WT8riiWOmSZlbGwn47zQPEzZaQPcDOTNZb0C8tYaUoAdHLnxJPnX7xcZ0athhrQ6fasGceOSdPl
	zqtUBvnwlDnhA8BxYYWC8ZiuGSpxU23S8K0eGIqwlqLSjxlDuXIs0jbn5SHQTmFuBq0qtdW37VY
	O
X-Received: by 2002:a17:903:1d2:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-23601cf2febmr150513705ad.3.1749436776972;
        Sun, 08 Jun 2025 19:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdAMZcQZB+gjb2bkDYnCpUx//bQkJ+IMD+7wz3jyE7yFtKOaFJOuNjUmz081sjRi+XdKnPOw==
X-Received: by 2002:a17:903:1d2:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-23601cf2febmr150513435ad.3.1749436776554;
        Sun, 08 Jun 2025 19:39:36 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b13addasm4592062a91.34.2025.06.08.19.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 19:39:35 -0700 (PDT)
Message-ID: <cf3479b4-5f02-4d19-8164-306214966248@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 10:39:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
 <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
 <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
 <219a46d0-446c-4eed-8809-4f2400de0ef9@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <219a46d0-446c-4eed-8809-4f2400de0ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAyMSBTYWx0ZWRfX7alKaU3UYTc5
 0JV5XbnkzGQtv73lCTATEqaBpFI6BRPBOZlZFmnpt55COTWfwUuHWEdg4aOHoKcg0yT3vrArVDd
 +Vqjy8TcClbUZMAiUBjumhwyjkOazrPqBVBUVUvu7Cpe1oaje0QSuNaRLArlJfvQ90rR/NqcQ6Y
 jBLpEbm6GUzRCD7uLxDnjDIttegFbqJHH2YzGyiwysgC90U8WO4NPQw6HcYXXUP4EgOnz+9iEF3
 39rcuwH9JMFrpmj0y/cPq97mMsmj7utug6WyA+xLJgq4WXBnfQ2HSqvlzoPvAeVOOXSUJ+wS+3d
 h495vHIYJCq7SS79BGxDlrzZKT2g6ah/YfYeO6avYoG9oI0PhCw8whaa/IHjgdvnCrthDA6lt5X
 sJWFDLeESnQwfbdeukMgb0IQ6TPf3ls3ylUSX52BBIXdvA4GYlkeuHS3ZDhc2s8pkBCsFjrU
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68464969 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=g7_sT98hAtsvE4oCy4kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: oZXkwwC6O4fzT6d_izHqyKLioD58h5nA
X-Proofpoint-ORIG-GUID: oZXkwwC6O4fzT6d_izHqyKLioD58h5nA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=905
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090021


On 6/7/2025 5:46 PM, Konrad Dybcio wrote:
> On 6/3/25 12:37 PM, Dmitry Baryshkov wrote:
>> On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
>>> On 5/31/2025 6:36 PM, György Kurucz wrote:
>>>>> Add charge control support for SM8550 and X1E80100.
>>>> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works
>>>> well, I finally don't have to worry about leaving my laptop plugged in
>>>> for too long.
>>>>
>>>> One small thing I noticed is that after setting the sysfs values and
>>>> rebooting, they report 0 again. The limiting appears to stay in effect
>>>> though, so it seems that the firmware does keep the values, but Linux
>>>> does not read them back. Indeed, looking at the code, it seems that
>>>> actually reading back the values is only implemented for the SM8550.
>>> Right.
>>>
>>> Based on offline information, X1E80100 doesn't support reading back those
>>> threshold values in battery management firmware, so I can only use the
>>> cached values for sysfs read.
>> Which limits usablity of the attribute, it is now impossible to identify
>> whether it is enabled or disabled. Is there a chance of fixing that for
>> the X1E80100 platform?
> Is there a chance we store that value in SDAM and can read it back?
>
> Konrad

The thresholds are stored in PMIC SDAM registers by ADSP after receiving 
the set requests, and ADSP reads them back during initialization. This 
is why ADSP retains them upon device reboot.

I spoke with the battery management firmware team, and they have no 
plans to update the battery management firmware for X1E80100 further. 
Consequently, they cannot provide any interfaces to read these 
thresholds through PMIC Glink.

Reading them from the existing SDAM registers requires adding 
"nvmem-cells" DT properties to specify the SDAM registers. However, the 
"pmic_glink.power-supply" device is an auxiliary device created by the 
pmic_glink driver and does not have an associated DT node. Is there any 
method to create a DT node and add DT properties for an auxiliary device?



