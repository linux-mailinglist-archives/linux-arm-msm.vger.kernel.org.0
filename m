Return-Path: <linux-arm-msm+bounces-116735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hFV/MQ2JS2oQVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:53:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EF370F80C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:53:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aCwWgdbj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D+A5Jcf7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116735-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116735-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7784332CCB5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E999D3EB818;
	Mon,  6 Jul 2026 09:45:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C741366806
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:45:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331117; cv=none; b=OIZSZqNkxUknxdZBXCF6K34RPDFGch8qhsYdddnisi0AgSge9DWw2vod3BR8ocjmcsTNj90n71mj+pwhPBtt+VKd24sSwzyBk6l9gV48wS6DjX3dXezBbmZtqtcYHSZKefBI6M3WyOMS5iwnfkEzM/Fq6QHLL8UuOM/toyyOt4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331117; c=relaxed/simple;
	bh=Tw4B2jNJBOXEcZfGGtD+C2EhJJWA9I1k4NwMc6+F1x0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REwvEZyyv8GLqpcudpXD3CtDOoN0UpoCL//aapOuQlFnmYtd0U15+dXFhUiqFCvDgjeX2VnRVLKNWXBIgLNeMHOF/O3T6TEXyzPjpigNL97ht9sPklN49MHomBmeeOOwsJQ98MADAZN/FgvZovQYiegrEH1ckTK9kjV3O60GHOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCwWgdbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+A5Jcf7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693rbu107420
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tw4B2jNJBOXEcZfGGtD+C2EhJJWA9I1k4NwMc6+F1x0=; b=aCwWgdbj630O9pBF
	iF5BqZeOfQtYxMvD44RsXB4gCXuY5jjiCubrO2UOTchWSzmpMEbi6e3dIWGOnhwJ
	svK26YtrjwTo2jTMyCA4h8QoAqCZaOB2FqRwVfrfPe9dnMktda2fmF2OYwWhUL4M
	Ea9hP4DasAKLBcp/RRNe1uXrAvVllMMCVD0VDtRA8q0g4xFGnwGougs9ZKXx+7q2
	gLnbIIe7TlGew3h1E0JEhiOrHn8ax7O2D4UWdXPxmiz5rNUI8xR0JsNL0hpyiwwK
	At6nkJ6sZoVPmpgpqZLAr0QN9QyGPueL3/kbYw+lzS+nx/3jPEoboUBp4pO7aDpF
	e6V+4Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur874-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:45:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so21151311cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783331111; x=1783935911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tw4B2jNJBOXEcZfGGtD+C2EhJJWA9I1k4NwMc6+F1x0=;
        b=D+A5Jcf78PYhy0DMIiD9w+f6UolpA88Cmehhf3q5RHY7MlXIFkQxrhrcAn3k0E4wMU
         YYKCKJMqdtT9X2c9OLNDoKlBp4BLhlZC6u91dmoq3K4g7QXrxMLC/3u97tNbs2qw5kyT
         +X404vYxUf/moNtNDk63FHMsdjUb8KLTMT0qNgZRsLxUQ3yf78YAfkPCi3yv9zp2B2Gg
         b+gd+C/EScaJydx/Iy/5oqtrw2Ow6R9Z+ukgTBSb3sjuD6aLASPi8IWm3ixYoyJNU0E7
         F8agsmPPthcrjjB4f1S1PXGJ7PuDDrin6qBxCy7SYcrt/ELbflyu2jFtnNi+dh4IWSl+
         hWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331111; x=1783935911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tw4B2jNJBOXEcZfGGtD+C2EhJJWA9I1k4NwMc6+F1x0=;
        b=OvDMzIMqqXJOLMX7UCvAQT/1YRjNXOP/b7u060KR1uySyh/EXKF2/t8nCfFse8C0Ed
         ph8abqRc2YRFS0IadRfMnG2e1WM8Ka3MF7vTsNmaPWh5T6HcTz0gjG4yWUCF7E/TkND9
         hLmvbnc19g1X8oO/M0uRsZxthvT/p8Jrs2LvXhiyWuqgE2FhAKYP1JP6hxmJ0cJlpEk9
         K2MVvn2ZoPNZkpbWSXLNd49aw+9cZEi1NyX3JqIHKt39/wGbxoItbQe38O89KXvQaOT4
         zDI464RedLlYJ9/cpcd/6GCgMfjnJJeiZvTP7jaLe+aa8dHYD3YE9IBOVgt3mEGlrWh/
         LPfQ==
X-Gm-Message-State: AOJu0YzMkeBLwEKLsDzv1+wtLhSLH2bMKEILhZxtSvfS6sUyE3NykZu+
	U8E+wNxIcm19PUldjvHWYQ2NLfoCSfwEe0Lvh7PMQYO7gE0D9/d11xUykIZEvaq+yFhWo36UxRl
	Vca+AHUq1oWpsH5WYE3gFlx9yxdgxuZJsbJujhSNXH65CtpENuEK2OK4ODAjcg7bb9pwx
X-Gm-Gg: AfdE7clJEi6HuoamyF3ZCEsGiA6oPMsQ5xcieKMHQsOPF3LyTrEgkRi9IDDHsw+y92C
	54fLo9nb/IUK+UP7FcwzZ+Ac3HBvx7x8GUkcwKDPO1yENdiMbwRMxFFwIaA2DOKQ169fii7Stgp
	Vn96sOgVax3RimeyRoWqJVY98kli5ftQ7uwZgfD7bR93uprUqViLUOXiCwu8CFQgheBcIEo9nkR
	e6whQ0zYZcwRa0oK+ynJnauuOuOjbyyr2M97qnvYnmI8R0L4WNzZ3KNyDu37XNDbUNPlxjZ80+P
	ogJdOw3l8pIggpvVGEjyYxA+4/JcEAPi9/eGyIkC7X6dqDMveJZ4lEtAIQhS6dsCwSGIioONE9D
	HaLlIKfzkHiu8bDNiCizUkYd3shTqt3Aeirw=
X-Received: by 2002:a05:622a:3:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c4bd95042mr88693741cf.1.1783331111389;
        Mon, 06 Jul 2026 02:45:11 -0700 (PDT)
X-Received: by 2002:a05:622a:3:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c4bd95042mr88693431cf.1.1783331110901;
        Mon, 06 Jul 2026 02:45:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c52sm723096666b.58.2026.07.06.02.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:45:10 -0700 (PDT)
Message-ID: <c22aaeac-1b9d-46a1-8fc2-ba48422736d5@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:45:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dUDao9hvukzEe7D5vdijvRQWR8FDGROi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5OCBTYWx0ZWRfX9NmNNyMGBvo4
 D11f3SXV3DzKD5ZSL1xAz1KB0lzkdGDpCwCVLkO8RZ9u4tVhXBaO0FpYaNNHlhpLsq1QZI6w33e
 oNHtM/+JBgBx9FzLc4LdCCHuIx/kjwk=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b7928 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=nlOaL7ehIu8gELSPAx8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5OCBTYWx0ZWRfX9AvzaVI7A+yX
 frYaAoYUqp67R7n9oOBUFHVSW8+PWZybb6mPkooeWkxcvfHtUgnnsy40mpiwwChK8t9KrQV4r88
 mHwhN3cNTgd66nQoxkCG62pHiXWnqVlKRYb9N8uT/HtwzUVWnMAhaR/dYSHeWkMPTu3pVxEVBE9
 tws8+qQIpGknfa1HHamrZfAoGcoRVSs9sXP2nFpVhMDe5Ouf5Iw1Bsn9VLWs8pWh8DTD79t44Mh
 1JnlvJIISBqbKJuFnwi9hHIoKkzUiLrlmfSxnl+evtCctcRb/gUwXZAv3BusEbRDDtGfMvvMAfk
 7SKBFocfHVUVgUYWqaE169aMg/V3eAFynJ+tZAq7M6ozLUKZBTj7h85SK5Mj20gx5HO/YUOXugN
 DSXUzswHSv1AWX+owfkosFmm1kC5ksTyjUBEvFA730oBZH5MClg+REu6+uOS6JpeKImyWwwf50f
 +/XkWhilsum4JofPQYA==
X-Proofpoint-ORIG-GUID: dUDao9hvukzEe7D5vdijvRQWR8FDGROi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060098
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116735-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33EF370F80C

On 7/3/26 1:13 PM, Sneh Mankad wrote:
> Document the compatible for Shikra.

Please include some of the information you mentioned in the cover
letter, since this isn't just yet another boilerplate compatible

Konrad

