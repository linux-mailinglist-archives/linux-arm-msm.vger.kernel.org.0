Return-Path: <linux-arm-msm+bounces-117524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0xtLBZP3TWpyAwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:09:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36D7227BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:09:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L1VaWnXE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="JwGW1I/H";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117524-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117524-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AF7230B4E2F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149B53C6611;
	Wed,  8 Jul 2026 07:01:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5F83F1AB8
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:01:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494100; cv=none; b=QK2N3ZXTnSX0R5+bMOZ5eKZB9k846l9zbENRtRNNyLHwvAP946skcAXhqBKhp96bJ/oVrp5weqWoeoSQIMfKVaOkhh5Hxu6lTxe2j9sccc07vdLRVzZLL8SvxbNrshaspNvksM+OVUB0R9SwGMhJcBvBnCfIJZNGjq50tG0VW5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494100; c=relaxed/simple;
	bh=PcENMnEFO5kF7z0Ym0VAGtForJNSos0nHQgajBdaQFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWaM8VbdbNjzNYrxx4+UMo/KzuSFilxsbUIAFyoZaZvaBUM1iBwsIhK1c6Nry2fp8ipRiAGiqjxCAzmJtBZkbOhfwrVyGucQUcogQ6Q0Z+Xvhl1SPcZH78DC9Baq1CA8ImOzluBjlFQy06QECBU3vOy4v+Q4h35ugxV7KLDWqm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1VaWnXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwGW1I/H; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842nq51668617
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 07:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ib5LxCzSThU82O7yGR/Uar7LLDQWXvQQXKspx5I71WU=; b=L1VaWnXECZo4zUPM
	u5rBXYltVif5rrRRq/q2czSTUr9dMUKFoYoGcmLLFwXSxCcP2kNt6GoGt1tIFBZv
	2rjLCH1CjK6wFtSgWUD3s+63Iy/pM6fvN1i5NsfY0bZRyS/oJKlgnU/Ev83eWqu3
	sEar0TZDdJqomLeXxVO3RgA6OTEou2NhF00UE9sppjCiNs4uhbc0k3iRvgX050Fp
	Kxss7gRDfZI7MxjtV/jJJy46gCFwBl+yfoaafvlUU4uus5BzsRW9koXjr+39PUjU
	fP+Tg+L3P+amUWrbr0KT2t7MmwUii2ga9QMl7npYTgkGclVDm69m9+18ngBoO4+v
	thCWtQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5u5ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:01:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737c728b37fso8257137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783494089; x=1784098889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ib5LxCzSThU82O7yGR/Uar7LLDQWXvQQXKspx5I71WU=;
        b=JwGW1I/HaahvIUTKEHBeR5kPnU6hn7SeP+Q/b7QMuBXM2fd/WWwpEXZJZswBCwAOkC
         sLzxrxppM/bSRoG3kiFN009yLrEa4r8YN0ESItXSzKMNysPuKtwtUnQ986445vm/p328
         60npWwZq/e0axQBrGLP0IgKWIKFn4OkYkYGzNfz35g3cW9eifMK5L6yZDc+eav7JJmc5
         4waZxv0yjIUgiQQ4p4gVVle7DR0syWkEOulxip1ouE1WpffVLCu/A+vaTcJ2ExUSeTR9
         +Retq3oHFp/ndJ720ui4OoRO3XGz423mHgsqvOtJQUgojdE1yiMB53gMr4IxGuyUdAXS
         NO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783494089; x=1784098889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ib5LxCzSThU82O7yGR/Uar7LLDQWXvQQXKspx5I71WU=;
        b=L1xP8innISV/hVmJP1pwdKi83LU7VzdEn6H++ojJlvWbhjAvPR9X08+OHW0kidVWoU
         nTkVqklYDP2SKNQc8AFpU4bQPC3Rz3t5cpiAv85DZDiZrTMsFvHiQDq8Vo1K/j7HdgKr
         Q7R0DYUVo4i2mcOzt6xneokFE4ZBEJBWF1KoRu6ew8tPkCUNMRsHANkaBbu1cu8LVkWp
         mVT/jpovFp12yY689ZuzhnWq5yTvM+bgZUVNnWIuSojqZK88tbkCvWmYGhpmYrDgfyYD
         9Ak1nlNlOFbErQG8YsC0HZQYB9EMZzGCkY94y2GoWJBVAKnxpmAu8mlqL107eKoley4p
         7mmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/SP4AHVVtiz+uPsa+UFEQqY15FaRq6T7fYLgX87CWXeiR6FqFGuhMYkeKAOp4cgYMHqbEvQpKhQ+Es7Ss@vger.kernel.org
X-Gm-Message-State: AOJu0YzGohf5x7idGZQ0rOGHyG5IEZwr74qqq60vmZQJpBumKULS47OC
	TIUutgxHRgeZ7PXkEUJWqpRlqyM7AyjDZG+jeko0Sb7mUjxOArq1Bpox0uC2XqyAIiTmpfj1dk5
	BfY7eTxzbIhueE6yAUXbmDVaFpArOEhrhK/WAyp6rUjMGJ3DMiMeSihJPU03ppvTyOmTN
X-Gm-Gg: AfdE7clwpZ1srzUhjHz7grRJolDrym6QAX62MChK73Gr2zCON0OJOe5Q6NCR82OILEX
	5wduIY04CdJ2h3oKC5iOULqeBv0HDxUckLqho+r4pWdPLZ0wmZdKUQwR5SGk9D2jC0Z1RcpD8hq
	8A2k1TBzSOr9SDm6GTs3j8SJ66c88iybTZqibtqMJBtDzUjJuuGdc7mpm5qgkOV2/xipmZmRjT/
	dqLB61SX8vU8d1OaBB2ESGY81f/KDDf9C6c4Bgq1cGFeXu+FJqCr/juo/ewliaC7gKGAdCH/RtZ
	FmYXwB6N73gMDY97cQ0I/00GtdtVKGsL/+UVTrh2n+Fonax7d2Hi25/3CGvT6Yh07jqewq5GUU7
	ekj+qZhaueOMhw7qgMFCTPqRO8Hpo1DmUEsE=
X-Received: by 2002:a05:6102:4413:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-744dfd01178mr225784137.0.1783494089072;
        Wed, 08 Jul 2026 00:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4413:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-744dfd01178mr225773137.0.1783494088478;
        Wed, 08 Jul 2026 00:01:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82277dsm256219266b.1.2026.07.08.00.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:01:27 -0700 (PDT)
Message-ID: <e99b86ad-a974-4af3-a35e-931fa56d3822@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:01:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0
 and SPI3 for 40-pin JHAT connector
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tmfdLwAno4IlyPIwSjwvXsH38aJuzlxQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfX0mwHfEPNCwAQ
 xrqxm2rTOgMjm39+fflZx8tuVUwnVImoH0P+M0fLWP2AQcXEdtPNx4EzYGqmlYZwWMMjHmQnpKq
 dqTtuThT/2/PKAXheAUfAmDq1oFWVrM=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4df5c9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kjLrY5-yeU0BZg8tZeAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: tmfdLwAno4IlyPIwSjwvXsH38aJuzlxQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfX/YMmJYxw0oVI
 Wm5KlIyplGJZy4tNhdTEs0u6K6aC0Mm8lXKhPIQY8NlNpWeexeiHFcjuB5ZLMbFUsk7GW78uSIS
 KKiCyJsOH7ZxNAW3y+KxU6WTB2MNUn45/df582tJ+vpr1wUX6YIKFIjaCBKndFhmS+WPqwlMR8D
 9s5QRLI+IzY7xKMbQhd9/Ms5ExOGcNVEc/x5vBE1IMv1MwCybEJxmqC4zMo6G2VelRWuhxXidT0
 jvz1O7E/DHeR1Y+8OJWcmYSVumywTbEa+9KwFziUvIqBPcALk2j9D3qobMltdWCTWBmhJ9pAe/Y
 sfAhl1wAj6V+AtJM+FbgnBm+8b1wIthEvF4tq0Ou5g7/pFZ3GERRJltyNIRW5efkci05I/Vo9kG
 zpTqFVO7zHMb+Ro2/mXF7ZkmNCETJlHp3Woewf35eR/tkzAmYdEYWo45F8TT9o004B5HkYEItmV
 ehU6Gj8fKMFpCEbPn3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117524-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F36D7227BB

On 7/7/26 6:37 PM, Srinivas Kandagatla wrote:
> Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
> connector and add the corresponding i2c0 and spi0 aliases for them.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

