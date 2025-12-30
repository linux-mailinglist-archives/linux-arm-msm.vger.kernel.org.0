Return-Path: <linux-arm-msm+bounces-86911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E62C3CE8C34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AEDD3014BC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839842E973F;
	Tue, 30 Dec 2025 06:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWwr6CD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYGS5n2v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07813263F34
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767074570; cv=none; b=akmdt1fNdERhO5Ikp1kHIg3vQ40/xdz7EQE4vPkbNHrjZjPIw91LeX2VHY7gals9DS1bolFhDbQcZv0YrNL5HQCyZQBcmkRgfj/dm28plGveJi7nOeMnWxw/LkbTwYAFOk8HijKNt30N4pu4vt7IcDYTvhTuqqq4PJKkD51kPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767074570; c=relaxed/simple;
	bh=Kwas6i+yO6AYTCY2Bi0oOc14wGQ+uPdyWPo2DNR48tU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=vFjUt8HVJuWVDsqEF8SCkwuESFOrmf7jS6Mf1gwMEJ/My32mFDqGckS/IoAHSnS5aVHHkv6AJwn/g/Vht/Op5QSM1Z8sbj7d0VbBkv+KfEWRbQUTD8l6RfxQXYnyTAyGtE7Nh0/uOkWrJ6E9APWOEEauRPf0IAGMvZJ4spk1GWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWwr6CD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYGS5n2v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU0ilBL2670845
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MElqb+vB8K63hON6iSmHcwD/Y1fFl71V1NoNoV+IIa8=; b=DWwr6CD26zJj9Mel
	hBupvAC98jMDa9PzB3IcvY7TpUsnZBkglg7k1VAIyhMqiAEiF4vFfhax+1eK/FEb
	CXTV95mGjbUjmUKp2GOAFvSl46OlDKrPtrkMDrUNPeDkHYI6/OyZ3tAbC/PtqG7X
	ouk0G6GK38FjH4Keed6ailPDI6P94RZq8RNW3j1ezm6qm6TE/ds8bY7GY17Fltuf
	P9k3cC9OXfI54wW7+WPXLhnZTbd5+9QXiNxqMtTzkA9mFG+UsF4F28c6xx9lMPji
	J7sOKu63HyBYWn6V5txYKhHaTPPIxwtgXBU/bxrgyBFdw6JSlNhjzc/O1vVDzcJ1
	kUI7nQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcrjgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:02:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ab459c051so24129743a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 22:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767074567; x=1767679367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MElqb+vB8K63hON6iSmHcwD/Y1fFl71V1NoNoV+IIa8=;
        b=NYGS5n2vjxF4kNuYqChFFYL1mw6kIChC8S/wec2c0DNp36+zx1fepfxOZgaaQJEiQm
         agLopHvcaMDA0lD31sfPhZzhvRxUd1lCH+ScnKsC05tFQFSLQBi8gWRwOTg5nzoAXYla
         5r9tkVzrXfM9bYDxj0EQBOjaHGEcU6F95EaB/nrCE9tAMHPWmzNeKx9pGCqiKwT4DLlU
         tlKWYquZ9RYGp/c7FLUI1e9soe7uATE+FhrxVXd+Ge1klzOnAUmou6k8aW9cbc9803mX
         uW8h+yChYFSu29yPPCL/eGhNNRb+DE54aMkzrH9Qs29b+cUTxQV0v9ATUeOc2EML0I0V
         pL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767074567; x=1767679367;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MElqb+vB8K63hON6iSmHcwD/Y1fFl71V1NoNoV+IIa8=;
        b=dt90evUvwRs9LSLzOtWS+cOyZSUzAtkne3LdEm7GM2vGFmybBdW9qkLeaFu+INxUnJ
         HFwPGotz2fqfBEolQqK2SNWJ5B9U3vY5vCqu7RruSqe5lx/zFjbRTwUCdbEQhQGR9wq6
         cBrQJ+t2yg8Xc6KCDBDS83kQ9Vqgkt2ye1sqJe5LK8LecA6fCSRJ2kezZ5u49yn8jq4Y
         7dSQ1T6PK0hRbuis0taCe3YwtY1HwDS0G064hKk7LUwY0TGmmwQAKEs8Fk3Oo0nzZUoG
         rvwgS3YM2ytE43R3x6rPGht8XeBKNZgKcC3cNQ+0GGkVD1shrc58khinNHPMiIJCCcmv
         YPGA==
X-Forwarded-Encrypted: i=1; AJvYcCXM+SLUPcKQtFBo8Dzr0mrzMcboCgbt/+FGkwKyxwKUAkiIqi1e+IEIjNLkMBI8eRSROEBdb4cjYWmLvEYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxQHF3iqTh68wgYZf92ZTY6f9R7Owcps4kzoNG8x37qwV49ou+E
	JXpAGNPKJtmwF+UVKqvE+W5BmFI8An0Hhvy4WVUpiuGR7AfS4hxlbuCIqZ9SR7xVC+NnYEl4t1e
	+/kNQf2C1Syw0kavgiBrUxXCV9y/HheLZEms9gH2Sfo2UqJ3EMdPwCpN13/8lZmDZRUax
X-Gm-Gg: AY/fxX6MyHwqpKa/ODu4ILWJ4Fi/3Ifk036+YFJt2d2RDi1xGn7HgQWw8km8mDrsy0o
	hiLWWoZKH3nTmvJndy55dUprDUmCs7XfxnHC6+XI0mRPz4MOJCPYLkoGh3TnprWYFibVFFn4gdn
	tePAl8ZA8WFiOjo0+t0YfI2zlJB1Q+vIFNGqxmRrFdzt5G41ZKr6g0Zrnc4Vr5pHYE0qRFPMgy2
	DJ0knkL30MQOyDBY86LEmRmV7jE/eHxtdlqhYmE7kl1xPvN72cBMHVnQ1EBZBKWFrFrGoTD2n35
	7UTTDOrQZW+LTTv1YE/o3NuRsQ5Mun29TwF2zUQv0ccMyOuWQtwsOWjLxvV7IvOVr6P3BaeRbVF
	yMNnDHxNpAvSNBxOqT1CuuAB0/YDeuA+Y54+W3oM=
X-Received: by 2002:a17:90b:35d2:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-34e921e057cmr30065541a91.26.1767074566739;
        Mon, 29 Dec 2025 22:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcdegpDZU4uHFbOONZR0iUuxpEWmvOTtglW+/1Y/PXUFGcUNtlm4gnCiJfdjxq6efdjBrYmw==
X-Received: by 2002:a17:90b:35d2:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-34e921e057cmr30065522a91.26.1767074566240;
        Mon, 29 Dec 2025 22:02:46 -0800 (PST)
Received: from [10.217.223.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c530f72sm26471509a12.29.2025.12.29.22.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 22:02:45 -0800 (PST)
Subject: Re: [PATCH v3] mmc: host: sdhci-msm: Add support for wrapped keys
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, ebiggers@kernel.org, abel.vesa@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20251229070507.3322149-1-neeraj.soni@oss.qualcomm.com>
 <cbf3fb8d-1dc9-4c16-9bd6-df45530a025a@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <b116f43b-e3ad-4e28-7593-17d2c3d9d52e@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 11:32:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cbf3fb8d-1dc9-4c16-9bd6-df45530a025a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eD5P36-dn_tO0qWsKgUcQjUXWyrfQ33V
X-Proofpoint-ORIG-GUID: eD5P36-dn_tO0qWsKgUcQjUXWyrfQ33V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1MyBTYWx0ZWRfX0bgiI80u1sX4
 JKBMLEOThEKpP1G+emxSm0/wwBKAnUmsJI2ZDh2cnlP4b1XIWrdcoA8NnjAvO7B3m5jlqPGdrnz
 V+fGV2iPpV4otrdKtfZt0gTeiwIIk8dNY7N6t5d4hV7xrUMqvPZrcoOoy2h8ClfuoR4aDgfeVZg
 B6Jj8rNEW1DEwDwXjWzgHWS2lwKBjKoYAA06rLSDS68yYdGuFAYGT/FdclspdLuhfA/KfuCsqGo
 R51UAj8VyHl66W+PfoiC4cjaqyU2/kCwTRWWbqA+Q3MgtNKM4Cs+TN7zFquwLpylZ43filPPnKL
 uk5cPe7umGf6mWOS7/KH11nrQs/wsEATZ40EiGwe4bNsEeECrBtw/HCtcizku8ecoz8K2OjuSbn
 P6exkngz6010tYI3Jovslm0xTuUDRl439bVi4qIAbuYap15KLz00oTXjxibhhf0dAFFs/jb8/m2
 hkv+5iBAwCPdZnBMhhg==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69536b07 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=90dgnz13A4KOmbfFnlkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300053

Hi,

On 12/29/2025 6:48 PM, Konrad Dybcio wrote:
> On 12/29/25 8:05 AM, Neeraj Soni wrote:
>> Add the wrapped key support for sdhci-msm by implementing the needed
>> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
>> blk_crypto_profile::key_types_supported.
>>
>> Tested on SC7280 eMMC variant.
> 
> [...]
> 
>> +static int sdhci_msm_ice_derive_sw_secret(struct blk_crypto_profile *profile,
>> +					  const u8 *eph_key, size_t eph_key_size,
>> +					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
> 
> These should be aligned, please touch that up
Thanks for pointing out. Will fix it in next patch.
> 
>> +{
>> +	struct sdhci_msm_host *msm_host =
>> +		sdhci_msm_host_from_crypto_profile(profile);
> 
> Please feel free to unwrap this line (and its copies)
Sure.
>> +
>> +	return qcom_ice_derive_sw_secret(msm_host->ice, eph_key, eph_key_size,
>> +					sw_secret);
> 
> And this one too
Okay will fix this too in next patch.
> 
> Logic-wise, I don't see anything obviously wrong> 
> Konrad
> 
Regards
Neeraj

