Return-Path: <linux-arm-msm+bounces-89770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4540D3C097
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9AB7E4F47FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54AC38E5E1;
	Tue, 20 Jan 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTtPkhIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHwTrMCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34B4320CAC
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768894049; cv=none; b=C8rgS6jI0CkgSrIwHT+1o0rl8EYQkIZ/NPEY4M+/09AqqQpii5OtH3zpFKfqdAMelp8aKlsFvFcrNyrFjDhqXqJA17r94XUra/fX/FbFAOyfVHsbDTi4HfWdw/OV928WIb5FuA1XUZbDhAzFAWuspdrB9wYYU/kyiHQF6qxat60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768894049; c=relaxed/simple;
	bh=fdWX3blyu20K/5ybDJkaMz6YkTp8JgjkYflTGmFz5VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I40qmu+z4cJ7U6DCI23QGm0EL9VvQ+EMvwZdvWM7BV14dWDZfeceCVXBQhRgSIxSP7cDhzlhvUIcEwlHQ8CpTxxiNARiuIuWDS8iK0wlZq3Q6os3ORDM1+PVPDaJXxRyPzplyVyXv6IN7N/ypOObgeatkCFymYll8JJNhOlGiZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTtPkhIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHwTrMCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61VnT3772351
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWUV70517N/NjH3RfBgQSOZERAP2WMEQGxBpe2gg57g=; b=DTtPkhIPY7U81hHV
	74q4caGWHWFUpa/FDO0a2Ptmiv1eQYJ65+L5CQGiyhWqcaFV3LuqpbmPBYAcH0Ig
	n5YaCPYJRMRab+Bv952uW7rcMDou9wn3Ccb4AqWoMvkLut40LbnoGkbMBvVxw5Y4
	6vdokaDRlhpDmwyPrHvnZFetZm7XO32mDktClCSZxZli+1cWi1781c7GLx4beUg5
	j+Ps5EQB1M1StwwdBkh9eEXFyZm/FRAPxE1QkXr82XWbp/S6/01kqqdRTcJcGN2J
	5ONXhda96ulevmpa0jTRW5Kp295tF5HXbTxHYfTJOeU7hlrVyK7Vj7hWy6Q9QOVA
	itP8cA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt42wr4ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:49:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81dd077ca65so3908155b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 22:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768891780; x=1769496580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SWUV70517N/NjH3RfBgQSOZERAP2WMEQGxBpe2gg57g=;
        b=bHwTrMCSc7/33O52iNtPUw94318E2edfZUvLp0SJYlQYAVq6n8V9zMH+0dOx2eo0dT
         J5dSIpRRtrWNMOhNeoFBJQ7lhyOpiwhSH6Q78NcdtAKC8VcPppG7XoPOW8EgjE9KqdX7
         Ha4KJlbFLpOpuS9fMJr2uH+bP2vk+oVCcpHScqyrsdSm9nRpc8tcp+27jfGQUJ7owFPZ
         DcydAwVHXjrwY14/vlovP8pRpDZ3bESEr/qaxN4LV1JHbZSbxBmr1qUtyQZH0MagPqRt
         2OU1Ve0WHug8G2pWiFMORzDCxboT3PUQjeRXNOop/wJZbWn8Xg4yx7tVYmJrqM3XqCxW
         o4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891780; x=1769496580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWUV70517N/NjH3RfBgQSOZERAP2WMEQGxBpe2gg57g=;
        b=q9BKycMpoqnGWfcCt+dAL6ws2qegqXY7OJrlCH2WGUdmRTbxr2kjwtMFVEflCc4BRL
         /JBdLEP0AYXJeonyxhoSgq8vGATllaz/Ghm0pfdaL/J+5hHnv7qYfO3pWVRf8quJu6TE
         qw0/zsACVGGSN6ZNyK8U8SVyazkzcHuHwpOEYmBlwqRceh56n1cXSewi6tYSr+eVgeEQ
         Dusx7TRYoCGNio6XTxBJwWh+N/JHIl3S5FVT5ETpiIb5HGamB1I72/w163/qq0fKZPg5
         7K2m3i1Lr7rvZDyZ3Edf4oIJu/6t+n26A1Ghg5hmZQwuwhLJ9d360j1QVfJzo6gHVPSQ
         YO2g==
X-Gm-Message-State: AOJu0YzdpdLTBeytP1puBBDWcu5YTWKHahQqQ5rlPN/Z4YwybHGjcBo+
	V60Upw2e6P8AlnCYlf7tWc5nVFkqETJGLKjHZyFPPolXZY+wePuFuZB9n8xCCoq9OWfmDSXAPUp
	zSLSec+pYTHOz8DJwQ8Pdrm78FxVSsG+GdwKTcn+Z0rlem/OLj5akAQ3AP0+SmkZ38pWm
X-Gm-Gg: AY/fxX5eb0tT+p/baou6Qgt8vT1PNZh3XYD3coSrDt3PMQAASQAsSDzvQgFAp4g7bfN
	f+jCgtKjiupHYeMVtQdYCY0Ge5bFQAIoOu2gHWqRKCIuYce3HcDMLh4oiYmEGxMaG6D8HqocIVD
	MVGHP4paL/8BUeGIrkNJVcjorH9oVT2+FEd7XoEj1vVqa1Oj1IX18zZDsLzzBo2mnFF+CuzaPVa
	e5Ld12ojPWzDJisuvLzH0hOSgGGSRhzR6Y0BEz1gE6eUbNi3I8AG9IC9j8aEQMR6vrWVhoIgodF
	5+9SCEGnw44yqxQktCAvqqTbTonu/2sSGvX28spbbQMX4spokAd218ZOjVX4rt34o8Ch5M8NsRV
	M8MUftVuUgCVpHhbDyeSS2NXkRWtOkYT7bBX1jhloP061shSA6bvi1PfpV/NhkuzrSgEFc3Ux6y
	4ie50=
X-Received: by 2002:a05:6a00:1805:b0:81f:5acb:55e5 with SMTP id d2e1a72fcca58-81fa1771fdbmr9503387b3a.2.1768891780059;
        Mon, 19 Jan 2026 22:49:40 -0800 (PST)
X-Received: by 2002:a05:6a00:1805:b0:81f:5acb:55e5 with SMTP id d2e1a72fcca58-81fa1771fdbmr9503379b3a.2.1768891779584;
        Mon, 19 Jan 2026 22:49:39 -0800 (PST)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108c23esm11121555b3a.8.2026.01.19.22.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 22:49:39 -0800 (PST)
Message-ID: <ba0f5539-011b-4778-8025-16950f5e5a62@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 14:49:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
 <d15bbe2a-a88a-4a88-a685-ecd4f058c3af@kernel.org>
 <3404f2f4-7edb-4bff-925b-0a6a7a450f5c@oss.qualcomm.com>
 <0cb38b14-13bd-43e9-8dca-3d78afd62a28@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <0cb38b14-13bd-43e9-8dca-3d78afd62a28@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xaCXnrz1oj4BVBOpTB49POOEdX8diXnQ
X-Authority-Analysis: v=2.4 cv=eJMeTXp1 c=1 sm=1 tr=0 ts=696f2584 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1ir06EIKMARb4SxFNewA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: xaCXnrz1oj4BVBOpTB49POOEdX8diXnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NSBTYWx0ZWRfX+YB30idEijet
 IkGL6cF+iK31kR/ja/96WNCKedhYR/bpKSQe0jGiz0YF9+osao78Tv0vaaGeDx/2s+TA2+fnSpB
 55Gq8mz/OUy9uuN213+t7h+rjYRIAFi1GZPmsjEf+YSNokETr3MgHK+/EO9S+hNPqQh5w4N3P8k
 T3svpAzO5C3qeV3sEr4bLTJnT1K48GJa9t1mrwgX4UyGZjPqnAJDPyc5fExNe4jElxOHgyFYaki
 sHFmrx6kRC47RwalrvXUjJlyoGfmy6HDv0/+/8DliuU3N2IcCHTmI86SAjrnM18MpnrinjQpw5v
 z5kal2Hx/mpjoMSNZrqXt7ChM3Kmt7WbjZcOe3CkYOwyF04FZxoYGJaaEQMGosiaMDaClRyINIH
 Wk4GCQ6QgQmNUXL5uJbQ0q2qwWRfgOI1rO7jCNB/8razNla9elaz+pRw5M9Nq8USBH4egjOegHW
 z193wvMK6n/VL8moqFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200055



On 1/19/2026 3:05 PM, Krzysztof Kozlowski wrote:
> On 19/01/2026 04:13, Yijie Yang wrote:
>>
>>
>> On 1/17/2026 12:19 AM, Krzysztof Kozlowski wrote:
>>> On 16/01/2026 11:41, YijieYang wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>>>> embedded system capable of booting to UART.
>>>>
>>>> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
>>>> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
>>>>
>>>
>>> NAK.
>>>
>>> Warnings were reported at v3. Did you address them? No, you completely
>>> ignored them, so warnings are reported again at v4.
>>>
>>> What do you think these emails are for?
>>
>> This warning is caused by the pcie3_phy node in purwa.dtsi, which is not
>> introduced by this patch set. Since it does not impact functionality,
> 
> Your patchset introduces that warning. There was no such warning before.
> 
> My NAK still stays, such patchset must not be merged.

This patch series can continue to be reviewed with the dependency noted, 
right?
https://lore.kernel.org/linux-arm-msm/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com/T/#u

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


