Return-Path: <linux-arm-msm+bounces-101420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKUfF4T0zWlLjgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 06:45:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB20383BB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 06:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59CB7302516E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 04:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F1A367F46;
	Thu,  2 Apr 2026 04:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMteYK4p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5zCe/cq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B08365A1A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 04:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775105151; cv=none; b=bb0c7jX3OauLSH8CbzcDS8tD3ok42Y/tVc85CKZ6uNRySil/OebtPz9rqbeIqabljomnZ2NjAVyuSMiirkPON/hboBHT3hSvimqWGfn0pCG3lOe/4/SGQe4cbyCPwCFNODuVQDpW28ArbSX0vBVsouxQzUaLzY0orxF0Zc41T3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775105151; c=relaxed/simple;
	bh=S2HRWbg2cXokvlJe4+gfE1ed2YFZPrLpddriMACrmZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQZYUWoLf39roFk00ixMadF6c9Vl8GKBP09z3edZBFalekyAPS8dyu5qzyxbMeX3bytguJ7sFVmQHYngbXDHhwIYWQ0caaXutnvx4E1JBFleH87T0rwZ+BY9aUX/yapSMoIrP7PNhaMqt4ixCZyD4I6hk8HPczJ9dSNCVtCEf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMteYK4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5zCe/cq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324Qwwk1551693
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 04:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0q1OJWl3HWaD7MjgKDx2gsOdwwWx/uxoHe/O42qC/Q=; b=KMteYK4pTKOcpS/A
	SI+E4+FvgC8thGdTZonuRwBuPdFmMZrWAY7d864iNhgwBZ5JLZJfsUngZDIo+t9F
	xsBzJoEUxrU+jIAk/HHudRVHc1rLCyvRthyLHiWDZLvwAt/fRb6QcJ2DgG4U9PPl
	D9aotHKObeRZKalZO0S7pZVikiagGnz13ryW7DeKn7lZCSQipGVObio865wEOa6/
	77nKqam7J/ulf5pBOTQN7AOXUE7YLQkolK5vCiuSRkmIaiWVllygwE0g9FSHtQ0g
	Pw6ZhIg/ZSlDWXRuxodJ4YvC6C0CYlomyD5t9VVOHy/LhUqwI/UvHySotiHhX2VJ
	M4y0rg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heer1hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:45:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so540175a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 21:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775105149; x=1775709949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0q1OJWl3HWaD7MjgKDx2gsOdwwWx/uxoHe/O42qC/Q=;
        b=O5zCe/cqoWKPByg7xZktXutMLlm3DkD+sChhrKW/iDAGAFEFh75UrCLW753AfN7kW6
         g1uJagR80eAGQ1rpdgvtPp+V/GfoSWKXKpMz+k91IlZt4DYatQfxIC43LX8H4lpytjIl
         oZdzqOK9r6V2izxpwOi04l1b5DFRQb0PU4PPxOCsfXGkjm5IYHnvRPATteTv9ZAZdqNA
         6fRmLbeqtWBA9vErBvYYQf1rBbJ7LPzDpEZTLaRcnqlH5wUyLUgk1Kn1qb2I0KmKJ1sa
         jF5AM1XyolOfthZzKSB3BfkMy2yMKGbbkWZRijrVxaKPiR4wVJ9XwwmbXVBrYwF0joSp
         WmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775105149; x=1775709949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0q1OJWl3HWaD7MjgKDx2gsOdwwWx/uxoHe/O42qC/Q=;
        b=bgxEZPs+an9EKAh4UBai2BULp/WTG9MR8Eg2RxEheGXR5E3HvyKpCcFvGt79SNIobj
         9ScpgVQeYo2KxLz0PCRuZARxj2OxIUxemogocDz6X9g5tPAdDyOi7zw7ZwxlYLPXQaq2
         RWI5fNVJ+iR0g5DXLRw4FZT2uJmJ67v+AzBiVufhGy+3VvkVBRj4IdLcE0dGpqsl5Ddy
         mFEyxOe07v0b0LORlfZQq/TPJFmXxUHcHj8bgr5Tb0U8vSa+iE9HtmQlHgYbAr3pfq2s
         Dc2E42mfSOINgQ1fbCrATt+z+ICu7TqTrRAvmJzlE9nn+lRLtmKZ/cSI+jvO8s42pv98
         gOXg==
X-Forwarded-Encrypted: i=1; AJvYcCVCYTznmxPK5F2zWuWmwjxVIS/SqpLo3+wSl8OWOjGWXUP2A889Y+o0SvDgY4areHZK4n2VwREsXEXN17fF@vger.kernel.org
X-Gm-Message-State: AOJu0YyNAEJakUKhvMDRAUR4UJ1ufSIyxDEwL/0J9jSDxKVFG5w33ReU
	d3WxXwJm5HIhf0jkQENH7rjoNTbBgCt1AOErG7jad+mGmjWqR1wKA0NR3cR02NB11jq/+HbnXsS
	cZyir0Ov19lJoJ2cqtU9w72AlyAXYCCkI1sBskPGk2iFD2Y0LIVNNLEzDKGsHKLisika2
X-Gm-Gg: AeBDieva1zA1T1ZULLXj8f/Gh4ozqr8tNhR+27fR5HmEU9b1nnfZ9guTbIHd48JGQhX
	QindPqIFww8bSYyNuUHqwosSg2ZhIYe4H0Ux22YZPeS1Gum4jUU13oIPGwSL8TKm/T9K5x0XKt0
	ON3USglrx+6tP+L/Xe+oiQO+VHbovO5UOLkMNYKcQ8TDjgehMP3yJcjxfLCIaeMDWsDcNVIuq9C
	TkIsgPLNxXp0R/4/GyyKHEXEMuJ/tOETPe24tm3eLeKq5rxS082UUhUjArCchZjeOTT+OxQDcMX
	zxTe7J00Q18rv7q+McoaEOATk6RM6L7GiW0M3DN94eYTkHW2UZRuSIPTz2dGX3QjMmkihliwN6a
	w9Frn0XrtWKzBB2wFIMtX0xp7PL6UvfM7rtE5tWH5ESqmXUWbdfbXqS+zTUnFTSTPv4cv8D1RmY
	ObSltAyVls26qmWQ==
X-Received: by 2002:a17:90b:538c:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-35dc6e9aed9mr5568996a91.8.1775105148986;
        Wed, 01 Apr 2026 21:45:48 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-35dc6e9aed9mr5568970a91.8.1775105148512;
        Wed, 01 Apr 2026 21:45:48 -0700 (PDT)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f52c8sm1300532a91.5.2026.04.01.21.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 21:45:48 -0700 (PDT)
Message-ID: <f54ec155-fe62-42a3-ac17-f521d419c0b1@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:45:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
 <ht2vvduvxvz3s36cn5m54hv3zon7qelrgat3tnykfvqi7f56fd@t24kmaliap5l>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <ht2vvduvxvz3s36cn5m54hv3zon7qelrgat3tnykfvqi7f56fd@t24kmaliap5l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cPF75rCH76B1ynGoC5Lcs4x630jclq8j
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69cdf47d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-zmIaJwIKKk_Kx9d9LEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: cPF75rCH76B1ynGoC5Lcs4x630jclq8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzOSBTYWx0ZWRfXycezDZYsfQT+
 M8+eszcTaq7wVuT3qLu0DNoVtq7ntHTxc5kPRTYwMXp0qtvvH5HCNtuoWV5mNrCO970DjHRrOTl
 L2XjZq3/A3sMZmZkuUBvbkd2bSwV/q85P4rcBT0kDTqmFCYW1uRAeD+X+ng5GRET1GqKsYmJLMW
 iOVPVHSMYwa0ccq/HzXtNtLQNZ4lUQgWe5KIhcAuJDpCx2e1flvMCZXKLBbeP2oX8M5w2Q6yqnW
 evrh9O74xS8xS8KaJZnDjI/Ctpefgl4fVMvDFqfsJBCYYn7ZrrUJ+zrSqms8u7/L5/YTf+OAxv2
 Qu+c6SFw+On+/xDl/lGq31xa4ErIInYOFLHNf2htHcagiDV5Bpt5r24sKXi9x9sSJtDrTBJDe9a
 AQ4ZALszLp7uCYs/4uO4BZSmYIb1NP8Tqy2/DemNe9tQmG07YRyAyS086f4C8KOkewFbSqGmoNx
 RSd/pgH2xZS+1VvdbGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020039
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101420-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FB20383BB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/1/2026 7:31 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 02:15:31AM -0700, Fenglin Wu wrote:
>> Add the RPMh power domains required for the Hawi SoC. This includes
>> new definitions for domains supplying specific hardware components:
>> - DCX: supplies VDD_DISP
>> - GBX: supplies VDD_GFX_BX
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> +	[RPMHPD_LCX] = &lcx,
>> +	[RPMHPD_LMX] = &lmx,
>> +	[RPMHPD_MMCX] = &mmcx,
>> +	[RPMHPD_MMCX_AO] = &mmcx_ao,
> So, should it be just mmcx or mmcx_w_cx_parent ?

It is mmcx.

There is no such requirement to vote cx before voting mmcx on Hawi SoC.

>> +	[RPMHPD_MX] = &mx,
>> +	[RPMHPD_MX_AO] = &mx_ao,

