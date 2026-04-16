Return-Path: <linux-arm-msm+bounces-103335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCK5Lmxw4GlkgwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 07:15:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6892C40A473
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 07:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E31FA30BA8AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 05:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5171E33B966;
	Thu, 16 Apr 2026 05:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ek/QbMsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlaW+vnM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7661A3101B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776316495; cv=none; b=nmmO6DZiml4eBVGPrxD72ZpGSXRf9zZroNqEORTfPMyk26TzYL6fRVyU02YYBH3A8oOQXN3sk86RvWL5946moqGj2AdM4DuaMqWL39b0iuM4QD1gWN6vRtm+CxfjdEjaTy9yk1hNp31f/lvSfJ+y0XzdLDPzcCszn2jKdecMI6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776316495; c=relaxed/simple;
	bh=t1VGyiXWyMdQ25cykNcULPO2ojDL7yLO5+ejAaqY31Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T62XZiczi2VIlFHcPLta6fvIej51qWEHN0W/Wf29NxIg2o6KmNWQmgpt28YkrbLUmP9J4tL2jzaXRmYfjC6J4CD9rqx7EG8hUhMWGhes0cs8tklSbvGsuGeY/exUC/iyBudF24V5hCYjHX1EwzA81AFijRmAiUizutccOc6HoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ek/QbMsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlaW+vnM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G3Ev7a506785
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6f7fWQvChwCEQCaCojI6iIWeIE9cgBFRq9QL7hvWFRQ=; b=Ek/QbMsXSZXMQp44
	/KTtG9hAT1OYBFVVyWrlM2pFWSTZe2gB+lK1rk2HEEq3j8f34y2IVknZJ+VpLhqF
	8fjbpvLzPSiuG5Lk7lS9AVuopb/s0P223J46P3ROknFoxjUom5/0PQwo9c/h3kOZ
	ITK/jmPhpkkCsd4Et1gG6XdveY5e+OQQuVQDF/XM+f+vIiuPio8FxAXflijgHy+z
	grOiP8abn+c/iOnLRq5K5oO7EzOivXZsEDjn5IoRjpqZwkqte48V3VGvkrN4Rbvt
	PEzA3lDU8nMsfjMM3ltH3qW6lCG6LfwG/4sB8NHX2O+RdvUpO61B/nnc8RDOA2fn
	wqUi7A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dje1e235h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:14:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso15277727a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 22:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776316491; x=1776921291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6f7fWQvChwCEQCaCojI6iIWeIE9cgBFRq9QL7hvWFRQ=;
        b=MlaW+vnMrIRf8nWbGUuOhr2S3AieHq904X855mTQkiODgrHfb5v+XUfT2xYUJlMwaW
         CSJLEZGs3YKKhita9R2YSYiBgxX2vkzBvZEa4oSN8OFp3BlFpMQ4dQOXGqk2JtnEoSeI
         0+dnNaCeJrjr2x/8Hs7GANcYzFMgQF+g3vkbfqbTfYlD0L2MIPue9uj18NQs2O+dDysQ
         3wTA3XPcriiWungR/IBSvjYV7j89jIlZrK3WhjE4HCppc2AEQjh/CQ7UtRIi3ECk7DX5
         YmTeV9OkWx3lQmQBKUvp+lg8bxzRPWPG+X8EyWIiqvdb6CMQgPWElZPCvCaMyLaFOqzL
         4Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776316491; x=1776921291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6f7fWQvChwCEQCaCojI6iIWeIE9cgBFRq9QL7hvWFRQ=;
        b=ckXBiczuhY0GbMkdPh4HsKcFVKSfkGuqivH5ci2WRB/3ye5Pb85zkZUHTU3GU73/hT
         3m91EJljbLMIHKlJhNP5Zsliqr3oc9vwbJ3ZuuDj1iX59KXGvdWmSz6HAP9bpicY0X1v
         tU1+AeN/L055/f45nkXprGDcbTjFgFb+hHPV2cv6BhuJE/Rbga+xMXHKu8lIP3rOP0jN
         uwySFucbUtxZ/Taxbmj1Du7nQNtxmoGuY1k7JcqUEDSZ74uL6KRewC5WR3MbpIkadGVK
         4daRB3iuzA/TXLwLFMjUf+zJVZbZG2fnQ+zA0MSAoYKM6ZEXCTLkNxOHpl/NGgwKfT2X
         mejA==
X-Gm-Message-State: AOJu0YzlhvoJG2yHkrVNAnJAVcwylj6tp0RX6X9xfb3q9IT4sRU2wFh/
	JbCsA0xM6r09hLAdRqg5BVaUidTeZIoscwSFMHtIOGbOwao/vWck1Li9O7RffqqMGR4Or3sZhkL
	eUmEy9IW0aaB0JF+WuORbuLbrLiOvpHhd0IIIj5El/bVbh5COLYMihqLuan3TGQ28Iqxli3rygP
	5f
X-Gm-Gg: AeBDievMElsv8lOveQb6nEZk2PAXIo0M7SEkSB/69gSEiEy01xIDFtwZ1JygeJM2Ft0
	uMyimNI965cp45SKlkvX7C8o5YG9YJS7WXY18T0pvZF0/98f4WBktPdFXPD4B3s1VdFrFVQZKFJ
	oi0xZhecFQpxWvLMETdiKdkl4DY6CyISqMNde3aQViZYdT17qOFDvFoKpQrRMa2+n92ucDtg4sm
	JumuwPs+HHUVUNiasLvP4MlHcZhCuU7mxqbTL6OeuUbjB8tvAfbLexKPV/SqtADXl2pxTLe5/YR
	v4HvwjTfRL5bA9IQDBOMpwiwisTMzNkdzJIYeErzWa0fbkQbMo58W8k6vUmy5igEbBGktgmHhER
	G6dNSpzSUwVmCp7DafTusMBQTGDP5P/UKZOMfA4aiPHMfB6dxqBkV
X-Received: by 2002:a17:90b:2892:b0:35f:c5b8:ef5e with SMTP id 98e67ed59e1d1-35fc5b8f3bbmr10008349a91.10.1776316491455;
        Wed, 15 Apr 2026 22:14:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2892:b0:35f:c5b8:ef5e with SMTP id 98e67ed59e1d1-35fc5b8f3bbmr10008330a91.10.1776316490948;
        Wed, 15 Apr 2026 22:14:50 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36132d9d1b0sm843960a91.9.2026.04.15.22.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 22:14:50 -0700 (PDT)
Message-ID: <95a01fa6-52d6-4e44-bc8b-69743b2b48fa@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:44:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Enable cpufreq cooling
 devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        dipa.mantre@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
 <020442d5-5697-476b-a96a-6e96ce054363@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <020442d5-5697-476b-a96a-6e96ce054363@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZwkiCE8 c=1 sm=1 tr=0 ts=69e0704c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AyGf7Etz6SCXtETE0GgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA0NiBTYWx0ZWRfX3sxyk6wAkTkC
 xK3s/MBJlBOSXIPS1efkPP4mzRu2BAROb+lHUMfuYIMGPbpYVxE472URhI920qa29N8l7jVF9yw
 p5979tUcMp1KzLWQIIwVRyarHCglpVamn3BBN2lRn2xmWB1pyzYEZrXyblZ4Q0hh0YSe5DqfG+g
 poa8zQ5FEOcn+YvoB2sit7ZDdPiNIxeFtPHad0JsiIOYrnD19i+j3uE4wAvyTF/9/XplCmJwEAv
 zHML6ZiTVHQMwvLaS/dN4TqA8JkJIPYCpN/qgJqFk9Zv2q0jB4fqSf6Q05UZi0Q2uyi3XR3+HBh
 zBFrDaRs9NaeSyKq/fEDsnxuUQuwB+7VCi+SJiQPhj44tc08+JM33b/p6O2+K2xH9Heq4ZVp+H/
 PPppypd+B5eAroHai3HODoZYAa/7KiSO0Vp0A/Zy9+oJDcE0mWjlgnmKNAlMOfOsV9Ur9WNwENg
 fMmYQ3NOYEn9nSxTDZg==
X-Proofpoint-ORIG-GUID: Ybivnat8CJsXGqGFRXtfVl9zMbt8oYTq
X-Proofpoint-GUID: Ybivnat8CJsXGqGFRXtfVl9zMbt8oYTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103335-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 6892C40A473
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/15/2026 4:31 PM, Konrad Dybcio wrote:
> On 4/15/26 12:57 PM, Dipa Mantre via B4 Relay wrote:
>> From: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
>>
>> Add cooling-cells property to the CPU nodes to support cpufreq
>> cooling devices.
>>
>> Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

thanks for this change:
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

