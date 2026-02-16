Return-Path: <linux-arm-msm+bounces-92930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2At4A6YAk2lr0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:33:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F023143033
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94D11302AD26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B342BE7B6;
	Mon, 16 Feb 2026 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gF0EyuMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJoLDBRj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07AC30146C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241592; cv=none; b=luPOQE8cswQAADBnVfsKO6P6RQ9doErxdVfbfxh9TCLHwlJcKspFspXTRYFoW5N8qoRKsRpFLYYZ9B9w7GLrE5v4DHFk98S2FP6yTmWpZC6VZv0k8FoplYVzDGsJ/8wTgiX7k+bjs/x2oa+QATnm2YPP6TBTrl0kScNHTORZGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241592; c=relaxed/simple;
	bh=ChFEic1PwSQE3UFd8bMc4tVEqnhtKIyfSrvydjuuJzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SX2JWEuFZYyfWIGTVcsCjtVNK2brMHPHkOG6Erv9dFM7JaaoIbWblZnAdU+kYUv2G+Wel482LDPOa2dkrAunM9vauHPS03YHuNHFQPE7N+U7EwRny97ZqypFdRJCO1YNvL74qeaWJFraVHHXeoRYg0ogMJ71VMrBHR3BMfzyLfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gF0EyuMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJoLDBRj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBKha42389882
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=; b=gF0EyuMcIE47Mw+D
	5SsIFmu/a6w1MJc6tKppvNuMefoloiTrD0GQC5JAfPmjO7dEZrSm1ejwqZbEB+p+
	2ncCfF8pluKv8rN9KIXS7bPkyP5VXQmrVnCVAtIDj6l0LCK8qAgFWmGOIqD2sm20
	uRnj2Ox83ZuuuAGpo9WIiUkVGBWorX8CBZB3I5q0TfaGZSA4HWrR1ug2cpLpB1pT
	ZfZexHwe+APs4id/nkySL5qb5uqitU3/ytlU+WIbzNVslL6b6MTKzOnBHwLbzART
	owjHnCdxj3NGAzlwM0mfxl7Gglqv7jjKhIUme+YvqMNUBfXPMx22DuXCVdUz1K9m
	El1TVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4dyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:33:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb50fb0abdso174167985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771241589; x=1771846389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=;
        b=VJoLDBRj4ReIaRRTaWxPaqeT4Mxpzw7b4kGS4ag3BHgleQhPU9CQGF0+LCb8F3MZbV
         UgkzyYougy7ngjpzkpgf9lqW9cPQZJnr9Q0EJ+Rl4uE7hBxZ5W+dkSjH2nJPDfMRgZmk
         NUz62VwffW8ARo+LxeX/T366xZww0taFt0IL2poL/5sFEpzpge2avY+3CAsV+tUZW0ir
         GbdYqEU7cKep+z/+1oYZGhsOFWqlIqGg4czGMemBP+FfsH0NlsONv2hUPb9GwD8Z5qvX
         XnvD/EBiBfayrPMAaBPJk+DtMpfyuddZaLXjcqRi483e9Mx8FL1/zaEfDVd5yYJqHeIZ
         l0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241589; x=1771846389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=;
        b=wN0zuJAf/Gz+bibm5ibakqMdkp6Xk5V8mjEgVUol3Wv9sWO3gGaWSOuuMUxpOSsMju
         6ApXIZuLJQUgeKg66M3kxYn/TneKexnycL98Gbf4XgDPtIxN6UXbcOyvrXl4hN0PUhDK
         HF4xlikOM42iajL+pjI8GYTj+8VzgaeLJuthB4EePAa8C+/v0meoFUsTF4dlvkbTyTUn
         yNRBAtaplwY+LuSABDNlG9YEev7fK93P26DITkaBMCWDH8JkB0BsHRpRNZyxwi1P4Vel
         vqrNsf1IJZe9ZvVvuQEPP8nSrqyO76UV+P/nci++gZ+6pNOsyBsB1nqblgdweMxYo/bm
         myGA==
X-Forwarded-Encrypted: i=1; AJvYcCWrjMtvsb/2xRHdlFu+rS+Yggj399wnAxIkio+oYMLB6+uwDdd7zy9Kyz0Rd7BMPW+R8CEADJSeLrbFjH0/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqp0O+gNTesCXMrNU0GVva/2z7raJVaDGPU6AydSiSXuREukSd
	qL0jighR9q2FG9HGzUI+kf8U+niHr925u5t/gpSFe3rghj+5V7qr9m1ZFgpKVfSh5DQVg2PYv/E
	n8l+4uFCS1WBV9LT4Txf1ZAsdwm83z2/sns1ZeNBgHtWWWlwaVkh9ZwTTsY1c4ZLg4a+S
X-Gm-Gg: AZuq6aKX7hXGHXAr+xoc2wuMan2QG59sd0IulYFy9ur7TjxOGwTBUnB4kCYuh9/JblV
	7PMaOGjRJpjoXeIZhNECCG4GtT1W8yq+gh8Kkp4UdcgfhKR9Q3eEFDP1fc51UfruCB8I84k4886
	p/2Xfj1ayLy7TpLfMAicqhb54q9HsM1JO/Yu7tS/hCQO86rdukyqr5C1uQctc5EpQguJxq+tlQR
	izt9KrJSECNzaIF2c0YcodcrxSBXJc3KPHTUENo2Djw2FX7j1nF/RWCIlMRVkCBpmvh9O2f5qnE
	s0fpLlaXU8pTDzQ1fgqp89Sr4pA+P/Hs2wHGBSQTcS36iKtGK6X1eUs7dVraubeyyc5BhWScSlJ
	hI8CmmrWEoHo1n/7mXaY2ddSYHVUMhNhHYdW/B3K4yEvV2rN0v8vWFp7MfTl90CkAIl4N0hZLH1
	8+1lM=
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr993926885a.3.1771241588875;
        Mon, 16 Feb 2026 03:33:08 -0800 (PST)
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr993924785a.3.1771241588450;
        Mon, 16 Feb 2026 03:33:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7626bfesm241879266b.44.2026.02.16.03.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:33:08 -0800 (PST)
Message-ID: <5647539c-de68-40c8-8dd0-bf078a086696@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:33:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL
 pointer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8lyuCV76veYLqROYHyh0kaqg00PwbiCd
X-Proofpoint-ORIG-GUID: 8lyuCV76veYLqROYHyh0kaqg00PwbiCd
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=69930075 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=rQXAbXeZuVbgsyajZegA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NyBTYWx0ZWRfX6eUgPwADs2Yq
 vZOc9GWva+IAZBgOkWBrTr26c8PMAt39Co5ZuPsZZr5IiI27IjHv45l2MittR5QAjCxQvp/OHOw
 yXLIwbA+0bbKq1HyHB1mxFZMOdg8f2u5O7WdofuSTDIXWbSqHEOWbDhsEad3EsOQYjGfhwOhPGX
 Atwc9s1ps7p1BCatkctJzlr+daes9gZ1H/lszpPiud5lMuSPIE33FCBB480CtuH7w4nGp8zrd7j
 pAhsjQIbXRB0UaEchGFTPFHyubmj6jL6Iq75qvd1PiVLfZYnPgViRMmYc0mSVl7vQTBQI4gNDrg
 N/c+HeBGVwM5EX+zTL8Vn4CAhcdHA3V6M4gSMzGJ/3okkSF+gT66C3vbBPxym3foR/qNbEylH46
 fZg6QizOikDH2axj8B+7oDb/93ePfTV56ip5ZUC7tULDuNX1krwHfDACTmZWGsazeOYibKTlcqI
 3HARcJraCbX0GDYtFMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92930-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F023143033
X-Rspamd-Action: no action

On 2/16/26 12:04 PM, Krzysztof Kozlowski wrote:
> Pointers should not use explicit '0' comparison, so just use standard
> evaluation as non-NULL:
> 
>   phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

