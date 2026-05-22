Return-Path: <linux-arm-msm+bounces-109399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DE4NC2uEGqPcQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:27:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD925B96F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8379930209D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F18F37B011;
	Fri, 22 May 2026 19:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GP6PT/Ft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHuxchNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1E92BFC60
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477988; cv=none; b=mo/DuCFM1M8ZriGe/WuXUFMugRdVHMqYYr30cMYtHn0K613+aiovMN78zemXJxUmBnmMwcwCLvHYcWld46L/haJMYEOiKxUyqsSAzk/T07Gz+61GDPZYwFR0IBfLMn0HMU4hzCjloLHmjwUuojhkFsaFT1zzH/fWSETS+kMhRDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477988; c=relaxed/simple;
	bh=wYqSJYotgMtie8NqUqcfDaB+2/iM5ldwntrcWEsF+A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nncaNcXg9o7uSM0Hi/R48H/HFrQbRP/ier3mqh5zp8qey/pwQ2RLMgnO290Li0Cz6PxuTUPE9+v+CYrd2Oh9oXBcdPwySxDSGEhhK8wuBsA31WbzwdzLTqdJAKzsWBXp/GSUfSjetHBhm5Xe1B3uQZnFgqtxTGIQ5SMbMUZFqYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GP6PT/Ft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHuxchNt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGasnM1733196
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+61W1UOtIsgDmPVeff6jHolvzf9011GZ05wsL11zWSw=; b=GP6PT/FtYTQcfpYy
	th0UN83zLAZ6yKe3BkkIhAFlKGrFCMJUk5uTpyJz7RfWVSOG9fXmxqh0ud2F/Y6v
	rhyjg7S0B1YE95T3OpjR1kKQifJ8WkJwJgJ9lcsmkkgq2ZtMDuZjd/YIblIdVIcj
	VCwBmq81cwfzEXWYZ79rVhZ4pHsfB0ttf+nyxnHH/5mHR7dDWvLCY66xC+409f5c
	mIpd1ldoXyAMatROf2XyWBN9OFExdWjENbvEPY0YiXrnTwZj3FNnFzgKBTcDGAfz
	HSpT/wGwlCEoBwpl+48tQO2rVfZyQwrCyCtvg6NrsO0bINB9BUgv/u65px08WINX
	huGXhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eattq8kq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:26:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso75465125ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779477985; x=1780082785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+61W1UOtIsgDmPVeff6jHolvzf9011GZ05wsL11zWSw=;
        b=HHuxchNtoQ0l1Bkxnyjfg8nuOE4UIOX8B1cTNHu+biclxjiprP2KkEyCtFkN2J5Ogi
         nM+/j03Vzn1KTv9facVmmhfuSuffgjtZpfSmvJmXPxKl4sVi7qpidGcX5sp3FHW0jHV0
         SHeE780cVTFIvvRfdCEQj0qre9Xpir5P1HLB0T0sBMfi1smHxNuffcxW/oXZkNsxveR6
         opZ5DQozULl3pIuoNMIwChGHiMawZBIzYSKCE5RY4rN2KLu7nhoSNzSTG6gnvSTnTfDS
         MRGeqiTjPwOwfIx77Cem2DBacNm4MY6BzXBmAn+DGlWra4WE6tskhvKo0+LWe7h0TMZG
         CEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779477985; x=1780082785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+61W1UOtIsgDmPVeff6jHolvzf9011GZ05wsL11zWSw=;
        b=bLpHcKaKOn4N+VN+GtfRs+6hQxpJ3Qyi7e4+6rZ5DgHpAwdst2mBupf03de45OZOU9
         pY1venijOkgdxBCCCJ1pk5GSb89h4/rPUX0YTByAcSjPJEsFxa9ETGwvx5i2UhJ0bGZG
         UcqfhxCFc73bMBYdk8p5uVFjusBprAhFUTFq/67k5j5MVDaGZNObLeEVDXQm4IFEOR+L
         eMNzOucQRztP8Hj0ybENifYVBSA+/6N/IYRKANMAgDavWY0xnw3RULscRlcYyPrWufHV
         HtFTXthtnYlHvtWGh77cAg5UCVuA7bNsSdNcuocHtxO96Tm5FpSI8lb8TvTS2hUa+Z74
         rOpw==
X-Forwarded-Encrypted: i=1; AFNElJ+PYnFJr0Pbkzg1K34JveKlS1KnfbeTA0ObWAMrs9BkFuvxJVxp/1ZEM23dzRZkzp8+Zg+9ZNhDNco1impB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn0NFmIEptx7nkOyzMIaoy/bjnYNZYwCurrHXNEpcWiKzL3ODJ
	FnWjZ7LETR2R0iMwbAb487ZkJ57Tlr8NI3+vi2OXRW8Urd15dwptDDSVgblj1cmmxrcf7gaNc9P
	cE0IIujxQ99DfWlvuj0t7EokUGKazDMoM5kg8wXH3a+DtPBoCxA83pQvYO3iSS49MfSlE
X-Gm-Gg: Acq92OF05ZMje3AzPAVEJZbgt4H7jP4Eu5AKYtzaaFYFyi+nCzwpGc8Y6rAh5sng/IA
	D3tZ+DtJtMG/A4vjGMXXKT46EahIvXcm62spyhV93QXIPaXbKftYEj5Js5BHmTO9qatbZstqsb/
	68O/Kinfnu4j2b9RZvjGgkpi4viL2oMgvJdzSIdLYS3onmahy8/9AmEUpVrxfCVBasp5GfE1Zz3
	ckdsfjH5c8iIB3+ygCHphB+mh/rJzaw4KO820QBX01DcW/80P78kFH1IjGhSlSqcjRbjqQKHdDt
	VJEHwPHdNu0NS1/3bOHxTizDbTXEsPmE4kbBxLV/jiWyKWak5Wzn/2El/TR/osmBfPUK1F6ZCDf
	bCOwEyNwI/seP4KEBZ/VmAx69fnszv1U7h4iggJoqyhUq4LYpbg==
X-Received: by 2002:a17:902:e785:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2beb05a4873mr50117255ad.5.1779477984888;
        Fri, 22 May 2026 12:26:24 -0700 (PDT)
X-Received: by 2002:a17:902:e785:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2beb05a4873mr50116935ad.5.1779477984437;
        Fri, 22 May 2026 12:26:24 -0700 (PDT)
Received: from [192.168.1.6] ([223.230.21.136])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ca7fcsm24750295ad.27.2026.05.22.12.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 12:26:24 -0700 (PDT)
Message-ID: <1e54db48-e618-4525-abf9-ee65d0a1b71d@oss.qualcomm.com>
Date: Sat, 23 May 2026 00:56:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <9e8c0351-0168-4d94-8610-cf2cc2f030f0@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <9e8c0351-0168-4d94-8610-cf2cc2f030f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5NCBTYWx0ZWRfXy0+VkxRMnRJg
 e4sBh6Ymzhg+8EaHnk0Rb5yanZc1Vg+qsXWbv3+LnzIgYMrqIMgege1R6w4Cn6+W8v2+t7Ota0z
 pjz2lCxKB2TXlSwD68GROX6G9nTRtB0+SwlwT/ODhqb3u24ka/cnekhzG4HIa6y/2VX9XaUFwyU
 svt7pKxiwPhiARk6qBsfXE3ub/zdhNVcC6F0/JWdjKWtZ5k4kvazXMnnhSryeL+KnlCld/UmTZh
 TK3LdV1ECSDAx0xJDrUOO3PBBWbucal/G0foIjNEQULHh/19peR8Vf6cdKWscqiQEyQ7aUT/bDE
 zRFVmUJNpXxKmGgCi4oOkmkKccbm25vbVIgDvN9cu/ix+NS0ZcPNFXwOVMtE0quLmi6f20THbVX
 J5acqvpWRXEm0Fwrgw2y6AFqoHHavuNgihColvzsnAn7/LgDJn7uG0/kpG18tF2oF7+4gNyhV5U
 bhJrxknliI0aCvY9xWA==
X-Proofpoint-GUID: CBQqY4Fk1V8trFrqsxqtWwBpIbJkMLoF
X-Proofpoint-ORIG-GUID: CBQqY4Fk1V8trFrqsxqtWwBpIbJkMLoF
X-Authority-Analysis: v=2.4 cv=S/zpBosP c=1 sm=1 tr=0 ts=6a10ade1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=dyxLLOf8pC0bdfPLpLFr6A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=UFEU4FUi6niC1vJbelAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220194
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109399-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2AD925B96F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/2026 6:55 PM, Konrad Dybcio wrote:
> On 5/22/26 3:04 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>> for runtime power management.
>>
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
>>
>> This ensures clocks are enabled only when the WSA macro is active,
>> improves power efficiency on LPASS platforms supporting LPI/island
>> modes, and aligns the driver with common ASoC runtime PM patterns used
>> across Qualcomm LPASS codec drivers.
>>
>> Keep the SWR gate runtime-PM reference from SWR clock enable until
>> disable so autosuspend does not gate clocks while SWR is prepared.
>>
>> Add a PM dependency for SND_SOC_LPASS_WSA_MACRO so PM clock helpers are
>> available when this driver is built.
>>
>> Suggested-by: Mark Brown <broonie@kernel.org>
> 
> You added this tag, but was the entire content of this patch sparked
> by Mark's suggestion?

Apologies for not including the Reviewed-by tag earlier — that was an 
oversight on my end.

Thanks
Ajay Kumar

> 
> Konrad


