Return-Path: <linux-arm-msm+bounces-90337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VXBqMX5ic2luvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:58:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 195A87571A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E767300D172
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B22331AABF;
	Fri, 23 Jan 2026 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fySF/epu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8f/DyTL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC32F30E0D1
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169531; cv=none; b=Eu4NCRltVjdPDYNk4xZNbbQ0jpjNmGpBOTD7HcbVv01+wlTzsenRrhcvIUaqsqebfFAHEiJi41URGGccLX0PB8PDv1uAY6UinZ0M9AkjE3028jJ9fcHAaHvsT93vFK6MbwlrP4zklA2EqdV9Y3Plv20l6DvydSIBDq/8UU9SoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169531; c=relaxed/simple;
	bh=ee/6fvX0F8AF9ceEiHWoE2FNkivy4xu8OLjEmtUKMzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzLbz23GkL8jfMBbXxxuuo9cStAQR1YYFXnxykIXRJBIVQ38ip3N85jvwK1OMJdYGQEmGMxwYEhYz49m8JuPulDoJm/gbtPd33F1WmYF6Ze3rqk30bgIudT7O8iUh3ThMy5CLcMG/NDh96R6okY8EJJGUVl1wQhp7p7EQhROiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fySF/epu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8f/DyTL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5fvv83677903
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5emdbylXy9MCV4YYnwzmxryQ7eVqw/YFx+HBSKGus5o=; b=fySF/epuNgI3sCry
	6ebfrfbQsNtpeWX6x4e7vZ+DYaomUhuttTXCygDdX2j/RiDukQ+x/VjY7+8juA3b
	rhszWdCW7EvSzBx3DJi0UkSBa4JGppfxpsMZLT066USOsWB0QQjqYg7BwTuAt4ex
	9NcWlYaSNkTOniobD89T8F/4zroqAXU2W+iAOVDh8WwBphWd+llrog0ScXPmP+/z
	CLddlpYNzQRKvfS9BBk3rztD89m7Pc7DvMId21UF3JmSe3xDKGp7KJ+zhS7VRSeL
	rPFfP9jgRRymcxjcloWvCzYRTEI+7cILiHI29eTNcfqb+vw8zZEkWcCTiH3lEjsJ
	lRaDvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp3g9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:58:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c523d611ffso33435985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 03:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769169528; x=1769774328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5emdbylXy9MCV4YYnwzmxryQ7eVqw/YFx+HBSKGus5o=;
        b=c8f/DyTLohra5zumrxzDLRfS93SFPlPAxQuZO+v/h1bopPbjens0EvBq7eZpxbDUzX
         KEnW1OLXbuAat/jt4HTOuL06mp+tgYeluEapKG5dpLVGtlY5k4JdmGEaDqrte78mTz+O
         uYRXauN5Za1aDJc0meR4k6e0fDLv39Xl8NsQyjWlD7RfBIRLTdAvzlmGutkRerypC8QH
         bio/STXCtUyFdhe3ngsF+BZOu18tzJ/MEEQBNYAlO5Crv95mRmfyAyxdHmU8JzEfCeFi
         VHOTtHTUWienU3IS0tNCCBEnIpp+dZFeKGrAHLf0W98kbknjEBGACfKg1GGiABw6gILQ
         9y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769169528; x=1769774328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5emdbylXy9MCV4YYnwzmxryQ7eVqw/YFx+HBSKGus5o=;
        b=Ej25Y9sI6bNHTlTS8qIqGr1+394XKu1LBMtxbLCHKSOdXTa2UVSbjS8Vdy4Ychirfr
         8+MACoBY3qCi+m3f460R2iMc/NS0n7ofVygDYUVtGwlM4kFjk04cAgXZctEvQzRUW7VP
         w+Ewv/kHHxEDomaaEFlImp8/N/x3AwaVUzB6qqBr6jw6ciTX09hU7aJRwE6p0sRqsq/D
         hpGj4+DQiYR6qoR0ygM6I3w4MiBGW5uj7iCSTigjRlYU6gLOav31d8HdJGntfLHHTqK/
         ng3DMgZ3smfxLdhZolBcrOZwayKzAV8Ng2fW/K7+56SiPpyzh7sb/D/zhvoZoC9Df90B
         vwJw==
X-Forwarded-Encrypted: i=1; AJvYcCV+2msIahwLyN4eHsONKlybRi7y4z9iJGQmHiu4fQ1IwVhuHLLQbA/5vTYDw1iuvuqqYzowqP+AnmNAuh7N@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEIJMQpdf9Iy0AtKFCqmFscOlMRm0Fwirt5vfRaV70JYqDdx/
	YP0zZYC6kqsp2X8Ve3/jhqjohmZFzysh9I6n2gGwEFp8uqUo0380i4VYLzErngKqV7EvI81EV5h
	o174sFBzVF7KiXaexv360FuIvkNK1XmtCUed+GVj9nCc/PW5AiM8HE1oCCF8oI2O7fN2X+Kg7e5
	2z
X-Gm-Gg: AZuq6aKz+T6T4YLxD2Edqu/wgae00H658L7ombC9LPOAYXM+Zskbg0kT3Pu3CMpKNWb
	UMatIwM65zYlLCVTLPH4xKcybFn+7jpj9fwJ+jMExwNZFkimOopbatytQygR23z0eZgUN1RWvpA
	LeuM0oXaazWrr3KTe7YZS36A79sjousrBgfJPL1wBJy8R3ZrlFnPQRTmeYYA8DusvMD1RZGv8mf
	EapFSUFn563ZrEdno+LkOZoqTEUEhtOWEhdb9SSGZmk6md5crTVMm7o8g2Syv5Ul9XcIMDb1zsg
	+N9EY4lV38tznJnSDQ5vZn8L5ozdXBUNzmEXj7/K6Rs1G1+49nVIETkoZgRxrNfO49NLp5nTyMw
	sKrh+4snvaHmTHjruOQqR2AHf8TJuqG8IPw6hn96BFEMVm4Q3Wt6EJXUSZ8jvwvrVRWo=
X-Received: by 2002:a05:620a:4707:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6e2dc774amr276558385a.5.1769169528012;
        Fri, 23 Jan 2026 03:58:48 -0800 (PST)
X-Received: by 2002:a05:620a:4707:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6e2dc774amr276557185a.5.1769169527604;
        Fri, 23 Jan 2026 03:58:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b754122sm95376066b.46.2026.01.23.03.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 03:58:47 -0800 (PST)
Message-ID: <4c552f50-a712-49e1-addf-7f0950495496@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:58:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=69736278 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dLtuw2zWJCuVnVCbnloA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: itVLiIrx3EcR9U0JUiFDLw96vbZ7tkk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5OCBTYWx0ZWRfX08W03B8Dmr6C
 AvhonPbijfQLtatc6c/tWsM2edVE3waheOdL6BZbpqiqtGhkSeZllPWfnhMuuTURZ1qGtlnB8FE
 1XRrrA83PCWHgK442bOQNnN5h+LMlsYP99Zk+YGGFuO7C5KJnLTml1B8i41u0qEGjLx5uw7UPlp
 1yrf0FZIp3007P9UL4m4PNF+V1UEfl2FC3kH9yJ7wV61h2uaqZIZLceN13HQ5nmukwHcMbuXKQW
 SDaSRNMhIOuwr7OpjNWAzMQH2jqHwNzlqEPMIWVx9ZsZJiC571Xq4+wgPfuFlgSPlyZxHHRJGgl
 vTt6/TEetRBJMg6VkmoThQgprThf6WNdj95FxlAT5KZzDGCswOe1AGltAls2uPlV83MH7JY/6BT
 Kb7OhcmsYdhGn1EFh7xDYY6mMBWJRIV6i1EFfHui5k0DLvwM6U741rUIRECHDyXeSSAQM12oXRK
 +jkwkNguPSX7RoyHyOQ==
X-Proofpoint-GUID: itVLiIrx3EcR9U0JUiFDLw96vbZ7tkk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-90337-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 195A87571A
X-Rspamd-Action: no action

On 1/23/26 12:46 PM, Krishna Chaitanya Chundru wrote:
> Add support for sdx35 modem. Similar to SDX75, SDX35 can take longer to
> transition to ready during power up, so use modem_qcom_v2_mhiv_config
> configurations.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
          ^ this looks like a separate bug to fix

see e.g. qcom_fixup_class in drivers/pci/controller/dwc/pcie-qcom.c

Konrad

