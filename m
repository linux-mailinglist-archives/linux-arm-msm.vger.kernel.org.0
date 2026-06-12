Return-Path: <linux-arm-msm+bounces-112849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wctzNommK2rABQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:26:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4229676E91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:26:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ayk7pGLe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=euhrr7lP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112849-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112849-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F5CB3012C7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087F732C94A;
	Fri, 12 Jun 2026 06:26:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD505396B76
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:26:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781245570; cv=none; b=Y5oGp53K5sD1JmdNVcG3KU9ambTCSti5G8r+ROzy1sgcZlspfQC1X3jBD9/Y8kPhJdKsgtU2xq1lq7AkOQubuQaSa3Zi7cUx1wGDuVzAP0yQSSZgQJhFXEYiI3Kue8g/9aISo4HKMCpiIRB+MAsnUAbM5WlEaXaskRXmY2QqqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781245570; c=relaxed/simple;
	bh=WZdBj2Utl0fGY9kP0lz1w1dhYPCE9yOdhjFDYABMLyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nngejXvbz1udfHzdNAro2VomvsBB4cRdc8QVO7DTXAmLx80PQeJI3sKIAexnGIQ0Ns92br//WC07GDFf2wtY9fe03MLPKouM+qzAB3lxqwHQ44wk6KT7QuG/hnyWokqa7jA75Av2eUmJRCnSohTm5cDiggKenc42zluCyvT8riA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayk7pGLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=euhrr7lP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3A0d5941050
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wqI9RfMnlwiZjg6It5eA1jSZ
	sNj8SRwJHZwJ1QafMlY=; b=ayk7pGLeNvxrMJEdPQcUFePvhGbOR3PaDi95F+Dr
	P7mxCj0w1uFQQWIXPbWtgP0QKUkRlSFhl/oxVKVlC3LerJR5kd7fMxbklH2PrFya
	o9PFHflbVgcNDa485Fmzuc+pQf0+ONCd/CYnv80KeUDt7ol7cXYL0ppp2r6lkmZ2
	H1Gd2Q8ej/H4eX/YuyG4P/ex4c4WJ4t51WkVf/kPhLI9z/Xw7fz8lkhpmIMV6/+e
	NGeCfMci058vAnaaJIEZYjUMfbijnxpw0UTf8yhO3BAdHtKGNMvgvUMKpGvIVe0P
	AjuXY1I6Vd8aOYKGva3+ppkXboA288AfI0jAj6CUWnAiRw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014ju0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:26:09 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963a02dca36so612996241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781245568; x=1781850368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wqI9RfMnlwiZjg6It5eA1jSZsNj8SRwJHZwJ1QafMlY=;
        b=euhrr7lPsmq3VFojq4Ja9i2+/dgWIyV+0fXKt2fSi0cF/gb1nbHKqGIwvy3aD8qn+t
         QLn6RqO4iiqFlA3KISjQDW2trRxdP09yzZV385Zzv7yC4TAoLGJlN8dVp6rGoRWXqgbe
         FSGb2Su4+orZM5IdmQjr0VfdYJGMKPvbcs5W/9lCGctUM2+Buqes0TzdQC4P8ohIVOAA
         3ug8edaNuAbGSFWWPPccsf1m3tzb54x2C1mRVlS2QPbj6WHe8uW3TpGvnZUitlH/HcDU
         f1uBPduTXCKttWkGVsvG5dCWhumuMo94ftpYEiauVzyvdwJJ69BDHjXpXWTa+SLMmvHJ
         HPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781245568; x=1781850368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqI9RfMnlwiZjg6It5eA1jSZsNj8SRwJHZwJ1QafMlY=;
        b=JBnR3WHXff/Sv/gl+X7x2gUrRMhvFfRFfEhheBnGPPd2Nau34hldDhPIrQcWTzESUL
         s7jwyK1lTNMK0VqiR8Wb9puUFXGdH0rPVCP6eagXjLubuKFCaoB59HeQA4dutizArt6P
         P35C2c1Pd+4IHDLNOYPsk/aOVY99Wg1EsJiIpaOEAL0Ub6jsTewTV9TJ1uw8B4MAUMX8
         eZrn9To1NIw1cubJaKIGjeeetwFHyLOWT2XPDvYdZP+o+vwB+FhNl9TToV8z0kuc5t38
         s1heh+A+/vuL8nlVMvsJj4sQg3ilYDp5R2s2GfQn1ERuEaevDnCJf1LgfI/gYLr7A4Fr
         /0VA==
X-Forwarded-Encrypted: i=1; AFNElJ9DcKe9BOQYGPpQRafDBWu6k8WfO/Ga1dbKDEOr2v04ZORIJ/cJGKzWmCzjm4AjOXrgDTaQwLfSsUg0eNHW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz936IlHoVxOqf75dfOI0Tf7Tnj/Vs9A8m54gS30crJIxxqiY8s
	5odBmn+6CgEDfef4rr3Q7GVSJpm13qsM64PZ160gVh2wAxSLjajnxES1gX0cVWxxAbVHB3eLvBH
	UUCu1TIGJptgyfyieyA53izFbZgeFk3RdeGme7LouQL7pis1s1ElUSHmPZJa8C0CbJ0nv
X-Gm-Gg: Acq92OFZPj/NiKqMZA+uHYOnTwJcMo/a2LDj3+GEDD/ZmSgF69iJoq16qD8AHG0fxwZ
	g5EJ7MNFcF2WDYJ5/T0k/OexBB9tBdNUMdxKedaQ+gRji69sHaphr0i2vjbTWY8BOwvxiSarjax
	hFZICM+IQ/t1giHNFkoQ8TcL8UXywxrwBPDOT3HkGTasmKN7aN8L/OnGMsQjq/Pw95BkgL4htUi
	YhIDpHR+dBkKVkvLBhbX+V7L7Ma/Q5Sso959R3BQraVm/Sfs40wBjSHN95GwCd8/S4XTE0ygqZX
	EVhRCV1DksAKKs9/OZeiqTPR52tcfwO8xZ//TUi47bz+A9s/s3yYDcUGPhIb3C6+nAAVDZkwqxG
	Bm6HalnIj1Vy8oQqTncb9XXXqx3WeUWGomVM0fHaBqtPgI3fEI7KM0+TFqZeUSDtVGpCmX4hWW7
	rEjsrLd5Mhx1uCJQnaKvZseEMRKaI1wMZp2Lk=
X-Received: by 2002:a05:6102:8099:b0:604:f155:9374 with SMTP id ada2fe7eead31-71e88c3d841mr627203137.15.1781245568149;
        Thu, 11 Jun 2026 23:26:08 -0700 (PDT)
X-Received: by 2002:a05:6102:8099:b0:604:f155:9374 with SMTP id ada2fe7eead31-71e88c3d841mr627192137.15.1781245567662;
        Thu, 11 Jun 2026 23:26:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c6ca51sm3590861fa.16.2026.06.11.23.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:26:05 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:26:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Sort table entries by index name
Message-ID: <pz4jbvlpjveayxclgd52oicl2al3c4mquyqoyj65cvcbhc42v7@obk4kfsyir4o>
References: <20260611085238.37666-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611085238.37666-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: QRkTQChKB_ms5wlbd3Gd2koiRSVHVD7T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1NiBTYWx0ZWRfX2dpdpNpqxA32
 4s1SKxE5uMd61s6G0ovTncZCd9p7P18YqHnBTpFwH7w+7u4CDJPCU/7W7D/ByVl+zphOGLFY5QE
 iOLwja2qKFckGotFcVQoGJsuEaFXXmQ=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2ba681 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QMNFilipkfS31cSTYiYA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1NiBTYWx0ZWRfXyia6MSkMj8v3
 LazkFv7bYEXYLYJnJeHb30xdMWw9AhzLWmGWiGhGPvcqzm5YtHwl+AcKh2wR99bi3RXWEaOwu4k
 cVC8/nLycKK//qiCo7ZSsJTxUfNstHB4XNZtJLhFn2ZzZ4924ucFDEvZAYLcCPeEVnvSA4m7k7y
 /+H78B8r8hEfEjIsf+b45Ftw4S1sHyttungqsR7Tluczl4L1RIU35bgKAR/lbu90UfoCouirIYJ
 vz712vn4P1usuPs9N37k4wDV7IPv72PMXdHZMvUwLA4C2QoXkmcjvl74+9oOiBP7cNN3wFQrot4
 EaV6qYCid6OPSNL8sdLT9HVtblp91JlmfCPw2d8JFp8b9u/+8QtvxmYwn8OHTsWpcE3VtaoXqy6
 IopmFJw1Yo8YoL1TydUjPsqB8m9ueC98IJk+9RG8DlH76HyRefxUSm8RGw2L0w7cLDj1BEEKctB
 fBYI3KGh8OAT+y9sqxQ==
X-Proofpoint-ORIG-GUID: QRkTQChKB_ms5wlbd3Gd2koiRSVHVD7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112849-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,obk4kfsyir4o:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4229676E91

On Thu, Jun 11, 2026 at 10:52:39AM +0200, Krzysztof Kozlowski wrote:
> List of power domains in arrays of 'struct rpmhpd' are sorted according
> to index name (the define, e.g. RPMHPD_MX), not by actual numerical
> value.  Fix few sorting mistakes, so comparing the tables between
> different devices will be easier.  No functional impact - same binary.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

