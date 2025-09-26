Return-Path: <linux-arm-msm+bounces-75245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A33BA28F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 08:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CD12626B6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 06:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2A927B347;
	Fri, 26 Sep 2025 06:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gv7kMLG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902727B327
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758869044; cv=none; b=Psn+RhxyOQlYoF8phd/04l9yB9l6qQZ19lSfDSF+MPiiOxK2EZm4KTzdb8MQlOOPiyFCZzO4uGiTgNe/zzqkjc50rWLnszLe+XsdGQ/RoPb0wgPDyIQBBK/dqdx5tfV6SbslKMweeGSwGvAnYzIwtxyI7Ln6dah2JpzPVHS68vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758869044; c=relaxed/simple;
	bh=FOe/NOS0bVJ6sIXlzze34one+JrpzOiKRfBtIMT7KL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cG1a2IMRoQZX8gQ9gTg4jVOyg9Xwb+mWFvdPoPoqEv2XWuFlxIVYEjsvdQ1VPwM/19JF46YZVm0dntjT4fdxJKKJ6JJMlK+Qw5BuuHcDK0GzxfcqGiYxBc6bwVxFb2MA2wKTNNPUIDqbKSgS3xGZvYy7iy5Qoa+X/nvUzUlNdvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gv7kMLG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6YQTU004260
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Ah7Hu/NIQtxfI1ZNYkMT85MCSf1K+iZhD9pTHSkz8c=; b=gv7kMLG753nHJm6h
	IifTCB5W3TxX+9cE4sIMjk52wWV4CjJHaepVXxtW0aKS9F4JDgYLEWOkQ75riPFn
	f9Eje/zx4s/YNE3fM03th/9Vzanymgwh0dOG8oqbsryJvu5JwZvwjKC+39GsD0W2
	yIIbfEvroJ95//NwQGhiTlHc0I962LLFnU3HuhT4Qv9CXErlmmaMjwBH9UJW1542
	hOTvatanXnz2pU3OuFKA7BmiwlCChusODnKvsFua/qQkvlzeUpK2hgtZVuWVHpDi
	BSdvpIm33GomGO2JzUxh+RV1VHS57NzY10gVcRggOic9QI8BTsM2ny6VU7qua3tM
	n/hfrQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u1q8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:44:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f9cc532bso1612743b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 23:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758869040; x=1759473840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ah7Hu/NIQtxfI1ZNYkMT85MCSf1K+iZhD9pTHSkz8c=;
        b=KIdzkbdIFvc6ePmBkMMHNXsU8/6tmSit2jVoZ1JGm0tgZG2gUGVr6laWDQzreATWfK
         ML8M3RXBk+LzulwYt/f8lk9eSsnG9sBlo91c9W9yy16japsR3bsSLd+zu7F/NFlUex2+
         NqIW00B7Lx95d7qwXalo5BjGLE89nsnyZtIt6p+DoseVoGbCnRQtkFh+cuJXbBoObZTu
         YJdcXKo7USeK804LI7Ku00LkBetuqzPlOAINVFljZkvItR//kpd9S3yWmJoqXQ+i/m5n
         8qfMVmwUeXO7BhglVZqv+lKt220emQpI9BqN5BZLrvhkLMDc4jJh6tkgn08megqDTvxW
         DeOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRI1ISQI56VBlaOxhmcDE9kWsajZ8ViJeDWCV5ArfsElEBczTXmVYh6P0z3eOB5B8MOunVUm4J9e6+p5+N@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2JUy2vKhUzuQfjFnmgtX0oHfxjg2G+7l1YA8Pc9iCDmwMgol7
	48+9Gp/PBjPgboelkXE0JR7qOeSjlA9sDqa4vO/nZvt/c4Iu+fKqi54vsn5ZaG9SzPe7q8eh8Fy
	uh0Vetc7x9NcPN1hDsCtp095ooD+o6R3OFXrMz5FhNJbRnJIpfIbRVg3okpju+vkjZgSI
X-Gm-Gg: ASbGnct2woIh2tYUO/w/dbmlQmDE7kXenYtLdfi+tUNxAt6FsdoxDQJWCv+X7bs2ZeR
	rlSzR49poKaNjCzVJi15ThMAdSWWy/Lv4F5peVO4mu1S/9KxmBbe71I9UYDkzHKNmtJNz9pTqrD
	dVSPZbzveIzH+Zw3bcVytAw/ulXn/1P+mgMl72tqyYZ9JGiNqLp7ir5+l7hlyiIfFtGyV4Zi4eK
	T3ucscCMlhO4q7+Yf5dVvaKTN8p8Dsfqfhx+gumnbcZ12VHfeeLTM9ts/ZHYnME1aCfVIAjtgDF
	fEUnDF0aNGoVOHS/SXYRoX82xWdC1HqDyWmOkFcGmcqQmGwg3FPSPJzmRUHudRoWF5Z2evTEzUF
	6
X-Received: by 2002:a05:6a00:8684:b0:77e:6a93:71b5 with SMTP id d2e1a72fcca58-78100d090c2mr3814170b3a.2.1758869040156;
        Thu, 25 Sep 2025 23:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH83U8CldMXHetQ3laSeCGOU3ou7saMPmIGLdNDqQLrgkOKrsymG7SBpJEFJGicltHH5ioJ2Q==
X-Received: by 2002:a05:6a00:8684:b0:77e:6a93:71b5 with SMTP id d2e1a72fcca58-78100d090c2mr3814153b3a.2.1758869039655;
        Thu, 25 Sep 2025 23:43:59 -0700 (PDT)
Received: from [192.168.0.104] ([49.205.253.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238c1e8sm3674908b3a.12.2025.09.25.23.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 23:43:59 -0700 (PDT)
Message-ID: <f016d47f-919c-2944-ab8f-68e450e5836a@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:13:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] arm64: dts: qcom: monaco-evk: Add firmware-name to
 QUPv3 nodes
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20250925042605.1388951-1-viken.dadhaniya@oss.qualcomm.com>
 <9b887bc5-eaa4-4271-8770-3458efb528bf@oss.qualcomm.com>
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <9b887bc5-eaa4-4271-8770-3458efb528bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 98pFd6BToueAsspExINQgwzsN6sjiVMi
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d63631 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=RtG+38I8ePlRmB+m5sTI6w==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YuaoIEpex40H7-UsjHgA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXxoWjIqTBUurG
 SHEAsEsEI1VThQKdlQgQzbLf4aImVc1P6Z93t2uc6/n3WRyD7I0jSQ/VxP9w1Bnr5rUkgY64qZe
 GjhKMnKY21JcZGcH8Wh9g0moHDY9/tIJrfnxlDN8VobT+lYZYnNcryh3jAQaJi6viRYDAo6+aLa
 onqgQ23xTbllG3of/WmEAqd6CeQGugvkzlyURNMYKNI2Yb4f6sh0EzWbnY5c4kjliFRtdn2oPmR
 apDUmiZzl2Bgz0jSvvgtarhQPnAYkfw0S62o3t7ylOpf4YGF0St05dXjKAixiTNBg8DJKNKBk7L
 X6c8YU7WRnLghXAx1tSILDmpfIl7GyS9ivK2DD/q3GJSaSp40FE1aRJts+AMluHxZ6pMrK0Uc91
 Y/7n9GwIcghv7GPdMRgPcPhVjea2Pw==
X-Proofpoint-ORIG-GUID: 98pFd6BToueAsspExINQgwzsN6sjiVMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 2:22 PM, Konrad Dybcio wrote:
> On 9/25/25 6:26 AM, Viken Dadhaniya wrote:
>> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
>> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
>> ensures secure SE assignment and access control, it limits flexibility for
>> developers who need to enable various protocols on different SEs.
>>
>> Add the firmware-name property to QUPv3 nodes in the device tree to enable
>> firmware loading from the Linux environment. Handle SE assignments and
>> access control permissions directly within Linux, removing the dependency
>> on TrustZone.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
> 
> Viken, you've posted a lot of patches like these lately for
> specific boards.
> 
> Should we instead push this to the SoC DTSI, to limit the boilerplate?

The firmware load from Linux feature is applicable only to devkit boards
(RB3 Gen2 and EVK), and therefore, it is being added exclusively to the
board-specific device tree files.

> 
> If I recall correctly, you said these ELFs are not vendor-signed, so
> it should be OK to have them be assigned globally
> 

This feature is intended solely for use with the development kit and is not
intended for commercialization. Therefore, vendor sign-off is currently not
applicable.

> Konrad

