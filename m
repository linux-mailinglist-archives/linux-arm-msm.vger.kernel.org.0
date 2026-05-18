Return-Path: <linux-arm-msm+bounces-108090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAo1Llq2CmoB6QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:48:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8BE566EE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB3353002E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 06:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E115F1F91E3;
	Mon, 18 May 2026 06:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCDDwkVY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+4rZU0V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC0F3176EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779086935; cv=none; b=uOF8cwvr/pphvmHxrHQK+mGAfo8OT9rkAq0OwbcqEbSHe8NYgJe4T6h0LjlpspzprIvBlptSKr4WGRRidcxaDm4tL/xsDqG4oIgOsIUsBp3/90dAzWzKs1yBzg6N+Pa+3zHtJDfq8tI6/JWqB9G3ezMD1MFDwtOGcTxEbs1SJVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779086935; c=relaxed/simple;
	bh=4T60S1U3VhgCWnu91JxZ7aSQahWK3zfT6KTYqNP8iJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LjXy0U9ZGgaH2XzrKZBzpNBQiH+S3J6jEQWJCHD4EOCPAT/mQT0A77X92HkcaXQ7NEbMuhyTdIah7cXdHR5Hg4dAeTWeSgogty7K+s2kY5nkTB6uAWOgSiGfPG3fLwI04S0eHxpo7iYfBmaKAdaCwyGqAoSE74ZSTEwLhuaXHbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCDDwkVY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+4rZU0V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5dgot902801
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQraxy4pjzHYyOiAxMp382MKADm1bUjA2zV4bITggG4=; b=RCDDwkVYtXDDRsL9
	lqfP7qITwYBvnEDKGP8yew04TIKBn1EldhWRPpV7Y3gWAt28xxNvsJUZWx928YqX
	phBImW2vYQQXaagPjVTlnb/2VRQhR6goT9d6K0cUioLR+a7slzO9I7kAnIAVLZdF
	PoEL/vDiQ6fOa95ZwkejWUGFCM7S5yLzE0Mf4dd6F7xW5g4rz9GBa9u4NNTPDV8Z
	Rzc1sxFS5jS2A2TnTtWTcd1BtPPXcKoEmV+nhuVXQYI88vRDvD4FfPBCbCWVw8x+
	5xjC8kxa3atCzrk8kLU6YR4AB89x6yMq1ITBiT+TlDOov6TCawHwwsXVs2Vmmfbo
	ki36hQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcd01b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:48:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so19113405ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 23:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779086932; x=1779691732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQraxy4pjzHYyOiAxMp382MKADm1bUjA2zV4bITggG4=;
        b=R+4rZU0VB+kyqccFPD1Xl5xmA+ejjKvdCzD+Wbs+qncRNUXNwKAGgUlmhnN/91frfT
         +hkw6esAJYxpg6mCRGng6WzC70INOwxS4x+RbNCcUY9SbqNWGuYc4SWZHgxrKu2yQ3Ua
         +1zY1c9ygXEAODQuCIQD9gAlLMW1pqudHq2XF/EYgKjr/3gfB5SAn+4x/KtRLCWqL7bf
         kinLJotjCR0lfDR55/tJUvEPbgi91jM5CGfTB7pX6s0tAycoV+/gGEA9bq/RPu+KnZnX
         zXidS8RqszKJbBeUTcDw5JXlTUZZjkbZXoLl9aaZF37O1gDLu9T3StEj2uuiEPUFMcIF
         +WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779086932; x=1779691732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQraxy4pjzHYyOiAxMp382MKADm1bUjA2zV4bITggG4=;
        b=AE60wb3kNbilCEQPjhBJ6UU4gZJA88bXm/b1Fpxyr5cqcjdkQeY7AS1R3jMLu+g5R2
         GlcjGdA7ebNGxEExGFTLMdtAbtS+/ph5C9ak3VN2I7yvhj+ysa6+hnDRHRRSw8Dcd43h
         NvV6oVkHOMDSYY1Ogv4/mu7+7GzxGWCduG+ovpvdVrFpyYYVvrdiIogNPfyKVr8MkS+g
         0TR+fnqNgMXMAVfWxYJlctL7e6hanH7kKQioO1gW5Z/uc4Wg/xJDqu4Kf2C3skTtuV0Y
         Fj2mArRxbqwrxYd1KD8X2NT0E1NuWMW3IQGZvVPqPBrvy75pFhF1b4tn43wnlGj3jGL5
         kNvA==
X-Forwarded-Encrypted: i=1; AFNElJ86hIDscb0nVFNuvwehtJcY1aV7vp5tqyTFnCbCGWwb9gwP+SouSIxxwpCOZd19Fg5LLp67FJrV6hmKz2Mg@vger.kernel.org
X-Gm-Message-State: AOJu0YxPBfhwB0CnlLJE+ooJTJMGUUjkZfUg5bRCb5BMC1IGA0+xAOzb
	8z42706RcxWDntTCnSGliwdeOKP5j2GEplDWnl1AaUqIDoBHepklYurgfPv4XcomctI6vA3ymP/
	P6wsvDrNTXAQ1Ywb5x6/OOXDOkVp6oWIxCePwJBROEsR7iwqwE7cluDlSdRQDp85AjnQC
X-Gm-Gg: Acq92OECtCUqtwqQBTdVCWZPPbkXkG5f3/MRT5vxtvWVxg8pcGuRNi9ZGVnIqcbUW4R
	F2V10TrE7fqiLjmqJQ0YLABpSHAfEwSwsclGluVtEmb0ei5UTU9U5tnB8oLYLPXfj9mMxn5bdee
	QAveERCn4BbGaIXhNlVvL/M73T7wXImDwgXc6qAnAXAZCZaN4s4ZnNs+tbIddfyIzdzO+FE0fvm
	DzqnMtMg5KPrdLL3uHiGL40jfLsJUXKj+bf23yW4YwNcLGElzrviu1IhKwjngIr5LDgytiy+1ON
	LegXONdliG7IerDpx/vz51DOXq3l4dr5YVo8QXMdNuTFGOAQT6xsXflOwoacOcorJYxjBHI0jAG
	Fa0yKfetvBevF11xaUZe/fYVsW3Fkxn/E47txToP9PDS1+8h2fBdCGHqL14nIgZgZQoGxpKuXdW
	ndqeKUtBtF4A==
X-Received: by 2002:a17:902:cecf:b0:2bd:6327:b4f5 with SMTP id d9443c01a7336-2bd7e93580dmr152450005ad.40.1779086932321;
        Sun, 17 May 2026 23:48:52 -0700 (PDT)
X-Received: by 2002:a17:902:cecf:b0:2bd:6327:b4f5 with SMTP id d9443c01a7336-2bd7e93580dmr152449625ad.40.1779086931765;
        Sun, 17 May 2026 23:48:51 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05fcb3sm141256015ad.26.2026.05.17.23.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 23:48:51 -0700 (PDT)
Message-ID: <04d95993-2029-4b7b-9746-1e9206ac5c37@oss.qualcomm.com>
Date: Mon, 18 May 2026 14:48:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/7] coresight: ctcu: Enable byte-cntr function for
 TMC ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a0ab655 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=S0-iGdAQsZdNEWGIu3sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2MyBTYWx0ZWRfX7lPMf2yTvIBN
 T62f23Df5Vtx21W7QKV9MJ6WXZwR/1vXgAzgRgdAmPnbU4EZ9Ss58FLHSaSma9M1g5E6YkIwwrR
 ieDb4gVwkLdkKyS4+GtcvjF3su984tutSe1fHe+Ec3lqKljz1Q3iCAYlwTTdt+QwXXlWx1DgB/A
 6gZfBQfkgdXTflaZvYyk6sJRZFdTjRIWBq0lbu/ptp51fbA0Ad2JHcy/mZHHRkuiZ7IaSiZMXbb
 1xmNG7wQaTJfnfoKYibnYL6/7T2aaeEFFeL0RvI5vX4kp0cWvXcT40aOU4D4bEb9K6c4hoK3KWi
 vPbZTrG9CiQAC3b5D0FRYihWm/sBs8CgcDqySjnrAWdwQGhUEQPnprJxhklJl3Igqh2nJJWTkBZ
 /s4v4UVY65jRXc8QPJrwqaF7Y3TFDRxKxDoDQEuGtcdZe0BFMrEUX0/68gFSQb8CoqqWfjXo4gh
 DcCd2t67TdNJvmDZVfA==
X-Proofpoint-GUID: 9ewjmUgDE_faat7Z_SXgjGRsiK_FQNQk
X-Proofpoint-ORIG-GUID: 9ewjmUgDE_faat7Z_SXgjGRsiK_FQNQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180063
X-Rspamd-Queue-Id: 3A8BE566EE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108090-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Action: no action



On 5/7/2026 10:11 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 

Gentle reminder. Thank you for taking the time to review this patch series.

Thanks,
Jie

> Based on this concept, the irq_cnt can be used to determine whether
> the etr_buf is full. The ETR device will be disabled when the active
> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
> be switched to background after synced. A new buffer will be picked from
> the etr_buf_list, then restart the ETR device.
> 
> The byte-cntr reading functions can access data from the synced and
> deactivated buffer, transferring trace data from the etr_buf to userspace
> without stopping the ETR device.
> 
> The byte-cntr read operation has integrated with the file node tmc_etr,
> for example:
> /dev/tmc_etr0
> /dev/tmc_etr1
> 
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
> 
> Shell commands to enable byte-cntr reading for etr0:
> echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> 
> Test Report:
> === Module setup ===
>    CONFIG_CORESIGHT=y (built-in, no action needed)
>    CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y (built-in, no action needed)
>    coresight-ctcu: not loaded, running modprobe...
>    coresight-ctcu: loaded
> CTCU byte-cntr test
>    CTCU   : ctcu0
>    ETR    : tmc_etr0
>    source : etm0
>    chardev: /dev/tmc_etr0
>    module : coresight-ctcu
> 
> === T1: device presence ===
>    PASS: CTCU device found: ctcu0
>    PASS: TMC ETR device found: tmc_etr0
> 
> === T2: irq_enabled sysfs attributes ===
>    PASS: irq_enabled0 attribute exists
>    PASS: irq_enabled0 readable, value=0
>    PASS: irq_enabled1 attribute exists
>    PASS: irq_enabled1 readable, value=0
> 
> === T3: irq_enabled write/read round-trip ===
>    PASS: irq_enabled0: write 1 -> read back 1
>    PASS: irq_enabled0: write 0 -> read back 0
>    PASS: irq_enabled1: write 1 -> read back 1
>    PASS: irq_enabled1: write 0 -> read back 0
> 
> === T4: byte-cntr read with active trace ===
>    [step] cleanup: byte_cntr_disable
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    [step] byte_cntr_enable
>    [step] set irq_enabled0 = 1
>    [step] set buffer_size = 0x2000000
>    [step] enable_sink = 1 (tmc_etr0)
>    [step] enable_source = 1 (etm0)
>    [step] byte_cntr_enable done
>    [step] cat /dev/tmc_etr0 > /tmp/tmc_etr0.bin &
>    [step] sleep 5 (accumulate trace data)
>    [step] byte_cntr_disable
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    PASS: T4: cat exited naturally after source disabled (EOF delivered)
>    PASS: byte-cntr read returned 35333968 bytes -> /tmp/tmc_etr0.bin
>    PASS: no kernel warnings/oops after: byte-cntr read
> 
> === T5: EBUSY on concurrent open while byte-cntr reading ===
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    [step] set irq_enabled0 = 1
>    [step] set buffer_size = 0x2000000
>    [step] enable_sink = 1 (tmc_etr0)
>    [step] enable_source = 1 (etm0)
>    [step] byte_cntr_enable done
>    PASS: T5: second open correctly refused (EBUSY)
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    PASS: no kernel warnings/oops after: concurrent open test
> 
> === T6: rmmod while byte-cntr read is active ===
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    [step] set irq_enabled0 = 1
>    [step] set buffer_size = 0x2000000
>    [step] enable_sink = 1 (tmc_etr0)
>    [step] enable_source = 1 (etm0)
>    [step] byte_cntr_enable done
>    PASS: T6: rmmod returned non-zero (device busy), no panic
>    PASS: no kernel warnings/oops after: rmmod while reading
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
> 
> === T7: insmod after rmmod and re-probe sanity ===
>    [step] module still loaded after T6, retrying rmmod
>    PASS: T7: modprobe coresight-ctcu succeeded
>    PASS: T7: CTCU device reappeared: ctcu0
>    PASS: no kernel warnings/oops after: insmod / re-probe
> 
> ===================================
> ===================================
> 
> Results: PASS=20  FAIL=0  SKIP=0
> ---
> Changes in v18:
> 1. add a NULL check for the in_conns instance in patch 1.
> 2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
>     previous check for the return value is incorrect.
> 3. add more kernel_doc description for tmc_clean_etr_buf_list function
>     in patch 2
> - Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com
> 
> Changes in v17:
> 1. fix race issue during allocat buffer.
> 2. fix user after free issue observed when remove module.
> - Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com
> 
> Changes in v16:
> 1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list" because we are allocating/freeing memory.
> - Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com
> 
> Changes in v15:
> 1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list"
> 2. optimize tmc_clean_etr_buf_list function
> 3. optimize the patch "enable byte-cntr for TMC ETR devices" according
>     to Suzuki's comments
>     - call byte_cntr_sysfs_ops from etr_sysfs_ops
>     - optimize the lock usage in all functions
>     - remove the buf_node parameter in etr_drvdata, move it to
>       byte_cntr_data
>     - move the tmc_reset_sysfs_buf function to tmc-etr.c
>     - add a read flag to struct etr_buf_node to allow updating pos while
>       traversing etr_buf_list during data reads.
> Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com
> 
> Changes in V14:
> 1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
> 2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
>     function and restore etr_sysfs_ops in byte_cntr_unprepare function.
> 3. Remove redundant checks in byte‑cntr functions.
> Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/
> 
> Changes in v13:
> 1. initilize the byte_cntr_data->raw_spin_lock before using.
> 2. replace kzalloc with kzalloc_obj.
> Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/
> 
> Changes in v12:
> 1. Add a new function for retrieving the CTCU's coresight_dev instead of
>     refactor the existing function.
> Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com
> 
> Changes in v11:
> 1. Correct the description in patch1 for the function coresight_get_in_port.
> 2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
> Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com
> 
> Changes in v10:
> 1. fix a free memory issue that is reported by robot for patch 2.
> Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com
> 
> Changes in v9:
> 1. Drop the patch: add a new API to retrieve the helper device
> 2. Add a new patch to refactor the tmc_etr_get_catu_device function,
>     making it generic to support all types of helper devices associated with ETR.
> 3. Optimizing the code for creating irq_threshold sysfs node.
> 4. Remove interrupt-name property and obtain the IRQ based on the
>     in-port number.
> Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com
> 
> Changes in V8:
> 1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
> 2. Combine the patch 3 and patch 4 together.
> 3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
> Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/
> 
> Changes in V7:
> 1. rebased on tag next-20251010
> 2. updated info for sysfs node document
> Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/
> 
> Changes in V6:
> 1. rebased on next-20250905.
> 2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
>     lemans.dtsi.
> 3. fixed some minor issues about comments.
> Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V5:
> 1. Add Mike's reviewed-by tag for patchset 1,2,5.
> 2. Remove the function pointer added to helper_ops according to Mike's
>     comment, it also results the patchset has been removed.
> 3. Optimizing the paired create/clean functions for etr_buf_list.
> 4. Remove the unneeded parameter "reading" from the etr_buf_node.
> Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V4:
> 1. Rename the function to coresight_get_in_port_dest regarding to Mike's
> comment (patch 1/10).
> 2. Add lock to protect the connections regarding to Mike's comment
> (patch 2/10).
> 3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
> 4. Add tmc_read_ops to wrap all read operations for TMC device.
> 5. Add a function in helper_ops to check whether the byte-cntr is
> enabkled.
> 6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
> from the sysfs node.
> Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3 resend:
> 1. rebased on next-20250711.
> Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3:
> 1. The previous solution has been deprecated.
> 2. Add a etr_buf_list to manage allcated etr buffers.
> 3. Add a logic to switch buffer for ETR.
> 4. Add read functions to read trace data from synced etr buffer.
> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>     node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>     suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
> 
> To: Suzuki K Poulose <suzuki.poulose@arm.com>
> To: Mike Leach <mike.leach@arm.com>
> To: James Clark <james.clark@linaro.org>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> ---
> Jie Gan (7):
>        coresight: core: refactor ctcu_get_active_port and make it generic
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
>        coresight: etr: add a new function to retrieve the CTCU device
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        arm64: dts: qcom: lemans: add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  27 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 304 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 146 ++++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 243 +++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
>   12 files changed, 850 insertions(+), 72 deletions(-)
> ---
> base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
> change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f
> 
> Best regards,


