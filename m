Return-Path: <linux-arm-msm+bounces-108204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNHLGlYZC2q9DQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:51:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1B56E052
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20A6730817D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D8C481FAE;
	Mon, 18 May 2026 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz6SJ0q2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1nlDL6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D4D372EEF
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111899; cv=none; b=JNJqe8ThpgmSwMKB10WsBGjQ9Havn9omJAaFCbko7HT6LUuWzTUqtWeTAd59sgpvjqdSDRhQFhWwBKETiELP5krDeMfhtGdRw4Jim6IS/7iA5kwJ5ORV1P4jnj+kTZ1ykxaAJ0BnuKrvBdEjZA6uJogtP/AZhxQsrS+9oQywnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111899; c=relaxed/simple;
	bh=lHvda2NbFgW89aGtBUROhxE/JDE+sRSb8r8BbzUoSLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUKH4TigCAR+r1eQypILnRuagTiXhto5t/Y2fJs5r73ZTa0/XzsBFTD1U3T1Bxrs5GoSwl6i0aJiGtHIPnIoPVGwsT3KTVeFTwTjb9/mXKgeF2f/dUhC9QtN3ZxMJpt+Oc1YxzxR55K2jl3XDI0uMPSzjPKEdk7dsla63rbwdL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz6SJ0q2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1nlDL6N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICkXlQ878058
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyevxfIizzgDB7/P56OEYcISboPpJOah7P6lWmyc20Y=; b=oz6SJ0q2ihCIsKhS
	izEDZsnIZ/68zpI+HyMpKXsv33iN1nCp0OST0FF+9FZGCNB5FfUC5kNt+Ni6xPdg
	ChhH0eMonqSRRpRIidoEZYkb/axB7ewS0aQMzipvLrQuPh0Uq0PzcTL4STZdtMCA
	+l/J5qdEKHydRjm6pxR5n3/qXUmBQyuKogQKMtZH/itAA30B74l2M/b3m2OX21t/
	J9J9t5XFaenSu/E67MCXQjzObmC1IKea7TpmbyxD1cP21mFYjfrl1mtFCcGL8X5B
	nCVJ5PcCMLykSLrx/4Uu/QmE/HLV//OZJ9kUnBtMUHo/zFlItzUHYRgE1v7wQYFv
	6eUxqg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcnjmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:44:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50de6db1eabso8170811cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779111893; x=1779716693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyevxfIizzgDB7/P56OEYcISboPpJOah7P6lWmyc20Y=;
        b=D1nlDL6NM3Dj2yLgQJhqAGTwi4+zKVYe+DgFnofdA05NYWLzvmRNbu8wU5zXlS0PrF
         LA+LqBDF3wsJ6l6KQLdk3Vn3FJuXpNidB/CR3ezifYBWMXZfeOOq+tTIXctzApUpR62E
         /Qip10N3maiPwrUTKY89Kw0cdx1PeetZ+x15mvAwLVe+6ABf/46n8TrP+WizeoeBb3vP
         HcLwx/KCvu+J/gCp/QiXKjVD7enqwGYarInZZlhBOSTh1Hf1TILP0MT/dsfdoOV1+cyS
         J0071sZcf13k3xRhacCz9NQMxqyHk2Ty/HT1QAIZCMbT0mV5I9KMnfcgAma+npYpa4JG
         i2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111893; x=1779716693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyevxfIizzgDB7/P56OEYcISboPpJOah7P6lWmyc20Y=;
        b=hiopcc55galXJanZr9vp/qufKDLBPTblanAKomdvEgfTJGGnElPmuPFIUNfR9KFdTS
         ra2Nuku1B5FMyk8/d0PEA0mr5PjbjuYLaG6DGjeTrkeWScOpcT0XgWgVUWKRcQXvtKo1
         Lvli7REQQF3uhpN4nWFfdoTX06ZJwVLpNrXm9Bru0KRdx5ggyRkdzXOBH/YXJyHniL/q
         +/7deVmeQY+YNE6dnTfuKjP9lGR3qClXXB3Q/9xd90Z5JiIsh0W9dArxEj3iSGNwfhGV
         0186R9VtEkqDXbH/CsirJEhi/1qAfft2HsV+E5LteSu6ZLOVKjjPQ8AX/Wf0zUWPOYqf
         d0wA==
X-Forwarded-Encrypted: i=1; AFNElJ8FJeJm4KAM2kJEA8F2L4wk0/Zl42RNK1/ZAgERlsQLpMYEUqrjuqXgFC8kP8vi8izRrdrx8Vm+quwTyfHr@vger.kernel.org
X-Gm-Message-State: AOJu0YwLAzK1zh9vNIURNPMwAmnwt4PRusedAC9xp9QJuyG6IwV0ZaQM
	ZGFNRzon7imd3GlOHBB+m3HqTohGlZgw2gORANgQhl0nUZrDaNQzMVaRJpUTY88Ge7MAdtAmDaC
	yG7eSFID9DVYpUDumz6Ld5QHdVgEk29NV43CfGpGjLGBmLzlPrqBITx8SyQbVUOmTcF3i
X-Gm-Gg: Acq92OFL2BQIQiri7uRvwDtOayycjmWAyL1ejnEG+yXkHI+eSwAxKpWwgVQhqK1WJxC
	Uaz7sTb7sQKXl03ZUUa8mm+cTOdhbDOz4K+s+LeaVyCqGbWr7AvKbXBfEueTnPlax4yumVquxxi
	P6PXDsSzuZQi88OyWzNigTj1EZt5ZHyRY0OAq+3z+d0pE2PKaXIJPMQzNRXA9Vcl7bplfVBL0oq
	PlF8ra/PDt1wxSouNM1qG0fMg7nbZhS4oIjdsvpY+hO5d0S0/7tBd/ajrQ8FVd+v8wjwn+Sp1J8
	E9BvL+etqa1C5e5KR5vZdsDGihukV3pqYSb9MY5e08dz+DdRsRC43/az1Gfqd+xZ8JqyTbLSVdX
	ntLqX/13JrpcJPU0+VQaDuJqq6wCCJh5dHBzd7j8rdYH1azK7ca6wobSfwI/ytX4HRAS2LylIM/
	x1Ppg=
X-Received: by 2002:a05:622a:11ce:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-5165a202f87mr153359631cf.6.1779111893429;
        Mon, 18 May 2026 06:44:53 -0700 (PDT)
X-Received: by 2002:a05:622a:11ce:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-5165a202f87mr153359221cf.6.1779111892776;
        Mon, 18 May 2026 06:44:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm5248215a12.8.2026.05.18.06.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:44:52 -0700 (PDT)
Message-ID: <4056582b-a6d5-4fdf-8cce-5e2d20b00a08@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:44:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: qcom-geni: Add trace events for Qualcomm GENI
 SPI driver
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com>
 <20260512-add-tracepoints-for-qcom-geni-spi-v2-2-3b184068ecf9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-add-tracepoints-for-qcom-geni-spi-v2-2-3b184068ecf9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oFrJcCDUkpyeSz14LRoP5aSz2KnIfXiT
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0b17d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-Sl1Rx_dgo55JVPCJUEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: oFrJcCDUkpyeSz14LRoP5aSz2KnIfXiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNCBTYWx0ZWRfX7j4cHEktZVBB
 Lwt/OpSUrXgLC5lHtcyc7jQ9Omm9mggzsUd7J4Fctpk4buEU8u1TM/lAebqN3QvTO4EGQ/ukGZz
 Cj2XAOXB4k3LYkRX5wHD+g9hyM8C5P3TGZ5kdsPlROZE3HRAjcGSqhYiWtqWWMwi3I0jft86ylX
 A4TVdLJJ9gakgMV6ypSceCnacgqnBxjKJCOVCMTRYSuG2IKf1xQL7w9KcqpA6cLQONavX8bSidQ
 jSbQPmDOZyfo/6oyiZ6t52X+CeypjWjCmaglchddVGpszhUvL0A/dJr15jHKFQVPly9Nwxivi9H
 BRBkoJnmP2elvWFcDgcUT213VrnC/g4aQleQjjp4FbXJT6EznMWblsz8x0w0zzsAx4lkJyC38Bi
 SahWTFXOnjzbOzKP9sk0ntiIWk7yFMplwYsjFAL5YG8qEP+XQrdHu/mYLPxM7c67KSHnkM65Hg1
 cQugJ54/Krpu+3Dolqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108204-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDE1B56E052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/12/26 8:12 AM, Praveen Talari wrote:
> Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
> These trace events enable runtime debugging and performance analysis
> of SPI operations.
> 
> The trace events capture SPI clock configuration, FIFO parameters,
> transfer details, interrupt status.
> 
> Usage examples:
> 
> Enable all SPI traces:
>   echo 1 > /sys/kernel/tracing/events/spi/enable
>   echo 1 > /sys/kernel/debug/tracing/events/qcom_geni_spi/enable
>   cat /sys/kernel/debug/tracing/trace_pipe
> 
> Example trace output:
> 
> 1003.956560: spi_message_submit: spi16.0 000000001b20b93c
> 1003.956642: spi_controller_busy: spi16
> 1003.956643: spi_message_start: spi16.0 000000001b20b93c
> 1003.956646: geni_spi_fifo_params: 888000.spi: cs=0 mode=0x00000020
>      mode_changed=0x00000007 cs_changed=0
> 1003.956647: spi_set_cs: spi16.0 activate
> 1003.956648: spi_transfer_start: spi16.0 00000000ea1cf8b6 len=16
>      tx=[4c-80-e4-ca-68-4d-95-aa-ee-99-ae-d7-69-e9-5f-39]
> rx=[00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00]
> 1003.956653: geni_spi_clk_cfg: 888000.spi: req_hz=20000000
>      sclk_hz=100000000 clk_idx=5 clk_div=5 bpw=8
> 1003.956691: geni_spi_transfer: 888000.spi: len=16 m_cmd=0x00000003
> 1003.956708: geni_spi_irq: 888000.spi: m_irq=0x08000081
>      dma_tx=0x00000000 dma_rx=0x00000000
> 1003.956717: spi_transfer_stop: spi16.0 00000000ea1cf8b6 len=16
>      tx=[4c-80-e4-ca-68-4d-95-aa-ee-99-ae-d7-69-e9-5f-39]
> rx=[4c-80-e4-ca-68-4d-95-aa-ee-99-ae-d7-69-e9-5f-39]
> 1003.956717: spi_set_cs: spi16.0 deactivate
> 1003.956718: spi_message_done: spi16.0 000000001b20b93c len=16/16

Same feedback regarding this part of the commit message as on the
UART patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

