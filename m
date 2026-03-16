Return-Path: <linux-arm-msm+bounces-97889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBJxMozVt2kwWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:03:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D812979F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9A3830234F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E540F38BF7E;
	Mon, 16 Mar 2026 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ea4yr25c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPuV0oNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1806382362
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654947; cv=none; b=FXYycglHpTJilsHEwEOna+546YjisTzoCuttJp/S5ppcKwP801JaaeNLhwKpCh6AIRziQSwUoOHuGkCTpelv/ONUBe+VTa2Jcgzbx2FfWBbmwIcpdyrOmzqoqnu6JXHfvBbR1205EBIc1ifQkASXpR6mya6JDKZ9mBC6PdCXyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654947; c=relaxed/simple;
	bh=vUeYwy6YYwgKmE98VrQLfg9q79tx4Vu9QgU/DGd18Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsbOKV3oSAQIniZF4ku2JyUKHIQRNmpKtxIYtqYS8+shMixjaxBHNilvVrQz3F9g5x/Ld5ucT/irk9hcaKuibK5I36r1epA3UpUPYVKKhteqB5K9N6r1SMKjaqE7UPtYZu1QfbNwDmLUkhKacjJCAJEGCe/cMvVwYHQCAljpeUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ea4yr25c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPuV0oNT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G651lN1068005
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1kBcTlkaa3mAzZi23GvAfM1tf3/9KWLYcQbFzt+0ow=; b=Ea4yr25cafdK0Mco
	XDPNPYgr8dSq1Blxe2NVxnn2nrsNlXSyGRZ7tjViD5h8aRwPyNbIevZIgdkf6zWK
	0F7JbiHdM2T/R8Jl4o5R+9+egd5Z8t08UGkUnWn7tU9SbjUNxDbIJQbNDF69AHFt
	lGomLagyaO+BsSL711twZvfVeLudLkGpYddo/1JeaNIV7yXWk+9H8lmEVWU/DVue
	qM53RsFx3QAX+mRbHwYSy+cGRO3ol99n9KO2+/Cmug0Lw3Vby0GYRBjiUtvT5aV9
	nM07K/OlkdUHA/6bv35MDQbEaXesyI3Hv2lOZGuVuokqg93jIDXCMmrFqQrlidhN
	R4zuMg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027d5gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:55:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a081737bbso46295816d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654945; x=1774259745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1kBcTlkaa3mAzZi23GvAfM1tf3/9KWLYcQbFzt+0ow=;
        b=OPuV0oNTNO1Lbaqauyg8ZZjTE3JZV5dt+AlemFZHBaLh6UEDqzWKq1U+Sy86QQ68q7
         THDAsPa4CGPKEGn98P6RH3UNxm9auYsZrTwzZ24IIz85Bb1zeGCJX+lJXwTRpvgHHhxs
         XlzE581BdGlyoXmK0Oo5IdhGyHljYM+T4pZbOiCI9l4b2d3EpemnsQdVkWh+t0oiq9v4
         HFWwFZSFPKPKoPMl8XQdHVjGD48Shm0o488sY6QmA1zLHpwJEfTSfqvve2b8eneM8Vlq
         Y0vZt35uuJAXLxJlj2lV2GpxVf3bslDcldxdx2r0Vp7ZNNsW9cULvQ8ppHyGA6d+NZcY
         BkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654945; x=1774259745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1kBcTlkaa3mAzZi23GvAfM1tf3/9KWLYcQbFzt+0ow=;
        b=G6T0r5iKZJWlaMaeGWu5Bb2bCLSuNwD4EhMjXKwyTLQCxRfivwQc3tJUHtYcwsEZea
         tTL3MmD6hJ9Pl/vVhxYLKDa7cwnQ+w4u+XHu64GaxgmvuYBFtucTcqDCsLMa9vnw9sMb
         J+8ec77upPT49xGK7hZ7ppDlIpDZGSpD/4wD72sDtp2+z9Q569yHtXRh1eC8APGGUGh0
         dHUSaNWhggt09x7fWnFItEfxq65n/07Dx+fYSdkl/r2slfV+IhisR7wFMzRhFWZyIIp3
         BaczjHFBC35P1pQznJw83vUEBrQwZw8S2w9IKbqoMdmKDCBhP/EO0Zsc5CEXhG5/PU/5
         Crag==
X-Gm-Message-State: AOJu0YzQ39YpQHq5WJlQwItuwQjcVzBY4tPp/3y1650MYcALnjntZHpm
	uNTjUb4d+rt4+iLbXqi06PWLRqlAjjaOPfFh/MjdMXYiipYc1aFGTW631oEYEl5oVOo0v8HbKM4
	J5aHwwywS9nw1SPhf96U50wq6EFCbNHho8nCq/0+blrQcRgL3FHW/5sLge1+FOzn6hXyx
X-Gm-Gg: ATEYQzyfDprC2tg4AKjgwtzPw3p6bKwUh8myjNDVcyflVdNgFpWbdTXPsMPwZ6/bzF7
	3VI8onuVdgDLEV9aqQcDAYvcBvUyNqMEIDdspsX6TAOaKnlPrnpczbCh0Rq+OFT9s1xo7NbH88M
	0jElN7J5lhovFUkVwyqs3Rpd/hyhuHhcD2lcmix7MntQwl4D4XHjx+unLCa8pNik63OSItigOm2
	KTjNe7RawU5gATL9a/mnXQpWwPgtTLzfbA967zdO0X+5jnPLD+ZcIzeyYJgETOK8k8CdPCAR8aq
	Z26K3RGx0bMIw66gIxaTLxkk46JpAiBnE7Jc+ODLY1PwBonGlDGC/mCpa5KtX1OIaBEFVfvzeSX
	gksiZfilEV5dj34lotBU9e9N2es6kixj1OpYP6k0S67bxrFpUvFdfXkMO0qchzigyfbD/YYCz7h
	Cfr10=
X-Received: by 2002:a05:6214:8101:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c51d024b5mr24192866d6.3.1773654945117;
        Mon, 16 Mar 2026 02:55:45 -0700 (PDT)
X-Received: by 2002:a05:6214:8101:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c51d024b5mr24192676d6.3.1773654944719;
        Mon, 16 Mar 2026 02:55:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97be126d3fsm139622566b.18.2026.03.16.02.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:55:43 -0700 (PDT)
Message-ID: <d2fd7358-fb67-4a0f-8166-2791e5c3490f@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:55:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: Add Redmi 4A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-5-897f130786ed@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260315-riva-common-v3-5-897f130786ed@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2ETmZFBMVYcdA3k94sk2awbnxS3F5VSv
X-Proofpoint-ORIG-GUID: 2ETmZFBMVYcdA3k94sk2awbnxS3F5VSv
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b7d3a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=t37Vj0VEYoQJ3GWKtc0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NiBTYWx0ZWRfXyl3FIkgyxyvS
 dC3jjb9SK8/nduMLxS2B72TN/7qGGov1g2K0MmIxxMVznvcyM9fSuNoau8EAyAWyh4YH4bIL475
 zw1j5JT8b2dgxihcNGiP4gBUFZmN4XcCQftKLfmpePlUywJtktL/ZuXM1Lmg+IcxJZ+LJhmBljL
 r43PvXBjuldm3Iiec35wJxoiWRiHfeP+kVMw6RDFJf6PD6CGUFwL2EINzAWLc9AtX5qTcMvAXHq
 6xjzJThXikiFskZ8u2McgShCSJe4ENr4qI1I4UL4e3wVPXj1cRqozl+zgmKKAHMwkXPJqei7aFG
 k4YCQBHVe3ZwCKbnsIAiSizhw6+oG1IK2miWwRjUv6CCIArObmdbrlETw+bAqBDVSWNtTkb9ELu
 HpuxKZavZr33y2Yqku2pHu6AkEtwqF4ZIU/NxAc8SsNqgdsAdJtzXSYAi6xvxWNvfRYJRGDkj8y
 W1gnneenEkv+4mEsKsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160076
X-Spamd-Result: default: False [0.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.75)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97889-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72D812979F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/15/26 5:26 PM, Barnabás Czémán wrote:
> Redmi 4A (rolex) is like Redmi 5A with small differences like charging,
> fuel gauge, different speaker codec configuration and display.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

