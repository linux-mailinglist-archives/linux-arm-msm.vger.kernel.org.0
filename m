Return-Path: <linux-arm-msm+bounces-66614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABCB110C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 20:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C9FE1C23B30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 18:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07C454723;
	Thu, 24 Jul 2025 18:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n61+6JW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63072ECD1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 18:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753381299; cv=none; b=eOT4OiLPFJL1ErDr23k6rfJwTEJwnevksZejqjKYUKu2c3vUsTb8Sz/M1iTxuCOReYN2TfvaqhqpUCldw8/abijTFrHJPPfG/i58srGtvPvu43IagrPBLcbzPNQQfqFB/Dzg38GHBuBicntyXVnG7reCxOGBwrz6695epBz1NGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753381299; c=relaxed/simple;
	bh=P86RZxhcq4luBoxFp9K2glu21mVN0rpUAcG12WeywIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VlQ5owyKdthsetcV9wuMYZhAA2yxeK+VEWtm3ppOZBeV3Qv0pEIZ/OoWiOQprtxHuJM1GfDZqmtWSR62jngmkikX0ax7NKX5JQoMCR1z1DafdWMDMd1AvSMWDOXh9DiXn+aIqn6xpaV8Zz6J4e0Y2ySKkia55FQP+QKDUShvTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n61+6JW9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9XKpG005792
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 18:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myhiipaB/wUQijkyOLcZiWvOTEGJM1xVMQUaHld2irI=; b=n61+6JW9drxJ9pZk
	mpHo1EtIQ54t5WHCJo5diIH0sfmKMIWNMl41XGSJatRpsPVdOWEg0FafriPhEcdG
	lHULAguO3Ek6P9J/OES3MH//8IZbbCD8oL/6Mq6L5bT6udmeW56Q4HO7U+CStDLj
	BWi3Nboqc269o2k7EGPuB3gP7QQ+W3uDNIH8XjfQXZ8cJrVL/qZieu0pBAhtg3oz
	Pr/h4FFYm9sei22HZ6/SQwOmY9SH8EArdvycm3uBQ6cmLCHxw7cMTaEXStUoy7Z8
	7voQuGnAcKoae86ATFRS9yvk4uHQOdd6by6RLw7RKvrv/4wcIyjU5mWso/CKlc/9
	NyQO7g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qhqfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 18:21:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74928291bc3so1247882b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753381295; x=1753986095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myhiipaB/wUQijkyOLcZiWvOTEGJM1xVMQUaHld2irI=;
        b=eetvi5vPWv9t3tkTbVRKTw6xK3SnL2uClbQ2i7RTgkXnAAHXCe98bAWIXjfAnSdnvx
         CSsssp7eyhuJHNBBosuasoN0CvlQzSmtgecDFq2Z4CnrokarsKcJgtcvJJq94vo7Ikp8
         /Sk4mFaO5LjjV/IpFbbpltPvOC6RAvG2UBmu8K4hCV8WZLtzL0EOyS8O8808p3mSj5sI
         asW9CVerpORq89cbQETztSTMHTKnpfz4UZEz8F0qkkGHDigyzb5BGa5Bau/jOJd7faDr
         TI/kGaFYAjuansDSjmkvLDtEyUZRVwjJf9jqshA1liLjQAPyg8vafSC51eR7TKRTSKzM
         ygcA==
X-Forwarded-Encrypted: i=1; AJvYcCWod7bXtd6osPJBLG4SevNm1zk73b1zrjAXdeG375os24q6gt0/U9vOVQUdHt0fa7um0f/Ej2R8F1PZHByZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzbrW7zQOr2Ybz86LL2FeborzxYVnwfMeLD1IjOZzMY4lhoT7YM
	V+SjdeJfiurii/50aJL9ZUSfvWuerGl9d0FSMCL9LvyUJELW+mMnel3tgPbYY+gkPMGN1Gu5lZ0
	BmzVOWsPumiZgB1hDp9s/yA0a4zDCvK3fNvJNjENoFL6GvNdoV5gHZEg9ll4KzCwGC5mw
X-Gm-Gg: ASbGnctTxa/+2MlJTnDBO0MloMF2GF9+0eAX/fgX0bW4Dd5BCl3hmfSRC8px1B2FeOk
	m7B+DN34YvkQzqBM7YOrLtUisJ6x7WS88TwvwYslqApy70uNJD0vr1hO/B7ZE/t4C4jfBfJbo83
	yDTeGLiZ2v26vJOt/3yk8DDGE7rctRRPJyNht1GvIPuF2Ae+5J8KPm+KmHbR97xorLM33toXkuy
	KPf7TApmPtpw4Y1ql7B4DARI2VJPYcj3lXEdCBEt22bgzs68L7R/+DVgwU12aCYXaqALcNwp+/n
	2lcQkwdxf6Nr9tSpNdpULPDsXselUqgrb/jGeNv37ri3nzSfwVZWUxq4DwGeaBVz5X+DGpO7LVU
	d
X-Received: by 2002:a05:6a00:2e16:b0:74d:247f:faf1 with SMTP id d2e1a72fcca58-76034c566cfmr10997064b3a.6.1753381294691;
        Thu, 24 Jul 2025 11:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8aaK+IvK/ni16DihbKGYP8ABP6VWfHjhJIfPMM3TuuE2gI7iQAOgMEB1kec1nuMpOExdHcg==
X-Received: by 2002:a05:6a00:2e16:b0:74d:247f:faf1 with SMTP id d2e1a72fcca58-76034c566cfmr10997035b3a.6.1753381294245;
        Thu, 24 Jul 2025 11:21:34 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.231.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761adc70302sm2162883b3a.27.2025.07.24.11.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 11:21:33 -0700 (PDT)
Message-ID: <58eb8f0e-a029-cb7f-e63a-9eac6a6444df@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 23:51:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v12 0/8] Implement vendor resets for PSCI SYSTEM_RESET2
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        =?UTF-8?Q?Andr=c3=a9_Draszik?=
 <andre.draszik@linaro.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
 <beb26682-d2e4-40e6-89ac-87f18c0401d0@broadcom.com>
 <56599da9-0200-72b5-012e-942a1fc954b2@oss.qualcomm.com>
 <a1d3264f-a46a-42c4-b518-a66c8e0b70b4@kernel.org>
 <f4725f3f-1b45-ebd2-aaf4-4f986a44eb8e@oss.qualcomm.com>
 <36f62026-9517-42bd-8f9a-92f39fcdc136@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <36f62026-9517-42bd-8f9a-92f39fcdc136@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE0MCBTYWx0ZWRfX/kU/SRj2tAiD
 NlIxc8AqaAArXBFmXRXwuYpNQ/xoGjwBgnlDmuE0yHjjkGIhNK96eTqp3h6rMIllApW9VMiGM26
 GdlSTkWqK5lx0j6MZSlCnCRZfTEEaWtLfoaUEoZrNCWZjIrOoTTfIm4Z78gxqzaWU9FryiapfuB
 MUOjwpHTX73ZwJf0kH93TUj84NSxrlmS/gcZdIE6LbQI8+n45ltWmJPwLpTJscs08Xlp/PP1l16
 WJdqCnjWyJ04rzWydjMo+8O+2Gb192op82io24TNWi9upX0on5UqLHsJJ1pA0DxziB8Yd7jUdf7
 aal/4GEu5/VokCN9iOBKk+4bu7qBcU++2ez2GvCxhOP+xodsdVtDun+Ww6m2ZPMrs5Izhiop+Rt
 W5PWC4JVHXwCy0F0lA8jT7f65opWS9LyNk2YGQr637kh6t2h6IiwIXEktPHwqduII1x+s+yd
X-Proofpoint-ORIG-GUID: zMcyUZdYKiaXu2gtkndz8uZ-e7pf3Mss
X-Proofpoint-GUID: zMcyUZdYKiaXu2gtkndz8uZ-e7pf3Mss
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=688279b0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=EAZcAn6cL6OfK3FglxxoPA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=YF7pu-sQtpgReH5imSgA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=985 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240140



On 7/24/2025 8:13 PM, Arnd Bergmann wrote:
> On Thu, Jul 24, 2025, at 16:04, Shivendra Pratap wrote:
>> On 7/24/2025 6:18 PM, Krzysztof Kozlowski wrote:
>>> On 24/07/2025 14:24, Shivendra Pratap wrote:
> 
>>> I strongly insist using compatible as way to find your device, not node
>>> names.
>> It will look better to switch to compatible. Will define a compatible for
>> psci reboot-mode binding and align the patch to use the compatible for sysfs.
>> Current patch defines reboot-mode as a property to psci, hope its fine to
>> define a compatible for this property like "psci-vendor-reset" or
>> "psci-reboot-modes"?
>>
> 
> How about using the reboot driver name as the identifier in sysfs
> instead of the compatible string? That would make it independent of
> devicetree.
In current patch, psci driver registers to reboot-mode using a device-tree
node. So reboot-mode does not has a driver name for psci's reboot registration.
its like -  reboot_mode_register(reboot, <struct device_node *np>)

Now when we want to use the registering reboot driver's name for sysfs,
either we- 
1, Pass an explicit name from psci driver(say "psci") while registering
to reboot-mode.
or
2. Create a virtual device in psci driver with name say "psci" and then
register for reboot-mode.

which one is preferred? suggestions? 

> 
> I had a related idea to provide some namespacing on the actual
> reboot syscall parameter, as we have two (or more) orthogonal
> concepts here, when there is more than one reboot driver and
> drivers support multiple modes.
> 
> E.g. you could use
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "watchdog");
> 
> vs
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "psci");
> 
> to pick one of the drivers, or
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "bootloader");
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "recovery");
> 
> to ask for a reboot from any driver that supports a mode, or
> combine the two and ask a specific mode in a specific driver like
> 
>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>             LINUX_REBOOT_CMD_RESTART2, "psci:bootloader");
This will introduce an additional feature in the reboot-mode driver.
If a colon is present in the command like "<driver name>:bootloader",
Call the "<driver name>" specific writes only. 
We want to add this feature? 
> 
>    Arnd

