Return-Path: <linux-arm-msm+bounces-88548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AABD12385
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7077D30E56A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F3A3559C3;
	Mon, 12 Jan 2026 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSKVZQG5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTdb3/Km"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9F321422
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216428; cv=none; b=ZpwXxb5ZPLbXD9g99uiDbY8dB25rE3vWNTea9Anlg9xGDZ3E6lJhktiXrYSnEv7GeDvkHSi/vrOx2z6wcdCz6qptNoEFZ1i6778ayzFq3JiqQpXxpzZ5v8kizRMFH+18oImjKUqt3etiD6NNsECkGgjPMM+wcOubSL/7//MEwJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216428; c=relaxed/simple;
	bh=VrdWiTItojoB0UvUnL3By2wiL0NBycrQaHONOvrlhe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQXd6kJ4r58ejzwREkeTo6PwtT3lcqR0n3Dop/Yt0hvu73IGJr1YuOQ9ugl6f02X3kJwhTc3wUCxDHqB+dWkYIEuN2EwvnmyKcFzYVUTo+nbRic9rMS5ExwC2rzOVUKZGjQNg3OlLBbwIPKJid8j2tB6wxM9PrZx4HCBFgo+m6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSKVZQG5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTdb3/Km; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEeZD1315903
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+NryKDtEvMjKNk6KisA7xnioR/cRPqT/YOulD8K8rU=; b=HSKVZQG53puEqoEn
	JGqvRPwOWa1aJz5W2frHNE3vBEX+Yqnh8bqaZB0zIEifZiw5qJjADNab4//HSOaA
	OpSVVzo7humGi2WNBXJ8nVQExI2aIT7SYnp0p702BgGfMJvEh2bgiy2DOYujRTFu
	uEiKBvZAsGN3nMQgXXo7CdC+XQGXTVzVnVR+fK4MWoGmQAEmdA9BY526Pu8oY2do
	YWjdu2JDfirmxXO8ti2UA07JRaWPUz4myQ2aG2iJzulO0/AR0KnJ09PWGLssG84w
	odlw1JImhavhwnHSaQfuywamT4ZsGOEVhYnjEhMviNYVt0dm13s8api2Iyqi9JRp
	gE7UXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg50w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:13:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ffc6560f05so13008771cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216426; x=1768821226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+NryKDtEvMjKNk6KisA7xnioR/cRPqT/YOulD8K8rU=;
        b=gTdb3/Kmo+Whvm/FXehAB9TmGGOHquYE73vaF7X4zumdzhTK3AKMINvS7aBBd0v2MW
         M0GynYFjp3UhIaoNTnxkHwJdaxOk+9tKHkcmsM8bQBNYZEbFJIvkwMVQCuWnb+qlEZfy
         au8C2JWXTMcBPK1a3xagvrKryJNxUvYyl2+/EzXThSXmf+GX62+A4wneTw7PMz9qbCKr
         TsipM4QRpXNhmOAkjkEKyIgxg1Vtq5gapuJLY5GC6+kZlw8pM6Fo5WXJ0vgTpGQc219/
         hvVeBdAvs/PNMBm+FYrWbVB3PZRL8+GN8V5h7lvTWA9FS4iPce9NxMkz175beAbZVoPB
         UxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216426; x=1768821226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+NryKDtEvMjKNk6KisA7xnioR/cRPqT/YOulD8K8rU=;
        b=dmUGvXBh0+MSsIdU+P6Y9Rz6qbJ+6hLnyrCdFrXJEqUBQAGFuQ1xGmMST3r60OrmTD
         WG/q9a7KH9BtIa7jLaLi3WwkDPfxWtrzibzZBxhtGyPqMn+XCz4WnoSiDERjWlxlbr6q
         VH/INQbct0W+zn04KhWAJwBy6URcf/OrWLMwJHW4sIqoE2XYLtYfRExojMep0/Ym6B3C
         uyHnTLoWMGk/HjkclIAZ597bllq1GPM/rrCO2L0WOp50Oz9JbNfPgcEcOHnD0rsBcmpy
         QJ9ViMzaNnCdgDJGzxFndih2aVrFIaRp+YaacMl0Pg5lIWziEZJ49x/6kS+imRDjUwMH
         g+/w==
X-Gm-Message-State: AOJu0Ywxms4/GS+dfupJfRQQNSLNBk9unNTnKlioKfnwhB0bU/SgdoD8
	YdPqOz9NjvHvmiL2RYQpRHGfwoncvBNJ91y8Dp2jjDfonqStrloY0/ZswGkRaetN0Xj9CHTktqa
	XlvCXBEiUJw2UNvsZgpPV36jH5G2el8E0BrLe6h+2kQPRYgsJx/AY8CR/Vqs4uH3MGHSS
X-Gm-Gg: AY/fxX5ahutDPcqt8ObJZfZvsA+Znh+hXyjPE23FooIRQUHupLlSkWnkJgm9l9zQk04
	BJeePdFmxtv3ZVgu4aKFjJFYNYZ47g7fDmeYYmajbjgvBmNaYHpERbK2tl+ma7DcfQQm0bzLIey
	GL8ftVcH+Ix69pBxMGGxXht1nHdevY8NpQzGhReEO67NyF6Zk8uazoqsWj1KVhUAzoXNKBUM3/d
	ub3tCqmbw9O8nbBI/ijyYkYzjeUBBKQZFm5wIme4pxj9LLq/a5zcnRlXb4HWE6Pd28HhPuhTbdz
	KRuga0s64lzb6gFbYFiql96OHKSUoAYfz0oocBWMpQGlcjNV15hT8h92L3zJltWWtX3vU0SVU3Q
	KB6nR4YaJ39uU2l57s9ZzjpEOHSKuH9gCxpK70I/xxADqbPrxlmWe7DsMQTBv9W6bOKQ=
X-Received: by 2002:a05:622a:4cd:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ffb490511fmr185948551cf.4.1768216425952;
        Mon, 12 Jan 2026 03:13:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEElM4ll08lOpzkHDuKu7CKsTHNXZ5gxeHC2/ZX1VO0z69vlMOAjoFpYdj8WO/qIPyj/UCVig==
X-Received: by 2002:a05:622a:4cd:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ffb490511fmr185948381cf.4.1768216425579;
        Mon, 12 Jan 2026 03:13:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be658b3sm17106912a12.18.2026.01.12.03.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:13:45 -0800 (PST)
Message-ID: <7c7a5332-8af0-424e-a26d-d87c524e30f9@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:13:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX
 clock source
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7RgDyRFfHdw1HRV1wiwIRJc9bM1FZg-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OSBTYWx0ZWRfX5XxMI8JRxb9h
 NSKdZBPr6UDRyjomxsMZiM+k4u9KJx2LOQ3HWmgr11ZHW5sqcY4akL2tbeXqEFAVonLK2ViJA7O
 WGaiDv34lWurfC9C8xmEoHZWml1IVKfX065AogMDNyg1hNOihPdUNzdc4s6mUr5CX7PE9wcSj5n
 xTgBqhg49IGlWxcFhkhllCS1s/E6cfGLqrKdvEacDPHFbgl2m7KrYmMwDnJQXQezhEJ6llFUBVR
 niAgDt3gN7GC/vB5G8mEkRTXTosXkUpdr3ZD3GH8bPxZ6SGhIIz5KinNxzFPsQAio3G2+rnrb13
 LCH1CI/T9GhVf7g22safuDxAT5K5K85p4w+ongmx3fWTbGlkFQKsyGcZyATjF5X+NnMhlKO6lkg
 +i46H9T7XloU7luQOA+igf80vBE32qKN0wDi6uFsLTpRI8qCaQSi3glP2E1JBdAHgAUmz7HrpM1
 tA34qfW7sjrYAI5kNCg==
X-Proofpoint-ORIG-GUID: 7RgDyRFfHdw1HRV1wiwIRJc9bM1FZg-G
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d76a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UIqvOZ8aP2BlQGmZcB0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120089

On 1/12/26 3:12 AM, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use standard RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


