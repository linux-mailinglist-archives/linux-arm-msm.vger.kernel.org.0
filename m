Return-Path: <linux-arm-msm+bounces-115123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JoUHHvN9Qmri8QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:15:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C878C6DBD9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:15:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=McV8P3L6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="P/xnIFom";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115123-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115123-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB8FA3090422
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C2B341ADF;
	Mon, 29 Jun 2026 14:03:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB5833F5A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:03:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741805; cv=none; b=BQW/giUE1DaEswzf/dlZdIhk+5vBqESpDu3blfQOhRV/dIPancF0QDRhFGqTFBe8quGtM3ciHio4xUNVXpe4/Yj/qOFruOQYFrykhM50P6TxuxJ2EpPaUi7fikRh7vBgWeXqqZsyFB9Tm0D1ZhB+7scMyKiUL2B2Uv1CHhiXbHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741805; c=relaxed/simple;
	bh=yLRMWt0gSG9xo2RTtUlfUSWI+t9Ex8A2TuGnqc1Yy7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkAjhbkLlZtINyM/H9WiYvno0D2t2SvRrumtRhsg716oEQUCOFQvQG6gYfKQBYdmguPVW0tdEkA3Vrug4FqKfbFRIt7FtojbofvzPIbzdGBkXHJ6GZYrOLZR3+fwpQDl6f3H0sX+fssA9kcFvsjwJnzzfCEuGlijJfpT6GQV4so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McV8P3L6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/xnIFom; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATS7o2592837
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLRMWt0gSG9xo2RTtUlfUSWI+t9Ex8A2TuGnqc1Yy7Y=; b=McV8P3L65Po9kJ4z
	T0xMsPyRpbrTNLwpiOLiAZg7oyuu7xsZCz7EddqvE2mKbkYXffvoIcKIJXlN1QEU
	WIjwhiWUpQAjqCJqa42P7XYmOqlJG2nNpWIlXshH2V2LtOtoa8vGnOrEP17Ef1/9
	X6C7H2FR3TeaP6ogXFNyZmZiF4YO7CERbvvNa+rT/k655wLmg6sjUO1EbxBOU41V
	AA4vewqb5P6Lm5GSUz/ov0QkPh93U9wog8RdSa6zgx4sdiPXk4HA3eKob4pE0scL
	t17cuEG2LMHKZAa2Btpt3+pYMmTnIQFmiXtF4Xl+JkT1u1CsMBvM+4UUlUz7ASus
	iQ1zLA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vj02u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:03:22 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a15d04ba1dso60824eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782741802; x=1783346602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLRMWt0gSG9xo2RTtUlfUSWI+t9Ex8A2TuGnqc1Yy7Y=;
        b=P/xnIFomCPUabdCFh68KIhYpA6BMYXsoZpfdg5L3bB+xtALvbsBYOAhWdPmrJLKYoh
         REzprCkDiTcXwC+7yrpJRhA3o5nTnLVooJKvojHKNlTScNdmipVRSMq4Bh5HI3E+uV/l
         zgDJc4/zVGyXgpfbt1NGfDRVHmsTyq5Ri9zTnmcKKtBQOdpfY0cLV68HK7GJ0Gy/IN/W
         RSZAUku4cBn9j/C2vZyoMevmIcTLAZxlN1U4D8eUydYKCm61thJLp3gGnfhVO4UiKq9j
         4H5GU8SJFHlJhS+k/ISnEtnAjuJNf2cyoxasJ0JQc+KhreCbQwFcDOSXBJUx6InkoLQL
         ygOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741802; x=1783346602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLRMWt0gSG9xo2RTtUlfUSWI+t9Ex8A2TuGnqc1Yy7Y=;
        b=mZmMyO6WOrESipCn6t4PPmlvccDGzQe0U1Qj6JSdoNTz4yN9ZCicXX7+Gowhji0cWn
         M8l4w1ezfmgIOvsx7FwgbEwnw2vk3dbvStqMobPbLmi+S+WnVBtMBPIAtgwo2ahlsnI1
         ugZMgFtGfNAl6cSK2r9EyP40HR6uW5FOILHqQGMIK+BWY3QI+DuaDoG7T1b73X4eKVW7
         9fOyla6gO5sbai+yshmXkZDEkZKuhXgjEJg+tLomv2jvVDGgOdZ5aYg01rJ72Z6+FK4p
         bzRM4Mv4DjpOUXZaYDgXFsuF/CgD4NpxMVjeR7ryixppkJBvcnGCKBe2r1TX8/hYIxzc
         hRzg==
X-Forwarded-Encrypted: i=1; AFNElJ/XKkF6j5df4LrocY3RSCI0rCRKWsyWkoB6tnr60Ay6Rj506DrULrcNF3e/ybrtfU5gH5rxfRw8m1MoF9DJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyaVcAziOm6KZpcaqpTSRESgYe+aqb4VKQ2lQZ6tU7J3KgQBwra
	yUIrJlKGTIwIHUIU1NHRw15ana6eYLesUlAPSwIh/WfH4WhMvLPTJSVcGPz48MTjdJVFAXL05w4
	6yAD54/mIFpNqHuSnnJeQ94f43i/MAwo8b5FnCYQ2grob3nx/7H58IUQKs0kRKBYowDuf
X-Gm-Gg: AfdE7ckw/8QcCv21NkTTs2iW4FATb5iz1iwgvF0zXmkeP22nBvBm5xX6zFB4MmzaSlK
	IR212u9VA3eOO8pBe0gYjErd8csrxYnnAOWbOhrVY9GyJia5nlv94iBWOkSAhCsITlIUkAmosrJ
	98SRJtMcZPqagq2zGO24tJgrsjv8zcUS/uhgaM4QlIWw4gfU4T5OXr/JcULw+ftySMWqD3vJctK
	qT3wHm+4iD+qqOB+/gXNek5Pz6ZSwqcrtljLKQsTVWTDnIyweoq3Bc3fuWecPMnwP9rGVnQ03R7
	Cv+Nl+eAzUwCyjY72f0213CQNIPl7aKpP4EdJEUAz/q28oLyJhnhAcURCBmhu0MV4vj5wZOxP7F
	vv/efUe2CaPImfqnYauQNE7Cxjuek5so2Jdw=
X-Received: by 2002:a05:6820:2dd7:b0:6a1:7ed6:9de with SMTP id 006d021491bc7-6a17ed60ad2mr558973eaf.3.1782741802172;
        Mon, 29 Jun 2026 07:03:22 -0700 (PDT)
X-Received: by 2002:a05:6820:2dd7:b0:6a1:7ed6:9de with SMTP id 006d021491bc7-6a17ed60ad2mr558948eaf.3.1782741801604;
        Mon, 29 Jun 2026 07:03:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1250a80b04sm283661766b.34.2026.06.29.07.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:03:20 -0700 (PDT)
Message-ID: <c56732c2-2aff-4c3f-801b-b798c95918fc@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:03:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
To: William Bright <william.bright@imd-tec.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
 <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>
 <akJIGk8BEgHQrt34@will-Legion-Slim-5-16APH8>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akJIGk8BEgHQrt34@will-Legion-Slim-5-16APH8>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KMN8Do0WjTTYk5p45o6cNHjtujpawVEL
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a427b2a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8RGhZ6I6Z7cABIXISqEA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfX5UzEbiJbqfNd
 FoMNrf04M7OKkqUMA7qGlO1KnHFgDpcmJHy8MyQLq5GkzM64NGMlnLQGyPhlZ25d9kr1FJtkf2E
 yy0EpGf5wQCBO3Hy7INhCrAhGmIlDlg=
X-Proofpoint-ORIG-GUID: KMN8Do0WjTTYk5p45o6cNHjtujpawVEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfX+KIhD9PL/2fM
 dbA1bSy4OTr5c56NV0rh/GVF9Gw55GTcut/sepHZjqj2kwLCnJylC4PGg+/oZ1BFBzk6pxFmQLa
 vkYHq5VWpGNTfU3QdrLaOpUl6lQBf5mKSBZCAukaDiXsRdaUNIKctnyOQr1bgWuHli4jmUsbJBQ
 w9FMVTmFg5vhgxitS7Bj03kzZ80RQMmUcE7pj8Dh531wPaPIZrFBvjVEH3Lu339LZ7eUDKo/S7c
 C7dWYNc48baUPjHGbyhYXbhHUl4zGD3kafP1DWD6Fc3uiyKP+eWUM+F53zCS9IKWgsUVTwxd7y7
 aV6IWA+wirZ17yMN2EUig5i6RSXYYutPOaevMpmgQH9AB1vaA4qL86PmR1uSisoD/Tjgl2LhyrJ
 JE6aV0Cp7vGWZkSQ8K4SY5Grah8zOBgfiWgh9SxEBpKg3Za3nz/kfsSU1qI1KuHDL8NSwQK/Nhl
 E3M04+znF8WJdQtAacw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115123-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:william.bright@imd-tec.com,m:manivannan.sadhasivam@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C878C6DBD9B

On 6/29/26 12:25 PM, William Bright wrote:
> On Fri, Jun 26, 2026 at 05:18:20PM +0200, Konrad Dybcio wrote:

[...]

> The PCIe switch we are using is a NXP CBTU02044HEJ, this is a simple
> 1->2 switch that is not PCIe enumerable. Given that there isn't support
> for this IC already in the kernel and that it will take quite a few
> weeks/months for me to cobble something together, I am thinking that it
> might make sense to drop PCIe support from this patch-series in V5 and
> then submit a seperate patch-series with a driver and bindings for this
> IC whenever I get something working. Are you OK with this?

Sure

I'm a bit curious why do you have a switch there in the first
place - is there anything else connected to the other port?

Would you like for that to be switchable at runtime?

+Mani will probably be interested

Konrad

