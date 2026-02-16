Return-Path: <linux-arm-msm+bounces-92983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ1GD44vk2ke2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:54:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4B144DAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75FD3300405D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F0431328B;
	Mon, 16 Feb 2026 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOfAdO3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqRI4ML1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF770311C27
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253621; cv=none; b=NC9RK9lS/FqDcKIkA6gsky/7rfgxgVVb2/Gg6E8WpzAxbzAAYgiWnZv4q4B0nB8qOyZ4VF9M4yGEjjslfvOcp6WDQ+Pld3+AZQvmsRzJEKEvVKVhTO9x24EhylkodXYWyXKUunzbVjUR2NQq+xld8vM8KtHac5I2N/ozUDyZq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253621; c=relaxed/simple;
	bh=2rxaVjGu4XpdOg33udkiiQxYeZq0jcqJlk+U72irDE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUJ8zkt/bwUO796DwkXhSunKP85JU6Gx4kogHNpds+k2AddlYYcMpWJWLSOOhWSQBOgpfY4d65TmjW610AyeIssmhPkIoq2EHXacw0pRGPVo1n/agqEwOMkF2z0GcDORaIa6gEj8EItVCO5Dt00Gw16t1qo9GxQ9y/+XeAouFmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOfAdO3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqRI4ML1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBG3wZ2262627
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kovETaFhNl90oBKEgZpok7n0YsCTyTL0lxrKHwRVzWQ=; b=MOfAdO3iTzIx2mDH
	NIv5rt8qhAwITi7+7nzuLhpcXzEfJRSOYTRlOPe2zQU0+TiAeAcAva7eZb7qhtD+
	RDf/UXiNvxhvYUl7DjnvDGjrdwhVIlJVqRxlEJZ/yx3YfklozdNyFUydUqL2xayK
	qqGh/0Z+Cf0klQ3y/UGJ18uWG9X9ri9F0yd3zGFtxal4SBa5yjbNr2vpQWwy2fyy
	XutEly/1f0Eg9MRrHfvkPItVCbbiTCe5P3J8/f8Q8GX8hKmPE+9SYoauFJp7StWi
	aDhdPQQUUZXY3w9wQsqLRSnv+r6hJynLq9oSHfj05pt8byl3QXQ8vFK64RBkwkXT
	42ORqA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe64sa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:53:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89496f5086dso25303186d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771253618; x=1771858418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kovETaFhNl90oBKEgZpok7n0YsCTyTL0lxrKHwRVzWQ=;
        b=JqRI4ML1KaCDRE6kObv7RiNqq187QTfOye26MBuUrZlHtBC8KCD1/dGx2aMpSPEz3y
         2OVUjeW5Uq1bynctwJzoK7yw/HNcKfWqWTib+fHrsHltNdrSw9kic/C8F1Qh+skVCCMv
         ux0C8J0pfszIkuTPq605ZB/jyS7OWyXM6m6DB0mHKCLL2x6Lnt9OgW5EwWJPVftpuDup
         SF2i+IyFDelmIr3Tk3TM5+xFJHQBzY5vMygH8I5rQVyNHxlWvi6gPZQ9FRWDyDp2rcuL
         X3iwohJC2Vf/16Yc9wVXeOEXbejw1DaMq2quWsmODNUNh5KgsURwtVLW9WliTZ+3axpc
         jGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253618; x=1771858418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kovETaFhNl90oBKEgZpok7n0YsCTyTL0lxrKHwRVzWQ=;
        b=TKAQSZ7F4VCJy4oEvYOPLG5A0MrKOVhT5bMdqPZQca+/OpAYtGeL3PM/E9dUK7CDbz
         vu0ibl3J3372MKpjJJe47jxTORwwaWoK78Zz8mnf64PrbEDnSR68yfDGwvNnPQDH6Inz
         Qs+AlDcfjExQVM4s5GiUHXfo5/4cRkbIR5RqWd3ANq0qTndSrvNrZvmsZ6ThQNg/08Zv
         LWGZfneZ9lDBdbACSinUllIqz1c4wweKRDvp/NxL2EpuphYTkzbwA8Wnfv4NzVz18qn7
         eihHTQfyvMFaYYyqqfleGuwNWTwHcSVBC7s5a923Fpqxc6oPmha0OPESmyAJGzlGU8dQ
         eVGA==
X-Gm-Message-State: AOJu0YzNKmM2JK1YKGJpEtmznrF9Ds8HKhlQzjTtWtS49SQKPmNEdMHj
	nJ3Y94xkBr7vdAUM3ss/LY0SzvSO30G5qR3WZgEI8mdOtn3JjyziWri6jMdVb0i7DKLhURE61VE
	xVnayFCHF+ZEjmdRidQEzi5m3e7YQuBU7N7+vsem7j9C78V9pfba1YLFBN8PUi7jHmVC6
X-Gm-Gg: AZuq6aJhq6uSWMFNZ16kGe0QSxk2o0fBuu58V+VMcoc0NN3Vqhy4SlQc/UfnKl5U1J7
	+rquozm1/xY9FTUYh+AffxgDxmqcG6yMmECleMfmr/VyxHGdM7NM8Tt/9RV36n6Qnee4kbPXHMK
	GMs6AIo1pNieXtCI3BZJ+zr6F4pawK40+9eVs8OLorzZUQx8ACkWqh7FI+ULWkh4OGNHITAVA+P
	ebbO19aZTB4bji8qz+N2DjMdL8QsWWU+WlkYa5/HG+KQdBTzVJnXMi1WTaK5N/870au7avkyXtP
	KQ4Bekau5k92CbMtf7E895TMCxBALNI2HRTMlFRTB2i1cqOKtE4MdfYiVUxvXdrfgYkj/9c9CVW
	qhTRFCmGxCadyY6yPuQ6/7Oy27gfcdE1R8hGiFGmTw6KtfsxrI+62DZ9BV12Cf7netPoC4ZKSce
	3IgFg=
X-Received: by 2002:a05:6214:8004:b0:895:4afd:5dea with SMTP id 6a1803df08f44-89734625af4mr114524736d6.0.1771253618257;
        Mon, 16 Feb 2026 06:53:38 -0800 (PST)
X-Received: by 2002:a05:6214:8004:b0:895:4afd:5dea with SMTP id 6a1803df08f44-89734625af4mr114524436d6.0.1771253617732;
        Mon, 16 Feb 2026 06:53:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766579asm259615066b.54.2026.02.16.06.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 06:53:37 -0800 (PST)
Message-ID: <ba6a9ce1-6ef0-4921-83dc-751b037d0e7f@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:53:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com>
 <20260216-eliza-pmdomain-v1-2-c51260a47d6d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-pmdomain-v1-2-c51260a47d6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=69932f72 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=T3cQ91Bvcxg1os4lQNMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: eOtxGMdq7xp90nWS_WLfKZLAmXfuZzpp
X-Proofpoint-ORIG-GUID: eOtxGMdq7xp90nWS_WLfKZLAmXfuZzpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyNyBTYWx0ZWRfX/eDn631OEmr0
 fXWokSEF1FTgg8CxpfRGjh5UhdsogZn6Uoys9SmzraL3xjxoBz04CZGuHZyPQD2IwF+TDy60UZM
 IEKv07eYAy1ym7o3x/ZQf4Thzv1l3fsjoV6ke2ZsZKMUNCunUFZbZkKVP+U5MmUioYJFWjGAAL8
 J1JlpOLwGRjmXujxoEXUHV90WSR6v3a8bFYAdFY6AZJH8MsYi6uN3SpNUmSoqNqyAXUexY7Vm8I
 W1L3Va5q1Yodb0e5TDI9hFE8CNydp6R4ghQorzlN4h550f+nQndh85y1GxjK+taAWfoSZ1eDj2w
 TPocQkyKx3UBzUalwd9js0PAIzRUcR+73+QeZBsN+HdbzrQZXp+GTdow4GfE8kvD8kLuchK34aP
 radippd8FEt5RJ5+4KtGgj2pwX8yZPKILeDl5VwOgvfCgSBv8/yHq4162q695NHX8U13evG8bGJ
 B0bG4PkW2Cx1F3t5wtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92983-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1B4B144DAF
X-Rspamd-Action: no action

On 2/16/26 3:23 PM, Abel Vesa wrote:
> Add RPMh Power Domains support for the Eliza platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

