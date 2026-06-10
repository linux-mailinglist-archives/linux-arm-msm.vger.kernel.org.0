Return-Path: <linux-arm-msm+bounces-112487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M5Q+O9RqKWoNWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:47:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD9669E8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:47:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FCeOFlPS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NWhitUcN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112487-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112487-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE5B2311CA4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B104071CF;
	Wed, 10 Jun 2026 13:43:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D2240863E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:43:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099012; cv=none; b=GjwbUsbtXS+xDruZJs234jgbMg5D8svLlYLU7KcQ8gMvLrjEtSOpAnDP828U/qCL+3+zV2pj3zfG1h4zktdkBVq8ltrpmgc9ywvuqCGd+jVFiaOLMv+nVlCt5jOaswfzI62Fx5wZyQ1Igv1i96tdi9ps1mIT2kN9+jbrJ7eFLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099012; c=relaxed/simple;
	bh=s9ua0UmvL6f5kRD80XRjmdjy55LKKwOuM9f/hvYKY40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvLVsVoTRl0129yUKFXnXeGwE4g9jNI8fLetBackXSw71izVajInP9afKQqyhSiSn/eZjRmJuM9FcULQKQdV1MUR9QkYR1l6rLUp3fqAqzLGo+eps+VkBSAlOOJBnajSM5BQygDgE3cK2H6CWHMq9duIxsd6ZrGKL479DHfptK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCeOFlPS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWhitUcN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBjHI1169451
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+d+uOIy0pDXw/dS7D+a0SvZQsQcUuq0fUhk4Xwj0hOs=; b=FCeOFlPSDayy77sy
	oTDBixrF4W5gcabMe8lO0FNstbB8A1Ak+3MTq/TjEaxVNe2CFLi+kOmwzv0iPdDP
	SWrztpVvtDnWO3T30BcivsOFNSnsB8Ee8TNXJ/L4A9yrnSOQpVg6s7zTaIS5BfUi
	NpWoIGjx/gJI3QWNcrqPwpyOLc2b5NSs730JPanq6UOq6A3LZ80jXx1QmtfLNZpF
	9UvudnifUluefpcW5AWdXs+Nbr/n12m1hbYZrBN7DDVu/kLGXOjqhtjGnF+xqXrl
	7OG61ivjoNInaRS8CrMB3FO3vSAqTzD7Uqz2TLszuTe/kzEby7/hc61iwrAp3CV8
	omdz1Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s225-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:43:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c6d4a825d5so300170137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099010; x=1781703810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+d+uOIy0pDXw/dS7D+a0SvZQsQcUuq0fUhk4Xwj0hOs=;
        b=NWhitUcNMhyyLH9LhgK/P4UjqOb0KT7e90wmdsothcAcLI3XCZfug8iXcYCkALKE9C
         RlSinjgMZwqJUR87O8kpszzUL5GjiVrU/UUpTT8OznZO4g5doEN3M1k3y6QGBxSCEEb1
         o62OftRP5RchSibINMTdl77WG7NP0xNAW76MccFz+OzEM66QsuGGQKiU6/ml/K0x5jlc
         theaSuWGwvs0JfKGjyx42KVAToRgM7R4Y1FTXZRqevarUP6lsMX3+8JseSzAIacO4GSn
         kDu9aye/ZYu3idZ3jdmx6T6vx+OAAdii69tGpSx+vRdUC8sS1rZc1E0Yg7Rj1vDlI4Ga
         3ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099010; x=1781703810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+d+uOIy0pDXw/dS7D+a0SvZQsQcUuq0fUhk4Xwj0hOs=;
        b=tG3UXb+ONK3qmknvx5rPqGU+Ipr0U0/n4A/aUkOx6T04bfwX34i6vx+YhH/ACTxtDk
         /dMybtUvE4QDGGmaRb8hAqZf7/i5ztA8jR1FMJiYzkLgSDLqMfm0qDA0CHuZm2cP9Zut
         ph7nmReoFYKOcGjtPTCmXMX5LzGPcATUWZDHyIYEviZT8kWZhE0YKx4vXsXj7oEDhMP0
         FeHFsgYXgumo28X6r0IO+qHH6wGh2sargGElpKqYOQskZQohF0bUJNMftsK39cb8elup
         JHjJbgatG79ys447niTSqR5K2wfM48xQ+RLz65M3Gm7qoebDtRMOX8as/DjJ0kTXbSgq
         s5Vg==
X-Forwarded-Encrypted: i=1; AFNElJ+n7O3qp545a/lDyjrTKgzkCXZos6Yk0pA300HWaeDeGZw8CkHBLsW5vgZOmkD7KvoRBGZq4uNnQt7nf6gs@vger.kernel.org
X-Gm-Message-State: AOJu0YxxyTospIaaJnmCiyZXfugcuY8uV9qoO6sFe8C6o46p/NFBtkTy
	9vVhaycQ9A5duKfFrmtb1Y/EVIjD6jLcfOb/RymNuURsyc8OGuKepD41QGOA+QgP2dNo8ALUOAN
	EDHFMhYeNDGXCSNsUAJWy7IjgwWVPFm3OpZbZc3sAedhrdkCxLZNO9yJTBfO5NhriLa4q
X-Gm-Gg: Acq92OFqZjiWGNM70lQVeFHU5h8QXnZu4Uh68lK9B4NLJeRQXqlvP1fZU7GJM+yBnYS
	Yy3tCjoD6zTEMrWT6v+ZGtI/9sUQiVXPtQrL1kCoshqFWl5wpQuy2PW3ce1uYrO+zC3bXo3z6Yr
	smW4A0c4D1c2bnNusOzslDbKJ/joabmhgmSfGy67O6y3PBRGTBprzD/IXt5v1Hj9UAUtXwiJ5qD
	+qmGSKO2i77nwwJi48+K/h+plgQL+C+hyLHUO6ZOByelBGc0PhWdpuBzrjiWgEsRF7B8Q+h01AK
	mHomMOQxWg0M9wPaO2iBjYQCtjpuJwtUvTxd5sdO0Jr/aX+Jp/1c4enPVV4phKbCuHt0aoO+WBQ
	L0Ph804IlAHxOH6rWgb56SxRHg03lJf7aGLxnRDIcTPzWOynHc4X4pn8Z
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr4023452137.6.1781099009687;
        Wed, 10 Jun 2026 06:43:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr4023441137.6.1781099009218;
        Wed, 10 Jun 2026 06:43:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm62688081fa.0.2026.06.10.06.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:43:28 -0700 (PDT)
Message-ID: <e93a57c3-8355-4437-9b28-d04d30bfc765@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:43:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1k2xrYIriXgG893LlEf_Kn7CZcTsuQzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX+tZCinRSMdO4
 e1rCIa49sbDk+/RfEwXnQa+mcOhtSlolJuShg6HBWfIqSrHB3rf5ga4TusnEIp3x5qIaCoBLaQL
 ITPbmCfd8fsIwTYVkaqTbuVwwhsx657QbmWTLV5okG8Q2smREP43jURiP5L6KBwWulJT4znonMb
 WnTd/SeKMbWrbExNT50yvNkbyPiFDgE0jsZKXsT80XLkhy4o6o6txjjLk33GIG/lq24MDYbP8hT
 ZecJC5U3LbMRAn6YQl7bi7j2wl0kA2BLfvnf0DvmfvZDJGFIPC998TFLhb3UYfc1bso0atDogJq
 Xrb1/Tv49F5EpMsWAMV/kA6BzblvaGYxX/59/ok9Oo02SnMukYccgeW6utgQKY7I6u3Tmc5qx7N
 dh10ZFHZvIqVmMtb25yka0Idlow3qozMLoGvWWK7OkQqtmqkPa1YefnrD4C5zRKE8Sg4/LowJYt
 p+YGILAmu/PE6dmeeyg==
X-Proofpoint-GUID: 1k2xrYIriXgG893LlEf_Kn7CZcTsuQzy
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a296a02 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TjGFBzvoXwbZ9D7WYpMA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112487-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90BD9669E8A

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> gcc_apss_axi_clk specifies a halt_reg of 0x4601c, but this is already used
> by gcc_apss_ahb_clk. The correct value according to the downstream driver
> is 0x46020.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

