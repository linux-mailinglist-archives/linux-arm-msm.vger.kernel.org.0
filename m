Return-Path: <linux-arm-msm+bounces-92407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOXTE5jMimndNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:13:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F91174BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5668530300FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 06:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B9532B9A2;
	Tue, 10 Feb 2026 06:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuCok88b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvB83u4h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C282C08C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 06:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704016; cv=none; b=hoJ2o5GKIP+49+uVibl0zRcbM5yq7zbBbVGGxGfnEQOhRlD1ILRskqcbENqJvQlBroN5UXxjZh/CSpVgy37el6UWxK/dImMuWBmft12jvCgXVbRstcQ3R0Q1uQnm9LakecHkcMgmBR3FaapvCgx29eIKXxQ450Elfl38rB3Uvus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704016; c=relaxed/simple;
	bh=nXCMpFTrI3ZJYVQLFXEjLFfUGYhPOqDzW9nx1Mn9XjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPhs2EQRWIfUEGesMJD6PDH8pkSg90U0gcv9+IYi2zOKgiVAPnToGJgOYQ2FQ8HAbxbabv5NiXq3o0cO/DXw2h4FEwhp0uYg+bK4qUc0fEuCGIMG5jMAeMtJ/NJTp19ZneoeZmLdaKVcx7f0rd52rRNIBd1L+T25CZFkqcA/40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuCok88b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvB83u4h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A53fFY801090
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 06:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuOnaW4i3RT/c+k/Lu/x636WkCp+Sl3bNHYZivSjaA8=; b=SuCok88b8BhMc160
	xZ44NkgdcFNLvqpw0GJ8b7kqi1jmiNqJ4hpkGKGmgAPecGDOKHjNIKixSB6ZDSLM
	dijgIN1OTfF/b295936OEK7UIhip+Z7qglokgLBz9vm7zHnt3YrTONXdMu4do1vs
	MNO+/Ns3VeuEjDYOUa0x43yCHUAS4Nr36gIlWt37/rmZJmB6KKe5h2xCwaPxw91D
	ptGbE+wqOLOZJv8dBtfOzciOMd4Dp/pGuwmB9lf3gaY7Gp8xx9jeQYwCCkFEydxj
	WgIzPi5HxtEiOKHe/9SXQm+XLmjzhw8PyBZwKvHidEEcy2qXVM8p50sqtf0qOKKx
	ANSdFw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u068s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 06:13:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354be486779so1064557a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 22:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770704012; x=1771308812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RuOnaW4i3RT/c+k/Lu/x636WkCp+Sl3bNHYZivSjaA8=;
        b=jvB83u4h2gcr6nCI26wXxSFIH/NbWM0U/i2b10qkak7UKwEOMxIE+Ve4XAF70iW94J
         fVF+7kuNXSsYkfNVzkNOEsFLRM5Cu2DeCl9n6bYPf7GQrw+2lDKvl1BaGg8rEdaxSlGi
         cE2zhFVzO6QStkji11JXkDmRm9jo2Z9AQq+qsxA0ERxZJQ8NYg1SYEIzL/qAFYXrdQ2t
         Q87m/IxerS5UTwn8NGr73uYoDYbd2tSgiAABc5RzALIkeytDqeHhJUvVuv1bqfkVWNBr
         aDgqQ8pwk8L9OaKke+h1L967vMvZU8+aC3bsabbOweOC6ZvcJyo7hYl43cMCBSv+Kf2a
         3Ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770704012; x=1771308812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuOnaW4i3RT/c+k/Lu/x636WkCp+Sl3bNHYZivSjaA8=;
        b=rVxa+fRLMligP0N/7Ta1tIl3vxEeL1Y/43oRKwBhMTLVI+Oy75f0UCuVTvtDqKww1j
         bH4duus/3UCEcIAZhj+5wycVhwjjvES7KWOXjDxZmJ3Ry4lb78bnCxQYE4UxVTVC6EWY
         Qz9mT45W4DNltpcbvW9orjPBd1CrME8zbmOmMXYwME/4ckiqKPYejBpXgd1Vo5nBbKMD
         lYmJ9XxtTix8JQ78Be6Umm0csrt2LNZHsXghKWgU+mVGXpGhsmrO0ZBRBNZS51BLg9Ut
         Guu1efpIKZvBZSjtOgkR4ELj6e2qD/hqM8fAUZgDy7Mywq96gLuGl20df5ft51HMv3dP
         t9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUxnaHq/VDnq0cM4r99VWM80q+4qKL2RMlgeg445ivXCsULM1dcI05VtiuweaDjALaQRC90emNcpkN2tR2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3A4cqQRMNdc7nZ9YgzgWZ1bC6hJYNCmTGBl0Hz3mhJHU4vILB
	Fk1ihttvlRkLR31bpecX1EvzEebR/Bw5lg0BAjpucRYykmK4sQKgYn0KAQcE2MvMXSmVva1w4py
	H1PXcQM3x/eIjh6ZqqYJBuwQGon0PG0rFyZMV8V34yLOyXFk7yDR04r3JIMDrggDuBUv0
X-Gm-Gg: AZuq6aJvfh2tkkSEzDw/cnw8wuHcn/IcDhhnDnlkiNR5Y8QHu2JLjHuZQaiOyJNtdjY
	2pWbSLUuAHQezXdYe6EKRcEYqiH0Ak19yZdGrTGB8ukKfKtFsJ8jKl06z3XEsGo/jYk6wGh2OYn
	H5GCAjT9O3bR9Y+s0PmVpLRa8WmEqnwYf/UKcr3ac2vHgv9deFcahJTgcftW4ikZVAikP30FUrV
	YmSziEVHj57NHQaEKCmvbmKzV2ADfbwndgl7FxA08BrwJ/Vm8gRTeRUkSKT+zj2RZVKpRbFTn7w
	EmgbH88g5asWfzCRVoqE0ytNdDFixJ0oDrPLSnjQLJ2jG/rFHWCxlrrf2G9RBx8aSkt3fPaRxGj
	aidmeUJQmqUkTKa+vLzf745JrddGWIwosuALWLZqbpTf1qSJQ39az34OKU4Wf
X-Received: by 2002:a17:90b:5587:b0:354:9b26:cdf8 with SMTP id 98e67ed59e1d1-354b3c6da9bmr11130740a91.10.1770704011681;
        Mon, 09 Feb 2026 22:13:31 -0800 (PST)
X-Received: by 2002:a17:90b:5587:b0:354:9b26:cdf8 with SMTP id 98e67ed59e1d1-354b3c6da9bmr11130721a91.10.1770704011219;
        Mon, 09 Feb 2026 22:13:31 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3566292c488sm1460480a91.0.2026.02.09.22.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 22:13:30 -0800 (PST)
Message-ID: <69c44a59-eae4-4288-829d-26c69c8211b1@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 11:43:27 +0530
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
 <a46bf66c-8f88-44c9-afe8-78dc91bd50e2@oss.qualcomm.com>
 <ilkhlru6hbaalwrc6r6m7vyuqhuv3asww4hhmjyqxyuyky3t3a@whtlo5pduecp>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ilkhlru6hbaalwrc6r6m7vyuqhuv3asww4hhmjyqxyuyky3t3a@whtlo5pduecp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VNc6tz7EqMVz27pzCqINsMcgZVtqKGGl
X-Proofpoint-ORIG-GUID: VNc6tz7EqMVz27pzCqINsMcgZVtqKGGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1MCBTYWx0ZWRfX3qBY0ZGiAXpu
 hEvuTryIaksN9t8GurnKo1xExqDjtkf35u34FlxutKTMzZzZc88RC9Y+kw3xEHFw6OKZMzciPnJ
 emdpvKt49wNTJwdgkrlWe8EUyuhNfS0vCTqu9hWQezkJzcdiFfBdK++6EEe9PfufujIoFCXrBGN
 z3rMJq5Jyw2cH1fvVd2T4thPuYmwWCXJKXLhLUVKWVFvkrgi5J6Erfvra1TbE9Ztq+OGW6TMUhw
 Wws/Btj/Vf97kzIYR4up8TNDs1d4PtrMVMf9hekWHAG9ZTdCz6JBRxToBBIG9Mo1flu4/u0FT5l
 t2ccDwsHOk0XAPCOVbZPQctJLenjxKWtZIVbUazJ2WnwC2PV0a6RoMgizOivbbkb/KnQIccINJN
 ACJKlvJTzEV1g4yKrlks41K9vHCzjfCYIW37wOc7HzfZN3+/JTMHnPXeEOU+K0vAxaCLBUkvuDD
 TgUGbckX4dUVycLVYiQ==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698acc8c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=P917XNYOx0a1woFaCPcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92407-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 119F91174BD
X-Rspamd-Action: no action



On 2/9/2026 7:48 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 07:09:06PM +0530, Mohammad Rafi Shaik wrote:
>>
>>
>> On 2/9/2026 6:10 PM, Dmitry Baryshkov wrote:
>>> On Mon, Feb 09, 2026 at 04:59:46PM +0530, Mohammad Rafi Shaik wrote:
>>>> Add support for the Qualcomm SA8775P SoC to the protection
>>>> domain mapper. SA8775P share the same protection domain
>>>> configuration as SC8280XP with an additional gpdsp domain,
>>>> except for charger_pd.
>>>>
>>>> Add an entry to the kernel, to avoid the need for userspace
>>>> to provide this service.
>>>>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> ---
>>>>    drivers/soc/qcom/qcom_pd_mapper.c | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>>>> index 1bcbe6968..8b899ec7f 100644
>>>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>>>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>>>> @@ -305,6 +305,18 @@ static const struct qcom_pdm_domain_data cdsp_root_pd = {
>>>>    	.services = { NULL },
>>>>    };
>>>> +static const struct qcom_pdm_domain_data gpdsp_root_pd = {
>>>> +	.domain = "msm/gpdsp/root_pd",
>>>> +	.instance_id = 192,
>>>> +	.services = { NULL },
>>>> +};
>>>> +
>>>> +static const struct qcom_pdm_domain_data gpdsp1_root_pd = {
>>>> +	.domain = "msm/gpdsp1/root_pd",
>>>> +	.instance_id = 241,
>>>> +	.services = { NULL },
>>>> +};
>>>> +
>>>>    static const struct qcom_pdm_domain_data slpi_root_pd = {
>>>>    	.domain = "msm/slpi/root_pd",
>>>>    	.instance_id = 90,
>>>> @@ -401,6 +413,15 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>>>>    	NULL,
>>>>    };
>>>> +static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
>>>> +	&adsp_audio_pd,
>>>> +	&adsp_root_pd,
>>>> +	&cdsp_root_pd,
>>>
>>> Is there no separate PD for CDSP1? What is the difference between CDSP
>>> and CDSP1?
>>>
>>
>> Yes, there is no dedicated PD entry for CDSP1 in the linux‑firmware,
>>
>> In the device tree, there is no functional change in CDSP, only the base
>> address is different.
> 
> So, you can ask this question internally.
> 

ACK,

Sure, will check and get back.

Thanks,
Rafi.

>>
>> Thanks & Regards,
>> Rafi.
>>
>>>> +	&gpdsp_root_pd,
>>>> +	&gpdsp1_root_pd,
>>>> +	NULL,
>>>> +};
>>>> +
>>>>    static const struct qcom_pdm_domain_data *sc7180_domains[] = {
>>>>    	&adsp_audio_pd,
>>>>    	&adsp_root_pd_pdr,
>>>> @@ -572,6 +593,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>>>>    	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>>>>    	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>>>>    	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
>>>> +	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
>>>>    	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
>>>>    	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
>>>>    	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 


