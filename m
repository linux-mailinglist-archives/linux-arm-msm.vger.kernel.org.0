Return-Path: <linux-arm-msm+bounces-103699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BdFNxno5WlkpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:47:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EEF42868D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1002F308FD2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA81389E1F;
	Mon, 20 Apr 2026 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C170iHTf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5SUO+fw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7220138945D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674371; cv=none; b=VfHkub8QaCgVCayY7jID4PVHQD/V6XnNxB69wyqk8enbI9E10hjf+4LMpDmm8SdnCKui3/0RACzcDuI96cMYUEmQz5IogwI8VevMkgmSnjoao4aJAngf1tS7s6HqOTo1Z75YYU+3kOVwNGzgRnUzqrdDl7/4hI9986XNCl/QeoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674371; c=relaxed/simple;
	bh=wKDYz3kQXAIVeF5ikhXg38czhZj+XGuLSJRadJLZpN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ15ms9A+kkl6GkSZkEOCntq1P8iYwBWv0I9igGZpl5UKA39+zQmTFxpxE1qA3Fu6LkMou9QRGbAwmZwePEk0R75GVPHxuBcjltDxldYNghJ8jlFkI5M+fn3hsjZXlwi8uFiWxjGP4jfa5JaXngpAZHILTjZkKPor9RbPNR90/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C170iHTf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5SUO+fw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7PFoU921200
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r9G7P6Pct0H7sksU5StTxGp5
	NwLeVWquxkXwd2gnEGg=; b=C170iHTff6u+ouhLvq+FNHn0aea6czS8+YaFdbNW
	/2gdDJ8Xz1yxwjH5aaRsacCSjZqSYXxKly2h+pX/FiiqkjhpSz3kGE67EgN66OHQ
	AZ+GkobI7KdM0m9EmRXB5nb+NXigvB4Y4TWoL05ZbtsD+dV4LwHg01BkzNi/Xhu9
	AsCEI1ZKrbvuxv9w0ztIT69GPqKrwhFCi7l22POi9h9B5R/l8/uozCgkqYD690RX
	QSRgzZpY7VpZOxGtCwWC9x8phdRihU+u9F94CYTzrXCZXwnI0glUK1kQ+GRHGDJI
	4Ouvf68F+5cDiEF3XEmZRFbypunvvURgaIWcvJ5R6hMoLA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx52qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:39:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2dd1c74508cso5253297eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776674368; x=1777279168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r9G7P6Pct0H7sksU5StTxGp5NwLeVWquxkXwd2gnEGg=;
        b=e5SUO+fwgWqrUldA1iwF8hkxmJVOl9zImsjIqDozxAd4tRcGJ9e01MStgkj0pEzlls
         oendXbaWyPNTPJdGYxm5TIDNXkhfO0gVE25FTEC8HFh+CpL1c63G6vVg0gldoP77u2S9
         /+Sr8g0aL4UHTbh6j0MnzbnBLEpu22Pj2UgL6Cxi1Hgv2C+oSWDp2XoAIuEY77Gdh5S7
         WaQkKTUz89VcGI+ej0bQ3BAiE4uEmWCxcfyI/mw3r7bd9tGHziyEZB5LwWnA+7rc6ed3
         l5HWUY9EXebIIA1hixlMm3yn9H6if5cjni4RMF0sOarJnOvmj/o7pDlgwD3CmsQPmOS5
         WxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674368; x=1777279168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9G7P6Pct0H7sksU5StTxGp5NwLeVWquxkXwd2gnEGg=;
        b=pvl/84CMNAXUxevDSlK6BRQ/HV/R/NWTHHaT3l8WRTKT7vX7EFhDbxHRtEMGTDXFVb
         BMDm4RkYXas5GRPQnwTHHWR86GP89FFCfJ9+OTNgUkPLPq3p5e0KKRRsZcfOMya/XpPy
         2Q1PCE0ZU9CPYBsljYEzm9m46RQt9gkEt7T+DUwLKGGefIVHzIi7LuYJ7yNYk7RsOnzA
         nNjA7DYLgCRwU+hWa1QXyB8WV8jraS0OagrgNuKJ66+SsyBgiAOWcAX/ISCX7KOrGWT+
         O6sKZDZdLBAai+QOXMLdNoP8ugwDlc29BtW/WOY83oLI9AOkDppsenERMVxdiKSJkph8
         +w3g==
X-Forwarded-Encrypted: i=1; AFNElJ9Zvo96e+kvJA4g4tnCQ7aIRCmMTw+3QwCB5UmoebOI2TUxhRbcRV83EDmqEjTqvm0xqKmkMxzcUwAhsqPe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+/Uk94Hg3kZKyiRRwQZSn6Y4KtBczAptOodfbBCBIL4rJaQG
	3ZIn9KMcglz6TjQFMRzNP9w8OVR8Z48S0eus/rFLVEsSj4NKo8HB1tOYgBaY4cW/ok3GkIEX3+w
	Fz+76X2uYLRJYjG5yv3U6zUUDIACYIocU6t+5iY+rhteOOlewbI1JqKTCJUsKCC6HB93B
X-Gm-Gg: AeBDiesAREVHWBEG+Wzu3BqziR5cf3ad2Jz4DNfHCfYTQqFA9kS+X9knq2tv0H7c53B
	z589aGcIUWheI5Im+fIidClC9VPS+bNIQrUgiezGffxO6ixx8lPwT37gvr+JEqA+sian5eQnhcx
	YJJIK3N9eZg9XQBA6L0EhyZ9hp+4Ilce4Ja/usRm+AT5zIXdqbJ3Br0zh689krNaQ3QRCIVqBO7
	sSegWudZxfZwSDz8Foq9+fkOiLcBhruePDRAvilFC89zAmmahxOYgQJxowy0JykrmCLYp/MRjv9
	VVUz5uB/7HdK+C+TO1nl9zIVadpcywuUhkJ3QFPQJqxTmf0R9e7ulx5lZSxM1TLr+QsnGomOa6Y
	snmNf4BbN+ecjfcjhhBp1B+A5z+49fjsE1dR9zuiQzY7OyPMnjgTuKSEL9leYfP7i41fEww9zri
	k=
X-Received: by 2002:a05:7300:e78d:b0:2de:3022:a459 with SMTP id 5a478bee46e88-2e478935dd3mr6617543eec.21.1776674368423;
        Mon, 20 Apr 2026 01:39:28 -0700 (PDT)
X-Received: by 2002:a05:7300:e78d:b0:2de:3022:a459 with SMTP id 5a478bee46e88-2e478935dd3mr6617514eec.21.1776674367871;
        Mon, 20 Apr 2026 01:39:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a80c7sm16452316eec.10.2026.04.20.01.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 01:39:27 -0700 (PDT)
Date: Mon, 20 Apr 2026 16:39:21 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document
 Nord ICE
Message-ID: <aeXmOSfAFoxhIAcD@QCOM-aGQu4IUr3Y>
References: <20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com>
 <dd5ee12e-1aac-494f-a8f8-74e236ecb47c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd5ee12e-1aac-494f-a8f8-74e236ecb47c@kernel.org>
X-Proofpoint-ORIG-GUID: pKEoUMC2YRSSSUWjjAEjN3hj6EUkJQTH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MiBTYWx0ZWRfX2m+UnWILeoHC
 H+ouH3qOnmM8LcDf21pz1fMVKUyZx44VV40Flnk0a2c7TDO/DVzb0yf4+/6ZuMosnUfrfmGztL1
 IPwVXbNSV5Xdin4dux4G/S8BS8KtYerbun7jfz4IHg6bij2lB0GMRTia2OCWCV7QaH+QzK0m7OW
 5LkEzrVu2MrwxYsOSPvorMjOjmQG7iUvl/Rt7Ai/jhcjDgjTLBAv2ZFLbF+wbjaaSqBP2vW5b+S
 SkLv5rgzxmSI8m1ADCCh/B/5f+3yKfKEPqmCKRKL7DxTP57qeRmXrCUyOvakVbyNFi0EWKoaYvF
 CVPVyEFXGvjKMbtI+D2/ybZojkDqUDmyi6otVCKAV0C7U6EPxIAqqynm6MPqIEJebt9/ejgIK3m
 gk1M2RWINwkRwD7te6OA77EaaxeOWq0PucT3JkN32PxR83Qequ6RSZpkK1mQVxO6iTYFZkXR9xI
 cQvYMAuVAURMehDtt7w==
X-Proofpoint-GUID: pKEoUMC2YRSSSUWjjAEjN3hj6EUkJQTH
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e5e641 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=lhIjiZdZG9_ld_Bbx38A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200082
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103699-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67EEF42868D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:27:56AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 09:33, Shawn Guo wrote:
> > Add compatible for Inline Crypto Engine (ICE) on Qualcomm Nord SoC
> > witha fallback on qcom,inline-crypto-engine.
> 
> Don't explain what the diff is doing. Explain why. Why do you use fallback?
> 
> What is Nord? It's nowhere explained. First posting was 1.5 months ago
> and it did not provide any explanation. I don't see any information
> being posted in the series sent now.

I'm still checking internally to see how we can get the best socinfo
patch describing Nord which is a SoC family covering both SA8997P and
IQ10 variant.  Hopefully I will get it soon.

Shawn

