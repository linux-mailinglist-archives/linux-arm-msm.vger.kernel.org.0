Return-Path: <linux-arm-msm+bounces-94879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFMRGlZupWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:02:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD851D71C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A99223019468
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A7636165A;
	Mon,  2 Mar 2026 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kd4wC906";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aArqNgsc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C535F175
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449358; cv=none; b=vAmdsHEP6B2nGQJE+4IAZk4FG78LFLmLRisSKOu/FPfAgRZv3BwStNvc9BuQbUDpnCkAGmY8F1E2MZ40wX1hGBW1UJ69trRr06nt2nKs1JyU4SaXTEcCqnGLEaHVNOJkTGcQVWk1v0BeK/KtT/TqIkZUf9EtlRBemYDc+uyWkq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449358; c=relaxed/simple;
	bh=WWpPUwAj4CS06acq3iN3Q4Su4SjoKs+slkPMej6t5hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XN2gYOa3Yv2NWTHH2L5tXbXq9hoqXsVy0RzSZFISgnG5dkvXR5yJejErWOa/8Pcwxq32xEX6weFZQvSbs9i7eP50oVmAp414eur8a9tnjPD6gIjiMmicsGCbu3WXRFAzBLH6/PwUyvQ05SqC3gW0yd2EBi+55+VWvYyFVMqdUU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kd4wC906; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aArqNgsc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JctP3742181
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRCkO3MSlIchL4f6lA/3jZcOle+YFQfJf4GZY0Mlwmo=; b=Kd4wC906OUObQNVW
	BW9NiUIYMpwVNyNjMarw4ABWd+BFHc+oMgIFbRRUNymVHH3fhOpS9vjrJan7/nS+
	Bq6juHPpvK/qgd7Qjyv2C6Il6+Oho8CGRKDJGeDN//vnlBmRytRz/RbLZaZOwKjB
	fuoxPrqZvphCUSGzKZbGBR5XeT3XThovbxLIeK2uF3yWMGjwCz3XaZ/lCKFVM4YE
	vG+f1Pi5Q4PTxdG4e9Ux7X4fqPVBwEtFPDnwKXjgFczB2EUDXGBtcjaW4gMOzZTy
	uE0BC+TZQBJcq5W6ldhAxpJb0msb4sWZ5iocyw0Pvl7vR5E1kLRJLTneB//8xuw5
	oNxk1w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trgc2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:02:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e1dab2235so2440433a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449351; x=1773054151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRCkO3MSlIchL4f6lA/3jZcOle+YFQfJf4GZY0Mlwmo=;
        b=aArqNgscTt8OAP1kvLceb8A3V6V/7rDwoKCdq3CtXGS3ZLNgffLpcf4S8KxBH1lLlN
         RBkCvnF5+UniPUChPKy2J5JjKwtgn/mvGEwGFw8ZSeE1ly2zkyf/hJ6lnhZDA+IVS2JC
         0s8RQUujzQ1OSdmBqxJWYDCxczbEffU+r0dQI83tPB1qnvO8kVnxP0oDY2bA2UeW54m5
         a5eCWYBHU9faaafHtBy3inrlp5yAQKOCahM7Y91dGZFRv5/2WJA+v1UO5JE4XX/M22Ra
         ckxyLYCVSJ8eO2uidmyohTAgyar8I+FFjHJeVzWyOyGef1m4odSiKwAOelgSuI4J4AgP
         N/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449351; x=1773054151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRCkO3MSlIchL4f6lA/3jZcOle+YFQfJf4GZY0Mlwmo=;
        b=q39DqXFsglw8x9S8zS7j0sToWtAzbvcYzx8BJmczoY8+Lwp3VqBKuy0L+FYMWW3Cn/
         MVQTx3nTHUBZn2eKa5m8fJmVj+bABydi8CMHiLokdsDXXocmcDx6I03sJunrbuftZ/ZP
         dyIlXufaRYyJiO6Kzkf6OZd7sM6oJoqlP79uCG86/ZJx/VxmQmwKVR9PFoQYklMZMWdR
         wkfeXhf/nr2CPqH0Aya+GFNu2STNBMz3LpcOr/WxiBOSjgdb0UUS6rIZ5+1a1a68xzis
         p50UinBaOMT1oGoEBZ+KohxUUW6pzOgwG4IX4gUJ/WpEt90rNCBgMeCEzR0jsB/jkhJn
         N/ig==
X-Forwarded-Encrypted: i=1; AJvYcCVhhHEAtYLXPljbU+ZUv0bddwJQ2kdls9H2j2zYi/EB6t2QIxq152Uv+vYHH3QcXGwYTTcooXrHUlvLOzcY@vger.kernel.org
X-Gm-Message-State: AOJu0YxpzVX2qyXqzE2vt+FX5Uja3aicWWvCr9n2HWLZV0hIt/lsZb4x
	3nMggTGvOMs7+YlUxAmF4d+LB3eUcxUSi1r8nL2XU9DvGY1itAqImzwWn3LBcfLZzyz6q2aZ+59
	aV0bfjH3D0gbxApq5lKMc0TdTIzJwFDO7jkX0j9UHU/+6P9vvOXmuIWNLlmrZVRNnj4+Y
X-Gm-Gg: ATEYQzwM7mYBAidN+R5i2b6eIK9C/0xalCnrPaWTBguwaLoAA09YeX8+OJq2LE0D769
	2zlcB15amq1+F9bQaW3Onu3AZCJ5TYqnBQNaKuzy6mLLK6N/KsKG7icTzzD0knWT65rEE6F1PyU
	SRw987Q580dXOgVDkLvVgaB4st34t24obB4NF101OYBp1f6c8QWQ4oPDfucAzXg5VfIT5ZYK7jt
	ZBxlEvCx3+Cy3okL+RaB83/ovGPllvBeCkDWsZT8+K8hkljNj+i8liSU6b8IjLgHAuBZItirHfm
	bmhhzurv4zyYlEhdzcAtv7g999PsnFGi8lCUl0g6XgIjxeSHyEupP+eC1Pvp4G9Cb82tQhQz5jJ
	KUDS0GGGVihfIrX7oxwbKuJQ1vAV9MGnSljMmbCm5ms2wz4MpXNA0Jg==
X-Received: by 2002:a05:6a21:4c06:b0:38d:f405:709e with SMTP id adf61e73a8af0-395c3b3d787mr12125016637.48.1772449351375;
        Mon, 02 Mar 2026 03:02:31 -0800 (PST)
X-Received: by 2002:a05:6a21:4c06:b0:38d:f405:709e with SMTP id adf61e73a8af0-395c3b3d787mr12124977637.48.1772449350875;
        Mon, 02 Mar 2026 03:02:30 -0800 (PST)
Received: from [10.0.0.3] ([106.222.233.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa82dd09sm11878434a12.28.2026.03.02.03.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:02:30 -0800 (PST)
Message-ID: <10d89c55-373e-9e97-810c-fd088f42480f@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:32:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-1-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-1-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MSBTYWx0ZWRfXzk0oDJm2WjGt
 SFEUpmTqtMgPpXc/Pb+f7TUEvjz6oKleZDo04O1c63buD0tI27WX0LwEcHARiB7pICDkmW0kA6n
 gHeCUh2aXVgP6Tm92BxS6VbgwkQlgZWfj2ZKR8hG07sPKkI1Zo9D/MM9BYLf7O4g4eVlmJ3sQ0B
 OIFi7QFMs1jAo3j7ZPvJZml6kvEcRjZSNFKr2VwO3kkco+ns+qdtv0Uo7X4pqoVtF+RKKI3wEqk
 ne6jHAbkzh2Q66jyZTmJRx2Qo6ZK0k+wcQltOtys3jqRwvgQZ5hh6JmAAqflIrByc66e6GnWkMg
 HX9mmzfhm6qkobGX9XFbeLrHClUCCYEo9t0kKYAbQzyRwopTA7KdTvK0NLpDf4dZfcX/tzstjpn
 W6XkRW9lK1e/ZPJPq6v9cKkHS70KDypIxNQgxy6EN2dJEtVx267RSSWR/dlmao+/m93EjdBkX/B
 hHNiV4gHsryMRbQ0ERA==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a56e48 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Rcr8AszoUWCL+GUTnXSVkw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OinizHH6AUJIbddlOokA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: nvsTcmcHVqKg9oPw_cpWUTPhMzUOQc03
X-Proofpoint-GUID: nvsTcmcHVqKg9oPw_cpWUTPhMzUOQc03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94879-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EAD851D71C7
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> The PAS ID, the authentication service ID, used by the Iris is a
> constant and it is not expected to change anytime. Drop it from the
> platform data and use the constant instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c        | 11 ++++++-----
>  drivers/media/platform/qcom/iris/iris_platform_common.h |  2 --
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c   |  2 --
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  4 ----
>  4 files changed, 6 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

