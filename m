Return-Path: <linux-arm-msm+bounces-91323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CBSA+bifGkQPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 17:57:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D09BCB92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 17:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4842A307653D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 16:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2447F2253A0;
	Fri, 30 Jan 2026 16:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cm3AW8yb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qzvg/QRm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A11C3542E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769792060; cv=none; b=UX7evB8HP0YSHQRgYpNZ/xYfWwXahB6VVPtMnkcDQ/xptFRwGw6YvzZ8UewAnZRV7fjshjRy5iYW5X0rjSuuKRpNGSK9a+DvlMRG1gw2cE6hp/GxLj5zYIV0bnamejKMw/fUhj5EXZh07tV3rlTZet3wM6lWSphyEXB2H3GmKPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769792060; c=relaxed/simple;
	bh=cW/CdnUqHSo8CZnbbZvcXwLLmwlTJ7iZ14B0yAcTM54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLvOkef1nfRVzcLlz05ip4S2q2xlpc4KvWCBRseFjdICGFNUs8VAMGqwfbwfFoDwmt/vTjXNVyjvD8/SdKd4jI7tXo1IhYqjgQhV27S07ZWbf+iX808X07OtQmusFqj+nCBFtys85TrkPuEcpC0csYmvd3T6RTYOzeCggy85Pqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cm3AW8yb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qzvg/QRm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAZB4t891526
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awvAk9dpp7+jKmkbUjTkfr4pBxnpPpuKXslnuuCHXiM=; b=cm3AW8yb00HVORLd
	OvwbA+Ip6FEQUvKzXOGqwCN5OznQjPOv1NVLK1A/HYFKCSuEdlFjdZiVDFwd5h3l
	EfRDCZqNJoYcdsjZiSa8yomBySoYYiITJwaDqKqyHO57x/bF0d+HkLym2miXHzoE
	8UwwEKmQ9+2M/6wWLUUApPqtq3vtW9Or0k2hBVv5uQjahm/Em9d4Vm5ithH0j8O3
	f9r3cJAoDDiHcENv5cPS/Hc7K6dDPleqMsfUY0RPbegxXgyIhAXQFnlkwt8e84yi
	YKu6/e3BABt8sb3EIfCePROs9kq9Ks+hTyhEXjRvRwO3kxfumFWzZTvi+IlSczl/
	XZu7rA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7txg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:54:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7701b6353so24725785ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 08:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769792056; x=1770396856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awvAk9dpp7+jKmkbUjTkfr4pBxnpPpuKXslnuuCHXiM=;
        b=Qzvg/QRm1mkUarPvSRde/E2C2tfWU30m6gcZ6E1eaxXXZFPVBqMePqcGTkg8jllvTq
         8J0FdY5YL2e5pMN2Eb2Qu3V3Ytrj61EHoN4Vc0MyjToRvgEytuyW5PfmX4Oz3Iiy0f7j
         N3ga4ACCHkUgphoRPp66q30SQl0+oPvuhhT+dqfiNCG1wmdwzgZnvPPzzQneoC0/tvyE
         jzhfwjYPXkQv1viSk/xclPa7pKEJRtlK9U84qWSYS/fgorlElhfJ1VJXeGN3LZd9d9Pz
         PVhOY7LqIqjNl0I9Ym4Z4gg5uBAiM9u4XuHxHIRlX89vgGZAvsAYtTQG/4j/3NFp9h5O
         Bgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769792056; x=1770396856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awvAk9dpp7+jKmkbUjTkfr4pBxnpPpuKXslnuuCHXiM=;
        b=mN30u97jQaPxo4KCpV/1Lg6w06Qmja1JW4YCaOju/7lr/kHGcGS4s1C4T9uF72ldeo
         KKuoD/QGUYdnsgtsCUNHSURt4yrQqFhMuzUP663+WrKKi7SoInYzCgKoYZqbJMokJleD
         AymV6nfiBV4urUniv8pkBH1Tt/YYdUf/D3GQV7qUZSaAs2Gfj1lXQ5P0U7J2NlR4d3uf
         5juRhDY5/35dGAsVHrwnRZhHUwahvyKQiyoZoMrCSxb/h8I7Gf+/QQVXfK0jzTcKkHRr
         Hp1zLK0svNy3i2cZvk5+Fj0SK7Lh1qjzvZJ9zpq4kdTeFPm/H4KK5+bZwhP/0l/rS0GB
         yQhA==
X-Forwarded-Encrypted: i=1; AJvYcCUTGg69Q+6M3hZVl0f5sHJ1BN9IEeX5FbLR5DKtJPqCQ2DAbnqok9P/H7oed9tU18lHRRBKeLev/m1F7DVA@vger.kernel.org
X-Gm-Message-State: AOJu0YxP1DHbFfcn5OVYjlZ8bnnKw3JlabqsU2ov24ZkA9lVvpwQeeep
	vvEQDZPCES06ImzbjCTpzbElV93IzxFfwzQAd8a1BC53J+q6yERGWbgF9aXgSMV8cyboxe2o3ti
	ixH3DFGdh4YrgszHa4OStmFsmL/oFWSwj8OSoaks7F/ovmVw7/+iC4GZZ+NMQXTVd5khQJxxHNr
	Kw
X-Gm-Gg: AZuq6aL9BjEjBbN9vRvqGW1X2bmN7x9WyF+L53rjImWZg7ZrpsZGpiRWt0fNm8a3F/3
	4Jv9oM9EXoYPtmMlc0EnXrZhwK4qmSJKSDpwdSruBzO/sgBht8xC6KVN22b6nKhNeiHaz4KeTsG
	s1TS5+EBPEMtWxSAuCaBeHgNwoAypt9xl0c1KMhLVq+AEHrjvxi67uWjepRwMeeE/4C6xNafCEG
	ap0orW83oxcE7KJpWAbT/q/lnBXqwe8LrNH+3DAvtzwPEQil14v6SvDVVuaDBU9GqLFpGY4F4aZ
	31iJyo0DoYi45mOIhJZzumnACH3EFHrKfTymmq4MxilsjKZ5bHwHe0I8PyoVd9Gy/ACKdrCTVIK
	RGDqrMt7lkfLXILf1nKNnA10ApMo6lTb/5S2z6Uag
X-Received: by 2002:a17:903:41d1:b0:2a8:ac0f:9ad1 with SMTP id d9443c01a7336-2a8d7ec4e83mr39817645ad.16.1769792056406;
        Fri, 30 Jan 2026 08:54:16 -0800 (PST)
X-Received: by 2002:a17:903:41d1:b0:2a8:ac0f:9ad1 with SMTP id d9443c01a7336-2a8d7ec4e83mr39817365ad.16.1769792055824;
        Fri, 30 Jan 2026 08:54:15 -0800 (PST)
Received: from [192.168.1.7] ([49.204.111.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3afdsm78616215ad.61.2026.01.30.08.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 08:54:15 -0800 (PST)
Message-ID: <b918cfa9-1f40-4aee-ad91-d6425798bd07@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 22:24:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] soc: qcom: geni-se: Introduce helper APIs for
 performance control
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-7-praveen.talari@oss.qualcomm.com>
 <af0eba46-329f-4979-8b8a-fb5dbe2ad992@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <af0eba46-329f-4979-8b8a-fb5dbe2ad992@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEzOSBTYWx0ZWRfX2+70T93yQ4Ls
 62Z/YKRLrSQucOJa3thkqM5nbYYm4ao/VQewBrrIH6EPl6CCkt4Cr/YbT6XS4RmjlOEzvQbphhQ
 WG5MiFe/JNE6hNvQblueefH0PLyDPBKrymPTso9VfwqdsARePoM/nxUEUYQ+vwCxhSfW8vBGARv
 VgTsCXIlmy5E8WqsF3LpQ7KIpsXL9dV2xZNlQ87FzishkcqiY6/W0/8KU4/TYoByWxp2BOdogDq
 AQuMBUSMwNDQEWCUuRq25YXnbTg7r11HKGES5NI6gtV3PuSQALJRBo9oLKtkCx5vRgsLGiCmCUr
 cINy7JAqBUciaLNEw6uZHjiaEQn1TtJ3q6dQ3xCtfAM/rQD+y0amDpiclp8rLND+SbiZ5MScIJO
 uGpeRmizfVvs+LDmN8/yGcwChaMAFdcse3vu6vYp4qqzYLlCoS8ew4eVP+T+dATkNBobp6qrHrV
 h1QVdp8JrLulmRUiELQ==
X-Proofpoint-ORIG-GUID: YlywWp6gtrwOlG-eksQDxy-Hse8zzTSF
X-Proofpoint-GUID: YlywWp6gtrwOlG-eksQDxy-Hse8zzTSF
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697ce239 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=10aD+GSAjGS7IfLbEAHBKg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JTZeKb06zDgOFcaq6ncA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300139
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
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91323-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58D09BCB92
X-Rspamd-Action: no action

Hi Konrad

On 1/30/2026 5:53 PM, Konrad Dybcio wrote:
> On 1/12/26 11:47 AM, Praveen Talari wrote:
>> The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
>> manage performance levels and operating points directly. This resulting
>> in code duplication across drivers. such as configuring a specific level
>> or find and apply an OPP based on a clock frequency.
>>
>> Introduce two new helper APIs, geni_se_set_perf_level() and
>> geni_se_set_perf_opp(), addresses this issue by providing a streamlined
>> method for the GENI Serial Engine (SE) drivers to find and set the OPP
>> based on the desired performance level, thereby eliminating redundancy.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/**
>> + * geni_se_set_perf_level() - Set performance level for GENI SE.
>> + * @se: Pointer to the struct geni_se instance.
>> + * @level: The desired performance level.
>> + *
>> + * Sets the performance level by directly calling dev_pm_opp_set_level
>> + * on the performance device associated with the SE.
>> + *
>> + * Return: 0 on success, or a negative error code on failure.
>> + */
>> +int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
>> +{
>> +	return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
>> +}
>> +EXPORT_SYMBOL_GPL(geni_se_set_perf_level);
> 
> This function is never used

it will be used by UART driver, not for I2C/SPI.
> 
>> +
>> +/**
>> + * geni_se_set_perf_opp() - Set performance OPP for GENI SE by frequency.
>> + * @se: Pointer to the struct geni_se instance.
>> + * @clk_freq: The requested clock frequency.
>> + *
>> + * Finds the nearest operating performance point (OPP) for the given
>> + * clock frequency and applies it to the SE's performance device.
>> + *
>> + * Return: 0 on success, or a negative error code on failure.
>> + */
>> +int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
> 
> I think with the SPI driver in mind (which seems to do a simple rateset

APIs were added as generic interfaces shared across I²C/SPI which is 
specific to firmware control, not Linux control.

> for both backends) we could do:
> 
>> +{
>> +	struct device *perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
> 
> Then, we can do struct device * perf_dev = se->dev;
I don't think, it is needed since this is specific to firmware control, 
not Linux control.

Thanks,
Praveen Talari

> 
> if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
> 	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
> 
> and reuse it in both cases, completely transparently to the caller
> 
> Konrad


