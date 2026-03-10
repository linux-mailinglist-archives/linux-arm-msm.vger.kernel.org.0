Return-Path: <linux-arm-msm+bounces-96568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJFmKi7mr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:36:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24791248916
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A867630D8021
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A1143D51A;
	Tue, 10 Mar 2026 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cm2OhGvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtSBOEez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA6369960
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135032; cv=none; b=Un0xZVobNwM8tMyC/Ogy9875hUPVlT9oA+ppnuP4qpGMJG6tSleqY9ek8iqXOt5nKpQPY7tIMTrVDwE1LqZc4p2s1XMvYBvO/uIY+u6r8kunFLzb7pMk6HmlY39IMKJdR/wQHD/lKfO36nIQ7JrttE8CMd1Rqg4U1Bw9f1XQsHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135032; c=relaxed/simple;
	bh=uqXuGfflSEpE8YFEEerWxYrmt5kvu2j/BNRVMxIXBBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7FXfC7CHGsuWakQWWzoRA0V5XP1mH9A0n9A3VVmy6Li+AeFnk41TUDSBqRiPuQ5Q2QkE5vPvPXzi+xVx7UySuEFIPnM2+0E0JCs9CgKynV3KS4Wk7IzUmye423GqBZk94eoAhVrQ1ZHgs1hTk9D0GTtYpPlyg9zNwKYKbbF06Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cm2OhGvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtSBOEez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8s54Z2363151
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URVuKpK3lvRK8s9gUYJAp+UYjsaDU/GsAGApoR62pDc=; b=cm2OhGvtTYEt9RpB
	6j0D+baogyV+DR4pchS5uD1givux7lgEpcjqsv5Xia3OX4NKwqNnKV2g5DaaSCxH
	kJQlwT5EsShN8C60PBIdYUYCjubAvoLnRpdl8xV6SfeiSUTEGV00GXYQC9JxWgnt
	Zvj7WQfM+7vOmb9bKe1b9lZQPHJM4CUyHjwEL+EFebFkh+AzawFG8sdUa7Rb+d1U
	NGgMwQ3ZsFPGEG+a8HfCcxSAioMidtSscaqETgo6B3ADpxx8amuxIWw0NpN5zjvw
	0+tW6iqmKYczBQW+2D7YT1wJAwM8eTnw/mUdrletruD05biNNHQcgYOCS3SukWTT
	n55JCw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032bhdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:30:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-359f31809a0so3393212a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773135030; x=1773739830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URVuKpK3lvRK8s9gUYJAp+UYjsaDU/GsAGApoR62pDc=;
        b=YtSBOEezPSG4/1SXwrQqB6vtvh2WD9DFBc2WyssH/xpsffzahv6MLEHaW2pfMUUZ16
         jQ3bjaP3bzUnP4cmIPekDyZnbix7rlwOxcxu8uwnPGbS59WRxw4YL4N4qNK+TEg/V2wo
         YEc95KUqeaQVOh8SLCF/I9Ow5OBX70ahV0GS3iHCHVZBqKKym79IOTa+kBL+lImSzO47
         exK6Ho9JxXq39deIhucghbfKp/zmvV+5MA8iOMvsxqY6ai79HO9D7e2hSlHrGHPmQ8+x
         ali95hktk59h5nG6oY4pbUjrQWN0iGbnq+ACRl0QV8O9N+dfeU8F41EzR4bWo3q/iKoY
         1D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773135030; x=1773739830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URVuKpK3lvRK8s9gUYJAp+UYjsaDU/GsAGApoR62pDc=;
        b=YzvWoi9Z7Xs4i/IThchyLH7216vb+r7r7LYxlh43NoJihgLvqs6jHA1X/IWQlNJBMH
         wd6z0WRF8YQCFOigioFYj0rut07gHaSYEK3iFaT826ihSUTCEBlDjRWGJxC+K1DZeAbX
         YeL1YhTueoB064OsXiQlW6s+CWOJWmt8PAHuIGX6dpnYl+rudWaGZVh4MJ67IyPJ7Yir
         MUpdOmWfb+MWD8MB8sW+5N/Sr4t/ZtuuDTc5z43QgqxLYhjcYaMUEMmrvUqxizW2c7mt
         jbPudMhziXA1nKftJcMKOcJaPJR65rg39ZLclJpPTKTySR6EGS0jv5v1C/jzfTgWa9zp
         IOMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXabPb+8ni7E+IcWWreTDpWlP9enGXbKjelPtK2Nj+0H+CtAeTG5JKRTC58cS6qPcNGNbIaREq7MgS6DBhZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+eksGm/pkdxNKmonqYUkKEiE+RLJz+PjOAQQ089n2BLc6Rrx
	owdZr32DqU6hDee4sIN6pFHMxFd8iTuIb6S0hOTTYLKkElSqApmi0aaVEXXMVVWCaaM6gLRk1uq
	ZnbxJuCRHC2i/P+I0v1cSFjWXq66tdm6FY786FNuwzfCP7TbeVHYoEXiFGkS0Dxecip1q
X-Gm-Gg: ATEYQzzwByh1AU+2GzxYBpjShx0sdI9X/OI5dQMjjRWGg1pPZWKpgfkUGUBqu4Z3pbo
	RjEKsUM9MyxwL/8AGPk3EOvLocRojqw6EeHdrxR1YTP5379SYhMYmPsBi307U4Btg5VU024ss02
	nYCwsRx17/8IZcGr9Fvs5kYLy+EcMO5SNDO+HiXLwswgZ4YQzG/1GS8Qifqwhy77fhyFXukbReJ
	+eY+ZxV14VF1s2c6U6DTJoXCGisKpbI6B4a9Y0+yp0hqSbFvyIXuCgU1Yg6MEBHWnyO7hloQ8Jr
	7s7/abp1kx603As6/FIYa0HHjC81/XHsmrNQOvgJigW/3I6d7Iiz5ge1HWf4FdKjpeJeIyFSuWh
	hXrr83FpRnff5j6rY0giNo6pMKyDZIZo5d1l7+MfYUMjzywKabMLU87oCM9zU
X-Received: by 2002:a17:90b:1e53:b0:34c:99d6:175d with SMTP id 98e67ed59e1d1-359be283016mr12464155a91.2.1773135029883;
        Tue, 10 Mar 2026 02:30:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1e53:b0:34c:99d6:175d with SMTP id 98e67ed59e1d1-359be283016mr12464050a91.2.1773135028372;
        Tue, 10 Mar 2026 02:30:28 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f05ee478sm2395579a91.2.2026.03.10.02.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:30:27 -0700 (PDT)
Message-ID: <fdc64e6f-386e-4f4e-8890-841c59710dc0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:00:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] ASoC: qcom: qdsp6: q6prm: add the missing LPASS
 MCLK clock IDs
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <cafce8ef-5297-46ea-a14d-8a12bdf2f181@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <cafce8ef-5297-46ea-a14d-8a12bdf2f181@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MCBTYWx0ZWRfXztVfM5siZOTU
 jFoG4ea/Ppcd0Ple52K3UkkTP12ZOWDfuB6uyAvOKqXyGSTlvEeyjKLKU9M4cutdz3lhpQk8iAn
 mOOZAnvMmyQ9CBesLx144LTAglo1jnhKSS3N2GS2JRzqxYtzYxZa2KgZyzDnQumfRo4N/z1WPdU
 nAm4bto/vLEMjrpuCipTsYJMY1u7ikQMSNMvOZ2HBUQzXC4Sv3IBfxEUIbIuwoAoWvBY0qdFSNd
 5sp9h0zVQmz2o2IDBGc2xpPENlexCiwRSBdvpd/bc5kw9gkYoYxdJp28ekk3xEU553Y6AyPRwE5
 anwWe58KbVhy37rsRUPZby/x3ZRcjbam0oQNE/6dDT8QnbbzsqVISwIrcfr45CgPbkIIR3l/KjX
 4K11iq8JkwtLWLJfTT64pcEgjJUf1sm8A494BIRHSyv02Lmltgo3bJtIAcTOWlUQ0hkZhTfNrvR
 ZhEY3fzCv/eP3hGXz2A==
X-Proofpoint-ORIG-GUID: krqrS-flfvIIDNZyULCjDnZdm662ZC5X
X-Proofpoint-GUID: krqrS-flfvIIDNZyULCjDnZdm662ZC5X
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afe4b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8 a=0x9H3M7g5i9H74ZWH3cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100080
X-Rspamd-Queue-Id: 24791248916
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96568-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lkml.org:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/9/2026 7:37 PM, Srinivas Kandagatla wrote:
> 
> 
> On 3/9/26 11:12 AM, Mohammad Rafi Shaik wrote:
>> Add the missing LPASS MCLK ids for the q6prm ADSP.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> 
> This patch has already been submitted previously by Neil, Please pick
> the patch from https://lkml.org/lkml/2025/10/6/828
> 

ACK,

sure will pick Neil patch and replace with current patch.

Best Regards,
Rafi.

> 
> --srini
>>   sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
>>   sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> index 4c574b48a..51b131fa9 100644
>> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> @@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>>   	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
>>   	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
>>   	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
>> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
>>   	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
>>   	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
>>   	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
>> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
>> index a988a3208..8296370e3 100644
>> --- a/sound/soc/qcom/qdsp6/q6prm.h
>> +++ b/sound/soc/qcom/qdsp6/q6prm.h
>> @@ -52,6 +52,17 @@
>>   /* Clock ID for QUINARY MI2S OSR CLK  */
>>   #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
>>   
>> +/* Clock ID for MCLK1 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_1				0x300
>> +/* Clock ID for MCLK2 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_2				0x301
>> +/* Clock ID for MCLK3 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_3				0x302
>> +/* Clock ID for MCLK4 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_4				0x303
>> +/* Clock ID for MCLK5 */
>> +#define Q6PRM_LPASS_CLK_ID_MCLK_5				0x304
>> +
>>   #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
>>   #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
>>   
> 


