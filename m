Return-Path: <linux-arm-msm+bounces-41776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4ED9EEEF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B144B2814CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BE0236F9E;
	Thu, 12 Dec 2024 15:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPnX/gYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C8D236FA5
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019087; cv=none; b=nVVPdfYU9kcsaeeIMqRY0NmGvj83QX+JBepWJB5hWRrRAz4HnBrJbLuEbl91BAcCNJVMgrlMpKKy2+xhkYG6OS22XXpZ3pw93sU5+WLQ2kaXuaw/Qf6p8Miu1xuKbb7HwBnMv1D9utRyveXJ4txFIkNlADy5QIRsZiyQ7od9INI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019087; c=relaxed/simple;
	bh=QYsdmsdQRyfQfdAB6L7gWpWteWX3xhz20XE3vNMmjco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/MPWEJT/N+8totFBVGx20tjGUqdv9TGvrmP/2sFczxfr4r4pp9KepOrhFuKOvtOUJCUFy0feAUxaran78pb3IZBXgB4feWCx5iwjQ4dKbidT0S8oPTrkkl9Ph6bVeA8YBWk1PPP6uRRo/vYMQd7L+SVcWFPbKRMqYmGY/YEL8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPnX/gYa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC8729F027443
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJjX/MyJzuAT/EI3JjEw0NhNv1cX5Ve0A0YxRcHKPxA=; b=HPnX/gYahucMhgZ5
	1rBuW4CMlWK9GOox8dbF1mcNgL7yZV+M9d5GD+1hLpSBsXn1X8xJyoln8yV2TdE1
	uPjjyJChmbLOIzyCBMfvNqW5Z9I05mksRFJX5Q0R4l1qwE9A8NZDQbwwcjfqpPXi
	GEQaZQ/lGDVw0UWvOswzgrWtMGIin9qYrRGkvgLQZZpG7DJod7kyttQLpZ8fozPf
	C/NggHGODbqvQUFPshdbr9pzdi9gFpIUcjgUrV/g4j82vNZezZNwER5zhD74LANu
	oRL9q2eWYJrSYQQN/7FLQpryTxQyG9pLGPUqlp66rnLO/AjvQrlS+LGHd7StZuUc
	phxk8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8xrwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:58:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467616df6c8so1368081cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019084; x=1734623884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJjX/MyJzuAT/EI3JjEw0NhNv1cX5Ve0A0YxRcHKPxA=;
        b=WN2kHYjESV979G9DbGXIJ/jNlzDc9i/fPKvaF6EpgD7kMFNAsae6RDjzZ8EW94P8rm
         LmEXRd+P5K4ucO8Gk3V2FqgePEIflo4VGsS/2y1AM/9PS1nfQSBYNGf8GnRYS+xDkCpa
         Edpfvgm06ECQ4RCCaUaTfHRgbjb9e4W4z1objkr0U02lh+9Y/mLn4eLEM6UkOaxm0nyz
         +GjZpgrRI6kyHfLzZusQAqsKrNMZA8Plmi4FQsFu5cJoWswf7hdw2v9HohZyOQ05uAK0
         Dq9sb2j8/flNHdusvpZm0Q0G9tkSgdAZPuGHJy5OKvXP/Xe/g/d5tzceza7njoGZT7+j
         Yycg==
X-Forwarded-Encrypted: i=1; AJvYcCV8vYUfqEpY2kniT0QGfSVn4rRyXKZVDE7SFt+fmZCjOX5aluLe88PCL1aUWX3pCA2DYv0vUFqOPWdsUFGD@vger.kernel.org
X-Gm-Message-State: AOJu0YxbqmOTWhjt9ikWZUHSvRWC+u3+K1V3OpxzrrSICnvEdom5y/1F
	1TJMVgewJrjwH0W8fD3ZR50LYOKHfeYK8RWv/u8XSCeOaYZ5ZCmXgPJmtfcpZJ+Z/VdQ119DJ83
	Eog26cSP5WXXXHVhzlabxOPELfxsMUJQ9FiZ6inNhJC5kWAB8nfBIaLoLxlLVIzsX
X-Gm-Gg: ASbGncuizgmD0wOHgS07J64T5Zu5mEDfovNPwp1aDUghJEgzq8TPRpsAoK1T0aZKBO0
	ZkgwKwQYUiN3cRFZt83gS8J3MPbLADxR2r9LoGrQR2hoQKZoj/lcMLC7SnBALXo2ae2ECS6AUgG
	DQEKI/iCLA4yhZ86dcVTjnosiXMAgoa3QJ07RllIsD2RAAmFIX8RdFoKE2yzVtX+VMYEV9F6J33
	/4tgpB/m08bZDKpu7ct3rIjHgQ4uN2I6cSUPaxoXoRgrCv8B/ISbtrLwqYrIMBbZMRWtHU2TL/p
	4wckvcgEIbqkMjjOtpF46Bdx4TTtcVxsNshyhQ==
X-Received: by 2002:ac8:7c53:0:b0:467:83b3:ab1b with SMTP id d75a77b69052e-467a16465camr4716201cf.11.1734019083985;
        Thu, 12 Dec 2024 07:58:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDpyydyZgcmJzGotmy5Lcyw380UvTYk8yA7QWo9f4QdRtgnrCRTjELtL6/Ijg0eg39K1LYKg==
X-Received: by 2002:ac8:7c53:0:b0:467:83b3:ab1b with SMTP id d75a77b69052e-467a16465camr4715951cf.11.1734019083601;
        Thu, 12 Dec 2024 07:58:03 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa695c3ac07sm524055966b.66.2024.12.12.07.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:58:03 -0800 (PST)
Message-ID: <9f114f7e-8a97-468a-9245-10c2b565da81@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:58:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add support to load QUP SE firmware from
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        quic_anupkulk@quicinc.com
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <9d5e5b8b-aeaf-4ec8-b34a-8edeaec20037@oss.qualcomm.com>
 <9af6d639-9066-46a1-96c8-1b0b1790191d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9af6d639-9066-46a1-96c8-1b0b1790191d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3LqoRG1Ht-Bc95fhAr3KQoCwKDRDTTkn
X-Proofpoint-GUID: 3LqoRG1Ht-Bc95fhAr3KQoCwKDRDTTkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120115

On 10.12.2024 6:06 AM, Viken Dadhaniya wrote:
> 
> 
> On 12/5/2024 9:29 PM, Konrad Dybcio wrote:
>> On 4.12.2024 4:03 PM, Viken Dadhaniya wrote:
>>> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
>>> hardware has traditionally been managed by TrustZone (TZ). This setup
>>> handled Serial Engines(SE) assignments and access control permissions,
>>> ensuring a high level of security but limiting flexibility and
>>> accessibility.
>>>   This limitation poses a significant challenge for developers who need more
>>> flexibility to enable any protocol on any of the SEs within the QUP
>>> hardware.
>>>   To address this, we are introducing a change that opens the firmware
>>> loading mechanism to the Linux environment. This enhancement increases
>>> flexibility and allows for more streamlined and efficient management. We
>>> can now handle SE assignments and access control permissions directly
>>> within Linux, eliminating the dependency on TZ.
>>>   We propose an alternative method for firmware loading and SE
>>> ownership/transfer mode configuration based on device tree configuration.
>>> This method does not rely on other execution environments, making it
>>> accessible to all developers.
>>>   For SEs used prior to the kernel, their firmware will be loaded by the
>>> respective image drivers (e.g., Debug UART, Secure or trusted SE).
>>> Additionally, the GSI firmware, which is common to all SEs per QUPV3 core,
>>> will not be loaded by Linux driver but TZ only. At the kernel level, only
>>> the SE protocol driver should load the respective protocol firmware.
>>
>> I think this is a great opportunity to rethink the SE node in general.
>>
>> Currently, for each supported protocol, we create a new node that
>> differs in (possibly) interconnects and pinctrl states. These are really
>> defined per-SE however and we can programmatically determine which ones
>> are relevant.
>>
>> With the growing number of protocols supported, we would have to add
>> 20+ nodes in some cases for each one of them. I think a good one would
>> look like:
>>
>> geni_se10: serial-engine@abcdef {
>>     compatible = "qcom,geni-se";
>>
>>     reg
>>     clocks
>>     power-domains
>>     interconnects
>>     ...
>>
>>     status
>>
>>     geni_se10_i2c: i2c {
>>         // i2c-controller.yaml
>>     };
>>
>>     geni_se10_spi: spi {
>>         // spi-controller.yaml
>>     };
>>
>>     ...
>> }
>>
>> Or maybe even get rid of the subnodes and restrict that to a single
>> se-protocol = <SE_PROTOCOL_xyz> property, if the bindings folks agree.
>>
>> We could extend the DMA APIs to dynamically determine the protocol
>> ID and get rid of hardcoding it.
>>
>> And then we could spawn an instance of the spi, i2c, etc. driver from
>> the GENI SE driver.
>>
>> Konrad
> 
> Thanks for the advice.
> The above design suggested by you may add more code change into protocol driver as well as common driver.
> I am really interested to discuss more options and come to better design. let me discuss with you on this.
> Also do you think we can push the re-design of DTSI nodes as separate change instead of clubbing with this FW load change ?

Sure, the firmware loading support itself is a separate change.
I simply used this thread as an opportunity to talk about a future
cleanup.

Konrad

