Return-Path: <linux-arm-msm+bounces-103703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHLkMS7q5WnxpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:56:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 308AC4288CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CC913002A15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E133C38A70B;
	Mon, 20 Apr 2026 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8O53QDg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="daXU8Lyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F5837FF50
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675092; cv=none; b=MpqJEUA3kHAjuIngrF0xIbqlE5SUb4Y7FB15XZl0Axv5w6mfEZmtq5qvdTHDE+/HZJFzQWcTx67pt051HaCaZU7fjPjaXPBX4zWflVJc+xrhD3fIjgfrhig6U9ayfJ6Do7y4Tq9bgigRVPDOodtFanxTqDHfFf+PoQ1DBVuAkSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675092; c=relaxed/simple;
	bh=i6UBZe8oWJSRHReo+WKtM+z3I85aFUTeaQjAUJUBrv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p23xHFcckKvTN4ptplQ6inX5lzrm2+YS34XfguQVRZXtLkU+m9A47Got8XRB5q9Uw/Al8sFOxyAPCTWAqrraz554rRDIaavadkFswhUbXECBtP1ZFuYzbfcL2CRtGZVVqld6PGRk6lBi2GRm50R00OyqPNv/UDi7qI1fBcznpGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8O53QDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daXU8Lyj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7W9Ev1475377
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TelR88A70ZT8Cwr+SBo1h3ZMdcp7gxqBAEC/PIHSITs=; b=h8O53QDgrv1NX6Da
	Lx8qfNdtRkXI/FbXw4WOIbtL/TZ4VqHbsUSt4wMtI1lPFGvCDVXKCHtVQwSTzpwQ
	aj230XYTwP0/kiqxnsXwtxG/Qs2CuyR2CZeWzkyVowbSRD+eOVoF39Ng/pOl1wct
	ailBhhGZhHebVxLb4O46MWoGqsxlEatZA6tN1nZPbrxIYgT1yrd3W8R/cnARoKCW
	95ERJu/E8mLT1NRWtA3emrRZchRC/6CyLnw6EIFD6iOmpfW6qlsrZ5ZMDFdjBO/T
	Od7X4ef/PU+wCmS/GvwHwAc9qBLUnoucect6pN5yjiJyYf2pNy8ezWyoqJ6vBDkK
	6qF1bA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr5ak7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:51:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76bb22a8ceso3233170a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776675090; x=1777279890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TelR88A70ZT8Cwr+SBo1h3ZMdcp7gxqBAEC/PIHSITs=;
        b=daXU8LyjXCNaDcPiyLt8EDV+tsqb3rlQ0FNUUZPONA11fxwsstWk7XeezXcICcK+01
         Bl9ZFMxpiKvmDAsO2kWoYIVJAn6lVMa8tZbWzJnGNAPUwKKzVPF4gUhm8NdANVjTKys9
         C80MSOu1zyMVCbILv+4tMvUUfZjEBQNSAriyjhQAR7DYt0Nd3u+aM4ZKVOw/xwQMbsgi
         cHXcIqFeNT4MkHtaLPMh9mijky1beB+oRNF38Kbq5tLHMPsmLEQPNaKGTjCb1iUmRzGp
         vNDU0aUGpY2yc/pAjfvqJdldTkIa+URvSOTHrUyKgsmve80m5E23J1U/5cajGhtHHH4M
         3uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675090; x=1777279890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TelR88A70ZT8Cwr+SBo1h3ZMdcp7gxqBAEC/PIHSITs=;
        b=K9EwSsVU8UoKVgOiKz4zttxi8jysbv1M3B7lJQ196VHExhOxC0r8DlV/uM1xTbNxFH
         j16QWoKZQmIyZrZmBAg4YWRaXEQhk3q/rNfyZq/yN5LNYf7r25aozOTm1Yh1GOXUliTC
         c+gTmWvQ75l1gs02nA5VYGdZ9HCg4cI13UOoIcVrltfipsKd1ZiNPQW/EVz2hN50fR9w
         Z0xRlUdmaQjfRMYcxZLlT4DCCw6x/T8H44mUZ9zM9cvBxG+q4mKUnrWR2N//hMcvhS0V
         s7ddmvGRkRRKjcj8163JH3hjq9JkhIKNjMPYS8gPAtBGBZRGzh28OjG2JhzKOZPntIdP
         vD0Q==
X-Gm-Message-State: AOJu0YzjpeJlwksKc2UpBlDSO8zYf2l6MuXbBLWtU/tbOXN0AiP9nVJo
	xpx4Gsnsg9XAqllw9ENPBDTXFbzIDt3NCe40Oc7loPizorZ+jvdZWKqapw+vCxJJt61EzCWA0Fw
	smanGnPF3VhoKoclUB9Z5yos82tAcIz3cYC4o64OunERVkAOGJOk986l5RtN6wX0pmsPf
X-Gm-Gg: AeBDievZjr3P4j0ywpNwfZYic5uUjlaYuUHV5+Dqv0Ar0aRADqvMK7xz1txcdTW915L
	eRJs2ey463ACeP5qg0V9dfM4ifshOdZR6126sEArgcW1GHvvbV0ENxp5lTTT+6gJHv3k3p2vfVV
	4yIQdftvWsoekaf35eXTjJTnf3cqbWzoI6m5rgrPYrb443dyCj6TgqxyRDLBMS5xSGYaayikPpH
	i1isKHqYFOI8qapahZLg9z+Ghsadgde7fGHRXfei0o2zbXv3oi+WhrI3lB21yGaVL2LCtIINGcI
	9SHAYafrewYNqQzSUIURPJUoHggl+/q63+9APv22/dpvw8+VqZGCnn5n2p2JfK8HYaXyZDkoIdm
	JQVvq8BA9qTBQ2w4aaw/rQsF53god2pT6D4CnAgZQw7s2Z6ZjiXxiidSi+k8c
X-Received: by 2002:aa7:88c7:0:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-82f8c889b28mr13218543b3a.21.1776675090165;
        Mon, 20 Apr 2026 01:51:30 -0700 (PDT)
X-Received: by 2002:aa7:88c7:0:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-82f8c889b28mr13218518b3a.21.1776675089665;
        Mon, 20 Apr 2026 01:51:29 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe41cfsm10618935b3a.43.2026.04.20.01.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:51:29 -0700 (PDT)
Message-ID: <951363cc-e09e-42bd-8eb2-ad4bcef4dcd7@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:21:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
 <36b68a87-4d52-4d6d-9e5e-393eece1a434@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <36b68a87-4d52-4d6d-9e5e-393eece1a434@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4NSBTYWx0ZWRfXybvjl74aprlP
 hh7jaAgd+GVEgTlyKf9FX5q8wwub3qPEndDnZFVT+74snUbdMcu1p8ufYBHkvtIVJxVe87nnYCG
 OHeX6AdX6lBsbdIHcUqo8bG8cWQdVoeO9DimBeV6HlsImU5bsXje4t/V2AF96U6V2EvbqVYvkRA
 2TvE86PWRTpYBIjmxGkiA+Cm4QEw8lkDJtDKHqYQ/Ez0Z82M/cSp/6wmTr1tOzG/zYh7q2o6hh4
 bjQwJls7tQ7SfG8U2oDQQYcP8D65hs3aPJBEFjg8WG08MPxNWpp5bI68OmmJvLlsONVIcKj0FaW
 a22Mw87LHk5kzJfbKzjCnLmt2D7cE0WyujwCJBDefSarjcndikVtamfwnpN6rf+h95ifV14zkMN
 IEZFnxOru5GQI0I3N7CXj0mL1vkk8iuqB0f4Kn/sQs2Q3L64vFn+w3FQNEaPvNrpcHaViRutUFK
 zv5NDrkvyYBwabnu9+A==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5e912 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RCzW09EukMXCWuothKEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: B3OVed3OmejHbDk1N2psD7bsq-S3SlGY
X-Proofpoint-GUID: B3OVed3OmejHbDk1N2psD7bsq-S3SlGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103703-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 308AC4288CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 2:03 PM, Konrad Dybcio wrote:
> On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
>> runtime power management.
>>
>> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
>> improves power efficiency on platforms using LPASS LPI island mode, and
>> aligns the driver with common runtime PM patterns used across Qualcomm
>> LPASS subsystems.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int lpi_pinctrl_runtime_suspend(struct device *dev)
>> +{
>> +	return pm_clk_suspend(dev);
>> +}
>> +EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_suspend);
>> +
>> +int lpi_pinctrl_runtime_resume(struct device *dev)
>> +{
>> +	return pm_clk_resume(dev);
>> +}
>> +EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_resume);
> 
> You can do:
> 
> SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> 
> instead

ACK, will post accordingly in v2

> 
> Konrad


