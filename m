Return-Path: <linux-arm-msm+bounces-118756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 44MOMKnXVGrLfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:18:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0356274ADA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:18:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gbmv5xIB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KZEEbSLU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118756-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118756-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC67C32323DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0617F3F4DC7;
	Mon, 13 Jul 2026 12:12:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF393EA962
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:12:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944764; cv=none; b=WcQZlgK5wRBYNQC0hYk8BNqYjYME/FHtNfZX03v+OfsnClaC/FQeqEwPE37yn0EQ4OoP8o0ObyCxGeW/Tr4Fk7u7mkw6EK91dj9IhZuvHjvjVYxA1Bglx24CuyxVORMp4EJf5HRe6w2EqCj5d6Aonayj5t/hL/vrp9wCo3b/Sgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944764; c=relaxed/simple;
	bh=ybDLYdUPMbEn1xsPz/d92AYDTgsy7VuvGcjIKAzxt9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLH0UCmZJo1JMUs+eeSWUJBxPHjJCN1rhMolVt1mPf2M+EbISjvbtNf7PSTvA7z4t2pz9FpLDv8xryuILrT0rCVssz2UtbMzBBaI0xSI0Y9MvJlJ/MFj38FcZMdKfDKNyPaRxOqscFBC6VV1VSf/QUsZMf82qI839nws88MunrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbmv5xIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZEEbSLU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9M67q1090629
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVltYfMT8TEkshamGLWBM3q5K1GZcVnd0fJhRwy1ipM=; b=gbmv5xIBX/Njq++R
	iRXPlMlOYA7d3/Pai3cLOziDd+nsEvK2+SmfltOqiDPRcAEd0OrrWfD0qPBom4Hq
	kzKQ56zWAZ6Big6THOp6+jYpH3BjyyT7peT53at8rLIKeowOqONFoC+asZhGWp9m
	x5rfSAxsUorpjbW2T6L5hKaSvd0O3ItBtsDEHiOXh9F4EyptTn2uNvSCYkrtqzr2
	vofZohLU8DbcqPnWhgZBC8Yn8n0o2GUgHcP4AM5otxNFgNhpMqrdZvq91tIcAuTz
	uJq1V+7p88qbWxqA3CUovuUqDR+QssWjeJ3GKFDIHulfOkZHZb3C/KBLEDOkwuPv
	wW9S2Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrknx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:12:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e04a53a7aso810574a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944761; x=1784549561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVltYfMT8TEkshamGLWBM3q5K1GZcVnd0fJhRwy1ipM=;
        b=KZEEbSLUCL7GeXLFUmIxySnlqHg3jbVjUsSDEgxd+0PuFOMmv3uL4Zh2b9UWFbqTZQ
         U3sVfSTsQXWFzMaddH9BB9tzDAsJm8P/2ZueqB+D65IsbJBibGYZMau7Wq/6cLyMQ4sv
         P4ieC7qRw9MoA3RHSVkxbD0cwh9e2dLbxebpH/7OtCl/8znYS2BunFQ9ROol8Y5SmIeo
         RuayoT9PjgbET3cU8sIlnahyitBKgBBpO+PUMDA5vx9ud4tKoaq1IprSJMN4ubnQHt8m
         RRuoypRnv3cuE8XYd2XrAQck5XcluWNoTc/Hf6q9zsejEk28IVGw/2b1JODMtRYYC+to
         j6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944761; x=1784549561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVltYfMT8TEkshamGLWBM3q5K1GZcVnd0fJhRwy1ipM=;
        b=bkneeQRYg3T+TRhjH3ykhjuzBEo3gp8MAwjIgZtqRVYDSZ1H6FGmJ3jp2hvhu8TF3E
         8ZOU15YQ3is3UtmqA3OE4CqsxL6e0GtIPURFmcpXwloxTwnTQO4/lsZmDEx4srGbdNoi
         rOZR8JdH889uMSMIPB3qqpg0Y31BBT5+o5MCJu+AFBoXtmTdLQ3xUX3FwB9AKSFVMRPY
         wj5KuoWLZYwMvmfDe6R/V/cza3RWM5u27yJ7DWSX5vHaWypqAHkPCG2z67CD8UkOnIH8
         WQveqKm6mfW0qL1V7MVcpXfYZ7JHmrjTR3xDX9ANYhvp0+KQCnwP1s3pQX204yog6vbn
         YFyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKYM9cJs2xzS5/JEu+aDEsSGRSbaRSiUKO565PMiRAjv2JcV0YkHXR8Fi5KdAyOitZQGcNcYp/kS/+tdEl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6glXoqoC1GdQb0R7yY4T1I3YDjs3g+ucU94TD2M0NseJDf2D1
	Un1bI4wzwP/yfm4uTpxCfAOmiaqDQi91lZkKlbWGOuZNLG1qJReYldjsHU8MLFT2NAk2XZjPLFW
	hTswsXU5osiX9r8gUipbMiqdLAEfdTXBabgtkNM+BnkH7bhtRbvfC8SSrtPGA+LWXNfll
X-Gm-Gg: AfdE7cnk/2FT1NI8MKptDoTuqjf/HICybvS6TxIMD1xUSM/J1mM08fBeaPKntO57jO6
	GCK6TucvX4AQacIjF2OlHb2PY29oYQcvBVegxp1qZm297UN3O1ENZORGo1aCsXZZX0KKLx+T6CP
	900RmdXFg7tRTi/BITbevQMMXCSC+sKHUzlDEskeekBPRE11VK+0fSyAsLkAt8B9zt10aaI5F0l
	tleu4UEI1Vy2HR+ZgCu/MWgbQk2pIe8uYrDOcDk8p+AeFHuvSptEX4ZExL3BkvuT+XNQ7HC6EHa
	FXtPetxU4A0MqfMqhxC9bfMeebia4VNiDcPWODVPNInB+E3no0YW5AgMFsIhTftkNVkCD7NA5UD
	b6cGUUflgU5nCNjD3RndBwbfJgHY0sloVoKcjEg==
X-Received: by 2002:a17:90a:d408:b0:387:e0bb:57fc with SMTP id 98e67ed59e1d1-38dc7b9e71bmr7911250a91.35.1783944761514;
        Mon, 13 Jul 2026 05:12:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d408:b0:387:e0bb:57fc with SMTP id 98e67ed59e1d1-38dc7b9e71bmr7911225a91.35.1783944761083;
        Mon, 13 Jul 2026 05:12:41 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm53089321eec.22.2026.07.13.05.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:12:40 -0700 (PDT)
Message-ID: <0e1a286e-3429-4bcd-9dbd-4aecae52171a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:42:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <47e3cd69-9800-462e-94c0-f2987066cf68@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <47e3cd69-9800-462e-94c0-f2987066cf68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P_G8AhUEWugIEon5DtahxOeW7QZtcXFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX2cqIWzDbTvHz
 tJhnC7I5TCIvNPYsXI3sUMN4Nf8Br5FnfavhfeGBXfuVGsXLP6xKC1JhTTqGbjT0tml8staRIKD
 l7fDGZaVWw1kd9KAZqBQ87b4pRCBQCdBpV+iX98aniNm+rZpjJZTZ7CsQ63SSpRyMs0j+b1I8rk
 RIaKvkE4wPGBnPTewekBzlZIUHqIQltDws/6Z7DQ+jO4F8VoLAPt7UbqwAyCSjSS3vFEgyjRFlr
 2xD99z7VSsLLedlxXyP5aJz3ZbHZ1Jw66SU8zCp094vXetyVecSqVnrez0IneTAKj+zlrURYilY
 am2IiF5DcADF6YGqxE48AaLHZc2ty3fozmfjVncGVaGWkvYmWeqVGWnK64oSTNy49yooa9fiP72
 3u6K0TuYrosbUU7Ca1AQUW4oEMVBOOfV03m/haKthawbNwXcHXkIbEZrCxXKbHGIirO1pv4eZel
 meUZUn5O6g/3qJ6C2dg==
X-Proofpoint-ORIG-GUID: P_G8AhUEWugIEon5DtahxOeW7QZtcXFQ
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54d63a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=e2pIEHJfEIpJw0LIUh0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX4vbLevlRB9Q+
 Ibi1n5EZtxL1bb29200Q+nuRBCmz9f1nW9FFQoAGJwAuSJPHi1Qt76bg3jM18Pwb0tHjVbqBkBQ
 FT0h71pCCFntmGt5pw4ReSMlfHoMGLk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118756-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0356274ADA5



On 09-07-2026 05:31 pm, Konrad Dybcio wrote:
> On 7/8/26 8:25 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>> differs across Shikra variants based on Audio subsystem enablement as
>> follows:
>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>> are required to be supported on HLOS.
>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>> handled on Modem, so from HLOS only resets are needed.
>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> +		audiocorecc: clock-controller@a0a0000 {
>> +			compatible = "qcom,shikra-audiocorecc";
>> +			reg = <0x0 0x0a0a0000 0x0 0x10000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&sleep_clk>,
>> +				 <0>;
>> +			#clock-cells = <1>;
>> +			status = "disabled";
> 
> /* Owned by [name of the DSP] firmware */
> status = "reserved";
> 

Sure, will update as below.

status = "reserved"; /* Owned by Modem firmware */

Thanks,
Imran

