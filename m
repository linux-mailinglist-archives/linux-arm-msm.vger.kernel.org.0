Return-Path: <linux-arm-msm+bounces-81332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B30C508A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 05:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D96418950A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 04:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66272594BD;
	Wed, 12 Nov 2025 04:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRUVOYqH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNWskUH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FB0267AF2
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 04:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762922259; cv=none; b=u4uYOLhInkkQ6+AbayyltD7NiVTIJtbH1bMsWsfzV1jr/ngADTE9cel9Rp9i7eBO5KhuQmI8m9DQp6hfCqvh7o4IEe58kyxNqahvxUJfWsV3oUxENCvyC3n9PRxaljlYjFJrC3EufeWvOAG/gd3aVYcMO6zy+yaRRWb2GzzTjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762922259; c=relaxed/simple;
	bh=V0vl5PYqOwt6P32dIC0YxQDIkv9JT71y2bFJQpFNggw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LFCKTsp282fMFF5gO72FBZ/uaCKaCTcIhL1tCXrB8cDDZ7esJpNiGKyBhjz+xs4zxmsA31mtVHZ7sti4JSbk9ZOsqw7yrhhK9jvMm4J0pOZnyd+U3gdcf2M7KNTL/1xLShv6I82hWAqAeOX10OXJYak2+GrIaUHbGxrOrPEeMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRUVOYqH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNWskUH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC45x2O3060086
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 04:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVQKND3i2NbrdQnKxtCPDowADDAfakYZ28GFem/SIZo=; b=YRUVOYqHydXvvqvJ
	HUw75CnuM4GykvZ71R0PbxjB03A3TQ6r2hZBoVoKba5/xTfAymnPHkc2K2HaZmm4
	voV/kxXijn7kKo9kaGGOH5PrAvNlPPnVCcuQwYFeG0p+RD8ywA/lb2qpvbxHCn5k
	+N9Qo4sVhGJkFxG7xS5nT93pGokTUL5mXzNMkltyrh+Rgsp9Gfd1yEVX1tm/T6Ia
	kzGIV+pRmwAkVS0U63qw9EHmB3qW85DTPUebeHZrkdKGRCZuJMx4P/GkpWXAcJP6
	NMiwJmfcnpQTLBPn7HGZPoV/VyEDAc2uFYIYF1koBp/6q2NikbvwygGJ1pVc3qnw
	V3qgqw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac988hn52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 04:37:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bc0de474d4eso87881a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 20:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762922256; x=1763527056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JVQKND3i2NbrdQnKxtCPDowADDAfakYZ28GFem/SIZo=;
        b=ZNWskUH0w3LUaxoL87B6zSeGa4rF2raYomVC14qjWB8I1AG2xBrs++sgP1GEzJouY7
         wETZHSvSQVsQTwiGiXFJF5KcPCfrIYPfsk5aUN1/rPmE99QAtZkZ6ZMa6RlG3I4YMM7R
         Fhu5bJvWuU4wfEwYgp9V3jdUbg/en3lcS1nZigwnYkxx9mRfW8OXmKexeF2kzOu04Ocu
         FD9WrvASdq5Py6ZHgKPZLO8t3iUcxaQ7UbWC3t52fRSapnrmvqRiDBvSbbR86Bq8pkaV
         dVtR6CHMX/fDqiefbUpHFUYamYYwo6YQTHxWy6O7hirlMeb9orRMHUI3uSELZc6OLt+F
         1A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762922256; x=1763527056;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVQKND3i2NbrdQnKxtCPDowADDAfakYZ28GFem/SIZo=;
        b=Z5xrwk4QnSB9ga/CkE5Si3G+7n+26ef7LuRP4hNi+9fkxDe9GsGEh1syjTN1Sqezyi
         DkBig0gt6iqumQyIoZt42boooqq9vRFe7LRn+CclvMVamcGqG6mNJn+5d9u1gxbKwPVh
         QCCNQIkIfmOtXOj2Y6Kre4KNS/xCMHEbcz6JDFOg+XTtKhgvGMJE0PMNf6G4D0LSHy37
         +lTXP1Impx4FDz56kT4FXE6+ckeEcp6ubLdYlwtXRj6pujhhSRIei+ZDNxvjY+bK0Ji2
         gYzlpvm7sWVG8EUA10Sqsunq0CM/9RfPMUVLHGONwm9VCBwgFpNc8Ocnjtr4HSHZApK3
         1HKA==
X-Forwarded-Encrypted: i=1; AJvYcCWiDsknBWVNc6J25eUoZjxmpvGpq2o6/eij3r4prLndyUrCppSs3mUOXjZmToiZll2J0EZdx7MKuZKsW1NO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2k5BkruwH/y63qDt9tPoV3jz1rhlbqoNJN0E0HEPit+3f3TZ1
	L1maYMCv6IhjRG2CpNeZBSk0AhjHXKaL0X7BB9fLqKK3VrG31ne0rBgy6YBg3vLq5kewQX7SSbf
	1kGG8yoSemNCwXSo/jzS4ivLch4soiISHEqzkDklOUFoRWRGZeFcJgz8/pPrkaUmakLrn
X-Gm-Gg: ASbGnctSPiu8DO5uPNK8ZtPc37P8tH06GlsLmhD3T5YzF7z4kjW9yHLM/K97vxbB0bR
	z0TJSyLG2NA7UiCP+XlX+1vaNs+a+cIps2KEwmdDYvzw61s1+NZuAf9/lXe9DH8JTLXkpcQPpmS
	qywadfJbCzh+Q8bUWxr8zbYZTtW3Bov5KPdWb8tobeyrxjdmhgipnppuim1BjuDlZzOLJyFYU7I
	2NI/DyZ7M7vWVlUf7X3D0RE7lFU3QqiwPz65JxPXdMaznfPAlBwyn3aUcF6w+RbOxiuiBj7OTDW
	73qs1wZPuzmsv0LvI9Kjk4dYfpTc8qQzFTIu8/mCgSiL5pkaN4u3vbCqk7nNV5x5j2iXXaAUYMB
	PdDZ49fR7LmeZ/1jbrZlJGn0yf6ytFhYP7iPYAf4=
X-Received: by 2002:a17:902:d54f:b0:295:34ba:7afa with SMTP id d9443c01a7336-2984eddf6a5mr21873805ad.43.1762922255803;
        Tue, 11 Nov 2025 20:37:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgxphywwo7rj2wEd9u2tLC3LhciITf/QsO2ACTfPA2oFJMOF4ZYzAGhbaKJALeAsYksHv/aQ==
X-Received: by 2002:a17:902:d54f:b0:295:34ba:7afa with SMTP id d9443c01a7336-2984eddf6a5mr21873455ad.43.1762922255302;
        Tue, 11 Nov 2025 20:37:35 -0800 (PST)
Received: from [192.168.31.147] ([49.43.242.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29852391df0sm2680995ad.3.2025.11.11.20.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 20:37:34 -0800 (PST)
Message-ID: <68dbaf42-0d64-45f7-8410-ebcbae2da612@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:07:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
 <56aqammkwte3tcdzni2unufjp4t4yaqazzdkigrwqsxp3ghcqe@ppe2pjwg3hrl>
 <60583236-692f-4605-9f56-f7dadb46558d@kernel.org>
 <zbwcg5pkdspkcnvaitac6y5iko346qyuzuipqhkoedcaqm2dpa@zmszuwhm5q7z>
 <6bebcf6c-9328-4cd6-b77c-a147338d607a@oss.qualcomm.com>
 <nkh73mo4h5kj2lrz7paop7fn3ow2itxl5vh43muw6n5dxgmco3@tgvbmdxhbiqo>
Content-Language: en-US
In-Reply-To: <nkh73mo4h5kj2lrz7paop7fn3ow2itxl5vh43muw6n5dxgmco3@tgvbmdxhbiqo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ts-grQCspmmTxDo2JB-X4gnpZQsfp5TK
X-Authority-Analysis: v=2.4 cv=eO4eTXp1 c=1 sm=1 tr=0 ts=69140f10 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=5O+OyBe/A2HhBAuNR3RTDA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wXnSqrKzETg_ePB1FBQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAzNCBTYWx0ZWRfX4F7ZemKIEbmP
 AqhEyKupK4RZF5DJJ2vgaH2vVj5LaHkh7ow2eC77wioNFd1F29+XqGW2oXVlMuc0/1C+6X41OH8
 zjsBqd5A55yFF8tvwcJyPIWFEBe/oxjkbr7DHVTh1tpynuiZQyCPbj8Y4Jugh5p75SU215gdgy9
 E1/SrtbIdmd8GlUTaWlfPgTuOVTsHAhJ5DFsILWJ5NaLGeeiQD5/fuDA5rn7lgzxjBX/yuFKO0+
 YY+uFC+mf0eWEOOK6AyXuQtmptYHYv8WYNXcmxESjQ0FIeFZdG8blNCKg7BCFMnPlsbfGtQXZ1o
 JTxEJHtaHiKs/1yw8idmKNBha6DSr98eKKEJNNhhwaPZ2ioJiQL7IXUxUuS/NP4FNxRflINpUUh
 ZdW3vCDjvax2+IO802DhI/Y/xjy/kw==
X-Proofpoint-ORIG-GUID: ts-grQCspmmTxDo2JB-X4gnpZQsfp5TK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120034


On 11/11/2025 8:35 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 11, 2025 at 07:30:59PM +0530, Hrishabh Rajput wrote:
>> On 11/11/2025 5:52 PM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 11, 2025 at 11:41:51AM +0100, Krzysztof Kozlowski wrote:
>>>> On 11/11/2025 11:34, Dmitry Baryshkov wrote:
>>>>> On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
>>>>>> On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
>>>>>>> On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>> +static void qcom_scm_gunyah_wdt_free(void *data)
>>>>>>>>> +{
>>>>>>>>> +	struct platform_device *gunyah_wdt_dev = data;
>>>>>>>>> +
>>>>>>>>> +	platform_device_unregister(gunyah_wdt_dev);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
>>>>>>>>> +{
>>>>>>>>> +	struct platform_device *gunyah_wdt_dev;
>>>>>>>>> +	struct device_node *np;
>>>>>>>>> +	bool of_wdt_available;
>>>>>>>>> +	int i;
>>>>>>>>> +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
>>>>>>>> static const?
>>>>>>>>
>>>>>>>>> +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
>>>>>>>>> +	static const char * const of_wdt_compatible[] = {
>>>>>>>>> +		"qcom,kpss-wdt",
>>>>>>>>> +		"arm,sbsa-gwdt",
>>>>>>>>> +	};
>>>>>>>>> +
>>>>>>>>> +	/* Bail out if we are not running under Gunyah */
>>>>>>>>> +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
>>>>>>>>> +		return;
>>>>>>>> This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
>>>>>>>>
>>>>>>> Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
>>>>>>>
>>>>>> Dmitry / Bjorn,
>>>>>>
>>>>>> We are debating on this internally on how to resolve this dependency
>>>>>>
>>>>>> - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
>>>>>>     QCOM_SCM compilation than what it is today.
>>>>>>
>>>>>> - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver
>>>>>>
>>>>>> - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
>>>>>>     for any of the functions defined in drivers/firmware/smccc/smccc.c
>>>>>>
>>>>>> We are trending towards the first option above. Please let us know if
>>>>>> you think otherwise.
>>>>> The same as before: 'select HAVE_ARM_SMCCC_DISCOVERY'.
>>>> HAVE_ARM_SMCCC_DISCOVERY has a dependency which is not always selected
>>>> (e.g. ARM32), thus selecting it might lead to warnings of unmet
>>>> dependencies.
>>> Then `if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY))` might be a good
>>> option here (and depend on GICv3 selecting it).
>> Thanks a lot Dmitry, wemade the change below and compile tested on various
>> architectures (ARM64, ARM32, x86, PowerPC, RISC-V and MIPS) and it was
>> success.
>>
>> We will include it in our next patch version, if there are no further
>> concerns.
>>
>> }; /* Bail out if we are not running under Gunyah */ - if
>> (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) + if
>> (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) || +
>> !arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) return; /*
> Unreadable. Don't you read what you are sending?

Sorry, my mail client messed up the formatting while sending. Here is 
the proper version:

/* Bail out if we are not running under Gunyah */
-	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
+	if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) ||
+	    !arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
		return;

Thanks,
Hrishabh


