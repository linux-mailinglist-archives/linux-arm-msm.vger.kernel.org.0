Return-Path: <linux-arm-msm+bounces-62092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B32AE4759
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50674189E5C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800DD433A8;
	Mon, 23 Jun 2025 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfDyx9IL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2B515747D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690169; cv=none; b=uZvzfbJKY2dTmaoz9lRQwlExrfOYqKb8IVnhpLsm2WyvQui01p+rCTCimo7FAGpIk5NWAOcJSoGLg4Jzr3rrtO7YNoGPnGgt1C0GwLDzYujMLf8suhVR9Xc4xBRiOf1rmu3lOF0dCZ2dg2xtWy7y9q2wclDJFjMtkUa8ErlD1MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690169; c=relaxed/simple;
	bh=h2YybH+XRgDnI2PHptBq1+7EEBKWY5/FnF6uBAh5gYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umaGI1/vWbxHwat+xius0H6g7L+EgsQB+Ls2Us9VjR0MUPtF3yxkDdYyMcSqZRfe6Mnvm191tIx/y/uW7YyLgLOxgKuVJ0Xib87t3YopQ0G/O3OnRCw8gVcRhsE7cLOACXOsM1tVI7qafHahN6KjL13Zmilv5icqMFeFT5YbYNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfDyx9IL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fRfF021627
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bTeNRly5GELRCVnD8QU3PlAAS9wAsvY6SiSyNqNSSxo=; b=GfDyx9ILWf39m6HL
	y1ENwcnQaE5R7SQo+V/zyLyL0xeZBr8C2CjbAp0RGLq4wnJT8vNrCEDIF/QBeg6E
	y/Ya+cbQ2aCwTtikBY5imUs3qtd1vGZ3LVBTaNw13rz67eltGfeD5TUfAgPYC+PZ
	Nxf3CUEa7HMXznO+BG9kAbcOeVMXxlKee1Nsl+dnsm3ACHJ17QzCey7QObKNQ0Hv
	zkFj2I/5fyMEo5tiLJ9MOy91dLKgYPkz40oMwwBgnr2zhHdHh71wjaW7qO+xqPua
	CmJStcHhP+w452WBj0YX31XMUz/8O7vbnsH2ZwhpgXnq/gt0/LM5qkCapkqpl8zH
	VnWE8w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rps6h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:49:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabbaa1937so8100876d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690166; x=1751294966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTeNRly5GELRCVnD8QU3PlAAS9wAsvY6SiSyNqNSSxo=;
        b=PBhDc08CcQApe5KF8fezhenUAYppZTEnvlTditToFG9oPc0ly3FBWO+eGVhD4eF1wS
         Kda82D4oMwX/qeVfVUWfQbvW1gzmNaqjyAGhi0/cWYw/5u63XQUSdDfZdlB9A00xL77q
         JiwUoUp/dmAD6gQV2/NdggeLZ/d+bqTrzaTJ1Dh0FrDdHpI8ShnddKeK8rvyw50cEB7A
         eu46iHR9VharB/b0sEwBCyNGnzgAZLUUE0n0k0jQwL7L1U+PLwVD3lhQW9BzsK4p/uEP
         V3Qd/nG2XvZC7JVuaStzAirLfiEF2jCBm1jC1g0cvIUdMcDsvWh5qRlzOmu7SVrP8qZx
         bAwg==
X-Forwarded-Encrypted: i=1; AJvYcCW0SxZH5XFisj+0Pb1LfcUOm/SNSCuuQNTE8JlkY0vDOFatX2RMoJfcHu+dRYQ4nBYAIJ9Z04LXa8jt1q5c@vger.kernel.org
X-Gm-Message-State: AOJu0YxmRLRPp00QkDPdGW4B+aEFCiQOjQXgEQ5p2mw3HBkGbZqbtBbG
	V4qBI5O/ZDMJ8rarYTyVwsRKyaT4QBJHqETfcQm7lnOGxKStxqushF+JG7WLIEHVHaKuo5tL8Xl
	WsfkNCvGB+NDzObav3KtPug3W6eoZGV9p/eJG72vA6xr4outM3qxHxDXX4VeRP2SiXBUs
X-Gm-Gg: ASbGncsUUz/v8xv0VjEFwWfx0iZiBhtrux3TRZchVT+EcoMrP9YYIR90zXGRlEfhhcO
	ijP8PfsLnmO9+BVg1BnPsthxCllQjuK2RNdouvLF3MEm+Y46aJVWXNUxGGb6fil1ZLxzjBkFy1/
	Fc9m0b+axdk1yT+ATWlv8HcQWtqTxFJGs2HXWaaNQUeaF3+k4K00HA9KNy7AMa0Z72lqNbo3+kd
	tBn3QXISytbiO3wrL+lU3jJnnxpbAbXFKAmdSkf21K1sRFM8ZaiggYKAkgiPqJiGLje/Rkj75Hz
	PjNgf6e+oMNLsFurrAy4/KZpffbQtkHCNqrZ/sZRm/8/lvR9FpSwM2UOWo2mbCpz/5rv2Zz/vyp
	P0NI=
X-Received: by 2002:a05:622a:13cc:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a7ac3ce0ebmr4232561cf.9.1750690165900;
        Mon, 23 Jun 2025 07:49:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFq4iUMxAEsWMxXd+QwjHQmfB5D+jlVT8b0sgi5UmOplNqnAMPZZcGLJGamO0dbGXTtbT8lA==
X-Received: by 2002:a05:622a:13cc:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a7ac3ce0ebmr4232341cf.9.1750690165381;
        Mon, 23 Jun 2025 07:49:25 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0c8sm730875566b.64.2025.06.23.07.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:49:24 -0700 (PDT)
Message-ID: <2a37d3f0-a3f4-444d-8166-f85888a27308@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 16:49:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
To: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aFloifxONXnQbVg6@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=68596976 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=mrUvwfk0kWqCIX3n2FUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX/QDIgAJxwbf9
 8FqmXULGbxsVGkM2O+hUbMPHrSV/T1oAVyY4y2R1poUiNzfpjJ93TwBWAOzjeQnRaEi7ZjJiTbc
 DKi+5MeOiXsgMqk6JeJg/9AiBZHoEtC+tHDQ0KQR31Sg3fT8lbnD9meHlfRQLDlB6pc9vVdTDok
 KLohEYq+pH5E6GMSadE8/yMEkrD6btzfd9o7Lu80JuSySa99Glqc3rrGCQIW6LhsJ/XVBavcANG
 fgebGswjZTQdS9S7/anE9CAeeefnrZqfub+XerTi/5HtgExrW946Rk11U68NLH+auNN1JHyMLLg
 6TQXWjptFN+Is2DL59l4UFR5vo7q5xBbVmeY3lladPVXd/AfLLpduXLw0Y/VYT0UyebAd4qlclR
 OgqcQcA7Uqk7mv1qXObDqnV7v/balVIhE94R7u+dBhEBw3XguiOTIIaA/HigfDApU9o2EGCE
X-Proofpoint-ORIG-GUID: Jiwm_5jZ_jlO08Ok2UD0XlxBKrj_Qw_G
X-Proofpoint-GUID: Jiwm_5jZ_jlO08Ok2UD0XlxBKrj_Qw_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230088

On 6/23/25 4:45 PM, Johan Hovold wrote:
> On Sat, Jun 21, 2025 at 10:56:11PM +0300, Dmitry Baryshkov wrote:
>> For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
>> update variables in the permanent storage. However being able to read
>> the vars is still useful as it allows us to get e.g. RTC offset.
>>
>> Add a quirk for QSEECOM specifying that UEFI variables for this platform
>> should be registered in read-only mode.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++++++++++-
>>  include/linux/firmware/qcom/qcom_qseecom.h      |  2 ++
>>  2 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>> index 98a463e9774bf04f2deb0f7fa1318bd0d2edfa49..05f700dcb8cf3189f640237ff0e045564abb8264 100644
>> --- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>> +++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>> @@ -792,6 +792,12 @@ static efi_status_t qcuefi_query_variable_info(u32 attr, u64 *storage_space, u64
>>  	return status;
>>  }
>>  
>> +static const struct efivar_operations qcom_efivars_ro_ops = {
>> +	.get_variable = qcuefi_get_variable,
>> +	.get_next_variable = qcuefi_get_next_variable,
>> +	.query_variable_info = qcuefi_query_variable_info,
>> +};
> 
> It looks like the efivars implementation does not support read-only
> efivars and this will lead to NULL pointer dereferences whenever you try
> to write a variable.

There's efivar_supports_writes() that is used to set the EFIVAR_OPS_RDONLY
flag which then sets SB_RDONLY on all efivarfs superblocks

Konrad

