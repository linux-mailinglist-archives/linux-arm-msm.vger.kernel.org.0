Return-Path: <linux-arm-msm+bounces-93643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE95CEwlnGkeAAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:00:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB11746C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BC023030B0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D718354AE2;
	Mon, 23 Feb 2026 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNe+ABrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7fi7xFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FFB350A39
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840779; cv=none; b=OnmFIWB7DJg4MOhRULHXy9kdXMgTmvRqvvjechd4IEgDppKx05UqEGJvAYX9qlKT04zoP+s1PTN5QTQhZwj/tJRCxbARLbQT5Vs/U2f47ArXcaj+ukFnww2Mx3FXfjDtFAJYdcwJFMK99HrCKVxABNzPvSScrnyINEaDVLlryBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840779; c=relaxed/simple;
	bh=j3G8PmWwRYOCpxIyqY4qiNHjjjigY6BKB98FdS4me24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBPh5u3BWWRrbchYjlCGCWtNkWpX/O3uBIkdI6eyzy5MwN/lO5QuLpsvTon3CS+EaKtd9+hXQ2Wp2QNMS0ZPTbqDLplhIXThFzqUhceOMNja+gF//cPMpIDedum1cT3kdJEXRcSs7zIYGVr6u/uJOjO1apmP/cLzZDAtmnG2akQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNe+ABrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7fi7xFd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMsBhL2238684
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0q/hXh703nO28vGXhzncKmTVhDNb1C4vYJlCrVydYrI=; b=FNe+ABrlUxXFYYaO
	sH35XW7mab48GYYHwyClbEvY+yN7ADZt0ego3DmMcXyXT9mgK8IJnd8bEI2dxyBR
	ogu4Q29GJRFzIlpkZOEFGgF8/hS/85cDpZJ0RCVT3xCvKlysKhMBCd3TiwQSCKHa
	TV6cXKnoFwpkJ4I5OwD2WZblBmMGNDFWs9Yd/zdVpAzKfMcJyj2ZY14BKYuywhWL
	1E+/L3SLIOtJrJWIbMy569dkpIQnqOkb9pqpo5BZ4v3bBA8ryeG6vMuOVQjkHril
	DVtvAAr9S/6iRZpswG1eu4OebIHjCTxVw2Mkg8doRyiNo1r7h7mdR/obAILQYv37
	8Tqi4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum643-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:59:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso512720685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840776; x=1772445576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0q/hXh703nO28vGXhzncKmTVhDNb1C4vYJlCrVydYrI=;
        b=j7fi7xFdDhcsMLVtlNSFKA1/aL0lKMnpzbYpaPzEDYAm+diECte21gOwM+xgDgZywp
         0tRPDzJcJDMsD5eQeiMizP1OyYMC4YnqVWll25C8Mgp22KwSxQ9PcSOlCLsknNNLz7Zi
         pidaVUyxjWbkmoSad/cCV0NeZNxGxyN+W/KcYsLzr7Z0tQA4MXmVurDw3vm+H6PdevMN
         +sdaiOgay1OY02PLzI85gnZrlmdmf6eAftlYWwdn/RChfiuXHWqzkSXWBIL1k3TEQbXC
         fzqpBx1mh30d6MSiY8WTbicGl1/ylG5ppuFnr8Lp2gDsEH3QDP2fYkfoHMJ4edrBTTc9
         hSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840776; x=1772445576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0q/hXh703nO28vGXhzncKmTVhDNb1C4vYJlCrVydYrI=;
        b=qCtWTzvsp56D1Nmn4MWpgTVZhEQNelZKm9bTuktuB1eHjMUDqLcxmCkfYgFnBjdZHV
         XylYvCAQugKXfrqYESrKDhPq1KFdZkhGA336Mb0l9ro5KTOI17ef9tqbJiBzODAFqK7q
         1HLDA8sonSb0dH/L86afqOZ1FhIsqK3/YvZp9toCxfoI3DWMy/qf0tQYiBc6EoZz+03J
         MKKg/dORpgTzxLPks7ivJz2UacXnu/7aSzgkFqqeHa8UwBiL5G6lWnu5MKopb1Y4jV2h
         9zXdOfe90Fsp2K8nGduCByxbXynsz0nbNjq4HrUkaZVUA07xlZe412id6u4b25Z0VUzi
         t99g==
X-Forwarded-Encrypted: i=1; AJvYcCVyQsD5D4qYUDLeKWpQ2jifuwNFjKRltN8wkcKvKItNx8u3Z5ix2ED/tDPDSJ3m+dT+dPmrmva1pp1bSbz4@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5qnE7tQUkwIPt86FI2mkf61DWGQb2yVqbCe5dIUL6INSnHU0
	B1inOtCrsYrUXpfjZZFCjYvPvYlwrD7Li01R7GzkeETBdXWQl65N4/Jr0PeiC44UQjaDZnuoqFC
	/PpZp/pGJIMqTSe3iCjbl73lmphd/mgLBQhE+K4wlot1NVi7iG1waREZoR3y2cBvRb1tq
X-Gm-Gg: AZuq6aLi4qMiVvVxnwX8v00suSnbcyXGVcK4HjcLB3MxvGd1lxYvr2o9uUFFXrKYzxC
	57+kXKknNCC0+sg13fNDSMQktKMduXZ8N7EVUknBlhGMA6tSN6zoJCkrCxYDxjtE6kenybAaXy7
	YEIL/q2MqOwveiEJNKYlBXBrJa9LIRMHcEUWVwe1y4ZnBgb8ksjRfYGIaHrVDbzWmEkfnJmELpS
	d3xgMrcXwfTjKXLbiYhzbnugVQHuzKhUPVFsdmivIzU3tnVskCAd6/ruHy1afUhQYo8Xk2mhrgg
	BpdBVON4ag/7X9Jmv1pgZeDBYhWUUrBejHxcSQTR3EAS8/rZS9Y5oO7KStQY9EHC3L2sFD/0hNi
	/6Ez87W3awABsxlHe3QuwVJ/h5vhOsxwIQRAH4/+vmEVR+LPJc/ZZtbWnMDZpRvOdtFD7UrZdcS
	OJUUE=
X-Received: by 2002:a05:620a:1a08:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cb8cacdea5mr695840185a.8.1771840776612;
        Mon, 23 Feb 2026 01:59:36 -0800 (PST)
X-Received: by 2002:a05:620a:1a08:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cb8cacdea5mr695838785a.8.1771840776124;
        Mon, 23 Feb 2026 01:59:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4ba0csm309640566b.38.2026.02.23.01.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 01:59:35 -0800 (PST)
Message-ID: <01593963-2bff-4a8c-a6f9-c62bcf21ccaf@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:59:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
 <at7j3kbdixd7aveiol37pwgudl2hcogtdrvdgcvgbbm3t5irfc@4nvv5ptoezyk>
 <4ae0dd46-5f5f-403b-bbc6-1094159be302@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4ae0dd46-5f5f-403b-bbc6-1094159be302@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c2509 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HODDCX8Zblber2y-KYIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: v3CEsox_WogWOtpGBBNDwBgSIH05L-U3
X-Proofpoint-ORIG-GUID: v3CEsox_WogWOtpGBBNDwBgSIH05L-U3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NiBTYWx0ZWRfX7lTfGWzB0bAv
 MWWY/3rn3FVb4GlyQddXUjdKid4CfMPUFdm9wWKkbOTbg4O+4Yumtgq4qT6oeBJcC3K/me6m94V
 0fVVPB8R31O83Q7Gq3A79Q9y6PoznLlpoSp09KhFiSAgmekO/UX2ORNbPdJk1EKer9M+vPbnTK9
 x20jhK3AQ609opYEcQSssSAqvK+M2odrdaiySoEjhgBZ7poB/2zy96JHP55lHBtQzQRYHyvH+SV
 tjNKRXnOGq0D51PzXq+a+o+l+Hi8I2QTD0I41hiSQNx0tlww7e4kvdbb6seVSpw4JrPMcXGFJ6a
 k6TTKsKYnDgn8wLZsjiw0ZQO6iN0Tx0TwNQLNzHqm2ocuQaVtYqej9F4ddav5Ql808ro4rlOhUs
 wl4dz/CWjltp78fEKXAqasXAZENTrp55MVdQPTgbZElG9Z9YawoeEvcjKzFQdFNelLiPUHEr2m1
 Z41EllKxxaUg46wFczQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93643-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACDB11746C6
X-Rspamd-Action: no action

On 2/23/26 10:47 AM, Umang Chheda wrote:
> Hello Dmitry,
> 
> On 2/22/2026 11:57 PM, Dmitry Baryshkov wrote:
>> On Sun, Feb 22, 2026 at 11:05:45PM +0530, Umang Chheda wrote:
>>> The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
>>> board designed to be stacked on top of Monaco EVK.
>>>
>>> It has following peripherals :
>>>
>>> - 4x Type A USB ports in host mode.
>>> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>>>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
>> Nit: routed to? Is that M.2 only suitable for WLANs? What is "WLAN
>> endpoints"?
> 
>> routed to?
> If I understand correctly - you mean change string "connects M.2 E-Key connector" to 
> "routed to M.2 E-Key connector" ?
>  
> 
>> Is that M.2 only suitable for WLANs?
> Yes, this is suitable only for the WLAN module.

If I remove that WLAN module and insert an SSD through an adapter, will
the board spontaneously explode?

"intended for" is less ominous..

Konrad

