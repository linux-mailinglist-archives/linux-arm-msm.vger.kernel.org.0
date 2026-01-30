Return-Path: <linux-arm-msm+bounces-91320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDGkC/HffGmpPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 17:44:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 914D0BC989
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 17:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A3753007210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 16:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAD634F49F;
	Fri, 30 Jan 2026 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2qblr0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiJNUhhN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E16D34A794
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791466; cv=none; b=glk3Z3Rnr2S2iSurU8nVN+Z0XbxdMQnPbwxAEgXMM4gKYiaActd5w3CrcvqpaEqgrKvsjni2m5Vz1PF3nBsd0roJLUi62NHqwAAc3JiHHE4nhGcUir2KTkyacIX9EahnIypJCmiSF9gZ7ciWBOvWiwGHXgatnlpdCb95vBL7tpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791466; c=relaxed/simple;
	bh=yez3OppoYEvzvHqgPP8Op7queq7voD/wLWYBFRMWLBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHZ6uauukOh6AICChgtpdpFfwCd9ZS9BzAEpLbfrFV/2h55GDTaT9JQpDCmCKT/GDkT6s7HgfapQ6sQkcEwxuprnOvg767Ni0TM20qVKTHaJkZq6NipZbrpx2lX21mMZ6il4uf/bAtseQ9m01k1ngLM92P40EIhWfxXON6s9Yfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2qblr0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiJNUhhN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAxlQu1022148
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pb5P25J2+yJr3aAp+kbXRtjGFi3YnmIjvMmocPYH8eU=; b=m2qblr0oNwVVtmR9
	TodGEmHOfngaCo4QwGnQUdtX5YvzULPmU4WsunCr/24aceVWQxm95tJvp1V1omT6
	PHyirxWgYzuRNogwJq8DnyEE2g72PknMs4u5YsAZDjnoarplAjtAn/Uz4s2/uVxN
	6TrhMZ1/MRm+nZkl0VX4UkfCv1TkM1IEc1h+To9kc1O4pJGyfk2YxlW3J3koeCwd
	6fjm+zEBwPWaMdKDdSv8Y69BcuWKzuC6R3xdK3QjVIpUAZuupIHTq/QwT6Dj/WOk
	SREFlBjjd1sx2j7EOUgJMpYZOtWysykIeW/u4ZA4K5e5A5cRH3FSvjDSOkTs2aCF
	RrDa8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3kbbh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:44:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f69eec6so25805015ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 08:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769791463; x=1770396263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pb5P25J2+yJr3aAp+kbXRtjGFi3YnmIjvMmocPYH8eU=;
        b=LiJNUhhNAN2F8A1n3E/Nnmska7DDhGOooQssq0++qeR9LbjFve5dwP+t0ee9vPWBw8
         Je9w1L/X2m2gZRdfbf9yfGe6JuGe4ATwwSk5UZY0woJv+sco/F+idHDTVX9FrF3wEzdK
         h1EEq2nWU6imAOqre4Nvu3ugcSx5ZdBysCiwzf6raUpluYaAHumaBd38FMcXMYV8UNJu
         Exdk3FfVS9sBzD7O/869WcmJT22bQT7OXC0hvEBV1/MmE0bZof8rk3UKm6oOAWhxdU57
         kSlosPswWptDIdgsZFpJbOnP5/DWBHHdZGYiLkYGYZZNDUc0qKLWeTgq14+Ns59W/1Do
         /w4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769791463; x=1770396263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pb5P25J2+yJr3aAp+kbXRtjGFi3YnmIjvMmocPYH8eU=;
        b=Smllfy7QM6QLap+fV/ZVLU6Z3z1Yvc2mJoNxqM1BkrBXF3/hEgUJcNwelm19JvVUFH
         OvSMiJ04MCfIxrtuYBXsU+MEjF4azFcjZ6dnoj6BAJvAwiYixcRODJyIt9hZhRyf8M1B
         xRn1tMP83CoEYyT/gwXvUSyAdTyrYOrCeCMWZ16XikCqxQ7kjL7yMFe3J7Ki8KXtnXel
         bSixHBuDOZrsFCJ7xy5kkGX0i+FfsGRIUpkYqIjgtFgLEyu9xNhKhaomFwgiLgOjHBn+
         MyUSecALClOU3nSgcoCqgBG49ob5uyZ9b4duu8w2RhjTSWvY6Pl8X79Gx+8pd8sIpsP/
         oAUA==
X-Forwarded-Encrypted: i=1; AJvYcCUph4JUqdk6EtiX6h0t8mWUUdr31PC6hYUmUdet8EsIrd4YoHnimP6J0+kNgUNno+nZvxgpng6AxqHaZk/W@vger.kernel.org
X-Gm-Message-State: AOJu0YwieWxI6JdrzUfHHFSbxmxeCBBQi6gY9E0xYXpFOT71JG9hVT9d
	R7pRpxmsI4NFT364lOUIvuUgOwvGV7pDlR0oWI36yo1/BVxlbkmm8Ev2Xvk96IQsGoPPuYdSB2h
	BNhNUeovyN5ftd/Ye4Zl2/rModm7YAfwNjEaz9X36Lj16cnJku1GV0pxZRRTGFrOq15y6
X-Gm-Gg: AZuq6aJcPQ2X7qdd9oq7whi5cwqgVhcZO7CR4/Jc5bCyRS45nDvSFrAWJAOzvjWx/k2
	l3O/qwch/8GYBz9PWfanFILXM5YtnE45zcp+8ykt3WcnYPXljF9tAH6Uyft9PaFvDzDVOrxY2o4
	G36FHsZGMxg7g0Ywd2DyZ/cuQoOI0wWC6xdhzAsYxJ2E5czSB1iNd+1gDenPlPkL7IgZoLpLXJU
	ZGE3oqYr8/qEKoHvyWzk47Us7OU50cSvozYg5pDW+PQwgBN8VMof+jNKXwnpUI+viHeFJraJpdG
	iVl3PmtmEWFDIVQthxfRUjJKX/nF63iZEV7hnvdBRqgbqz6OFX7VLQwnlfubZHHpBFd9p/W9Ao8
	6uYy7snlVJ2tTbYd088Y1zs5nMFu0bMfgIEiGeglV
X-Received: by 2002:a17:902:ef43:b0:296:2b7a:90cd with SMTP id d9443c01a7336-2a8d990aaebmr36989145ad.32.1769791463346;
        Fri, 30 Jan 2026 08:44:23 -0800 (PST)
X-Received: by 2002:a17:902:ef43:b0:296:2b7a:90cd with SMTP id d9443c01a7336-2a8d990aaebmr36988745ad.32.1769791462739;
        Fri, 30 Jan 2026 08:44:22 -0800 (PST)
Received: from [192.168.1.7] ([49.204.111.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d9e25sm83063825ad.80.2026.01.30.08.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 08:44:22 -0800 (PST)
Message-ID: <e9d3c0b8-2abd-47a5-b594-83f0288d95ba@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 22:14:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
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
 <20260112104722.591521-13-praveen.talari@oss.qualcomm.com>
 <8e410852-37f2-452b-b851-19b7c4222727@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <8e410852-37f2-452b-b851-19b7c4222727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697cdfe8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=10aD+GSAjGS7IfLbEAHBKg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hbV_D0MF1U8yBtKqu6sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: D2jn7g3You5KHkgfoWYk5-az59km-IBp
X-Proofpoint-ORIG-GUID: D2jn7g3You5KHkgfoWYk5-az59km-IBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEzNSBTYWx0ZWRfX6r2p/9PvNEHk
 U8jCsmmfDnJrQhd5diSX4cU+LRczyfgWBUNoELQ1KxF+5SE+jbpcX9xFawvUwY9YtsPra5f3pot
 CQK/RPg6VaTv2CDXZy4re8HVcMga6deWsYTg71/URIv1CT7vTxwaEY/IiCjuPMe7nSH/vOJRUGd
 lnYnBKb+Ypgy1Pm1qWKvm2lZyenFYNbpkzxdbaVSRR3gPmvypjmpnfiV3MdKBST+w2nmY5YHWMe
 W27yFVje+86eTBjegNUSSel9qfFGU+7nO4ssozZZ0peMAghDeJJJKKXUi7JKpWIf6X2ZrlJfdrN
 OfazP+J5Hk0dVuN98S5nSytjkxPjHoCDF/gcavnsDPOhVDbXfX7xPC0SRFKE0ulZlD3vas89lGd
 ZRb/EeKxXT7FKKVhkiestYAlZiuA2hPp7PGSZl4jTVZFiRRgoGCTzvjXrVySoXlmryBX/6Y7jTo
 1uNpJfVZjCTd3ds0pQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91320-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 914D0BC989
X-Rspamd-Action: no action

Hi Konrad,

On 1/30/2026 6:04 PM, Konrad Dybcio wrote:
>> +static const struct geni_i2c_desc sa8255p_geni_i2c = {
>> +	.resources_init = geni_se_domain_attach,
>> +	.set_rate = geni_se_set_perf_opp,
> This means, on SCMI devices you won't don't the vote on the POWER
> domain (or PERF for that matter) and switch the GPIOs to a _suspend
> state - is that by design?

With PD_FLAG_DEV_LINK_ON enabled, every pm_runtime_get_sync() or 
pm_runtime_put_sync() on the device triggers a corresponding genpd 
on/off transition. These transitions are translated into SCMI 
power‑domain commands, allowing the firmware (GearVM) to perform the 
actual enable/disable sequencing.

Thanks,
Praveen.


