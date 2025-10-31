Return-Path: <linux-arm-msm+bounces-79815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5DC239A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8FD904E8237
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 07:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423C82EBDC0;
	Fri, 31 Oct 2025 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+zic/XK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnZ8p63t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9728B4F0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761896849; cv=none; b=b7ZtdTCjW3eWsp5IDJhhsNIANRwYjjfKhfLIZvN3D55UxWLIGOJln8sOJoA2+GLspd4J0VltbXGfAgAlGXrBE/ITrKLFd4SToIOA1SlbxDDgntnOvK32iKOvB2lTuljD+u59jXh+Emp/kyOY7G57IYdzLlrbvDWhnCOknjWLwd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761896849; c=relaxed/simple;
	bh=/8TrqVOKuqZOnd4iu/m6xVRRaU9USAIqMhVGeVGdvJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bObAtPkuB/GqjDcdmERAdk9xxMzcAV54EUHe0llgcnUwtOtKZCQBEpnYiJjXQiG+L1kY2Q81UxXGnjelBCRWjGThoTA4lzYiu6AP7EFor+uDxS/NvcgbQUosYzpvty0oLMAzBj4IWJsWx+TPMWQcyH3xCWYJ22VgjfqnhiXNUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+zic/XK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnZ8p63t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UL96iF3809094
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ElQX51HCLZGHK8sK6/6r6fFyIPtOhGLYhgQkqsOGOoc=; b=I+zic/XK/3Dch8UO
	bMe/e9MaOWivZEwS8p2lmAwYyR6IzzajSdcS3/ll2Up7ojOGinvHDdKo6BnP7uQx
	sR5Cx7mQjSgyJHL1onxABIkRO8fVoyp9sJmXEwQzI1iU2ggQFZKvlvXyOywg2zc3
	W37Y0LnlSyIfr++jbrdf+2iqst1RC4AnIPGzoZjdZi5GxLkk0cUTGQTGCeZF2/li
	usO9JEVXHM6e2StJ5ur2pxbNQiSkutL+iUTg38r/Knar+ti+2LmrY3YOs7/I1913
	zQvkAAVJOKS5hMIV+6qg4ig2UZ52pX7n12PFTszZEcAkjZ1XmCeAkG7wMAcG3mJZ
	gi9wTQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vvb2qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:47:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3409148acc0so477448a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761896846; x=1762501646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElQX51HCLZGHK8sK6/6r6fFyIPtOhGLYhgQkqsOGOoc=;
        b=ZnZ8p63tj0ZJlDomD2VUhCZXwWdxAHHS4yuCpD/Cv5nqNnPbNafo5ie6KT5zPHjX76
         alzqyBQMJSv8dtntrfnzxP1RZbSM9iRlRNTDPOqeaZ0649EA44dMIJ5wLa+HGgmdqgCP
         mtd8GWAD+NlzuegGJbdJTaTJRVcAPWa292EBEQvGiv/LNAuy5WouxI1zy/f610QjckTX
         eAEcQ90AMGeNwl/wG7sSK7E++8Nmwd9/wfMCGihhY6gxH3up6vq0x3TwNvZ4mxf3el7o
         3qjINIatY0bxI807XkXJoax1M4EWQH4eH2RkTmMf+0M96h6yGRaX159xMaQrYgwlm8it
         5WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761896846; x=1762501646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElQX51HCLZGHK8sK6/6r6fFyIPtOhGLYhgQkqsOGOoc=;
        b=P1bMfvaVYnQkJPzZ+xeLnBwpkT0jM3qSDUvGZw5po+e/k7qYREzJTOcBHijCLJRpWO
         tY5NuKwX/S8BokWksQhUBTwyUhGHMxTwelLbGImnGoM3zWM9i9UFYbR1Epbgkzy//7oU
         wRglplmqUiGUqJYwOOht2lEtPCITzv3yhkyLwDFofnprRiprghzfs2juKIceUQW+Uqzu
         RqTzZzFtCaos+0WUjIdhgURZEt1c4H32U0uP82qw4NY2epxP9oCvl4ZvO9yvH0se/JOl
         TgkP21YzrGVKP7r5Qe8c9Y/6EH1lGs8ttn9vWlKa1TsBHxZqdxB0CmZaXLyqLnsF+wQY
         l+XQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+owVfFL+f0PzR5tfCHMNc/Om7NM3v3nefLjted9+jqHA5zxSHZXo0gg0HYZ612xezOmjN9lL+SBoRluol@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk8rv9ghe2kC1kxYeNXGUgTcrk+vplAkGde6ET12Ro1WLcSvll
	qs05XQBRyLVmZrt3/sRmVEbp+NLpPRtT6eSNduCeprDI7Jps4Ca69KKyZzmEkD8wgre57jsyguh
	7jjQ2daYTvnSxY1fvthDmHo0K9WNYnxDmLCvqVl42ZVqI4DVqHqEv7zyJ+V6U8HNxa63D
X-Gm-Gg: ASbGnctspbEMxX5M2JYFIUDJk9Xfxy1BfVz991VKG8mXiF5xnp9n6LJldPCD8lIYrn6
	/3TgMMBeIDRU79PG5Z3FgnTOKNR9FiW9LMTkXWWUkDJ63galgwvH7wG41PZDi95adWqU7pcFPIi
	XEAv7LaRkvCmDjg+hyfeoELDfm2M5BfPdBfplCAj+djp5f5YPRjuRKQfciE9eE+lhcJPEm8ZzAP
	vRI1x9UDwMvlRXYFoG5BrGC9AwcOI3OQhbNL3mPZCdIPykSYwtiUd9PUuv+Rdj6FKXAHAVOsLqZ
	wzDrF2NToKRFS3w32xER00J60BJRNwWRlH+UD6WDmic4JyBYewLa9kV/psJFzMo7XLzA0rJhXj5
	YwyVMBuvyN+PqdqpV55qSJXsU6fr0JnPVzA==
X-Received: by 2002:a17:90b:3fce:b0:32e:52aa:3973 with SMTP id 98e67ed59e1d1-34082fc932fmr3833642a91.8.1761896845584;
        Fri, 31 Oct 2025 00:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQVBJuvCo5/hatKTvNGJuLoUUgkps0P3BQUlziGGX4u7kohcIQyss6ZSPki1VFt+9IvtDaWw==
X-Received: by 2002:a17:90b:3fce:b0:32e:52aa:3973 with SMTP id 98e67ed59e1d1-34082fc932fmr3833614a91.8.1761896845117;
        Fri, 31 Oct 2025 00:47:25 -0700 (PDT)
Received: from [192.168.1.3] ([122.178.56.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34091b48934sm1244591a91.0.2025.10.31.00.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 00:47:24 -0700 (PDT)
Message-ID: <125f4812-e333-4245-af54-f693d01bd534@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 13:17:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
 <20251024151521.2365845-2-krishna.kurapati@oss.qualcomm.com>
 <eczsb4xsrfowfalgjaoy7azkrriitaietkjjkl2smceeasie3j@uc5ynursx3ot>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <eczsb4xsrfowfalgjaoy7azkrriitaietkjjkl2smceeasie3j@uc5ynursx3ot>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1UYGk_FUedpqOFaM9MGqS83ewpagjC4a
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6904698e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nBTQbq2h+7tEuhtSPO5ERQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RHaVzu8l3JqjrsztCWoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1UYGk_FUedpqOFaM9MGqS83ewpagjC4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA3MCBTYWx0ZWRfX8Hc8WRL0Wsd7
 2O6Wb9r678XN+UFWDLtU3m3qScLJFULxFdNwZ4qD1b1NzQKnVxQuOezkQ+D2G/1wbIMQTCXdN9p
 vYkoEqC8tEe7zwUm+QH7aBG99MNC63FSYbnnnJWF3IX45KFJUz9/gMcXeukn0RZ64UikyGzBuDe
 +u0eKGhFaccv6mcY6u6veU13wihwQRfWf1+WVQ1wzvcEG4kuDCoCvLfih6bie+I4LGwOtH04V2s
 6pfT6/ZD5Y+E+CdbpU10QPMtipigfBB9jYZtjKYv7SFbt+JyfQ1Gvge9NoQfF2Aa95zu6Ybst49
 1tyNUpz0buuMrboi5cfLir0WjCWZ2f7ChzL/j1/QaGyzMpQVSMGBvvrKkEK+OytjHkDoXj4BH9n
 zAUbU/V23QtTwzduKSVQxh8X2pPwLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310070



On 10/29/2025 2:44 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 08:45:19PM +0530, Krishna Kurapati wrote:
>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>
>> SM8750 chipset contains a single DWC3 USB3 controller (rev. 200a), SS
>> QMP PHY (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is
>> the transition to using the M31 eUSB2 PHY compared to previous SoCs.
>>
>> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
>> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> [Konrad: Provided diff to flattened USB node]
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 158 +++++++++++++++++++++++++++
>>   1 file changed, 158 insertions(+)
>>
>> +
>> +		usb_dp_qmpphy: phy@88e8000 {
> 
> You also need to update gcc clocks properties.

ACK.
Will add the qmp pipe clock in the last entry of gcc properties.

Regards,
Krishna,

> 
>> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
>> +			reg = <0x0 0x088e8000 0x0 0x4000>;
>> +
> 


