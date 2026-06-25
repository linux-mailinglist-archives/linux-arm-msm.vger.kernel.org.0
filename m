Return-Path: <linux-arm-msm+bounces-114518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kl8LB34WPWpywwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:52:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DFB6C546F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:52:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OJe6ZZpx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NkxZGqM0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114518-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114518-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 588B63009B1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F923D8131;
	Thu, 25 Jun 2026 11:51:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560623D88FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:51:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388292; cv=none; b=WLMXe24Lv1AJ7ZrUaA7YJWfTmekQYvvdMerTbTWyw6yfns0tJoEb9Bbaw+G7n1Wdj79sYEtbNBzbHyNjbzw3T8wLKS3zRsOlgpqPIeseCxTGdYVsLOUQKFjt2r3WMsjbUZb8s2P2ay4gskd3NM6H4yIKM1sA0dJU1uhN+1Ogzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388292; c=relaxed/simple;
	bh=9hdZBNNto4XcSJBeJJ3ffJwjIQj5iArOXWtVnbRntZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGBYgjJEhlFxGpnYKRKo1BNtBIuCfg+y+Kor6HVhUI4N7gdcNJZ1seMD/FpGk8NTr/7Gk5sRb+nCgYWbfOHx8QO8epGHuaAwm/XHmu6WQOMeOViQu4ywkxYousySVCJiM7/7u+0tSyPABwFa1wC2uAE3J3cCS8XswLeGX9DyXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJe6ZZpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkxZGqM0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k0Rx1398063
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sd7H9S7CirR3Vc3A8w6/dAsNp5ch3wbXoeVztDkNaSo=; b=OJe6ZZpxWL2d/8e0
	G6CXLM65/zRgC/c2MbXwUuMK3hvOnNm49dYzhaE23hKVV7ONq4Qj4XXroP0pr7lg
	rtuxMRoxmtAh6zI30V+M9AKonxcSSEoQ3r98Sug115O6KYl/oxKzEckTtPNxQT1W
	I7Nx7M0Eye47Vicle4NjGbVjTInPeEJyVts0cdgaiRmgnpctYbC7oTViqdl2WX0d
	KlxFrNrXI7aoPqfo3V9N8ZPbemQSFN7DTjBuMs3AOIEBj2FRvckF8gIIUPcl6Zl+
	cfGbsgIVxgpox5TJS9n29SijrouOq8hejZCEGaYJ8gJVlbToiDYvYz/sJ6A/MqJa
	++KkCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudhxxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:51:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157b3e5182so11165785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782388289; x=1782993089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sd7H9S7CirR3Vc3A8w6/dAsNp5ch3wbXoeVztDkNaSo=;
        b=NkxZGqM0tRp6Vht8qYNuEH0LwOreH7rTj3WoKq9WNSoYOU/JEqjxNmRKJ7pJUwJXEh
         ugtven9o2o8MOpqJdUsnCFfH7/gC3bkVT0+YoCmd85J8+As6dtQuNt68m7yZpnKyCC0W
         qpGfdwiuQbuE9HThIom++iOFh8TwolmOeqJPn+PF0B7eq+yeUPx24NwNZW4uK0aTCUje
         LKAaw9wYjy6vqauDbB4g/nDjw/o6JH9oUdP2TvT6iwBagCoGLt0LDKpECr1d5gs4ZdRm
         mSULZjUiabcoe81b8sVkvSsYKfE/hv4IepwDn3UB4lAfspC8MGhU8Qxs8qBQapRXHK6R
         3JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388289; x=1782993089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sd7H9S7CirR3Vc3A8w6/dAsNp5ch3wbXoeVztDkNaSo=;
        b=aQSyPQ5FSv4U4GPtC6Ub5pueMZsx1q1stICetJLP0tsBM7AMY9frPvkhOf4hGt2Sfz
         HUsGtzKBAcUcdshwYNHxekfwynxK12NsYFrvVAwAhXjCDKUUZd5R8F/Rd3+L1gYaPQ3u
         pIAIqhEUByeB69c+oCvTbp3imGlsqaqjgCqtXwkmXHt7w3ZluOANA+DAuPpuVD9HembW
         ogq9D3rzr4pBAdMQfQPprPeuHU3nIjAFeJVMXZBzyNbgZjltO34JbAnFcZ7xV8JgQTl4
         MCLbE2XQzHVmhhtz674q668qD6z3JpZOZ8nU+QXcyEh4dDt2b64kzw6uVqT2yC57U5b9
         4inA==
X-Gm-Message-State: AOJu0YzbtPXO7vEeiUGDn28LJK1oZBwFEXwavnz0xHZ4mMdExBnbhlyC
	0tlgZRcwSVvM3M5V/VBdJNOsqjS1lbTHzLcWMpBd4u/yAogf1qTiEOeD2/YV1EdFUp20CZMuh6h
	g4Uvl16SV4rgMW/Dntb7ItC9atRqJ3ffsojY4NgNXm1Ul6sF3HzaJfmvS+AryH676CeBm
X-Gm-Gg: AfdE7clsYWjvJcPj+X5Delr0ekB/ac1RVL5QxhuY6aviqZ7R4Qm8xd8g0iWcPyq0JoC
	rZMjRhRdJ6RVUSjrw6YVwzrAhutzd2FTq1DZ1lCqMCf5KVWer4SGJXD4f+gRnQx6o78vaAWpZ9G
	l+Z9rBQYUBpFlLe6s2aIMWxD5+1MEeEC+4L5qebW/g8OwOEImeuzYKsNpVsQmDQMSi5r9uriaty
	tT92pVaECJWcJm+l3MxhLDmhTYCeHhdZFIt1dXGQN0sOnbsPxinHqcGbMZIyBMkm5OMKrEw3Ege
	5PXDrYljQLPGxYzRqiiMNMdxhaSc9FPbqD1mCii1IoEGMlDBbiR5IEScqVUwwM0ARowj9KwnJTz
	bDcxmd1iUrBxVLHUI72oBI3DN7YGTWYiV6so=
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr181340085a.5.1782388288623;
        Thu, 25 Jun 2026 04:51:28 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr181337385a.5.1782388288048;
        Thu, 25 Jun 2026 04:51:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba88b3sm169575966b.12.2026.06.25.04.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:51:27 -0700 (PDT)
Message-ID: <e628c11f-9e11-4082-937e-0c6e8455f244@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:51:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] usb: misc: qcom_eud: add sysfs attribute for port
 selection
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-3-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501170635.2641748-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMSBTYWx0ZWRfX+EfbFd6G6vv2
 KgnfFka/Y8M1im2iWH7QxjFUOvCKVnCDjhcr0HVETGw+AS8kWqH0TAyPH2fMuoGWRJtwZfO6sZe
 iAIzyb0DNaRGbetZ0fBsfBMHROuFMSg=
X-Proofpoint-ORIG-GUID: ubgvwGsRKvGUCj5PTRJhqCd6x8N_IRoJ
X-Proofpoint-GUID: ubgvwGsRKvGUCj5PTRJhqCd6x8N_IRoJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMSBTYWx0ZWRfX0SAiXH/PIEYb
 UnyW/sxs19pWd2dn9vstQXbXIGPcc6agw2Ovur500YfMTjMWbednjtBBfFo81agMFXnog5+eyfe
 nWuMZws9Czrbj50x/G+QO09pTDBwj1SQew7pxxlBkbQucu4zqI65YJz02y8MzKee5QGL0SbZ41c
 wm8ULDpZUFnno1mcaqrBaGOP27JzJdrlUMGtM43+fvzy87dvPNrC4tWMj/Q/qgNmVkuNIqD22uH
 NwfTNUmaK1gQBKkQyOINDC3hVSVkgvejizIyN3Yn5DXRtYfmtQeIiyTjRh+122V4UTtMkTQMYaV
 H3boAYnwn6RwrzKN+TUQP/53uNDPp+7bX7OpTpvql7tRRB46zUy4jNgrmw/+7Q4iZ5pl6rAKAXN
 TFi4PKho5KP4rXnTVB2INWuU+nRkpOYJkHR3Oiptt1L5iJGacwk27BFPkVT9or+Z3lK8cy+FT7L
 rEuHZzG5I5hWyiKt8Og==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3d1641 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Mi7szx8wPLqchxB2UhAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114518-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91DFB6C546F

On 5/1/26 7:06 PM, Elson Serrao wrote:
> EUD can be mapped to either the primary USB port or the secondary USB port
> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
> attribute to allow userspace to select which port EUD should operate on
> and update the ABI documentation. This is needed for systems with dual
> USB ports where EUD needs to be accessible on either port depending on the
> system configuration and use case.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

