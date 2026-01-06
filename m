Return-Path: <linux-arm-msm+bounces-87633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E12CF6EC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 07:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CFB9301AD2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 06:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A022FABE7;
	Tue,  6 Jan 2026 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOj+dkr7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XllPDdoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366B91E487
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767682199; cv=none; b=FLV+a13u/eAoOV0ZuUXNGU75fQucO6rFo9Tku49F+hbfIGHZSqpR8I0SZ0JoVAU1/5OQ6EIFGkXqAZNtlVeOICuwc0keWnKqMGoa6fv0J4JKfn/Ld1ww2+EaJDX17ebXMG8T/j8iIwraeDH/SZOA3CeXLgaUX34N/2RE4RJhL6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767682199; c=relaxed/simple;
	bh=/xmNFuyCPBpCMjB+FmENdhGG5UPd7j8WVyB+sYCtvDU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=rg8NwVth8RWKe7hFYjEu7kOPIxIosetD2q6iWgiQSvxkydhroB6twPhGfUwZYIHqC7L9LrH5DmsjqF/FSdoAwEfI2lrG5j8msZPHdtfniiGekiDhOt221JbKp/tbHe2yUcG/LzEbsFnbGjqD4EgryJ4zul18fLKqmfxLAE+IUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOj+dkr7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XllPDdoA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QQJm3214287
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 06:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ir1ouW5/vfSqycFJvOuPfX8uLIx2rdWxBCHocaK7CKw=; b=oOj+dkr7bi5TiHm1
	QVtX65330KjJYKblVFH8l3k4j8d64Yovn3xseNk62PcUbV/ZBNAGEvBAQk6dBpyw
	0TF2pKQulXeBOjX5c1AXi4EBHCdGusoc8a44kj0N2NDpXUstYBJ6FU6tm8hZqe2v
	PKi0G1NOSPJnJBGyCmiWP8EEjM1+ZMXzZQJ+EjcZKw0lLJuebEtBhiAt+lEFuCpQ
	0xCGgiWC98GaOuJ1zMdoR6/pwOhMgeeIRvylVO/ZZk2p96y7nZ2be8ttmyqy3l9+
	t5csOpTgbvYHzDSRYr2uKcGSvZeaoeTY7n6vTIP7X8fG6SKaHqRMDwnzhTtpSmx6
	2bwBhA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpnd93an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 06:49:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b895b520a2so877997b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 22:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767682196; x=1768286996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ir1ouW5/vfSqycFJvOuPfX8uLIx2rdWxBCHocaK7CKw=;
        b=XllPDdoAl+paEBANcVY9Tr5FZs92iHJk01/Iv82k5naCSbvjtf5m2qjQdA3Qg7p5Pl
         hk1+n4y46vj4hy3bCEhcL1fnSmY4fXJjKBL6OP2wcAbRhOkR6dKWgelO9qpugyFA+Bo4
         dHFQgpJLgr1pHawSbvfnBhzKsrtPY9yDzvSSjNtKUfs4GTwgI3PNn4enKp0Qw5pMRA3n
         SKYNQa6CmW2Jvj/QuXDsMqIGjHfcl3G0lOZnprVdqUClaC+4cQL04tBLK0xrTgwtm1LU
         V9Z5E98I0RanSv1QfmXcevs3P4IfNZZx2/SLHU1yIVV+Zw2ie3VGaOvxFkpQlNsObpwY
         HwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767682196; x=1768286996;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir1ouW5/vfSqycFJvOuPfX8uLIx2rdWxBCHocaK7CKw=;
        b=WWjO62XRaw83hnQJo5DUVDp5onPFfq/FSvfV8tZmbaq0x+RhtSXLMsUoGOymbh9TWT
         DHMClPo6w5Df44nxNX34eSDeRfRJof5MrpwtaOSc8JYSodqcks6wJ6RHO/ZhRI65FJ2T
         ruQQczhjn/ccC4KjGZKtJd+Xl8s30HL7XHDPY/2HeKbclo4WZE7sg02nJe+n+0pxfeYH
         OB+JJlQXh7zhORKkXpprFi2mE3IWDf3YYGGKE8f6/6To36gEQViJBUNpBs6601sSYejd
         gYn3nE0LKIxJ5a/nQ/c4le34G3z/h/FZdr2+XvatrJXFJmDEE4vmdCvwAdO+/xX0hP3U
         5izA==
X-Forwarded-Encrypted: i=1; AJvYcCVTdL2vT9t5/k+R8sc91G0ACVZ+QjjNAGOwMkTCK9H63sqd+h9Mp5XZ6qIkZpA97bYeXJFPkR/drUcLkHb/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6wSSEoWu7Oa/DW1NMTiBCmWI9gzplqJjgRE3bmDBw/SWXXCiw
	Ghkz3bDOeE1EDSv79f1949GuGQpB3yKbwxJgJnYsjKWk4QVaGTEBwTRDIKZ73IFyr83dj5FnWSH
	Wf0RrHVMmvGIjX41APhrA9uC3qVT8jHUDPJD8P0UhWCTvfOA+mvU26yNPrT0kuiRtudt7
X-Gm-Gg: AY/fxX4aww1k1fVgqV68jGL2QmarZ0I7s3medxQOjmde2ns15EsvPatSOew2ElNPnpz
	G8wIiuXEGTHSARJiilGkRBbxObcZxTWe9j2iFZxMPy+2EzjBIxC60NPrSGwsSue98o6mclNTVBx
	9mLMd5zgwMt+ORBMQLfXcpby9S4bXRVz2PqhrPIY7LZgSE1aim8tDc9EydswIs+VN2sm4kRyPXL
	od7ftUoJ2zGT45QIye45LgBsKMcIJfKQ+FMiNlfuzILTqyc5nJQciPLlGD1YqfGKyIwwrGTzRD+
	rxG4BVj+RNIJtS0uFp/r1BsiX6wnjKW0Wfr1GQcXY5Oi3Ym/JHxbSTBAqWWzJS0cpN0Q5Xp0N4i
	DVgifJ3+LI5Su4jrETLsLI4MTlOdPVo7acwZG
X-Received: by 2002:a05:6a00:4ac5:b0:7e8:4587:e8cc with SMTP id d2e1a72fcca58-818847f8917mr1780248b3a.63.1767682195842;
        Mon, 05 Jan 2026 22:49:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDKds2ry3vRtmMnaFVhozottfyCYzZyEQY6c+wdNfaeSxkUHSC0bCpeb0dJRbSrkonglFWSA==
X-Received: by 2002:a05:6a00:4ac5:b0:7e8:4587:e8cc with SMTP id d2e1a72fcca58-818847f8917mr1780226b3a.63.1767682195366;
        Mon, 05 Jan 2026 22:49:55 -0800 (PST)
Received: from [10.218.4.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa195aesm1060691b3a.8.2026.01.05.22.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 22:49:54 -0800 (PST)
Subject: Re: [PATCH v3] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        Ram Prakash Gupta <quic_rampraka@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Bhaskar Valaboju <quic_bhaskarv@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>
References: <20250718110217.1929526-1-quic_dmukhopa@quicinc.com>
 <a569a2c3-2fb2-4a40-8d54-898e7c36f4b3@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <42797330-868a-bfcd-e0bb-b5f0dd3eeb16@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 12:19:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <a569a2c3-2fb2-4a40-8d54-898e7c36f4b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QdnhAeQJSAnk9w6BMfs9ADv_0pQoIVWz
X-Proofpoint-GUID: QdnhAeQJSAnk9w6BMfs9ADv_0pQoIVWz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA1NiBTYWx0ZWRfX81TUX7T+YbK5
 GgRfYWYSgkmddKUOKAxtX1Cxd9/vkCv1mZeMsAdOd5lyugqefyfNtqITMOaRRtUrezbctICkQoe
 V9WsBUE3GdstSK869maOXqQt90aY+D08ujnintD7yqzc2RAHY3H+0V8fqN5vtNfHsPHhVJO5gcC
 KPYm+XYPNjqJes8e9V4cHciSufqyepucwYu96x3AAo68iKwQLO6e0aNip9Zr9z3/U2h+3CrAZKP
 n9Z+7bifEU4skFKOIhBMg6msdZ9m0T01By1zFWib4Ok6JLmTO48XxU1SSACfCahUvqs/wKZjzRM
 VAhWXH5MYzXId8h0VaEpRalrLTBV+o1ltx2GRHLC+OZMbo4Npkt4R+eNkeuFJJ47ePil938Tdjk
 juaOw77eYKjDpG/SwXt0QFdgHnC34qmvy3oVORDxH2PZCeQysXGw8bou9+wGH7l4kNQmrR2dKQW
 kbI5ZL6ajDPjJ0sD8zw==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695cb094 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=J6Ah2vJHh0uAst4CsOEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060056

Hi,

Aplogies for replying so late to the queries.

On 7/18/2025 5:35 PM, Konrad Dybcio wrote:
> On 7/18/25 1:02 PM, Debraj Mukhopadhyay wrote:
>> Crypto reprogram all keys is called for each MMC runtime
>> suspend/resume in current upstream design. If this is implemented
>> as a non-interruptible call to TEE for security, the cpu core is
>> blocked for execution while this call executes although the crypto
>> engine already has the keys. For example, glitches in audio/video
>> streaming applications have been observed due to this. Add the flag
>> MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
>> keys to crypto engine for socs which dont require this feature.
>>
>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>>
>> ---
> 
> Let's take a step back - do we need to ever program this more than
> once on QC? What about other devices (e.g. the generic cqhci-crypto)?
> Do they also lose the crypto context over a runtime pm cycle?
> 
Yes crypto context is not lost during runtime pm as crypto context is tied to the host
where the context is preesrved in runtime pm cycle.
This needs to be programmed whenever host looses the crypto context like during power on
or device power reset.
 
> If our hardware is fine with set-it-and-forget-it approach, maybe
> we could limit this to a small if-condition sdhci-msm.c
QC hardware will be fine with this approach and we are doing so in this patch in
sdhci_msm_gcc_reset() API but it is not clear how other devices behave during runtime pm
hence a quirk is added in mmc_crypto_set_initial_state() to prevent reprogramming of
crypto context only for QC hardware.
> 
> [...]
> 
>> @@ -459,6 +459,11 @@ struct mmc_host {
>>  #define MMC_CAP2_CRYPTO		0
>>  #endif
>>  #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
>> +#ifdef CONFIG_MMC_CRYPTO
>> +#define MMC_CAP2_CRYPTO_NO_REPROG	(1 << 29)	/* Host handles inline crypto key reprogramming */
>> +#else
>> +#define MMC_CAP2_CRYPTO_NO_REPROG	0
>> +#endif
> This (and the crypto ifdef for MMC_CAP2_CRYPTO) looks like unnecessary
> churn - crypto functions should never be called if the config is disabled
> in the first place
Do you suggest to remove #ifdef? I am not sure why #ifdef is used with MMC_CAP2_CRYPTO
(may be to reuse the bits if config is not defined) but for MMC_CAP2_CRYPTO_NO_REPROG we
followed the approach used for MMC_CAP2_CRYPTO.
> 
> Konrad
> 
Thanks
Neeraj

