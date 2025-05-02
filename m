Return-Path: <linux-arm-msm+bounces-56531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209EAA769A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 18:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2CB83B1F5D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F8E25CC5D;
	Fri,  2 May 2025 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aB/aR1F1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4008D25C821
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201695; cv=none; b=mT4VL595wT82nLXC+1yE94P95XMtBO34HiaP42cn97DR4DeAK4SrlfYb6vos3JwJ0ieAL3Wi0piBv8YfI4n2aTXOl7k1ADYM3lpgutcuZOxI4VAi+zBE4bnBoLV2mPFg9lU9hW/QMjR/heXmTIiPTPm6orat6O7lPJkb+q519zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201695; c=relaxed/simple;
	bh=oEvN69p8sBgWkmJUdXqCwtQw+r14F79DPd3s+SqCWqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPSYwaGXH75vPRGjR3QiYAn82QT5AkXY27UAhesVr21tOVtg7l/VKUiLaV/SoZSxd8Cl7HJ/Q6KQ9M+lXnIj2tx/Fm6TxXfHbtiNwB4YMkZ4hDO+pxnMXhjPhQBryKlIni3uQsp0KCgXRyP8g5sNqy53tj4Ui3x9hzlnZ5N+vHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aB/aR1F1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DmXjO001534
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 16:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoReAk4HgTq2VsfM4ooMcOtk4AFKsH6ALJtlrQXG0fM=; b=aB/aR1F10eANzjIY
	sR/ixTlWHd0ANoXvrWUHjtGL5eEj6dlk2O/HnenQs91SuOQ1HXgsQVQTjrL+ZmcJ
	DbT8YyFZ5lfpBVEQ2tcW1OjZn8zRX1GnnnHrBBPjhxTazhNz5rkRsnozaGIAbNFa
	PVUtrTTQLlrB8dY2lqWBWenm2pSph9wRFx74NSpFCDAkU82dYF9wMgBk5yDdUf19
	gAfChMax23Dtdy948wf98TVgZumjMKbpJaRwP2ygd8CV6eklO3W6OUs2XYFAtibs
	3ghT6Uie0Gz1zxDj/3rxRU82exkvGe/HwYUuNVGLAbANKYP3KW1ravUBveUz3yaT
	F58p9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2guey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 16:01:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224347aef79so31099625ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 09:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201690; x=1746806490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoReAk4HgTq2VsfM4ooMcOtk4AFKsH6ALJtlrQXG0fM=;
        b=d1Uhu2UXXdUMfSJ33XKcFb11dZ0/lqXbTUUNWPlL9Aq1jBCgFev5ZDvv/M2TACQflv
         f627wKf/p94PMA795xDNEMBSohoKdtexomdhKkJ6iCtt1BzE+Zu1ZIDzQhralOQ607h8
         5NlgMJSmvLapvsMo1V2ZvTfZprXuwfgupX7ayQmiTyT6UoEHOACwMCp15WorVkT4M7j4
         +pe70tVApkvU12wvXnX5A3yWLeWFTXsQqh8DH0r31bmVDRDpBy+vu+me7/oKqPfgRVFP
         NeC23NTwxTtLWXwJ8Yg5PgFoadT5eU8fmX9jvMjyT9PEUBkC04gpspjmiV69sE3ZOykA
         oSNA==
X-Forwarded-Encrypted: i=1; AJvYcCU+EZOd6xfEansqMNtHowIR0qsF0iRm9CG2k+LeQbWUA7WwRO217WaBPwqIZzY68o0P4Hary5bU+ao0Y9eA@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJJWwdcjSyrCi8oIS22TC47DVvTfGJdUv4lO776trajnk3PJq
	K/Mo4DjC78UF4e6v5up/fKFi29qPAIBqck+RFxxgCcqgC3zqO2wxqG3gPGHWB5pAH4fQ+9rfyF4
	oHXNE7jOUD6GEjriStg4iisU5Gbe1516whZ0Sc0vpMLEUh2QchRiHMtYgzpyorgzqDzxQWY96
X-Gm-Gg: ASbGncvVjmnB+1X0wGf8NcKp7M2mNR+wNPSI4HFEkTzxsKTWhwE9za0x7tmNPoLryKP
	3TbS2ebNm9Eg/XEuKrrSlHqoeU9NpBxdpqwFHQa9fLMZU8uBDw8TIPO8tZGl7B206YfIiedgNtK
	3HFSYG6rqr+sktJfFrcVcvH1i3FqvrC6eDTzt979GAMImEq4a+fIUGUMsnMojZSZLb+uyEiI1C5
	CqUOxUEHLjt8DtH0BSYAnXbGpQDyWINpDJCE3hDgndt0F5IIRQ+Xn5mhK/b8bTLMkjVNW5sOzKS
	hBJ4/jLsCb9Mnyv+3TKdjKZQJ9J6pt0y5NE0ETH+A4h3AI1pEcQ8
X-Received: by 2002:a17:903:3b86:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22e1031f4b8mr53002915ad.12.1746201690545;
        Fri, 02 May 2025 09:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErV0e0vKI/fgoke9Y2Vn/UmFB0sglBHDOVAnYcG02t9Gkratp9oD7qJCWDutzkAvG97npa/Q==
X-Received: by 2002:a17:903:3b86:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22e1031f4b8mr53002545ad.12.1746201690057;
        Fri, 02 May 2025 09:01:30 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920e67sm952740a12.7.2025.05.02.09.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:01:29 -0700 (PDT)
Message-ID: <6d8f31ed-daaf-4ba2-9e84-227ab798ec5a@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:31:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] watchdog: qcom: introduce the device data for
 IPQ5424 watchdog device
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-3-b2dc7ace38ca@oss.qualcomm.com>
 <4fvlhcztwqw3sp4wb32rbvdra5ativo5zypeokpglzezkmjfmy@vogadyshroix>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <4fvlhcztwqw3sp4wb32rbvdra5ativo5zypeokpglzezkmjfmy@vogadyshroix>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _d2GjHdRcvrQmkDLz6bq2wU3JjhCWbvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEyOCBTYWx0ZWRfXx7JvDvM3/bbd 0/12GvE2gBnLD1yBbtzEA2D+tWBPfMxcc1QJQhskAqAU7w89fGzXSnmTswGLU6bsOOYzwYwVPEL p0OlhBY3c3sLClIEVlj2g9FWKDoJmPB/SnEN8Ln+qYmWNV/20FtHneKgg6i7lgQiX/NSqe/xLoK
 Sc2bc1wsuhCGaXCkUkjvXvS0d3raEWj88bdZgDnB7LBOo+Ak+6KgiAMFwMWmunlDPmULI0vM3sW MxIlBshJx70bQmInf/BnyVAcTOT0eI3U2kHdFpDs+DCGIHtjk3TEBh6/rHX5hA+xmlDPM56+mQE VwsOowApNgwrTTo7uHWeZBZncA0IRwRgzq50vGv1qdf38ok4lnQDU2YQoqYQQiDTFL/rrPit/lr
 s9skKOuOTjdzFJovyJQQ6+2sQDicGDhswWj+AYyuHGaBIZotvuKvTfvPMdA18dCYtfedHz9o
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6814ec5c cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=--xdvnZNnXTZpBI9SIwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: _d2GjHdRcvrQmkDLz6bq2wU3JjhCWbvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020128


On 5/2/2025 8:23 PM, Dmitry Baryshkov wrote:
> On Fri, May 02, 2025 at 06:47:51PM +0530, Kathiravan Thirumoorthy wrote:
>> To retrieve the restart reason from IMEM, certain device specific data
>> like IMEM compatible to lookup, location of IMEM to read, etc should be
>> defined. To achieve that, introduce the separate device data for IPQ5424
>> and add the required details subsequently.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> 	- New patch
>> ---
>>   drivers/watchdog/qcom-wdt.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
>> index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..dfaac5995c84c1f377023e6e62770c5548528a4c 100644
>> --- a/drivers/watchdog/qcom-wdt.c
>> +++ b/drivers/watchdog/qcom-wdt.c
>> @@ -181,6 +181,12 @@ static const struct qcom_wdt_match_data match_data_apcs_tmr = {
>>   	.max_tick_count = 0x10000000U,
>>   };
>>   
>> +static const struct qcom_wdt_match_data match_data_ipq5424 = {
>> +	.offset = reg_offset_data_kpss,
>> +	.pretimeout = true,
>> +	.max_tick_count = 0xFFFFFU,
>> +};
>> +
>>   static const struct qcom_wdt_match_data match_data_kpss = {
>>   	.offset = reg_offset_data_kpss,
>>   	.pretimeout = true,
>> @@ -322,6 +328,7 @@ static const struct dev_pm_ops qcom_wdt_pm_ops = {
>>   };
>>   
>>   static const struct of_device_id qcom_wdt_of_table[] = {
>> +	{ .compatible = "qcom,apss-wdt-ipq5424", .data = &match_data_ipq5424 },
> Shouldn't it be qcom,ipq5424-apss-wdt ?


Currently, the compatible string is "qcom,apss-wdt-ipq5424". So used as 
it is.


>
>>   	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
>>   	{ .compatible = "qcom,scss-timer", .data = &match_data_apcs_tmr },
>>   	{ .compatible = "qcom,kpss-wdt", .data = &match_data_kpss },
>>
>> -- 
>> 2.34.1
>>

