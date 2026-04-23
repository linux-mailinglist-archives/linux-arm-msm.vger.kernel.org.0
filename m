Return-Path: <linux-arm-msm+bounces-104182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GcOtCKyO6WmjdQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 05:14:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C8944C7D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 05:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68E1E3021D27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 03:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299803C942B;
	Thu, 23 Apr 2026 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FB1Ln6AP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTAXqqTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CF3B7B70
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776914084; cv=none; b=Qd5qYrmk0wxIqSlybxc9PXbbpMrlZ511SvH8xyAhD2ecByo/rkSkUxBBnidkfJPn+VN9x7vxtSWsNLJBWp6IOw8/FOAmov3MNLrQzzIPBbA6HeJEP5s+UiLQb/9lxbNtQyDOmmxnDarQ77Gjh2cLCWPT1Px+EWJWvPimncBssM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776914084; c=relaxed/simple;
	bh=3twAVeIRu09Yes+lRweJXWGJoomxGY8WmxUkaciImJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/Mg7eR5UGM0QccsRToHgXVjuq1J6HjbSiSow1zMUDZK96dIvnNXSegekCf6FRWWlun7oZ0NGqVq40o155eTANy1Dac3AQE+hqRltlkB/SPYy2pZKDMHFOIIy5f+bc6By4e4Zg9XfqdAvNUJAlnTV47JBSAQkG7jzJv9QZSCGhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FB1Ln6AP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTAXqqTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG6U8r872657
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQXoZzH2+O8sR7z+rdLtaGC4M3a6RTUnICpFU0MK+yo=; b=FB1Ln6APT2F/WLQJ
	rR9FoC0vumAGkSwy77awWj4QW91/xzkwLL6cWLA5F6Y2+HKVw756w/uZCoAzu7GK
	iuv4zbvZfQ33DtfYFvJNSMK6LK+vz7x6k5xkIOqRAToaTsL+PTmDoB4W9BF7ASsn
	darEcAW6dLGIHxoGqUqrSB/bhtWmGETb1DUZpMfmSyzVOlycB0Ew9Urqc2uvzy8N
	T+HCXCO1wNb5OoVeDXSK2cUIr8nwSoBrkjSEf7hIEaOa3hd7/+heJbZZUEtZwxZM
	DyAOvGvSFgsDfh4UlRVB6D+u8Ol8e4dDVknlaNqIx4j67WLYgrcJxCH+fxpgSw3Z
	CVXh7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh1x3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:14:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b250d3699aso127775635ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 20:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776914080; x=1777518880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQXoZzH2+O8sR7z+rdLtaGC4M3a6RTUnICpFU0MK+yo=;
        b=bTAXqqTrUEUXXQcURlpWaIGNaZ+JXqbwUUleQTMmkKC96k7QdCpvaGk5C5RMp/uGUG
         BcPSf3Qa27ybUD/lALDEfVFOd7KSGhCT+qjrDTYP/bWr7mgW56cK2thU7UGB+fK3JjXZ
         b5B0FSmTwbyUt2K+RWXqcMHpMZWmup+3O5lRX7EmcsZS/Tid5dKewdkrhnmEKtSuZv5I
         J8MSRjhWB/ZotJzPiEsJ9Yfpkae2UX7b6Cjx8/T7Z4apHWT9S8KcpwnDlEwj6P9v2Ivd
         FsFqT2QiJRWVqmyylxbnSQmGniR75AsCIPV6FAnpGFaJdxj4o0EWGC1iz5YyKRVlsxTO
         qXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776914080; x=1777518880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQXoZzH2+O8sR7z+rdLtaGC4M3a6RTUnICpFU0MK+yo=;
        b=RlztdfOTYK97A+4ob36wtz3Cs9+vZ/iWMhcvv5XTRsf37Z1znMScUMQfAwHPgoAe3j
         TqY2QEFmEITDGA5iJ+REZS5VMhpHyrnEFVuy7l3qsWMvYN9dxrmfRMyvBRxm3jQjHhJG
         1m1wdqSyxUOebEnHjdr++iRmM3P/b7OIFy2Isbd2/fZaTbHh/xMZALgz7CvjbPYslRYU
         wugk3gCWlmZLQIda+YwIQGdxQ3bHbW9fRcIyGVEeZlu7J3GxVlnTzLhbmRi3A8tEpVJe
         lqqwqISf1SAYclmhkKUw0tLXoUDR4L/+08lOYKRXYZvt3uMjOklx1a7LwawfgRLi2aBI
         69Yg==
X-Forwarded-Encrypted: i=1; AFNElJ+2IOySOgaXkDac+8bjGaEBjm6v/Szuw2DEkvWSvXWfHU9FOlw3paMh4sX2XaO1qvN88JMl6d+fRO31cHIb@vger.kernel.org
X-Gm-Message-State: AOJu0YzdbAIu/QPvqPlhcOnCc+F+qHyCdd+6sh71rD5e0OUQJjg7GgOC
	a6gA2A9CHgrRi3b3noP0yIt72UCoojrysCDAYiwCQGDsMR9WBUzEqgT+KMIlGKD9PL2PY6ygxbf
	p1+lFycmegkxLRfD4QwffVSynWPf+DBegfer9mbyh5FbKHX8o1tsnrdQe8PVfMO/JBnslcrcz2n
	Lvlnw=
X-Gm-Gg: AeBDiesbnDko2sYCa/BWuFnd5JEl8osmOZwsl80/F0GSYSIND0Z4FvUnPQxjdrumI8/
	C7lT6dSZl1U05eJySDj1ylhfsosw+kP5ddFZZRvUcQm6L+NMh7+TlaYXuD5FeQd3qITNvGVnKuq
	GXygHU7HOpzxlUH45nY4aeqTAb5Tim1iyNbHFMhNFomkLqml7jo2QjZuiiHSt4mbTyvSjYByeHb
	gzzO/qXxiEZ89lR0Yc73qf5Q81WTgsrP6XwViWR4nutk4GOfJxf2HBYKZYz2npe2Oa2pIASNxCL
	vCq4P++8o56Tz1xU8RAQ0RbODgsCKN10SU7bgzfChIW/sKSWgYsS3Luyf17rtDyBPqEgwulxubY
	FO3G0Twms1Z6ZVPW8IA3lkVhK7XsTVg1vu2D8pBb9JT6v2CjzCyqfm9okZrNVnA3+E5v0Z4v499
	iwfdQLPswu8e7kfmdMCBca4ZePIzwy
X-Received: by 2002:a17:902:e746:b0:2b0:5a4c:7263 with SMTP id d9443c01a7336-2b5f9ef646amr297765035ad.18.1776914080490;
        Wed, 22 Apr 2026 20:14:40 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2b0:5a4c:7263 with SMTP id d9443c01a7336-2b5f9ef646amr297764635ad.18.1776914079967;
        Wed, 22 Apr 2026 20:14:39 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa3073asm170173705ad.27.2026.04.22.20.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 20:14:39 -0700 (PDT)
Message-ID: <de7b7d37-c556-4a2a-933e-42122ff7765c@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:14:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] phy: qcom: edp: Add eDP/DP mode switch support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-2-c38bef2d027b@oss.qualcomm.com>
 <2cyvdtnnmrfz4zffhikfxl2goyby73gybgm3ih52rfpyvbhnzk@37x3g26o2t33>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <2cyvdtnnmrfz4zffhikfxl2goyby73gybgm3ih52rfpyvbhnzk@37x3g26o2t33>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAyOCBTYWx0ZWRfX9e6L6F8DBJkT
 FD6MJ6USnphe0/2fwVs/RmtvKwUoPOge5YMGVk3AU7BsOEvFVlZ1wgr0L+hRQK/mjdnm9fJXwi4
 eF3j0jn3zSJhcZS7jrZw9y98DccGFNQfDW/798zsOin4pdudW4DogkU/43QJOmJRXvFxjyGmGi0
 SLZZjCvlqutFoVtYTBLApNHL5n/gOR0WFRS0tKscaEnvWA7NJ8TOiSk7iBZ2x1kbYClZ6a//X5c
 72AC9qNNQIH7hm6mezvu275sUToYV0i2B9BBZSjn6Wih3ubpb5jvjUfvtqPaqlNg2yAwm68jCdu
 EFlMpXReWS1n76ZMISRMWpv3MoYcXH7THPUQEN4YP3Xjz6EPPU3pYoI6165TO0NgebpasQWGWTC
 0SMgCzJQ/MyBleRh1KpuT2eA9a2WFuUgAPi97sR0znXRt8w/zx+Vzuv2+8W0FGpmN7tyez0P2fl
 JPKtJxw4BVn6GXZ6aqA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e98ea1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GN78Z6GrLXGed5ov1boA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JJm4lUuUhS1mCoPV05_5rG3mdoKpo-OA
X-Proofpoint-ORIG-GUID: JJm4lUuUhS1mCoPV05_5rG3mdoKpo-OA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230028
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-104182-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69C8944C7D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/23/2026 12:14 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 22, 2026 at 02:01:52PM +0800, Yongxing Mou wrote:
>> The eDP PHY supports both eDP/DP modes, each requires a different table.
>> The current driver doesn't support both modes and use either the eDP or
>> DP table when enable the platform.
> 
> This is not quite true. The driver supports both modes, but it uses a
> fixed static table for eDP programming.
> 
> Other than the commit message, LGTM.
> 
Will modify next patch.
> 
>> Add a separate set of tables for eDP
>> and DP modes, and select the appropriate table based on the current mode.
>>
>> Glymur's DP mode table differs from the other platforms, add a dedicated
>> table for it.
>>
>> Since both modes are supported, so also fixes the table mismatch for
>> X1E80100(eDP) and SA8775P(DP).
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 3f12bf16213c ("phy: qcom: edp: Add support for eDP PHY on SA8775P")
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 46 +++++++++++++++++++++++++++----------
>>   1 file changed, 34 insertions(+), 12 deletions(-)
>>
> 


