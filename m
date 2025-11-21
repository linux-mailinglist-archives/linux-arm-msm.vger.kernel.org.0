Return-Path: <linux-arm-msm+bounces-82782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E2C77F69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C6A2B35994C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 08:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDF732F768;
	Fri, 21 Nov 2025 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWF1L1Of";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEOavG44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E3E253F39
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714487; cv=none; b=lozm9VBYI8x8T4I6Pz9hKrfmudbgbPmg9pUepeVYNUdh0CE4BGI1s3iLvFE45jDLAgL56rsCP7TYEVy4o8fhQCbAKHIIUK/XzNuVqy2utCr2vtysf4Re81iyA+8DXz22aoCxDAyfl46TsUzZfgum3nfZxHXDr2r4uYCzd5HJyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714487; c=relaxed/simple;
	bh=rtIrDC96mTgKWbY8x0I4Pr2/zpiqTKqEpQN3wuMsceo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=op8Eov43ycph9izyrAV1lvpL+otKSm29WsE45RkRsQLB8xLAp+szTeN4mYVDbNeXhecQNRTAwrxzXoQ8xgvLpLXWQEMQJP4w/rC2PzgIKQ8ioWl3zzvsTwc0MLjsoHpmf66xBqaY8KBFcIxsFPYYJmJeh+HABgvsDcBX3rY2IkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWF1L1Of; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEOavG44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL53GVJ3007981
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1obC42n6b3J5kEBmbJSlvAg84+J6sxQ0LZfCOR4Aq0g=; b=dWF1L1Of6F4MQkX/
	/5hMDCSFoJkC8knlHsE+lggQcdVIskF7gpr/h+XyZF0FM/pkHgHcEiiOAvxyXVvW
	bE4qURmyDGiu2IaQh3xOx6abgpdXUNhdK7YeqiV3uNHBdLXEJM2VNAI/TbNoQir0
	DrqGlDlSRU1Gg/cCpRrTwqEGeI769o5DWO22lqZofq1mpXx5P/VdAPnpwurZbd9L
	cxQQJlKdG0AXPEkfTG/yVfiwvY34fopixbrb2w4DuW4GK2gs39jGUKpH53xigSPx
	kxawBMpzEZ2bF6it9Z0+2436lSQF1se5VVXjGN6CyfxaVtLxtDWi/n4pnKli7C9V
	v1wvAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkf0jsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:41:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f48e81b8so27439195ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 00:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763714483; x=1764319283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1obC42n6b3J5kEBmbJSlvAg84+J6sxQ0LZfCOR4Aq0g=;
        b=dEOavG44c3WTQhMlw+EsXn5FmOZ+qXhtXl0rmUsw4b5J0si649x2YMB15pB6XeBVed
         r3Clf/LUHtLJBpcaSzShnWLUAleuBSswMOsGjB7UbTYVCBSa3SZ96uKnbTBGYmktOeJJ
         zDHaEVAkIFtZPvj++PiNAf0njdNFou+1iznYqtpstp8DJB75YlRIWc1xh0a7lWLkGio2
         jPRReBJFAG4GDxI+Pl7LaMgloph0Sap0LGht7cn6uHbuJh2gsJemuscS58baVgDM3TDO
         xlYLODYioq1l9HpR7XW7YiVVCCV0lLUTjqUrVEf7OjS2bk6faZKwFBjfEgISk9SqwomD
         vYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714483; x=1764319283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1obC42n6b3J5kEBmbJSlvAg84+J6sxQ0LZfCOR4Aq0g=;
        b=iA4yXMxbepc5WhjWrm7wEydDVXWyHhsnN8vNgJAmQ+smKQWsyzzm0F23QY3YCcqN4Y
         hJliq+MTwDzzru0A3FsG5/VgtmpHbLdLPeluTKQ/pO9GnMHaEWDN4LvQTp3yQBdKDqEC
         6+vG70lwsbYcQKIQYd31KHR8z9G1U73bkJtsIfXwe5xJ7z8CdIM70abj2SeN+12WAGyw
         aZ+FcRwUfXNEGLoG//UdovccNa2jVVHYG30UjUwyixIAF+9nYu6ts3ARlDhaVmfLqPx3
         +MpzU+08FCjRhRIYLjgHUTB3zr3As7mVJKG+EwzdwadKUSYIIhUCC+VUHfIKJA3ljmEl
         DuYA==
X-Gm-Message-State: AOJu0YzVWlPdvS7mLliwg2R0MY4K4//6MDKRjaab7Kn4l3SDGKBAH0O0
	OILYwKorL5IMTMJt2KiXefYkLeBSX80tt7ghtdfYB6scMFYPMs8WofztkNxFT53iiuknnhN7ECk
	7VO1xS+A2sqS1TpFO+zIem5+93VSmJpz3UzbAP2Ej7CgpYX9NgSxxx4Vst17OnmYzgdEe
X-Gm-Gg: ASbGncu9DWZdg5cwZ+kUEnWebm+eCV9c0kMHNsuhD532Oea69vYAaiK0bK4Xt8H9UOk
	ENKdPe1T9NlBXJLyyCs7mfsAB8XB8Tmx/O8sQFoM0jenjUA0AfsVHTgfZj7bKe3XAk1naNL20j7
	G+D2XPfw/gQNNljuLFqWfQ64ZHZsU9Mi04OnonKvRUpHwBxK2YjItkFN8UuunTVyagMC3cl1iwZ
	8sEy/5l721u3zInUOm1jN8Rh5XCpIsswf2B6Whe7fK7bmJtMEKyYk3lVNUfqbkWwR4PUU1y7tOS
	GrDAVJma/xnOP+A9WO/p3kHgIL+sCIsIFGDeUiC4vkB6nwF6qPf0zFmP3AM8kquNBe9294C3YTB
	1Rw2Y0eCKAB2eucJIBEBT0AA+AGqZtHw0fbbwWud6
X-Received: by 2002:a17:903:17c3:b0:295:134:9ae5 with SMTP id d9443c01a7336-29b6bff8643mr21811625ad.24.1763714483328;
        Fri, 21 Nov 2025 00:41:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu9OhsrpqD/vOOIYbL5aK/VDwfehVXxqDU/g61B7pL8avMK0XFkCzI81AKoxkQVzFDcO6Mzw==
X-Received: by 2002:a17:903:17c3:b0:295:134:9ae5 with SMTP id d9443c01a7336-29b6bff8643mr21811355ad.24.1763714482837;
        Fri, 21 Nov 2025 00:41:22 -0800 (PST)
Received: from [192.168.29.179] ([49.43.203.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b274d39sm49558875ad.77.2025.11.21.00.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:41:22 -0800 (PST)
Message-ID: <cd7420d3-ceca-4a65-bf19-bed4452d9576@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 14:11:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <9e8b47d8-9a20-40da-a6eb-cdd167c108dd@oss.qualcomm.com>
 <5029600e-a3b8-4aec-a374-526fb3f6417e@oss.qualcomm.com>
 <8580c092-3e1f-4b53-8330-ac1746b7a126@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <8580c092-3e1f-4b53-8330-ac1746b7a126@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L-mwVj_SiKopXlg2pvZdHqCAAwyHk5ml
X-Authority-Analysis: v=2.4 cv=ApPjHe9P c=1 sm=1 tr=0 ts=692025b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hPSFuvTr37ou3SCYi0sSZg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=N99UGyZIW9bo-gJ1gAMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: L-mwVj_SiKopXlg2pvZdHqCAAwyHk5ml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA2NSBTYWx0ZWRfXwnJN9MIaqZbv
 WbjRUN8ayakMdPNyOYblC5NWCcrMkncw/Y6WCNDWEICGaKksVMIiDaC6CiQOXEQ6vaGPafVshU8
 l0J1OKOL1cb+kFktSOdhsGD6qR2E1y3IAbKu04+Oie0w1UZ3oDh4cKdKIa+mXlP+zW5RMLeZT3/
 eUSSni0wZQA6jONZCcG8tgtt9YEGzpaEsNZjUcVc9Iz76hIj59UE/sca2yIvSuxtsLHfCD+n1gb
 eYDySEtYqveNE/FVyQFVUwtnc3SJvn0yCqNYde7zK4ebNLA/KoWgZlo1IRVY+fYkx3Xy7ElEG1v
 hBKKmxLPIVeBDwyEALX+5rDK5cikRks0yQT3UUYIjCiRO7B0OVkMWS8oMy2BhMSUUtZs4U1qLi0
 YuJT4/D4KN9wq6xU6RZOLJjWmOM1rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210065



On 11/17/2025 6:04 PM, Konrad Dybcio wrote:
> On 11/17/25 9:26 AM, Maulik Shah (mkshah) wrote:
>>
>>
>> On 11/12/2025 4:56 PM, Konrad Dybcio wrote:
>>> On 10/21/25 11:08 PM, Kamal Wadhwa wrote:
>>>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>>
>>>> All rpmh_*() APIs so far have supported placing votes for various
>>>> resource settings but the H/W also have option to read resource
>>>> settings.
>>>>
>>>> This change adds a new rpmh_read() API to allow clients
>>>> to read back resource setting from H/W. This will be useful for
>>>> clients like regulators, which currently don't have a way to know
>>>> the settings applied during bootloader stage.
>>>>
>>>> Link: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com
>>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
>>>> +{
>>>> +	DECLARE_COMPLETION_ONSTACK(compl);
>>>> +	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
>>>> +	int ret;
>>>> +
>>>> +	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);
>>>
>>> Is there a reason for making this ACTIVE_ONLY?
>>
>> Yes, using ACTIVE_ONLY makes the read request place immediately to read back the current resource setting.
>> Sleep/Wake are H/W based trigger and are not applicable for this API.
> 
> Huh? So if I send a read request with e.g. SLEEP_STATE, it would only
> get fulfilled upon an active->sleep transition?
> 

Read requests will get fulfilled immediately with the return of the current resource setting,
there is no separate active/sleep/wake vote values that can be read, put it other way the
rpmh_read() API do not take any "enum rpmh_state state" argument like various rpmh_write_*() APIs.

Thanks,
Maulik

