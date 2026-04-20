Return-Path: <linux-arm-msm+bounces-103700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E8lHybo5WlkpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:47:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D72DC42869D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 551C13090647
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44F7388E70;
	Mon, 20 Apr 2026 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIaQ0fm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfJ5PUOJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FB1389115
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674376; cv=none; b=L4iCcJxIj1576/07NxE+krSdPtykKBNAiaFY3UHH/cycmsEwFVfKpPT68shoihmttxlBLPQgP7FtJszVscWLKc32ZTTX7SE/Dj18zQJgWn4YlSbf7q9a2Rq+rcDTWKjYw7W9tVbU9YaGuk4sxRtea7GvIEALiDGcJDRH7IIGsn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674376; c=relaxed/simple;
	bh=7wSzwoNZMzCJHuBdCIeuLiCtkB1WaZPcmwv+E1fV2nU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pnt0IZ1gZa37K6jgn+cpa3R5qG0E/KSejOiyTvekM9DBMcCjs7qZiGA4r5H7i8fbmyvSnR6jW+61haqHvGeZjx6l4aDDQEOlsn00DdkPB/swL2L1H5441cKuqhiCkZLPod0JaLhIK3ivr2QZitwz+SapueSrG2bEXr06pRPQZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIaQ0fm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfJ5PUOJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K70H1L3212140
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gUC9FdPsZFnW0+2H5wUfCxQXwNXJYMQMdbbi9U6AaQ=; b=DIaQ0fm1s8IkX1SE
	6eKgQRpU+oqwvu9y3Jsht8GTzEW7JUoUBwVtOCaXLJ8ix9nyF99tOvrGUDm7QF8/
	7Fw+LJ8vzfc+S6qMx4M+QUgz0tHR2nrBqHPpzt/bwmNP47eeAFdYcfqKbmNJrcNJ
	yXm21uRKgCLxkoZjgfGhEInWuOgeOuHdAJJc0c6Dv479W2s9GDQ9Iy+7dIMcdEjZ
	LoEx0oCSete5DPuLfgK4Sv/YU1dsC+5N+X7PEVSDjsE3+Bv2u686Tk8PpBUf6nJL
	0VF+jRlfRRTQ3+HGwS4UbfpFkkUUsUTGclnBulk47/8EFW+GWJdPjiGNO3fwz3O1
	5Ui6fg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfgg7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:39:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so728534b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776674374; x=1777279174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gUC9FdPsZFnW0+2H5wUfCxQXwNXJYMQMdbbi9U6AaQ=;
        b=LfJ5PUOJMmR/5t5RLcjs5GPDAHvgZ9HjBLCQFm+Q35aQ8kKqXSHuh+fMmRe5DvTdyc
         KFRB2o8uHDh6seqBIB6jSX5BbPENr4hv+KwR3g0vg8d9qERgdMhf4jQTeAgLfYKdUtQo
         5bEr9KuLdM5iAn0mKG4gNAXDMPXnxiVCbQguHkJNkR/zUAd97qj9fiLX+kpCS7i6anPc
         wPG1e3CYnUk2q8JuoTgEcFYlneiuf1EhZ2bZwOWpXtOqOuLYnTsGvQVSmFbUO5Aci4dq
         uAwI5yV3FIjV0kiTJfJ3dce08yPmUQakROnWPZGdkidDZS6k+Bkfkkahn1i+2GP/LWpn
         RJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674374; x=1777279174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gUC9FdPsZFnW0+2H5wUfCxQXwNXJYMQMdbbi9U6AaQ=;
        b=T7xEByvbOePKYck/p0Wuu4t96J+vHJg2h/EeY73l4r2HPrzejMJUk0m971nuD1kfwF
         DraiNN40RcszEljlmLMjJN9yWYH/sisq4jYtI4crzs2wI0jxRCWvEVWbX8XGhF9BXgtK
         kL6I90MIiaIcqbxLZn9RtBF4flqV9ndT1kDlrpIGuf5QOGW7LGYP71xAYOHpFGpdxkOq
         p5g3lrFDMzwjimc0IhyaCmicQ1ksn6crVa/8TjvS+uGgTOMII0/w6B2TbdzTR1HWBm8X
         Tj3QEf/CfNNeUlDqNNn8w9E2eTOONboH9KPYiq6SqXZ0u7Aeogsc0nOPNgytQm8ZKUwv
         g0zA==
X-Forwarded-Encrypted: i=1; AFNElJ/uxehRuvqtfeAu2YUFIp0n71c5hjK7HbN/Ip2VO074tc4Me4j75zglibl3nblNGm2uOmrVZBj45i1CWd85@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2OBgk0eGNy5K6o5KQs7GLM7y5Lko/UufwZqMqVsnphKEyVZEy
	whO+YK7+/MpZHC0alyapVjC7/TC5z/2GAM+BgoJJt7j8wrVztPx48jNjKt/2kJD3m9/TgfQIwna
	GqgouLir7Z9VxBigK8gToGzX+wE/t3w3Ud4Mka19EwxTreAO/bHpI7+6oZQ33pNXU5FIH
X-Gm-Gg: AeBDieub0EBRr9ENwpeSBB1w/QlPOiO+ktNcLJtv9vKa5LRcUants1NoE4NX1yGggjr
	BAMvyNE9Qku8tEUuzHJL61mB+tK25h8PYuHNaCdjTvShNPGY1uKJKQe01YmcLwvKvsjjQqaShUf
	dDv8O+ZKa+N3vdhzqxoqp7LXplmxXuBY96WkNkCy2mXlusM9auDhiIalmxKKqen5USpSOkelm6g
	h7no9GvFgOC38ff4kB5Y8fiu72TQtb5wCOia7reo23tVSPVPG1EDBk2IfgXQUmRLNZnnreqYaRR
	459IoJnuBNSwUpgr2kLKHitchuQjPZ1KQhyPemq2K6Q6O5vbQw+xAQrqm6cXc/wDXNNAMLB46AW
	WwTA75MkmEQ9HgyC9IsgqMxZBHDIPNMTBZhUXRGgxYObFpBN5SGj41ACnna8=
X-Received: by 2002:a05:6a00:4308:b0:82f:3733:2f96 with SMTP id d2e1a72fcca58-82f8c82e853mr12493579b3a.8.1776674373555;
        Mon, 20 Apr 2026 01:39:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4308:b0:82f:3733:2f96 with SMTP id d2e1a72fcca58-82f8c82e853mr12493538b3a.8.1776674373070;
        Mon, 20 Apr 2026 01:39:33 -0700 (PDT)
Received: from [10.219.56.90] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm10330642b3a.2.2026.04.20.01.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:39:32 -0700 (PDT)
Message-ID: <47f88890-2503-4d90-a31a-f9d065280e6c@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:08:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in
 ACTLR client match table
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
 <aeSly0N7IkXHYExB@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <aeSly0N7IkXHYExB@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MiBTYWx0ZWRfXwLWlDGaLrWbK
 q50PrqAIgOIc4lu/Gm7stMINw47Q2tiHOIt7IxIiA/n7xhm3MsS4T5Z+PigmFdUEKcFbYmoJZLF
 zWi3QBiKofPhWcPNtpq3emOq2IogswhF8A79WpVICrQXy+dRDCNy5OJIqsr8F42S+C19HWHR0ot
 GmQsm+QlmdnGVen9UGGGaHZtsdiMeAaZMnUuhAgn3raftzEExwrEax1B+XGvAGMM4vjxm21JWL3
 CyZggNN8dYRfekgsU/HGOAtPHPLS6vff6l+1NledW65wuP8vjo+LIlVzBceR5DCyp0zoUTCqEe2
 lLUzsT3HAeudfxHQEzJuDTs2WLnazEgXOlXhMOI/6/6r4rcIp3NsR9Z1gjemzmKXG56ZGKmVZyd
 g0GXaZeUQultLISZ0j7jEoewSjveK8VJhWL6RPIF1Wzc3U1RazwewduoLYvVY8rfq3By0/zWhQi
 YrVvrZnw7TEXOXZOdSw==
X-Proofpoint-ORIG-GUID: HFo4j650H6b5pVMhbCet7EGBGK1HhEOJ
X-Proofpoint-GUID: HFo4j650H6b5pVMhbCet7EGBGK1HhEOJ
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e5e646 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Oj9lEc5NzW_9s0NItFIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200082
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103700-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D72DC42869D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/19/2026 3:22 PM, Shawn Guo wrote:
> On Wed, Apr 08, 2026 at 06:38:25PM +0530, bibek.patro@oss.qualcomm.com wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ...
>> Assisted-by: Anthropic:claude-4-6-sonnet
> 
> Nit - coding-assistants.rst suggests format:
> 
>    Assisted-by: AGENT_NAME:MODEL_VERSION
> 
> So I guess this might be better?
> 
>    Assisted-by: Claude:claude-4-6-sonnet
> 

Agreed. Thanks for pointing this out, Shawn.
I will update the Assisted-by tag to follow the recommendation in 
coding-assistants.rst.

Thanks & regards,
Bibek

> Shawn
> 
>> Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


