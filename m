Return-Path: <linux-arm-msm+bounces-112840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QHzAJ252K2oz+AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 05:01:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCC767659C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 05:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K01hXvlt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B+Tb5jwB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112840-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112840-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E611230409EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 03:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31271D61B7;
	Fri, 12 Jun 2026 03:01:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D4823393C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 03:00:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233260; cv=none; b=HSy8U8BhymZeg12fXx9Hguk57UdtkobqSOIEti0xrDRCjpe8DgJEkt69WJtlAhlSTJZ9towELLkJVPx/xAhOvNTEH1QqQ8Qar8DK5PdEKx8GrnaMuWxQ6Ugt+DWIgyyzsuyMp3xqwIE+XDHVwpR/PT6/1WB1ejYbXoFAYkIFKvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233260; c=relaxed/simple;
	bh=ejqs2vcPR76zBzb0TQ0RAYoHipYbI5Sn6UDxEfajQPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fh0bMvnwvC+Es+thGtM1DYHDtwQ3qxvN8zfJWdmqJRJzXhnkmTBiQ/eMz/9ZXHnD1VkfWwE5Gj5vw1oEBWK5o/+BdbJ1d7LslFXBVbjS3d2hz82e2TWbfAYQrrDRCjiYkN5+hkUlNi6aogCVJXa8wqtibMVra2Ov9dZMvY6Wfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K01hXvlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+Tb5jwB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMV2E51964343
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 03:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ohkNRy/pAe7gT67/lP8i9MPg3N+KSvVizD9FWIPxTu8=; b=K01hXvltaUDbj+I6
	zW5lIvcJFDTCNCWE32dGadxFsR9NDoDyqOlzpFz/Tmd9nM9Rr5xWEf0PJhONg+zq
	hxavEzpTLLER3cP637G6CVJGxUAq4ZL7zSUjNy8PSkwp7T10kKvFV+2eznKb97Ye
	c+/+V11SIVbRkGkyQvlgvipZG/G5laNQj7sB8VQPVT7Pe0voauczyjJpgnFH+GO9
	AuB/BZn+ZOKlaxaTlERO5VLlriq11h+7pvDwZZYtI9AQkluNtHeRQemeFbtme4Dl
	prztOlg3MloIXo0TAe7+4+CaS6USOrC3qyDgMrWa2xb9seKTEiDpR7RLSzq9bTlQ
	t0TH4Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29usj0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 03:00:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8428384f31fso427126b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781233257; x=1781838057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ohkNRy/pAe7gT67/lP8i9MPg3N+KSvVizD9FWIPxTu8=;
        b=B+Tb5jwBM7DZg65x7Nkr6HlSzFsLn34ymqZwMTPuAAA9j+LCKJKffl7vEHmpjiZtYJ
         DPERedx1j0Zu8MF6LUd8Z4ZAguQCLV3CWQIMZA537lAWAOVnL+kP2JNjWWSBwsFOU0eP
         3e3BDsLzD6PV67g5rCACK6jMAyUT6jo3NFciwDai8A0k/mi0xzOnYaWumRjaXeSjZ+1w
         9jVERL+yNMELR365d1vm1y6MRtUcuZrbgkNcCqAe0kDDrGvhH6cl/BufzZKyvQ/mKOMO
         ms2+KZuaTpr7txMZkZkhZM+rZklYrMkXLwAethAumblpeuClfbnPAwpNrUiXlTk4NYRA
         Ekdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781233257; x=1781838057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohkNRy/pAe7gT67/lP8i9MPg3N+KSvVizD9FWIPxTu8=;
        b=OpECExSpUHci4EwYAsL/ve3YndvtqL4Epnk1OJMIj9ZqZJFdmzi8xhl+bS8TD1fqfi
         HdkZCD4YwokhL26licJLqV176Dy6ipe/vKtNRaBys59PNECoPC/vP+Gvkwci7S87hHOP
         3ZdnirkhFDcMw04iromCpzR1H4OyTbd6obEgBRMVbIVf0paGMxqFyqk4pD871ZSJw2HU
         KPQdZjI8pdbA9fRTM/nYV4PFx0wmkGn9V6BkN++msPV0WUdXzQkf1gn9zDVW3+BdJ7o/
         sHw9OKSkfd0xMYVzVahP+lLhxUzTO+q7/WXD0JMz6cWKELmL/U21snAy87uQwQ10s/L1
         3R6A==
X-Forwarded-Encrypted: i=1; AFNElJ8vTYh2xQemNMkR+H7Ka9tSj6QN3oQnT950zxU0YcIKEs3X3LjExSKg1WiW+H7CUdQjzhOcttH14Dqu1HD8@vger.kernel.org
X-Gm-Message-State: AOJu0YykQl/ytlobECd+8WDsjoVNv/9Kai8UBKNPqaR/Zh2i1SYDTfOd
	v/PbIpREj5wr5WA96f9BVeKx1zxGze1RVM5KRmx3Rmg2tHMg0x/T2Twx5LIBrA0wFuE84CnyX0q
	T5XR9n9freJuYePUbUusy05ZFuv2Xr4qj6FUiW3Mt8Of2R79HslnoGkPMf7LOeR7Z/tw7
X-Gm-Gg: Acq92OFOjhk1EmzDKzO3+nAT3qQ6pTXgLEiJxvGD4J8yEgzOToYhGRf2q7XF0Gj8zqd
	htYvLwEnFFkfPdegWFhe5t9qzDRuQ/YtcnZw9iKz6OPAkxBaMDW69wO/OMUhb/PP5ZoOGD4uheU
	IiqXpRQae/t3MY9T7ick0BzXCKO+QcqqZIleAA57NZR4dGfYdbf9vVNvT0VDX3tt3L/YJfk6uV2
	B+kelKYOPvkcX5pz1eC88+EJ9oi9YtJQIA5CEQqpqL/fQNBqB9Ndjb954PbOwYUzsnprgNUX2gA
	mRTWDqKXSqzxBwQLa3ZeHxYw+cxpMTCXccPT2+H7JjR9A7Rkq7IOkZQ2ax7UWiOsUqdFMV5ze9C
	LLaCCFOPCifD5i8zx0Bfs73nfngPc+mGGYbA40Tyy1w/qzza4c0FF5eXQPLPdQm8=
X-Received: by 2002:a05:6a00:1391:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-8434cb01ac7mr914526b3a.6.1781233257132;
        Thu, 11 Jun 2026 20:00:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:1391:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-8434cb01ac7mr914476b3a.6.1781233256700;
        Thu, 11 Jun 2026 20:00:56 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acd96d8sm592157b3a.19.2026.06.11.20.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 20:00:56 -0700 (PDT)
Message-ID: <a1fd6b27-6aaa-4246-aa0e-4a9fbecafb42@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 08:30:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
 <367u4tqrx4wkwepm3pwlbdbqhsquilhmloxkzugvgmzk2iw6dw@ul25u2ynoyzn>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <367u4tqrx4wkwepm3pwlbdbqhsquilhmloxkzugvgmzk2iw6dw@ul25u2ynoyzn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAyNSBTYWx0ZWRfX5xtb16NvLQ1V
 mDqBLgm+Yu1qxandjh4abl2Hv4hdwoMTLgPmuMaklnqK2C2hIMLOoPbH2BeKf4xTUiYA3xevDze
 931D4tAr6dm1KxK4SHsWZPt8AbNSzHs=
X-Proofpoint-GUID: S9ZpNHKP91FYVZDIAQv9RVJjf3Ghfck8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAyNSBTYWx0ZWRfX+aKklZH4k6cK
 HFJqdLJIeMEbk1wJuwMyNYof6YdYW+vyTh1HIZxj7eJVAL411m/A1K7WrbNT2Q5nrfEcDNGkJ3E
 qtXUakf9WlDyO1xdEqcTObNsxicHHHnl9dH5MIxPdtAD859AmjRzZIO0vpCafW26lqiwBRkg4T/
 QLyTReq1QAsaCvZycG0T9CHm48oktHgBLaMi+5cys3ah/WvABZEkrSQxXc6bfDtC7fLycSIAb/e
 bI/VAX/yVvaw0+PWHSX7GHOvjV1v3LBEroHBrBYOPsDvz/27Pe4j4tvOEw87Dk+oG9Rx3G5aqnT
 NSZ8XxC3U+YVvZ5e3XdceUXK7V8Tnumd/VsyKMUFkIBFJ/oit7W+8V12Cy6FyX81s599R2bV1JU
 Jb0rlsf+ysKXPIdizYX9kZYjpLJcL04FGDeyB8VmZv/plhWd/gnNN9v+gWSLIL4tmkumDgigDks
 Kxvp3MOjlHaQS8WE5dA==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b766a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Is6qsO8886F9CyN_g2gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: S9ZpNHKP91FYVZDIAQv9RVJjf3Ghfck8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112840-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BCC767659C


On 6/12/2026 6:26 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 02:33:18PM +0530, Kathiravan Thirumoorthy wrote:
>> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
>> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
>> enabled on power up but that's not the case for IPQ9650 and we have to
>> enable those clocks explicitly to bring up the PHYs properly.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/regulator/qcom-refgen-regulator.c | 89 +++++++++++++++++++++++++++++--
>>   1 file changed, 85 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
>> index 6a3795469927..e8821f159ff1 100644
>> --- a/drivers/regulator/qcom-refgen-regulator.c
>> +++ b/drivers/regulator/qcom-refgen-regulator.c
>> @@ -3,6 +3,7 @@
>>   // Copyright (c) 2023, Linaro Limited
>>   
>>   #include <linux/bitfield.h>
>> +#include <linux/clk.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> @@ -16,6 +17,10 @@
>>    #define REFGEN_BIAS_EN_ENABLE		0x7
>>    #define REFGEN_BIAS_EN_DISABLE		0x6
>>   
>> +#define REFGEN_REG_REFGEN_STATUS	0xC
> Lowercase hex, please.

Ack.

>
> With that fixed:
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks!

>
>
>
>> +#define REFGEN_STATUS_OUT_MASK		BIT(3)
>> + #define REFGEN_STATUS_OUT_ENABLE	0x8
>> +

