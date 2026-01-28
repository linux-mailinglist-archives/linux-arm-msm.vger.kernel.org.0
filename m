Return-Path: <linux-arm-msm+bounces-90917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eABIK5XJeWkezgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:32:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079D9E3AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A75C9300578E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732F2126BF7;
	Wed, 28 Jan 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWaVyEO8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WM6vlmfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C894B328B41
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589138; cv=none; b=oC/aeycTg0s8DS0fYRQ1ua4V6jrz4ZlGaHOCTOBuNHAnLKi9ofYS1E8nCwtpa8lcVv06CQS367FjIzq7M/O7h5Uoua53lDgUP2pN0br5fSCVTQxZWQN+/oVe6GdJwRVL65kz+sTphwpig3VlTkBufw7NhbkzkWJBnMt495Dqpeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589138; c=relaxed/simple;
	bh=nywUXIMprx9MAJUPfvNjXqbhW1zpff6E1pSWT3WavHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcT+e68QsaUzpgazTSVtOczJUTBrfpVeHkTVt5it212uh7Tc+HP3zccWWi3iJy7xvXguGCpEk7oX3+F4y2+rHfOoUXJxxP1NoqAmiJu3YpeAunYAOPA2o1nuWQq7Qi5MrMqsJQUczXRu53nmvdFUwnC3ikM7M7C2dtkBYu1FBW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWaVyEO8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WM6vlmfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S6hsIx2953472
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1pXepWuCv+MAUrWi/jOZaSaG
	vZ0UYWr1PDjYa8i71Ps=; b=cWaVyEO8kwucF9pRUNxNZTWXeVwdxjMrMSwIbHxw
	rEU8JIc3bcNcru1I7Qz1/Hxc+cfwOVyErUJXpwHZGAQvuaXObEvtSm7NK7eQ8Knu
	sU/RToVOa6eyFegIf/fgJzVDdyjdXzZtC+ROGWKiRIyRwm92+v6qo1R2y9dU2o1n
	uhGDTZdVAArbpgz4dNi58hSpCTSq8Cv/8AIIkJdUyapyH+IRUUzRFvNB6cRF1ew8
	kOydvyQV9OyWbgar7ycL3WajesIXLdY1u5445YlT4QopN/Pjehqc88PwWQiMQENQ
	J34kFUMT8KozGQQSpmmezKPVjZZ3xc2xCdtrJKJQBXfYWg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjsvrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:32:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-502ab2494e3so200933041cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769589135; x=1770193935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1pXepWuCv+MAUrWi/jOZaSaGvZ0UYWr1PDjYa8i71Ps=;
        b=WM6vlmfVs1wZHkrQHZOp9Z/HDX3H1Prw9SzmPutBBiqWeNoZYEH+BP9UMUCAmup5A2
         HB7RAfItK8l5rWGBYetQXV1onfYeus5CsXNGeUhqUZJgKpl+oyHYQdaUmzBRvmWvmWE2
         7kqPKwJdRgfIkE6jKAGjUbwYIIjHulM6BSs/gBlgw7mG2X+iV52qarJWIzB7l09l+0JT
         J7u61eV6vzys92h+dUuSeqBqp9AIucKLt5CerqQQ0HtFm1DTncBfhOczc6dILIYzIWub
         PLvqlaLeVxfSVeMeLxaJzVMiVEmVIGJZtRv93KTH48EACiYjeb88G2pXW440iTJKyuF8
         kIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769589135; x=1770193935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pXepWuCv+MAUrWi/jOZaSaGvZ0UYWr1PDjYa8i71Ps=;
        b=bkqwk1tkOpAhpWGtSGzKGwRNTfAtNQT3MwhCANQpEmjkY1kHcu57zbup7HJ7wCBFQb
         LaAP6sY4Taq/Fxbw9yjKrbazMroCjz36giC+A9UNNhwef5bsJ2Z/DNShn61uld3qC5/k
         Dma/agaaUsOkx2lIWi79MPaXQ/N5tU9U71ajbns0WEYO9fWw780w/VBmiJIC4LREkLMF
         lt1fw8SLY6oEMqgEBwTcdMdf4s2gJCCaxBPYFExnl15rDioyooMIcZhqNqLk2uHQYOSK
         OhkSfaJV5SeQ+FrVuH/QuBanuFOB7JsoX3uuy6ejPS4xctsM2+vfE84bjCpO7joLovwD
         B7eA==
X-Forwarded-Encrypted: i=1; AJvYcCWm3bk5zrNsGh4bOAOTJptcvaV6qspn2jRHot+LC5PKrbMd2aJMWixdBQtCAJICQ4IZYctE8IDos8wrFUZl@vger.kernel.org
X-Gm-Message-State: AOJu0YwXjTjstz3Ok9lifcVdhi4bBjAUy2dwF33uYPqbIn7U+OoaCkxF
	Ie2nDHNfW6y4agNfAWC/QQhhDsawe1AkRfNjftntYisK1foQFTVvVCO+WINmBML8A6gg51tSzmL
	of4iYWz1FpzL7oe+hlLl/L+AzVmirct8Lfjn2mrOcDqug+lPqHBgm+yVGYPXtoDW1V6Ei
X-Gm-Gg: AZuq6aJdbzx2ZudhnbNdFMNzZiAE4YnR0H5U2FOpUF/cvasHuUnpf+GVgWvNI5413Um
	p75yaTUMLFiXrYiUgEkjlmmQA9IHl0oSA3BGy58XHUbuUGwN+ZpMopyTAwlkaBAgfrhHy+AFNLJ
	PoIxBeIIuOLcF6moRNnaUOwsmVFB/Es+kZC+LbJpriqmI3EdYy9DoClAKR1fDA6hAYpjkRSenus
	jJ0OOdq1lU41KUJa6Y5jjjwYsnkpMAJ3trhDNbv7W/jwzQ7X0RutylT2333pWahNj7NfEviX0FL
	s0xble2oKzGhBPVNaXq/dkgrhkpvNZpdLZpgvv8+Wm0eDfBxLaJNovgbqZa6/v/7PL4u1mjBy8z
	Ge/8qq+KrJoKPT/M5xxcd6I61
X-Received: by 2002:a05:620a:223:b0:8c7:1118:c514 with SMTP id af79cd13be357-8c71118c91cmr277972185a.17.1769589134863;
        Wed, 28 Jan 2026 00:32:14 -0800 (PST)
X-Received: by 2002:a05:620a:223:b0:8c7:1118:c514 with SMTP id af79cd13be357-8c71118c91cmr277969085a.17.1769589134390;
        Wed, 28 Jan 2026 00:32:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm4991486f8f.24.2026.01.28.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:32:13 -0800 (PST)
Date: Wed, 28 Jan 2026 10:32:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v4 10/10] arm64: defconfig: Enable Kaanapali clock
 controllers
Message-ID: <dxgdoauzfbet45dayic6vmjyh3hu6vdnyccerb42oqorijme55@5ywf65y7ulwo>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
 <20260127-knp-dts-misc-v4-10-02723207a450@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-knp-dts-misc-v4-10-02723207a450@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2OCBTYWx0ZWRfX0s19Q5L9aTDe
 5a4u0de6A2oQGdvMGtK6rVuiUefqORRiUmeMYVXZkEPgnakn/A453kIZminHaAcUA3OOHvdpu+O
 wVSdSb9rN9GSj3aJ5RmHYAEzEefR0zGdCSMTMNjMqf+TTcr5SOx3iFBwhaKWoBS9gzEZ74hBxxU
 oyESodY8NW4feNVAgJcnRYujp/rKQ24Cc81pJYXRPJp+ZV7ASPJ81CfcEX/Ko/Qt+z8emiKKAJp
 vUXFKKcLPx9Z2PAl3SgfXafgPIBxwK6EaZwlKoQyh3G/CMgvb2AGDWzKhcPC1RoQxGGJf8PqAzw
 xh1RN+9z6W9yS9ujX9z8zZ3zMaaG7Gfzf8p8qdalBJ2SH0/LE9Ga5fADBuf2cXCLVFMh59nn9++
 CkibpEtJCVWvsd69LXqKkMucn650IHqOZ4lPG5Oas1avRxQOHjAzB/NuAQvlCIi8UCbHQFNz+6f
 mbIYp/uXujE5SySLGfw==
X-Proofpoint-ORIG-GUID: tP2gHlzDKLFTfJnaxG6bxxQTGTc5QWIE
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979c98f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hHfo9KWc5dFt2d3eTEEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: tP2gHlzDKLFTfJnaxG6bxxQTGTc5QWIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90917-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0079D9E3AE
X-Rspamd-Action: no action

On 26-01-27 00:34:07, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Enable the Kaanapali display, video, camera and gpu clock controller
> for their respective functionalities on the Qualcomm Kaanapali QRD and
> MTP boards.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

