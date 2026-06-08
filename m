Return-Path: <linux-arm-msm+bounces-111763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +fTXGtmFJmooYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:05:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E29296545D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:05:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kECHpzv6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MQGNca1v;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111763-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111763-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BCBF308DC4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832853B3BFE;
	Mon,  8 Jun 2026 08:58:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347CB3B38B4
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:58:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909107; cv=none; b=tS8QepfbdTNd/cC6crRZP5Tn0/xRJCifjXrMWJepf1YfuD2E5ku62kKM8xNisLOnDCAyhT7Ghy2+g7lMmcO8pieB/ffigpvcC4aZrOG5JjTQjYc7KufChgRU1KuUS9dQrcGXS8jldp9c3EJ7i4NHtq/ROYJ7zcUT55XYIbuKlsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909107; c=relaxed/simple;
	bh=HReFezNfdr/kMofJuLzTUUQ/PAkNAjV+vPvTQuotlNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ar6i6luRXBKT1JqDg2MCsObUFAOSy+LWq8Sws3kFsVGv8wcKtJoUNMbscRVvZO+6fQiKtZy/yBEb151yl8SsFszIobYKBq0blvM7epU8hvWl91gi1f6f4H8Hfbvx+GPuKWD4o9OSMX0yMWfvei2RTL2E6iFarnwToo5z5soQEWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kECHpzv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQGNca1v; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkeK2382832
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CGhJ5tiXrZbmeqn6GK4TnpDNV0Mk0psaT0hvDZqXFnE=; b=kECHpzv6/n2S2Qur
	KmYRefTWN/xNyvjLc0JPTgLvLZNlisewfjfu8uYyPey7ow+MCWEjVZ64ee78L4H7
	py28Q/+bM8yFX9RnlSPSFZ0FALfSlVX/0OMajg+HcmrRXEFZwdrkJuh5R+PZcGK+
	nGHLGySCDVRTxYZzUolCA7vHWC8J9STUXYf1qsJ+o2zVH0FHWW0Jd1OLns9ikpGi
	UejkmZXw6Zjx1bF5YQIZlSkDEfu4tQf3Q2/DWooZ8u3VTg3WjRMdqWuV/n1xaHvq
	kapYkxFFsweyYNCJDNeg9AuSnAJKwamAGgUQRrwpP/lOm3i6wf2Efs+W5YUpazA/
	k8zC5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cyesk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:58:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91550f68e7cso115940885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780909104; x=1781513904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGhJ5tiXrZbmeqn6GK4TnpDNV0Mk0psaT0hvDZqXFnE=;
        b=MQGNca1vf/cSQj5RZNrh+u8ruLIXy44DvciyQvu0Y+BqrqRHOhbdEF8DdXBdA5cVR+
         CJTWDrpfx8T4LPYaBjycy2SOSbdmW9oyxC78C8BIaHxSnEVVGDY3pz0vDXAu19QGSxi/
         6gXQE5akgfJvzJvIuVNZUUASGfytQN3cq6dLQTlQntvJBgi4CoYXOwBYfU4obF2UqVbT
         FyVB+ITUR6U5U5+gVUMVz+oNptHS6NVEfTgsaawNdO9PDQczG/2Zqiaxq9NA+Y6kH9b2
         qy21IEOgiYm9TJWVp3eiHj0oBAR0s8asNQCoEORVQraaPVGHg/MG4+ZvrX++c3HLPPQL
         j7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909104; x=1781513904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGhJ5tiXrZbmeqn6GK4TnpDNV0Mk0psaT0hvDZqXFnE=;
        b=SvgWV6Wih5UQ1nASUnzKgPE5Epio/44o3cm8oRrnSLVjf5T9+0dC3kMqEBvjiQKQir
         m24ZAScMqiBJjEvCJZ/FSkq4StB32TptZcmkZTsHIeCVeebl+Ck/nDaymTR9xLRl1UM2
         VTI9auQ3tIWEW03NAHDXRZu8e2TB2IF7VZmI82jQP8mbwwidsNiM2t7/4gzrR2/jDTEU
         js5Vu0ST9f+ygI3kDMsxGRfFXzxdzoum1i8nR5eH2Nm5d2U3JndJgUcPCy+QI0dGhT1N
         YF06loejaHKYh8XNVjC6l3uTI8g6sVrQU7rkRbv0M9uGusT7HBgM53W9npYRLKt2NUak
         afmg==
X-Forwarded-Encrypted: i=1; AFNElJ/22u7Y7D47EyZWpv2yDRxN2obewRkQb+mKXOjuwCzoA5Wa71+WMGB2hdHsY1y0KPL34mraxEv/UPeoVFsM@vger.kernel.org
X-Gm-Message-State: AOJu0YxlrIv/kkamdtaD4ndmCy0lOdXJAglrXWEj5w6/fr/SJUHDweC6
	58VSC4RL39DKFCSdar/W8MxvP6k7C+LgXF0666IXdvO1YwjoN85fxcE/7Z5gazwvf3H9Rtqg1MU
	p8RhYYYDY6QHUmBdeNZFZSfbl9dXY8qFSwdn8ZSbNIRuBK9bjkeNSOf/MmkHb9b5gKJgdV4V9g6
	ai
X-Gm-Gg: Acq92OF3gHgpHJCGCWIcpC6ndigcvTkTO1XHX9vhZ3K3ftJFtNlm4Em5SBLnzpQAAEb
	/ZAzMyMjuryWPnnv8B9NA3D+uXIOioc/f6TsjsE6d/mLLUs5sW2jesIIjgPJdzpSoH/cpxGf0Pj
	D/8ClS7qhrAbvWBNShkLwMLxCJHGzHahpajUxdVMlu83Aoq0IA+1CqRsjRGfurwkazDTTjHFAdo
	UGk6hBy74PCIjH42Hdm+wSB7jqsuWRCkPNkImSQbsvEore/aExG2CbmcQWDd/6dprBYhRTPUUaf
	D8NRQ4NoGblzYsPIW9RY0nAd/pGXEhAjyiGdK2COhccX8uMMYYSEuD3bqhE+EIT84DR6uislss+
	88LjtR0ksPOuS9DGKsr8sjAhlilF0PYFMfktAkUH5zeBkbJn3WLD7HOsb
X-Received: by 2002:a05:620a:40ca:b0:915:83fa:b3d9 with SMTP id af79cd13be357-915a9c21c3emr1321679285a.1.1780909104511;
        Mon, 08 Jun 2026 01:58:24 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:915:83fa:b3d9 with SMTP id af79cd13be357-915a9c21c3emr1321677985a.1.1780909103986;
        Mon, 08 Jun 2026 01:58:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf2f2da4447sm556288366b.10.2026.06.08.01.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:58:23 -0700 (PDT)
Message-ID: <9117ce31-2cc9-4f52-b223-fe0dacddcc65@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:58:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: simplify allocation
To: Rosen Penev <rosenp@gmail.com>, linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be|_ptr)?b"
 <linux-hardening@vger.kernel.org>
References: <20260608050429.5990-1-rosenp@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608050429.5990-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MyBTYWx0ZWRfX9UhwhgMsAYWx
 oz3q7PkGStBJ+oRqpvMftr/cN8CpwkqJ6kdTtXAoHVEoFGuurydpJ9r0TufQ8653hvi2yZJM0bt
 d2x1BwXP1wCho06L4ctKX22KM9j10mXKGmQrsy6X9b/lLSBWKmIc+UgJ+FVjKE8sHjVqTycmCce
 vTa1hvFZvZDoCIx231QUZDuEjGY220tlnMypFMETlh0eczkxloXzG8rOdN7IPcTqCRr6HMohLV7
 QWITesJUlaLfYfcyBWv9k1YBmoqHrl1KOjo45yVpyfq+O/80deBzzhBPtOusghzh/OTx3qZWyJY
 J2N6zls2jpmdW2NFaxuHtxWugVJqj2cJqnUJ6tFm0m27m7P5g8JDHSXGlKDoQh1+xlfSs8Lk6VQ
 JbdhJNZ6XdlcaOb/HH5sbzmjwNCVU2CVcec6e4gW92a1YdHLp8P7NESeTIUMH+HsYj1TKtkVbHr
 QZHuvR9RAoRbE/rgzew==
X-Proofpoint-ORIG-GUID: KtHrkvET4Hnv73m5To7Wxrdmq0-tU513
X-Proofpoint-GUID: KtHrkvET4Hnv73m5To7Wxrdmq0-tU513
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a268431 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=7l3-gkCRI4JLb9_0IUsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111763-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-pm@vger.kernel.org,m:djakov@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E29296545D7

On 6/8/26 7:04 AM, Rosen Penev wrote:
> Use a flexible array member to reduce allocation by 1.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment after allocation before any array access,
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

[...]

> diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
> index 7d1cb2efa9ee..b08821c2ef74 100644
> --- a/drivers/interconnect/qcom/icc-rpm.h
> +++ b/drivers/interconnect/qcom/icc-rpm.h
> @@ -64,9 +64,9 @@ struct qcom_icc_provider {
>  	u32 bus_clk_rate[QCOM_SMD_RPM_STATE_NUM];
>  	const struct rpm_clk_resource *bus_clk_desc;
>  	struct clk *bus_clk;
> -	struct clk_bulk_data *intf_clks;
>  	bool keep_alive;
>  	bool ignore_enxio;
> +	struct clk_bulk_data intf_clks[] __counted_by(num_intf_clks);

nit: it's easier to visually track if these are kept together. I think
you may also need to update the kerneldoc as the order changes

Konrad

