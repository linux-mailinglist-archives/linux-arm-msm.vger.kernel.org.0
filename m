Return-Path: <linux-arm-msm+bounces-90935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJK+NtjgeWm50gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:11:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E94A9F471
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14A913006B2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFC52D7398;
	Wed, 28 Jan 2026 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhUwlHLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrohMtSP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A13129BDB0
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594905; cv=none; b=LvD3NWVJ09Kb/N0oQQEnVANAUfWFShlwah5wl3L+Dd8MIrGgCLJkMMZQAlqJI4nIJGsWW6/bdzA5wft15KStY30DSin+IoJ5Yq7leaXXqwAkVz4wlVqMO6zcgoExhjaUvOw2p2GzDpiHIMbBLhGVKWVt6/2NlvwfKb0rqbx/lQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594905; c=relaxed/simple;
	bh=6JQiF0AakGIzqbdZT0eSTXiuqz8ceNI8FjSAg1XACkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgYE0dTZIIA5vMd6oeoua71rr3GS8lnFej/E5d2dF7CguaTNecpnIxpO1e4XPZa8CZzm7f5xB+NLEeo70YT3zdQEr8RfYHLEWdN365rsCjOuYpULX6LTUt15XYDYoHtczWek5iU6ftr3Rrmw1mjYNR1JXl6bvJmJUJggqS4HQyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhUwlHLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrohMtSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92T6s3907690
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pOB9Mc1t05G3vlFbXQsDmBPybhMHNKbNriOahysDpaQ=; b=JhUwlHLJ2rf3WpSv
	xj+CqCJujQTZpRwlnJWMpL4v8S9hcbyXuLc9LIK4VOphYikmOO+j+M1u9RMEkMi6
	WY5f9Zr3+oVOaPwRhzainRtzfBrnwAT6kAnNXcD0KvtMl5ndzNlaCpsTHvlpPGaZ
	n4YAWJ4KdIMTNGqvcbJry+BHrvj6iWjXR3IwY62mgEYMKsccl4HIRaZ9agNlPO8F
	O6QvtfrkXw1DDYSQh1jfO2Ao7S14ngKO3/GUxlBLfIqCompxv4WBjySZYJ5+vpav
	LdTQdarn83249vtWTHMxRoMrhoPsUBVAoKNzW3FDvthZPuEc4O4JEeW+zEz1LjTa
	TlRGcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g0barg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:08:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7177d4ab4so6001885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769594902; x=1770199702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pOB9Mc1t05G3vlFbXQsDmBPybhMHNKbNriOahysDpaQ=;
        b=SrohMtSPwhL+YahF0UxhuTXneW4CKeVcI39rAcawk/7ORhJTIDHwwpWSXou5e+YyVP
         OaxLS/2pqnwFmQRP1kh5U1D6KBk1XaPxB+cr6LV7dYQzM5vUsQ0MUOFKjppB+XEdlJhO
         ePg+Q4g7oe+LTFkmPCq9E6RjbzUTZBu3zffxKA/LCgNRJo0PgqU7TIDNMywQTHhD4e6p
         07WDTRoAZcUmnIwgGIfWdKtFHiogE2B7HT1muaNQNP+mWAhcuMmNSQOttMRPRvGLz5gz
         8byvH6o0JMg+Qcn84dCtVaYilTBoBzuhkbFtj+wku4gzZEhWX1RObKnJLJGEr97i20zp
         zTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594902; x=1770199702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOB9Mc1t05G3vlFbXQsDmBPybhMHNKbNriOahysDpaQ=;
        b=VT6lOgLOsYS0YbmqiwkxIgSUDyB/SmBAeh2zP3YqcfW7DYS0BBnJXTAedpssK2cDiw
         auECRohokISK83umLxSjM3mwBUw//FGCqQRngYpVcNlgKcjjzfcOqL6T4X8cgmwIt+Vj
         o2h7oBpTgtpSZakpOOB3TbJVDbN91E+UNO4iuuDZ8jE2V/WWhoWwkZw7L5xfVyGrKwHw
         bYz8kK9GQ2BLoo3USWAjV/FL6RNXgSA+ITmLVXL2565QdhPzcaNWCFm1TZlW4LeMcjj1
         VxJeqaqzMfES6o/lPZbaiJ/LRKvXwLdZUJqpJU3tZros0y47cg9e+oyFTeNAlMNtFnfh
         nLtw==
X-Forwarded-Encrypted: i=1; AJvYcCWdnJBhmEauSolCqZtmq+FxkiKcJw/y+GYz73LYBtMfJSs5EEevDSsbviGwTyIYQuXLq2TP4WQIdkwZZf/8@vger.kernel.org
X-Gm-Message-State: AOJu0YwufRq36eBYfelSa4kOoN751UdxNB8HxDFQDO+yle91RqfYfNTT
	rIsq7AOBkhMet6zotwXwAyEKrLUcoj8OFxnDA365WtZND/pzhywrv751T5iX8jPqAs+V+qOqHMS
	xLSTptiAPRjedIqNclOvr7DcbRH1hUDYRzZsUHlPB4n7j2hzm3QLy83sGv0+pybTccI5N
X-Gm-Gg: AZuq6aLo0N1FdjdljY7s8g2xTJGom1gHTibKQ1uC996CR7y591+rLHZ4uKUx22ZjJqy
	ZRNWFAGXDZwSJaHTqH4OMjB7AHYjaT5ZnoXoFygj7z3EmjHCdE29AVX8zuAUc2Aq4CBvgjXLDjY
	YJpzwE7LlZhlx4vZ4Vkica5+5AG4di3/iYzRBYI0vQhA/CWk/Nb8tePm1iE9JXniOEoCLX5QIqw
	BRbS8bhHryJfXRdtpiD/x01yu4PSQH74XnhtZhlSIrVuibCq5Tj7rJ49Ti14P5/CHsQyghDqKV9
	9Wy4WouMHlS9cLXZeAwr3NaGO8FbtaPtTg0cKwi+Npj6BNPpyB9BshcZqZlQZd6ERC4oQONyo+H
	C+O/EmXycaxa89stEmdnjjug0HmkQGREtPS/ZgZyAURM0Os3Xqo5mInqIBBafnAx6oPU=
X-Received: by 2002:a05:620a:191f:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c714b9360fmr107859185a.2.1769594902492;
        Wed, 28 Jan 2026 02:08:22 -0800 (PST)
X-Received: by 2002:a05:620a:191f:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c714b9360fmr107857285a.2.1769594902050;
        Wed, 28 Jan 2026 02:08:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183cbesm104851466b.38.2026.01.28.02.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:08:21 -0800 (PST)
Message-ID: <82c6750d-8fa7-4837-b537-8fc6df9841a2@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:08:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DqJsROTyva612BsdDuEAcCBq_yWo5j-C
X-Proofpoint-GUID: DqJsROTyva612BsdDuEAcCBq_yWo5j-C
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=6979e017 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vr16hO-9cjX6QiRLJ9kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4MyBTYWx0ZWRfXz5i+vs902fkJ
 if+4inJVdjXxUm6EFB9gYVQdhrN9GtLXJC8HIrbj6d34rIHXm9vmJpIAI7jEeDFYuNeHPt2cOG4
 x0Z2hM15gcCI4HVJENKHGWDP8h5mgTyB9X4c6YMVFyPk8ZHv6/4SlwbKNzwbWdSSDKZhhxV2VZT
 K8EUUwhAFzIFktfseLYrEtRknjxiA8R8lIxeaYci3JdwtMismkrBBzmlUyMotJpIVAFc7nPImtK
 2jGIzXEUwFB7I9GUlKhCnNP8nyUO56AKc/6YNMMkEUnt6CbVWzVAYmEXHD/hFC5JYcSBbSkKOwM
 ILlQcs1RpWBBJkaxIVk1kwpKZsL8nrLKKyIskRyFV70JRXf7+1AFGpDknBmhDO1Hh3LSvZZbp0I
 dfeSoRP8NT9/GRy+P+CCtiA+RbKXB7ZWbyM//OJ4F1nYx/pDzJ/Ej4sYupCHWOJ/NmdNw+p7VD1
 4aHx11R4zlYmkHxUPhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90935-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 3E94A9F471
X-Rspamd-Action: no action

On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
> X1P42100 video clock controller has most clocks same as SM8650,
> but it also has few additional clocks and resets. Add device
> tree bindings for the video clock controller on Qualcomm
> X1P42100 platform by defining these additional clocks and resets
> on top of SM8650.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

[...]

> +#include "qcom,sm8650-videocc.h"
> +
> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */
> +
> +/* VIDEO_CC clocks */
> +#define VIDEO_CC_MVS0_BSE_CLK					17
> +#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
> +#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19

I checked a number of platforms and the _BSE clocks are only present on
Purwa, without any explanation in the corresponding docs.

What are they used for?

Konrad

