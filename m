Return-Path: <linux-arm-msm+bounces-84274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29034CA228E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 03:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E3183024369
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 02:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0350E256C70;
	Thu,  4 Dec 2025 02:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3/vsPGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8BOi/mB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57108238C36
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 02:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764814883; cv=none; b=mbSgHOWQEuHfk8ap8dZqJDZnQX10EJSMIp7e2oISsxr5VxKIqms5b7w+3UrrTRBhFEn3Jgaai50KeQYSUOw/RIP38JyJbu05K7CC8tXHEVZjACm2H+36kSezilKIvQZab1BpktxaO+tD3rt6pGBvf+IXUxBOqL5o9SPpTkvxp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764814883; c=relaxed/simple;
	bh=56HF3voykFa5HepGUA1JjmIGOi3GxhNIlIrojhTiado=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mxNDrhOpcWmsLUmx627KLdqlIrta7GwiUYIELYvttu+6YANcWsqM3VTpYAR9564Y9T3ukOx6nLzgs4bXNWZnvcNNi35UTl8Lk9Q8k7XBkIg1EZx35gUNFfWME7JiJT0lJtx9QBXNk3XeHr4pd9wm0JCj5guHjkWgYflFZHMZhaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3/vsPGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8BOi/mB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3LdQi91536812
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 02:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	va0B/24zt2VTpkxr7ujhdnIO5+76ENbSqxQVq/6jEAA=; b=p3/vsPGsdz7IbScG
	4kpULUSc+AlfrHo4HZJZzLZhOTgHo8a6YoOKGNERlOQzZ2bmcIEFk+TDXYYeOf+3
	Tf5VfFRDsHO5dZDU1L7lJPhBTKSwLvtfSNt/kYubDi3JIVBAUDz3g/acihXYSZGV
	LB8lyH/lk1EfZKsRlkgrpyBk1XxECC+WbIPkIACk9FvM3SwvnlKkuHhafL4GWOqH
	wdm2DfM138AxK2+mzxia5f8CmRoTpghIXCUGx1DCfNG/B3p3RL2sft5BKjNG/d6T
	xGOYnVBbke7409GMV/TlRMRL/K8XgQ7Gl45gv1LGto+FTog6MfodHmJ4A/qkSoFN
	Yr/wAg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0hth86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:21:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso745692a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 18:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764814881; x=1765419681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=va0B/24zt2VTpkxr7ujhdnIO5+76ENbSqxQVq/6jEAA=;
        b=P8BOi/mB7BTNeT1mIZ5YHLMPpgEeT/uL8vprrQVOFm6y0V82oANkre8N6v69z+H79E
         HcYQPsQGxNBgR51KSxFJzXM57DxVGR/vLj48nv4cglMh/IYr2GEhxVTx0AAh70YVuBwR
         g9BN6CbkyTQT0yW3KvSRH2ZvnjJghIiXOF94Zm8UMrlgXwvKUe8MFUcdhmeC6n4lSDfv
         DrscCebHKttdkY2gMMpIac5fZg2PO4qa9B6qkVDXGVRg4Ml4A0EBXcCjvaBsnVZ+kjgt
         5CCKDRl+YJ48rM5ksrBUfVqA+VHn/6KbEKTr5INSwF7pFntjD6wYl2JliQsuR263K8z+
         94Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764814881; x=1765419681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=va0B/24zt2VTpkxr7ujhdnIO5+76ENbSqxQVq/6jEAA=;
        b=D8hNcEEwu94YDlWYpQkAnJP/mWI9CNjgdgwuO8XXvTyFzgF/TF0fUxRzGC0bH2HkAM
         f1uj+4aBtT8ogR/7JRhgLteqDe99R5/EuHXz3pYCEsl2GweqW5QWENG9NeouVn9hG3ak
         gYJZhvlnc4i1ZkoKn/IgVHM5y2wASZA0IDHx9Ttip0c9DyDJTmigRpsJZ7/VPZWbhW23
         BeJ81Fa6biNUm19PyuS0B6eVrnMJRZYw47Wsy7ulEDXQApIhjuuqIFjgQjAHE87VhdBZ
         ZAPkVCqWnvrsqo6PGqJW14xBjczx2DrMo3K8XPVGQ+HtaoKfbTsl/qlUbVVBcuOooXaN
         n4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWL4BLhsyKbje5FfR8ynmgtJ3yZ1STsI7HIKBf+N7jPFVzpsh/UaxE+JqZClquUxsaIBW9SFWg2nRJOi6qy@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwIIyyIK+XMnMZ5yA2fkAhGwiEs9mquk9LSJGWpYn5LIqmj3W
	svt5+bu7fTtTqECuLNr4GdY9kp0Npb+y/oen4w8xWTt7mpVTq4fnvOmeVFWbbZeur3+VbQ4+RIq
	3Ema453qGnoR0Egvl04aW5v5K0puOiRsrlBgwQ5t2KhewejLzI8WV/vMdb2maFfu72PAi
X-Gm-Gg: ASbGncv758012BsHoOT8MPDHnvGElxMrRwVO7EkGch4QB6xr+SwgL8cuxxSBBQwtED3
	0Iu3ZAAYqND4LgZgBGgQIE34O34StnKC4FaP4ftUefFzqAWJkrWjAW1EkSCaiaC2uIYeOQ5XVmA
	O9fVVNTe3UpmaHr9xsDaqCXQBaAMbs7RINidY8Q0yIDZQqVjY3rGBXT0rPjwCSvScVF0ldDlCEX
	SNb3msn2lv79eoIiN8BNi1UdfsqwExDF9gnjW7NsHRLAd1oSqcMlsW2lD0DGPqtfFecQUj+wHE2
	PWvxI0xkFdDQi2kLlSUf5LrEibi594pLnmkcKJ5x247mBEj9LgkscQjWImkMaE8MHIXuQM22rSn
	4XPEcq4Lx2RXYc5JJA0nWBy8k5H0L6ccMBd4Q/3X75JVdeMQIf+X5tmyj0wlClxsruzpxkuIl2i
	swjLQ=
X-Received: by 2002:a17:90b:4987:b0:343:e461:9022 with SMTP id 98e67ed59e1d1-349126d0d62mr5163166a91.24.1764814880660;
        Wed, 03 Dec 2025 18:21:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMNoZmTK0wGfsVGyP6QuNy19edOtKoDNuRGBIfu41xy2mxnqUIXA/acAvITRIR1wsDzetNrA==
X-Received: by 2002:a17:90b:4987:b0:343:e461:9022 with SMTP id 98e67ed59e1d1-349126d0d62mr5163132a91.24.1764814880221;
        Wed, 03 Dec 2025 18:21:20 -0800 (PST)
Received: from [10.249.18.58] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f596810sm141723a91.10.2025.12.03.18.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 18:21:19 -0800 (PST)
Message-ID: <5feaebe7-c5da-4f95-931c-edf3f51db584@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:21:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: qcom: iris: Add intra refresh support for gen1
 encoder
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
 <747f661f-1be3-59d3-0cec-71bb6a6e2fa6@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <747f661f-1be3-59d3-0cec-71bb6a6e2fa6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YoLHmltroVyfFJ6o_-YSO1eqL6M_W3Me
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAxNyBTYWx0ZWRfX0efW/JoK8Sf7
 Suiw0RUXBlvbW3EeGzsLT2q+ACRr3GEoSuq7VJNUe/lm5DxpAWdpXcrA/DEh+SIVIKMZLSwMzmE
 JQ1an1fZCBuKaKP1/QOPd8am4UAzmwyzS7w4XM9d8yo+rM1HNcKp46+F36S6joUHSfg0rbtMkce
 tAx18lLHIFmxwfSLQAq6JvEWf7PD2VBbkrInE7cAPU5YD80Q1SgZneGT7abGCy4rejjgR6yOqzG
 PECWmQIBSd7pAqtlBfkRkir8XhXrkKthzgWTXxfJbA2QNx/97JT92R/2EZM/+Tvz+9ZbKBodw6P
 4n6GWVJqP3IoTHsNVnaETlWjgN2vc1TDUcfOyBVykZqGKIpx6YjtaROw5FIfWiz4XadCnkHHZmn
 3mpKSOaLZawmokLTSD6zUuk9IlYSxQ==
X-Proofpoint-GUID: YoLHmltroVyfFJ6o_-YSO1eqL6M_W3Me
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=6930f021 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RKEO2VjmjER0VAT8CKIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040017



On 2025/12/3 12:28, Dikshita Agarwal wrote:
>> +
>> +#define HFI_INTRA_REFRESH_NONE			0x1
>> +#define HFI_INTRA_REFRESH_CYCLIC		0x2
>> +#define HFI_INTRA_REFRESH_ADAPTIVE		0x3
>> +#define HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE	0x4
> 
> HFI_INTRA_REFRESH_ADAPTIVE and HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE are not
> being used, do we need these macros here?
> 

I referred to the Venus driver, which also defines it but does not use it.

>> +	{
>> +		.cap_id = IR_PERIOD,
>> +		.min = 0,
>> +		.max = INT_MAX,
> 
> is this value correct? please recheck.
> 

This value is incorrect; I will fix it in v2.

-- 
Best Regards,
Wangao


