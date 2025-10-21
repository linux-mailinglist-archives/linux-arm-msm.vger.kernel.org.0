Return-Path: <linux-arm-msm+bounces-78121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B5BF5727
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 741733AA58F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C479332AABC;
	Tue, 21 Oct 2025 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+L15qAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD7632AAB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037953; cv=none; b=qzf7/Rxx+LWMgTcqH2M4t9krBUS/w2/wqe9f4vCYyV7b6/oOYQshC/tTlINTsZ8j2SN215v0eas95BjLBTpgSD9vFjtWtxGHYzQh4Mn1f/+/rDrxn8qIQSUzfSzW4nBt5YBvxaM9X+jx/60wvEDyM7PulglpXWaASBkN4PSAPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037953; c=relaxed/simple;
	bh=mzXWcQ/gcJNSE+27brMlFtFWijULcvYe4dXrKcx1Tcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXdiWPJ6SbFdEBTdKK3gSyRlvg9ZkIWQEpCoat1jwAQguraMocCtBFtBUlsyESoaasaBmudkkp8BTru0RSxQomLU38cHooO86L105G16znXkZLLWndWJxYX3VC7MPCK+f8zVZxFIsZlgd9WHMJU3WdphjUCXtf+vQsjvSHFuQlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+L15qAj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8De04002519
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2skBs5S1G3c3DMDi/JRL2JH47cdtT7pHnFkN2gye1FQ=; b=k+L15qAjXWAOVR/F
	+hM/s39H1EXnOyhMaOdekvGa0kpiCv5bgqxMXqhzEDB/Ke6/Os9ltLy1GiifcsvY
	fuYCv0bZiUCfG9WQEX2ZX4hZFHI2taa3rABtGOkLWKNxLp+uhd+j6ptfPYZdAk9c
	rk6uEyFpfCAvQl55O/QOJpmMELYnvDy2/IEsZP5ig9rhKBSySxRpBAvZM2Ua/BHk
	R8sAwc68LNmHO0HfCqZg8HpHyw6zCCooSw9xdyedo8Mx2OTaNTJp22mWl2HpCRo4
	LmydbWBL/TOfLV28upWjgjU9wu1Saj9qAdgF5tqUT8PQ8OyiCxn30MzkwpOjlwqv
	RayY2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w5pym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:12:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290c2d13a01so38737885ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037950; x=1761642750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2skBs5S1G3c3DMDi/JRL2JH47cdtT7pHnFkN2gye1FQ=;
        b=CfIrbmk6JBJsJvds+2o7BgLYwd5+FXtDIWDnmNAZ3/czPpVpFUhunl4XMNY+cYTyzC
         IONYl/m586QD0/GWTSRWn1XZGhG2AvxQM5P1FqbDQl4IVkaxMYZd1v1rQvGzKot5ug5h
         7du7EzSEUOlDW/PFgpLVWUr8qwlygY+stglG9UBbS9inVGolCXvOW7pONf8J+YA/GsY2
         SZvfOyxIST6cKwx7O+9yuXYelL03SnvYxwFUMra7hFRnS71OS/SHoIMy8e9ZzNVyf6ny
         f7OF7r11rtboM/PhqOek4wPAHLIsLgghFfwdOBohRbgT0m5sA9ozjBu7zg8Xqx0VNO7I
         7nXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9PfBqcfkk3pVjimA8GMtBt5OCc3J4Oymq5fHb4kStCrhd5EZqHCdtUPFhcQK62MQAzkwMQqszAEhtBcx/@vger.kernel.org
X-Gm-Message-State: AOJu0YzaI4vx5I55f/CeHwO6EL2fo02zjW9NmMhbgZfN4rQYn6pTYSLK
	ZKUGS8ySsmfjPHSjRj9FzBOp/AUAtZIXX0dcV2ET7RYUr36LhAt6nRHY3arWyBCK4BP14yFl9G+
	R4TwFe9AYw69X3lbsJI9vTU4tvbNIUAsAmw9rXG50MCywDju63mn/b3I5IXPW+qmr3u0B
X-Gm-Gg: ASbGncuzsyApTTVJYIo5g030G6PL3E/gI23SZ96EUw4BnpS6rTJCv4/uSQCN2zwEbcQ
	o+mpFOsxqMTdL8Dl+VA9FmwqWpXB62etVg6ipou68d1RldyNwu4rycI0mrcIRQvdJMLoERUw/Pj
	ShHCXS+kONJc7u8285BBB53Cu0HCUx3MUIsNknZ7SqJ20zzo9FO+zO7EYIEbs8iC6BJzjeaJ6wQ
	bH3YmQW5JUmYr8VVCA7IRRvVy0kzDqTtJ9qDPwFXu0oR2pEQEs4wcHnnTZpMieBKXgekUqRXjHW
	JgNtUy5Nc4Wm+38ytqQSaGhSaLrQ3XFYJooGVbd+bQP3FtgsBgReggEbIcSrtgyhDzqwNmWOFDR
	pabTJ6yBOd4YtL+c7ra9bKBhCGaM=
X-Received: by 2002:a17:903:41c4:b0:24b:1585:6350 with SMTP id d9443c01a7336-290c6adc893mr224791805ad.11.1761037950351;
        Tue, 21 Oct 2025 02:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAZaVIOlkJ8pTn567PHoYPwAkq1XUCUE6ub+TrFUWHUIKktOE63K2gBMcvWDAWpuvoYDa7eg==
X-Received: by 2002:a17:903:41c4:b0:24b:1585:6350 with SMTP id d9443c01a7336-290c6adc893mr224791345ad.11.1761037949686;
        Tue, 21 Oct 2025 02:12:29 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292472193acsm103402075ad.108.2025.10.21.02.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:12:29 -0700 (PDT)
Message-ID: <29af107c-0462-489b-ad3f-e39c7d990240@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:42:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Bjorn Andersson <andersson@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
 <tv7zufiknf6ecnvefksgdborg4csqxyndb577crt3mzwzcxley@zlschj2txmzi>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <tv7zufiknf6ecnvefksgdborg4csqxyndb577crt3mzwzcxley@zlschj2txmzi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Q6qp5ifxQAnDHdzVtcMyHgXq17wf8HR
X-Proofpoint-GUID: 0Q6qp5ifxQAnDHdzVtcMyHgXq17wf8HR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX8GfVHJCeDzQ9
 eOFyVltqwS0ltOOOxYJjsZa69KymIg2QsXKV/ZvJ5qe8I50/1UyTQpZAW1dDnTJqrAmiQ4VKDRW
 lMlU3acBwSaojY9JqC0xhURsyCJjBwsIYtNf3gaMvCjcvXPIZAO1/Exp95Fxk467chTpAosgbTQ
 yGGnLA9MGxKI8dF7BKIrTiOapjKaZU5t/gBtPktpwfsdS0JeQ9A5t2FlBDmlE8UGSkT1MjQ7pZX
 UZRrkP7m/NKdSmix70DJ7UzThoJetUfAR6IIFNYIftA7OVvhvF6rpXEsKTb8XZE6ALC8438VtOa
 21Oj4xsQ2M1g67/QWC5PP+v23oieB4l96R8Np4cMb3zP84vswgb1MlvHnK6WYORydSD5F4opl2S
 MMewtxcwx+j2/D0rTZ6TvhZA5jBj3w==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f74e7f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dklrOZhk_xOpRdAJBjUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090



On 10/18/2025 3:11 AM, Bjorn Andersson wrote:
> On Fri, Oct 17, 2025 at 11:19:51AM +0530, Taniya Das wrote:
>>
>>
>> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
>>> On 17/10/2025 07:16, Taniya Das wrote:
>>>>
>>>>
>>>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
>>>>> On 16/10/2025 20:53, Taniya Das wrote:
>>>>>> The TCSR clock controller is required  during boot to provide the ref
>>>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>>>>>> the UFS driver successfully probe and initialize the device.
>>>>>>
>>>>>> Without this change, the UFS subsystem fails to mount as a usable file
>>>>>> system during boot.
>>>>>
>>>>>
>>>>> That's not what I observed. UFS works fine, especially that it is a
>>>>> module, so no, this is not a desired change and explanation is not only
>>>>> insufficient but actually incorrect.
>>>>>
>>>>
>>>> Krzysztof, on Pakala MTP we are observing the below issue and it
>>>> requires the module of tscrcc to be loaded explicitly. This patch also
>>>> aligns to how it is on all other targets.
>>>>
>>>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
>>>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>>>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>> find vdd-hba-supply regulator, assuming enabled
>>>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>> find vccq2-supply regulator, assuming enabled
>>>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
>>>> unknown)
>>>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
>>>> ufshcd-qcom: ufshcd_pltfrm_init() failed
>>>>
>>>
>>>
>>> I don't and I am testing regularly, so I assume you have incorrect
>>> config. Maybe I have incorrect one (which works), but then commit msg is
>>> incomplete - you must explain the bug and provide proof that this is the
>>> correct fix for it.
>>>
>>
>> We have tried booting up recently and and that is what we observed. The
>> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
>> is picked from ufs partitions. I will add these fail & success log
>> snippets in the commit text.
> 
> Please don't, there's nothing useful in either log, so dumping them in
> the git history will serve no purpose.
> 

Sure, Bjorn, will let the team get the correct fix.

> Regards,
> Bjorn
> 
>>
>> [    0.000000] Machine model: Qualcomm Technologies, Inc. SM8750 MTP
>> ....
>> [    3.133373] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>> [    3.144480] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vdd-hba-supply regulator, assuming enabled
>> [    3.144585] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>> find vccq2-supply regulator, assuming enabled
>> [    3.227770] ufshcd-qcom 1d84000.ufs: Resource ufs_mem not provided
>> [    3.238319] ufshcd-qcom 1d84000.ufs: MCQ mode is disabled, err=-19
>> [    3.244707] scsi host0: ufshcd
>> [    3.255170] scsi 0:0:0:49488: Well-known LUN    KIOXIA
>> THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
>> [    3.272001] scsi 0:0:0:49476: Well-known LUN    KIOXIA
>> THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
>> [    3.287011] scsi 0:0:0:49456: Well-known LUN    KIOXIA
>> THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
>> [    3.304264] scsi 0:0:0:0: Direct-Access     KIOXIA   THGJFLT2E46BATPB
>> 0100 PQ: 0 ANSI: 6
>> [    3.331545] sd 0:0:0:0: [sda] 121774080 4096-byte logical blocks:
>> (499 GB/465 GiB)
>>
>>
>> Thanks,
>> Taniya.
>>

-- 
Thanks,
Taniya Das


