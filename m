Return-Path: <linux-arm-msm+bounces-57616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C925AB3DD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 18:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ACE9866733
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 16:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BEE25332D;
	Mon, 12 May 2025 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLWsQO1z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A82252901
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068043; cv=none; b=CiJmPeL3T+/vjfnbJ+oThLjcSz8zJpjHH/hLCpEp+Kt1+cQ6YhlWsPqAa7yH75APXPtlwkiuWGKyS2/3EIlNHxMfQ7WH9VpBwG7LDqMmHBMGB1+rD4hjJ0I62Fb5nE7LCGb0nehnVAP09s2MrHhv4beWNenQXAdIfXkyeZ5f6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068043; c=relaxed/simple;
	bh=IBYs0W8saUAyKuZtsz6A9gS7i3ub4vw3XW/jT+PXSus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPYlGs1LPlkuQ3aESSef6YK+2AnXrRnv1btqQcZkMLCham9gsS0cQdCvEr8pcaNgQ54OViHvKioNA2UmWit78/DssqNVZbGgrO5IdXdKwXcSJe0IT9C/aTU3Con8yFws9jHJS2n0wHiExEYpbJEEQ1lsOdndB8o0Xzg/g2exfiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLWsQO1z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9KJbP031930
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 16:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kr3jWOCGeen6mhPU6fQ82uGqo7KISN3OGotI9WEfvvg=; b=JLWsQO1zK5h+kY+3
	XgMugpyth20ltJzSLsi4BAavGHPJ7W5PKT/gAoHNW461/cYPAnIr4xQv8KMsSn/e
	+oKmNPd4D7B/F2j92WHykFvslMQ5BWUUsvHzTtl2UZy0bAEbpcMwhg3nrfKVn+b7
	F18qCj7u4Jk+6R40GikdoBn2iGhTP0mDBLaq35T3PXtvuBUniBUebVabz1H87XUe
	QcatAHQP7nUhbDmgx0hdZ6SSUbEsZrO+B1M6f023V3pLH70taUWrYplSglw67tFn
	wX5Of4Nh7+WYBYNTWQxRWeupBddVxn1akWstUbin948ZK2s2KqEL788oJ5jtXuzo
	aEI0cQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hy15w07r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 16:40:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54788bdf7so40076985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 09:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068040; x=1747672840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kr3jWOCGeen6mhPU6fQ82uGqo7KISN3OGotI9WEfvvg=;
        b=XzTuxAejZ0Kv4BbPD8cEo2xTW1q1iAQB8htyezIogUNW3NSyA+/7eDmJ/i+/rinvKf
         GMedZmSsOgXOhdg8YKVAZ7+PWQheq/fG7FksC+/TurN+wfRRVLzAXyTwWbv++tDgM8A3
         lpwZQ755z7TYN1XPppLog4nNpG4r5TzASwScrhB3V5DiWw77huOoxxJ0R/ZFCdw7TTnK
         V+HgWqd7NMEBLPqZ5iukn3EfIpw5Gi6TBt511EAhVBCdZhAM5cogcGZhwiPqhGFum7Fm
         yFVwilG9faOWAz6pouzmOh9+0Z1jVhuFwvFj+pujE8uiwzNhdjlIVTWv4iLp4UcSZpp9
         lkGg==
X-Forwarded-Encrypted: i=1; AJvYcCWnxPOEaaLNkc9xlhrQNH/DGvtlRKl9bKp5f1faCS+PrauDqzkaKSov5tHtui5NzUISYg5vFIfLNGkouUan@vger.kernel.org
X-Gm-Message-State: AOJu0YwCteLfrFRlpAeFt/dHwVKSnFK7BccZUSetwTzcFoWmjHVX88m5
	2SWT48CxcLvxjkHAk/0wN6S/IfgZ6Wbb+2ZBrK7E7HuMvJIiIvAMLLtmH9tZXNI2eQ8cnDS8zxj
	dXk1zSijvo1MVDMgbEzOpfNHwHT/oL5FUv7GON/Fz2wd6RbsjjoKj7ycRkg/B608g
X-Gm-Gg: ASbGnct/NR2GLB1odA9OYCe35uZR1XOJh85AdPJdHY2tySIz/AkdvtRKgm7AuV7vj07
	KBRHVmhCWHR7mSMu59P0CgTsdYHSPCD7mP7QZRdWPvVVP9+6TqQSGIAaqaRwcEf+r453apBUoCj
	cO10FZh/uhHWNnGjXyJCN2zG/Lh3TDWjpKFCP9GIt+DSmq/PVPMOySTQ1nXLq8vGBC4ezy/bbHv
	b4EWFWYpp9YFG9OWpU1vS6x743b68VnYHkQJmw4FOKHMmOuUK1msN2hl6Go0UwWzNRU05EBehuD
	fgvo8ez0vSNhVEX033qQwMiIFVRHu3RmExgLZVJ4pbVIr2CerpokMEMDMz8SpSzeAsI=
X-Received: by 2002:a05:620a:4442:b0:7c0:bd67:7dd9 with SMTP id af79cd13be357-7cd0113e87bmr724492285a.11.1747068039522;
        Mon, 12 May 2025 09:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYboUn9LFZ6zKugg484tI2Fmt+H6eRADnHp8J2TCCgkIo9QNbZ938v2XB0JB1jPwZubnycuw==
X-Received: by 2002:a05:620a:4442:b0:7c0:bd67:7dd9 with SMTP id af79cd13be357-7cd0113e87bmr724490685a.11.1747068039202;
        Mon, 12 May 2025 09:40:39 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947a13dsm638882166b.83.2025.05.12.09.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:40:38 -0700 (PDT)
Message-ID: <3c7ddb25-1d76-4f85-a058-abdf887dc0dc@oss.qualcomm.com>
Date: Mon, 12 May 2025 18:40:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com>
 <20250512-trace-noc-v5-2-f2ef070baee5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250512-trace-noc-v5-2-f2ef070baee5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xEF53LcsjQx7H00eveoM8lrpUD_kxRj1
X-Proofpoint-ORIG-GUID: xEF53LcsjQx7H00eveoM8lrpUD_kxRj1
X-Authority-Analysis: v=2.4 cv=P9U6hjAu c=1 sm=1 tr=0 ts=68222489 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=IWLDPTm1b9FEelM1JeoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3MSBTYWx0ZWRfXx9JUtDP56OdI
 Cmu7Uf7SAs2vdxpktlc9A8bF/T77oOz6fSAQzZ9dCVnfxYelc/M8NzCc7ZsJaD58TfGyFXU/s2z
 q6Zd+VYsEMLU622Fbq4egms5xzQPASXeH+SJAA3gnCPjgwNnjsx+V6bP2sbrCLdIpRRudv50wSY
 YvJHJlgFQi0iFNOMawT5jRZJikOoBVG9v0L7yo5PC6pXtf0wGWbV7rtf39JC8grYm9XHfL9IKfe
 EhjIhlk1dt+ikhijXBaI2JaC5pHXF1lEN6pm41r57DyZf1ptxAARH6054vpt0dv2stCTF+JN7Hf
 vKq7qt6cNFwzoAjACWgeJw8ctdQkISU3cn1WuLdOfaatU6vGcclQMEKGfFql6cAHwKwaEU6bBYZ
 S64qyEbepYlpTcniS8D+7+OSwx0kynf4GMaZXW2aQDnGoEhQx79E2mA2eR/cWFDLCNeGs/jz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120171

On 5/12/25 1:10 PM, Yuanfang Zhang wrote:
> Add a driver to support Coresight device Trace Network On Chip (TNOC),
> which is an integration hierarchy integrating functionalities of TPDA
> and funnels. It aggregates the trace and transports to coresight trace
> bus.
> 

just a couple nits that you can feel free to skip

[...]

> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +	u32 val;
> +
> +	/* Set ATID */
> +	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +	/* Set the data word count between 'SYNC' packets */
> +	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> +
> +	/* Set the Control register:
> +	 * - Set the FLAG packets to 'FLAG' packets
> +	 * - Set the FREQ packets to 'FREQ_TS' packets
> +	 * - Enable generation of output ATB traffic
> +	 */
> +
> +	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +	val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
> +	val = val | TRACE_NOC_CTRL_FREQTYPE;
> +	val = val | TRACE_NOC_CTRL_PORTEN;

FWIW 'x &= ~foo' and 'x |= foo' are what one usually expects

[...]

> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct trace_noc_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
> +	int ret;
> +
> +	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;

it's good to add a newline after return statements

Konrad

