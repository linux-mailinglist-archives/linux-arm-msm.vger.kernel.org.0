Return-Path: <linux-arm-msm+bounces-92305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNjaDYXjiWnGCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:39:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 661BE10FCDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B51F30117B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C798936EAB0;
	Mon,  9 Feb 2026 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCRrQFeO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5ZeXEn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1B36A02B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770644353; cv=none; b=RRN08KmP3hu+qi9RmpxGIWWO+1qXAcjTVzMPOso0gbgBDEx0tbyL6s4BoqNSFDxADx3AJrur3jyA9m1Mr2+dIcOA7mTTrENHi50Y3UjoUDlU5nkRl2dnI6ehK2nW/ySvBX1PJutE3T7Wu5Fp87llHv7BSazIGUHqL7OMnfsL5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770644353; c=relaxed/simple;
	bh=KpuKl1H0TYOejSrLC8B0N2GoTMLKAyrWLJS0PHHwWWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svkG5jyCprlqoDj6QRFsHO8lHJJ3vbMvHzxdKWxrU4lm5oHotCf7RqT8SvzbUGOHGZhjl1xb4SDYvTrjpyskhXgI7MW9kpMYXyPYPxLIkk20Ex9RKCvXvnDdgF81xyTMC+6YcUr7O+Xx0Ub8HbjyNPKZrDu10zAiIaKUIAwhEhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCRrQFeO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5ZeXEn8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619B2hKC2587044
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIYqFkuAFvgSnj3jpwbykRNHTY4MgxO5cDXxvdr+fZ4=; b=RCRrQFeOMkfXcSJD
	GIYalDwhU9aeOq+6gBC/46LkTvPl3cKzB7lt0b4tXKBOjcgNx0Ji+11gNBZkSHV9
	YlFEQx6pjh06AiGkcpy3fs+Wr7N71gcN7wvG67bAbF+OTFIXToMXwN/0yZ9EXInG
	zze26PrNoKJ4+0yAZtqF2KCGmcDDopSjuOIoVC+jdRT9qxxHnciqdY2edoloVS8U
	P9X0L5/ebaXAAxua37hGJIqz63YgduV+IF/ScxzpP87oGnfCeBsj0DnidDAeCPn5
	zY9RkG0NL794OArbfSqk2O1Y2ajVvWXMunpJj+fyMyBWpl8Pdunlml6EXDbmOvLJ
	eojMGA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bhn5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:39:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3562692068aso1137289a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770644351; x=1771249151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fIYqFkuAFvgSnj3jpwbykRNHTY4MgxO5cDXxvdr+fZ4=;
        b=c5ZeXEn8g9e4gNNNrrPae9b7NVA//+aX+x+9gKIfYsyn7MfRBirtmQ9aKZYuUTmw1K
         g+Go5bsD7ClhQDDABTkhrLIwT4+3EZ8eG5YS+gGbI1hqoLuNRIpYGp8048dhUtsTFs5j
         zfY+OYjtUCcLB+mT1RglWxVElJdKX7xYvImzbyq+sFP+tmQSBFh3uD1IFWhu/Pfyc/A/
         doYi3NR6ltqMED7NLhboo+o+u1BPzzm8gym6zxswea7a8ZOQ0Qq0KYHoE5LdvCrn9wFS
         XSlS9RJ4YGVFRDfwaTJ8BmZPnMOnxetHLeWUbBEmoI8PPSREDFDrtOncEwJ2/toC9VgG
         Epkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770644351; x=1771249151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIYqFkuAFvgSnj3jpwbykRNHTY4MgxO5cDXxvdr+fZ4=;
        b=uhSu459uLGNg0uGprUp9EozALOi3KgAvO0DFGRC1FrVfTmtyd86ctBDyqUjmWwMiXO
         V8F41rpupZRHA1CGWSNDlpEv27Pklt26p2QwFNmvRdp6yAPYtyUsk50cl5RyhWztvsQV
         gyQCVQN8ozyxLoPiwCsq5P3sIkGcXLJh0Xx35CsMOf9XhyXrfbcGAuSrCDaTJ13uBagc
         rynSDyg5zEr9Q+IVe5A63eE0u07Vg9osD/w6ydODtRjLyu3C9Sn+nf7uAVNvbF9wv+FA
         Ix/vKrg83FYgDAdTkFOaYons/iV7eUz3dqFxN9ks5Lx5YxfwQDnhA0twFjNPXhp0ftG7
         oG2A==
X-Forwarded-Encrypted: i=1; AJvYcCWKmFDa4BWktx9JMcEkOxZZnrSjI5GBaBwcZuvGmdOMkxDJqDXRdh65uU4QvY7JGBsuApj5gRGA/A5KhJKE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AMYFm2EKr3u4PInf7suIzSxBbS4UHRr7zaVW8Mnm22DB1YV8
	zS11cvy1M+3ZtjaXPDQoZGrHd1jVebUCJRiYSX5fZDYPSMqTGeJGBnMlFAw05/iGThqUWi6IIxy
	vLcOTcPsInqFLuRmWWKKO0VA0JwMke3fjKPA/RW7xjNjLwtWTeLKatlxt+eKY+YqQUnTj
X-Gm-Gg: AZuq6aII1zqmW42LSkybQo7iSulC8cASk/F24cNH9bRwps8Af0/yukzAKm7bXNWTb9u
	Qoa0hv1crx7vPO/7BCqOIrAc+nSTtEKdtfK/EBuBcvFZNcBal3jphm5XsSIKpROt+Cqo1KaTMN/
	mphG55/dgXHfeN6Gn4Jl8Ke7LWS8rIaE9AGqIYsPVa1tQRYR4PTpwpbXF6F1Krq7qcDYieWBqJF
	SnfEggRs44FClJ804/zDNytwVxSwhCvvFRJpS2Dms8Q0u3dkxVG5n4hnzk/aNTVnZDuIEe74Inb
	gzU1DC+yE8T52C/Huz+GtZYgrV8yOIzELDdL/1ZvnPnqgVmkH4nIOYdH6sLF+8rgCy+021xOLhr
	Pt6Ff/ARHA1/Rdr7asABjYnfWICR4a+FTXgdHNDlvAArVAWYO
X-Received: by 2002:a17:903:2c05:b0:2a9:327f:ac57 with SMTP id d9443c01a7336-2a9411f7cb2mr165293295ad.28.1770644351031;
        Mon, 09 Feb 2026 05:39:11 -0800 (PST)
X-Received: by 2002:a17:903:2c05:b0:2a9:327f:ac57 with SMTP id d9443c01a7336-2a9411f7cb2mr165292965ad.28.1770644350271;
        Mon, 09 Feb 2026 05:39:10 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aad5fd6ae3sm61625175ad.6.2026.02.09.05.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 05:39:09 -0800 (PST)
Message-ID: <a46bf66c-8f88-44c9-afe8-78dc91bd50e2@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 19:09:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] soc: qcom: pd-mapper: Add support for SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260209112947.930853-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <x4muzue44tizvlrhtrmat6f2rdlqkzwuuo6l4553lgrewlsr4a@n24bqtl6jn6s>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <x4muzue44tizvlrhtrmat6f2rdlqkzwuuo6l4553lgrewlsr4a@n24bqtl6jn6s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=6989e380 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VVRYQGaUFtUKBumP3esA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _UrdQCzj2JaxRRTPjPEtzJ3ZxwJVIwku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExNCBTYWx0ZWRfX0U0CcsrRvrDj
 JO7kLghRNdOpyJjcrmYJBMxWnpc4bJCOnByCEjx2rXDmB3te/0tSmslZD5JF2xh1vEHQVIyPIa0
 BwLnRxb4IhMks4xH+UZZzusY2NUiKj88LAHXUJonInye7TfinVJBmsd3Qi1WZR7VchNQ1e9uJuK
 egPzq9VS3prkGYvPcILpbWDHWdD+AY2q2zvdyoujd//qW4MRO7vv0Vi502Ox3DLaCOIZtu3s2GD
 PPrM5fsik7h8U5uHeU804B8q+Pi0kZ67+OlnqORQn/nl9HhbOTNn++JRM8RSAA37BFTTuGvarpP
 hG76i3W7xf96UGfWea6N6jV+K0N7TjxyZUlL4TsnzArO6DOK8tV+iMEZ9sRHgRFojZo+GjJUTG8
 IK0kHEnRcp8dG0CwyQampwIJGlz/xANrqYE1uXJYYvR+twUjSXHac1jILeXE0RuuzLZ2oj6iepQ
 c5G756rsipEi0dR78Xg==
X-Proofpoint-GUID: _UrdQCzj2JaxRRTPjPEtzJ3ZxwJVIwku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92305-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 661BE10FCDB
X-Rspamd-Action: no action



On 2/9/2026 6:10 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 04:59:46PM +0530, Mohammad Rafi Shaik wrote:
>> Add support for the Qualcomm SA8775P SoC to the protection
>> domain mapper. SA8775P share the same protection domain
>> configuration as SC8280XP with an additional gpdsp domain,
>> except for charger_pd.
>>
>> Add an entry to the kernel, to avoid the need for userspace
>> to provide this service.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom_pd_mapper.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>> index 1bcbe6968..8b899ec7f 100644
>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>> @@ -305,6 +305,18 @@ static const struct qcom_pdm_domain_data cdsp_root_pd = {
>>   	.services = { NULL },
>>   };
>>   
>> +static const struct qcom_pdm_domain_data gpdsp_root_pd = {
>> +	.domain = "msm/gpdsp/root_pd",
>> +	.instance_id = 192,
>> +	.services = { NULL },
>> +};
>> +
>> +static const struct qcom_pdm_domain_data gpdsp1_root_pd = {
>> +	.domain = "msm/gpdsp1/root_pd",
>> +	.instance_id = 241,
>> +	.services = { NULL },
>> +};
>> +
>>   static const struct qcom_pdm_domain_data slpi_root_pd = {
>>   	.domain = "msm/slpi/root_pd",
>>   	.instance_id = 90,
>> @@ -401,6 +413,15 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>>   	NULL,
>>   };
>>   
>> +static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
>> +	&adsp_audio_pd,
>> +	&adsp_root_pd,
>> +	&cdsp_root_pd,
> 
> Is there no separate PD for CDSP1? What is the difference between CDSP
> and CDSP1?
> 

Yes, there is no dedicated PD entry for CDSP1 in the linux‑firmware,

In the device tree, there is no functional change in CDSP, only the base 
address is different.

Thanks & Regards,
Rafi.

>> +	&gpdsp_root_pd,
>> +	&gpdsp1_root_pd,
>> +	NULL,
>> +};
>> +
>>   static const struct qcom_pdm_domain_data *sc7180_domains[] = {
>>   	&adsp_audio_pd,
>>   	&adsp_root_pd_pdr,
>> @@ -572,6 +593,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>>   	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>>   	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>>   	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
>> +	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
>>   	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
>>   	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
>>   	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
>> -- 
>> 2.34.1
>>
> 


