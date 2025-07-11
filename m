Return-Path: <linux-arm-msm+bounces-64625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE6B02240
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 19:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5386E4A2C65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 17:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EF32ED14E;
	Fri, 11 Jul 2025 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7HpH6dt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE1E156C6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752253266; cv=none; b=Qr/uEsIfr6hS3CIIly8aeUZe5bePUbEzOgauTyF3HZQfzzR5GlNXoqGhXNjHOvYWhtVIaIuLbke8zlddO3AivoCfhl8byBZIuRnwGpfn+EZuvbc2WMtZ3R8p+81OGcICywhsIK2A8hw1ISWHH+sHeOyi87wvNzZbVaEhodqdW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752253266; c=relaxed/simple;
	bh=/AhhGaV0drOsrUBPl4v8Rx7iU83u0J2d52gX7sMFBi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdJAdXGuN0EGU7odCdO+MAIPcpp+Owx/TaxULjcycICCnm69xSAYRAyy8BvcFuDeZu/lABhIFzfjW7uslUdNL5HFG3dnpRmBk7tanSH60YxZxWoIoaR56DR3U8JQlzhQidYTBkTYA1u3Zso5v1JR6HUT+q+IcrvGlI0ZvquYlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7HpH6dt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAjm1a008142
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzjVxq958kyT2ib7EgyZgWvE1bSgJsNxIfxcrwNYgEk=; b=G7HpH6dtRix5QARR
	N0sJfs+iAlL1+sDH2A5DGwKhR6g3jFKa6ZbZM1tN9yM8ZKVmvQLS8IdJ5x6jBGsy
	lRk0OLyROD/qLgNNrKgCcDKjSlga+5Be8CHj6MOpl0gUZ4V0b9CYpErLyofsmXAS
	Sx7+EVHPLbosP8XnGT/MeYK6N00S4jHKaqzuPB3SxQakfbdf/9r9VvAH5VHC0J4R
	UQvpbI1nrWt7KOSZt6QdB9/1hP1G9G5sNUERtdSe4+pHQ9eCwHDHn4rmlf0gdpJU
	6N/dnt8cmZW9vbZtmxsZmVmp8p+szvPN91sEdkTO4DqIcO5qhA8ATnbjGncXQEcj
	XsHYzQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg99bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:01:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235196dfc50so23373855ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752253263; x=1752858063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzjVxq958kyT2ib7EgyZgWvE1bSgJsNxIfxcrwNYgEk=;
        b=ocJRkUjasNfUZWIv3SVgwaQvJLCYmuzM3MIBD1FI+KPuTUOk5DUDUC7Zk3hTy41QjM
         NQJDZkdTgi75V/w5lQoYUUsYOw2ne63ln7Pu5W2K9bnYkvaPZnSZLF95M7+0RLDChkFh
         4hBbShw/RqVXSgxhdZUYsnzEoii9f68ue7ZW/p+SgON/+qZyP/ZU0n2g3bW1nYP34XnN
         Xs29LzvSmvYQN/RnJhH7OZCyLKhoxm2dThlKggUs9cVYKZhq4QAz2ESWyq/6LOkZUWcp
         wjHH8v2SmlLl5qAJ25zDRcdD2QekPP2AeS12GwqHGaexvuozcDN1AynaoMdb5GjezDiu
         /lcw==
X-Forwarded-Encrypted: i=1; AJvYcCVZvHWQ4D0b4LWjG9vo2VeFA1oWsWx2r8ag6k6bsMiioT/qqvYkApvcWPp3Y8R6TCeJpDXBbAoULfZVMw6p@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXjmckc9/o+4uGcO9ZIQXl4eR/Tbmj3hV0zN8wdy2dRVIORxf
	JpgYezNMmAPJVmIUHvYG1ivEI4TYD6U79nOcR1ro7/2HMT7AZrtnMO4DQ2ZKcHA1tAHxcckF2Ev
	TMRvbfPdJiOGMM9tzLPb+COpiB3hqjpodXPgSFLUQRI7LSEMy6UWjeB5PhJs0sVt9phOh
X-Gm-Gg: ASbGnctRvfk8OKByqOvz0PSG5USgGY4EQC6QCnjq9+dsKEJogS9YMwNP1V2yGV23kR3
	YT+LTK24kElp1WNVL/SLAi93eRbjywNNM/3Glz5oMGbZXH3uPPA/ec2g9e7ashmtXzAMWwOtH2P
	qGU/PMe9y2XlaKecD2o2iEQEY0Ug9CvEU1JclICsLioaDbW8TceZ6CDEKKIkBAjBeez8hIhUoiZ
	bPTVjvkMGW+WtgMQepq/X+8dLiWcIYlMDGeL6+OZR1ddZXLQ8qF0ma2UyPTc8zP4RY1hjsP65wR
	D1hF+H3WHIKTHb0gcdsl/ocfDfWNG33TE3BJ0iwVrzgHAG+X8Hwcfna2eAEWQm1kZGY8j6ZDuQ=
	=
X-Received: by 2002:a17:902:d489:b0:23d:dd63:2ce0 with SMTP id d9443c01a7336-23dedb4be9cmr53760505ad.0.1752253262989;
        Fri, 11 Jul 2025 10:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn+/OtXzq1bSnDAVVARE/xdrBPkqdNVrhiIvWMbL7OLRWzoRimQiO/kH3LymvsQd+s4/Mzng==
X-Received: by 2002:a17:902:d489:b0:23d:dd63:2ce0 with SMTP id d9443c01a7336-23dedb4be9cmr53759865ad.0.1752253262279;
        Fri, 11 Jul 2025 10:01:02 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4286daesm50513005ad.20.2025.07.11.10.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 10:01:01 -0700 (PDT)
Message-ID: <28f277af-9882-2c70-5156-123c95adc2ee@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 22:30:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 02/10] dt-bindings: power: reset: Document reboot-mode
 cookie
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Andr=c3=a9_Draszik?=
 <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
 <20250710224740.GA15385-robh@kernel.org>
 <cdadd6cf-18c9-15c7-c58a-b5d56b53452a@oss.qualcomm.com>
 <454c8361-151e-42b3-adfc-d82d2af62299@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <454c8361-151e-42b3-adfc-d82d2af62299@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=68714350 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=yN095whQe_6akajZz4sA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Ev8cvXczptZYYnmEZupcdwjKDTfGkL9a
X-Proofpoint-GUID: Ev8cvXczptZYYnmEZupcdwjKDTfGkL9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEyNCBTYWx0ZWRfX0Jk4anxhmUtW
 2F04dJTXdEp9zguJRJuyx2rk9aJdzIr5Ei0YmQNi2K9MrsJDetvGc7JIyRPIyF4umg+nhSP2iK+
 pcv30hz4D8gO66Tnff79bYlib1ZRfOtGMqELqEAnHfHPxum1gWdSmW2xQ1+qGKlTs0u7fk21saB
 PCNhZCwCRIlW76lOO5djMKujegD0MCJXFGlbBbnOwc6WIupa2Izp8u6QkwO/SOnwua+YFbvkgiA
 /zUZ1DfICzm5KRQNduowcM+oX6V/t7iaDrWCTur6oCE1mq0y4cEVpOhw/SAzfCed173hXEh+wDo
 7+EBcoPOCdA/cYIEDj1aSmMRMhapqc2v+b7MlbBshCpNcn3B0aBTVJs7OgLQTks+pFV3f+AUwV3
 2a21+Q1diNuqpeDzJilLSlecUMvgdHEFEEQWTjslYIeg3KrGspkX69x7rBOK1IAFCVk1WqSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110124



On 7/11/2025 8:14 PM, Arnd Bergmann wrote:
> On Fri, Jul 11, 2025, at 14:32, Shivendra Pratap wrote:
>> On 7/11/2025 4:17 AM, Rob Herring wrote:
>>> On Thu, Jul 10, 2025 at 02:45:44PM +0530, Shivendra Pratap wrote:
>>>>    All mode properties are vendor specific, it is a indication to tell
>>>>    the bootloader what to do when the system reboots, and should be named
>>>> -  as mode-xxx = <magic> (xxx is mode name, magic should be a non-zero value).
>>>> +  as mode-xxx = <magic cookie> (xxx is mode name, magic should be a
>>>> +  non-zero value, cookie is optional).
>>>
>>> I don't understand the distinction between magic and cookie... Isn't all 
>>> just magic values and some platform needs more than 32-bits of it?
>> Need two different arguments. Will try to clarify a bit below.
>> PSCI defines SYSTEM_RESET2 vendor-specific resets which takes two
>> parameters - reset_type and cookie. Both parameters are independent and
>> used by firmware to define different types of resets or shutdown.
>> As per spec:
>> reset_type: Values in the range 0x80000000-0xFFFFFFFF of the reset_type 
>> parameter
>> can be used to request vendor-specific resets or shutdowns.
>> cookie: the cookie parameter can be used to pass additional data to the 
>> implementation.
> 
> I don't see any distinction here either. As Rob says, you have to
> get both 32-bit numbers from DT in order to get the desired reboot-mode,
> and you have to pass them both to the firmware when rebooting.
> 
> The distinction between cookie and magic value may be relevant in the
> context of the psci specification, but for the Linux driver, this is
> really just a 64-bit magic number.
ok. then if i understand, this binding change for reboot-mode be dropped
and driver can internally handle the two 32 bit numbers?
> 
>      Arnd

