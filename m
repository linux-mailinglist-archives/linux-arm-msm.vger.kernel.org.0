Return-Path: <linux-arm-msm+bounces-92300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULMmCH3fiWnGCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:22:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1310F984
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2A2630252AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ED63783D4;
	Mon,  9 Feb 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="outlDpsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dcq5fAof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBFD37106C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643172; cv=none; b=hM7a6dSkYRAr7XuJKHDBVzer7SLezXqU1ZZB9zX9RmOp/2j0aFbffAPALgjVp8JkCEDU3XQNuv4IteFYFPU39zkUzxpl6oT/YkhqoXguxpFOB/BR6Y9ZId5yb+TnXTwDKOmUwhFDtUfOY6uBB5l4aX/Fj3FIuv+o9JsrD+dC9As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643172; c=relaxed/simple;
	bh=O2BLyuSyPonvjVIsmn/SiGKyJSN3x0vXutiWvHObRpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0WBlvwSo0Cncty4Hynvl9AEHRSMtgawXhT2HAladEr0zrjVXBxiinY3rG5a4NZRIQHUPuAD7zAbIEgfaJxn/KLrubaakJzgehKycLBAyk6s9jr8w1U+P0DMPzuaxzNOI3IgBV1KAuVXhrVvy/GoI6uNXCoddpBxDspLqhzrKrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=outlDpsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dcq5fAof; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619DFGpo857215
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fod1Bs75BlOr2yAcur/jROcmlCUOpeZXS/sLQ6+33bI=; b=outlDpsTHdVX8xxt
	z5acFImq8eKAHwfBQizVdqJYGmojOaRiWmb1oTOC5Ufe+xBYv963T0pfrcKCXrpd
	SeiI7UCZUodSWxD0Y0CgXpyCTwYPJpVAdZCZKDgYJwQe6GwQv5t5DCa6coonddO/
	CvDj7AmW6Sfmus67L9ar9rv8lHBZ7HAoJc6vynfgfhi7+LbsB9BggoYxTEAuvBRv
	RHwEkWQuz1tTBdSl6obMOiUF8qaFGH+SKLLcLl9oZsCrH3MWmC8wlgmDzzACstw5
	SJlh/cS6n4gILc++tOYGpZXGAzuQsmGy8YO4CjYlGNWXCOTmJo6jCni9X6USQz+/
	T9Z0+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7ga600gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:19:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7a98ba326so52358115ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770643171; x=1771247971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fod1Bs75BlOr2yAcur/jROcmlCUOpeZXS/sLQ6+33bI=;
        b=Dcq5fAofYcqNfV02Jjm+E3C2MSNsQeIHuzxQJMD2q08kDU1yvv444Wq70jIX8EqmLI
         o1Un0mYzv1RapSf6S8xNS9l0ZHioXiBJnMkDJeeMqV0uS449ADk/yHkxgLi6GmlXYMvm
         jGCvgSXNYcQ3XkyiIDodp46VDhc1NJefxNgi9YK64EoyIhgufC1d7KFevCUjL5pF8vYq
         YWw6anpGgVSN2O7apId0G/GVSo5l8rZGjcwh44OEt8xBA9UsFb0YYi0JIfDMpqEmGEm/
         2gM8lN49xztxyEIppbec1MQG4AY3KDF5KiH3axT+AZl4G39HiONJDmQeAt5hX/H9n6Hw
         fjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770643171; x=1771247971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fod1Bs75BlOr2yAcur/jROcmlCUOpeZXS/sLQ6+33bI=;
        b=idzm1TnnpMFbEPrbnmdwVrkoxXkjt0U/ajQuOT7z+PkxoAF3noxRdNgI35KCQajPAL
         FZhJyB/cOjuImqEqeINmTrqcBSLxFJTIgITiOxu6ejHR6oGJUWtic49fLJOFH8MJZ/53
         cToHnz194xOwCK5eKD7GcvqnRmIQl2ItOP/NNjsrA5qFwcyGC6jReSmyToAgfpPxCoSI
         Uhgzyz/1zSlrSMWYyYq+s0Mzt14TNQ2HcNwFp9eobxjRWJTZeZCOs7xzNq2sMrX73Krx
         gMrBrxfhHx+EWudwq0EXCEVYsuF0H2zjpsAa8vScOtNqkrbW/2LJb7SpQZfSIHNMDMTy
         SOXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3rl5UB55QiKxn7DPDHhVTWnjkjvWB4qqRt7/tRpkTWQ52e/s8XfuuaDWXZtZHAbly/XFxJYPYOMLlCJ3a@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4bmlgL+ih4TBJW6ifL5kh819ucgvARwYZRwwVGsX0LHt33lW7
	YnT94Lx0IpT9ohFZAGLfxCRV6K5Q2E5/1exOqOkUE3r+ro6rT9N6xeSumDKhg+sj1tSdwHv3bit
	TOo9eJdKaTUQ11g8AdpRosrnueIaz8O7dKjS0yYtViy0Tr114mtBS8AKstskEfQehELP5
X-Gm-Gg: AZuq6aI25A0yvHTYXkY7Rq8n5TG1LCcL8zI/q1P+puJgAFU04Ut60PBa8DO1eL7f8hL
	J+v+9fgv6LwdoLhf1rDKI/gm6Z2HT7zeutIynkkk5CuqhFAgLpsZ0qCSWeNanWt2pzKTV3W7vUN
	15YEmxnjVMtrlF6HzN18atQ/RB0/KNO1nSIuxMNPFa0R2QwSWj7UApjLmg4eXQDCj3n7lWFfgAV
	sjEhnhycbfhhL7ckl4Q03Oo69/ykYYGKhUJYtFcTcbxSQy0Wml6PspYdOu5lvzoc6RtaitN+Xwj
	LshnpyFrbgbXEnTQxs5nu7cQyIRB5l11p9hvmIlPq+wYfqd8WGvqDPFGpPhWkt9DAO7ue4oOdSH
	19Gwr2WjOFKP40yflOUY8C05TDaZEbKIgSA4uT4vBLViBpWvL
X-Received: by 2002:a17:903:38c3:b0:2aa:d29f:143e with SMTP id d9443c01a7336-2aad29f164cmr59251395ad.0.1770643170804;
        Mon, 09 Feb 2026 05:19:30 -0800 (PST)
X-Received: by 2002:a17:903:38c3:b0:2aa:d29f:143e with SMTP id d9443c01a7336-2aad29f164cmr59251015ad.0.1770643170194;
        Mon, 09 Feb 2026 05:19:30 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a95eedbceesm82611135ad.84.2026.02.09.05.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 05:19:29 -0800 (PST)
Message-ID: <3406d478-50fc-45a5-be06-713a9151e0d0@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 18:49:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] soc: qcom: pd-mapper: Add support for QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260209112947.930853-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <onubc2qpbazy4kge5ynedl4imihcrj3btlo5aqvmxubk23t2hm@rasbihmw56gi>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <onubc2qpbazy4kge5ynedl4imihcrj3btlo5aqvmxubk23t2hm@rasbihmw56gi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BOW9oVzJDdEZftjFeXPMuMeG2bIOUEMD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMSBTYWx0ZWRfX4SP1Tk+Xwvsa
 hdyoHD1Ayg7Uc73pl4a3xOveOb/Y19GmEA0DvTUZv0kgXAzJLRXQaQv6FJY9+ajFri3WRQwF+r3
 ShwUaH4m6Umdd/X4DAAuXVBaXTNX4inm7t7scUGsDYWuRyoMR+Nrzfx7eEFkKXjBvv6DDibAg2P
 AAOp2ABN2JR0IRxdNZLlRdyhA/FEjBp7FMpem8Sx8T+F/WuBUMsJFinu06FFa/k07Kx9UUxfmc2
 fWXF8BdB3lBJHc0RnmdFninfxyxTe+shOd9HToeV68v3rSl5CaSbvSH4oLveb8V/21QKqViWPpr
 F4oO/Bx9uZcsQawRdYARVk5FTxHuFhlDnvyOqmqhco/i+5Otzo5RxwABkWUKppZ895YGNJ2PsBz
 SBsy2HOvH8cjJ+v7YqBpOSgvRlffnZbzds6aWB+177bo2nmVl2Peze3eDJJoyZB4KG9UzNCVf89
 h4+tffJlVsnJPkqIEjA==
X-Authority-Analysis: v=2.4 cv=WK1yn3sR c=1 sm=1 tr=0 ts=6989dee3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=yOJMdkC_xVn8QeWxUA4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: BOW9oVzJDdEZftjFeXPMuMeG2bIOUEMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92300-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62A1310F984
X-Rspamd-Action: no action



On 2/9/2026 6:11 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 04:59:47PM +0530, Mohammad Rafi Shaik wrote:
>> Add support for the Qualcomm QCS8300 SoC to the protection
>> domain mapper. QCS8300 share the same protection domain
>> configuration as SC8280XP, except charger_pd.
>>
>> Add an entry to the kernel, to avoid the need for userspace to
>> provide this service.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>> index 8b899ec7f..32538e659 100644
>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>> @@ -413,6 +413,13 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>>   	NULL,
>>   };
>>   
>> +static const struct qcom_pdm_domain_data *qcs8300_domains[] = {
>> +	&adsp_audio_pd,
>> +	&adsp_root_pd,
>> +	&cdsp_root_pd,
> 
> No PD for GPDSP?
> 

yes, There is no PD available for GPDSP in the Monaco linux‑firmware.

Thanks & Regards,
Rafi.

>> +	NULL,
>> +};
>> +
>>   static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
>>   	&adsp_audio_pd,
>>   	&adsp_root_pd,
>> @@ -593,6 +600,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>>   	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>>   	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>>   	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
>> +	{ .compatible = "qcom,qcs8300", .data = qcs8300_domains, },
>>   	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
>>   	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
>>   	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
>> -- 
>> 2.34.1
>>
> 


