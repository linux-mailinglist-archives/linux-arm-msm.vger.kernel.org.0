Return-Path: <linux-arm-msm+bounces-87759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA4FCFBCB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 04:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F23AD302B76D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 03:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C61A24886A;
	Wed,  7 Jan 2026 03:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHtNnG27";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMFWdFvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65E23D7FF
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767755159; cv=none; b=qtQdGu2EASb0Xt7NTMOiVlGmONvsfTv72ersJu6R4uOa2xhqu6Fftab6mpDoY5Szr/6xcHrWRo6eze/Y2hQTQwItLMSUL3nCy0VGxJOLpIXt0dH5oEjXbgEqVCzDvdwUn2abvNk9SWq9T1CXT6bNiWvSzR55kL1Q4WQwLNEQGLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767755159; c=relaxed/simple;
	bh=rAQ06Z88Hwn2LryWnBTCSbjtOJsxXEV5IZvr0ON6Q3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdVcm0L/OLmrwuqtrWFtfrsw9rQteSIXGNHF8Ehvskz18ajxSaHnqRGVS8G9rr4e/h8+L0ryl6ue0gjNNQrCcK2rVWarimvYPKI5OHRl4YcAvfQn2xPUIQe8WjszW74vuv9uXG7BGiMSs8AFT212gcdx8eB528LmXqrpSnDARvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHtNnG27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMFWdFvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60731xlR731711
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 03:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvGndKIb5N4XZL3A8Y51r+7DP7X343aP2AKboj3Jbl4=; b=UHtNnG272vmuOg7+
	rZ81zhv3ldQSaSchWeFiASIaYra+GN+z0DRAlot8wkUNcpwxcHyeWuQ81CMkVjhV
	kRdJjaSLbSnZt8cSErdraG4JJq4gKiBg1IJs093G/Xz6YXqdpr/b+ac4XAm8Y1Sj
	JOOcS8XLiR6Uw6phwbomNl2BNz69ZhBYqz5UbRYwlYhAoDpCYp8vDL5N9UNt3vrR
	GlyzjyKTb6XRPYsgDmZE1+G+83GbXESlTIeNPeY/k3c+9x6nSfPQVqyngOvTls2a
	TfNUaLYqzzJVkqswdftkY9MzQaquJO0SivMuXWqebBYqy+/HBq1c9iaK1sG/JF2q
	39pm6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66mhhsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:05:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so30045371cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 19:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767755156; x=1768359956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvGndKIb5N4XZL3A8Y51r+7DP7X343aP2AKboj3Jbl4=;
        b=jMFWdFvjZhW4O6yhcYS1yV8uhqYsO5vFUt7hjEJXgznsNMRLrZYG7B2Wp9aveW72rB
         VA3Hoy6awLwFLLYZw6xvkDKBgzm8PVaHMwI1z496fSiLXbEGrKyqgQY6mK4ZnfWJH+od
         aensz0DttT7yxAIPJJ/q6FbOx2GHGf9cK4W4NC9/CRl1vB8hsdBU/vEse0WRYo9DPs3s
         ymg/CQmejDMXC7Y/eGE3s0yTjXBzGHAzffD8aKsWqqsPXxEH9lN+mV3c+2eXxLZyPOKD
         XLBBLOTGAXrwJW3ResTE1yw1Z4Z0nKC1fEOokubeSt40/2GH9K78l3cjhYY9vlT5G/BW
         i4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767755156; x=1768359956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvGndKIb5N4XZL3A8Y51r+7DP7X343aP2AKboj3Jbl4=;
        b=dQ7b8fdzRVE/OAMC8btn4WcNJJJ4JBkYstUFni1MPspNRO+PktNiQl4FeuCemKIqnH
         a6VsiYC0XIcazeEmzjvBWG4UTHmjhVRI8gBHjb0U6bnNfSosb4uNdJhBlw5v+ivAoPxJ
         ZeeDs861ZugMtCCZY5LPnH7HvFBBa8TfqydmI15hzI/qC7SJrI5Lnh0JsHzjAY8uGjbT
         sJTq345WGlI5T8ZMaMaqmQA/nS4MHWJnls2MlxIZ/6YlQY39XnCn3Z+JgJy3oiQDDkSF
         NAWTV1ifs9vVpW+tU/6tZfGBfdVldFUu4PK98kIl7J31TFEU/+L2oWPckamFKMlNezgK
         gyBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMrA7GSxPtYvZ8NuURMMjGpOejgJGPqGnexsG3PSc3mgbZCjJcNPMPZ4B7u/0XnZEZRL/ZdapLpXQ/aa8d@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGQV/KBx7/hsy0kLFETsdOGjkib7NVlpPBXedNtX2bBnPLnsX
	sB4MYBloBlxvNvLEw0vqeQIwBP7uGbkW1JWS5Y/TDcJSvIlnzdAhVAbl89n6ON+jtw4y6bbTQHQ
	R4HnxyaAj4LaCoeL6YIEh7TySLH6+l6GGJPzjTzjqkmGGA2sqQnGTQNFpcjy4AaU3gb25
X-Gm-Gg: AY/fxX4X0nqcE4subQMd3NKBtBrHrhyJHfn4nEliR0US8uKA/KqadHly2jI2JaHyQfL
	xG/rh3rECKMfBGeJcgTESg84SFA17RSsjMNbnMJAIhj+avYF1/rAN7OhqjJTcyYZ63JuU383BPB
	9ZNiQmeoW9vqLyNJ3zm5Ovmyo0RufRJuu3SYc/M00SVjW4UsyU7fKWxTF7xBGCQAfTyBvQObT7a
	N8Sa4tYOSugokbJfg7iUwHIcIojRyfEpjqt3r0B6Nbi7GyNlwdtu62y1m/Lr1khgpBPHRqAm/DF
	4We0uuIwn+KvTwXHimAOHT4t/yDFlJMRUaaPLg3wrfRXlp2Vrqhs+revQ9MlZqCwifpLILV21YP
	xiT1uNjQFMh9rIslI5XWW57xcwa6Pq3i+iCt1jQCFh18gfBeiPWJMqE0mmBUBrD831dtrvjdy
X-Received: by 2002:a05:622a:110b:b0:4ee:1ec9:f947 with SMTP id d75a77b69052e-4ffb48658a3mr13464761cf.3.1767755156138;
        Tue, 06 Jan 2026 19:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnvTM2P6VEISLeWEQbnH2/SIfYFi6hqR7SJ3jb/JPTEH7e8kWOEzE0kVLRufVXTQwxCso0Yg==
X-Received: by 2002:a05:622a:110b:b0:4ee:1ec9:f947 with SMTP id d75a77b69052e-4ffb48658a3mr13464361cf.3.1767755155568;
        Tue, 06 Jan 2026 19:05:55 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39230sm23060911cf.6.2026.01.06.19.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 19:05:55 -0800 (PST)
Message-ID: <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:05:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dEPtnLRnaJD3Z68C6dvVMqe-wMcJvxKp
X-Authority-Analysis: v=2.4 cv=PoSergM3 c=1 sm=1 tr=0 ts=695dcd94 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1lMvVU9yvT13_2MUe8YA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAyNCBTYWx0ZWRfX2tI20Rg9wlOP
 srNIq/qgc/n1b8jNKoqZh9Xyi7dc/tol1vwEhzMz4eKVKTeHY8nld4wg/AUuKCmHxQiZpew9uxW
 haMu5HUXIvlKx2FFxRSEC9c36cyikXinsOsimxL3Xsu6ItFL25FdGYyfSZKe3I3xEA8g8VermXz
 FafHpeGTTItgFKbsuMK5Dy2d03xoffAJ87UshZPk45+DhraFhvTmL+nIB3Z8aAGd+1KOvPq5thn
 2ERtmcLkJeXN2v+rF5O5MkD4UJEAv/155Fn98ByT0dvkfmZs3Kp/JLnIEsBp3c0uL4CfKIhwrWJ
 nS3YdZOyiRWIaIgozX44nHLJpgSuknX3GX5nfBscd5lSndRnc0FKvvNT9xMMjm+ynwBGm8FnxWF
 HngAaGcbwDlkOfRwp30iExaoXlKJ1Npx4PlWT1QRkj8qz43Nm60YP1eSzSFjV184sb4dH2BymmL
 wCp9BjXyu2IrsNzvKBA==
X-Proofpoint-ORIG-GUID: dEPtnLRnaJD3Z68C6dvVMqe-wMcJvxKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070024



On 1/7/2026 2:23 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this overlay reflects the possibility of
>> attaching an optional camera sensor.
>> For this reason, the camera sensor configuration is
>> placed in talos-evk-camera.dtso, rather than
>> modifying the base talos-evk.dts.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>   arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
> 
> Is it possible to attach other sensors? If so, overlay name should
> depicit which sensors are attached (compare this to the RBn boards where
> specifying "vision kit" defines all sensors attached to the device).

Okay, we previously had a discussion on this. I will rename the file to 
talos-evk-camera-imx577.dtso.

Thanks,
Wenmeng

> 
>>   2 files changed, 65 insertions(+)
>>
> 


