Return-Path: <linux-arm-msm+bounces-81017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 352CBC46D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1DD7C4E2261
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A08130CD8E;
	Mon, 10 Nov 2025 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvY3moLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTdXay+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B6199E9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780635; cv=none; b=MK60NhxmlmMoyGBRGABxromKUQ/ZIger+Ryw4uwtX0aw3bSbsdoUn08PgoA0TeXObcLxlpscfrx7qq2zdPpyY/jA+C+G514KFja0pknV6acX/xezWaT2lhsbWqT055o6SjssqToq+rvK8iay3AMpqiPLufPSYS1bFOnnJJIUWPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780635; c=relaxed/simple;
	bh=Pp8sadZa6Fs6HKKvmeIz/tCuyq6jNOOSo/X07LKN+cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLIayIutc2H62+l0Cd89aoquYsmeiorjqWOmPwWwuZLWTfbAdfr0nRUStbVT58FSAwMRsy6UgPlEqQx0KIjqKfi4XgBMKx6pPZclkPvTDbjrYisexsVxZVO8XeYYBCkLwLpz6M8vp8XUNc7OwDXDfN17OPO14g8R3T3uB6rgzlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvY3moLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTdXay+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9Cfff3146220
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pp8sadZa6Fs6HKKvmeIz/tCuyq6jNOOSo/X07LKN+cY=; b=OvY3moLpUsOteqmG
	7FaRwCntbyDcESMa9uIAqudJib2CAr6icWKX7xY0rNOroYd+ksfRylKfEuP7/rVE
	qga6hb3W9zSlH8inJFBepLe6X5L6LzVLoW2/+ra30IkQnWVb72O8wGnOd5BATPCq
	bF1AL/cV8b2MQqOxYwOoGHJJwuI6CVG2QOqJNCX/rQSYqP/bBmBVDK2RJics28KB
	vjVNFoFMf/lLkFJgCLX56SpqkjZskL53C+tP3Xikn+DU0g93lwmECn0jnF3tj0cz
	g7/qYWaloHL67MWQMaCUecqToxFNX5wQRV3PDLiaZH5VidrU4ZT8qKS19761oy0A
	E9b17w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd7hrq3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:17:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ae9be0d8d5so5932520b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762780631; x=1763385431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pp8sadZa6Fs6HKKvmeIz/tCuyq6jNOOSo/X07LKN+cY=;
        b=ZTdXay+uzxfci4YByhvlHrvvq3VidpEP+eUL/aPIAOxmaxJO1KQv417UnVZ0bjwjHj
         IyJIIDSrxpcOZx94MPKSuW4y9ZgYikaGluE9eAQFcvFzUKlr41+PtOarnGjCT9K+slF5
         LUpU9rM9GoHSSKxqAqk10g4ZjH31HE47sdZwFEOfgJ/h8CAXVgCOUIrT3xG+dPGpYCxa
         wIZWpDugKQGM6kmBEOPNb9lTKLDThSZ5YNcBRox1HRvvRMGkvRNEOz55BwIzSZv2qkLU
         mPeQHh46p0AeV5nPmwd4NEes2eyOmqqMvhHHtVyIjVudcYyYzo24GHpA6/ZlnZpN4KUb
         fQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780631; x=1763385431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pp8sadZa6Fs6HKKvmeIz/tCuyq6jNOOSo/X07LKN+cY=;
        b=dbuf6PdnAxYF0DzcO762cc2XBi9ePEle7yy7BtL2m5KnnNnhnJy+I9rUY7RFZDf5bO
         80FM0IIeZOVCpvoj3YIzb0NYUbycZL5YujFf95j9kbQYZLidruDhX0MAQfW54FgPfplW
         kyibEyL+mcYGlGY8o338VcpDLI5SVZyFKExsDQdWPQgiOgo1UdvbbR7afpKBMfhyZx0+
         rzXb+y8RG+JNMJErTkTFt9WQb2Qu2q+uBo15xThfyplOZcoAUU1Wdhb+Fga3dFi6ibX2
         X5QBA8BvSVH9H6gbGGvlaScnH8+Kv/iJP4JWQqWcJH+a9yqQiBGzSZhxqxhebJyo+7Ka
         2KmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDZnsxBjr6MLVdXUTbRqI+lUHRp94aWn3zLWf/Gqf4B9GHdDZ5GPHyy69Gba2EnYsZ2nddwJ/GPBIGKQYh@vger.kernel.org
X-Gm-Message-State: AOJu0YwI38QkOsJ7vjLfrWiJbRCblWLkJSLSvzsCAmLJsR44K9oF8rQQ
	ow5Yit8Bt4/iaalrgCV9uiFezJxoJpUwUPwEmVKYGRB0o0N5WgStRBZyt1x9GRS73MyOo1e/dCJ
	TTHQthHNwUnoYZHlEsjiRmY9TFVOJ7zzYPJeBQZQkInB/rFJQnYmeACRRGVmPwGLMvdYw
X-Gm-Gg: ASbGnctQ55F4NfIBj3nhRhI1QwVVI27pHhOKzd3pzX8OvohuItQdJZSG2mFYs1P+I/r
	xVztqxlBaexTVcPp7savKHT7SRmvaf95GVWS3E0vv1kGVRHUDuyT+cimNnp3b1fuHcoAz4B6wZK
	mZPXm+XPN0/Roqmp30EgIc2i5knVdq1uoYBjI7nHlFbiRSFUkbnnw35w9CRS0hKq92qMtu8O2y6
	NvMu25q2Ftw3LYooTd+Cy+BkX0wSJ/NdyhsGWh4kKwmIUTG67OhlfoJoZCK7Tka5n8WqdTu5mG0
	aC8o6zd6jYjhf5/nYHTekw7u/SmUOGgVYEAVDwBMTsqSh6/1J1h1yg/ZIs6AUPvyl5+auroAvOV
	NmTYwFWsqpy89lHzlheQtkkTE2GrE5Rnp
X-Received: by 2002:a05:6a21:99a0:b0:33b:4747:a258 with SMTP id adf61e73a8af0-353a3c6009fmr12911278637.46.1762780631404;
        Mon, 10 Nov 2025 05:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkxP2hPnDoM4zia18XuhPq48JzSy1cdEh/jpvEdsdq3YcmavDKiIkTcVKGhtOOp9ROXx9gMg==
X-Received: by 2002:a05:6a21:99a0:b0:33b:4747:a258 with SMTP id adf61e73a8af0-353a3c6009fmr12911218637.46.1762780630744;
        Mon, 10 Nov 2025 05:17:10 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cca5fd74sm11778345b3a.58.2025.11.10.05.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:17:10 -0800 (PST)
Message-ID: <4fc9c7cb-72dc-27a2-deba-4fd3eabb1fc6@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:47:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 01/12] power: reset: reboot-mode: Remove devres based
 allocations
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
 <CACMJSevoC3xYoeodGYnY4_EFSexqbNLqT_7UbRu9DxDRx8_gzA@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSevoC3xYoeodGYnY4_EFSexqbNLqT_7UbRu9DxDRx8_gzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F4_cn_L8sHQF8sN6RN5Srap2ZUCnU3ir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNiBTYWx0ZWRfXxNzIqFvE8rjI
 x+IsDRd8L8MC02Zdm3bwyrsp0RjYajcyTqRR93ubwMAcs4FVsOkP1OZitK6Tx81fohkWEFFuRoz
 CQ5HZx4ihN9d48MeWKIBAqGmU2n8JAghEnyR1fVOIkMSnvmjwmW908ZvMcRvgEsY+gq/lx/YFYv
 0UjlaPKBBWHjeqL7wHoluIpSECCAZVmWrZ2tMEOc4n1QUQr8RiBw1rW+G730O7AgdwahukeV8/V
 pvH7vmfcANRW5GKlohhwwHPwP1smWWJF5vfwPthxi1pjHqotjC3/paJElnHSsDL0hL0REiLo/i+
 VWgbE0zRr3f2Rfc2oljL6dheVJ+Wd8JWCt+gt8tyFEj4Avw4BVlhNkzO6WptuJdD8YxsOEv3DMQ
 T754ite3KbnRTU/i1PRgCA0VIF5e9w==
X-Proofpoint-ORIG-GUID: F4_cn_L8sHQF8sN6RN5Srap2ZUCnU3ir
X-Authority-Analysis: v=2.4 cv=Yt4ChoYX c=1 sm=1 tr=0 ts=6911e5d8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OnlfXhMgL6LeeRaFfUwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100116



On 11/10/2025 6:40 PM, Bartosz Golaszewski wrote:
> You're making it sound as if there's some race condition going on.
> That's not the reason. They should be avoided in subsystem code
> because you have no guarantee that the function will be called after
> the driver is attached to the device nor that it will not be
> referenced after the managed resources were released after a driver
> detach. It's about life-times not synchronization.

sure. Will correct the language and make it more clear in the commit
message.

thanks,
Shivendra

