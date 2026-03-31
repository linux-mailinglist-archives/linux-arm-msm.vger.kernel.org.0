Return-Path: <linux-arm-msm+bounces-101012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIUJCZ+Wy2l0JQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:40:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A50736737C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A18F830530AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316ED3EC2E7;
	Tue, 31 Mar 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gYURW5u8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIJGoNmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078943D903C
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949623; cv=none; b=XkNeEPImkpDu1ZlDDez6ffeEYKB1tx7PVsbkCdIt0dMjAjkN22U6k5RHU9CGaXhun9hP1qMTZDGzuaW8RyPIOilsWqtzQikNMtvukfxhkalXbXvwGrAsnYTULMFADpWgPZpjGkPBdsskX5PhzPxApS8GvGUBa93xnn4BtUEfmIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949623; c=relaxed/simple;
	bh=+IjoPXtlxGaqcbteH7Xoi+XamXOFFIwQU6B8MI8bFd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sALKd1PWdZv7bww20gxtooDYs5GMeeWxTAYo27ALoUhRK+IDhafjupMI0TPtOKzDxzRuyvjPNEFgHYLpOsNHgQjwdttd7qGI9K1p7Q/mpiU0X4/8LWxBCmcnfJm5nMeQDuqhZjTgHtu+UIKIHO2WVrmWt2Tm2oOyoPTM+VdvxiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gYURW5u8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIJGoNmz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6xsrl2164250
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=; b=gYURW5u8Oy+FvkAV
	iV6lj1t2gyDq2TyCPN5xPmOqrKfh4g0cVxLnBL5w+fuLUXgFDkIRmo8Fn7AtGe5X
	WgpJooLelIuKRBFqZiousuqAhqvLT2s6ikMh85ii3ZTPCU3FUMQR7rfD4ux+ddzL
	uDG6jMUe5ZOXx1Lw+KHM/fucy2cUv/jWn9fuuhnd3yRLRqRgOJ3A6t7OBHUIRD0t
	inlW3BVWBqMTRUUD/7g8L6YP/JzGRmB4wTgPV4jBcTHx6JdbnyEqgl2FUC1f3kJU
	xBPOJaHKh6mcscOX+CYbIQRHFx0lPaTVAr7dgtBxP/P7N4kQXFkCeklGBjhyorUv
	iWQo9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga0ntg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:33:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb456d53a5so159462485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949620; x=1775554420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=;
        b=WIJGoNmzfWWIoL9g4P75I+aHn/gl8qyunkMyBbN6YBQjFexXwjPf51ijN9hXUD+MrY
         LLkvWh27CPDpC7WRhGUFNWxAN28XzZKJCLoWEz6Zt0p7SZ1oiO9W6yyLaalIbFYTgSyA
         CuXd6tnICBWJ1EOJEhD0JKyZkYyPgBFqE7yB8CiDjlCxHsQyHt+ti8eSWB76rsseHmLJ
         VVc613KJg4cSaQj3uQLiIBWwYUL2XXKAB9wx1Z9I5am2Gc9xHaAtIK3N9hWf1oij2p+z
         wyghh8Q9oVNpjGto664idi8QoOabtqaQk53Z7qcQ/tX+jN0v/wsejnZ5clgZ2NAPh296
         zYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949620; x=1775554420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbr1GARxBMsoXWwR9sIPZisrIlDf6DQwHv9fzbstqNI=;
        b=mA8g2v/A7TSfxtJ/cD6vY3rzHr4ItVUVcL7pL84/nqEX3JIXERzNisSccuKyjTlhPW
         SJ7vbQ7ZY2riSuA5zlJ7Y5W9k9LHqc8sRdJu8hcQKt+RE4T2iqNjfyDHCzt6JQTI4I+0
         6/TddxN27hNh34S7LXvk0iUkcYEdJ1rHFDvtGu3RmCJ3jLxQRBZM1ubJVHW8aKd/nhZ6
         p6jSV7AJoo4lUVt3wVa6MqG8QADidghOwJ0VHRWPzJkVqIW9qmZIT2jCJ8GZLmUNAmDH
         kUadXprWpeKvrro0fMmWflMrh9BS3B7Yc8xMg3e8Jo+ieVTuaJOGUIppMBDFOWAo4KQg
         oSQA==
X-Forwarded-Encrypted: i=1; AJvYcCUZawMOzlVEkjO26SF0HOAcxIvk4weHlwhqrAklPeGI/Agumrl6ztWoJ2Kqe7xExBdZH0VccdgEM63f/n8X@vger.kernel.org
X-Gm-Message-State: AOJu0YytQ5Ffcw5lVsDMMG40fB7r1TYVnEsw2KalmMbMdpABO1whrN8H
	IHu25OqmKm9nwQ1DiT+0KalVRmcGSNc6oCi4dem7EtINAbf45hY5W60cEkYh2fSunpwN/a1AmNZ
	yTFWs9sj0EcDHv5gcTry3Q+5XnXnPIBxrAfdj4TlrlQc6ZpyQyXA/fEll+5+ejp2p8G4h
X-Gm-Gg: ATEYQzxPf5qB9E5E/MmUkqadBbhP/kt2C4dXQJKJUFbiQh28/bhtMQLzNxgmysxF6g2
	HIK29l2jlXo3DeK7SguxJC0ayWrAXyErBBFEnHWH7+q20NXNuGMp/4VR+ULMbHK9b8rU7u9mjyT
	56eKjDcq0Pi6paNRUY5oF/EaWO92vV6fdjaNGPALqo4+BnJWOEUfkaEGY1bfrWQyMSq/5XyaBXP
	X0LfXaS20yYaOGbANr04ybNzHQ8oiWw887B1ezofNttm7nhbiENP0bYNghwV8Z0PA3fFRL1GI85
	J37qZ3hj8Vg29Mo1e1tG4K8LtP4IA2ovvuRU60f9+l8SuvXoapSaCvysYbgizSjYgzGudmACWVb
	bE+c/BqGfoPV5gG3wVLypVCFuYGlOSmtus+cDPJIvC3dm8rMEqPXfvIuhMDY76GVvfjLE/vMNHu
	MTpYU=
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1572459185a.4.1774949620368;
        Tue, 31 Mar 2026 02:33:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1572457285a.4.1774949619932;
        Tue, 31 Mar 2026 02:33:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72762eabsm3602840a12.4.2026.03.31.02.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:33:38 -0700 (PDT)
Message-ID: <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:33:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cb94f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=n83Ni56Gs3YPKE9ALmUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4KHF-22yUNzJvxLUk5gz-OOr1zqAX46k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MSBTYWx0ZWRfXzdrTYMsFTch4
 t5+EaigCe7J36OQs7v7Wkxu5/LXwunljCVQgzqtGyO/QcwBDAqejFfWpk5cEyL9ok4J+masnRux
 U6oJd8DezTzWz5mhSSiJKXEqB8MagBgNFSsU0c4tlVqXIRGaSIIUlM6Mqu6fyqhLhmCDujdz6jM
 RuL57emjK2JIxJvzv1HONNdtISJcBPF0/Vr8lMGVxpZiDPDwMMPVFzbTOWUkEljahcfqkhncr3h
 F43w2Gh/SW9FLpyU0KbhOHSrwROV3+pmD5kdf9KwhnQZbii1v1JsZUxz3npoRDyR8ljk46oQSTy
 E+66EkVgq5akfE1VU3eofSwJ9sL5pS5ODqkk1Py96XjvmLKUx8+tx6ENblEOE2zpqlmfgArrOTO
 tyKwNiXSXFlVT5fQRvK8mFJSMAOAh5aSEQipYRPZkJHx5BcNkQVkLABS54EOFniafPBf8pj8l65
 IvuIAdkf7bKvG+30xIQ==
X-Proofpoint-ORIG-GUID: 4KHF-22yUNzJvxLUk5gz-OOr1zqAX46k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101012-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A50736737C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>  	size_t num_icc_hws;
>  	unsigned int icc_first_node_id;
>  	bool use_rpm;
> -	struct qcom_cc_driver_data *driver_data;
> +	const struct qcom_cc_driver_data *driver_data;

This can be a const ptr to const data, even

Konrad

