Return-Path: <linux-arm-msm+bounces-79554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE2C1E371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 04:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B389188AF01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 03:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C405F2C0293;
	Thu, 30 Oct 2025 03:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmmWK9mh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chLRdcXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E74921ABAC
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761795524; cv=none; b=ilon+ghtQD2ahlyQSNjKBYsDBmiyh1ENHNCvSwkkZT8lhfhrLmyesasM4V2uPMbiJ1wbJiYw+pNEkJ3jUiuZ3/vtWvxsIvAIH7BHO2eSZAa2GL8v19bEWF/DbpntDvDeDzhXsgpurl/LWulbKL6HOn6q6bCr2Mg/C+MqKSXOXzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761795524; c=relaxed/simple;
	bh=VSHG8DAhQjKVcCyq5B5QW7BaODCyRga+pKRT+PEcoCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQ3Ud9QDXsNmltUbadcDJ8YkMPPaMNInQN1RnBXAW3nDbyjUJMxT+7g2W71cwGA1SeQZb7WVDGlb4j5sLzs5z2kpsHe+Tcq4GxTVYv8USy19sRpB8QPjcErZLPXAhRZz/FZTK4HXrmE3gwa1AKQMZHMmuMrYZAz03+1ai49gg+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmmWK9mh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chLRdcXs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TLH5uj1656152
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8cTGlLixs0EcG4dKWmS5DgH7TjtJvlrFipCs1gJW+1M=; b=YmmWK9mhT2/HxmP2
	d/nFKs3NQn4xlGvZZfIFG5MSrL3wNBGzzzVHkjrBYqKjMtp6d9O8Q+yEH+BI9Agd
	UdVzS/cq64ZiTm/qTUrq1gJ/XNX52oZhy8VDJYarB9G6gvVC2JYAknbBUtHPbEf0
	MCOlLD755Tx5npzVGJqQlVMchCTMw7bZ68LjrZsPb0nMDCllscrLvRBaWnr0DzZp
	9mfy05Wa7L+DYSVNG4c9nXNr5yv2kUaZKCNlscxbLBYon318zPTxzAteBic5quaC
	XPU9Ed62Qqph09EaEuqTnIC5OY59+k+C2bYrJBFuHUPjWvb9UrjRgUU8lJRPgrI0
	vr3Eng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptrwj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:38:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33bcb779733so490941a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 20:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761795522; x=1762400322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cTGlLixs0EcG4dKWmS5DgH7TjtJvlrFipCs1gJW+1M=;
        b=chLRdcXsdWx7Q+qxzI9UMlgcybBJ0c0hDI8zuytqOfc3z3PJ8Vq6gPbsDrImIpO2RW
         rGX+eY58hxYca1gWUmjTL56DuDWM9YiE0mUwm9MqWK14jcFEAJxx9bNMJlUsToqxwcCJ
         LkISyUte6MefPWMr2tGoJsDkZ66kcE4tzr2epmeoTgjdFagkz8hOmLMRNTS1lfCnx2nm
         3j7/Mf7lmktslhyWLGSjHkZ97NqOZEovCk0eFFV8Iw4Y4kVqOfhj1JW/4U4wNA1ApvGZ
         lvE+yt0O9pZb6SDXETGLV9Wr+tYy8qLC5f1lt+kSWMrZnWfVonBHzIag5aBeZUnUfAz8
         JPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761795522; x=1762400322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cTGlLixs0EcG4dKWmS5DgH7TjtJvlrFipCs1gJW+1M=;
        b=ZhHGV3s1DKEXc/eEd6fTa8xlrHpzNSnAPAV8v+xUddHbhYAs33d+e5MohMPyn9WGke
         UECOJElCMWRBLYW/hh34GSO0NidZJUUebjMomkSPP50GbW0FSd2FNXtjnVoYZfEeSO/y
         Tys4ctsVIoIp8m8IGLPA7RBZZA8zYOzuP3jCuoX+PXaDtHVeGceqv9VO2dEzcX5Xt3Bv
         /vqPOYfVTfKteGbSwKNYJhrZx+2+CyDPiuG7WtF3AJyo4KQ1zM9X4zklH48LTj2RaqLn
         NpHvM33hPagJXifh/FsIqiUYoD2j/5yNvHEuhznOORd4fhqbnvBkjyJua460sFWAOpti
         Uo4A==
X-Forwarded-Encrypted: i=1; AJvYcCU93PyxVzyDkDVWt5E/OrLFzBsQkqld6YHK/z9aSPzBpl/cuNRwIHb6qm3G2BGLOxAZHFninN+ipQBMpmHe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+CSh+WDvNy07uw58Fkk4TjtisQvo5WM55853r0Y+YEjJQG0ox
	wDkKuRTJBnE06wwS9jFFV3p3l8rsVg2xfKatLU5/JnJ556M7fAPJkutfm8OIsPlyrZWN2jG5qfa
	Nzs9ckBJC6ieXCz3sJhzEGOnmlRRDaVnJ6PlK83v10FzIEVWN90cqe+Kmv7qk0iJMXMQzCOyBY3
	Hz
X-Gm-Gg: ASbGnct7wKpKewo6rKECCiRwjNrfxQ0RJ0w8HBIwjkjJwXky6FOgSYxdRRr63peiPN3
	8ghTDPdkbZxPZqt1xbyLWtFCYPBqTpjuSnL9PfSmH/6DSC+D2FxwyL+PZYUPii9UetGGrf+Dob3
	7y/5fQKxpAL3jffOmGyMLO9CJrxFeSliCP+uiLP36Al1SNUa33mwU0h9QNWyLOPEI6eDTMk+RLY
	R3o+PyGuem9DPw9Fjnu7wB9vIES6XN8R42o5k+GM4x3O5fCUltIawvgSr/9Asex9ws0ZUrQJjaf
	9cxz8YhRUQsSj+ywVqb7o6bTWDgzWC4Wh4fY8tvCsD56cs5YwqLDRCKrDSP+xBZVHYgJeyPtw4Q
	gsAuZFdHzbN3vQmIgFwCPQMtP4FCrYf0=
X-Received: by 2002:a17:90b:38cb:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-3403a2a22a8mr5280698a91.22.1761795521545;
        Wed, 29 Oct 2025 20:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETSXZA/9AUH+eCeARyftxGQaYC5tfLi6TMdi8gQWvqS2Cl78YWh6ARpNw6aUIpThTzHdcxfQ==
X-Received: by 2002:a17:90b:38cb:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-3403a2a22a8mr5280661a91.22.1761795520939;
        Wed, 29 Oct 2025 20:38:40 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3402a5ba7fesm3305920a91.9.2025.10.29.20.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 20:38:40 -0700 (PDT)
Message-ID: <a876f8d4-969a-40a8-8988-2f716a742741@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:08:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
 <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
 <CAMRc=McWw6tAjjaa6wst6y3+Dw=JT8446wwvQ0_c5LHHm=1Y-Q@mail.gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <CAMRc=McWw6tAjjaa6wst6y3+Dw=JT8446wwvQ0_c5LHHm=1Y-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAyNyBTYWx0ZWRfXwbVzBB5NWCvy
 BSkkSklaiADZJoG+jVmm4kWHq8HETg5fvKHCCHmj+LHhopGb41esE+EvLaumfqGQRl+DR6eQPM/
 2ZPX5dqEGVx7fEE7x6X8MI9XCQa183PaWh5fWEb/X1rdzc6ePR8uJWR31PTmWRdW8NCDb2+PlMI
 ygzVVwHOXepwixju5go3tQRhy7p+ly1wHav07M+h2LwZRfGYUvQCigHabX755n9xUxL0N5Yl8kt
 gm2mMzgVWi1bMMV3ycG6b2Pruqmxe/syLqMAX/Qhy29BcJs57EaL3NiHiHrnoMVS/lTDVLwsdvs
 90elcqEMYO5pwzap850tIn/YaANLcgA6iu9/lLP4anuItWpDlOZBF9e3FEbfo3mJlXqIdRbUAY5
 UXCoujMIdCYuCyrSsBFb6btTVaZA/Q==
X-Proofpoint-GUID: sU_wN6bVczS-ntgmkVoQ2ud_DfkqztF0
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=6902ddc2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0FT5JWsqCLsmEzCoxIcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: sU_wN6bVczS-ntgmkVoQ2ud_DfkqztF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300027


On 10/29/2025 6:45 PM, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 12:30 PM Krishna Chaitanya Chundru
> <krishna.chundru@oss.qualcomm.com> wrote:
>> Enable TC9563 PCIe switch pwrctl driver by default. This is needed
>> to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
>> Without this the switch will not powered up and we can't use the
>> endpoints connected to the switch.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..fe5c9951c437a67ac76bf939a9e436eafa3820bf 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -249,6 +249,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>>   CONFIG_PCI_ENDPOINT=y
>>   CONFIG_PCI_ENDPOINT_CONFIGFS=y
>>   CONFIG_PCI_EPF_TEST=m
>> +CONFIG_PCI_PWRCTRL_TC9563=m
>>   CONFIG_DEVTMPFS=y
>>   CONFIG_DEVTMPFS_MOUNT=y
>>   CONFIG_FW_LOADER_USER_HELPER=y
>>
>> --
>> 2.34.1
>>
> Can't we just do the following in the respective Kconfig entry?
>
> config PCI_PWRCTRL_TC9563
>      tristate ...
>      default m if ARCH_QCOM

Ack, I will do in next series

- Krishna Chaitanya.

> Bart

