Return-Path: <linux-arm-msm+bounces-103142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB8RG6ZM3mkzqAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:18:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F63FB027
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3835B300CE79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D539F3921E4;
	Tue, 14 Apr 2026 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="go8QWPNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SC6eJfWx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896D93E7174
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175946; cv=none; b=oQ47vLJNYBQCClUuUzzu6giZzUG3MbWxwdwKCeYMsDduB0j7pR3l6iADNQtUCVOGay0F5uVChQyXKD5iiBGiZKLb5kt1ew2H4HuV1+WVl8G39SmNloD72//V9cvdTJPBkHCtXjjjqbldcvT+azX9jmQkGXAwg0GIBx0wQ0SDbBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175946; c=relaxed/simple;
	bh=o3EVBk8mY+1bKgUj0lLzcwLTpgKFyLa2LJ1AJZKVGIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/XnLxkX9YiekSBWP0z8oepIyU1IVVvex7NuEJV5+P5U2GlsQ/54BCYgqTlFuBb9XXn7yz6HbybTq2MGb6iXlSoYPrNWOKIt8XqI96RWdCKYOuo3Z6CFL4cjdXT5nHdOplLYzl5OUs7/pR/V87A/u5PSEy+CHzsP7a2CHGuniG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=go8QWPNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SC6eJfWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ECJbnI967304
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToFpVHJZk/lUK9UX1+SEAdhDulwgtbUtp6ILgHqAeZ4=; b=go8QWPNOH6CjlA7R
	IcndhXDMKBYnqA00x224TTRgRz0xrvXM8dsPV2vBEu0KLrD0YXPSptEdC/+inPoU
	yDdn8x7o2+wvebgEzQ5SwqtSpSqoSYdg3md0kHEooakQvON4eDKkhr9pBr0hAkhj
	gfUDyAw8EMgIkyjEhdqvQfuFPXO56mGntYePCP6MIM9UEy/SVFDob2o/LHXapIIF
	28/6yWRSTASvH7AwPXxqsMgUBC+QF5SGLtQi/JQnWQ9ZdOfyVIuoNeX7ficrFKL4
	9+aY0K/noHFqZXh7PfGRA93RiXmOCo5tRQXab3slEjjDU3Qk9+FlX7dbelrh3Ptw
	cbauSw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v2xpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:12:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9511f903b16so196673241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776175944; x=1776780744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ToFpVHJZk/lUK9UX1+SEAdhDulwgtbUtp6ILgHqAeZ4=;
        b=SC6eJfWxfsAa1C71EwP3l1Bu7+jt5BNk7VX2yAy77B7R/5bmEUkMtlgjA+6jEFct8W
         kSNiSBK9Tm2SMb6uKpiJvRmctC2X3L0Fo+peJlMDQzA2Wqj+o3XrfW6lB7jUE4gwnTt2
         hWj+rOnMaQrKnmoPbTX1evyB+tq5mzKk11/7vNYYwX4/lxeOm/UEfhrQHc9K/HN4QsxE
         cTWNVloMJ+gR0M+A6BXh1rLqeHmk88UwG0ePY7N/+KdsQT1pIdxIMA8RIqSBh324aGBf
         hI1KBjVBbsJ6OfPEIQdVvrQG9dFYCYhOnu/QEoAYlxnUPAwXND0SxvSW+KB3aHqL7u8s
         A2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175944; x=1776780744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToFpVHJZk/lUK9UX1+SEAdhDulwgtbUtp6ILgHqAeZ4=;
        b=mOJ7UYUeBv0xoEBo+s7iRsFhGcYnvvY2aQ2t1cut2xC1bSf3t5Qrc3Sx8SVdzt3t5E
         Ntnkylydk1hEAPh/PgQOc/cfXBxGg6aO+H3YPMDmVdwdS7BFPrSQNpq7vKrX7RaDWTb5
         iAfMFB9vnszOww6YDDVierTEkmO+jZiE1uj3aSbZjTOKRIrFjzCNy0Up/svtOaap2XO1
         q3gBbKCdbNIP0NoMcv4XfnglUIKBeceABnNcN+Fgq8dDqx0fxF8Wlk7SXJtKZKeXbNAg
         syH4KPS4yDXTFuNM4Obj+oHfMsn22FvdV/crSShwXWXJZsS44OaSejAnOdv7jKHd1ZC0
         xFcA==
X-Gm-Message-State: AOJu0YxfyST0FNC/MhSqvIYd/AdjcKBsoud2ztvl1e9RwlnhrXWxI2Uj
	3wjTPAnCj2AFGYrZAw7fOYAicadjFp6p68gamWoj2KMDTWXhdIuNJPvod9YnMpm1ibAKtJeyJBK
	kvOZQSmFZxmiEm10zB+gPdfN2cFH0rH8E1giUoA7hCTnJPOwU9YgbbL3KUyFCtlVyOlhE
X-Gm-Gg: AeBDiesXBfisVnjDTv+ojx2fsqK0vxILAsxskFtl4nFztsm0WJ/1Immdvzr4TvD+Mcg
	oPYV2vHUhUODDk1d7VqtCphEaJydZtpDp8AGyJU3PFJzshX+vYLXQrka+Zj5tKHfUjHWFFBCXN2
	CJqeXBj5qldskP2bY+4OmO/MDGDN+S+KC5CmZ9Cb/FRWWj7gv57no4iRpR2AWIirLbpESI3jX4d
	YDANsRipd6xAtw1Qg7PiDjOh2k3JSD4N8HFPJtPTWBh8d8cLhi4LOErWnCaTs+F9sm7YAVi1OzT
	XXOFD0i3OvZPcIU6R780WJcaJeQ8217vlB0wS9xiQnaw682NRf/Hshe8LbWDI5ysT0rQxdRhnaw
	AgfaAF8WH6pPhedJVFznRagVpfXva+rDRZRPOYLBOe1K/V2KYu2K3RyZhKYiZ5tYTAWQfIpLT//
	8gz/GBs11qYMATLg==
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1685455e0c.3.1776175943777;
        Tue, 14 Apr 2026 07:12:23 -0700 (PDT)
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1685414e0c.3.1776175943213;
        Tue, 14 Apr 2026 07:12:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6db92792sm393171666b.0.2026.04.14.07.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:12:22 -0700 (PDT)
Message-ID: <38233a55-d313-4ad1-ad5b-b33011f2d345@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:12:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzMyBTYWx0ZWRfXzo81K0kMY3MM
 Un1FCFJoeUA/DHtgoqaOjSsx9MV2oBeXVQdgRCMPYPYY2c/vf+tXyrjfmXXFmOgedwMEF3DPPcB
 73d5Z+55UaBZb8+DtQBTMUiGlmjBkOrW+z9/fV7IUAey1vhwAstWN4o+CIFf/I0PrWF5xqKBr2A
 pWWNsJ2qX0buE01z+dGIFYGxZlNje9vUaoMVdxJjyLPA89u2vyu+xeXICMBboNyAqE4cjqPaud6
 U211HPHY05gMye5NCRBpP7m1mUWgxtsQTDSC8HNRRofO9C/rND2nQu2+6fIT7dG8kNCZu5fTcFD
 PakiJ3romZghMpbWaR1gPowfw5kl0P0177x1JUX+ddU+k+Re1Bs737ALXwU4JvifN7r19/spzkV
 O4W7aASbWbibrnFeiZA/4ZWj1vLiCXFSMBNsYrxcjJiDCtnuKVKGJy9vUVJVc7lbDc9sFX3cN5h
 mcPEopgvV+oof/QDWfQ==
X-Proofpoint-ORIG-GUID: O3o9SlB5LwlVcvfwpF9wozVKDh6tCeJl
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de4b48 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=I76Qk8w-AAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: O3o9SlB5LwlVcvfwpF9wozVKDh6tCeJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140133
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103142-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vinarskis.com:email];
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
X-Rspamd-Queue-Id: DD5F63FB027
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/26 2:55 PM, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;

Did you check what Windows configures here? bias-pull-up would be
customary for active-low interrupts (although there may be a
separate PU resistor connected too)

Konrad

