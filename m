Return-Path: <linux-arm-msm+bounces-79510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61422C1C06D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F1155E3A0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530A1345753;
	Wed, 29 Oct 2025 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCdjSgLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFtuu3sL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971D7345756
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753061; cv=none; b=W0GHAa0KCw+SSTG5itpis/ZEvSiScGqDkkUDv7+9YK2almY/YHFW2HIUfonsGHJJ+pqSf+UE2+FvcuM9OnrkZhnSCBQkV/FP6yFyuszQahAZGq4ndYESiF1xAAj2EVH9CYJa9xmMqLc3w8OUzJUmpO7WgnT5+weyTmCIolrjN8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753061; c=relaxed/simple;
	bh=KpjAEZlJlBH4L80ic3H39uXImkiiZ0w2wk8+E2WzktQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6BMHRZMf2NVJALj6nKklSgKjKCBy5I0O2a/1Pko49Uto+NXIurDZZMNRW8adxBSsrtrU8Nk846kOG6Vw7HYvEhfH+eMMvYS4T57ypLbsyz4b+zA0aLiC7rDAqKtcAVANif74DDx7+5K7UhqKfM9DvDEZmDY21O4KIDUHZYo+8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCdjSgLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFtuu3sL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TDdBNY569340
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ocDUjoSdi/BgXh7Ha09Y7XwcUnscyUVs5abme4yE1bk=; b=TCdjSgLyHetg/SV2
	EQLSXW1obmCMlyu6lRzxRqPzs5+c3HHomrRz8lRFmZdEaN5DfK0hcl4D+uL1U5Oq
	1g3H6Hz9sEv/vDKJ9WBWOAZjzT0brIw5xXZAYvsCJLMfWUaOAVrIDHdWX+w2W+8T
	lGzuAvxiXxJAXrbpizZSxcmLibBhmLfxfyXTBNBP2QSFxZB5KsQ0HE9L+ztaMDT9
	PK7cquyY2yX1ElB2lA4XGN73unLxB3n1pKetZabRdiwmIt7Q8zg6o/vi2nzB4KNX
	6aZqXHbw0uHYdhvH5+s1GeRj2HolJBv/uPXWLFfBQkSuM8jN9s3Jj8Wsjl7jYhKD
	zxeJwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bgdxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:50:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290c2d13a01so564435ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761753057; x=1762357857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocDUjoSdi/BgXh7Ha09Y7XwcUnscyUVs5abme4yE1bk=;
        b=UFtuu3sLcGe6JfeuLsG3YgfbCDwTDvw7SCmm4ZWR8qIViccHjFaXS//7KrQjGFJv6C
         cbqJNyuui4TyLv7AfYbIZ0QPFNOf7u4Z31YQcW+rXElPe7x6Ar+2vrVRMYxGuvPPMDwL
         tMpKSs/AuVV5BvII11sPD9MXOE5XQWynVVjgqzmi4ZAmGVFm+8T9NJYj7yg96pCau+Yt
         9R7yskrN3Wd2ncjJ2y6NIi8y0mUPYHr4DkIRANQOjlnBS9uEwdB9Ii8ru586gZksLqu1
         m5tU1SiJ675kguJojckZw6lnn3JpvvPP18zCqw70khSaRw+w1kSmX5ccJU4wFfNmFd3s
         pP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753057; x=1762357857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocDUjoSdi/BgXh7Ha09Y7XwcUnscyUVs5abme4yE1bk=;
        b=ubtubIFk/rgRy3+iRVEfNrSWdAgLju08r2iVROAYEvoR/v5Qu97ovWaY+vsQ4mL72q
         iGxcapXAJEbyKtI3pODWJEaD0o0/tBGhTWb6s94uzDAH6Wm+opMYo41D9ey9uu46sFSY
         kxnkPW4Lw7XYO6DjUIC/uQkwf5nUo2A0blC2h9/noavo7lw7FzpC56lqVoEEFXKCu1sO
         cm3r5gb3GRD4ik1QhwHqf4cDbSToRw+znecf78xnT9LyEWQaCixsTqOzxup06OyzT1sG
         zAXOLRGTG6+0XjSs3p19tvBKzFGxAvGFCfDS8yVmweS+mZqaLWFYgdjT2OSou8uyJL6A
         aB4w==
X-Forwarded-Encrypted: i=1; AJvYcCWitDlOPfYKSuwqYYJc60qUv7dvMLZJU1v4LhHn3CRILZLXcuna9LcXRNluvZxrtEZnOQ16dBuZDy1xzjel@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0CCbCpV6mG2s4SQ18yY4VTdMnrK+nUq4e+5H8r2Iw7qUMBYeT
	a97YbQCsVgeYRTwY+ZY3On5J9CCwvrzGb4sNieoP9Vqk2Q1drD1rqiutc8ITF71ZtlN2sVC5mjK
	pi0BDon/ywmDQcnaBzeCQ9eBufS9RhMulPR/m6KncI2oEcAvd8RR5yyJ7Vtp76z5ft0LZ
X-Gm-Gg: ASbGncswhX1RDJxJKdYgK6ilcZgzqUaiphKXVIydWB3bYq7Zh2g3+i/bzEm5ioX50hc
	39/E1GyKNXVR5YKN5F93NM8dje+NA+d6shd2g53xtovLmSow33WkT3PQiqZHNjRzzCmE1uqZw51
	XSiUq4UIzkzwk4DRIMkCiluo+E/0XHQA32QTpWAu9j+XRab0x6vQBZS3YQidS7oJgpcW6aBZs7H
	5wFkwO2tDewnBVmGXXRBBOUTQA4XLQY1tQNaHlZHdhDEZoaitecV8laCxYc+ZmDYmQDMcIy7vLh
	/3uMra+ckHCJrp1etyuyC4XCAQhl4v1CV/P/9TJEK8WZqBKgFt32d8S27LzpGqbgBU2oCoqsaBN
	6c89dARJL/9G22YzH7ooxNzjk3ZKNyM84
X-Received: by 2002:a17:903:45d5:b0:25d:510:622c with SMTP id d9443c01a7336-294ed216be1mr362765ad.28.1761753057349;
        Wed, 29 Oct 2025 08:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/ybW31CBc2TweYbVe1W/JMckbSYfIxWNZt4i/NOSFxwW7CpDlMTBjMmkJHcLrTw1Ehl7uIw==
X-Received: by 2002:a17:903:45d5:b0:25d:510:622c with SMTP id d9443c01a7336-294ed216be1mr362465ad.28.1761753056619;
        Wed, 29 Oct 2025 08:50:56 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23226sm157935525ad.49.2025.10.29.08.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:50:56 -0700 (PDT)
Message-ID: <469fc3aa-9b95-4b30-a704-d568a830452f@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 21:20:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
 <20251024151521.2365845-3-krishna.kurapati@oss.qualcomm.com>
 <r5zjb7v2ngsbx2y63tmdhnm4gbpla5fki4uzpjhvn7sqmzsqi2@7637rbudt3z6>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <r5zjb7v2ngsbx2y63tmdhnm4gbpla5fki4uzpjhvn7sqmzsqi2@7637rbudt3z6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gtcTqje3qDwTpFpX_GPGMMH8JzZAXn9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNCBTYWx0ZWRfXzmEIHQXJX4bY
 9iEhpLK2TLMSNNABnW6cxSfConWBNum5i8i1w0+qpU3oyZty1GSHFy4u8lNm/u4+cwazGEBrvv7
 rrjxuyP0u3vwxL2gjMLhZGOxBy+7pN9OUbzzXWVRnHHTyk1Qm2Ms42srBZCNeXW+CgXGD3fMkoM
 U3ZC72SGvG2BZtVWhzmOaQCWxQx46Gwr9lpzSiDnYcaRLg+J43wPgjjlx0W/6vWvFgcUo9gh+8Q
 rEhM3V18+Yfd2OCj2UAtePPUwhEXay1NenDVBEk23HcuIUDt9IENOTfQcZITv3HVtNGQj7dsMSm
 abyFRATXE8qL+Ao9pxiewdjXuH27a0SSt5NSkSULdNgmMoZ+7a91dtH278xrhQ8CCif3L5ZK0bn
 bIJg3Gw3IqASmH24gT49bPqJqsIbHA==
X-Proofpoint-GUID: gtcTqje3qDwTpFpX_GPGMMH8JzZAXn9L
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=690237e2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oOlcjaQNFUeFxkmBLZ4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290124



On 10/29/2025 2:45 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 08:45:20PM +0530, Krishna Kurapati wrote:
>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>
>> Enable USB support on SM8750 MTP variants.  The current definition will
>> start the USB controller in peripheral mode by default until
>> dependencies are added, such as USB role detection.
> 
> Which dependencies?
> 

Dependencies like pmic-glink and adding remote endpoints for otg 
support. Till they are added, we can enable peripheral mode.

Regards,
Krishna,

>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> [Konrad: Provided diff to flatten USB node on MTP]
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
> 


