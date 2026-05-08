Return-Path: <linux-arm-msm+bounces-106622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFmYI6W0/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:02:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A9D4F4AD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A1D4306B341
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE8B37AA64;
	Fri,  8 May 2026 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHbJ7G6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX/yjCmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B637AA8B
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234212; cv=none; b=uyj+s3y2mUGwjtVJHG0bqYEMqPOhtUAIdsRoAdOXOhZWh0UBlCvdiogHG3gz4vnZzZLho9ZBlX+mXzabWwu4s7Vxn5/VWZZ3OmzCbnOnt66AWKWZ8COkKVUUUWs54gHKmNpOp7NO3n8GWXBgLzVjswdpaHJMo1Y1hZ6iDkdEu+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234212; c=relaxed/simple;
	bh=jV0KZXzdYT/FvZQlJNY7glDuMFn6g7DtU07NH4UUTds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR0pZiZCHlpWvxcG/jmFbICSZfqYH2if4coX+tBeOEL+drRz67/00yNLjF0Y8NGemGgbefwrAThgXuXoK7ggQz2lkTqceoxz+xlXb3ya6UAGGcoFHvme1v1LTIbT2nj30MTYnmpIr31Hu4M3pr9035kTbFjskecPKLEvrhK4Ovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHbJ7G6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX/yjCmE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485t9Pr2778601
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LthUShBIHS42cUrm3J5+M2OZFyxtHDBOPDKRpNCvYB0=; b=RHbJ7G6rl1o2sNff
	cu9ZNq4MZfvcB3LoyZXB0D8K8pfGvyixUcS7uzrrbEeAmXLYoGCKs5Y4PhXLbHhC
	GSjk+At+m/TkLm09wQe+ObsN3fe5jywrbvvB+GWq3MRWn7pmqxOYjZhH+mh443j0
	MPws4dDV+vNhfAeilMy/opjCulysby9ysCfISt97MxzIONVMGym7QMLOWKxsLm6y
	PXXjcBrM9Zq5+DOqCbG412cltmNnkFsfXqb6xCr8YN5UDKNqPdPFJ0Jl87NK31/2
	LtQV8ETZ2vCjwMnDpOv5WhUndk6aIQQwnswslTQH+geSIa10FmaH+/hafHXk4NAr
	v2/5FQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285jg5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:56:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e576143baso4291021cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234210; x=1778839010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LthUShBIHS42cUrm3J5+M2OZFyxtHDBOPDKRpNCvYB0=;
        b=jX/yjCmEQN5VALWc3B0CkRhEVPkn9yRle+V2ufRLZWLabwQJHHZQljDuPOr7+CFO9+
         c1yEhi0PRI7hyHqCsmKmS+kHfBfJjfEQKTqSH3G2vtWVs0+AaLQ8BgFxnqe4/AlOmR/2
         PZphbXtKpTAdZNIY+Kk19o/W789vQi3DQmMgjaZV6uiNvvCVGZ4WhxyB/plBncDLyx/m
         BqYFTKXb+mm8SC8DZz4kX1RH5SPs3ZNVbjmNrilTHwN2fQF6MGtRtel3iwOexqS2YKAb
         3Jfz4eAEP60NotqrfAQoGQmDOq6JfRLMm6qrD9ClTGvdWaNZ1c1UlTg9GkBnY1/DX6FY
         gzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234210; x=1778839010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LthUShBIHS42cUrm3J5+M2OZFyxtHDBOPDKRpNCvYB0=;
        b=FIylpwbmiUcLLJjm385iIGyBvxnmXhheaIKK6DkMeueevCPTQukx4QSvDy1KsjQEop
         jFoKBMhHMf90iX6KWbRfBEc8afwxKBT7OG4uMNsXlDe0gu831MeCmCHsb6wzPugfVc/b
         uv7+A+LNfsIDxjeV0fsDk0qE3yz9D6wsplZIB1H9WW1V42ICf+CGqsxeqRaISy33P6GY
         Km2zOxz6oj5IgcglJsHTnX7y/+45/yCKzfXXEq+BqWNNPPaB2XddwqKB5qLTpf6DtAGv
         1q8oF14wVSw8WQpdgqbbrmIEkcuqwPmQ9UOCpEucSyf8wdzVT/8gXQFWQiCnAiZsuVGE
         gLlg==
X-Gm-Message-State: AOJu0YxZBF7HJrBAuMqJQupJ9w7/ddpcW7ga7Znm7G8cBLVIp+uDDq4e
	eYajOsP+kbBrvxfl13vcOqpr7EjIle+kQ+la+sxbT/vy1L3WdXopfqh8VEBDI7xm7V1vb8W2xbc
	Wj3l/SZGm56YyCtvLNTsgtdTfjZxAv9q1vtdHJqXPYIQTbXCBxjSbC7P8zKl4Py0b27Kz
X-Gm-Gg: AeBDiesFNHki880RLYxJ2hz1vB2nQPjqUYuUv6kvO5MMl8Vovf9Whnp/q201dSE+nB6
	HlLd2qdwEXFUpzX+Q4/6FK7djYavNjdHwNDfwOdQPjqKb5hvwMVinDK8GdtA+jXCrLUR9xj33tV
	IQ/IHyBf+Zjlf1F/zy/9urQhRw8DFro/eNgFEduGyFFiVakJMXu7VMiv8DEnDdYrgLsLLT/PtDM
	rhG1sXCHvEJplvo2BUewAgpp6D2gSOT1t0XxejWXOppSWZEdHpOt7Ag0FiBnWTO7SYDKO3TlAJC
	FU3pvVTEHezOn8iLE4vIQqEghoF13ZAeENvODjOjR/yEFOQV1zzXpyLrs/FubWko0cfDNbjQXk7
	PYlamBMGG64sb34dBevkkXMs55dc2YPb9RsoKTFjNr0jIEeYPMxXR40NlbP89iXDJcEeO1sNcyt
	8hd8w=
X-Received: by 2002:ac8:5953:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51462611830mr109956161cf.2.1778234209654;
        Fri, 08 May 2026 02:56:49 -0700 (PDT)
X-Received: by 2002:ac8:5953:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51462611830mr109955981cf.2.1778234209109;
        Fri, 08 May 2026 02:56:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a3f3sm467056a12.10.2026.05.08.02.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:56:48 -0700 (PDT)
Message-ID: <1e855b70-cc2e-47f8-a820-877622620016@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:56:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8996: add blsp2_spi5 node
To: Christopher Obbard <christopher.obbard@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMiBTYWx0ZWRfX1ccWPKBxFr5Z
 ftJXRY/3BvkpEuPr0t34N2ZfcogBTeaGmroah0AZgcMe3JsXt2U2o7iLRv2QHmP/2nWw50hM6GI
 QGx6saIouwRQRXFAlKoJxiq3Nvwn4tzuqt3miiRKElQCngSRD3/4uPCUUKgAaC4aQQ1YAfVvBR8
 JRwICnllow8M+DphM+cEU0ol+WalLPJT2t74Y4DLQ5AELoZfGp7GtLK13zqCByJ/TRoMV/wFKdW
 xPkb74TCGLwQQS4eGeeGC0B7Z21/BG/8ZhQiqg0dhV4jgHkQ9vJWxqpk2+suC4xB8seul8i1rov
 vPMrXP+1gff8B4avlolA9TgRrVzNQAtxljTzOitQrXE3iTBSKFLOkWPsVnx6roOjJWk7eHBFlT/
 UDPCJrhYE460hRgoTKD1XdP78rKiVDq6fPpNVruC3MWbFpCXIGVsg6vqPfEJf9fjoK5wqM3CyrK
 YJDVPOBVCHZVbbQbMig==
X-Proofpoint-GUID: C_O8ivrQOqcAQ5BmiqHpn_6xv9MUT2iy
X-Proofpoint-ORIG-GUID: C_O8ivrQOqcAQ5BmiqHpn_6xv9MUT2iy
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fdb362 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=x0-Ntm4DP0gVEan9CnAA:9 a=QEXdDO2ut3YA:10
 a=TF39JM0BPuoA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080102
X-Rspamd-Queue-Id: B1A9D4F4AD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106622-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 4:30 AM, Christopher Obbard wrote:
> Add the blsp2_spi5 SPI controller node together with its default and sleep
> pinctrl states.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

