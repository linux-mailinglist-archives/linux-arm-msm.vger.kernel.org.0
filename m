Return-Path: <linux-arm-msm+bounces-117268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /komOaHVTGpCqgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:32:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607171A697
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lGgZ8QVF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="UmaG04E/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117268-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117268-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC91830E53B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91C83DE452;
	Tue,  7 Jul 2026 10:22:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C843DD87B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:22:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419722; cv=none; b=FqkKkeanxzFPV5f5TrPbh2rg5tneV9HDXv0NbNxKS621qcvbHyFG4V/65Bn97ak/xFyrgDiKUrltzFBHnLbEwjz5XPbOddTPwWANOhITcm4EFb4yDbHQmiqjEOHjhAMDN2JHN/424x1iJRpnLVvvdgz428/EiUdQwo7V0xLFfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419722; c=relaxed/simple;
	bh=OnKD9+dtoR4+Kg+NOHjkHev+oc5f3OmADkx3Zs5N+MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hfl633xN23g2lNo8B0+aXA4jo0sEuuSNHcRVTgzZg7LZ0a1xRStKu2LyoIkxvoLVHis/4PKPAisfzb4QHDipt7F8HCj0pWJQopMBo/63GiP8+GqXoprDRJhq63elbdG59KUfp8STNpTQJshMTQ68MkdPhV0g0wvCxPE09WcbhBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGgZ8QVF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmaG04E/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DkFi3138642
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=; b=lGgZ8QVFL77OVN0t
	xWhpKDyGHX8oRRgoSf7/BGKO0SeTGSgdtxJIt7r0gOw8ZKm+KSpE9fR6/Zket3AV
	H1EbcpfAicS3wygii0pBA3jomdyB0JHkaqbm4XkZIrvJz4E4Npg4Jfb9ncLhPIhl
	elGd2PXqzW+RBIt5eEappbECtjiwua2UjF+uotE6eWD7hpqbtTQ3roig0wDfp19D
	zTk3N0OPwfw+aTSHjj7moIEujJB8GPCfzKa04syhNA2tcMvX0p5ZB7D/VQIYRmF7
	ZPTmxIsMcoirB4atxvkEtmyHjypgvsHbVxUL9X2Q9KPfxODb6AWQHqOQYSQI8W08
	Lj65/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t159fck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:22:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c267931ebso24304861cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419720; x=1784024520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=UmaG04E/4NzGVAOI5b04/ztiDhikEHXuBBHVatZPUJ6YeJQNGVzqKWbtsYLIfHMeW3
         vg2itpBBBVrzCLUAHhIv6k4arxf7evvanGtNF70HBtTmPyWHpJBrlc9bobPpcaFUDEV2
         jtHDVvJWOsYlOvBGTfEEZboIkJ2omNJTt37cTwTC3Zfutm4xAfy5WooTOAbren8IXehs
         DM0fI5+p6oRgoKIkLduZ/G8EnG+XPVwHpVdcIh0eB9GxPphQvXGp022IvkveyQdAusZU
         OmbvEP/ryXwR4dBVMH87GrImaqFYE+qQ5KOy64iimT9w9Em+zEtucXDdsMVhN23kWtIX
         45LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419720; x=1784024520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=G4qz41LKZZqiLbBTNGC1eVC/xj0IQ6cTZmSMwuYPmVOfznF39cEJShak5/2fqZAfo1
         hqNjxA0eF8iT5Q1C+gViewaa8dVqPPu0LRkyGMnb2ey1UrrfHoGKqaMh94FHQ2yGM0Pz
         JJ+PMErWLWPqN96WYvsttQ6LeYpvB4eNNTUdUB6KgKC4gZpxhtqK/Tz19hSlT07Xb6t4
         60e0Swh7tVEM5dklXq4OeQZrQCOYiYDo2EY1xSWx0U+/d12DD2uZlJchVPU1vkWQ0DFP
         uPIaKDrdoEtAYKazOMFgYYSCDE+SRcxpxZj6OQwMZgTP5/pfMWIWS4H49HU+C7COrN8o
         e+nA==
X-Gm-Message-State: AOJu0Yz6XrSVTvNvdu7wXoytkBmJTh8oiUq5jlRmUCN66nzDmGPa2yVq
	zJzrZJAOM0sTmTmP8+JCiwGNJKy6ra5kqhZcQDr110e/CmMhXBMJKHfjXgOpXX0L4vUgAUSCGwz
	PtdpOeB6blM/DlgwyrWw3bPFTZVNK4ArpoZSm8qXWq96R6ZqdsBy04bJaTsyn6H9RaL6r
X-Gm-Gg: AfdE7cknBV27OlPXUHUJhYZmgfG67Q9XNQWAPQ2wGgkTQmeHCz01Zs+Rao9uUYiTxb1
	SbzjBbGZJMsVd0eY8hu6mJRYlYlBJN1X2nZSzSQw6kYofImLU0XXTh6nhjdPS82uCHlxMtZUG9j
	EzP/VCtWoFiLqpcK9o+BnLXpnnCWuZEAXuuEhm3eYp3c7dWqsHmmi6AmTVgAleQ8t2vuXC8A+3Y
	jrUSVLVe+wzbQkgN6VVTWmSUBaBYgKrxyUj48vf5DamvcmCsK815ji3Xwxhpf0xEt78WJE6zD5z
	Cztgn6EBXtmhwnniVXYgFzSRzZ57DPVzVyTrlPs53EHGlH+VZhDHLdf3sMCAWz7Sk8mswCys7NV
	Gkb5Htv12baCyAczX0U+gnvyISdP9aewtz3w=
X-Received: by 2002:a05:622a:760d:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c4ffaa09emr73791551cf.6.1783419719731;
        Tue, 07 Jul 2026 03:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:760d:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c4ffaa09emr73791461cf.6.1783419719346;
        Tue, 07 Jul 2026 03:21:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bcd7dsm101151166b.30.2026.07.07.03.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:21:58 -0700 (PDT)
Message-ID: <ebb49042-ecfd-4c76-af5d-c79c1694b401@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:21:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-4-8169953634ad@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-4-8169953634ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -p2oenvozKUpFR2bu6em1KR87Rjtw-48
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cd348 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FWBTG74ICMjwBxTGBBgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -p2oenvozKUpFR2bu6em1KR87Rjtw-48
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXxJJw8nT+uqLd
 i+Q9ksSWuZbDyqEYwcduOfmWSf8uNuZUamHIInUoE+dQuRTe/EDY6ucoXhZvmb6IPV9e1FnFM57
 5LjYL7X2N4MLYPVChRAxeQpW0PNTQt0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX1P41POnL0Jgw
 7Fv0Elu8WzK5wA5FNZeacH12Paq1kV4z85hvy8i600o8waKNaDxipq3qgVfdr5raZxfNkQS58kF
 hFvk3P0VkCOKUtf0mRKLAx+17w9R6z5+ihzmb2VGiS/RqvjOIjd7lwA2u4vT7kc4KkufRRBlbJg
 j6lWq6Eh0yf4XUrzqWBOvVX9joMbQI/YsV6smtW5Z0PFUc3uGeI4zNSMrnzjtsWSWq5dE069bs4
 w043NcevZI4ikqS6mKRyCUJYhJ8+Vicouh6JDrXY0gY8Tuu2tw1+NY3seuCZNeFB+eLnECqWu2S
 9NViJmQhoKKxK8cQH+6UiuwzCkUmw/ZM+434MqvP6xXqbs3EPh9HjPrP1+cJUf2aL2Pd8h10cAC
 OOis7RaujW7oTWbL9cpDAvp8gEMgZ1vzB5goH0R0L4RSfw7oMWeL/Sh1FKiXJaNTHdQ2SA0mBlD
 cOOzVqflLTQmpsXq4sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117268-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9607171A697

On 7/2/26 11:48 AM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

