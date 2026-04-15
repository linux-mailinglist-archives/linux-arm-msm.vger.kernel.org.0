Return-Path: <linux-arm-msm+bounces-103278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG9pASZw32lWTAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:01:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A03E04038B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D661F3031327
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3484A2EA47C;
	Wed, 15 Apr 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzuMpIng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0P9CzPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F822DA756
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250912; cv=none; b=Q2YUqo8GBacyqBfxEEUdxxmzS28yx7pZv760jHPiMGcFLNLpVH96lSUAWKWgVtsaB3yW4S73GQsd4lgtUrWEV9BC7q4PaRhE02NMcgbA1BaoWBmzI9Xj5aj2fyDGgLjpwQgq6z/wDvN+4iFrWdDc1kfnxuf+4EZNj3mmTZLhVf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250912; c=relaxed/simple;
	bh=POeJGXRJCe7mVrdtZsiPcOC5Xeqkta8xdyDSn2KlaXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9LnKlPgxdhF04/CBK/m49N4sHfuxp+7E4Vl5m51QJ8y3daFPVVD+Q8Rb6HAKLsHKKhJ1gI1TbKI8/erOrBEGrxZlQ7gbXP3uGvZ4es+zLDgOiQkRAENF7cVECk8h+buveM58dmi09sPXGB7JwqcEVHN6VbxOTARshPTAZZOXPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzuMpIng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0P9CzPG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F5xTLF2773230
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	biDz4g6DTWtoGGWbNnsBijCTxZYo/Nv3TB29e5VcHFc=; b=XzuMpIngN52wTkWU
	Pn+YStViJcACvJinL6J+lHj0LLe036DZJuPlBe41S13uUzxrOlBn5yjf+35nuxlq
	w/MESiNqTbXWaT4yPdyWr05R3MdvF0/CasdMcTIoAT+nLXiGr2NXHIS9m9zkrHkr
	m7B38ozWUwrh2QIEpL3Eh+Bo6AKpee+506EuLvhNmCpUYiSursDX9ih6VfDyE+Be
	i6SDU4Obccc1npceum84L5oShB6L3/zSlszmwtoVUNSOG0MgdoMO2wyOjaoNcdkG
	p/9SkVyFE/lTRNqXaR3mMckq8TWhTdeXmWCI9OIN6ieR2csyT48A6rbdFDZIwxX6
	dFVHtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj50v12ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:01:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cff2297253so182561985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776250909; x=1776855709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=biDz4g6DTWtoGGWbNnsBijCTxZYo/Nv3TB29e5VcHFc=;
        b=j0P9CzPGY64lldW5CZjWTWb4JX6wD5w6ytR+PMyNmLQZHRiNp9k59Zo3luDjqWFII3
         WermY5dfnvvYbbpyvbOayhyCpIGNtkVDCqv49Pt0JOqDzVSMcVc9S76YUYdKypuRrGcA
         tIQ/fAuAd+YI+yZHUVaZLgov8s18s82abXdQ5evdU3ZNhMagnLC+buOIQhcq6pj7mYyQ
         si0GcfXh9NjF1lRCZBRbKtfB3Yoy5VKYk8HuNAdDjhTJdsyi0tuL00TrWazrpCHqezh4
         siqIIdCzh57Hb4QR2BzvNKewjSNpSRQbYutliZnh6ihoNChhF85aOG2CQhX4uqGrxTff
         ig6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776250909; x=1776855709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biDz4g6DTWtoGGWbNnsBijCTxZYo/Nv3TB29e5VcHFc=;
        b=k/HG7/rAh7tvqahvhvdJLad/8VXW7/Q8tGOQV8pC6TT3WrYLKXVRMJw4d90COglLFH
         UznO6TQEV6WLQwpW3kRO7LibjZG2Wnpt6DkPF1Nduiku0gZF7cmSWuCRTjWuo4XNLRzz
         bZFwE5sZG6wv+b/jlC/uayPA0NZXbiwj32f5jL3Da8PSOuKZFVmp5G8fFwgeqETuGelb
         sPQbG6UX9tzmDC/24sV1M08EjnRPdqwUSjGkl19bZASz8JrqK1isXfy74i1nWCAvEYoQ
         /QLygu602RyBTDSPn51zDP2xBZBTgnt0GXv/mkQPvDK2scCh4LKKHF47ABbS70uwxlIn
         i69w==
X-Gm-Message-State: AOJu0Ywhi4yX3zN68rjruQYZkNhkZEpq8yu7AIxRuef2zWrxzh71MZCf
	iV+4fyvXGw9D1JkbkysPfDLSameV0uZECnxrZTYSpTgR+quxu5hLcQWH/t7RLR/ajI3/IoeX9ZR
	FRPkVcYq9cMU6cSTEaacQsI0pxlzbebJcFcrsDCQPoMajKUC4xWTGq891Vj5bV5RtjZ6U
X-Gm-Gg: AeBDiesznp17fYJX9DzL+XP7ie5Kodov4PF1ql78eaCt1cXeQ88mFAbfhcyazzpJAB3
	3uBPE0RIZ/48XE8i9+oVjL99VedfYw1ttZ8bwHCbGkBP3NesWxl9u4S7ds7m2HGFVYQcumC3mL2
	ZjHIqDbW7ub75WId9N65dNct0BzJ8ZmB0AmTvxT0f4t/O7QYeGr9Hpzes5Hx4t22aHmdV0jMIgk
	JAx+UxzZcIQYjTaXktI69gWBQ/mAqbMPqOHiSKB7TLDLIxI0gw6iLr9hngDHGuik927JrGrSinZ
	lPkSVqczjPdEoOfzCresdbV7Ppb6hVnJCORDzu1Cfl1gSOq9bBmAVv2V7RIna1IiGjqLmSvvsky
	xP62z201LXR5rTwiLP2b7Ec28uz8HYTf2XQzNkAnJcYb6qOMztkFkqLzCywyjO0RAJLqdlNBZ04
	xeNtqhEFqJ0zQs6w==
X-Received: by 2002:a05:620a:17a6:b0:8cf:c856:8ff1 with SMTP id af79cd13be357-8e4cc8a280amr189901785a.8.1776250908744;
        Wed, 15 Apr 2026 04:01:48 -0700 (PDT)
X-Received: by 2002:a05:620a:17a6:b0:8cf:c856:8ff1 with SMTP id af79cd13be357-8e4cc8a280amr189897485a.8.1776250908151;
        Wed, 15 Apr 2026 04:01:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d8dceasm321621a12.13.2026.04.15.04.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 04:01:46 -0700 (PDT)
Message-ID: <020442d5-5697-476b-a96a-6e96ce054363@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 13:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Enable cpufreq cooling
 devices
To: dipa.mantre@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oIxDJaGmahEzRYObZj8dRL_ud4FXLdPp
X-Authority-Analysis: v=2.4 cv=eLMjSnp1 c=1 sm=1 tr=0 ts=69df701d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1oU39qR64IH6zgjZjOcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwMSBTYWx0ZWRfX25MuYa6uQ8t4
 VmoVPTXKuhOif6BzcqsMv89CO2yDf0hpRd/hRLwzIHcbmgcBzVxZc95K7ezinr/svrOKRNtB5ni
 W1Xf3+CCWq/cWwO4Ft2557a8qDBqJzNgZHAt/4Em/9qoW/m28ev9VP0aRXW/2KNZsnvgdUhYuoQ
 Q16ex9hPWw4n2TBIZliQLEk6mKSoOxB4JaS0mrajJvXrRl7SOrmEwmXk2N6+pn5WDBJail4yqmM
 AwcTNXTkZPMnRgFslq43vD47f01DF6c3cggun6PqZggWSd//r4tfz2RRQPJduFxzHxqmgpejmOP
 AQMEtyWW0KC3iLHyMvBnNkDtYDDdvreWE8H+x90F81ENOqZrM+mfgzRiM1YHePBlxSoWH0OhcW8
 iP6J+Hc7snp+HhcKm7X4fy4yURuO3ucX6dx8rntq8SPSZvt6iYSLvpVZZVBIxrg2QoXCoTNUmud
 oE5AqGcXdvppONVxErQ==
X-Proofpoint-ORIG-GUID: oIxDJaGmahEzRYObZj8dRL_ud4FXLdPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150101
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103278-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A03E04038B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 12:57 PM, Dipa Mantre via B4 Relay wrote:
> From: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

