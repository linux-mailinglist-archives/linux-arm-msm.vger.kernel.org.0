Return-Path: <linux-arm-msm+bounces-66954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA79B146AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6364164343
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 03:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19B921FF4B;
	Tue, 29 Jul 2025 03:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPz6W0iB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59E1F76A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753758908; cv=none; b=rrJM3mzZS48vuQKA4nsPwCUwirMzfoLoAbLLI+38+VjwoF17czfSd7Ha5d4Mgi8qqSpi1WUiHi/j4Pd4cWQZ2dis92h2QyjYQN6p7dZEqVR/ObHuwpGFMxcuiQ8wBPrwXRXty4x+rpX7VCuiJ8V0U9c6yik4GoCSPEUtCaUH2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753758908; c=relaxed/simple;
	bh=GHmdw+LZq3sxJY62O+sHbuH790EMm8iBdrTDQg+YAkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCMHEGGWoakaWHwpHfEZxUGpN7tUE5JacurlJ0EDWVuDo41wVos+v/dKGGn+38FiQkxiTLPQVI25ATH3phYGBrDNnhURY+dOZ94RJfcGGG+4x/ZLMO2eakhCjbKbc7eYoBYQPK4AhU71pCCwtrEJs05ZL3A/vYyqXIRjhwz9wPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPz6W0iB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T0278x017661
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+KxXIkqbzjBGr5vRnRk2sdhKE3MD5Ak/KadxWElxQAI=; b=dPz6W0iBPnAWNh0X
	289xMEPISgZerETop/Q3bva5xdQODTGleBgzGdpB5Y8lIbHh2UbKy4SXYbHCNUfu
	OWXPP3T5OVTuE63q8qsloEyDTydSteFO+nNgYrrdhhwLPTldHk5Kdt5tqzklrQWp
	eou+l1tj1tk3qRfr6lX9we7eftZx8q4SOhRVds+anP4NzNBJhRTldCAvBxMie3Qj
	JFh8ZP89+w/3fHqH306nfecyr2elObnqcPuqtfBtQhTneBsRxQI5yJsBLM0tx60J
	3Zx8uDPSQK0nXktZVMsAfWPaTFhYjLoNDLM/u3wN01DdDkBUDUnyCCWTtEJNCwX1
	KLECBA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2ehew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:15:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23fed1492f6so32779915ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753758904; x=1754363704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KxXIkqbzjBGr5vRnRk2sdhKE3MD5Ak/KadxWElxQAI=;
        b=Ie2qiiyaGKwq8ssw9mQDJNf1xptfrmnggAjl/cMGcbVk+peRFyO9DBOp6czvisBqwT
         syT+3DMyiUXuxDBVmogNNVSrowyPq8Nx65NFiOPZeWpZq2lOBrUf7/TPRBjprVuwECQ+
         c2O4k6ql4GuYVEL8oMxLXz/EdSd8mOIRIeEz5QVivYTq6ycVF6ee2RqFuteyTA4g35iJ
         7OV+L+aPyt74lLoefIJEip2mL1pBR/t3kXzYuJnMw7mvUYVUU2New7pzmRhMjP0c5a+2
         elhb8kx4qqmypaYE83yFArhpJiQ5x10rqKUAPUoFOYdSLpXQPZrtZb16XfhgxCU7SFlK
         bOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk9qvfYpq8Lg12kY6ln8NzVKa076T/MVglh0UYs6FhG//KTeqQ8KFuwe+NgAg8HtXqvsIyMpFJT76sXZjE@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZP/NGzeeZtTYjIvC3fHKBgWEfSbM7IdgwFwBwPICLmZkKTnu
	zxiMzlZAw41TnzboBgHMZHrQoxa+a2htefx5I6M/WQMpiGrT5eBqkJgXy1d2W20iUYQpG5bT4bA
	8u7uvgzQHe9B/TKLNX9qPlWOXNchpAkVYDIp4GwLkB0YuKgzsvxw/YBNp4m7yZL7ZAUpf
X-Gm-Gg: ASbGnctFZunBcJ2LfpES3qNqqSHA4CGRjuzoC3yh0kqiZ30i5Hq/2QxgPIIcwwpbie7
	fBnsZWXSUF20S2GzXD8JJOYM2hr2e0EHHzGL9MLkMIKNowdJjw8e0SosX9lT/DVX0jdq9nOcI9g
	y3sfYXeJhd2lyB2+sYuDDp1U1CMiS9qMHl6vFoLFNuBAa6J2SATov5FxZw2OoPZIWUVwuZV7NCa
	8ZyHNo75i3ZB8vKrkI/xOEenvBnnHTI3rYvKWPsqI6HS8mIEah/FAilIwAq6l2dXxmFBqefVKhv
	uA2oahcnvYFjIwHNTq0CovfP5CKOzXzMZFzH4Xjqy/O8K+0RmF9K846bFLhcW5kziZ1o9bOoGic
	gSA==
X-Received: by 2002:a17:903:b50:b0:240:1831:eeeb with SMTP id d9443c01a7336-2401831f1f9mr77116945ad.40.1753758903591;
        Mon, 28 Jul 2025 20:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3+knxDm31O2rClWjozM3+CecgvNZoNp+cf6nrVr5Lm6XqDELyjYKUNByBB9MayBRtK3ee3Q==
X-Received: by 2002:a17:903:b50:b0:240:1831:eeeb with SMTP id d9443c01a7336-2401831f1f9mr77116615ad.40.1753758903134;
        Mon, 28 Jul 2025 20:15:03 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.228.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffdea35d1sm44404645ad.28.2025.07.28.20.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 20:15:02 -0700 (PDT)
Message-ID: <9b9c4572-9afd-f77e-07ea-ad1673feee47@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 08:44:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
 <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
 <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
 <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
 <2a39c0ab-edd4-402c-95a0-a6286f03102a@kernel.org>
 <1926e6e0-70a4-67fa-5e91-cd0155af1eac@oss.qualcomm.com>
 <2d672126-ca4d-411e-89cd-f40f8d8a4f5e@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <2d672126-ca4d-411e-89cd-f40f8d8a4f5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TYYrNWz34qI-8X2UiL3HAIdhKmzncwA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAyMCBTYWx0ZWRfX6cJhj37MCQL+
 lYexLP7EL+RzCuOZIw5WFnWo+IjKo4jY2C5F143xgOaYhS8MXjJNJS3oYtTOsZaK+dNRjM18+fO
 Z/Lwkm/g3VUcyS98F9Fcaz1oFyDz+KUmLceh484HV7VJqLMnRqyXvDse6wpgxFHgV0xkXVAeRtV
 2lQ2+sIlxrWiQpJIAlGuw27ai8WXIsVC1VG1J+Vb13JxxpqM0iKQjyCbTuuIMuV8gs1QB2rwolo
 aodJOPpwOB5fqJ0eovCoDcSv3uidy9UpmHtaNZBcZc2uh3eXO6tUeirAr+U8xWO48TnQqQs0tfO
 MAWfKHJ8UswLAbL7mVKGe5a7qfOFdSTdXOCAZsoalnsCwcIQyFcnwqZJL0AAKWc8kUdSMal9qYd
 ip/BZnavYMVrzLQhUaoxnKh9EOgjMrtgMXiIls7wF8Y85MEXcj+1Egg9cNFJ8InGbdAMvh3x
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=68883cb8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=URdbDvd2+uEZUUOZgz/1Vw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=jnCx6B5Jve7-ZDeCMK0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: TYYrNWz34qI-8X2UiL3HAIdhKmzncwA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=738 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290020



On 7/28/2025 11:59 PM, Dmitry Baryshkov wrote:
> On 28/07/2025 18:54, Shivendra Pratap wrote:
>>
>>
>> On 7/28/2025 5:53 PM, Krzysztof Kozlowski wrote:
>>> On 28/07/2025 14:03, Dmitry Baryshkov wrote:
>>>>>
>>>>>> and the reboot-mode is defined in the
>>>>>> previous patch. So, I'd assume, the path is defined.
>>>>>
>>>>> As I said, path is not. only psci/reboot-mode is.
>>>>
>>>> Do we have an _actual_ use case where PSCI node is not at at root node?
>>>
>>> Yes, many cases, because it belongs as well to firmware node.
>>>
>>>> If not, it's obviously a deficiency of the schema. Could you please
>>>> provide suggestions on how to describe that in DT schema?
>>>
>>> I do not see deficiency. There is no ABI that psci must be root node, so
>>> there is no issue to fix there.
>>>
>>> If you want to add such ABI, I will answer: no, don't, because we do not
>>> want paths or node names to be the ABI.
>>>
>>> Compatible is the ABI.
>> Will define a compatible for psci->reboot-mode node and use it to find the
>> node. Hope its fine to define a compatible for reboot-mode which is defined
>> as a property inside psci?
> 
> I think it was more about finding the PSCI node.
can either find for psci node using psci compatible "arm,psci-1.0". And then
look for reboot-mode node inside psci.
or can directly define a compatible for reboot-mode and find it using compatible.
Is there any other suggestion to find this node? 
> 
>>
>> thanks.
>>>
>>> Best regards,
>>> Krzysztof
> 
> 

