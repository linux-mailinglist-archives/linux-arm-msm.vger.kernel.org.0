Return-Path: <linux-arm-msm+bounces-90568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNduICRwd2m8gAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:46:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D477B890D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF1BB3006B4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2B133A6F2;
	Mon, 26 Jan 2026 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fn/fd2v7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STVnBozX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2868E33A6F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434827; cv=none; b=LRsNvvxPv0BEXLoe+oupk75g4+u62Xf1LTN5plUDhN0LHgJzztZvfkAf1SUWz75Ee8DfMP4LY0ZgTu6d07CD6d4kaijCFhUVAa7XgAY7pFjkpzAcFxsiyyeDHaNTPb4qEOe8NFsl105eSpjbF53T96fb5PtavQc5W+/PkoRbpOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434827; c=relaxed/simple;
	bh=hiV1mwptVE1X+TFGpR5nDlHhkXYVLOknuYGWaerv1DA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvJcxCkYD2PL1yU2AGm6jhCxZSus/qklahgxtZ81dUmZM/hHPboDVXKEVT/ArKjrga1wOGLN5V4W/0IOSsY1eUGUC06XCS1bqGDlUlGc+5vVOnUkK0W9EnCWYLaBabCXvSJsqX8c+OnZBhUCH46prtVqDXxAwXM/MtROTC4rjUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fn/fd2v7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STVnBozX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q40q9j1361590
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZpoYSbwjt/zA/TbbfxQ54Cdd+ABBb+o46hdhiusmLk=; b=Fn/fd2v7fK0Ve8IR
	WYD7EY1KWXc6MYd2FeK2YRV52BNAqli2nZ1RoRSiUk8zPjLUPsmKjT3hXZUCjLkZ
	REVQj0ILe9T5COvrucrYE0YJKBnKEU1qPLJhzz7UlkCU5xc0YzFi2GcYLrogph8x
	nPmzYXS5LBkpOi5HyrY8uj4dlOGYA98DPI46dfLMwTDSLFRcrFW2jut2vOXIFNdM
	L/GH/1Qe+MLtrQ5w0BS+h3J5nnUToiHuTwLli2ggeQ6c94Btund7UVBzJSxFr/TX
	TDHCHWdizbIqy4Mr1TXgbJfBELt/eO+WZ9cxZPjrhbnAM6AzqMoYaYFy09Kh/Qvb
	2GTjvQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v31af5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 13:40:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-822f926eff5so1789997b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 05:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769434825; x=1770039625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZpoYSbwjt/zA/TbbfxQ54Cdd+ABBb+o46hdhiusmLk=;
        b=STVnBozX1Jj0j1H9RTr0SVKI50OPHpSpq7g3zFTE016saquzP/b/DCkTZIBRLwDpiL
         XHVd//fhlwi0YIBas62WyDQV5eEXOhJWkA9+RdEHL4oVyznO5l7TeB6MEgitdgnXlz+q
         a8iZgVwYallhMxfTmXb1pIXezluJqSQ4ENtKdbRg0gYmdj5Cz9YqOi9m7xx95H+OAcOt
         W6YrjaUoinUmkw1tU87/tmpfqHDmpQKiBE8qAPy5RyBAJ6sqI2mMdS8odgD+gLXB5ZU7
         NIP37VQtk4vAVx3D8JmWT3Muo/BIZjysC7PAuXGJIdZtOj8br/zQm7WE2XXHSFMqA8fo
         7R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769434825; x=1770039625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZpoYSbwjt/zA/TbbfxQ54Cdd+ABBb+o46hdhiusmLk=;
        b=E/8SbxgAbbkeI8H22wRsN3cJTl/gggB2FdwpRiTtEPMOViQcuiGM+jCA0uQn0oB7P9
         ax60v2KABLVsDn5qBM9Xu59OiQk0EF7zeborE8WolaN3aKI1/v+qLWElS8O7TIPiwQE3
         z19VopzgW62CmyeHo87O1vTcH4JTypbu5YhqVTyiUiktxp/T1h7MxXM6WQs0GQ9p1FXV
         IchqOOJmKQZWq7hzX6lgroNRHiVhkj9Eh6w+DHrfRbifEhqaRAmXgWAoI550ABTWD6wF
         b2sDB8wGcWXRG1AnSvyXoHddhJrA10vTRA36lTwl8ZKiMT6PJorDotpaB4td2u8a4rXD
         wVhg==
X-Forwarded-Encrypted: i=1; AJvYcCVIr396rQjuJcmZap+PDufiWyKM6H4oKpUZCOCzCWSgBy7M7yuobKeW3JmznwWCI7XaFafojdpPkoarZpFx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhj+e7Y00LjK4ewQ9AFD1uRWZKI/d0oWUFPg7+Y2yc6DJIV4qO
	uoUXYTOKSyX02Xeck9jw0Mwvtty8Z3u0fuLbtxCc5ozPLi6HE0f9UouVbi0DBafHVMkoZAr/5Ko
	kikmdvgAfL+mnhcM2pZWvtuH2iDcfzG5jmXic63IQseC6zoLTsbydXiy1l2sudwX8I1go
X-Gm-Gg: AZuq6aJ/7MEM5vfCvCacs7M06Yp970xWHagRoWL713CYpDYAoUnkaB8bq5Tp7lkY9Ap
	EPCaG+iO9GBX+kQ11CXy2oxE9b+lQ3TmSnszFyVdhizQqQTKAHl0EQToGuvU8VYMJ06n5ST9rI7
	qBvlwgVkVtFpDoQhapuYRcFLK4PWGTkg9g+t+c5NNPEgIi+mdNoM+Lw75H5HLhELgCep0BGHhTx
	ySgPFUCNBWe9d3hXrrqBU8lQZjiPA8WJj4n6r5j5HBpcPeQq9ieA7tLhhn1YqfCKfeEXu9QKXIp
	EWZPaZcpREeJ8mPdkcJ7DJ0A9eu3ghbTsWNc0kb4GLDhjam54aq0NP/Bq+UANKy26pCxHC4oxy3
	M2GZEil+Am57lk0G1Uxq4OO3cEUi5cbjozwyzpc9hQivtzirx6g3Y
X-Received: by 2002:a05:6a00:158e:b0:823:6d3:85d0 with SMTP id d2e1a72fcca58-82341317d38mr3196392b3a.67.1769434824792;
        Mon, 26 Jan 2026 05:40:24 -0800 (PST)
X-Received: by 2002:a05:6a00:158e:b0:823:6d3:85d0 with SMTP id d2e1a72fcca58-82341317d38mr3196369b3a.67.1769434824326;
        Mon, 26 Jan 2026 05:40:24 -0800 (PST)
Received: from [192.168.29.125] ([49.43.234.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318666c16sm9429622b3a.24.2026.01.26.05.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 05:40:23 -0800 (PST)
Message-ID: <d98f4778-38c6-412f-9b96-8e258cef0afd@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 19:10:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: glymur: Add Mahua SoC support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260123-mahua_icc-v1-0-bc82cb087f1e@oss.qualcomm.com>
 <20260123-mahua_icc-v1-2-bc82cb087f1e@oss.qualcomm.com>
 <vpaz7jhnuagfl24dow3ktyhjtzktmhiiwh2rnflub3jbc3pgu2@2ydlmugmqgbt>
 <d160aa9b-d22d-4c12-ab4f-42b5dff375b5@oss.qualcomm.com>
 <k54tulgkio5at744qcuhqijgb6hb6kjcahloyiiu3ujeoqoir4@vu3cuu7p4wvw>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <k54tulgkio5at744qcuhqijgb6hb6kjcahloyiiu3ujeoqoir4@vu3cuu7p4wvw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDExNiBTYWx0ZWRfXxtgwXnmjzOY0
 m6aITHNB5bm6Y5DX6nrrk30FRLj9YG6PZLAS6rsOdEp2B7k7eWPKLNJxUZ+yWzUq5roFW0Vj2Vl
 skM2duEkGCgw7DVbTkVIuniVQa0nVCrl1MrTv9WxauLhd2Pyj6P5Af+O0KuLRbTEKJgjrPRE2VZ
 m0d++zMDpUJQHSiKwYFpWn3pUAccO2DMR3bWNFCt2IIRT6UHCACA6e8dljCCYpWy4HkVqIm/c0U
 aPlmzDq2M6s5XrzI/7WPbrfM5q8ecS7ZFlhGu40BZUeHgaXVt4unW3Sf9hWCGs8MiCgi0YpsC0z
 4/2R1rqReykWhdeHoaYHaqdhlObGedTnPhv/OuoZW/05l5btSbVWtR5VtPCnmyCxQtLTPcgQDmy
 N8Qp2ShcGU93s2f9XJlpO6v8JLGSU8vV355le88l4L4vM8uVZKtRAqy+s8iS+8yMNSqvqYDuyBX
 gWu//lNLVN0WGx/LV8w==
X-Proofpoint-GUID: G882b2oVqJZKsaXEUmMPGAz_XfR9ub7y
X-Proofpoint-ORIG-GUID: G882b2oVqJZKsaXEUmMPGAz_XfR9ub7y
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69776ec9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=y/Pne2EoOvGgihOE/QD3VA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EanYLttqG9bUWcn10CcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90568-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D477B890D0
X-Rspamd-Action: no action



On 1/26/2026 7:04 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 06:40:13PM +0530, Raviteja Laggyshetty wrote:
>> On 1/23/2026 11:28 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 23, 2026 at 05:12:36PM +0000, Raviteja Laggyshetty wrote:
>>>> +static int glymur_qnoc_probe(struct platform_device *pdev)
>>>> +{
>>>> +	if (device_is_compatible(&pdev->dev, "qcom,mahua-mc-virt")) {
>>>> +		llcc_mc.channels = 8;
>>>> +		ebi.channels = 8;
>>>> +	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-hscnoc")) {
>>>> +		qns_llcc.channels = 8;
>>>> +		chm_apps.channels = 4;
>>>> +		qnm_pcie_west.buswidth = 32;
>>>> +	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-pcie-west-anoc")) {
>>>> +		qns_pcie_west_mem_noc.buswidth = 32;
>>>> +	}
>>>
>>> Right here, set the node entries to NULL.
>>
>> cnoc_cfg_nodes is declared as an array of const pointers, so the pointer
>> values cannot be reassigned after initialization. To change the addresses,
>> the const qualifier would need to be dropped. To preserve const, the 
>> entire array has been duplicated instead by dropping the PCIE_3A related
>> nodes.
> 
> Why? Just drop the const instead of creating unnecessary (almost)
> duplication.
> 
ok, Thanks for the suggestion Dmitry, will post the next revision by 
addressing the comments.

>>>
>>>> +
> 


