Return-Path: <linux-arm-msm+bounces-114837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GJoTKIoCQmoqygkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:28:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D46D6070
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:28:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QIfMRKQu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=exLMq1dO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114837-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114837-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B10843015873
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C83380FDE;
	Mon, 29 Jun 2026 05:28:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F70380FC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:28:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710906; cv=none; b=XWnyXx4xU5ScDzCjhqb5yLEN5j90mLP+ZdMi/b9I4ui8N/GHJ9EAgoW/F6X00a97EgTC8d6XwrBq4JS5ictWT2dgcErh6viFqkJUU/iOiSaGrkLas5pj/81wiqkCicuoFKd++MkB5Em3VmVEqPsFCB+Zl4rS0+A3DTwcr3Fbfno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710906; c=relaxed/simple;
	bh=22pHOjPwfpkrnRKqKZ6kJygTzZPaqHLMrL9gtFugfPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YaK1d7WZPAyAe3JBRcTVp3VUhQqPKzv50yGkIAyKPPt73sNoqu0aTYBEepgwlJp/6bsxhWKFUvtSryAwkNjmjFciJaY+QdwB5Ue7tS2M7OEdYPK0xVvKphQImtdpJSEMgN3iUwzTCxHxe/kVAjI2Mm6ReVRmQaIfT2tXUKkfoP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIfMRKQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exLMq1dO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NEhe1729595
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUWOqqFdnUngv7b0SfgrBihQZEhkV7SqU9Rp01Frz64=; b=QIfMRKQuRXO++8PG
	fWWNjMJkIasrGRUI2xv+JMX3OA+bu2Avcvdr8DoXHXC5ErrhN+TIwReXHoYlCbgb
	O1jPlWRgUjBpEbUGo6wyKehII7anlO+ouqWJC/t0mSSHPVWv+FpLk/ZypEA1UWZ5
	gc+Aqmb+g2gllGjdqXRiGBYsWP7LEelcym92dEOJOSHjo/PUYI36ueHlmK7YDCKl
	9jV1kSK2ZHDad8MbF1iKeBBvNWUfb1lbzdQ5dbVN0n2duHXucAvcEIiFw5jW8ARe
	OQ5lsVljeUjX4rZi2i8wElBHlvH+P1P9soHW5TOs9/SwWmvjMN9eliGZelx4jFVa
	XdxwwQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7vgvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:28:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c1f6c5559so3292357eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710904; x=1783315704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TUWOqqFdnUngv7b0SfgrBihQZEhkV7SqU9Rp01Frz64=;
        b=exLMq1dOMxKmhmG8s4lwsjK1AZkWp2vM5hrtLJ/hxdzsQXB+osikRQUnGKl6xyOPA6
         4A+UpgiE4v1D77jp8YloQ/3sSh2dH1uI4E8Rj3njcxbzN1upeKHbKwx+JPZO9Nygeegu
         MJFXs7bq8W7XuKQxX2pBoXZIZpZlunyaht/hy4o3oll+gDA4xj+rL4d2+yKKplb7CHal
         PbbrKLm11G40T2cmNP5OHZbSVbAxtNHjpVxjfEpbDJMQBx6gJbH/DT/XxC22isSDwY27
         P4MS98c5sG4hQZJZU8Z+5e6BgJPZIrncwn9hIR1cFuKFZk1NTqUhTRs9Q8ye/OYzAJM/
         GEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710904; x=1783315704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUWOqqFdnUngv7b0SfgrBihQZEhkV7SqU9Rp01Frz64=;
        b=muW181jvbCOBgxNxl1ApI6h2KWV6pK7L3WAodJZG1k9RxfSSHS3vfWkNj/tYDhsLk+
         xjcwP/XFLsU7FF7NXN41WZgEvW6gHuWMmmTzGpLYrK2dwNYVufmmgvGnvXmu/7o5NWjr
         G1AtUAQ9zty6m2WKu49HAzLvPrOmAi3RmUaPJQh72nx9kLQ87Osxox3/QtwbeuacqMWW
         5Y65rXYAJA65JZoWh/BPPFBWJeWXSUxitErnyoPjO5RZIsdxaW5nAIyup3pJ2kRLrpAu
         LLkL+WK2qPAMhuHQ8CWWOZAaHgK/KX0TvOJc/ZJvmMmlZ49HTCy/5YX8ocJoZ1Mq58/i
         nV3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqwu8N9jYOPLVS8PDrmIEp7VXBcd/C5kH3nTHWwS9J27nj1s0mYbUnSGXZhYmy4PmhxGxQqXqmGOIZ2ijlR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6WGVC7fYbDqqpRQ5LEosJRhtB0TUzJabYLn4X6OtIn8p5lt1x
	hPw58Aue1i0PpbHv7bkEeAG6wYIeyyUg+mCjyqYp8vt3xDCjTjRvxYWY52v1IvVH1NsoNalZHQ2
	nyOBon3pSJZabHkJgLEi94i6RcZqeJvwVOx2b1hi3jjs9CGZpseznKQ3RawifkVqdHedK
X-Gm-Gg: AfdE7cnd+NoIVxgwESiB+cWh+8M5yejkxUNxQMNkNRS0fwo2FyBbKHrOZ9RYuEWeTep
	S5iSX4Rx/r8BPScJTol+3UPKulu4SwCt1D9wEHwg6MRTyBatAjRA8HP1vvuNggslzAwVywl60iP
	YJCxhJlmdjpOisddGxLWtA98bvU8ENNYzmY1QyK0JNWKqAsTx5ozUP3PXndSl5SgzmCz9IWyc+l
	sgsOPENiIHFafaMaKC/05e9hBtjO/ImjsW5k9ElndMoFhYK8Jfa/quOv2bJkNmaDcggz1BGza8z
	YO5mGQxpPETbyw0+epoDXpc4oabYaq8xjanUAipRjfnNn3Khly1g/AoY1ZSKERD/zlvvA5PkTR8
	ZHWtetD+koKA7prsbTX2v8b5/HBXh0YFBJeUqrg==
X-Received: by 2002:a05:7301:607:b0:30d:d98d:e44e with SMTP id 5a478bee46e88-30dd99d33a1mr5658771eec.6.1782710903821;
        Sun, 28 Jun 2026 22:28:23 -0700 (PDT)
X-Received: by 2002:a05:7301:607:b0:30d:d98d:e44e with SMTP id 5a478bee46e88-30dd99d33a1mr5658728eec.6.1782710903291;
        Sun, 28 Jun 2026 22:28:23 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ec79d4746sm9558432eec.13.2026.06.28.22.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:28:22 -0700 (PDT)
Message-ID: <411ed306-e267-4a01-8b30-a1a51333f7c1@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:58:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
 <20260608-snobbish-kakapo-of-dignity-f7bbff@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260608-snobbish-kakapo-of-dignity-f7bbff@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX/F6eRwQTiJHG
 7xVtiwHBepMr6Io0Ae19ttFIKJan/1ZSAH7H1tI1ZxytndqdbNcaNc1rNf7HaMBPngQAMdYldYp
 M9/oHud+HCX3ikqaIGK+ZnHCMOPDNq2ZZDUDVt489196IW84LAT2pStqCdn8Ahg9uQ370o1iNw+
 p7mSKg5h43PPtSxpmY+AASDFCL8cRkaVyAcSXZtdEAaben83nykFe60rXOk15VYZbicxun4tQmN
 kpMkjpvYq6n5WJbyaXu0KVEVVOYSDLJr7LlzD3W/59J07MJt0CDg47vWsGwcYT+Iyucc1JSVLFs
 /VCg3cJmRcY24Um+l8WN8pYcZgLM5Fvcp6apFRUTZMlnChfcJtvwcIO/cvHL69b/KKz5SlmJWrJ
 qifhW4LnEGkiuwFUv5V4eawkLWeFSlezl1ol14sGm6O8NxiWXnrclTqaneyPn/UhlUCGSDVCmCY
 hz1BFT93BJsHZfLj9QA==
X-Proofpoint-GUID: ngveya8inaSssS4n457TuZTJQhzgoiQr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX5/KLxFIDDtug
 LDDy0Sbp/9KQBGXVLHTcYKwCL29QtzeEv40MZIHBeOkjSgS7H3aT19MyixIvbQ5MXMbY4KxMybc
 sBNwfJurykX0p0IlIj0C4nddxv276XE=
X-Proofpoint-ORIG-GUID: ngveya8inaSssS4n457TuZTJQhzgoiQr
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a420278 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=X1Vx4ul0hvcZdVy6zTYA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 132D46D6070



On 08-06-2026 04:19 pm, Krzysztof Kozlowski wrote:
> On Fri, Jun 05, 2026 at 04:56:31PM +0530, Imran Shaik wrote:
>> Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
>> on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
>> across variants based on Audio subsystem enablement as follows:
>>
>> CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
>> CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
>> IQS: no clocks/resets needed; no SoundWire codecs
>>
>> To handle these requirements, variant-specific compatibles are introduced.
> 
> No. These are the same devices. You do not get different compatibles.
> 

As Konrad suggested in DT patch, I will split the audiocorecc and 
audiocorecc_csr nodes separately as the clocks and resets reside in two 
different register spaces. This will help to handle the CQM/CQS variants 
requirements without the variant specific compatibles.

> 
> Best regards,
> Krzysztof
> 


