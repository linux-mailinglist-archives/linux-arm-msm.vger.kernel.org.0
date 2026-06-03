Return-Path: <linux-arm-msm+bounces-110944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pY6mHsERIGqyvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:36:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E35DD6371D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:36:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nIId+GBt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bBH5E0hv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110944-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110944-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F05593014868
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116EA45BD4C;
	Wed,  3 Jun 2026 11:36:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A933D3D12
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:36:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486569; cv=none; b=rpng4H2T5NdXxyPlgDDKzVeiCvYEMwFL/ygN3F5NJh8p/3hIE/6RYWmhIvTNnZeKLVEdaVBz13D25WJd0ZCYPdJg1OyxPqueF65gs5dLslRS/ghGqDXRYJFQjaC3N+YZL/uitYZ1DOLzfI43J+Jc6K63DdcTc/7EcWug+MJlnRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486569; c=relaxed/simple;
	bh=6mxxhBWz3iwuNGJ2Se4rUanT9QxciF28jRe07jVdIvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3c0xctQh7dGEITqe4X5ZpXC9Aei1J2Zzd/Cn80LDqbE30bdaCaqbNN0ONC9Bsq+Es+ZGiPRi64OmX9vFvUHNahwL3BvgR2amKXM3wo0mr3sw1mF135t1Utqtpm+2ulXW8/WgcF1P5nJ3yACq2+zNgw8eYK2hfRegrlWftXBTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIId+GBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBH5E0hv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653BAIeQ1200120
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 11:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxpSdp0rXQ9Y5LjILO1iCs7gA/5k0Z9eqsnGN8nrHRw=; b=nIId+GBtPZ7zzuRd
	WWryXiWFjqA17uKvcoU1ruqY1qjI+HReuKNZsF8STJNsywr+Z7NmkDErmiQQ3wsv
	iUW2bjayRF2r+sjQtPUx2NViS3ju3vev+YDjO4/fGRsGxch+vAf7/+Wz3AW5/ea5
	SyRzc/H9cbhsfRVVuOE640Q7k5eWWe9LLV+WivS8/VPfG0Vvyqaz2o12BWBNzPlH
	4Hy/4e5VMVVRgLcNNqABstJHsEdTnB1UE+32XGtCpO7+sRgqcr5EMy8nseBU+JCx
	59xZLY2WCirhVvj8vWpNuGh4NDXd1XKeexu4iyKT3ewMMyNq4T7APSnE3reBJ+jO
	qi8O7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw1tdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:36:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51757324dcdso6140481cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780486566; x=1781091366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RxpSdp0rXQ9Y5LjILO1iCs7gA/5k0Z9eqsnGN8nrHRw=;
        b=bBH5E0hvuS156q9rnmqtX1JdgCCEEUCyRbY9ABHPG6bq0rloHkdBLgnlOlRo4fR18Y
         bINb1RFGgz3Doh5hPZmtAMCZp8MwbxujcmQSqcoqk29E6KOlnG7Rn0RfA4Fu/ImJeJCO
         0ktJAG8sA6rDy4si3fwAT1B2mlO1kLmBYDLYe724lK18SniyAUFMLVj4OqBEIVHI0ywM
         8g2nGGHdwBSjAGFBy1lj3uYCfBF1Mmc0/toztwnGFLgaOHWDMzoKxfsX17ZqpWX61pjy
         Pj6TL2DFHAvjqyXulKWvAZsdk+RM9J6kPzcVZjcRgoKveR2eTjawNmHAFkzdUDl42y52
         CpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780486566; x=1781091366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxpSdp0rXQ9Y5LjILO1iCs7gA/5k0Z9eqsnGN8nrHRw=;
        b=pTTX8Cea08EZAhrO4iLP731aJeYPalwInU7zuRAKNi87gVoYW7cSracLYW6Yavi/W0
         DgUFolVExgs7XLjLV5ivJszm83ZvC1b0UyeHB/LlGIkUfoFiyj8PKwULNk7RlXBiestB
         KKlC7cSeIE0gtdbsawBOHx5RXYDLzPfv26PyPztDVd/Rb8/0ZqunxbgwKJWKrKOUH1Sa
         IC2zzyA4ZRx54W87//5+8a5nv+YZCuTy9bExqzA1hvIpdToH75YJ766uXeRnYU9Ej+IX
         g7EorozRaD98HUts5ZjHb4IqPpliO7GWD0QGreCfjSh7Oatw8mgUMlEfAvwgHdDICl5j
         Ybsg==
X-Forwarded-Encrypted: i=1; AFNElJ+9sx9taN5q1NcgjfW1rPw1yqV7vqOnxBNHL9yi4Qs6AryVMDf7R07DnQLqpwT6GPX6c2T9B0ZtEWC0SU0C@vger.kernel.org
X-Gm-Message-State: AOJu0YwXbQyFSxQfmiLnYNpcLZcAQ89hucpTNfjBJQSXiJJjlRnMVVaq
	/iQ3le0097Obwjphe4F8VqifH2Y6biikaBupZ1nOKpKrgelXzkR2jX6xeI5zjjsWi6Gq53c/Aj/
	YxsqfG5+OQkGWm4aosl9gOeqQ6DgXVobKQxNGp1mtaK3/nE5mpxEVtObOe1Aqyp6knmLw
X-Gm-Gg: Acq92OHtktgnHKXvvOGSO3UP9FLf8jjMM1JSoKtv+NOJmu8g3QLvgweyB2HvSDShHn8
	KQG5RYLZlK7R+mZ3tjAKRlTfsOrVAeyZMc/h/sgahX39UPPSj3aqr2/cSo5+fn6iBAFNef7O3Fp
	zCY0CX8CZx2twHTIbZFiuPNPQ4D2rYKhwN2hEdcoAPPP0yl3IaoJl2Ye+t9f9QOLwFUc/+bNK34
	bL1ShSAXcwurUuSxhLflf5ppEBoobCoook3dBnvNli20Mx4R0ny5Zx0hj3lklMYhLNAMYvMO356
	PqT1KhB1qjxFtIPteebWNOZARejPSJHYNVvOFjYvG2NfPSbGqUSYo9N6zo5NsvQDmpQ3iSC+y0C
	lJT/YivU2YuM3pHbzUCuH5q9hUlP4/qd4ZF5SsbERymeDUa17PK/yBC6IKWLl2Qf7oDR7leABKp
	5YSwtsJU2AlCw=
X-Received: by 2002:ac8:7f89:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-51778171e34mr31522011cf.3.1780486565769;
        Wed, 03 Jun 2026 04:36:05 -0700 (PDT)
X-Received: by 2002:ac8:7f89:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-51778171e34mr31521651cf.3.1780486565343;
        Wed, 03 Jun 2026 04:36:05 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm140822166b.32.2026.06.03.04.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 04:36:04 -0700 (PDT)
Message-ID: <876710a4-7315-4541-b998-c0e603b1d422@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 13:35:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: make myself the maintainer of the Qualcomm
 QCE driver
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Demi Marie Obenour <devnull+demiobenour.gmail.com@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org
References: <20260602-qcom-qce-broken-v1-1-a4ef756089e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-qcom-qce-broken-v1-1-a4ef756089e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a0HvGG_SgOUUAxVk-XGP4lIbQDVuWnhZ
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a2011a6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NFhk1LTU4Akv3bPm0kMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExMCBTYWx0ZWRfXzVOF4LtA/2ut
 bD7zXC7m4tOhuoG3x9QXQBbi5aDkm0x/jwL2Q/d3mlzbxjUiaMVFJ60dKzwKt9Pg4DBaJl/htxY
 bv5uSjeNRfm7S/ugaOUvKuyjhe88tqd3/o1A4My4l8ZVd5/BmCb4A8UaIlOwuTqdycS9IY7GllT
 hCkaFmVlsD269MkFRngRq2AaXv2GGhUV/igH8hAkUK9+a8n32WsSh6qtK6spKvXlU0D4knxOMXk
 mh4NLJAhVmjL9+f2BHfoBlQy7SXZt90IDceBEmby1H/8eoqfh7Ijumr7TyScW8yZqo70uGsA41x
 vmXdt3pmPJ3SpjwH8LrNuBcaAmhuNuETvK9zjTAkcFeUhMwfxdX3scLCwYw0HWKc+a/FWLRs2Js
 NHnKV32dbtADp7RcmR7OnOomo7JGQ4tnOB1g/qt8VnEQM+EIqMk9wexrEd/aXcVRa/9B9M51jji
 ncyCiIVBoxWgaOAGiRA==
X-Proofpoint-GUID: a0HvGG_SgOUUAxVk-XGP4lIbQDVuWnhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110944-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gondor.apana.org.au,davemloft.net,gmail.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:devnull+demiobenour.gmail.com@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:thara.gopinath@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux@armlinux.org.uk,m:ebiggers@kernel.org,m:ardb@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:devnull@kernel.org,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,demiobenour.gmail.com,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E35DD6371D6



On 02-Jun-26 14:46, Bartosz Golaszewski wrote:
> Qualcomm wants to keep supporting and extending the crypto engine driver.
> Thara has not been active for many months, so change the maintainer to
> myself and upgrade the driver to Supported.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

