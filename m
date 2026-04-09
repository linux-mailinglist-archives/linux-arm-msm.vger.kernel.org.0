Return-Path: <linux-arm-msm+bounces-102523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAhuDanl12n8UQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:45:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 954623CE41B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 19:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A98AB301CFCB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 17:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEDF3E274D;
	Thu,  9 Apr 2026 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osiu1T1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfnXMnQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBF02FF65B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756703; cv=none; b=ZuF+WPPIUsWgk0t8Cx0SnehuPq1H5Vj31a2zXqyZ7adeynmGVZWleFQRHQQQKMfIJuduxrNO3xLZ3J9Dvn5HYCpk0Opce9rcW+YnpvG8vLy2ZqBkhrwGRo0TXsYH5BczZswersqQE00je86KUqOcPqKckeHuSRe16AxNMqSvv9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756703; c=relaxed/simple;
	bh=u3gUqEFCqBFp1uYEWel+zQoXaVkE3Zg5KLkQo7FbJe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryf4KETRcotr7DXx6XdB5PHz21cPkLa6SAD08VG82bimygUgEuAtxfXmaUIYi24RQc45+4/wNGhbxi/2ZhZT/VSWMrkmgAxsmNhLUQ1kJSqbEu9v53ccEHypRgtNvEzhA8wH/VIg9NrdbaNsYetgybgdEpSyUU2lA0CfgQE+dgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osiu1T1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfnXMnQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CxEYC1433247
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 17:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=; b=osiu1T1so6UWTxBQ
	LaeNqQnw46yuogd9E4IY+PxqdIU2I/S/1Mhaki/D1WjyoKpVNJsbKCNQZILLj0cn
	amw1h43ICKhDkuivV1jLCYuPp99BNR2T8h8VIyOOvu/Z0X2ONrNgFK6+KP3P7y+M
	8DDvaCfGeCvv5QR7tdmybH7G5CuOWgEFlvbEdPp6Z/27n79FjCTLRSFa+uyxyrm0
	I2QuwUvodW4Imnw1ZiAaF0Tx2f/1PMCtxG/KSKnls3hwv31yqv6jFbDzIOtOfAEt
	aiNgcIAZP3vOjjMNixupCT224BWqIAbMJOCCRlBhEHzxulI4Kpj0x+e2Uo20jBlj
	3J7LCg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckf946m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 17:45:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e9b4d82so9734595ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775756701; x=1776361501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=;
        b=HfnXMnQZ6Dl22VeCPKA4faANkDrj7T1SXl+ja+AkzMOI2BjnyUL6bWvSUtwhzcIuI+
         11nlsPyH4MTL3GHvVOue5hiLqdDmhFp3xH/gL54woTtl7TKvdB8JBp2gibZ0PdBY9XRD
         38P+cbNV3buePU73zRS7pqfrUFuDuCIJnHxiBmcVqbtl3EqXV+r/cdXxsmkajVX9JHTU
         iC27oAHVg7WZeTqhg9+GrJ/J4zeuni0gAEdwJIopWhYnwE30EJz4HNvLb2ykKpZnYCeI
         Lk4n9AU7ptTdqx26zBxKV2eYfoxQYU9LJGbSCo6erdzLvAGe1fXJCfrC0d51lRLCsxjV
         BFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775756701; x=1776361501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AT+00vWoxNpxfSNM3zgM7mAp07cFBxlUZE2M7om2WQo=;
        b=A127lVqm01DDZNT74/1OnkCjzFTrHdhOhMF1wPhraT7C1WbffuOfYA8WtxUWW4LdKk
         YGmrWvpux6v7VZo6L1b6N62TS07P7nTavmTAKotMn5IsRscJBGM5206y/DUfYOl79wfb
         Jdvq7+Vc42hWUi7Nx1Bv+ffR1oJyjH6duck3WhmXmj4cFKT3fb8cU1xU1JqWY5Ly/KYm
         6QKcU2JRV1CYgQ+bqhp4nFYSBn1qSzvX36LiYpGWE1xM1L1dVFGbriu3m5tQw4KUWZtf
         gcP4hSNrMzpyP6HoTtW8pONzyHlwP0ELCtH2N/BJU4EL7DlMdE6DUQeq3IOVPoi1a1v+
         S3/A==
X-Forwarded-Encrypted: i=1; AJvYcCUCFVNwrYjw40cO5oMtHZgyPlHoycBhURdY8NKKaccWmXdOO/mKHKi5wawqIedaMZXXNYLa+WdyilJ66x8v@vger.kernel.org
X-Gm-Message-State: AOJu0Yz519oPYCEi3V3rRdboXXnS3ITulRo7Ghbhgbdj70+RzzHvjWCl
	QbJYHmIPMTgOzADTas90EaImXMrFHWp2FT/aUrH9HmwP3Dciv5NEUj6FcussXPvCcgn+U0+5lfq
	0ZE2+GInoa+p/mdjJ2q3cRe7OKRReqsCV16kBbFd9ksI/dTO4Rgaa2JEW1DwBXf27VqHW
X-Gm-Gg: AeBDievLRQEJRHxf2krXfRd7wU3ToQvNkKmMHaaXbbjINM0u5rJrXcsBIYJblYy4z3w
	YWv/DOh+aevZ2wtYmcsSKV+8X8T7Irr52mgOR2d1Vgai+z8AvnR9dgc0jsZjcmFIXq784lseW9g
	VPAFXEXYF7A9z5Rlo0URTVEGQTbRvhD4TNrzJh3xqw51GirCg4p5WMaEWewTCKvY92cM+TEsPyF
	Ajf63FafoB3cfZaOHpMYoUEJOtWW1Uc6W5vziFVkLXjVnm9YzyHMXYHEmFkhBJknsvsrGel+37H
	6S5drkTBjU7D6b8AO0vNz6LrVtwDZF1fOg4rjI9f5k47e4/OpzqdfDmb0TwT4bGuZVbyDhMtdue
	k0BMbpaq6m8IcDXk4gr10JhhEj01b+YY0SGhm5WyHhM8PYtjpmA==
X-Received: by 2002:a17:902:ffd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b2c73474b0mr38712775ad.16.1775756700541;
        Thu, 09 Apr 2026 10:45:00 -0700 (PDT)
X-Received: by 2002:a17:902:ffd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b2c73474b0mr38712455ad.16.1775756699932;
        Thu, 09 Apr 2026 10:44:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2ec20sm1392665ad.66.2026.04.09.10.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 10:44:59 -0700 (PDT)
Message-ID: <1b17af8a-91c8-4ea4-ac8a-d8e24951a9b5@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 23:14:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver for
 Eliza
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Akhil P Oommen <akhilpo@qti.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
 <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d7e59d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=oNSZD+MgFY+5WZUJqYhveg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=CmEREM0NDXUXjFKD81IA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2MiBTYWx0ZWRfX4NZUclmQwI0y
 SznTGGCcAoQkxB024h3SZJop8hP7YX3OvuzkEScUfjDarpusQmHswg9Rhvq1itthG5GEWAo9Vs7
 BvhoHnjD9b7rLak37CyxxiuAzhuRsJAGzvOMXtFZRZWH3D5wjAU151hgBgCm+lEUmKekZHX8wI1
 xClMUzPgbfJicT9MutMkCknIIGf0uUKBW7ub/7zfcFCDF+p4T3EYHzac6jvVEWOM0ZGa89+PfDn
 28U+ZZTRDhXlGp/4oF2vYns9DpZH0tNvqtpy0ifmxmoze2OCtMK8j/zYRKfDARoEL3KWQ5wj+QG
 1ZXJMl3BEmNxZRxq+FI8JBwjMaWFeEP0fyq3sHj5Diph2mPKgTDtkpvYWPe8HvT7rmy/P268mZh
 ogfIIA7fe66GKT+sJruefDIrZHTNNRIAhgb2BTwf5vBvw6mjnmMEICbLvrSyxi/G4As8mhuts6b
 lHcVtzUluAgVdVDb+mA==
X-Proofpoint-ORIG-GUID: qSxAbPB796gpfcZxahEfpfj2eA1tz-Kp
X-Proofpoint-GUID: qSxAbPB796gpfcZxahEfpfj2eA1tz-Kp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090162
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102523-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 954623CE41B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 6:25 PM, Konrad Dybcio wrote:
>> +//	[GPU_CC_FREQUENCY_LIMITER_IRQ_CLEAR] = { 0x9538 },
> dead code
> 
> +Akhil is that useful?
> 
> [...]

I will remove the code in the next patch. It is not required.

> 
>> +static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	/* Enable frequency limiter irq */
>> +	regmap_clear_bits(regmap, 0x9534, BIT(0));
>> +}
> ..sounds like it

I missed to clean it up.

-- 
Thanks,
Taniya Das


