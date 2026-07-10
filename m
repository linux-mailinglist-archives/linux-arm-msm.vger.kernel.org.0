Return-Path: <linux-arm-msm+bounces-118302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RkcsKwP4UGrT9AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:47:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B073B660
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:47:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=csMH9YL1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S4pq8P+W;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118302-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118302-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FC6630102C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187E77E0FF;
	Fri, 10 Jul 2026 13:45:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63E3229B18
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:45:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691120; cv=none; b=mOyrpneGg1zCnclWqNSD6LtQUS4/tbNzAHR5uq5OSRP+B3hXFEqmEvzBjBI6YLNDUjvAfUJjG4AWrMYaA2tehI70KNuq45RIIl4cmFw/ubMa5aqCF5nNXCauxu6dtm+Cd1zArfnQ9Hs7uwLHKVxbFjXBrh+yDFLiLNTyhhYYj1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691120; c=relaxed/simple;
	bh=1VuQw9WouRZL3IiouA1QDkIQ+D+qcZ0FPME4Q/xFy7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpBLY684uxeC5V2hegGTjmRpNf9L4YNAq8O5CsCS9ZdvkrQdcyYpWkC39cHOBeV+TL79CgeH6rxFAqRUq2lRyaryp3KaIBcD8lGIJLX/aVi6LkggMx0IbTPWf8Fnm+uIxGUaJW+k5ZtfJ7TthWznis8ECKHA1aLI4YP2HHHcp+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csMH9YL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4pq8P+W; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD62Do776217
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVl/Jh7gTfBZtZj4Op6JOZlxfJk6HcU/wOB6FOt5iGU=; b=csMH9YL1xPyXclnY
	035rjMDTpelcKS+IdC1NgoMML9yhFxPXmGge1+IAltGr3MEOCI4PSLxSnk5MUPlq
	SrYT0gKNHf6PbNZL5pjsaGghZTBGBMkwkmFGhYxqa/5Sb3UX6MjomR8MYALkv8xC
	gfWMS8vyf+hdPhoeJ2AITV2Kt1bnNWmWdLpZBVxZNgHRihXrjlhxpTnKKYABwgby
	kgXRZJQ7vfBDnHT6HRsQmfJ153Tm8IbiG154Ms82oHGfysdeYKegjARPjuHymDHr
	USC7s9f9OLDwN0N8/yRrEa61s3oua8RV8Esu8gRzBYCKKacoHEUmySeSihqjQWlA
	uw4/uA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dgw9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:45:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso10605181cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691118; x=1784295918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVl/Jh7gTfBZtZj4Op6JOZlxfJk6HcU/wOB6FOt5iGU=;
        b=S4pq8P+WsQnajaeHxrzLYvbnX6OgS12X0JkxfQaSr/0p77ftaURfcz7ehinZErBvgj
         p3FlIOORev65dypBeJFVe3MIQMplvvBOQfq560j4TnklMSu0CPYjthY4SgESkQu0HnD7
         YqUz56wtxCXB5U9kQvmy+Pj8bwVD2ayxA9tks8N2yPrI0bAg+b3uiOaEWJwb5tjuB12t
         iH6FtKwRWEAEtGdEwvj9wDK5kFYqe5vptEpsgavPBUrjVU18pls2NhIJXzG1UxCM6Grp
         +t/1UK5kHX7jMhTRVF46ccgh97wmYxq2vVlRlobAKzrQ+UX0rp9fUm+9SiE0ShD/33RV
         ydEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691118; x=1784295918;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVl/Jh7gTfBZtZj4Op6JOZlxfJk6HcU/wOB6FOt5iGU=;
        b=XEua0RbCACruGtfiChZJdZIAmZutzn8ZDUqiv58N3ZMHY+LzCnAJr8JK3oIpGZSvxQ
         ekmhzpCCbZjRaLogD7LMzBSg+hKkjOdxRIdpvPjn6fXM+P+cDxJhmxcY8kDcicOMv9YQ
         9O+pu4Z1EoAbaqGMm5lN26gW2Mhsikzrbfo6wsVAfgag9t7klL9ZcV49Azd7v4+NSAq4
         5EOYvSgA+Jfsuvt3xu31CE+S8xKzNu36684IvVmWqWzqmgV9IPqVBmfBfpdNK7ON5icS
         ZEqf3WyT6FCJ1GK2vkvm0AnvZObeQx+wlhV4DIXBtCXa7LXjotPVEHCaKIANKXK52D4n
         wu9A==
X-Forwarded-Encrypted: i=1; AHgh+RpW4Zeae5K/j1KbWQT1CwuUTuyW8DD89gsURW6Wyxjn8RM///0zLBP+Fbmb613vCDiXm3JohCC7FEYBrYHQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVdCM709apzOHf7VZix4xYlh7hDiMc4Zf0YXSwFsfBRX1ZuTy
	mx9DmeFlyQHHftKQb7hyHC/y4MTS6m2yNZU5QwnHX+Jy4tGq5pLcsAOd1pS6wdSDMZZNjDIRfFV
	zijIYnYL7eH4guADqJ0YsXxuiZacKZjzYrbjr7TROtHZFW9QOYJNYTMlW68h0IaBzfF/X
X-Gm-Gg: AfdE7cnGi5MOUDOc+bgWR6RuTRnCJjKpknmU1QpxWjQF+QWR98Bt+XXAc5lzc9ZwOea
	lzbxE0ANexMJY5Y70tP2mwhp5H12SFLQ9jZgvjRPM6jxZYwmML9FYabAnib2QfeUn2XcG6SohP5
	1cwv1GuR9QinJlVAYtXecJQ5gjS2Xgp6EDLPDGkeEodXZ43GG7pVqE+45+nSih+JxJrol4zaZ18
	101jJ1CAB5W5JdTe2gC2LdfO0/PLBBMYagnJLLSLaY9kd0JxlFjTY6T8T+8S5AdidBLR1PZzAPB
	Y8EEhNABcUqyvgQl8uMZh1ZjaAh2r3xPfxQvZNwXuh5FK9LTWSMZcAyffRm80L1ZO7LNfcEsN3C
	RHFzmgbK9EwTSQRycGTrJXLwY2mHEDL3bDWkhvTuzYCc=
X-Received: by 2002:a05:622a:410d:b0:51c:135a:5b49 with SMTP id d75a77b69052e-51c8b2ae5aamr123570501cf.4.1783691117171;
        Fri, 10 Jul 2026 06:45:17 -0700 (PDT)
X-Received: by 2002:a05:622a:410d:b0:51c:135a:5b49 with SMTP id d75a77b69052e-51c8b2ae5aamr123569891cf.4.1783691116554;
        Fri, 10 Jul 2026 06:45:16 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada023acsm617631166b.54.2026.07.10.06.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:45:15 -0700 (PDT)
Message-ID: <56a7da52-8190-491f-bef2-f9c95bfc551d@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:45:14 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
 <d5r3arZtREpnddaOGPStdRSGdwUSHDS3j61ersC0nD69JffwlclsJISjUblw4n6UwjjCVh1YKGOZhMLJCC9fWw==@protonmail.internalid>
 <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
 <4d533d52-4de2-4a6e-af54-ac9052ff4506@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <4d533d52-4de2-4a6e-af54-ac9052ff4506@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX6t5AsivCOIJv
 wK+zmwo+4VMkbaW1h6ZVbeo7QccC4eUqa7nkPKgy06rQfv86McgtuVzWJ8v3EtZE8GBJYnikwmo
 4/NWs+Z5I4SNkzRThEkOEqXlAk1ynPM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX8tX00pRsvg1j
 EyzVsYS36LNctYzwmPjpNHjfJHXK7dcoRYClYrnEWmGQgI4wBUPgGKgjIRq5Vpnij0iax6LDFPn
 mNuMu5GWlD6l4Hm3bB6IO3IWbY3iXkgIWS3n/pdxw1oBLaCWkeWlK3E7+eK8RU5aCCkPhNfWJFW
 muztKAv9W2ibytWA5MHJTZMKj6jBl14PLqGrvaRm0YMC9ctD8GL4k/kwAWnwU5MQQdoI+ZFyKSr
 jA03ZuBLfe4X/EEPmCb+Y2xrEqBGdPxXCzD8w3W2yC4o/HOkv0mTC+P46DdIZZBxCeOnMKuF9OP
 HJG57pIvId+tvq2A4qPc0BmtfYfWHoUvOOLhQLC8Y+n7F/CAfHhcAEKk0UGlz70N+8GX0Jg1mOO
 l89X1PGM8V6sj1T1B3XYMksaOTxcq/B78IewpaREPhS4ToBEeEFQTyebs3U3PeU7IRhr/rnj9Hl
 dRowkF9Xy0YkTLYhiGA==
X-Proofpoint-GUID: bYGJgQ-LANnxm3DkfBbnz9p0g6n4GRP1
X-Proofpoint-ORIG-GUID: bYGJgQ-LANnxm3DkfBbnz9p0g6n4GRP1
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50f76f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=hP-s5Dj4EI8GOsY46QcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118302-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E41B073B660

On 7/10/2026 4:28 PM, Bryan O'Donoghue wrote:
> On 10/07/2026 13:28, Dmitry Baryshkov wrote:
>>> Quite frankly, I don't consider the existing (meganode) description
>>> any valid, and would vote to rip it the second a replacement is
>>> available. But once, not N times.
>> Rip without providing backwards compatibility?
>>
>> One of the options would be to follow the 'venus/iris' approach: land
>> new set of component drivers, which target new platforms and provide
>> minimal support for one old platform (maybe via autoapplied DT overlay
>> or other similar techniques). Then continue migrating and phasing out
>> camss driver for old platforms, while adding support for new blocks in
>> the new set of drivers and ripping support from the camss driver after
>> some migration time.
> 
> If you want to fund it - I accept BTC, ETH, $, € and upstream bragging 
> rights as valid forms of payment.
> 
> ;)
> 
> ---
> bod
I can give it a try (I've done this before), but I'd appreciate slightly 
friendlier comments. :)

