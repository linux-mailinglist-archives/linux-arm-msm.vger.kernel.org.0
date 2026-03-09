Return-Path: <linux-arm-msm+bounces-96220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGFUBZuqrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:10:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA449237A20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9F24301A7A3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C98395DA4;
	Mon,  9 Mar 2026 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hauCw3U4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cq42dW+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEACA396B91
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054616; cv=none; b=C3fidw0T6jQnrdMu+76HuFesrqFb3n600lpfNS2xhzKVqPItzM6NfdL0u7DdiDGsiRpSYRB9PTmRo93aZN2Rb4qs8bNUJQBVExTcmwCmOIpeh9h+nG1NuMBWUxxRCFe6AvbMLS3hD+EA5nez5ZIhbntP0uhYV5297Hv1SxNKVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054616; c=relaxed/simple;
	bh=iyAEtYcmGsyywqIMraEv73+h8U2IOp5hiEl7qsT6WRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=In5hJ+IElj4VDzQ/MqqxS3rD1mlA/xHZo/u2WFC9MvVhDGgasxLoQw4WfhoCXUvRUn6ol1qEMiWQCFa2QGZ0b/zlmd3f88Az6H0bhcdyHa7eK9UW8yzxSmQC434nNjioJ3IzKBIaikzYypKu+9RNiznmcFh7o6JSfYuHO1qSpYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hauCw3U4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cq42dW+N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62986Xlv3462759
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCIwqs8E8Q7VHLpSSyfHaG+lQ+pJmP5Ydl3CjV26bRk=; b=hauCw3U49n5p/ZgD
	zSX5aoN6Ozz/g7sN+5DiRAEwmPhgEouy0m10/5AYeCEtgdtMZATRpH0A0lup+jAK
	3egRmZxX38xDg5Ccmmx9rnQeL8L3sagcVeatO9TV8nCQ4btqwZdfZUCKUBsE0nbY
	FI/G9ZZa3h9s4wdyBzdHdE7wXnxrSA50HKIgB+sM+H2XdkNVVRI7qEKzTa6Oaq33
	tBh/8wfYfl5ICQoYcroI9SflpO1M64LdOA1a1gldyubSsWxQMOgrQdTyXKG7aaT6
	bDHzkTzxsH+PKstG/gQaiPf4wn5GMqrKpYsm5fkQPyg6qAK3FDnPxICqxU/rp0CV
	9IWKDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8d23y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:10:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8dc8b434so36939385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054614; x=1773659414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCIwqs8E8Q7VHLpSSyfHaG+lQ+pJmP5Ydl3CjV26bRk=;
        b=Cq42dW+NTUcbYxZR7RqRLU25dn5t30xbGN7tniJTFRCROZj6irIkYGB+4V22J7nIQg
         hzVkqNpJNZUhv4yaDOxlXoHlZGis9/t0hbYqYMrXp4QwoUW+LRaK3SpL+Pb/gJCo0gPP
         MNAe2/mQ4BrVG9b0ih5w3DLk8Y3/9lHh91FWZDuUm5FdC9cdyX9UK3vjWHJN/MMGkCIf
         a8PcNeXzVONTAQHXT+UBmXmV9s08pw2np3qE1/X4A1vT8JcFTzfZ5hZFdZtXQrW5VLyC
         tD4AQ3PJg6HdFCyNNoY5C2YPsCSPPDc8cizuYdfcr+CKCHTjeEtER4umbCwGQJe/h8/b
         rsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054614; x=1773659414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCIwqs8E8Q7VHLpSSyfHaG+lQ+pJmP5Ydl3CjV26bRk=;
        b=Dw/yZfujrsqd/I+EYxAa2VFzEgjwA6dBsUhtDYade7+FcwgGv48/Gldv/ND/zH7WCw
         phxzVl4x9/BytvuJnqNuMNKL+ED8mXYMtmzWN47ij+0ghVmgSXVpXdLkZc6vnzrYLD6r
         CuYrrQZsVY0k4f7Y+ySztoFcGmQZlfneufHvOVj6hIusMRuS3P/Fjr0+xvSJVt8ERR2+
         sIYGE1phd6wfiCEuszdC8tHWyWXFC5U5DMLNNlEgn1h7Lpxz6YTZCDJSIIawRnNpfbSM
         FvPGXTjBwqClLam2e4y8l2rY84ERpDCeKmZinej4q9go6NhM2rm8+a5VMOXrmpXZSaJk
         WfMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3f1P9mWeLe024KR7sIKmAJNHg8t9LjothWUXdSFYWDHAURatBoBO6RztqF8BbjnP6LKC+0byzaYGNWbH2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9javjbT+sejp1BKNyuGq24deBHfVgF3txB+51TemKMzjGvzrW
	afQ+uV8sIawZi5zcbeZ/2JPx7iCE0DnsYfK0Tc/v6Dzzlu+k/tPn64blzeSttNJbZWu5Ngl1Yl4
	CkOFH3of0lvZnLeHUgHikAnHomVm1qYJRK/psO0yfjByjE7FQbjUpjiwwGc2sU29GneZ7
X-Gm-Gg: ATEYQzyIwzdmkC1Pf3D+/aJEwFkraFixqB3YxTfKjeXK2eh4PyKrECnXfz67XlyyDPN
	P2XssMH/PZL+FjySj8hf++yfvNtKCAwP9bz9g1Rky/GCBlwgwTgNBgZjjzQ1ssTXKTKD9dDx2bg
	JX/WxJa17sdKs0UIf4yPIF0RdtjW8C3K3MTs2YktHGGB01LKYJp9/PrWuVie/l+cTgf+0Ta/HqC
	7wRAK5q+SDHpYVci4Pqr+ncZdVs39wjEdvH8OFUvSy0k4H2XmprE9PFOtkygirTpPRU5z8ED1Fg
	F1xqWdh+X8/Nl0Lgx3o1xR2Jp3pBE+AXznMEN93F+Q0UqJbZywIURsn44ey4pmKttNgQ2bfHopk
	dQT+I/sBJiNn3l0yyBHrzduUKPJlQWCZL2U9X79/RrVpvXDelE7OSx291gSj2mAgM2M0niUXqza
	ZUYzY=
X-Received: by 2002:a05:620a:28c6:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cd6d49bcdcmr999577685a.10.1773054614121;
        Mon, 09 Mar 2026 04:10:14 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cd6d49bcdcmr999574885a.10.1773054613709;
        Mon, 09 Mar 2026 04:10:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e87sm3125513a12.18.2026.03.09.04.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:10:12 -0700 (PDT)
Message-ID: <d60503c9-0bf1-4cfc-ad18-66ee98a24d8e@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:10:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jWAXbCA2glPMnaPGSI3EktnPnH5upv2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX8xzRtgK30v9A
 MbMnzKu0OP1Qw92ohrfRfK/EX7LL5nUn01ppzNPybSxNRKyGVdUYEFcrsx0IT4kduIxsIty/jqt
 GfnRi8peJ4MaScvvHaajynRcc/yPv/c73xC64Eg5bAn5Moyf/oer55RpYmuhpRM9JVfFDidmgzN
 BeEU5Bcv/o4uguMEZ6UyPIdvGSZNFPy8Iz4iWfVnGUCyI2hA04d4ujT7SIiztFVsewEgyQla3tb
 6jhLeTtT2r7R6Sx28qVRWFqYzcb2pXyExdrpr+HrAqVhde4XQJjwK4BEXMrBdHk5oVEweX9bS6m
 HkBr9V6M4EwHBnJD1qgXC/mZ/34GK2msSfIa7C76tUr43LXgUvwk27CwngoPJ5eJGitaUswVjKn
 qDvLTHDTJwl04Dn+tV52F8miNPkbf6jkzuoNnvxMcPZA5Po7AqJVKQVVB0BuYKTKZv960+sriJj
 nkO74x4ZrKAPv2xzT9w==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69aeaa96 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=D8QFBKxsMTPPdba5kpUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: jWAXbCA2glPMnaPGSI3EktnPnH5upv2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
X-Rspamd-Queue-Id: CA449237A20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-96220-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:00 PM, Loic Poulain wrote:
> Add camss_format_get_bpl_alignment(), a helper that returns the
> bytes-per-line (BPL) alignment requirement for a given CAMSS format.
> 
> Different RAW Bayer packing schemes impose different BPL alignment
> constraints (e.g. RAW10 requires multiples of 5 bytes, RAW12 multiples of
> 3 bytes, RAW14 multiples of 7 bytes, etc.). Centralizing this logic
> makes the alignment rules explicit and avoids duplicating them across
> the pipeline.
> 
> This will allow PIX paths and buffer preparation code to correctly
> round up BPL values to hardware-required boundaries.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/camss/camss-format.c  | 28 +++++++++++++++++++
>  .../media/platform/qcom/camss/camss-format.h  |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
> index 4a3d5549615c..2cd0f3a0bfac 100644
> --- a/drivers/media/platform/qcom/camss/camss-format.c
> +++ b/drivers/media/platform/qcom/camss/camss-format.c
> @@ -33,6 +33,34 @@ u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nf
>  	return formats[0].mbus_bpp;
>  }
>  
> +
> +/*
> + * camss_format_get_bpl_alignment - Retrieve required BPL alignment for a given format.
> + * @format: a pointer to the format
> + *
> + * Return the required alignment, in bytes.
> + */
> +unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *format)
> +{
> +	switch (format->mbus_bpp) {
> +	case 8: /* Plain 8-bit -> output must be a multiple of 1 pixel (1 byte) */
> +		return 1;
> +	case 10: /* Packed 10-bit -> output must be a multiple of 4 pixels (5 bytes) */
> +		return 5;
> +	case 12: /* Packed 12-bit -> output must be a multiple of 2 pixels (3 bytes) */
> +		return 3;
> +	case 14: /* Packed 14-bit -> output must be a multiple of 4 pixels (7 bytes) */
> +		return 7;
> +	case 16: /* 16-bit -> output must be a multiple of 1 pixel (2 bytes) */
> +		return 2;
> +	default:
> +		WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
> +	}

The intention behind this could be better expressed with:

#include <linux/lcm.h>

return lcm(BITS_PER_BYTE, bpp)/BITS_PER_BYTE

"take as many bytes as we need so that we get k full pixels"

There's probably an even smarter way to write this that doesn't require
BITS_PER_BYTE to be present twice

Konrad

