Return-Path: <linux-arm-msm+bounces-98308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOUhEZj6uWlfQAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 02:06:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA1A2B4D51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 02:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0CA23014867
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 01:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1529A221DB6;
	Wed, 18 Mar 2026 01:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3N7zgro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DocRfgfA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264021D3F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773795990; cv=none; b=MvDN6KtKmmNBhV4tZno3WHV6vsCeC+utbG5+TOHcwWf4Ebw0p6E/Va6Ggjyi84S73xVoTvn7bW3NICZ9Fjz1E+isl613mp3P+fYMj8kndAzuBJR1i2LvJex038MjoMB+ODIkQXPaHH3bpfOVjnsp2X8cr3vYYQ+uaMZquPSPL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773795990; c=relaxed/simple;
	bh=IXNKo6w4PAmPv4oifGkjnRgQHeLXuvDgRlt4GRw+2g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+NMpwOb3ITB7NFPUR+biPZJZ/Jwp9Jf3RvFg+yyLM+YceshMD7krKRIW4eU6+5AnUotgrkYO3+CSEqd2vIiIcveGC8YKeWNUvWztk4C+xapS7SskR1oCMKYWchjfrJpTrCofBuRJRotae9bF07o9NDLlF2UzmoCg0Q2oqNpO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3N7zgro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DocRfgfA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJ8ka1145420
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCyetuy2W7yLJXH1MrmSQIQFxypgDGqmngvv9gJ+Szw=; b=E3N7zgroMCUbjP4m
	6qBbZXIAzF4rKqXb0qqWKLOAeP3BC05hP8De3lF8ucaVJ5QArb2wXcehTFeeTLaU
	73KB3t7ZyDuCPiF6owK+GJnKw/ElZY4YBAmbab7odZkGMyYkqKjr2bxw3MNGNDhs
	3UJ6fVpY8M89PGPa9bmdHDyo4ssT/LPK1vWawWZuG3Q2KoAaq6xA6Pg/anueO4Lb
	iO8QOH6/Mj8nm/txyYxbRBRuj0+wwoBnBE16gFQcILf8YoKsddZ0fmYpDrUi1BKx
	SW/O79hpQrougel/TqG2uM22akyv8TAvjp48BXVwZNB6iBnA3UkpIfA3WUsNzi3t
	r6jMGQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3snrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:06:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8299499d582so22351954b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 18:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773795987; x=1774400787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCyetuy2W7yLJXH1MrmSQIQFxypgDGqmngvv9gJ+Szw=;
        b=DocRfgfArD8/VXTGc72Pf2U5oTqYcnbAGZYkUqNdBLTUfZFTRaKpEpnnDtiymo/HO3
         ZLO4cXxX1lQZ5PuXayGrHbojXAz0Rpj57hpo6AQd9Izbp42tusDf/VaAlxmZsp8E18pN
         RovuP47eZGZ2lneQz02rvCfQBBQs0Lg3iql9Gl5q9YVeQieWF296BLuvs0I8hXR09khL
         yKJxlYVls2GEsriDuQUrs4ZugUIufVHeFvwKaBC3WYa+ri5uoV0F0go7IJIB1U3VhbBt
         oHlEksCV7Utg2CFdB6v1ZoGaNolmAApAyRGji5WeH+O3o59U+BNWxtlOuJRe5soUzNwf
         yZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773795987; x=1774400787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCyetuy2W7yLJXH1MrmSQIQFxypgDGqmngvv9gJ+Szw=;
        b=er0WVHZzuenARVcufPX0zuGrLqz86qr60iwPRcsLx3aAgMtHyOu7yv/LF+MFWP6L+Z
         d+OVGdW8mIq5PJpxHftdbPmzswfKNjoc4gHpvBbNE9OqbGQ2niz46jIflzUJy4MsQJuy
         9RKjDb9pIdVKp4hg1YELOcV7wfaJ00qfP21hvNUAzHCNDJQHxzjWGS9u/yZ5CrkBt00Z
         62nFk15p0FBlExU08cxSXZoZa+XDm1RAqEGDiWrf2lcOUuYWXV+mdeqOL+E43c9Oxw4x
         /JKbCYiGhD8GfE516d0fJFjHG4RipIA+qeV7J3Zzu87V7/p8Ndpjit5GN/uyXf7j1GS2
         9e4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkv5iUwQCIRfBDxAZPINV1WIuPoTaxtHnWXseLJKhmjUONPjFAbIJBvijPWrvqgPmNazNhwEXoxJto3H+b@vger.kernel.org
X-Gm-Message-State: AOJu0YwPdMyT36VRgcv7NC7shxN4kqWj15o7Dy4BsSAOpT2etKl4o0IA
	V4SB4uMecvp52vJwHP0epPRDRGjRHP+sDbS+g0FYSV9cqGL0neVoNdDIYIT30iusIatzkhlzLiB
	sV67hzhpRyMYc5mom/9O+pgHAiXA67kKBJkJltUfYEEkL6CKLGidcYnWRDP1kgxrDupeI
X-Gm-Gg: ATEYQzykSWT9vVAHW0T4z3oda0HsPTjleDIo8RF15RE5Nx80pJJWUlvQCehoveC4m5P
	ZoqVM9YvD/66PHUz3Xlj1Tl9zf3qEgQBffqYiETpnkYBPzqSscOqm0END54eW+LSQ4WFkPgKbhE
	93DwAenzcP31gGVcQ+lHRHXlQpNScvMlcgQcQbc7VJ0rSVlxZFXVmglMPJzJ2j8EEdzVc7PrULI
	Rgnybr0AuMjfvtnmmdGCiKHkZvaBO28q5oyl6EkJnZXKz9RGgGCt9Gd0jMrTMWI1e1h94rr1LxU
	TgcVzpGjW94nEvGfM68V+TUMXQ/qAatEBRpuf+iAjDlCAmXp0tsHI82fo+rDUvCAK/JHyNvwEua
	bY0gAG/XqlWdkPqpq1B0kkMdj4sDEcatdBWVLFrIoIB/pfwyVCyPoWBNoVOjKEJmU5KD/LJZHKj
	GtHA3oosmApSU=
X-Received: by 2002:a05:6a00:3d53:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82a6acaaec3mr1506170b3a.17.1773795987115;
        Tue, 17 Mar 2026 18:06:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d53:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82a6acaaec3mr1506122b3a.17.1773795986406;
        Tue, 17 Mar 2026 18:06:26 -0700 (PDT)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bdd776bsm664244b3a.49.2026.03.17.18.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 18:06:25 -0700 (PDT)
Message-ID: <be947dff-881d-4c3f-821c-9b9806ce4f9d@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 09:06:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
 <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
 <1c4ab892-6f01-40ff-83e2-9060aa69616f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <1c4ab892-6f01-40ff-83e2-9060aa69616f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69b9fa93 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ihr8kAaVTVC09hDvwRkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: W7t5E0JYb_5m-Dm4aR4UMn41TxRCgWiU
X-Proofpoint-ORIG-GUID: W7t5E0JYb_5m-Dm4aR4UMn41TxRCgWiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAwNyBTYWx0ZWRfX/LzTkw5sBbo4
 Kvf2KPl8QJpDpf+TUrzQeen48CeQ7IbZYTY5AkRA3BO19KY+Sw6rMQl5Ymx7fCUWUFulplCllqh
 jaSt1ixo30ygRP+KsRsKfMAtOO9z7I8DQemXeiR5ITm/r7yZZbWdujU1bWTe5F0ARKO0LNnbNk3
 bf4YsEWrBWfpgc1weIXoouhVud4sqXhXyoBWOCC4YowusYwptPKNG9cYKP8nzMecXNwpJsJHGtp
 vTzdupYqKCeg4B5wkKOdtiETJQbNxRc48etGQTgfbKj5ouSywmc+2wDtlZbDC7k81WNZjnfVAIC
 RSMxOhohPnfwSgK8ktWmNkddjmXKGJJ2IfMa894s1LAkafaTgXrNFnm5z7f39M8z6BVsAa8llPO
 /JWIn9HWiBV74Xa/G9C8eNsBs94RyxxhBcJsGGqSKmr5GB45WRWuOx+u+MMh5asGF3NUHnsqJJL
 J4DmHCgckEggWC09EIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180007
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98308-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACA1A2B4D51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 7:01 PM, Suzuki K Poulose wrote:
> On 13/03/2026 09:02, Jie Gan wrote:
>> Introduce functions for creating and inserting or removing the
>> etr_buf_node to/from the etr_buf_list.
>>
>> The byte-cntr functionality requires two etr_buf to receive trace data.
>> The active etr_buf collects the trace data from source device, while the
>> byte-cntr reading function accesses the deactivated etr_buf after is
>> has been filled and synced, transferring data to the userspace.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c  | 108 +++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h      |  17 ++++
>>   3 files changed, 126 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-core.c
>> index c89fe996af23..bac3278ef4dd 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           idr_init(&drvdata->idr);
>>           mutex_init(&drvdata->idr_mutex);
>>           dev_list = "tmc_etr";
>> +        INIT_LIST_HEAD(&drvdata->etr_buf_list);
>>           break;
>>       case TMC_CONFIG_TYPE_ETF:
>>           desc.groups = coresight_etf_groups;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 4dc1defe27a5..fdf23e1c932f 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1918,6 +1918,114 @@ const struct coresight_ops tmc_etr_cs_ops = {
>>       .panic_ops    = &tmc_etr_sync_ops,
>>   };
>> +/**
>> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
>> + * @drvdata:    driver data of the TMC device.
>> + *
>> + * Remove unused buffers from @drvdata->etr_buf_list and free them.
>> + */
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
>> +{
>> +    struct etr_buf_node *nd, *next;
>> +    unsigned long flags;
>> +
>> +    lockdep_assert_held(&drvdata->spinlock);
>> +    list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
>> +        if (nd->sysfs_buf == drvdata->sysfs_buf) {
>> +            if (coresight_get_mode(drvdata->csdev) != 
>> CS_MODE_DISABLED) {
>> +                /*
>> +                 * Dont free the sysfs_buf, just remove it from list.
>> +                 * drvdata->sysfs_buf will hold the buffer and free 
>> it later.
>> +                 */
>> +                nd->sysfs_buf = NULL;
>> +                list_del(&nd->link);
>> +                kfree(nd);
>> +                continue;
>> +            }
>> +        }
>> +        /* Free allocated buffers which are not utilized by ETR */
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> This is dangerous ! Restoring the irqflags to an uninitialised value 
> from a different function thant where it was locked. Please clean this up
> 

Noted, will take care of it in the future.

Thanks,
Jie

> Suzuki
> 
> 
>> +        tmc_etr_free_sysfs_buf(nd->sysfs_buf);
>> +        raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +        drvdata->sysfs_buf = NULL;
>> +        nd->sysfs_buf = NULL;
>> +        list_del(&nd->link);
>> +        kfree(nd);
>> +    }
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
>> +
>> +/**
>> + * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
>> + * @drvdata:    driver data of the TMC device.
>> + * @num_nodes:    number of nodes want to create with the list.
>> + *
>> + * Return 0 upon success and return the error number if fail.
>> + */
>> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
>> +{
>> +    struct etr_buf_node *new_node;
>> +    struct etr_buf *sysfs_buf;
>> +    unsigned long flags;
>> +    int i = 0, ret = 0;
>> +
>> +    lockdep_assert_held(&drvdata->spinlock);
>> +    /* We dont need a list if there is only one node */
>> +    if (num_nodes < 2)
>> +        return -EINVAL;
>> +
>> +    /* We expect that sysfs_buf in drvdata has already been 
>> allocated. */
>> +    if (drvdata->sysfs_buf) {
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +        /* Directly insert the allocated sysfs_buf into the list 
>> first */
>> +        new_node = kzalloc_obj(*new_node, GFP_KERNEL);
>> +        if (IS_ERR(new_node))
>> +            return PTR_ERR(new_node);
>> +
>> +        raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +        new_node->sysfs_buf = drvdata->sysfs_buf;
>> +        new_node->is_free = false;
>> +        list_add(&new_node->link, &drvdata->etr_buf_list);
>> +        i++;
>> +    }
>> +
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +    while (i < num_nodes) {
>> +        new_node = kzalloc_obj(*new_node, GFP_KERNEL);
>> +        if (IS_ERR(new_node)) {
>> +            ret = PTR_ERR(new_node);
>> +            break;
>> +        }
>> +
>> +        sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, 
>> cpu_to_node(0), NULL);
>> +        if (IS_ERR(sysfs_buf)) {
>> +            kfree(new_node);
>> +            ret = PTR_ERR(sysfs_buf);
>> +            break;
>> +        }
>> +
>> +        /* We dont have a available sysfs_buf in drvdata, setup one */
>> +        if (!drvdata->sysfs_buf) {
>> +            drvdata->sysfs_buf = sysfs_buf;
>> +            new_node->is_free = false;
>> +        } else
>> +            new_node->is_free = true;
>> +
>> +        new_node->sysfs_buf = sysfs_buf;
>> +        list_add(&new_node->link, &drvdata->etr_buf_list);
>> +        i++;
>> +    }
>> +
>> +    /* Clean the list if there is an error */
>> +    if (ret)
>> +        tmc_clean_etr_buf_list(drvdata);
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
>> +
>>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>>   {
>>       int ret = 0;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 319a354ede9f..81237944b986 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>>       s64        len;
>>   };
>> +/**
>> + * @sysfs_buf:    Allocated sysfs_buf.
>> + * @is_free:    Indicates whether the buffer is free to choose.
>> + * @pos:    Position of the buffer.
>> + * @link:    list_head of the node.
>> + */
>> +struct etr_buf_node {
>> +    struct etr_buf        *sysfs_buf;
>> +    bool            is_free;
>> +    loff_t            pos;
>> +    struct list_head    link;
>> +};
>> +
>>   /**
>>    * struct tmc_drvdata - specifics associated to an TMC component
>>    * @atclk:    optional clock for the core parts of the TMC.
>> @@ -245,6 +258,7 @@ struct tmc_resrv_buf {
>>    *        (after crash) by default.
>>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>>    *         Used by ETR/ETF.
>> + * @etr_buf_list: List that is used to manage allocated etr_buf.
>>    */
>>   struct tmc_drvdata {
>>       struct clk        *atclk;
>> @@ -275,6 +289,7 @@ struct tmc_drvdata {
>>       struct etr_buf        *perf_buf;
>>       struct tmc_resrv_buf    resrv_buf;
>>       struct tmc_resrv_buf    crash_mdata;
>> +    struct list_head        etr_buf_list;
>>   };
>>   struct etr_buf_operations {
>> @@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>> coresight_device *csdev,
>>                      enum cs_mode mode,
>>                      struct coresight_path *path);
>>   extern const struct attribute_group coresight_etr_group;
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
>>   #endif
>>
> 
> 


