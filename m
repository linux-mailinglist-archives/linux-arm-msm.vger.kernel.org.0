Return-Path: <linux-arm-msm+bounces-117266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mfIHK3zVTGo4qgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:31:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C7271A677
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:31:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FpCUP8Nz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="i40LxH/c";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117266-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117266-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCED630DB408
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619ED3E0724;
	Tue,  7 Jul 2026 10:21:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F623E0C5C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:21:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419689; cv=none; b=exj8kp/Z2nsD/TQJ7HcTCNtWW0oU9smRC0EVMEaIGaHhEHri9Y0r1jDppsPsi16WRMa593ptzm7vwm2QFvBa7ebpv15fxggN5WkEibx0mXO2rWkyz1zsEbQWEcW5MYDJWXHZsPCGRKb2GmN2jmk4tLHlAoXXOun2vrsCTzeDf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419689; c=relaxed/simple;
	bh=CFfKr9xzGI6ffVx4M6XwqWLSXJfpoH3uznILsiTSwXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GBv+tTaOA+14LD3HiupXpb7kRkrXVbxAUAw110QCNWI1PHSOv3gu1ig0S8tIlHRZii3UA6OVVr97W+hUl/B3wWGDn+T0uyAfcYh8L0tMrGYxSENKFmnX1GdSE/gfcNdKD+8VFinwOKR8VG6ScwuwPt4eFu+02JTzwXgyAl0fLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpCUP8Nz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i40LxH/c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DwTj3070370
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QIPfSb0Mp9W7dJ34tbyFQDiEfE1kcRzhee5SFAsdYc=; b=FpCUP8NzwnZn+fZy
	EbqZV/VdlWANAjyPljjZ+mbdPeSkiKxmUjqejU4eaVfhCGTbxdxDMJEkwRfT49Mu
	NNH4FKt+YDGAxVGj2NR919Y2ieYU8Bv+nfZV9qogOCbEv5SO6DYTyHSa6GvFffI+
	3C4xyshcRSY8Tb2cgg/7OKGV5WEdeOvhGMsl2UQChqv71mMqs+77Y4zaK0vVvQIo
	g6HjRTGq6OCQfeqoZEFtbqBVhgsGGlbihzPh5dxzb9DjE+/jbg/QYueVxNGjfWLA
	6KhQlul0mJ9CR6QHUgWqZnXpUSbELgE/N1mlO2WT2hBBGAJKJU+iAtzWeSWMxbdW
	/tW20w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8hg4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:21:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c267931ebso24302191cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419685; x=1784024485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QIPfSb0Mp9W7dJ34tbyFQDiEfE1kcRzhee5SFAsdYc=;
        b=i40LxH/cxd91UCOFncqoEoSOF0A8PmuKDz7MiW65fvRTNPZOWeoMR5XRjUmyUNtXGs
         j0bsWBxTwAUsx+M1pAH3c+iC1pxFUJpPqM6bhDRFHVy6X2DyiCO9qez1791OscgSpZHP
         mm5ToLt70gEMPcE1UrkSbanpMm/IuBRI7FvCHQNynzDVbBYOZGKdB6aT4aWKia97sew+
         XwLyn+ixRzg5Xg08S4aKbcaHFjANrgfxNO0k/PrL2BGjIp0Pwd8swBJqwXdkzQMZjzRw
         zdct6s9o4a5fyEnMO2nOcX+P/gTFRgp+hlmbwerpZe5llKY4PIozy2zj8ULePfM9G3+H
         5S/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419685; x=1784024485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0QIPfSb0Mp9W7dJ34tbyFQDiEfE1kcRzhee5SFAsdYc=;
        b=QppZgIZy1wtrCnC+bF8q38SzrZevEeHoGy17/K2Te/xrs1LMVyRLn17i7hTwYsEpsv
         3K2RJey1SvMMd3etj8EJl6x9cYoS5Wu/9fvhdH0NeQtgSInVu/U4k7xjJR1lJmc+VCOc
         qUkhZe5anxVRnTOzeaa87Sd4o8wn80Aam7KKwDDSZ75Z0FOvIOfzsHxdPiY5qPxbm9um
         x7ACrhz4WbI+v6oi0qvGzX/gr2a4MgwzdlRMDd/f50BUm3Hs8X8dGjATpe7oAEgjpwCe
         8lGDEvXWFMrc5zAf1trcX/KG9B7FK2FjIwTw1/MKwBPFMBWWHQPZPA7wHdl9XxlYiQeb
         vXoQ==
X-Gm-Message-State: AOJu0YzB+6Bv6zNZ4XFnmdLZsrcKQbSKt8PB+i/qdE8eAntqgDM0Xu5b
	We/YqO4i0LzvNdTaz3eOhafuZy1DvRxTOjdFe5zmkDoeoBFsKtih38Q+qeTVNd4sIMf6V/Ul2bB
	nFJUKMmN4vrxIiVDOMbbvxG6K2j6SBqlVARbl4uQs1IF/ac5fj0HH6h5jhRF4a+GSpEDo
X-Gm-Gg: AfdE7cl6XDsXs99xd4VKtsU2YAr1iM1uTRCKi/rcn9OF4DnENEvvYXADOfwz7sthBYf
	fK2GNZSZvqfbJuLSV7TvIuyBxEHx/ub8qAz4x0QAkL/kMz0vcxiDMT1lxFhWeUVYSxZ/2Edadpl
	5AdBmt7Gs1r6XOUsYVwqTZs2KO/riNFboExjrd1j33Y59eh06u8Gu9meSp6pu+wob2jSOdBvjYF
	Rctsk/GxHNOCsWvUdijIhINkAe5J9mJKGAhUTN3PuN9zYl5H+oAsRyMx+iYLdGFzlxNVGisnlrQ
	j8jAattle8Q8F8etU3mDH3cn+ljlRpO15MGugSiMibQyzPGWD6MiBNQmbH+7xsXp7Eujd86vGyf
	A9PaHgNYkGaj55N/gG0sCvFT6aHtxXKeWtys=
X-Received: by 2002:a05:622a:1b9e:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-51c4bdba5a2mr121591521cf.5.1783419685489;
        Tue, 07 Jul 2026 03:21:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1b9e:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-51c4bdba5a2mr121591341cf.5.1783419684925;
        Tue, 07 Jul 2026 03:21:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada036efsm100233666b.45.2026.07.07.03.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:21:24 -0700 (PDT)
Message-ID: <04dfd2a8-a6b2-48d0-bd51-6cdca6250d38@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:21:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-2-8169953634ad@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-2-8169953634ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX/M4CadcL7GK6
 lZCtYxduSK/ZaxW8zHQ2jRRSjcFdBXKzhtI/VRIOBKTAY4ng8o7XhoJ+g3JTI5/r8nDnS+i7MHF
 MQjXWocALLCGahM3+lmpx434ZLM6i44wSaJcfvk4ttD+05TZsFqv2Rnh3eueu4TWrM+wZt1fFf3
 riU/7jKuC70Fb6rmWuirI2dJ7Uc1SBa2Qfm1iLP5pZkmyXeFjWC9GPN0gCb6S7Y4jskpeYjAcbL
 lBZ6oYZkx/TTtPMZqKgtw6JerEs1yATjBo8YRjtTwve0jGVcxrTh16a63/+sVE1Tz2Pwgi9WXLV
 S0JHJCR8VMuc0J/2yFXTXE6U5cqJXrzs3RPWWf/BfNT5t5MN/sq5RNoKTKksSDhr6ykUyY8ysoo
 g/X3hdk3mxXL4G+7e+kqm93Y0QXOFBrYgvd+7bJnDvAzwG/fV8DY0Zblpg4m0t2AWnN/d2bjBYU
 3GN45Ms/wEPPsLWNtIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX2CWrRm8qv+Ws
 w8e3gyHhMF7kiqiZee477BMbO5vCHcG5FHE4d9pMR1blTdPC60VrF/cc8pZt+8ZMwQE3T234zHJ
 u4SIdDoYbPLQlS9fjozTYtSgtFRF5eA=
X-Proofpoint-GUID: bO4fJyYCfWK6vk2_yNdDqt_L4VU5VpnU
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cd326 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FWBTG74ICMjwBxTGBBgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bO4fJyYCfWK6vk2_yNdDqt_L4VU5VpnU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070099
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
	TAGGED_FROM(0.00)[bounces-117266-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
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
X-Rspamd-Queue-Id: 50C7271A677

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


> +	channel@749 {
> +		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(7)>;
> +		label = "pm8550b_wls_therm";
> +		qcom,ratiometric;
> +		/* use the default settle time */

P.S. grumpy nit - I'd prefer if default was captured explicitly
anyway

Konrad

