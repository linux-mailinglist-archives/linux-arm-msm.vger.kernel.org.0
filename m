Return-Path: <linux-arm-msm+bounces-66929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7404AB141FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50F01189DDEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1B7275AE9;
	Mon, 28 Jul 2025 18:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="op+JZmYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D849B275861
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753727389; cv=none; b=RmqgD7ek83LeajxOFC17UtVaw0sBmTiWoyhH4IJxCY3zZlpqu1Lfnh0eb8wIolhVbDGXEGsMrA+qitLi+Mj55uHRArlNzhyydqvMAl0PrG2KJPAFaGMtm1xz1XSLh6LmVJvGRBCO0rRvGtaNIBSj6yAIsg48lb7nQv0FmHpjuAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753727389; c=relaxed/simple;
	bh=Zgzq5fUBiscuzMXprNY3QBGKYe4UUihhhz0vOaibSdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzU8VDRgw6xleaEMCSgSu4U9jyD8D9P6Yq4PaDpIl3196bAlXMUZWJWwliGC6JaqasXXvTj+hoFHFuYYiKCgFtYu+9E+wIQ/sXKfFRhs3pxc8rb/4tbZV2xLzbdOS02QKKHEdW+L33irxDfWxAczE9bhhOK3JYOY1CBda+01Gqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op+JZmYr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlL4Q018853
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvJzrl+/UhBa3hmO88GolGsvDJxBlDvFKg+LbxKyh0I=; b=op+JZmYrnrYaiWf9
	IGp3irs3z6UtuOaL1T6sn68k5fQnJKYOdAIy+9hLRn95GzpMzoxWoBJpLaVgL3D2
	HdNtuN2Io4BgLvzgTkem+QbYncYROwAAImE4kfdJLXGuoS5z59ykf4pF9xMf1q+0
	IDsYzA/6AtGblKj3szpW5Z+Jel4+v2WeOrWMqQ/zlilvBRc0qbRz9E+Ka8DRf8ss
	lqCyU0Sc9heQ2h/eWrnGX/CnF6Pq2m4goK17gdFfYGwoLfzmxwdo5SZiPIclM3EQ
	e+g/LprGV4KIl1YHU7d2oZjsac3UF2cc58Z6D5VDvU3kQLU7ik20uZ5Tc0jEsYpO
	K+QD8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85wj0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:29:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e2c8137662so987486885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 11:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753727386; x=1754332186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvJzrl+/UhBa3hmO88GolGsvDJxBlDvFKg+LbxKyh0I=;
        b=ISVBFlArY466CkT+EfQoAjuCPXEamL45rimOZaTG1Re2W62lY/nOtEsPeoe5xvW3Cv
         cuGj7oGIMMN01mWm2/vkH+nR0xZZQHzRMeb8DhmvKV6sGUOXc8Vd3fLO08MEYA2M+wlz
         fPtBAxMxS73+Gb/LwZ63YPlvEjWFyibutwWjf0XBE/l23vuuBMXEwOcc5jO+a8Bn26y1
         Y8qq5SJsMKIQl4gl04D4aiTB/nOLKaLIyUcVQJG6MOjgbEG+vp9z5A2o6zHbZfV/NWFt
         /rDq5qAqLMzFG3GX/DtljaPnJfdKVY2PKO3K8hZUTmgowPrsHTMcIOG1Poy0plRjvOwQ
         smuA==
X-Forwarded-Encrypted: i=1; AJvYcCWoE63HiTWCKLLoz/tHDLVacKPljggU4bhtgINhYhCZ/uuuo25ptHX88dBXh6cK6CVxKRaF7YcCvqg7hFTu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4wwiH/5iWamXl1FjCEdEK2zrIl5rITJrgXBCAARgp9e7wyxEm
	znAvDpy/IAltsixdjZ3prT/3lA22t+BQJ40qdZHoCq9K5fEkQe38py86KRSdKAP1M67sKjEGaUw
	K9xPfwwhZIHklXF98XSgArzWmcFe6uUS7yVqe5tLk+PAiuSikF3svSoE/vguNeC2FdQ2x
X-Gm-Gg: ASbGncscUm37fwuEk+d/b5lgxJYrI88e8BZE0gtLvt3cgUXffJSwTTNeo5rn5P7xsZt
	hyyII2fBo4E0voM1+ikJjEW3DYGiAeyzLDUoTVaUyMYopb5pZz9kYVCqAaTtRIPZcxpXZ9WdAZ7
	DyW3SqhvWbJcyE9OE8LdFbgS6YjCbAkqma1dshI4sik4DFFvXWFJXUtuPRe5QFmpq1hrizA63OW
	/++UkQT5Rcdh83fI7UlwYIYoplxYJPYsis5KDALL0nWCQkGo7I1OumQj1cEFPEVQlToxJX0Xf38
	LpRcU/5aU243OJDNLkPTmIEvCNVPlzDEgkOCKK8KdfIcgZvX1sOXyQafBgvEUiZu79H8PZlcSQm
	TwseUAUylcwkSHGbkLc3dPCptHizdt7w9+mU7lRbK6aU9JRHcSPj9GtL215kAYxlZMEoY4XtRfC
	WxoyagBrc3QgUX6eGLjg==
X-Received: by 2002:a05:6214:226e:b0:707:159e:d1c9 with SMTP id 6a1803df08f44-70720658229mr164970266d6.51.1753727385081;
        Mon, 28 Jul 2025 11:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSNgPB3zFf6oPz//UBdRYzoglKZ/sN+oF3kbq9PUMHp+iEJ5arlOsVMtajvVAOtS+w9j00QA==
X-Received: by 2002:a05:6214:226e:b0:707:159e:d1c9 with SMTP id 6a1803df08f44-70720658229mr164969656d6.51.1753727384396;
        Mon, 28 Jul 2025 11:29:44 -0700 (PDT)
Received: from ?IPV6:2001:14bb:cc:47df:51b5:3653:9304:7ee7? (2001-14bb-cc-47df-51b5-3653-9304-7ee7.rev.dnainternet.fi. [2001:14bb:cc:47df:51b5:3653:9304:7ee7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b631a186csm1366470e87.78.2025.07.28.11.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 11:29:43 -0700 (PDT)
Message-ID: <2d672126-ca4d-411e-89cd-f40f8d8a4f5e@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 21:29:40 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
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
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1926e6e0-70a4-67fa-5e91-cd0155af1eac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEzNSBTYWx0ZWRfX6cg5zn7xZ5yo
 Ylr6UALtBxsbyH56xYE2TLdurPSuB4rsucDZo95IwK3PBwVk9kMvOcLj4awPKJvarb4s+Io0Wyl
 j4x2HR10+TT8Wlc+xutL1ceQD72XDJhkz9u9vh8Hm2eBoUwcd7mGYew3MvQ5O0dbH70Q7AUFxLw
 2ycdof1iQmlcbPJFYAm0Hx/Ejk2GTajM3UEPiKqJupBhkh3KQegGmIvpJXPnOsQNAbdEMG0qOHs
 SN7rlViyPRvSh6zmagA5n0MO/YmGgW84kO7aMM6l9iV7TUiMvFsDjhhOj4WyYjnGeXLvEyjuOGu
 IYwmhbeNOoLtgakZYiFQHdJUIychHnqq5KwNlhU01GjxNh+eIUFRCBstDrsJVSxHeQ2KeZKEVde
 bFZF7Z+VXtQmWjT9oZPr/M+XL89MnWiGAknJa8Efg+Z3nL11mZcIu6LgzfTd1NubBtdzmTZw
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6887c19b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=v3ae4HcI9OlR9PdQa4UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: i5fug_6HwPpfG_vxZosQcba3bTjAhh8v
X-Proofpoint-GUID: i5fug_6HwPpfG_vxZosQcba3bTjAhh8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=930 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280135

On 28/07/2025 18:54, Shivendra Pratap wrote:
> 
> 
> On 7/28/2025 5:53 PM, Krzysztof Kozlowski wrote:
>> On 28/07/2025 14:03, Dmitry Baryshkov wrote:
>>>>
>>>>> and the reboot-mode is defined in the
>>>>> previous patch. So, I'd assume, the path is defined.
>>>>
>>>> As I said, path is not. only psci/reboot-mode is.
>>>
>>> Do we have an _actual_ use case where PSCI node is not at at root node?
>>
>> Yes, many cases, because it belongs as well to firmware node.
>>
>>> If not, it's obviously a deficiency of the schema. Could you please
>>> provide suggestions on how to describe that in DT schema?
>>
>> I do not see deficiency. There is no ABI that psci must be root node, so
>> there is no issue to fix there.
>>
>> If you want to add such ABI, I will answer: no, don't, because we do not
>> want paths or node names to be the ABI.
>>
>> Compatible is the ABI.
> Will define a compatible for psci->reboot-mode node and use it to find the
> node. Hope its fine to define a compatible for reboot-mode which is defined
> as a property inside psci?

I think it was more about finding the PSCI node.

> 
> thanks.
>>
>> Best regards,
>> Krzysztof


-- 
With best wishes
Dmitry

