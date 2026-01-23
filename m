Return-Path: <linux-arm-msm+bounces-90274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cImdNpjQcmnKpgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 02:36:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F15B6F26B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 02:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E467306EA1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 01:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68945376463;
	Fri, 23 Jan 2026 01:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkPKQxZK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dc9cVcBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086C236D50D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 01:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769131690; cv=none; b=fFZXsE2LRrbeuSVwntq10ctuUCHjGREs/6CxKovIUFT8g1Ffy1+8BptZfM7XKz7m/HTlrWZ+xw6XjgL7b6utd3O0+y0nCdbnsfPH6GenzprcYP5xgr8Hk5mnCOM1ivhUiRmEgbqOdDepF6RWpQwSLirZ2mBXpGGKW3kPzRC0ULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769131690; c=relaxed/simple;
	bh=vAVCWN4R8VmDkjt8UP3zubrMPwp3HWU/dmWQ+AZC7io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FiCWMzrhqtdoevRMbWAkRiiVy5A1V9nEEzyM8o6TGE7mt1HVlZdpCiFTL1WqgCPBIrM50PCUbmuX5H19sK0yL9OgD8q3o+Kr6CDjXqLZZWFw3iiRkhNleD1Ca1AUVVH+bAk9AfrYdcWE1iMiSMY9OlT6bbRiBP7fIPH9HRtSq4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkPKQxZK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dc9cVcBn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MMVhju2909018
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 01:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9ilNfxsCAgF3/catfRgv/bNEw6+UvvAVmiznKDkFLs=; b=TkPKQxZKY18/K1T6
	/glZzMFAAMzoQdwb94/IWwrZ9r36Z8AP7PuT13/n0NAt9LDji+3JGPSXfgwALrr1
	dXAqlGFWFng6pMbzO3TCmdBP6kr0PnJSd3pr3+nmxSpbLC8ihb/xhEH58ZNZi8qG
	WSuB/huyQoJXUmOq9IN4vISWnSJmGzIaIoB8AYMdrDba+CytYbR42KjFpp+G8bVV
	4WcHF+qcIbpUd2daKtU6KjisqSwGK7uzStIGkrqU82b1O2hIL5tQpmIr6aykvr+O
	QJaqdiaebxb7TKffJiwQtZTl3tayvxOKbPoc37y9JGN+dqE1R73hRYZn3QCXYQFi
	KhIWvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1rcrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 01:27:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so1350657a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 17:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769131667; x=1769736467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9ilNfxsCAgF3/catfRgv/bNEw6+UvvAVmiznKDkFLs=;
        b=Dc9cVcBn5O4Qypn0dHIGgQW4PZNQMalqFM1fvnTtCjZQKDa2AWNElFEpc6B1eWD+DF
         7QogDAzK/iUc6rYn+L/405eo0zLJxsAVYpYLxsX9gq0gcHdPIrrwcGtVAydia3ccIKEv
         et74Q1lF6LmHfde2l+X2HirJti4RiRmet5ZXkDVnTyBWO3CJbZn++QuRpPtyr+B2CWZ+
         LC36BTCdZugZTORs+E9oVDEz6dlOyfs0NTpZ03wl+z20U4V+etRWOT8N0JTSoGNmKdY9
         UovOYhZNeaT2iRECuDMEYRCGB/GFsVjvn5HV3RUCCJMrlOCqXcOt9nw3+wrsfWu2+Q3A
         5Jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769131667; x=1769736467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9ilNfxsCAgF3/catfRgv/bNEw6+UvvAVmiznKDkFLs=;
        b=kpA8aduUNt19CTE/lBwgGu1tJGIv62j5+O6+20WK4q+/VGmbjZ7LpCOISuRyV0Q4LN
         bNCPmZtxTA85jRUNw9dqwqf8+L5jptbxnq0gB28oG/xJhmTpzKAvIcRBok+f4+BzBKrI
         Az1dWWgsmikeGjqkFgzr5Q2dsEG4N/io1zAcQP4135ifmGB9SfVOIIGAhdYJiuU4SJda
         xdwPGd6ONiGqPY/qENDpENyLIam+iaOeKvUovlQr+hNKqbkkY8tfD1K2D/g68bRi/dn6
         nmbjr/4QIdoj+CPNO/1wmQixGGZaBByCfUoh//+A4Bc4W94b6WNHT1LgDkdgfqx05lIN
         qWpg==
X-Forwarded-Encrypted: i=1; AJvYcCW/7XToaGD+6ymq8DOs0y/8X/N/rlm4BlR1R06SvSkOXPcPkOjNSnBfTbwx1n55P2bcuG3QwDTjMGVFNMN9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf6dVlgJAm28YmG0VUsKS42AtDHnxUGhgCLTmkBoz+ZOV1Uw2i
	WDPyULUqHphVDNZC0jsj9nbU6u1+eHmH05WnEzOh3mIZlaG7TvGioo3Ss/CdjsqLFeyb1P/7phC
	V3K40GwroiTmnd2JvSNC5uCaqece2z95KBLeX7LXDpsg4rXq4/nGIICGTftSTh5VURuxI
X-Gm-Gg: AZuq6aKf5nX4IKMz1XZpBq8FYcFl5V/AplKnVK8oi7UVXU6YnCkrJMKST7bW8Rjck09
	aMcKjDTuJAfO9HvdorPBC6AM/iwFT2IyP2I/pjAcym4xlbuWRSublu6KLORKKa/MLTdY6KfQsZL
	60DAyYRKs8wWLDn4n89HHu+wC3lMrSXdv/p4zmyrojRr85C7yxwMTK5TFAj8jEgplVPUbCGVKfr
	cw4RRqRR+BlD/ecodGrK22M6fyHrK+Mz9TfGomkDdQzdr5SS4ARTx8JZScH6fvd53Mogn2D1Jsj
	2ByECJuVhVMLlsVqdRmZLJbb474oMT9+rJMSvpCfAVnabmTmFAwZ9h8oc+Id7x50tQL/Z7qIJt0
	B2ZAa8rnpQQV3kbUU1OweQ8G67qTrZhAGkihJMQxTpeMW6NoW42Q+eGt+e4adpYJPAoXrin7sl7
	g=
X-Received: by 2002:a17:90b:224b:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-35368b44712mr1380892a91.26.1769131666702;
        Thu, 22 Jan 2026 17:27:46 -0800 (PST)
X-Received: by 2002:a17:90b:224b:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-35368b44712mr1380868a91.26.1769131666182;
        Thu, 22 Jan 2026 17:27:46 -0800 (PST)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353355e1161sm3480323a91.17.2026.01.22.17.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 17:27:45 -0800 (PST)
Message-ID: <d032a4cd-235c-437b-852e-998db8635056@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 09:27:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-1-22978e3c169f@oss.qualcomm.com>
 <525fe4ad-3d3e-4c05-a6f5-da91157f362e@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <525fe4ad-3d3e-4c05-a6f5-da91157f362e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Jfnn-EpUVG0NLHqhlVgmQ8391EsBPDB4
X-Proofpoint-ORIG-GUID: Jfnn-EpUVG0NLHqhlVgmQ8391EsBPDB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAwNyBTYWx0ZWRfX1oEq7zVja8lT
 hIIoVe1j6TcueR0X9vFQ6p+LIRxvPn1DUae+YQSUofUZIeTd1x8ssFrQQzHdmtrUJy8Nkhxk95V
 3Uw7kJFS81RceJ1r3OI0+ZO4rAHgJ5K716JyBDd7ov9El1z1rhTTnGBFtKJWNHW6LDK3E8uWjM6
 Ih9AC56bp+lNkt3hlrjEOeXWdqnwPvf2NE23vSa5ZDMd7cpX/AR+7RQVNbHL734fhEsAOsEWRlS
 d/U/o6CVVVzErIT2i2bRLWauABrvucdula1F3GAYIXCy80Uk6/qWK0/sVb4Zg9sC6SUjKXRCoLY
 RIsL0FKk9hiF6T8EDP7nBO87trgujEEas1Cl+PE2Q1/D0K40QAdjqxov1/IeHw5wUY56xvV1Tg2
 DsJsTxwdzUOCHv2GUFdaKmlBSmdDyqT3fCm/Gv1riQsB3gJFbBrMdM1loIt/ZUr8Hbn03WHz15G
 OcsbNdpTJB9W3gNL8iw==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=6972ce93 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fsjGGd5fPUumY84vGlEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230007
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90274-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F15B6F26B
X-Rspamd-Action: no action



On 1/22/2026 6:00 PM, Suzuki K Poulose wrote:
> On 22/01/2026 02:08, Jie Gan wrote:
>> Remove ctcu_get_active_port from CTCU module and add it to the core
>> framework.
>>
>> The port number is crucial for the CTCU device to identify which ETR
>> it serves. With the port number we can correctly get required parameters
>> of the CTCU device in TMC module.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 
>> +-----------------
>>   drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
>>   3 files changed, 27 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index c660cf8adb1c..0e8448784c62 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -585,6 +585,30 @@ struct coresight_device 
>> *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>> +/**
>> + * coresight_get_in_port: Find the input port number at @csdev where 
>> a @remote
>> + * device is connected to.
> 
> This doesn't match the code ?
> 
> We are looking at the remote devices' in_connections ?

csdev here is the coresight_device of the TMC_ETR. We would like to find 
the in-port number of the CTCU device(remote) which is connected to the 
TMC_ETR device(csdev).

The description is incorrect, and I will update it in next version:

Find the input port number at @remote where the @csdev device is 
connected to.

Thanks,
Jie

> 
>> + *
>> + * @csdev: csdev of the device.
>> + * @remote: csdev of the remote device which is connected to @csdev.
>> + *
>> + * Return: port number upon success or -EINVAL for fail.
>> + */
>> +int coresight_get_in_port(struct coresight_device *csdev,
>> +              struct coresight_device *remote)
>> +{
>> +    struct coresight_platform_data *pdata = remote->pdata;
>> +    int i;
>> +
>> +    for (i = 0; i < pdata->nr_inconns; ++i) {
>> +        if (pdata->in_conns[i]->src_dev == csdev)
>> +            return pdata->in_conns[i]->dest_port;
>> +    }
> 
> Suzuki
> 


