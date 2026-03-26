Return-Path: <linux-arm-msm+bounces-100137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH2XCbVyxWmN+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:53:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A23398D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 446983055110
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB6B3A640A;
	Thu, 26 Mar 2026 17:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+qofs3o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqdeI+5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D539DBF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547256; cv=none; b=AcniBHfpLx/YVpgTDSfNIImcpw1sMEys08WjEq1Ax+P6FQbQM8lOZk1Vxz9ryknWk+0s+WBhp9Anl+Ob+Mx9AqaDutrirRCFsJMYLl3w7LD9mmbZp3xnanWqo4uYol3gRr8tze5b4ATSx/Ojvnr860wOJ9O+5wGljPGLldO9JHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547256; c=relaxed/simple;
	bh=CRT1h5Wpvv6FKrLuWTBECLq71Q7VV4Tb3jNoedIGOrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbRRDCuwRora5FjQpK0361oBgu6N+TUC9Hnfo4Yzx/duI9+hkxts5HYa/Mf7XxC39y4n9+2J7cJKg4RJVaZhYcwVC1v9Nm7T4Hajey+80gTCTMiIeGS17gkMk4n2VgBxoRHk3HhrQQo1n1D9t1luyOyZyNaCwn1g2du4qNH36lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+qofs3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqdeI+5F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9ehu3373678
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZmPC46sgZ1WVHObuXQsL8cBPLZIUSXcaX5lFJpWXPI=; b=h+qofs3oeP5JSQ36
	yzy/s+VNqddZvplttcSf05hIGRzIE3T4azsG+bA+pLIUm70t9fNABy76RHgPntEe
	CgDwBxLOYfXdyQHoyqxWPIYwh8Jsassi+ZG+nebe8fl3RNMq6DjZofW80bYMi3y7
	YU/RwOrBv6QYYjvpBJeYbq8C4gER0/5HwtFMtzIhg9IOQU6GNGZCjImIXEokDDdK
	L6p5eepQ/i0lPD41c/vhmLAciqMzOzrZr5QLsUq9mOfcCbXNJqyRDryOn+x3eltu
	QAzk49rVqt/VxQSsM8WtIgnHJUpOjSycQfNR19WRVvFOFNUkjOwqU8DFAFFCMykf
	QorUUA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qksut8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:47:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c1874336aso3783423a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774547252; x=1775152052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZmPC46sgZ1WVHObuXQsL8cBPLZIUSXcaX5lFJpWXPI=;
        b=HqdeI+5Fr99+k4xYv9O+bLrZz50PauTJwAvETbzhCpKY5G8Z67cQNIy5y5TVqDtAtC
         kAaohmBcY28UNsRnox0oBoL1X/kT+xAKxCigAOuYz7boUZGihrcPADfG1W6I/r9owNRD
         x6zaAPOaqzIcNSPasBAWMML1qxihAUxWsomiGvkzz8SnoNtN6TU5hwdhZQdyLCVqB6hj
         2N5Q7xBX4aYmjuy8h7xyuAlBqITsgcD9RYk9GXTC0u3C19jgyHgku6j50usLxpHX5Rcq
         v0awJxIg0MoLPIyTMYhopWEiKO87llD3KuPu/SIggOoVN/v2EsaL5Bym7ZK/X58MUmIn
         n0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547252; x=1775152052;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZmPC46sgZ1WVHObuXQsL8cBPLZIUSXcaX5lFJpWXPI=;
        b=fNCjBRXeMd95SRT8GMSqwiakycDZuw5XzSxI53JIw6q9ydV29tqQxnDXfOaOwV/liI
         L3mBKLayO1tMnLduGHUQ7oSXatUO80W4DRK+hF/qD5wW0SK+MX5HAX3pGeydMX2XnIOP
         ip7LTCBWb/LW4WrSz0MFp1Q3tFfGFn38uN0lWSF6jYndrsTDmD6sUK/VUYltgILoJrO4
         KUBHJASzzZ88f3kpIZ+2T/yQUckkFTgoIzuw1FhS/BQOf615G+BOFPkBcQtxg9OdOo34
         0GUEKDE/D/IlilZJbUxgY1ED7leNsA0Zi631Potble9ucGfzwjtCeKuPHL9Vo5Lfsn/q
         SvuQ==
X-Gm-Message-State: AOJu0YwwkhppLZH8zxzQUupLUYUcWmglzgt0NS6EjLBMCoQTOST/uJO/
	sFmIFbw5XPKnvJmSx4RzvvJqaisLPmb2cWq5ZcnsSrYJBU4/wawF2gyfIWrDu2a7473aRqmHsLl
	z2vHeuhpfstVXDhrtlu23XeppfwymiMRDF8Yjj3aM2UX8zyVE8eKsSlFdJDAinGBEOQ+C
X-Gm-Gg: ATEYQzzWGyebK+WtUWcgM+yPLukncez2Hu1HRVc2BpOwgUgXSWvTRRfggOf3PPXhBjP
	lV7aBiZos8Jhxh1UnXHGCQ/7YkchpvSSAfdtS6HfGPwu0qN/xtYlN//RuspqcS4yRNRQ5UTmx/D
	Vp9xQnD37FrxCqDZOOaS3bvCkc/e1SOhvzaGiNYrJjZWbJ26njJ2YwY5W1Ymt1aTQ312O7HgTjj
	xNs69LQAuB+WZ7gXUyuI9mECx3MKLBC5z5zb0GP1U2HXxu1nam3M+YGBTr3QQUakeqBFCVNxzdJ
	m2qlT3srmr6BeIpydaobms1ee4YtBtzMLTekV+VgRYKMK1iG6yyCs0/dp5fzwiX1Fb8FNb9aM/W
	hE+H65d0toNgcu6+w5LD56kQQS3IdoQwDtYgpB6ij5gxf
X-Received: by 2002:a17:90b:4c81:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35c0ddad8c6mr7281954a91.20.1774547251649;
        Thu, 26 Mar 2026 10:47:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4c81:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35c0ddad8c6mr7281929a91.20.1774547251056;
        Thu, 26 Mar 2026 10:47:31 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a82231sm3579514a91.6.2026.03.26.10.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 10:47:30 -0700 (PDT)
Message-ID: <acea56a0-f854-4415-b4b2-2e320934b6c7@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 23:17:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] drm/msm/a6xx: Update HFI definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-8-fc95b8d9c017@oss.qualcomm.com>
 <30a4cdad-47c0-43f0-9327-04c28eac52ae@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <30a4cdad-47c0-43f0-9327-04c28eac52ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyNyBTYWx0ZWRfX9NxXnJdLEEXd
 XisptX1XzBN4E2Jhwv7o0zq27Jzc62W84GcrpoW++5N3qsmuzm8uJNgw2/O5omX6YbD/ZoLW717
 EYzrKqnBYTOCI0l9yiSPDbWj5v33gLQlxrPesiFRo8fJDJp3XvmXh25C74p0eZbnLDJ1W0KUCNk
 MBBbW8mO64bcbN0qHvEy1QpsPhXEH7VIdJBXNzDk67LNQtm1NJLhAALsu4Ei+GUjRWEkfL2fLT8
 9uhP98mjQoRfVFbceKBGiQUsvNIBy96FtS8Wy3zuS2UXoVHuaNN+3l0rMXlZ8cu1h+zRF+gazzn
 i6P3R3iL3UEyrXyTbYYk7h2A2pWXBMoMgVMKQhInwQtac1SbJ0R8n0vu7md/27wE5lDtiTSflzQ
 W0rrt4sB0zLjosTvtlTotO/NGEIuC1R/5RaYdFe6O19orIk4D1ONMEAL2l5Flf7tsMXNnbB8MVJ
 HttPqQvxzCbVAbSdLaQ==
X-Proofpoint-ORIG-GUID: H_B23VOv409wYIJJl20htmy6xQpAVUOV
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c57134 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TiZlnAevEPvvlz0WFoUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: H_B23VOv409wYIJJl20htmy6xQpAVUOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260127
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100137-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 634A23398D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 3:30 PM, Konrad Dybcio wrote:
> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>> Update the HFI definitions to support additional GMU based power
>> features.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +#define CLX_DATA(irated, num_phases, clx_path, extd_intf) \
>> +	((extd_intf << 29) |				  \
>> +	 (clx_path << 28) |				  \
>> +	 (num_phases << 22) |				  \
>> +	 (irated << 16))
>> +
>> +struct a6xx_hfi_clx_domain_v2 {
>> +	/**
>> +	 * @data: BITS[0:15]  Migration time
>> +	 *        BITS[16:21] Current rating
>> +	 *        BITS[22:27] Phases for domain
>> +	 *        BITS[28:28] Path notification
>> +	 *        BITS[29:31] Extra features
>> +	 */
> 
> My first thought would be to define these as bitfields, i.e.
> u16 mitigation_time
> u8 current_rating : 6;
> u8 num_phases : 6;
> u8 path_notification : 1;
> u8 extra_features : 3;
> 

I am unsure if the compiler would mess with the ordering. Aside from the
fact that this is an ABI with the firmware, what make this piece of data
very risk is that, these are power related configurations where the
issues due to misconfiguration won't be immediately obvious.

-Akhil.

> (hopefully I counted them right)
> 
> You would then not need custom macros to set/get the data
> 
>> +	u32 data;
>> +	/** @clxt: CLX time in microseconds */
> 
> slash-star-star implies kerneldoc, which this isn't - but it would
> be appreciated, see e.g. struct qcom_icc_provider in
> drivers/interconnect/qcom/icc-rpmh.h
> 
> Konrad


