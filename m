Return-Path: <linux-arm-msm+bounces-113732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aCiwHZnLM2qtGQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:42:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C3969F73A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:42:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SjRFYxDn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TUCNoX5t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113732-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113732-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B884308B9B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D704C2609E3;
	Thu, 18 Jun 2026 10:40:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C063D6CC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:40:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779232; cv=none; b=FHw/WaVJNMvnQtMlaZ6dqlTyS60QkMPt6x36FzJDi7QyFi4Ahbos59YVPEiDm5KsM/mMDs6qFA2H50WZC/O9KgVcYh9VVydnhE2fmb/XMCusXgshhUBqzH11Unz8o+gHFFIHLEci9DlQRsiVT64qR3fUTPgXxPZOIfvhiQkxK0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779232; c=relaxed/simple;
	bh=gsYNCX/9+Vip4KrqQQXpkJb2UzV+VlxwZ/q3RO9kkTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BeDmIDdX+MnOIZgYWIX1kboTG9k7TA9QK5Bd89p9XPvBn4Za+3Dq1t1yWT1DpkXhXR8/WnkL8O1NEtvx9My+dzrei7DiVLgvBHsU9ghqwQsBHqd56muY4baKJ+PoUAa7Z9wBW9wIzUrKogw/lyu+vc6QzkI6nZ0AFcihX47wZEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjRFYxDn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TUCNoX5t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FOsx1177641
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yP9M3eLD5p2SPiE+RFjEgZ8XR/E+CVlBqdnyyCJmBmw=; b=SjRFYxDnN26e2UPx
	a3tWgXl2s4Pss7bKXVy86/qbBdHgCsZzuqIHRZ4cqbLroBH/a0DINK8lsMd8H5rg
	3WZ96dV0w5WDyGk8EIQAug34bE16fOs+J6QA2UJKC24tNNL1JEgh5Ety1vag6CL8
	uSz1vl80ih7ost8L1ognZI8C4pRu5J9S1KT13p7O9EbxUUzwRSw/4sfGTTIJ5fC2
	5lr4F5KD+j7hkBlAD2lTsLojXvfij7ZZtEriAl9EX5rubzjIh9pzwjq8ymQbSY5m
	u6xgV8ZOOqnGlJ1OTgDmNdkD3Z/Mzb4wINg9p28Y4DURHD2rrgsOXna+M/5PvmBB
	KwZJNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev12kk2rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:40:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156dc90fdaso22672485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779227; x=1782384027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yP9M3eLD5p2SPiE+RFjEgZ8XR/E+CVlBqdnyyCJmBmw=;
        b=TUCNoX5tV92/je8FArfjSUAzG0nmopPtHBnOoGNUVq1HHrArcgbs54G3PLgxFtTNmE
         32Gal6Qw+E15IKSeFPrb3cBEPwytyRK9Txvd18hiM7fT2dcG3naaNPEKvA1mlq37Q+8n
         hY1iwuCT1/DJsWAII6cSMQ3b6hB0u5LefsNaMqrazkgRXLYs38Eclxfso+hcpz5/CFOE
         Q/Yeo1GftjajsUTz911f/DplVZ4q76d+dWhXG/qEaKg1WbjD5K2Mwcaf82Rj93B0xIbF
         5oxR1FsSKH7X9q/5uLkj6IERX+ONcWahX/1ME2lc2hU7RIyN/rjJPbqUEOLuO1wec4Sx
         miqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779227; x=1782384027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP9M3eLD5p2SPiE+RFjEgZ8XR/E+CVlBqdnyyCJmBmw=;
        b=LKXULdWurbo8Q7wUTU69UF8xDeNCPg6QsIWqXlpcp0hqudPyZmg5vlAfAmG2j5/GWI
         ptSKjnC6xhZ3OT77tDL+op3ovK76cPkSfVBjxJjDIqAuciIKYqmYtaa+mhub1nrW3Hzk
         NhzdOxKf/+BbyWKArt2ogWBT4FtosJQDWZj3BC9EPSIKYPPaJztQ2Ugi0I9oZJ5vmCfj
         PR7eClW8PyO75Df75eXN/hMP2N7mZb2wVAOn73i4bft3eQ1JXC5JlvZNJp+FqByESwON
         0+LMc38n6Oy4cIcHAQRoIr2TojjpJ+baow0+5BcwdosGkjPaokRMcXQJld7d8YMUIb2Z
         IT2g==
X-Gm-Message-State: AOJu0YzrZ2tm2r0KOiYTRpuz731Wf7fOP2FWvcPFGMAw6+pnlJilN6uM
	/oUyZPY4n/aD6iXVdm8v0kZ+80g44gvlt/qRp/K7oKRAo+g+5JvSsWGKY1lDjm7OSfsZ8jfEVoP
	YCwz98I/IhLlivR7V1oo89xrF6/HQXlZjPXf7rWXbObcujZK+237nHEwOWyRHk0Hinvvr
X-Gm-Gg: Acq92OFUO5tXLDDQuMd/mZSNE35JAXD7VqVIqMJNOYAev+owIzwfeIlVodYYawY/FKf
	Bdsy44KeUP54o7NIaRnwaH6SxHaZdwnm3ZoJtKO9IZxo7uQ7klPPLQ2uOf2rXNkNrwMIIaQ0R+3
	xpzydTJnYmlr6wGZpj+lL7kqRA7l7vgzg4Im2hguGjOTa2Yc4q8+mj59ni+oE3MBLow0Uf+znvo
	PdbrxWao5sFBuyp5qNFgFeMW3UsMb2erFQfVsacfvYslnO9WJME6WzFeB4ufZBZ9x39f4ck6K9H
	KGbf4uXMKt3xGKAZeC5vaQUr92YYzQS3MekDrXI69J+nOK9yssuBSSuUPMI5dQzmEpJkPSZsd7u
	7meo8mMqN4wPpKK94LRnwZQtSlC/xovPDjqk=
X-Received: by 2002:a05:620a:4150:b0:911:295d:59a1 with SMTP id af79cd13be357-91f2b093a48mr262225885a.8.1781779227216;
        Thu, 18 Jun 2026 03:40:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:911:295d:59a1 with SMTP id af79cd13be357-91f2b093a48mr262222985a.8.1781779226746;
        Thu, 18 Jun 2026 03:40:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm904300666b.53.2026.06.18.03.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:40:25 -0700 (PDT)
Message-ID: <ed1563c1-ecf8-440c-a39f-f8335db77b97@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 12:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX9nyPbeixSFHO
 qmESOgTLk2i3Td3W3bTf/BcL1NxSPuGB+4A21h2NqT3bdGCq6tyT1vdEF5O675Bs5bmTiCsc0oO
 XZfkmLK7L+cPH8TzgYpCnPJyMiVA2ez2xrfRhmQpwOn5LEiu15RGgvvcxlR5XwaGJOmTekHmi0e
 CVrBiIiRpMgGexZLaaqRqZYdVRbP77us6FYg0rLwMFPpGFxJcFwIHXaEf3CHMsRuJgML9YPOe5d
 Dpt+Gz6PQeOKMe6bMiT1Bzat7t/gc9LJbNLJACwYrZE8cFVnHen96VrSYtJ/OaqC5U+6dN+MXY0
 ZHAi3rM8EhIBl1ibbiaONdM5X/0Zea7JWt8XfV+fjUPgMTAiQVX0EaSh2TdG9jOM87PE8IMj2cQ
 JEPrxAHVy87zj1ViGdfu9IN1oFSgyhau03G3+PABn4nIHif1guX+XCvH4NDaYWAVXNkVIM5Q5Yv
 STl7RklWKZr+dJjrIVA==
X-Proofpoint-GUID: TIMNsY5EwddMxCNhfH3iUv77gRtsfWvm
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a33cb1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=-5NnJTC0Us8thdTu4NUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TIMNsY5EwddMxCNhfH3iUv77gRtsfWvm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfXwIImlWA1zd/B
 wR6bO/xB2OIPwzDZa6b98HnGO2mdgAsf+oIJ16z4ztqmstFGH8An7gY64I7IGa21RhuBqRWzLzT
 tfifax49oeMUYzAcG059zJRI0GPMqOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113732-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 03C3969F73A

On 6/17/26 2:53 PM, Neil Armstrong wrote:
> Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
> found on the PMK8550 which allow reading ADC data on the PMK8550
> and other PMICs on the system.
> 
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> Depends on:
> - https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v4:
> - Rebase on https://lore.kernel.org/all/20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com/
> - Change all defines
> - Reorder nodes
> - Link to v3: https://patch.msgid.link/20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org

wrt

https://lore.kernel.org/all/qgjntewdw2qesvkeabvx46zxcwrikvpkgthk7e2cqw7biuhmqt@2khmbjh2dt26/

you added a comment:

/* use the default settle time */

which the bindings tell me is 15. +Dmitry did you grab that value
from the downstream kernel or something?

Konrad

