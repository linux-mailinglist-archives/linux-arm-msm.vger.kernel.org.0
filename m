Return-Path: <linux-arm-msm+bounces-113160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 922XK0flL2qzIgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 13:43:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8844685C86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 13:43:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JBluL/h5";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IJTW8ZiZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113160-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113160-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26E34303746A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69843E557F;
	Mon, 15 Jun 2026 11:42:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E93D9674
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:42:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781523770; cv=none; b=lq6I6T1CnLL+SxVpLJmidL8aZWH1isARFKn7lhNtzlmbCv/KPsVa1XRL2+sXcB/oRXiET1limRiVh8Shd5DQKKObh0SFDzsw4HGRskYz67vcf8hIS/uFbyCSvYmuCVMT9ArbLQs34CgtRVz5Ce3ln4pd9JbkCEtMIiys8H5VPMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781523770; c=relaxed/simple;
	bh=d2A3H56c96ogqtKRqXPGR2WiKdZUuGpqLGk0A19DUtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpBkJLKLFiSn59Y5b0gj20cWgzrtdyU7oAcbKDntovkNDLfhPF2ADfkfeA1xCzqoY47YOA7IUeq3L0yCXl9y9J60bf5AmQhOfcfQOSjoLtGF9YrszU/oGWzViFHrvCKVIMLZrB0MZr/RQOGYtTBGEnaMRg7oRAG6jl9Nyww+Ofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBluL/h5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJTW8ZiZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApKjd359283
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hi8mNl/OuPgOWOdFW7792tQtaj6OLx58c3c/es7HvJM=; b=JBluL/h5Dzur9H74
	OAV3nxcc3wgep6MY2a7T4L6amzfzUo53eY727Q4xZWbljJnBnbGtuYgIfA+kfqq6
	z46QrRn3Pi3A5TffwnVXCNrXiHkA/XGjfCrt4+fR/u6QHpXhSas70ebw/SV8nW0S
	SnBIcX0InfPecNTX9Yng9r7EQi/pLMrQ8yaeDayj/OCO187IAGFw+uUXstaemn48
	NJQwIdn+G+NZRPrsYGc9lATBL0Tn1IXs6M/9yjR/cvbKYLGrarQ8Bm06HFjG2Rbn
	iJrkweRIEu4Jw3cAUtTppQ+SjFYDu74OAIMOnEwhLJ2QYvl3kuoeoVDneYG0sT+I
	YWs3bg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c8yes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:42:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd1c3b9caso12739726d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781523767; x=1782128567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hi8mNl/OuPgOWOdFW7792tQtaj6OLx58c3c/es7HvJM=;
        b=IJTW8ZiZ7speyW1R7e2ZReOeZkl4xRbGHat7qGMYTSJtEru0g1Xt2qbqfEu74VoSzY
         3SWyFjeS7iOXQvxGuEEH/L1QoZP0p7yhgBbwFmqtQBSt08HKrh9bUKRucDb5x/ZiUobE
         okE0tTgAOEkk8Xo9jzk3JnBGv1671vDc1fyGsfb+l5z21etPS6fBfd1ICVF7aT5d1JEc
         k67GSuAoafB4a3GAA1vtN19X/5onHxPwt+RVPyTyMfM5WD4ldKhG8O4fM+Lr2YMjCTrC
         19VCo3Q5qZhiECtkTVr6SDWWnMJ4PRLcx7w9zc9yrrNurfK/IlhZ0qJ1/cqxrh1JYXv6
         e0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781523767; x=1782128567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hi8mNl/OuPgOWOdFW7792tQtaj6OLx58c3c/es7HvJM=;
        b=EEB5Pjshub1tj1YUatu6jQ18q9DiF2BF90WMz/p37N0e+BQQgx3XR/NAIPDKfWUwRm
         BWJQQ3ZmcWlHh2zWGUemje3QZl6iiDSjXtN7RRDjwnNOFUU3/7fIbMDkTbArcIszpuSt
         D5rI8FnXQGKhdnwk9N4MUEwkepSbvaVqzPCyGEEUHuqfVFETOVeNWfh1io5jp7AS+Uzx
         fHHRzzpYjQxiJS17woBZIK0Idw9i1Ext69QHBWwWFSpm202mprg3aOayA0DNUXoLxczP
         5cubRm74LFVtOxd/QdkuSXsAcRhzLmcecWcFRxn7abmZ5W5QdZKvDgRxLtmHo2VuAvwM
         jEJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jJiMIoPV4JAHELtYVOTG09e3gaSmN/LFjJimDeZ1LpzK24sgjWrsDPxcCjmFxGQPEpwi/cCi80j7AU0We@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhw9uEoy6T1Y5iZ8fmbPbpqTCOYMzELRPnLc0T3oc1o8GJ/20H
	ncEvcUB+m/LQXu490e9AmIv7wmlVwLEHzSFlVAAJbvJaLNkkV762NdVaGpTSG/ihcKcbajb1cgC
	tna5IQsaGEGsnIfLexq8trxjcFMHDJmZ8Zr+9fkujNO3VdzRHgxNcZIsU+Feuib2KAV32
X-Gm-Gg: Acq92OEUI+di+9qjHa4Gdjg8GiHr6DB2us8C6mfUU5QCytjG9yFJwQ1V/RLh1QaiJD5
	bWWTc1xYgnpB3n1I3NTcgD9AjldXf0ixwBHb/h8zKnwOsZMfTIVWBtJLnt8gZSVX1u/Yc/22r+r
	nJfqNwLIaholsTlcu8RugI7yjVkIz9dgpGYqXeUyM5PcUFfaGx9okSMrmBHPDkPoeivgfE5RvI/
	ZozxprSza64IAXvSJ/+M8XVdtulX3i0R8wCzjcojCM87BsMjhiZ6KzPzl0jQqxJfdIsQNtvF3aR
	LnozzI+zOztF5YkG3E2qHo4fkl7A+n3cZnCuRx/R8Y7yXHBeoxD0JpmVJz67HNQeWySKYOXHHPS
	41w2u388WFIbs+z/k1MEWOMQuIlgXUciQ4vI59Ip5yOlVeg==
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1230198385a.7.1781523766798;
        Mon, 15 Jun 2026 04:42:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1230195585a.7.1781523766398;
        Mon, 15 Jun 2026 04:42:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb9013575sm459444566b.59.2026.06.15.04.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:42:45 -0700 (PDT)
Message-ID: <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 13:42:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyMyBTYWx0ZWRfX230ryqcolBDR
 P5FMAs/HcDVMlO9Wud2vpYhIaFlAvMqfXiS2k6DmBrqewSgRD4cevVXYZvd9PrL7HPxcbSR5k62
 kkidZl51bxyqXqQ8ZuXxgc2GHEn+r79C4B9hdwPykW7QKSXRYR/Fi+ViyI95ZpzEVO5tKS9f2bF
 8sls92JJjBIGAwlWa065bPn1Yehn9sAYiBoPssIMIEFexunJZBs1Y/U+u6dIBeduLnwzwnxPj2C
 wx8AoGUiiWrDXzkZABplGbyoUe/PZtstXxCBxCRiRkuBTMmcIVLQ9obAyB0UuBxlRLaIcsrUgZM
 NIDdLsLzl998C92+cuV29BbQi2K8oXHG5mTNAfM7m3bUoRcHkF33AfgeUSQTPK/alrQxoilv8Nz
 OV/UJBwHE07hhmpNvwfhaFOUdrwXaY0hK1QtA67BBYPqnTQYImk3rDZ0Eiu1a99whuVC2KK0dDc
 0RTGvECRPFHjVzvpDSw==
X-Proofpoint-ORIG-GUID: d3ZSpipwxr2OfkhgtrrZQUotBZS34aco
X-Proofpoint-GUID: d3ZSpipwxr2OfkhgtrrZQUotBZS34aco
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyMyBTYWx0ZWRfXzb0XdeshINZS
 HHDZ9gN36jVDCFMDOr/BN50fmNduUe6YfRQF/76DtBHJ8+sxKiXnvnI5uqWFnZFJJNS8sP8NZsG
 a9cqxoOzVDWaD92pVu0SgQ+3PzsxbHc=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2fe537 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yIUj8aQuGlWjW2UBUNMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113160-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: E8844685C86

On 6/15/26 6:25 AM, Pengyu Luo wrote:
> On Mon, Jun 15, 2026 at 5:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>> driver to fallback to FIFO mode by default. However, these platforms
>>> also support GSI mode, which is highly preferred for certain
>>> peripherals like SPI touchscreens to improve performance.
>>>
>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>> the controller into GSI mode during initialization.
>>
>> Ideally, this should be decided by the SPI controller based on the
>> requirements. Another option would be to prefer GSI for all transfers if
>> it is available, ignoring the FIFO even if it is not disabled.
>>
> 
> I have read reviews. Can we check if the compatible
> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
> presented, then we enable GSI mode.


This hunk is very odd:

/*
 * in case of failure to get gpi dma channel, we can still do the
 * FIFO mode, so fallthrough
 */
dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");

In my understanding, GSI DMA mode is always preferable. +Mukesh, do
you have any insights?

Konrad

