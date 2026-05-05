Return-Path: <linux-arm-msm+bounces-105871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AplOF2w+Wld/AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 10:54:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBBA4C8F3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 10:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB4BE3038A47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 08:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBF1378818;
	Tue,  5 May 2026 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NThL7KMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7gevnKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A0314D34
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971045; cv=none; b=qVl0Vv+OtFg+KAM5ZMCb7tXgagzsFcuMeXzgUHRwTsDlTQSt9p8KBrQ8bsnhpwNvFnBEE+RILjmq6NV6FF3py+2/LIycsCh/3QJ2GuLYt2MpnPRxYOB7eXzmbxMMJeBf9mb5oqq6+E8XWgO4+RNrwFFXO4AQ/qM8DRE2wjIYupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971045; c=relaxed/simple;
	bh=i37QpySTXDN+f+oGxfnXL9fZwnp8eDtIrlsvwm3o154=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAEPWJktMIiJBwMnmUYSn2ZiXeWeOwFr9OuKHQDHA6VQvE+052tjmbfY1I/MdTe1jPgXAf8fD2+EhwPrgraPpm+NYZFjklQqc/W55rnDYl5foZJBrPY9yCYSTlB+R0Q0YZC4r2DJDsiwd919GR3vC1nO2U+fFmAZs8/6WKXPAL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NThL7KMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7gevnKo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455I5WJ1150966
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 08:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GP7hjgNeht0PXb3HALEPuiDTwHioIWVs+PL2ysCZ8y0=; b=NThL7KMREA7KiB7A
	ZVCMwy+PH/dgestyF7whZBs7H2AvChlLme3odZT1Nk2Ccy7zW1gXj0mOY4m2KNog
	yG3bhf87R/xnm1bJ9+GqC5SN9lDFSPO3hOSMUNMCuroMQPb4Xvb9cW2qNUQmTX5s
	QejqOeVYDRzC0DejR8wz57Lq/D6H55/VUjrwzBkg9+J6vedo+B0/tPsz9FAQmoYA
	dXHg1GShDUNUvWxbpA8cIC2+NW3RCNr4URZ7tEmfkZxN6++kOjnntaUMu6n6MWkC
	CBHSNNDqLIClwONHy2jeBz+77Xcf/NW8pSuwrd1IVObLUbjP6Wx/aVgkV/m7Ywax
	Vc6Izw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscyc729-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:50:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249975139so96158425ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971043; x=1778575843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GP7hjgNeht0PXb3HALEPuiDTwHioIWVs+PL2ysCZ8y0=;
        b=a7gevnKoS2xGMElroUVwMebNFszhppbvHWpc4c+MQ68r1Fv2kZ11cFM/IkdXwQnkkF
         bUtj+WS9krLqxgSbPj7sSFWDpmKornpe4B5JZaLDYUDViG2o1rDYWWVStHTkLAzX6Uik
         vsPN1HWTJkhXdwAhgfdd5HIRI/PEWYSYQVcvuyPQhbTjaAb5Xu4ddjAlm8Qg/6h3JLq8
         amN4z1SJRPlbm8u0Ts1saYiwBKhu8s6msT0ZprI4JEZv/HaDxtz0fIN5YLrUkumr8Q1l
         nmo9fiBz8lnjGp+cdfovv5jd2qzEqim0HFFpcyCvRvTBdeCf8EDyC9c/ReFuiJtQ0HOx
         Y/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971043; x=1778575843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GP7hjgNeht0PXb3HALEPuiDTwHioIWVs+PL2ysCZ8y0=;
        b=Bk5dFMLtb7DLMReh9I/rzwdSI1PTCcng85TYVVpj3GfQJGr5lJ7wEMkkF7JLXzWJCQ
         27OKgCH6ymQAhIvnwEvs5bn8gjn2WGhCNyw8Om3IArbxDIs85BN14wTQHPV5sNkezCve
         H1nD1SmPRfdCpV2uWumkr3sQFitkxA/3+6nrA65PuGIw/3MUp3ZzTIfzvSzn6BvpV8nM
         bKZw50l70BMusuwJW4UDELyKGETGJJjA2r1vp0sbUWkEYHtK7zHaue42GZLs+EyhRtjQ
         7YLN+Oe+8Ps2AzwAGj1v67bOMLUAytf3V448MG+1HdG9QGoxK0hnImhcl2U+wNxt8Ewz
         7zKg==
X-Gm-Message-State: AOJu0YzhGB9SfltfYoFWPRyc9YBcAqY5hzp7qNRU2Hvvmp1KFL3+At5+
	WUf3IcAmV2NQlgEZ+IV9g007hTWrlkYmPaZqOhEvsnM0OU+xS2sCjmyCnzAxDI+3mw30LTQq9KT
	REbWo4oeXWc02OfGOmGIkqXSQtJaYSBUACd9Suqt3Wb+h6AZhjoU0mpl2vcsmEC2mfVo8
X-Gm-Gg: AeBDieujB7A10jPXyTAihclipCIxoYIiLZAjbkGAXUDJqS1tbQlK/pbsGfy9FdQ19FO
	wTxtFh6tpcryqNwbSOLuw7/VtXOhoNW91VBwBRL8ijo1Z1PD9U0dHmbRhdIk14nkca88slV8C8m
	k+B1sVGhmXSc7b15mxhw8uvx0kli3BmBG0T9ki8JNr/8x1Wd7MF7WrpqaI4I+kUoamZLivS6wNv
	TApetp4GWsQ/mcBhbeyLN+FbPRyHXP2gRwoZL0uo4NbGexH37FNmda3GYbesR7cHCtNmwk/T7SL
	MSOyltGH4ZI74bHlhFA2axEizG454cBeV2Gqr+5JKfSKRjeLrygd6DUE5nBxTUUET7lUS/UUK8e
	Ie9VpssUZRJZTChXjDOOjm2LPXOMn7fmsIYQXkaFKgqftDKX3NSkkxedcDLelEEaA
X-Received: by 2002:a17:902:da8f:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2ba4e840b0cmr28477975ad.36.1777971042682;
        Tue, 05 May 2026 01:50:42 -0700 (PDT)
X-Received: by 2002:a17:902:da8f:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2ba4e840b0cmr28477665ad.36.1777971042167;
        Tue, 05 May 2026 01:50:42 -0700 (PDT)
Received: from [192.168.31.121] ([152.57.125.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba10340c10sm72627015ad.61.2026.05.05.01.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:50:41 -0700 (PDT)
Message-ID: <1f1a248f-e0a6-4ea7-a789-129f49d6a496@oss.qualcomm.com>
Date: Tue, 5 May 2026 14:20:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MiBTYWx0ZWRfXykWMGZmxpoeA
 1stTq4VecfMZUelJ1k7knu47jIRVvxHoxoI0HWPuuhGSrrFTDnT1tOsh/eWglOViaoc/a+qL4nZ
 JjkaIkBYYrV3afv3B23N4SugvM1EfaQHSnqyauvqWbL5yuSkXTP1gz27arQxjVuoemfQrZe1iz7
 hl9eWfYXYoshMAY6J+sLhkikVLTaV0Jn+iYiJkHvh9DaAKhpiPGpzIa4UwsQ876ray9mvDujjP0
 Z3v5qCdvHtz5L4A7zUmC6fhSvfRK0FKBd2Af5g1hilUcgt/EPXx081LM8UIFn8O9fosCAtv7oGP
 ojClfnrZrgPhx9xSJQHhzQf1Nat4GxQ1IkkTOcDp1xclytZBZvcLNqBPZX9k9r3PfJcsz/MJhpg
 6E+CEQakUMo1rpgm7LIzaTukN4rKd9aHbxZ8h51BYFJ5LGxgW3ukjTCTo0yiZHHjThYE9H3ctuq
 Wob8vZS2RYERH0FybFw==
X-Proofpoint-ORIG-GUID: 5BU-2Zj1_aI7FrDH3YgPoPWe6HkP_ZXZ
X-Proofpoint-GUID: 5BU-2Zj1_aI7FrDH3YgPoPWe6HkP_ZXZ
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f9af63 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qTiEgzr2dJYvHxgVP9Ob5g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=fNIx6OEFrv6duaKcIe0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050082
X-Rspamd-Queue-Id: 8FBBA4C8F3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-105871-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/27/2026 3:34 PM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---


Hi Hans and Ilpo,

   I wanted to follow up on the latest patch series. Could you please
let me know if there are any outstanding concerns or if anything needs
to be addressed before it can be merged? I am currently working on a
follow-up patch to add support for additional commands and features
built on top of this driver, and I would like to ensure this series is
landed first before sending those patches.

Thank you for your time and consideration.

-- 
Best Regards,
Anvesh

