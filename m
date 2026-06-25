Return-Path: <linux-arm-msm+bounces-114442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fxi/Ll+8PGqRrAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:27:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BCD6C2CB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:27:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g5oG5rve;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L9VE+Qsq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114442-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114442-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1B2130298BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 05:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FA8305693;
	Thu, 25 Jun 2026 05:27:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07A812C534
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:27:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782365275; cv=none; b=DspFOzadvtiCGEuZtqsBwcPo5cdZgBBPDO/vRSjru9thYwEY/2hIHvumGMWiO7413sbw0eQe2KXZISfTkG94/epnuFH4IQzKQd9gpCq2YjBR+H2eTLY25C7zjHPcdzmiLQ4fHyGYf43uRvHMmepX+tyzjz4tGkmrnfUjLocTr2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782365275; c=relaxed/simple;
	bh=utZWytu5ai9CNGXAFQcug6qUDSlwkkNLzLZU6nCx/Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVSnjGYFfaT0i3sd3zYW1Wq76c/ogs5EdNwXLKlo9TS3IwQzmoUudz3IIq4xYSwZWTtkuiQZExocifMxqD4QCySs/eAkszMDcoJixTZZqs6c9nsaJj5CB4qm/23I8zQ4dISxACZawoXCu1KRBS6n7VRuzHMc39hVGw3OTPWeI6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5oG5rve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9VE+Qsq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eClX1225379
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=; b=g5oG5rvee8BQgALl
	vh66gsQhJa+vEZoh8oZa+cPblCRO3VmZU4gjyNWkpiDKAfG9s8g30NoFvtx8wWmx
	sO1CAwSx/hiCW+Rhv+Vlp+IMjE4uZom63OTaxaN8Kv0+2qD9UMOCiO8w29O1O43W
	ezBj4RcfRrfQJMPZji9KnDdwo7zF7B804StRC+eVu1tlpN6bkbTe5S1hqKOyfzwA
	AEGsdF+nnYpyiXH51FK10IKfaVWkVJS+IHV0fQfHdnRgPIYg/+M9YPfoYZ+SQs8Q
	PNOFUEDxbK0R5uwLFx9myM7HoCQ3V9VA6AxqzpIg2QiSyuMzRv0uwywOUxh01C5y
	Y5pjew==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqgf6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:27:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894391f000so2138296a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 22:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782365272; x=1782970072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=;
        b=L9VE+QsqkzW50CPE1yYwpvleLyj5iuaawj3VU63Oq+1rYQhjqtlqo3YDlwPkghinH/
         26LH4EzCJBtfwmTPaKnxQVJLaj7bC1Wg72q/mj+5oUk1NehKj9+anLWiepYuyBHK4F/J
         xSw7FPHkU53m6UVqnuB5dlv8mMJbeplkmYIbVAh3bJ9lWU7Cc58T4BhLVk1VMWma2RjN
         cAtsF9CKe01pqF+MsthJO44n8lFBc6enZD/wXxC4s6NnGo/v23atT8+v7z8X0fUM9PfA
         1k/Sq4unKXJH27neVVLOKeGCWtliaIv+uw3QpEckxIcMpfrKLrVrRnFVBbSfzBUHXjh2
         J8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782365272; x=1782970072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=;
        b=rBWs+OWXrEGvn0IwhwN8jwrWYZSSBsM9/Xh8EWkR3NjfgupJCMqTvJylRyEOkWGpbY
         Lsd8/kX8Ngm6fAHxBvd0mxi/tIfteibaxNDcpS6CfUsbZ9ofuqty7sKdZmFm0mS0z35U
         aQpEK4vTecv+A133W3+FWnHWuzp92c2SeFxbPfgDpTG2wQ+MFiaUAnN9St/5A8sThFw1
         897wcueA7fXJm/WwmGXIIvBqE7AjxREUnLLUJxNqPc+KxVaIftQ/MUeifrjaKGSGisHs
         hT17IKe6to1kGIwTj3pg1+cwSbIDrIAPkXVyPjRbWI1nknxA1GF7ALPpFotFWjXCJAMZ
         ejvg==
X-Forwarded-Encrypted: i=1; AFNElJ/5fDFo6U0COE1/VnJ6FsmYSww8zQXUiHvi/YD3eWABDa0guqSo+y0nAWTDNQUeoYxyfHe2RxAQ/pthfewM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2os7756UJmPIH9L2sM6lCxGORhp6JCtwiVjLAMpNBYNDqtpMq
	Oa6/+XWaSNQlT6k/DlNs/AApz76qny9pJ3RaVUlsgJx9FY071RF3Qci/J76KcfUTRmXjHPwpGWv
	h1FETyUkKO5vLrZD2Sn77aA1WV9IcErKvXToGCthpszaeyfm2kxnaWz2dX+rt9EuqfNkQ
X-Gm-Gg: AfdE7cnANkqyB9ptLF/rcepi2N8DU6w1Mcf8YFGK6CLeJZ7WthWTXEAWSAzppVNaZeK
	vv0DwgJRxzV2mgiDYasB9uizr9ndLnInQJNyLOlSpVgADvqyWRNL3LqynfTFI2GlamyD0bEG8BA
	j1Tk/KoQ1qOtrkMpyFGZwbx7HXEVh3kAUSjHQS4YqRSug7LpjPuZKMJo0WYSG0ZKZpkfX2oIUgy
	CNgODpcseXaAFZ6H19TSWK8F7pTejE5fR76iihYcSdKmB50IePN8DuJdFT/SgYBtiPT7lQVl+nH
	NprEfbWeQxfJfcCZqfQ1pcLNqKcWQtyZz4TTl0qLVH1AgmnQP0CH1xHUEey9Evp/hV1QtbyGUY7
	dRgKKHKGVHBHEQwnKe+0qOr2ql2NI9SnXhpFLSQ2ERzIDuAynnu5eZKKzpApCt+3Wt3VzcAVYOK
	8+B/MguP/B87/sIG8dlF+lE2KWKZXSj/og
X-Received: by 2002:a05:6a20:b786:b0:3b3:10e1:a87f with SMTP id adf61e73a8af0-3bd4af033a0mr1353217637.31.1782365271677;
        Wed, 24 Jun 2026 22:27:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:b786:b0:3b3:10e1:a87f with SMTP id adf61e73a8af0-3bd4af033a0mr1353170637.31.1782365271237;
        Wed, 24 Jun 2026 22:27:51 -0700 (PDT)
Received: from [10.50.49.21] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c93522747efsm302606a12.22.2026.06.24.22.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 22:27:50 -0700 (PDT)
Message-ID: <ea9d0c11-e110-4d13-b165-1548875ef9cd@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:57:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
 <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
 <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ljXHnaY-9IpWqW5aIarsyL4ZbSVjVMwg
X-Proofpoint-ORIG-GUID: ljXHnaY-9IpWqW5aIarsyL4ZbSVjVMwg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA0NCBTYWx0ZWRfX9BvoZUIDQ91B
 Xev/GYjPVKLODzOGd2/s+KFwEV4nCGaD+A/EQ2tStlVpYYurMmXK4yrcOTVgIuCDTTK2UaB1Si6
 blE/viyeUJj66Hf7Rd0beO9SMdP/zKQ=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3cbc58 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=TXgiicuEePHzAitInHsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA0NCBTYWx0ZWRfXyzKy6lgMtE/h
 2ZzBfrExTSoD5eaM/ntdk8Nd38eRsGZxC0PEH7lZg/IRk6AyCy0lDgvuE8GqTpzqnho/yNSJU5r
 Wb7yjNHcMjIdV2PK2I9ioEkZjLXprGJtg/iy2/2ab834B67MPg976j8DB6sUpj0lU7YYaLYaZ4w
 OnWHlP1I7nqmiJqsnD7UYIt8/kGtRUeAZ3cGPLxDj4EaaQjCHi0JMKCv0SWx7Iz52Si3c2gNKXk
 fwNKeZHBJrJnPR7MbTgQUZ+0baN4GKoBB7TuW5vzJM0yVCbjlq1lRm8YMWUaEI6MX6yE9JE9lyv
 eW+gVrukMDSG+FYEGUIP3RBp0CTN9M1hxN8ox/MKBKIZ0jzIbHD+p4jEIsbq7B5k4xXPreqzPdQ
 xZ11rU9ttK2F8gpx0qDJXATmLoJ2iRB4sdiR6mCGvzaYj970W/EOqAXbcQ5VrYsCx1tg/Z8/0LU
 fyOJaYt6CDOuZb5pmRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250044
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
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-114442-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58BCD6C2CB0



On 23-Jun-26 2:17 PM, Sudeep Holla wrote:
> On Fri, Jun 19, 2026 at 06:01:23PM +0530, Pragnesh Papaniya wrote:
>>
>> On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
>>
>>> Not sure if it was discussed in the previous versions or not, it would be
>>> good if you can capture why some of bus scaling doesn't work with the existing
>>> SCMI performance protocol and the monitors don't fit the MPAM mode.
>>>
>>> Please capture them in 1/9 as a motivation for this vendor protocol. It will
>>> then help to understand it better as I am still struggling to. Sorry for that.
>>
>> Thanks for the input!
>>
>> SCMI perf protocol exports perf domains to kernel where kernel can set
>> the frequency but here the scaling governor runs on the SCP while kernel
>> just observes frequency changes made by remote governor.
> 
> OK if it is sort of read-only w.r.t kernel, why not perf domain notifications
> work to consume the change done by the SCMI platform.
> 
> And why do you have set operations in the vendor protocol being proposed then.
> It all looks like something just cooked up to make things work. I need
> detailed reasoning as why the existing perf protocol can't work considering
> all the existing notifications in place.

Please do take another look at the documentation and driver changes to see
how it all comes together, since it's apparent that we use SET operation for
a ton of things. Taking another stab at explaining how the MEMLAT uses all
the ops exposed by the vendor protocol.

We use the SET operation to pass on various tuneables (IPM CEIL, stall floors,
write-back filter, freq-scale params, adaptive low/high freq, sample ms),
the core-freq -> mem-freq map, and min/max clamps) required to run the
MEMLAT algorithm on the SCP. You might ask why can't we have these values
stored somewhere on the SCP itself? We would like to but all of these are
tuneable values, that can change for various boards for the same SoC.

The START/STOP operations are meant to start/stop the algorithm, in this case
the bus scaling algorithm.

We use the GET operation to get the current frequency of memory that we
are trying to scale. It can be also used to read back all the parameters
that we are trying to set. Another thing to note is that exposing the current
frequency to the userspace was something that the community wanted.

With all of ^^ in mind, re-using the perf protocol becomes impossible.

https://lore.kernel.org/lkml/k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7/
https://lore.kernel.org/lkml/20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5/

We'll add more call flow diagrams as part of the documentation for the next
re-spin to make reviews a bit more easier.

-Pragnesh

> 
>> While MPAM is not enabled/supported on all hardware (Hamoa).
> 
> Fair enough but I still don't fully understand to rule that out yet.
> 


