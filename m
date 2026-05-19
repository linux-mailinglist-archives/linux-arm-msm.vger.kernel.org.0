Return-Path: <linux-arm-msm+bounces-108466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA7RC35FDGrQcQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:11:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC4F57D438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C29A33053C9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48DA370AFA;
	Tue, 19 May 2026 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVpymYBU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hejNOd1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F025C3BCD0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188189; cv=none; b=RJgwp5YVXKjS6/lOjGnvhyMf4efF/gJUpbNz2MoiRZFBfIFnnCPQ+BCR5IurI3vlURDohX7pciHJMrYmC/ZKgOHRmwN36mYjaHKZ4NkoCCNB3C63C0GNlZGJPidgyRrZ6LGhY4hokuOJEztCUb16iLXNAhTt2OdVRVOVyvdvrGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188189; c=relaxed/simple;
	bh=jS0E4ds8/7NpK9Bp+8ECil2/7vTa8+eivZTcr4pPqBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vm2mAK2/mV50D2FVRaOWC/DVBxPk838FCYMWzerNiOzUjEJ9ax/bn9coRDj41D16c8lSghYwrQCUzcVMHh9nMxUL82vdjo28IAJzJe4Vb73leayisaaHBXL4hLylhBNsIsmyVx/J+e0tSW1REEFP+R3sJgIObIN85mQZvduAbqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVpymYBU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hejNOd1J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAcSjm4130965
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0Mm4DIy9+BUfoULHMzs81gTO4xbA3GMf+rXZ6LbHG0=; b=iVpymYBUSKPrxHBZ
	+zA3Sd1/rRCX4x5dXHvTVXNR9hZnOyWCc9+e1WKGYWe4CvnjPyYlME6v6z92WOEV
	mqXgTjMxwNsVZ3nXXk0cDxRX+ElBrnEjtgfWJkEH00xnGCe1tURqLu0ksneC42Xh
	OaVP7l65yeEoC56KW916tXhdExoh0N2xmotmaPV0IqVF230gWbxsU26frJQ4jR7D
	U2n10qJN9oO2kOBd/Gib//2ojCVosaD9pqACEEHwtMk8PhA4I74D3W8Tqi0nxYK6
	xDD+ldcUEIo+PT/3CxOXEyIdeptL0VPYDt+gRiAZh3T8h9H/AU88nR3sITmDiequ
	HgNDTw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1hbtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:56:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso2868068a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779188183; x=1779792983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0Mm4DIy9+BUfoULHMzs81gTO4xbA3GMf+rXZ6LbHG0=;
        b=hejNOd1JSmsIkfRPXFPc2ND4ZZCQE7GzrcZ3LsIc2hOTgDTrmA0/WkaVAy27KHr0OQ
         k73WFW7PIXPn/3MiznanX1zlouCxDWTAAKyACWGWMhvMckTh9h3nm+izPyqJ82P5k++m
         z8OYY2mVoc0Qu3jnZh3HqgHJTHuvAg4Z66FFvjM2v0Yiuo0+BBGwv0C9Wuu0pb539SVU
         MqrOOG/5nqK0KBkTw9mqD/zDyPJCgr8o3mTA4JIt4t90tZedr18eZe0ydhOpqPK8/kXU
         iYITvjq4zcp+ojInRMdcBIJLdkAQJ9z4+tKC5LOTsxNNhKQIA8h77ZGh/Sz+PB2/CRxs
         LiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188183; x=1779792983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0Mm4DIy9+BUfoULHMzs81gTO4xbA3GMf+rXZ6LbHG0=;
        b=VuyTYxHuIi09PgItZUKZbRUbO2D3SajZOcYSa5hzOv4G1jqzTRjDJhPtwhpjx2oC9T
         KwWWkcEHGm007ZhkaMVGJVEdMiwuG/6XsbS+lj8ogTLlRw1InXnInzWnRtKlQ/7mBErD
         6NBHZXnAegv0X2w43NN9VMaGjtxtND+5IzTMSwk3zlnt7b8coBWWaHm/yWMca2QjgFry
         tGIav/Zu0fTLzpgkJLU3G+QJ/KFjLaFHtLqhpx84w+VouziCm4xSESiZKDibwlGKARlW
         gdKvjRH6STExa0s/ZBwrlG0DueAc3mnsxbHTjpTadi6Qf8GOF8mCOa5DLNt2Y8endKZM
         lF9A==
X-Forwarded-Encrypted: i=1; AFNElJ+e5LmhhmHNR9E1MbCxBZSHHJ5gxKcEKKfKJRjGswutv8tX2VUnhruRwSWdPFsRaZefg+UKOBZqg4hNsBnu@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHPswWz3FP4da27eTNw+jZPplvBGOJXzk2G1N4Km2w2l32KBv
	GpjxGYqJQ6yLl2kqY/opKt05Qyj7RPLY6taT8Nvezg8cdHrAJvVtH89IRqr6C+wwIx5EVztSTWY
	WNP09ic/95zP2EcnKRN4qupVqkslURv7kp1qUYIM3XBVVXcjXBC12s8Btjju7rrbodfoc
X-Gm-Gg: Acq92OHmng5CmAeURxo/xg9iBFlZKtA8QiKLBhmLhgnS6sE1tZz58bWU5YKzpgR9cQW
	zPm3ghFN7e2hWzd3dcLELQMX8Z5n25sarvdie+gPfRtLRj1iKhvDgThUrP44jC0T5Ccsxn3z78R
	+wzutXxr04P5uX8MkDOfVlsT9um/B7XQFEkIzZBfsENjEeWGxnCs1EOB8+6eGbPhzg21ceDodNy
	vDmyHNOTbky6y/uIKO2PmMFI5x+85yo0MMv8WjSkvPU/FIO3qEnxRVArETlb2kEshg2XXPAr74d
	5GFH35bmRUx3lTgn040HbkH6jeMAFi/tyHK9ZfWwJwPLp7/g3IEUKnJ94dyQUk1h9oRsSaTZuZW
	LHQdaCGXlo6Ganyj6hlhHcU0PWJq2qWA8hoAxjCCUm2RY29uzt/0NVNCL
X-Received: by 2002:a17:90b:1c11:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36951895b57mr16978039a91.3.1779188183249;
        Tue, 19 May 2026 03:56:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1c11:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36951895b57mr16978019a91.3.1779188182751;
        Tue, 19 May 2026 03:56:22 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695124601asm13853485a91.2.2026.05.19.03.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:56:22 -0700 (PDT)
Message-ID: <5e8591b1-d1b2-4b58-b667-cc2d4c0a4b8b@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:26:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260518-add-tracepoints-for-qcom-geni-spi-v3-0-7928f6810a79@oss.qualcomm.com>
 <20260518-add-tracepoints-for-qcom-geni-spi-v3-1-7928f6810a79@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260518-add-tracepoints-for-qcom-geni-spi-v3-1-7928f6810a79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c41d7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kAtbQewIYUbMTxBMGYQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: K8Ds7elBDq7RzLxa7rPUjwqd0HliAESG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNyBTYWx0ZWRfXzayf/P3ZjeJS
 NUoMUNMzUCr/nNEWHt9MSx8q7n8sz7CSyN++VMutm9GcqNTZzBOYRigqt3jGhI0jj36SuyM4T7G
 5mm5lkPGAnpWaFx6pBWJUlUVY5pCdICkrYmlWz4JQaE1epT80KLIK5wOlj7F1xxxhcaUjk0tzNJ
 ok+pn4e/eX1UdRSPuViILV0EOiXbFvmViLQ72mOL2hhK6fQSvd2z3R/YRplwyoast4P7doPI8+P
 ZNoEGJxUQVgqEYFylJr+AwJmHidiUaz8/GVA2WkNlQ/jsuNmqUYnkYce8o4Z4xudlZVfLee1z3w
 AU26hiaOulciF+1D6Souy7UGP79nV7ckmtAQON1rJ4jsjkxcJX0dt0GhDgggmwBzqXphMCPb6Dh
 0FtF5nsLUZxoy7WS47wUICDXaGaZrK4ZMQhMOgxkikVUguDmH0rMMslXnFBgAtMIXmmtZa3ml7A
 OTUsi0LwlXIGFRM/clQ==
X-Proofpoint-ORIG-GUID: K8Ds7elBDq7RzLxa7rPUjwqd0HliAESG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108466-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CC4F57D438
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/2026 10:30 PM, Praveen Talari wrote:
> Add tracepoint support to the Qualcomm GENI SPI driver to provide
> runtime visibility into driver behavior without requiring invasive debug
> patches.
> 
> The trace events cover clock and setup parameter configuration,
> transfer metadata, interrupt status to be making it easier to diagnose
> communication issues in the field..
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v2->v3:
> - Renamed geni_spi_fifo_params to geni_spi_setup_params trace event.
> - Updated commit text.
> 
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

