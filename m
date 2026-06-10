Return-Path: <linux-arm-msm+bounces-112378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I2KLIwosKWrDRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:19:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4D667BF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:19:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n0sEfToN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ok0jlbg6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112378-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112378-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C45B5302C0D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6B33B14B5;
	Wed, 10 Jun 2026 08:59:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F23ADB91
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081984; cv=none; b=SZBgboRWB1d0+8BWhgPW4URj5La/FPcbqvTsvCrfCoQx17E0eM+WymQtTLimoGkkJudNc6UyW6k4doCAlyg1RSTLxsF8SJSD6l2miO7v5gnUVPJlNjm/0ypkheB3Xx0yzUp3XLPMp/d1RGm4uOL9bRBhkv+Z4cjDP3nQjYo5Un8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081984; c=relaxed/simple;
	bh=Av7ZG2i1gLJEUjKcG7mtXe6GDqWW+auW0QTqhvZU2cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+A8Uc8535CjS5ctyXYbCtNQ3V+wXoWa09+sEoljl9125wnqeES+y+z4L8+GkGne7J4m6YU4nxrYWpTdUO0QNhKe1FHAz+udvCjxRZFX3sAXA0psJeRHuOE3N6a2xt/uACUCA4ZJoHEbQFSCFo59uiKJ7y1Mj3p4xKiq/hLxtzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0sEfToN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ok0jlbg6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hhht531383
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=; b=n0sEfToNSM14fwTj
	I91GHlIR7zseYUqKJ2QJfHbsQxHNC+13qoR+XkAODFzRxhkvZqAwOrVdyB23poEt
	z09pL53tCjnKDsNRgUMfnqPopUYWAZQzMFgoFuMeRqSPX5CfjVac001Q/lIVpImn
	7BGZtR8Jmu86RU/Yc2Gb2QrSUti2x8IMtOuGb5/kurUr/qf4MfVgHmgE/4Y+1Pe+
	Q9EcXIubdpvvPXqxuZnHGdeFRimZC9IIrigaHAt2HBYNe7G+iffxgEWGVo8HlSXe
	Rha5fxzcxkrekZ1tO4CyL24k3gzoBcvMoR/9qdgBr7U291ovg0NUnzXkd7ufUMmg
	k5fezQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1s07g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:59:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ded346eso12831241cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081982; x=1781686782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=;
        b=Ok0jlbg6S1ZtRn2nzgmKPShA5QJtc00NfJBPufdZR8dTicwTK30k1pEbSyW3HLgL3c
         05sG/0dSC5JyLKQdU0pVr7jKjpb4rBDYD7oQau3e2EHCiOCsWJ8I7iOn2/h87DzsgeGo
         gfXwJsKOJvJWTudSKdic5lsmsaWTgY8KG/rE64PeLk/rAVRK1Xb+v1QllFwKQEJCB8VF
         3FhyrMHSpV5bKRqWnTZh+cw6QBy042sVa9FMZtKVr2DTozcnG5lm/iygULuOqNpapV4b
         JApgeBmMVT2/yfuyqXjBNJRF1thdcLfXTaRRjVoJoFvSWqSsn15zI0TBUcB97qNwQkXz
         co2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081982; x=1781686782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=;
        b=H8dfHc/z3FeqTaHuQtc161k32KYWFWazqOYxr4HlYJTnkL4Mj4I0oNEfxIXQzUEYvV
         s5IZcG9ZhCxyVpnwIz0uXJNQpCeJLjCbdNl8Z/H/npbnAAaeg8dtCfNOGJHU91sAkMFO
         bzlqbkHdp4u0q00lVYd5dpGvamlPH/WbA0ZnUFXcTu/KfxjUUID+p32NWcYLKfrqIFHF
         EsHO2fCxBFbk37/nrbnbN5t8FB4upKpjcO0PZ1HrOLDXdRTD/218QcyxOOTNGE1UqVnF
         0XCSkXPiSKWVOgwllVCjwSwKb65HfTTEhDt/K+1Qyia5mJXyKhXEw9aNGZeyZdAbUGIQ
         oHjg==
X-Gm-Message-State: AOJu0YxDvVspVgC59ZkBrHusrFFa7fSimA1SUxmDs/BGrVLgECGq9Vwo
	Wb140mmsgN1n5qSupgiF2XqBD0/DtWMJXGgOiPa1k+Q6pYPf9xoGUy1X1Q9Mg46EHDuKvvQwdve
	lCxM3hNswg2ABQM8FgNSAm7JU/g+r8kMNtxwj+fcLbIMQSbkLVzhV8jA3ek56FHIX7bBg
X-Gm-Gg: Acq92OGGIcKCCNqPVP8g7nKXV4ffT4W4cGh25nKUHV/I75830fRcIGeDPKA/1hLCW2t
	5O3GsR5uOUkybZplol0kxN6FMBTP3kvAHFnFeVH+5+qZvBbTUt+zsxpl0yDCHdG/BapuPBi3a1F
	3er0HzqtFwMD/E/z0oe9hC6MgmBxsXZe15ZH9vEm4WfOnxg9UyYXkOoduojfcH6cudTfMyzS9M9
	du742ongfzy/mg78nv4Hte5qIOTeEQZ36YyabpHdPtsVEuBvSQYgK0TIGni1JJ8IKhb1YRBZu/E
	yCLAPsBIgxc1s1CpfhYW7nlkRME8mQEh5VIQZXV01DDmecck7yUU2UyR/6iv/c7vkgs6XzvfNXC
	xRx3J/64QS8Em1o03ESmT1J02GekdYrYL0v0qvUPQ8bxwNjOchuR42sS2
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr196189841cf.4.1781081981879;
        Wed, 10 Jun 2026 01:59:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr196189601cf.4.1781081981503;
        Wed, 10 Jun 2026 01:59:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770c7csm1164756366b.12.2026.06.10.01.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:59:40 -0700 (PDT)
Message-ID: <0eedf3d0-79a5-490d-b1a6-44a9eb60e0f8@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:59:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574,
 QCM2290 and others to ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-1-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-1-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX0hMqTPp25A3L
 oWM49jAn6L+uz3YkMDzYz3N8kI9zFoKjvUDP/zi+o0TU/tF4tIm7cr3bpTyHZvlWz5qLWfhiWEh
 tfAtSuQjfreTZqv1vi+2FOzn7Q4hhZShTYJgypG6FFG2eTCZR96YaCGVQ/paZ89FitSh2SdttY+
 +roUz/hekcOIXD00eJa8YM+5HWA4miyMQc2MZcaanqkEE+l3l0xetzfWVzS3ubiYb3rFr+npctr
 M/EY8tJ86gNU03xtAbWjsDDI3PiyAG2ckMyRcWxzYV61N1rteq0nN9AF69xWdm6DjD+ZuDUFCqh
 ybwplTQ3Txxbv5SgU0w5UnN0lrIT/VYP4pC80XCNSBUtsny8d6Ovu8cehWE5uNMEB4M/bqo81/s
 bd7YHH4HarGncOTJqGIeRM/8hJJ5VjRNKbW7S2UclMcTxPcOvLr5cc53PV5CGsV8VMn/modJKnu
 odUF/6ZHm/cVTcuqQsQ==
X-Proofpoint-GUID: k7uKIAzo2Qb1-1JPwvBJApJxOaVqpSWT
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a29277e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XY21xBfZkjNNQA91HVkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: k7uKIAzo2Qb1-1JPwvBJApJxOaVqpSWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112378-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6E4D667BF6

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
> already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
> so should not be a choice for ARM 32-bit builds, to make kernels smaller
> and user choices easier.
> 
> IPQ_CMN_PLL is used only by the SoCs already having clock controllers
> restricted to ARM64
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

