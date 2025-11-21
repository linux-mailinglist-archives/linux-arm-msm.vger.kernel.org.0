Return-Path: <linux-arm-msm+bounces-82822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD111C78AD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 867B931A00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CE1348875;
	Fri, 21 Nov 2025 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cy+CFsfP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4smvpry"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8A2882AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723165; cv=none; b=ZsEFG/u3IoyYfu8ldOKx+JEhDcontjMSqcleBAAfbiIrQMR7nfs7CXFTNd9zsYwlNawI8F9wOlV9vNtZkk76CpTP6emTTnnY1/MPlCbOKA6RXz38XZBqaiwNsi0b6q84MSnrP1sMqc5dkOF3+iFBaEJPaRFiYK6QvILkC75FkSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723165; c=relaxed/simple;
	bh=SZ3wQXAgWc6lIuN4rikgzfO7DI/kAsIjPnQw7aPtW9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c27AntadQEENV+fTZkZZTonkuCinqHH5DOv/HVBoahWKWHg/zm/FgcfxLpJUzX/HekIHQW9nFVqnOaymxPefLIpUQtU8WnpIfwulIU6RMR4EXokhgH0rude9FpYZZQzRUPooFj3+ZIeGp7GMnfYNakVs7bT15qgfRLFtGfI3bSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cy+CFsfP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4smvpry; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALB4Aam3911364
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lwM4B3DhGX+I6P/NFpZd77ifbn/0WqeZPjM4Wp6rP0=; b=Cy+CFsfPbPEiH1Wu
	X7/9xlcAjc5hfXxqxBnFeObbcvP8OUGimNmcJubYNQwaXeWQiEpG7ZZ2JVdzMwgQ
	4W2lkRf9JlHL+Z1MPissIWGKr8dkkrQcLCFD0CfDuESj5muwUV3hyyMonhFirZto
	Z+ElMRt6RGvQJgkZGjMkfk9A+22j+Rn5FJx3OZtxKsnc0idq0w/tyvKqZy6eGKZX
	Bb1YY7ZRjUqVNW8ybd4qGIakcvev5qAZoA5IYW9mZOnDhXh3vD9TuvM7ttlmpZPO
	NDIdpAHQbx2MqiEywza3dmjkxcS6IRKVUgD5dYfX2b1ZwatyZ1nsDbh2cGI4fv0N
	NLfJDQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsg07f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:06:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b873532cc8so2054470b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763723162; x=1764327962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lwM4B3DhGX+I6P/NFpZd77ifbn/0WqeZPjM4Wp6rP0=;
        b=G4smvpryYbPKdT+2TQU90NsstyrF+Ly/ruwkd+SJToi9u5/EiBt/pYBDN2aUsQTq5p
         xGSFC/wFilqpcqp8x2ogwrhbqKtkuZW7eH+uXIl9vNorPZ5fjGPpXW4URmGPex2HS0TW
         8kLRn0J6tV5c82SvtpNPy/6V/sBJ5SSoMYeXUUNBx2WQE85ueoDwRDSIr5tEQmgf04R8
         m6h+NrYOiZ2YXrqRql1hDjxoxBBi+E6h8ngXCPT40luW60bfkzzgud83oA2NZgaCglm8
         3h9NfX0ZplG83z3fdUl8fThQwhwDgb+4neJ3mYWbLJxMVBxxBNKIWT2h9yjHtmZuPht7
         aUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763723162; x=1764327962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lwM4B3DhGX+I6P/NFpZd77ifbn/0WqeZPjM4Wp6rP0=;
        b=tWgfxY1tZJwgEyMYaaEAWTmzNuyC1IPK9xwWfPpBAIB9xXKqJY7zeOsJTH7tNXiWaG
         55NAkY+4KfOyk78X04JGsyUp2ymaM8MAA7DJ9uaSlmALTC1HIC67r/Eg5K1NBEGS0JoG
         JMN4LOvP14I2Z2ol2KEY4tlRfU9wGkR8LizYhb2PCqAmOY0/CE/GqN3hTfgyuQLAHb3H
         AKz6JpSk7w7mEKepUKoC1nsnWAB0IMGu/om8Cpqx8BPz5mWhg6vNElRDKnKxWQ/c3VP4
         tFPHopsNbNhE4OUiS5wd/rMAIG25ay30/r+nO3E/1F23h2hwoDX9slYhMc3880a9gna4
         5NMw==
X-Gm-Message-State: AOJu0YwpIWwdlo481gK9gaV8jRLKakPZvYYZ7c6X+6Dhtysmm59e96l7
	ZvebuTEPARn3SevSYtt3D9YEvdmaWtBizJyry8cHX57KbhbHqiHAjjosnDK9pNboUk132PxNTmP
	b7AvKWQUgd4VXutARuoNWXbWmcHvlJ2BQv/UqlYRZmWybCO2bkR/dtqjLbhZ2EO/m+5iR
X-Gm-Gg: ASbGncvlARer1jq09VhiglMRrzp3SyJIQiOuXJD3NE3ZUCdgi+31ioTnZjjkN3swuPA
	9FpVpAcjFESBc/66+HgYXrP14HsxMEZtHgF9bpP+ujJnq1flXcRajy9S0IzhFDgThkel1aF6s5i
	oSUXA5SoTrJbV0zSfJBIK7yBajTkFZv+XmreSGuLbNWoix6hexkTVm32r20QYw6eKp4MZ/S1JoW
	QCxhGKPmxep0qzh1NOK5gHaux2RNoxttac3C1gAfQv40t/KWAMzkAfnGe1jFVsK5/FJ1sIySy7h
	h4Pa7SsypkM76vYy6WOugLmoE79jAf2jHf1Gro2x8ysgv2kSr5ccOiOE3xAvk9qRhAO+376oydL
	3+8/jOoHnG9QHR1pzxwBpNuRCG5Bv+Oz/BZFLrIs7hdgsg/dLZ3slJePV143zZsUeBzaKphvqhP
	oEZrHJIFMeEHID01SJW8pnL4xPKpi0
X-Received: by 2002:aa7:888a:0:b0:7ab:2c18:34eb with SMTP id d2e1a72fcca58-7c420099278mr6559457b3a.12.1763723161982;
        Fri, 21 Nov 2025 03:06:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjhZEo5U7n9KUzCPIm+DcpEHJbeLnMbZ6GntiAhaks71XfbOEyR6pF5z0fkiXYdchePx97jA==
X-Received: by 2002:aa7:888a:0:b0:7ab:2c18:34eb with SMTP id d2e1a72fcca58-7c420099278mr6559434b3a.12.1763723161510;
        Fri, 21 Nov 2025 03:06:01 -0800 (PST)
Received: from [10.190.200.209] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed470ff6sm5729043b3a.19.2025.11.21.03.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:06:01 -0800 (PST)
Message-ID: <3ad05810-0cec-4a12-bff7-4b1da0fbdfbf@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:35:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: llcc: Enable additional usecase id for
 Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
 <20251121-glymur_llcc_enablement-v1-2-336b851b8dcb@oss.qualcomm.com>
 <bc8cbca0-3bfc-44e2-a7ff-401e52f76b90@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <bc8cbca0-3bfc-44e2-a7ff-401e52f76b90@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AfCnW2eozklcmD9WonfK81AXMlXEKJnF
X-Proofpoint-ORIG-GUID: AfCnW2eozklcmD9WonfK81AXMlXEKJnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfXwdI8oDq93YkA
 86EekLA3uPTVbKUQ9B5sOdZrW7kV4g02dzB+CqWpoYUfKAJjxR2QwCTiaFMLmwSwOlEe/r5hWFD
 fjs12qG/mB3BaizcAlA48LoU1NMnqUGvuO1254mzucrAbI1BsHsBVuZL4epmUQAmZDVNsNUTmhh
 HIlrDcPpALPoJ0aLo5v6RFmDToOA0KFpGPk/LPjQqer2+iYwfnhy6ZycIgj9G4HSKBHHGBg5RZA
 bxqPwAy2jsSSN6vjKVh15yW+EY74ty9XLKdyQo0n2VGApChXhBkGDVXH4xnnT+qi2RCB25nFTCO
 e7T9M3Nhsvc1GxpeB63sJZ6PTJPXoxO2FyIInBYpZGn7j8EYMWxEO+5108FSx1eC/mHfz0ji9FB
 bxTP+bTjiKBMLOx6Wv4dj6vFTv6DNQ==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=6920479a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SDN3FUhsDtkZDWFmCUYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

On 11/21/2025 4:07 PM, Krzysztof Kozlowski wrote:
> On 21/11/2025 10:53, Pankaj Patil wrote:
>> Update the list of usecase id's to enable additional clients
>> for Glymur SoC
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  include/linux/soc/qcom/llcc-qcom.h | 4 ++++
> That's not a separate patch. We do not want defines just for defines.
> You add defines because some code uses it, so there is a user. Where? It
> must be in this patch, for all typical cases.

Understood, will squash with driver changes where the defines are used

>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
>> index 0287f9182c4d..8243ab3a12a8 100644
>> --- a/include/linux/soc/qcom/llcc-qcom.h
>> +++ b/include/linux/soc/qcom/llcc-qcom.h
>> @@ -74,13 +74,17 @@
>>  #define LLCC_CAMSRTIP	 73
>>  #define LLCC_CAMRTRF	 74
>>  #define LLCC_CAMSRTRF	 75
>> +#define LLCC_OOBM_NS	 81
> Best regards,
> Krzysztof


